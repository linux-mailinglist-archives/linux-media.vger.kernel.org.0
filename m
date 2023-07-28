Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDD276612E
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 03:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbjG1BXa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 21:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbjG1BX1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 21:23:27 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2066.outbound.protection.outlook.com [40.107.105.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E963588;
        Thu, 27 Jul 2023 18:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOgI2CxJZZ4ry7w+5XaIQ/aD2mqAiVf7uvacx7wGU7YDhIzZtoNPsYZ5Mft58XkOrFV936GVBqTYEtzAFmQg8M3qlY5L4OxmdmW2fYHAVv3IjYE7W+LQuANgF1GkFnyEiCxTaOwBa/Ab9tXBqQnLztkbqdF3UG3dk63a4cGLhRunDcxJ+VSSMVv0UMFanRNFESImt21n8U2/Ut3Qz1zeaclz89ZKnnxnrGamzQCbj5tUcCyE8AvlrFQn8ERbqLLEmN75tsHmLNRGs4yfYzwGQnGxD5moXdZLq80ssh2JXjp5OwXm4qYuj8lhS+xotUkvmQt22e2A4NR5hfFe6Gj79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfHKLdZDyhptX7o0Mi1AFWrXuuaMGix4OHbHrXa0+Yc=;
 b=XjJ7YbWsIceR7c7/N1ZQxp61as0uM7GZx2n2Zqps0QxXxlSOeDxnPybPX2b6J30qcOEvVVH2Gyqzm58DEh62bTdiAzPNWXLezjfWL+OMkMM0aNtARx+DHCqCUyCCmumGmLpzXSOg6D57cW1wq9H4hyLhP0itnj+TfnyX3OJZ88qSCLkL2qtRnKctbsSVQbIlRYS09/4FJx29+f1VGTuj8fDXafW42D8xzP0O73+iybKneklCcDRvEl+eiDSS3qB9r/HecXh+ZEkGVFxzW05DnqtXLeLEgrYF9u40kAlIBx2XtNffuVnP/JB7TaXwla1Et1cgPh8bkj3zTP0yRsBX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfHKLdZDyhptX7o0Mi1AFWrXuuaMGix4OHbHrXa0+Yc=;
 b=jK04bfG3EDDx5uTwWqVOMaJ0uTN3ecxuYP+BBHTSwAmFjZRAVq2gKyj0K9l3vI652SaD/TeDqe6DpkTW6MnyDfBLUg0TciRTZ1ohXkBr3Xka8LmwvBbXR3zm/ST9MKuHxcoPiTowZLTFlZcMUNa1rECzHCPUPBy6L4JjTktDFow=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB8PR04MB6955.eurprd04.prod.outlook.com (2603:10a6:10:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 01:23:16 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::6149:22e9:3a6a:4a6d]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::6149:22e9:3a6a:4a6d%7]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 01:23:16 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject: RE: [PATCH v5 3/3] media: nxp: imx8-isi: add ISI support for i.MX93
Thread-Topic: [PATCH v5 3/3] media: nxp: imx8-isi: add ISI support for i.MX93
Thread-Index: AQHZqimE1Dei9IoeKUCzIxQtPc6YSa/OU9eAgAA7h1A=
Date:   Fri, 28 Jul 2023 01:23:16 +0000
Message-ID: <AS8PR04MB9080D8C4A4CCBF4E2C792AC4FA06A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230629013621.2388121-1-guoniu.zhou@oss.nxp.com>
 <20230629013621.2388121-4-guoniu.zhou@oss.nxp.com>
 <20230727214831.GA28824@pendragon.ideasonboard.com>
In-Reply-To: <20230727214831.GA28824@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|DB8PR04MB6955:EE_
x-ms-office365-filtering-correlation-id: a019786d-37bd-41b7-b87b-08db8f093859
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nfmmaduX6xztj8QsQd4EqP7pkl4Fq7AQ7nmJ2am9fkYZYUjd0e7XlfMzrHKmIdjSbx64fXNp0K0Uq4DGnQF4AWILaE9lapbf3utvq9zfzgixgaMmzkau2C9neVEqn7nektTWb89zdWzsVJs07s7ws+qcPxT/UFbhZlhPb2RQxPd4wl6r800TI/ofOg1BnGmWp7o7HokyN8i6fVv8pNszwqezbcc5BRH4HOOzn3vFcu2RX6yrLxPVJmzyg69uXMLeYvFj0zcqxHjmMcdbiJ2q2zRdVpyRr1nkxpVQ+7DmwN2mWXdSbea4MnoB2n3/GfTe6fZ+6uKmQY9JXdfBGffbXM7WhfmivYe5yc3Ecs4ALYa8ndM2msqnGfNpr3+j+o9F8R5jCYR+mkcQTXTKY6oqkyF+foh4eB7yB4flTmcUuHfhpTb4Oh+AsWcs9BvAMpicUkUFmVfilEnhE3LF7VCUcYCsQ/JbDrHl5A8NXbrPlZK6SLonJ+AJPgDoGa4Rhyr/W67GhH5h3SRf4XVI7RtCS8hVc4pW/b1tmiLx5FwG5Jc8oV/uHxK0HIHcHpxOwIntaTzZiEDKNsF+/LZCmZYkL65CwocfFuxUi9WEgCRukl7kS1VbLEGRxJi4u5vl6zwM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(41300700001)(2906002)(86362001)(316002)(7416002)(52536014)(5660300002)(38070700005)(8936002)(33656002)(8676002)(55016003)(9686003)(53546011)(6506007)(26005)(7696005)(478600001)(66446008)(71200400001)(83380400001)(186003)(38100700002)(4326008)(64756008)(66946007)(122000001)(66556008)(54906003)(110136005)(76116006)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUwxd05RbjlnVzk1TGw5dDh4V0ovbEFYN3dnMXJxdldGRmd5a2kzUmYzSzhX?=
 =?utf-8?B?aW5UWUV0YU14SW9LQ2Q2TUxZNEo2YVlyZnE0VHZWQXVhSHlTaFUrYXVoWG9r?=
 =?utf-8?B?TkVlUTgwcm9GRkxRRjNCc1JzTHcxSlVxeFBjeGcvL3NnejlNWlZ0UkRaa1pt?=
 =?utf-8?B?bjJpOHhDOFlPZmVabGN1bVlGU3Y0TmEwak1sNmtJbGN2dkhqTnFONzEzVEY4?=
 =?utf-8?B?THBHb1E3Sk9CdkZpcHIrUFhWajJkck9wVy85NWY2d2t5VkhJdFB3WnBuVkc2?=
 =?utf-8?B?TlU4NVRqSHZBRnd1Q0tBcFZLUWFFdEZ0VTJsMU84QkpEeEE3T0lCV3kwaWlK?=
 =?utf-8?B?eTFoZWFvRTdpN3dmWTlqZjJwZ3lJVnZkZTdJbmovZjJ6Z0dEUm9UQ0k1NUtN?=
 =?utf-8?B?QU5oQkcxN2RKM3F1VHZTM3dLaGJZNGdZbVA5WEYzd0lFSWxwdFdZZjVzaEVw?=
 =?utf-8?B?SGJPMFFrbDJIaTR5UTA1ZnczYzBVRUh1WWNWTUxoenFVc056d1BJRHBsNUZS?=
 =?utf-8?B?U0h1RS9nVlVOUUx0bVVrcmtWeDYwZm5pS3ZyRno3Y2FFZWMvaXFURlQ1eVFR?=
 =?utf-8?B?NDZNYklZVnRKZkszdWN0bVp1YTJRWHNGYUxGTW5taXhIOGZuWFFLNVJkTVV3?=
 =?utf-8?B?ZWpKbXpqUEl3NERqZ2dYdDZNK0ZaTERrK2NsQ0p6elhnVXR4SmttYlRLdWtl?=
 =?utf-8?B?eGRxRFZ1Rll3c1g4WDgzaU1Ydlh6UFBKRUJqNzZvRDZyS0RxeXQxam1pUUpH?=
 =?utf-8?B?Z2RXNlBMWERNYTJDYzJXalhQRVFKSGRXUmJqaU0xcFRScGNudVd5SXdnNXhy?=
 =?utf-8?B?VUc3U0VvdmdtUFVHTmR4WG00cEhPd2NqcmgyZXBZbktjcC9iWUJOc3JQQW5N?=
 =?utf-8?B?Y0Y3bThQaDdpYkkzaTlpMEJ1WENHQWRVLzNJektQWVU4M084Wi9ud3J2QXdN?=
 =?utf-8?B?OTMvUGVjcTZ0TUxWUExydXJoczNUZW9KdzhneDNJWDFJYWFsazVZTGFhVUJr?=
 =?utf-8?B?dmcrSFBmTkdFcVFldXRWTGpuNUkycElXM0Y3RGE2clJyMjZZMDA1dmE0NUZs?=
 =?utf-8?B?TnRTQ20xL0tCeDZwR2FLbWtUM1M5TDIxTVI0VnhqNUtpd2szaE9teEg5SWRk?=
 =?utf-8?B?QzZSa0F1Vko1enJZMlVUVHo3MW1SLzJMenNIS0hJMEhzTmhJcENXN0dBdXY5?=
 =?utf-8?B?Zi9rcHJuVk0rTkNLU0dkTkNzUjg0b25pTGJRLzFrWnllT1A1UXlzOENraCtU?=
 =?utf-8?B?cVNvYUdpbElFajFxVHNzOEFVcDd0NzhFcFVnQWZoaW1BZEVpZnNPY2VwV3dK?=
 =?utf-8?B?dkxmTVVacmp0VUxpYXJIWndkYkJxUHRTODZSS2RqRkZncW92VDNBeDU0aDA1?=
 =?utf-8?B?TlNQZFBjNTN1UnZqdStPT3FxS1MyekU0MUxsYlVIT0lGZWp0bHBwYlVBWCtM?=
 =?utf-8?B?VmZrOEtsZGZQRnpjVEVxeEtTZjc4VGhwcVVGRE9PVmZFSkI5cWwveFlpa0l2?=
 =?utf-8?B?NjNxWGJZM2IvSEVLUUVYRlJ2eDdBRXZ3NGMzVnZTdFVjalFTbE1kNCtDMlZ0?=
 =?utf-8?B?M2pBTDRjMXpRby9QWjBoYTFrcFBzWDd1Y3cycXBCYldVU0czeFUvSm1vWFNW?=
 =?utf-8?B?dEhLaHZ5bkVaYXJWOFB2bUl3ZU11cCtCTHp3a1ZuUXpUMnFLbEpaNUJrTk1a?=
 =?utf-8?B?dXlIRHkxQUR6QTZ5Mk9ack8wWkJUbzIwZWY4QlQwNFZFZFBMOUViZTlsWkFB?=
 =?utf-8?B?Z2ZpNnhhNExITk4zd0pWNnJqVU5TcFgvd1JMdno2TFBIc1RWcTMrcERDMlpu?=
 =?utf-8?B?STFLRkN2eGNhdWcxSGFzWHBqRG9haDlQNDJVUm90cXBoMm5RNTNrYnlIdUF2?=
 =?utf-8?B?SWM5RDgyTkRyNE9wTHczblNzaHVXWTNzRmdhaTJBanVYRGNwdlJBNUJITGI2?=
 =?utf-8?B?MmJncE1ocGJNMGtJc0hodHlHK01ZV1lKd003MnpydlkyUTdsVnVUU2tLNUlp?=
 =?utf-8?B?alRSSVIybnR3NWQ2OUV6REZlUTgzUGhzaWlwVWhYdWExK1VCV0FLMjErUDEw?=
 =?utf-8?B?S0N2djNYQWJ2T0x0YWZ6d2NYSmFDa1NXOVBiWUh5aVdGN2g1MkV1UVlzZ3FO?=
 =?utf-8?Q?EXhLNPoNKGd5p6ugf+iWRLvUj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a019786d-37bd-41b7-b87b-08db8f093859
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 01:23:16.5501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZsR7300RX20QwG6wVV5ozEssA8bAAObYS0i8gT8cpaUwVjrFLB7WxdhcaJsuOijR6JyPiMG09iiFfrOsVJUYvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6955
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwgDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50
OiAyMDIz5bm0N+aciDI45pelIDU6NDkNCj4gVG86IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpo
b3VAb3NzLm54cC5jb20+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxp
bnV4LWlteCA8bGludXgtaW14QG54cC5jb20+Ow0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgbWNoZWhhYkBrZXJuZWwub3JnOyByb2JoK2R0QGtlcm5lbC5vcmc7DQo+IGtyenlzenRvZi5r
b3psb3dza2krZHRAbGluYXJvLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsgWGF2aWVyIFJvdW1l
Z3VlDQo+IChPU1MpIDx4YXZpZXIucm91bWVndWVAb3NzLm54cC5jb20+OyBrZXJuZWxAcGVuZ3V0
cm9uaXguZGU7DQo+IGphY29wby5tb25kaUBpZGVhc29uYm9hcmQuY29tOyBzYWthcmkuYWlsdXNA
bGludXguaW50ZWwuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMy8zXSBtZWRpYTogbnhw
OiBpbXg4LWlzaTogYWRkIElTSSBzdXBwb3J0IGZvciBpLk1YOTMNCj4gDQo+IENhdXRpb246IFRo
aXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBs
aW5rcyBvciBvcGVuaW5nDQo+IGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhl
IG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQgdGhpcyBlbWFpbCcNCj4gYnV0dG9uDQo+IA0KPiAN
Cj4gSGkgR3Vvbml1LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBU
aHUsIEp1biAyOSwgMjAyMyBhdCAwOTozNjoyMUFNICswODAwLCBndW9uaXUuemhvdUBvc3Mubnhw
LmNvbSB3cm90ZToNCj4gPiBGcm9tOiAiR3Vvbml1Lnpob3UiIDxndW9uaXUuemhvdUBueHAuY29t
Pg0KPiA+DQo+ID4gaS5NWDkzIHVzZSBhIGRpZmZlcmVudCBnYXNrZXQgd2hpY2ggaGFzIGRpZmZl
cmVudCByZWdpc3RlciBkZWZpbml0aW9uDQo+IA0KPiBzL3VzZS91c2VzLw0KPiBzL2RlZmluaXRp
b24vZGVmaW5pdGlvbnMvDQo+IA0KPiA+IGNvbXBhcmVkIHdpdGggaS5NWDguIEhlbmNlIGltcGxl
bWVudCB0aGUgZ2Fza2V0IGNhbGxiYWNrcyBpbiBvcmRlciB0bw0KPiA+IGFkZCBJU0kgc3VwcG9y
dCBmb3IgaS5NWDkzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogR3Vvbml1Lnpob3UgPGd1b25p
dS56aG91QG54cC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3BsYXRmb3Jt
L254cC9pbXg4LWlzaS9pbXg4LWlzaS1jb3JlLmMgICAgIHwgMTUgKysrKysrKysrKw0KPiA+ICAu
Li4vcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUuaCAgICAgfCAgMiArKw0KPiA+
ICAuLi4vcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWdhc2tldC5jICAgfCAzMCArKysr
KysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNp
L2lteDgtaXNpLWNvcmUuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1p
c2kvaW14OC1pc2ktY29yZS5jDQo+ID4gaW5kZXggNTE2NWY4OTYwYzJjLi4yN2JkMThiN2VlNjUg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14
OC1pc2ktY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1p
c2kvaW14OC1pc2ktY29yZS5jDQo+ID4gQEAgLTMwNyw2ICszMDcsMjAgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBteGNfaXNpX3BsYXRfZGF0YQ0KPiBteGNfaW14OG1wX2RhdGEgPSB7DQo+ID4gICAg
ICAgLmhhc18zNmJpdF9kbWEgICAgICAgICAgPSB0cnVlLA0KPiA+ICB9Ow0KPiA+DQo+ID4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgbXhjX2lzaV9wbGF0X2RhdGEgbXhjX2lteDkzX2RhdGEgPSB7DQo+
ID4gKyAgICAgLm1vZGVsICAgICAgICAgICAgICAgICAgPSBNWENfSVNJX0lNWDkzLA0KPiA+ICsg
ICAgIC5udW1fcG9ydHMgICAgICAgICAgICAgID0gMSwNCj4gPiArICAgICAubnVtX2NoYW5uZWxz
ICAgICAgICAgICA9IDEsDQo+ID4gKyAgICAgLnJlZ19vZmZzZXQgICAgICAgICAgICAgPSAwLA0K
PiA+ICsgICAgIC5pZXJfcmVnICAgICAgICAgICAgICAgID0gJm14Y19pbXg4X2lzaV9pZXJfdjIs
DQo+ID4gKyAgICAgLnNldF90aGQgICAgICAgICAgICAgICAgPSAmbXhjX2lteDhfaXNpX3RoZF92
MSwNCj4gPiArICAgICAuY2xrcyAgICAgICAgICAgICAgICAgICA9IG14Y19pbXg4bW5fY2xrcywN
Cj4gPiArICAgICAubnVtX2Nsa3MgICAgICAgICAgICAgICA9IEFSUkFZX1NJWkUobXhjX2lteDht
bl9jbGtzKSwNCj4gPiArICAgICAuYnVmX2FjdGl2ZV9yZXZlcnNlICAgICA9IHRydWUsDQo+ID4g
KyAgICAgLmdhc2tldF9vcHMgICAgICAgICAgICAgPSAmbXhjX2lteDkzX2dhc2tldF9vcHMsDQo+
ID4gKyAgICAgLmhhc18zNmJpdF9kbWEgICAgICAgICAgPSBmYWxzZSwNCj4gPiArfTsNCj4gPiAr
DQo+ID4gIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gICAqIFBvd2VyIG1hbmFnZW1lbnQN
Cj4gPiAgICovDQo+ID4gQEAgLTUxOCw2ICs1MzIsNyBAQCBzdGF0aWMgaW50IG14Y19pc2lfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gPiAqcGRldikgIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIG14Y19pc2lfb2ZfbWF0Y2hbXSA9IHsNCj4gPiAgICAgICB7IC5jb21w
YXRpYmxlID0gImZzbCxpbXg4bW4taXNpIiwgLmRhdGEgPSAmbXhjX2lteDhtbl9kYXRhIH0sDQo+
ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJmc2wsaW14OG1wLWlzaSIsIC5kYXRhID0gJm14Y19p
bXg4bXBfZGF0YSB9LA0KPiA+ICsgICAgIHsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDkzLWlzaSIs
IC5kYXRhID0gJm14Y19pbXg5M19kYXRhIH0sDQo+ID4gICAgICAgeyAvKiBzZW50aW5lbCAqLyB9
LA0KPiA+ICB9Ow0KPiA+ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBteGNfaXNpX29mX21hdGNo
KTsgZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kv
aW14OC1pc2ktY29yZS5oDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlz
aS9pbXg4LWlzaS1jb3JlLmgNCj4gPiBpbmRleCA3OGNhMDQ3ZDkzZDEuLjI4MTBlYmU5YjVmNyAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4
LWlzaS1jb3JlLmgNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlz
aS9pbXg4LWlzaS1jb3JlLmgNCj4gPiBAQCAtMTU4LDYgKzE1OCw3IEBAIHN0cnVjdCBteGNfZ2Fz
a2V0X29wcyB7ICBlbnVtIG1vZGVsIHsNCj4gPiAgICAgICBNWENfSVNJX0lNWDhNTiwNCj4gPiAg
ICAgICBNWENfSVNJX0lNWDhNUCwNCj4gPiArICAgICBNWENfSVNJX0lNWDkzLA0KPiA+ICB9Ow0K
PiA+DQo+ID4gIHN0cnVjdCBteGNfaXNpX3BsYXRfZGF0YSB7DQo+ID4gQEAgLTI5NSw2ICsyOTYs
NyBAQCBzdHJ1Y3QgbXhjX2lzaV9kZXYgeyAgfTsNCj4gPg0KPiA+ICBleHRlcm4gY29uc3Qgc3Ry
dWN0IG14Y19nYXNrZXRfb3BzIG14Y19pbXg4X2dhc2tldF9vcHM7DQo+ID4gK2V4dGVybiBjb25z
dCBzdHJ1Y3QgbXhjX2dhc2tldF9vcHMgbXhjX2lteDkzX2dhc2tldF9vcHM7DQo+ID4NCj4gPiAg
aW50IG14Y19pc2lfY3Jvc3NiYXJfaW5pdChzdHJ1Y3QgbXhjX2lzaV9kZXYgKmlzaSk7ICB2b2lk
DQo+ID4gbXhjX2lzaV9jcm9zc2Jhcl9jbGVhbnVwKHN0cnVjdCBteGNfaXNpX2Nyb3NzYmFyICp4
YmFyKTsgZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1p
c2kvaW14OC1pc2ktZ2Fza2V0LmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lt
eDgtaXNpL2lteDgtaXNpLWdhc2tldC5jDQo+ID4gaW5kZXggMWQ2MzJkYzYwNjk5Li41MGFjMWQz
YTJiNmYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1p
c2kvaW14OC1pc2ktZ2Fza2V0LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254
cC9pbXg4LWlzaS9pbXg4LWlzaS1nYXNrZXQuYw0KPiA+IEBAIC01MywzICs1MywzMyBAQCBjb25z
dCBzdHJ1Y3QgbXhjX2dhc2tldF9vcHMgbXhjX2lteDhfZ2Fza2V0X29wcyA9IHsNCj4gPiAgICAg
ICAuZW5hYmxlID0gbXhjX2lteDhfZ2Fza2V0X2VuYWJsZSwNCj4gPiAgICAgICAuZGlzYWJsZSA9
IG14Y19pbXg4X2dhc2tldF9kaXNhYmxlLCAgfTsNCj4gPiArDQo+ID4gKy8qDQo+ID4gKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiA+ICstLS0tLS0tLQ0KPiA+ICsgKiBpLk1YOTMgZ2Fza2V0DQo+ID4gKyAqKi8N
Cj4gDQo+IEV4dHJhIHN0YXIgaGVyZSB0b28uDQo+IA0KPiA+ICsNCj4gPiArI2RlZmluZSBESVNQ
X01JWF9DQU1FUkFfTVVYICAgICAgICAgICAgICAgICAgICAgMHgzMA0KPiA+ICsjZGVmaW5lIERJ
U1BfTUlYX0NBTUVSQV9NVVhfREFUQV9UWVBFKHgpICAgICAgICAoKCh4KSAmIDB4M2YpIDw8IDMp
DQo+ID4gKyNkZWZpbmUgRElTUF9NSVhfQ0FNRVJBX01VWF9HQVNLRVRfRU5BQkxFICAgICAgIEJJ
VCgxNikNCj4gDQo+IExldCdzIGFkZCBhIGJsYW5rIGxpbmUgaGVyZS4NCj4gDQo+IFdpdGggdGhv
c2Ugc21hbGwgaXNzdWVzIGZpeGVkLA0KPiANCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gDQo+IEknbGwgbWFrZSB0
aGUgY2hhbmdlcyBsb2NhbGx5IGFuZCBpbmNsdWRlIHRoZSBzZXJpZXMgaW4gbXkgbmV4dCBwdWxs
IHJlcXVlc3QuDQoNCk9rYXksIHRoYW5rcy4NCg0KPiANCj4gPiArc3RhdGljIHZvaWQgbXhjX2lt
eDkzX2dhc2tldF9lbmFibGUoc3RydWN0IG14Y19pc2lfZGV2ICppc2ksDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB2NGwyX21idXNfZnJhbWVfZGVz
Yw0KPiAqZmQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCB2NGwyX21idXNfZnJhbWVmbXQNCj4gKmZtdCwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3QgdW5zaWduZWQgaW50IHBvcnQpIHsNCj4gPiArICAgICB1MzIg
dmFsOw0KPiA+ICsNCj4gPiArICAgICB2YWwgPSBESVNQX01JWF9DQU1FUkFfTVVYX0RBVEFfVFlQ
RShmZC0+ZW50cnlbMF0uYnVzLmNzaTIuZHQpOw0KPiA+ICsgICAgIHZhbCB8PSBESVNQX01JWF9D
QU1FUkFfTVVYX0dBU0tFVF9FTkFCTEU7DQo+ID4gKyAgICAgcmVnbWFwX3dyaXRlKGlzaS0+Z2Fz
a2V0LCBESVNQX01JWF9DQU1FUkFfTVVYLCB2YWwpOyB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9p
ZCBteGNfaW14OTNfZ2Fza2V0X2Rpc2FibGUoc3RydWN0IG14Y19pc2lfZGV2ICppc2ksDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcG9ydCkgew0K
PiA+ICsgICAgIHJlZ21hcF93cml0ZShpc2ktPmdhc2tldCwgRElTUF9NSVhfQ0FNRVJBX01VWCwg
MCk7IH0NCj4gPiArDQo+ID4gK2NvbnN0IHN0cnVjdCBteGNfZ2Fza2V0X29wcyBteGNfaW14OTNf
Z2Fza2V0X29wcyA9IHsNCj4gPiArICAgICAuZW5hYmxlID0gbXhjX2lteDkzX2dhc2tldF9lbmFi
bGUsDQo+ID4gKyAgICAgLmRpc2FibGUgPSBteGNfaW14OTNfZ2Fza2V0X2Rpc2FibGUsIH07DQo+
IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
