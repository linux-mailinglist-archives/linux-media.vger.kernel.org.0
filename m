Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A660473CF53
	for <lists+linux-media@lfdr.de>; Sun, 25 Jun 2023 10:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbjFYI2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 04:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjFYI2K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 04:28:10 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E47CD3;
        Sun, 25 Jun 2023 01:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENEaYh7KxrlLAlxqsnBhOFLnmvLk/AObdqx8ziuUrGo30zbfOFO8jkHmvoqGk3Jp12EgJT8Q4Vs+rk683jaI1z7VgfkLbYBg8y2iyrHWfk+VnqKU9wkNrfvPn3kBPrKM/gG95H9kAbMhF5OVkJPXV3nYGmJhvAHRZv9WyO7RpaB8l8c9wmv83Jl8LcD2sw8V033ZhRcx2hL1Vq/f7Mip0dZs6XIlC3SKULTpre0aPqP4ehqzAUwVTHqcbGU7kB+b+ZCsu4mMlA1w/EvrO3phYETwEjzhcV9uDWog6zVqd2b09wEeHiurOAQ1yqUG1S0+P3uyNU1y26AxTwZtVBJo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHdSYu9eJBzRVCO++B4SOl0HGFODwipjOrTV8tSPwjc=;
 b=NQmYOg/3cmgzmYTITxOS98POOcbVhlR1aeWHZUskbu01sSpFDdtH1q8SJG3P2SgGychCkklxWxUXtRKn+PmryHe9pcJqqhD9LYrRcYRIsd+LdBzuWMRML+O6+UuFxC3YWovtxXncDXdarYcTF46loP31im8pFx4jnINtonuaWaxseaK0Rck1ho1EC2RO9RS+3HHO3gMs4M/gH/idWfQmfYwRq8M+Zjd5yh8+WJUQg+ovV2tBcawYoO3H2fIXBPC40QaBhoorTqs9a1FoiKDokQLJx1aXcp0N9d5klfqkjlCyU2K49L4MJcteQkicEI2vFBIpFKZz+c6NV/SZFBhWyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHdSYu9eJBzRVCO++B4SOl0HGFODwipjOrTV8tSPwjc=;
 b=JbBgfw8VL/ItsLCmZ0bAtDw5hUXqQhR1C3qAiwCydjzziDjj8Pks6vngE9+IhbXbuI2tO2niRcWfBFWmsCWfiJQpwSGDvJ0ymVxBiiTq4LmzEJmOOwtspwLdTuQFFoIIb18+xD+xKiaaqTFN+hKRAxTq5ZRECx5iDILHK431PfI=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 08:28:03 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Sun, 25 Jun 2023
 08:28:03 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject: RE: [PATCH 3/4] media: dt-bindings: media: nxp,imx-isi: i.MX93
 support
Thread-Topic: [PATCH 3/4] media: dt-bindings: media: nxp,imx-isi: i.MX93
 support
Thread-Index: AQHZpzvJIIlu+ok45Uqi/UfPz8GrR6+bLcsAgAABQMA=
Date:   Sun, 25 Jun 2023 08:28:03 +0000
Message-ID: <AS8PR04MB90809D01798D2B11D7CB9681FA21A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
 <20230625080916.3553621-4-guoniu.zhou@oss.nxp.com>
 <63eb8605-fa23-fe13-e635-1cfdbcafb5c7@linaro.org>
In-Reply-To: <63eb8605-fa23-fe13-e635-1cfdbcafb5c7@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PR3PR04MB7308:EE_
x-ms-office365-filtering-correlation-id: 00e2e930-f3d7-405c-d889-08db755617f7
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aHGYtZPQo5ihaI6/tdzaQ8brykVtGCelpxOZ3iUSNDH4zmAuM94nTEa3M55Iee5gKW36WZiVRh4DN0b+gXjtm3AZrMWWOrr14hXv8BoVD0uEZNxq9idzDqh/mA5tMUuwIZEYMB9qDF0MDj/O+UogUzALpOspvs+qEGMTtYQj7KBytlpba3ctuVDyUJQfVmZEdXIerW2hyPP9EuCUiIDbDQBuq2dQZWRPsOuLK8j1heDV9BBQdaPr8NFbaNisP9vfOHaP5snYuekgGJMFpeN3Rwa0bIIpj5oVv5APoM4cobWYsNrBTscjjUhquGSfSyxiFmX+ZacOFLD3SrJ7Tdxk3jwimEEHHi6cQi14waTcBYKFjIAQOfsvzbWtMS8cE1EK2WpudHP0zkrTKlf8kH+6koLvUBKxYdew6yry/JVVA7/rTLpa8VepL0vq0OYtOYObQUq0fRR2zNqmnwH6uAf5j5Y2e29F4H5mnXP6piY2Eyf0CkftyUE/H3kQbAenKzVivUOiVzY8nItZFDysplMFm7Zu2LiORVUgMjtUYLXleGp4SjnOCnz+fcSTnB9fWdJPgLgJcK1vawV2EUHhHtMnBVukDn3tqqmtnJJjwi/a1Us=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(8676002)(8936002)(76116006)(66556008)(66946007)(66476007)(41300700001)(55016003)(316002)(66446008)(64756008)(4326008)(53546011)(26005)(6506007)(186003)(9686003)(478600001)(110136005)(54906003)(966005)(7696005)(71200400001)(2906002)(5660300002)(52536014)(7416002)(38070700005)(38100700002)(122000001)(33656002)(86362001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWN5enZoOGVreUw1RHlCbi9HVGdGOWdWcStWOVkwVHQ4cU1VS1d6TG52T1hw?=
 =?utf-8?B?SmxDOG5ELzdsZlRqNDR5S2NOTGJhUisxclM4cnI1ZTZaNGMxYTBlRE9pK09X?=
 =?utf-8?B?K0duc1U5Y3F2S09MRlhCZzFDUE1XditMVlp0Yi8xc2xNdEE3cW8wODNaOGZy?=
 =?utf-8?B?NHZBOHh1WklOa2ZTRkZZRlRXSVc1b21hUDFPcm8reHVYd0dWaTZ3bHh1Q3JS?=
 =?utf-8?B?Um1LenhZVStQS0V1RUh0QVU5UFh0NUJqa1Nid01JR25LT3hyWjR6SUhxNGdh?=
 =?utf-8?B?TVFPNnZqV1ZCWkJadmR0b1B4V0ZsblR5QlpicHYwbG1sazBCTm5iaURHNmhE?=
 =?utf-8?B?bzBCV2d4RVgzTUN4S2NNZzJMVVBySXg3YlI0NUZraFpCdTZaRHlxQUpXOFU0?=
 =?utf-8?B?Zzc0UTUwTlZBTktRYWNDSktaMWJkQmM2aDJYZHcwcjRhdlNBOWwrWm5aTlpQ?=
 =?utf-8?B?WVdXWk1POUNWZ3V5bWpZVjBkWnVGVTBiVlRDOVg1OTBZRGFicHZxUFBtdU9D?=
 =?utf-8?B?ejdnMjBrTERETC9TbXZLN0xvZnJLYThPN0ZEZlptTksvN0QzdmJ1OWRybmNR?=
 =?utf-8?B?WVNJRCs2VzZuQU9YWHA3Qys2VGRVUEVOaldRRHVpWmtZSFFZZHpSWHRaSmwz?=
 =?utf-8?B?YnJqMWp5YVZvS3AyWW1DQmFXYkp5NlhzYzhsQUxMNFhKNU1oODhRWk1iSDJz?=
 =?utf-8?B?Z0pXREtxUU1VMlF1dkpGRjdvUFFDeHVWQ2dSUVhRekIwSE92NEFRVlhBS0JN?=
 =?utf-8?B?LzA1VE9RblVETjZsZTRMa0J5enV6bmEvVWMzWkp4bm1hR2VJclFDMHQ1MTVR?=
 =?utf-8?B?d09ZOG54cllpYWpXZGdPQmhHSExJS25yMHRrbHlEcCsxc1ZQNklVdk9yTHRh?=
 =?utf-8?B?Y1NpMlZROGpQL054SzYrMWhWUzRoNWJ4SnBDdnUwZ1FkZmQ3bVRPeTRGZVh2?=
 =?utf-8?B?Mi9NVkpDdDJISUZLeFlnYUl6RU5vMGxKWVhrOG9QV2grSnBkQTFtQU1oUnNt?=
 =?utf-8?B?TDBZWGZraTBoVTU1RmxES1B2bk9jZ0RtS3pKcmlSVHZtelR3YmFCc0dUazQy?=
 =?utf-8?B?cENjejl0TVZ6NjllN3gvdHA0dnBGWjg5dlJXUGxrMUs0UHpMUy91anRtdFpQ?=
 =?utf-8?B?TWRNcHFwd1VUcUxJRjFnUjdsS3I1QXVIandjUXVUSUsrSmJRdFBLM0Naa1lK?=
 =?utf-8?B?NzNwNjBUUzIyd3ZwOG5SajlSQm83MXpBSUdoVGM0SWpFMmVaaS9TckYySDlM?=
 =?utf-8?B?WndyZHExYStqMjFpSVlEdU1oTWZCUjlxSHB1YW0yZCt2dXlKR2xpRFRZODBR?=
 =?utf-8?B?UVN0VHQ1a3IwWEM3NnpmSk8yNWZicVE2c21zd2ZlQmFBN2xZNFB3MGZRUXBB?=
 =?utf-8?B?YVJtY3pnZTAxbmg2UjMvNDBpT2ZKenZya3JDSmFFNmdqU0Vid3ZOVGtpeDFF?=
 =?utf-8?B?bEd0bGxDOEp3cXRkZzF6S0NRckZwU0Zvc2N1SklpUEJVNmJSWnFnUXFtRG9t?=
 =?utf-8?B?Z2RDU1ZUamdXRjZFcHJwTlJqTE9hL2JLYjlGTWpTVlMzZllaK3kzbC9NaW83?=
 =?utf-8?B?Z1oyUE9DSkJPSWNHU2dIY0o2L3JteiswS0RlUSt5Y1lTQmx5OXhRMm5zM3B1?=
 =?utf-8?B?eFNMZzlKMitOY0Q4d2NwOXBPcmxaa2gybmoyRjBLcDd6Z3laVnBkMWhycCtO?=
 =?utf-8?B?TnF4WXgxY2c1K1R3R0pQYjB5cUN5U1R1NzBsVStmMVdsd2JhSWJvSjd5NXZl?=
 =?utf-8?B?M3VoZ1lNOGJBelh0aVluVngyeldFMkpIQ2QxblBiaVR3YjVEVVRlV2h6T1J5?=
 =?utf-8?B?ZkMzampqMTdBY1Y3VUFJUjZLZ09PMC9zVHJOWHFTaUhiRDhSTFdhYWg4eU5V?=
 =?utf-8?B?S2NPeWJ5Q3BUV1VKaGdTcjA0U1VZRU9PcW5FdUhiVWtmWTA4cU1PMlN1TVFG?=
 =?utf-8?B?bHVIYVovU21uZi9US0RhTDdRTUxoTXU0UWhVOWpvTUtNbC9HWnJ2bDlPQ3Nz?=
 =?utf-8?B?RllzNVdQYStiQ3FqMlVvY1dkcCtPU3JFYXR5d1BQQzA0aUtIMGoyY2dha08y?=
 =?utf-8?B?ZHlCL2E5VWdYS1B6dnEzSzQvMndkVkVkUGx4U2JvQ3VGdmZnQlhabjRLTEtR?=
 =?utf-8?Q?cjf9uyX2J51gUPdl8O4TrKciz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e2e930-f3d7-405c-d889-08db755617f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2023 08:28:03.2619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hgv/d8VOSOWjlJvNR3nz5IWnrj/oghjSzdMHgt3/OeEDcNL3tdgFDSagLfew+S1oRxVwTJK5w4SzzGBW3RK5Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7308
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KR290IGl0LCB3aWxsIHVwZGF0ZS4gVGhhbmtzIGZv
ciB5b3VyIHF1aWNrIHJldmlld2luZy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+DQo+IFNlbnQ6IDIwMjPlubQ25pyIMjXml6UgMTY6MjINCj4gVG86IEcuTi4gWmhvdSAoT1NT
KSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+OyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7
DQo+IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZw0KPiBDYzogbGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tOyBtY2hlaGFi
QGtlcm5lbC5vcmc7DQo+IHJvYmgrZHRAa2VybmVsLm9yZzsga3J6eXN6dG9mLmtvemxvd3NraStk
dEBsaW5hcm8ub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOw0KPiBYYXZpZXIgUm91bWVndWUgKE9T
UykgPHhhdmllci5yb3VtZWd1ZUBvc3MubnhwLmNvbT47DQo+IGtlcm5lbEBwZW5ndXRyb25peC5k
ZTsgamFjb3BvLm1vbmRpQGlkZWFzb25ib2FyZC5jb207DQo+IHNha2FyaS5haWx1c0BsaW51eC5p
bnRlbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzRdIG1lZGlhOiBkdC1iaW5kaW5nczog
bWVkaWE6IG54cCxpbXgtaXNpOiBpLk1YOTMgc3VwcG9ydA0KPiANCj4gQ2F1dGlvbjogVGhpcyBp
cyBhbiBleHRlcm5hbCBlbWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5nIGxpbmtz
IG9yIG9wZW5pbmcNCj4gYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVz
c2FnZSB1c2luZyB0aGUgJ1JlcG9ydCB0aGlzIGVtYWlsJw0KPiBidXR0b24NCj4gDQo+IA0KPiBP
biAyNS8wNi8yMDIzIDEwOjA5LCBndW9uaXUuemhvdUBvc3MubnhwLmNvbSB3cm90ZToNCj4gPiBG
cm9tOiAiR3Vvbml1Lnpob3UiIDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+DQo+ID4gQWRkIGku
TVg5MyBzdXBwb3J0IHNpbmNlIGl0IHJldXNlIElTSSB3aGljaCB1c2VkIGluIGkuTVg4TSBmYW1p
bHkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9uaXUuemhvdSA8Z3Vvbml1Lnpob3VAbnhw
LmNvbT4NCj4gDQo+IFN1YmplY3Q6IERyb3AgZHVwbGljYXRlZCAibWVkaWE6Ig0KPiANCj4gPiAt
LS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL254cCxpbXgt
aXNpLnlhbWwgfCA1ICsrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVkaWEvbnhwLGlteC1pc2kueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL254cCxpbXgtaXNpLnlhbWwNCj4gPiBpbmRleCAx
Y2U5NDQwYmRlMzIuLmRkYWQxZDg3NzhmMyAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbnhwLGlteC1pc2kueWFtbA0KPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9ueHAsaW14LWlzaS55YW1sDQo+
ID4gQEAgLTIxLDYgKzIxLDcgQEAgcHJvcGVydGllczoNCj4gPiAgICAgIGVudW06DQo+ID4gICAg
ICAgIC0gZnNsLGlteDhtbi1pc2kNCj4gPiAgICAgICAgLSBmc2wsaW14OG1wLWlzaQ0KPiA+ICsg
ICAgICAtIGZzbCxpbXg5My1pc2kNCj4gDQo+IElteDkzIGlzIGEgZmFtaWx5IG9mIGRldmljZXMs
IG5vdCBzcGVjaWZpYyBkZXZpY2UsIHNvIEkgaG9wZSB5b3UgdW5kZXJzdGFuZCB0aGF0IGl0DQo+
IGlzIGEgYml0IGFnYWluc3QgdGhlIHJlY29tbWVuZGF0aW9uIG9mIHNwZWNpZmljIGNvbXBhdGli
bGVzIGFuZCB5b3UgZ3VhcmFudGVlDQo+IHRoYXQgYWxsIGRldmljZXMgd2l0aGluIGZhbWlseSB3
aWxsIGJlIGlkZW50aWNhbC4NCj4gDQo+IA0KPiANCj4gQWNrZWQtYnk6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gDQo+IA0KPiAtLS0NCj4g
DQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIGluc3RydWN0aW9uLCBqdXN0IGluIGNhc2UsIGJlY2F1
c2UgbWFueSByZXZpZXcgdGFncyBhcmUNCj4gYmVpbmcgaWdub3JlZC4gSWYgeW91IGRvIG5vdCBr
bm93IHRoZSBwcm9jZXNzLCBoZXJlIGlzIGEgc2hvcnQNCj4gZXhwbGFuYXRpb246DQo+IA0KPiBQ
bGVhc2UgYWRkIEFja2VkLWJ5L1Jldmlld2VkLWJ5L1Rlc3RlZC1ieSB0YWdzIHdoZW4gcG9zdGlu
ZyBuZXcgdmVyc2lvbnMsDQo+IHVuZGVyIG9yIGFib3ZlIHlvdXIgU2lnbmVkLW9mZi1ieSB0YWcu
IFRvb2xzIGxpa2UgYjQgY2FuIGhlbHAgaGVyZS4gSG93ZXZlciwNCj4gdGhlcmUncyBubyBuZWVk
IHRvIHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0byBhZGQgdGhlIHRhZ3MuDQo+IFRoZSB1cHN0cmVh
bSBtYWludGFpbmVyIHdpbGwgZG8gdGhhdCBmb3IgYWNrcyByZWNlaXZlZCBvbiB0aGUgdmVyc2lv
biB0aGV5IGFwcGx5Lg0KPiANCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUu
MTcvc291cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW4NCj4gZy1wYXRjaGVzLnJz
dCNMNTQwDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=
