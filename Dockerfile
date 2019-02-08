FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /app

COPY . .

RUN dotnet publish -c Release -o out

FROM microsoft/dotnet:2.2-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/out ./

EXPOSE 80 443
	
ENTRYPOINT ["dotnet", "HelloWorld.dll"]
