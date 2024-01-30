Return-Path: <linux-media+bounces-4426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD7B8426B7
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 15:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D07F328EB09
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 14:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04F26DCFF;
	Tue, 30 Jan 2024 14:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UE3gvA8a"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9596D1DB;
	Tue, 30 Jan 2024 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706624108; cv=fail; b=jc+EQ54yRwXGDZbSFiq1YPC+wDlWzUShCgOIX3SBRowOfDIsnh5YfyHiwfKKvHzGvMNoug6IFWjiL+aV1pncoF3rSdNmrEZZvUizvcBTSPzkUe4zB2QVgjk35aIQ6zJIo2xX5JnPuK0n6jJKwLglarcw9E3G0Hbn3eQPhmTSd84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706624108; c=relaxed/simple;
	bh=yMQFcFIqdjQiC8UJegUXHPzvK4pJAEsBGTVu6u2rQ6E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NnbXCNGDK/Qi29TnuE+h3qQotHz+nE/plR/6byzU1MIuWCXsT5KvrOVCGjf+sRh5x0b6qto453GEJ56SkHEyj6rqNAhpClkASKxKj/cLTVnLNk38//BYuwytDlWBXsvfT4npgPyNJof5bniqoPYoTBp/EV/GELD8UwOk8PDmNWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UE3gvA8a; arc=fail smtp.client-ip=40.107.114.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmTm+HGdmfc348upxOiGBGi0d1y9uHBVzBgwCyY7G5VkbJNp47J1IEf37lRURH7hLRUm4R0eEp0idN1v1G9KJXYQqzBT0QkKgfPl7HegOdfnO2mldwoQbNEkwCuP3dQ6m0ypydRXS52T98XZjTMcWD5XOOjOu1fUcaVLUxE4lOZmsLIiBqj21haDLyzwBavYy3TMT8vgoXFAwj531QivZtekDNhbEOjpI/P8U57zvNTrMO+KKEwBj+KQHHp/P9RfOl7ZJUNZJMyX9SzGhq/l4b+NYWvLpR2WZKFkNRovNP5+Vftk3hO6hM2KpiEuRWDxvwyTnZDmnbYmjD8gLtcKYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMQFcFIqdjQiC8UJegUXHPzvK4pJAEsBGTVu6u2rQ6E=;
 b=OJGtuBQlbJuDx09NygTjYeSLCvSE29aE/jZ9zBvOkCyP6/+29S6SWwvV5vqO/2eCQTg9AjHmXcNUAqryi8PuKFGrkN1PINJv4mI76ATWDbdgLMz8QulkVsHvz+IOOr6KZBFDE2AG4oitdOv+Ou5QSQ3svNBRILw+pwBg9MegH1IUkArJ0COkXxQTPQseOgllwJ8h3nOc/z/8fjkuoN9DXfnIeQf/cigOEYfOEttdnQK6R9C3fktufqeKoL2Gj1OILD9j//5SMijiQYvvW63j//V1T8rLsXmlSRn608RbOeTFSalyrxMZTRzZXpCFnmIZ622JgrMBAGiDes635LDY3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMQFcFIqdjQiC8UJegUXHPzvK4pJAEsBGTVu6u2rQ6E=;
 b=UE3gvA8a4JWKpYXb03Zu8cnBWSh9EOB8+51SujLCJWLvQJfQ4mg1iBMSfn1OJu5BTksIbu+3IbwzuOeZQTJCjft/Lb8RrtPdO0sKDxSYER1qDSzgYcJYEB/wwZJvs1wdDB0OzBq/L+SFAWS4ZWmwiHBcEoexeiF5A03uJ2SJtTg=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB8145.jpnprd01.prod.outlook.com
 (2603:1096:604:173::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Tue, 30 Jan
 2024 14:15:01 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7249.023; Tue, 30 Jan 2024
 14:15:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
Subject: RE: [PATCH v2 5/5] arm64: dts: renesas:
 r9a07g043u11-smarc-cru-csi-ov5645: Reduce I2C frequency
Thread-Topic: [PATCH v2 5/5] arm64: dts: renesas:
 r9a07g043u11-smarc-cru-csi-ov5645: Reduce I2C frequency
Thread-Index: AQHaUFwCasVyX+Z+l0SMEVmNhiL9xrDsHTmAgAAe0VCABi7lcA==
Date: Tue, 30 Jan 2024 14:15:01 +0000
Message-ID:
 <TYCPR01MB11269379C39A0242C9F87A40E867D2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
 <20240126133116.121981-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdUa+wd36-ErDRgb91KpRbryNYzA2Mmhvzjx0-_47=zfdg@mail.gmail.com>
 <TYCPR01MB11269FEE3A8C6D695CBBACEE086792@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11269FEE3A8C6D695CBBACEE086792@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB8145:EE_
x-ms-office365-filtering-correlation-id: fa6eb1ce-e855-4a08-5e98-08dc219dd8ff
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SoxaQzdzSnukDz2e5WlovNV1O6YaKZhj6zz6apVJ8r9TeEC1x/RlwIq2XXOQK9GLNb58eWRBjLdVA/9v2Mxa2f9F6FgU/Sg2Afn1CIKbfZmeKVnvGZKgpdF6Nuko4VphsJNs0B79NbR2h60Q4KTfLuhX9gUN8jjsbgqbHiey9kSg3P2g1c37YYJAckPQvATCFxl+pMGpvQ3IxZJ2EXsxeG55W18LBARAFZa9A08+0ZY5gAdcjLCJELlMJZcl/XWxAd6Hw06fjaZhjyAAcp4Tfh+ucsA3p82GEN5Ka4WdrYcuIyOQPhdU4NQCze611pNRRE3kvhYSJcEO1N01MPalAmSjK4JKtMDurK8VdUgqDCv8DGgR2Ri0UZkH4iphbPyhhBc2oexdB5lMuh5B/gtv2Ct1h/3BB3Z4/RN2xk28IHk9k8G+8EgHVAS56fyRJgh9178mc3PS2NcW3SLO3HdXre7MvktZ0S/eXxDfa6Cv6oUHrBebdhp/WynEr1GM5fn20q/NyQo1NQVI3eSH/b/V6VS+sqGe4T7JINTas2itRgkqFLdC5zp/ImR1kni1N+VzAQGmdAJ+4rKHKl40vvGPPY+mTnd7ZYqVcKtTJR9F4YL4htW5+Qj5bAj7RD/gge9i
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(26005)(7696005)(6506007)(41300700001)(83380400001)(53546011)(9686003)(71200400001)(316002)(66556008)(66476007)(66446008)(64756008)(6916009)(54906003)(76116006)(55016003)(66946007)(8936002)(38100700002)(8676002)(4326008)(5660300002)(2906002)(122000001)(33656002)(52536014)(86362001)(478600001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ukw1bllWblBHL2ttdTA5VnA3MjZITjlPbTA2WEpkZjJTb0lpUGVQTzNHMzhF?=
 =?utf-8?B?QjNsbmVLQnFmTS92aTV4bFI4cllITEVaNXVJRTYwVkk0SmhrZTg2SVJhcDJh?=
 =?utf-8?B?UGR4VXVKRTgxWHNhdkFDS2VzQnFEWlB0TUtDMXRtVC81Q0RJYVA1YnVpK3Rp?=
 =?utf-8?B?Z0Y5OGtCRUNHSWNRM3RLK283enhFb1g2a1pQTlZYSXREZjNtTkxzbWl1Yklh?=
 =?utf-8?B?ZE9UTUkxT0tjZVZUVTE5Z0hiblgrdVNGN1pUM3B3cUpHZmdueTE1MEhiUG5P?=
 =?utf-8?B?Sm5ucEMvZE1VTloyd2dJRWgySHI4WGF5YjhVQyttSUxGSVR0bmpXQ0Z1cWZn?=
 =?utf-8?B?OEJLTWdZMGdpcGVZUGo3bGVuT1VpeG5VRy9hY00yME5IS0psdndrclcyU2JN?=
 =?utf-8?B?WklqVXdlNmFwem5xSjBGY3UvN3JleThOTVVqVGF4RDhqSy9JNWczRTlpMDNE?=
 =?utf-8?B?SVlBTkVBL2kwS0YrcTlWRHQ2czAvdUlXZzQxVXEzbklKaysveW1RQnB3bzdB?=
 =?utf-8?B?QmUxQ29xdndCcGZsVXZ0M29LR05MdFRzK29RUEh2eEQ2RFFzMEo0TXFlT2da?=
 =?utf-8?B?UHhFaCtwbUoyVzlPdVo2emg2Vjh1cmVWa2liVDdRaTljNDhuUmFnR0FaYW9o?=
 =?utf-8?B?Ny9kcUFYUC9rT3R0cENVMFd6ekFHQ0M4UVhIWkFXTWFOL0E3clFnMFBFdDlH?=
 =?utf-8?B?Z2FXcExIVERsUWRJT01xbzhNeEJlMjNhZUMyRVhiSS8xS1VFVldUVG9uSzd0?=
 =?utf-8?B?YVMwVUE3M3pKZTM1Z0U0L092bGhJaGtnQkxXaHMyWmVNNlVHYlEwM1V5S3Fz?=
 =?utf-8?B?dlU2NjdTbmYzUnZuYlVtQVl5aG5BeVZsVG1EbHhVRk90L2Y2RXVrYUlseXR4?=
 =?utf-8?B?dEpscVZpZlR5emQyRlcxd2tiTFk3T3N6QkdHSmRpSDZITjBLcjhTSDAxTkIv?=
 =?utf-8?B?MWN5L1hIckJBTFVHQzVyejNSK2RXZ2Z2Z09GU3ZGN2h6aXd0Q21PekJVdG5w?=
 =?utf-8?B?cStvVG5Lc2dscE0zTmhJeGY4YlBlTVBvOTRTQXdmcGZoQlpDM0ZBNkdYdG1Q?=
 =?utf-8?B?N0ZlMVY2eHJUdzhOYkI5Ti9CVVkxNnJpbFdiTmlnNVJPVE03NmVHVEEwZlZW?=
 =?utf-8?B?QXZuUEtGUlFRZ1ZJQy9TblBZdHJHb3dkNnFOWkhSK2srNDBoamVWOEZ3cjc0?=
 =?utf-8?B?YVhreG5XbnJBbXJZYUwzem1RbHpHMjhKTitiTUgvbUlkNk1QcnFpbDRYVkxt?=
 =?utf-8?B?ajl6NElvUDAxNUZsMExDWmlTcnJySnk1ZHVYd3krdTZ0TnFzNEhvU2ZCRGsy?=
 =?utf-8?B?RFIvYnhNbjRQMDc0V2RwU1B0TXNnK3pEQXhGNFN2RlBzOGpkWDE4TkNrK0po?=
 =?utf-8?B?NFVEcGNpcTd3V1ZhTDFCRUNXc0djeTJxVlNUNlVMdmpVZmJNSkt6OGM2azFB?=
 =?utf-8?B?aUdzRWRLVm5kS09va2tPQ3NvNXprL3QzRTBQK0J1VjBGeEtJWjV3RXY3dWho?=
 =?utf-8?B?cUUxRzRHUmE3WVdEN2x0WWQ1citTenFOYlFTTzBqaEVNbFRialU5SnVkalVv?=
 =?utf-8?B?Qy9SbmZjWXgxR0VpQVRqdWNVcjd6dllDY0c0SGpxLysrak1paUpaTlVKcWx5?=
 =?utf-8?B?RzRKT2hUS2R2ZTJvdG5XQmdPK29oelljdFd4MEFNVEVIQ1NaaWZZSXF5OTN5?=
 =?utf-8?B?NExqRGlkODZNVVgxNEhNc1JoYVdlT3N4N00yWEdHOU5acDlSQ29wWmEvYnVK?=
 =?utf-8?B?Ti84V0N0eGd0enNrTkhQYmtQWFJ5by8vYVUrSEx1UGNBdVBRSjZUNFJSbDZT?=
 =?utf-8?B?K01talI5WTRHOXdaUlZzL0loZzhwTHZLSUhMbSswN21Fa0U5WmxTK3dDZUlW?=
 =?utf-8?B?S3lqWXJGTVRrMHc5bnlDU0Exczc1a1FWa0t0OG11N0oxZkJKeXBORlB2djBX?=
 =?utf-8?B?TkJUc0dFQW5qajhNREFSQTZhZlhLREJJcFNkNklRZVkxT0RqNDU1KzV0Yldv?=
 =?utf-8?B?eFc0cUhveFdkeEFoUUhwQVRVUmF6SE1hUkZ6MHdVSjcvajV2VWZoaU81ZmFN?=
 =?utf-8?B?Z2ZlL1ZaR0g5ekIrSUlYSm1uNmtyc0F3YVBFekJDYloyVm1SM1JJdC93TjNw?=
 =?utf-8?B?NjRUWWJQUCtuQzRkTDZJRE9uejY1OTVsVmt3a0xHWTVsYjZtOG9jRXNNc3I2?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6eb1ce-e855-4a08-5e98-08dc219dd8ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 14:15:01.3651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wO16cuE57Y/qqDM2+6hvzvy5ABjsw4lGIUiaOmV3FVWR5s/ajjXx1B/7oaVPW31py6jTBsH+dzfphWbwfBU7py2O5DmQF+WG25As0X9SeZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8145

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBE
YXMNCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDI2LCAyMDI0IDM6NTcgUE0NCj4gU3ViamVjdDog
UkU6IFtQQVRDSCB2MiA1LzVdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0M3UxMS1zbWFy
Yy1jcnUtDQo+IGNzaS1vdjU2NDU6IFJlZHVjZSBJMkMgZnJlcXVlbmN5DQo+IA0KPiBIaSBHZWVy
dCwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiANCj4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgt
bTY4ay5vcmc+DQo+ID4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDI2LCAyMDI0IDE6NTMgUE0NCj4g
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDUvNV0gYXJtNjQ6IGR0czogcmVuZXNhczoNCj4gPiBy
OWEwN2cwNDN1MTEtc21hcmMtY3J1LQ0KPiA+IGNzaS1vdjU2NDU6IFJlZHVjZSBJMkMgZnJlcXVl
bmN5DQo+ID4NCj4gPiBIaSBCaWp1LA0KPiA+DQo+ID4gT24gRnJpLCBKYW4gMjYsIDIwMjQgYXQg
MjozMeKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiB3cm90
ZToNCj4gPiA+IFJlZHVjZSBpMmMgZnJlcSBmcm9tIDQwMC0+MTAwIGtIeiBvbiBSWi9HMlVMIFNN
QVJDIEVWSyBhcyB0aGUNCj4gPiA+IGNhcHR1cmVkIGltYWdlIGlzIG5vdCBwcm9wZXIgd2l0aCB0
aGUgc2Vuc29yIGNvbmZpZ3VyYXRpb24gb3ZlciBJMkMuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gVGhh
bmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+DQo+ID4gPiAtLS0NCj4gPiA+IGEvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M3UxMS1zbWFyYy1jcnUtY3NpLW92NTY0NS5kdHNvDQo+
ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzdTExLXNtYXJj
LWNydS1jc2ktb3Y1NjQ1Lg0KPiA+ID4gKysrIGR0DQo+ID4gPiArKysgc28NCj4gPiA+IEBAIC0x
OSwzICsxOSw3IEBAICZvdjU2NDUgew0KPiA+ID4gICAgICAgICBlbmFibGUtZ3Bpb3MgPSA8JnBp
bmN0cmwgUlpHMkxfR1BJTyg0LCA0KSBHUElPX0FDVElWRV9ISUdIPjsNCj4gPiA+ICAgICAgICAg
cmVzZXQtZ3Bpb3MgPSA8JnBpbmN0cmwgUlpHMkxfR1BJTygwLCAxKSBHUElPX0FDVElWRV9MT1c+
Ow0KPiA+ID4gfTsNCj4gPiA+ICsNCj4gPiA+ICsmaTJjMCB7DQo+ID4gPiArICAgICAgIGNsb2Nr
LWZyZXF1ZW5jeSA9IDwxMDAwMDA+Ow0KPiA+ID4gK307DQo+ID4NCj4gPiBJcyB0aGlzIGEgbGlt
aXRhdGlvbiBvZiBvbmUgb2YgdGhlIEkyQyBkZXZpY2VzIG9uIHRoZSBidXMsIG9yIGEgUENCDQo+
ID4gZGVzaWduIGlzc3VlPw0KPiANCj4gQ3VycmVudGx5IHZlcnNhMyBjbG9jayBnZW5lcmF0b3Ig
Y29ubmVjdGVkIHRvIHRoZSBzYW1lIGJ1cyBhbmQgaXQgd29ya3Mgb2sNCj4gd2l0aCA0MDBrSHog
Y2xvY2suIE1heWJlIGl0IGlzIHN0cmVzc2VkIG5vdCB0aGF0IG11Y2ggY29tcGFyZWQgdG8gT1Y1
NjQ1DQo+IHNlbnNvciBjb25maWd1cmF0aW9uLg0KPiANCj4gQXQgdGhlIG1vbWVudCB3aXRoIDQw
MGtIeiBJMkMgYnVzIGNsb2NrLCBDYW1lcmEgY2FwdHVyZSBpcyBub3Qgd29ya2luZw0KPiBwcm9w
ZXJseSBvbiBSWi9HMlVMLCBidXQgd2l0aCBzYW1lIGJ1cyBmcmVxdWVuY3kgdGhlIHNhbWUgd29y
a3MgZmluZSBvbg0KPiBSWi97RzJMLEcyTEMsVjJMfS4NCj4gVGhlcmUgbWF5IGJlIHNvbWUgaGFy
ZHdhcmUgZGlmZmVyZW5jZXMgd2hpY2ggaXMgY2F1c2luZyB0aGlzIGlzc3VlLg0KPiANCj4gPg0K
PiA+IERvZXNuJ3QgdGhpcyBuZWVkIGEgRml4ZXMgdGFnPw0KPiANCj4gSSBjYW4gY3JlYXRlIGEg
bmV3IHBhdGNoIHVwZGF0aW5nIGJ1cyBmcmVxdWVuY3kgYXMgMTAwa0h6IGFuZCBhZGQgZml4ZXMN
Cj4gdGFnLg0KPiBBZnRlciB0aGlzIEkgd2lsbCBkcm9wIHRoaXMgcGF0Y2ggYXMgaXQgbm8gbG9u
Z2VyIG5lZWRlZC4NCj4gDQo+IFBsZWFzZSBsZXQgbWUga25vdy4NCg0KKyBtZWRpYQ0KDQpBZGRp
bmcgYSBkZWxheSBhZnRlciBTb2Z0d2FyZSByZXNldCBtYWtlcyBpdCB0byB3b3JrIGF0IDQwMGtI
eiB3aXRoIFJaL0cyVUwgU01BUkMgRVZLLg0KDQpTbyBub3Qgc3VyZSB3ZSBuZWVkIHRvIGFkZCBk
ZWxheSBhZnRlciBzb2Z0d2FyZSByZXNldD8NCg0KTm93IGFmdGVyIE9WNTY0NSBncGlvIHJlc2V0
LCB0aGVuIHRoZXJlIGlzIDIwbXNlYyBkZWxheSBhbmQgdGhlbiBhZ2Fpbg0Kd2UgYXJlIGlzc3Vp
bmcgc29mdHdhcmUgcmVzZXQgYW5kIHRoZXJlIGlzIG5vIGRlbGF5IGFmdGVyIHRoaXMgZm9yIHRo
aXMgc29mdHdhcmUgcmVzZXQuDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9vdjU2
NDUuYyBiL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0NS5jDQppbmRleCBhMjZhYzExYzk4OWQuLmQ2
N2E1ZTIzZmU1YSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0NS5jDQorKysg
Yi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDUuYw0KQEAgLTYyMiwxMSArNjIyLDE5IEBAIHN0YXRp
YyBpbnQgb3Y1NjQ1X3NldF9yZWdpc3Rlcl9hcnJheShzdHJ1Y3Qgb3Y1NjQ1ICpvdjU2NDUsDQog
ew0KICAgICAgICB1bnNpZ25lZCBpbnQgaTsNCiAgICAgICAgaW50IHJldDsNCg0KICAgICAgICBm
b3IgKGkgPSAwOyBpIDwgbnVtX3NldHRpbmdzOyArK2ksICsrc2V0dGluZ3MpIHsNCiAgICAgICAg
ICAgICAgICByZXQgPSBvdjU2NDVfd3JpdGVfcmVnKG92NTY0NSwgc2V0dGluZ3MtPnJlZywgc2V0
dGluZ3MtPnZhbCk7DQogICAgICAgICAgICAgICAgaWYgKHJldCA8IDApDQogICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Ow0KKw0KKyAgICAgICAgICAgICAgIGlmIChzZXR0aW5ncy0+
cmVnID09IE9WNTY0NV9TWVNURU1fQ1RSTDApDQorICAgICAgICAgICAgICAgICAgICAgICBmc2xl
ZXAoMTAwMCk7DQoNCkNoZWVycywNCkJpanUNCg==

