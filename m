Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9C757420BD
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 09:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbjF2HHa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 03:07:30 -0400
Received: from mail-dbaeur03on2067.outbound.protection.outlook.com ([40.107.104.67]:56673
        "EHLO EUR03-DBA-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231422AbjF2HH2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 03:07:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXXSJIPxVRixW1FCtRqW5M1691xPKqAznnMDXyQp7vinXNWvjG9HLOYdrY0ZkXUUY3TM+by/3/6zwGRyayuos0azKQiUU1TVQ/kttXMuacjaI7A9durT1i06AOrpgsBp1Vo+KQCQ5gpOoqKcBkHgayGCtvXtKX6fF0hS5sL9zMfdZjHrBZbnmasvIxyBnxD5NOm26JUpulXfIlnwUAi14w8jA+ZHmnJugyAOWjvMvyhoD2xDlsfMM/muNPnMTkh3v/T2Im7Rt3O6cG4RHOEQNt28hm6HyUcDMtSr8aJtB1ChT7eCAHAykXeDUf5E025AvFJbnQM7+hW0Y1LKsm3c8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYIGqU4vSEcCDYqM6BGFk8eNgIFJolMKObnKHaYxdZE=;
 b=CiRsYz+QS22qc08CZ18A0fSZ3/yb/2sOHddVKnYF3LHVcqjpHYnJKBitHpLd0qkSEPk3DwL0m4mubHsU9jXDzJ6HiByFG9RHOquMSofPpIVJeiX/iFHsZ9hb/JkRjUk6gpvQpNXUihW81Dz8lYmhx0jcJ2GY2TpKwhR0A4FVvWsQfcCZjcE80aeyJq3cyMyhOZJKRMfGQnV52U+9koRFA136ccNqWubyb5yKnAptS37q3LNlfKF1X6KJNGncXIxPwIyl+8ufhk05tC9rlxT3wOF/Il7E3FOVGl9IEli0RWiWgWL1I0MxtoY1bcD5pKdXLAhoJv99qOgoKnVrb1B4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYIGqU4vSEcCDYqM6BGFk8eNgIFJolMKObnKHaYxdZE=;
 b=Jx2WKLuLpV0n/4VP+kBE7rg4Hl40IbNtfW24c/jamyZiPAwitHioK4HlcYU+grJUBeUb1oiVwoure6C4Qq2EBFefzD2jBlvgY8ZS19l9WtBdRGRFrFL6FuOw4hHNrlwupDMNeVB1Uc7mHsNIbhC5wkr3vh99F1C1dpr4txdWF+Y=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8677.eurprd04.prod.outlook.com (2603:10a6:10:2dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 07:07:24 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6544.019; Thu, 29 Jun 2023
 07:07:24 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
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
Subject: RE: [PATCH v5 3/3] media: nxp: imx8-isi: add ISI support for i.MX93
Thread-Topic: [PATCH v5 3/3] media: nxp: imx8-isi: add ISI support for i.MX93
Thread-Index: AQHZqimE1Dei9IoeKUCzIxQtPc6YSa+hVaQAgAAFMHA=
Date:   Thu, 29 Jun 2023 07:07:23 +0000
Message-ID: <AS8PR04MB90801F3FC8D5A1D01E6BC32BFA25A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230629013621.2388121-1-guoniu.zhou@oss.nxp.com>
 <20230629013621.2388121-4-guoniu.zhou@oss.nxp.com>
 <5948448.lOV4Wx5bFT@steina-w>
In-Reply-To: <5948448.lOV4Wx5bFT@steina-w>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|DU2PR04MB8677:EE_
x-ms-office365-filtering-correlation-id: 71f7a77a-b523-44aa-037f-08db786f7d30
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tGvuxeuKTXoY8ErzOEvs7hxGYWlkmMPd7QABq3EQfzVYja0r7TLIkoLTI1l4hjeSoiARypecbef1BXQa95BS/cqxZNFqc2COB21SVOujzn1rQmOPnGlCBz5UZPHrujJUUC8bMf+3WvdYuEyrj6fpBek/PPZkjmvyHUrxKeIlhVmiYG/cauBo+CJAxrR2JBSjAFkCn4BO98JcKo2qjyvm5F4KcATM9vA6CcsSAPxu9EevSdh53KHDYX52ettoy73oYM0GDtSrV+5c7g6JXHn5W5YS9StDjaGUUK/dXiAlp4FiGe+hH8XsQC046tPJ7Ki4dtPDEDGU3DZLpF3NXNd5Gryff91plgS1o4rDJ7q8oySQInbsfR8xgDY2a+YL5PGQqiohCldjhIhjXCP+hZppVLA8KG/GHOiiaBl20udgctFiAON/l0qtfmGjp8hvqawMDuNdFu7FzhV6ku7IWF5TxABh4yk95MLAd4m9uulVTzLnVuJl9ejOq5VDCbrr7dI9TSCWTiKp+lKTEgiK/0tsGl7D7Bvyfy1+5fI6tilDHFmpg/bynqHdc6IH+4ULBjZisOkMyq4AETeLAKoMXw+fhizGGGk2WL56lw0paLoPcc4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199021)(53546011)(76116006)(52536014)(66556008)(7416002)(4326008)(66446008)(64756008)(8936002)(66946007)(8676002)(38070700005)(33656002)(66476007)(41300700001)(86362001)(122000001)(5660300002)(316002)(38100700002)(55016003)(966005)(66574015)(9686003)(6506007)(186003)(7696005)(2906002)(83380400001)(54906003)(71200400001)(110136005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1VoZDd4SkRLMDlVVjJZMnRNN2N2OHRGeHhiVUljMDVMeWF2cEpWL2p6K3Nr?=
 =?utf-8?B?b3ZaQjBleFAzTmd6TmxrYUVuUEhESFRudFdtcno5SFY3aE5hNTQ0TnZSazI5?=
 =?utf-8?B?WWFhcm9DN1NnVFRvTi9Fck1KeDVPUmVLaDY5cXBHTkIvTStOZHVUc1grUXpi?=
 =?utf-8?B?ejFJOXFXZ0N5dkxVRDMvWEhvZHYya2ZlUGdIay9oS0lONTFjeThob2hrdmFI?=
 =?utf-8?B?VmFUaTlLUG40VFZSVkRjUEFzNkZ3N3hBczlraEFDMm44TTI1NUVuWFR1NnB1?=
 =?utf-8?B?R2pKS1VDZTJtY0RKZWs4d0czZmlBeURjY2grbEFldTZya1BxNlZ3QSs0ZWdS?=
 =?utf-8?B?VDVBRWp1TUNreWZyUHY2amFjU1NLdytDN2gzc21qdUxqajZhdnZiSWlhRDZo?=
 =?utf-8?B?ZGFTczdycW5VZVVadUIwTVJzdE1RQ0NueWMwQ3BjSTY2OHRZNnBuZHMvT25i?=
 =?utf-8?B?OVBxaW85d2ozb2hnc0pTWjFZOUs1RzM3bkFBY3pjcWoraUZCWmtpWGZhZDd3?=
 =?utf-8?B?RVk0aXFLNS96Y0U4M0swWFZCclZxYnJXbHc4dko2aFowMXlESDJla01BcitL?=
 =?utf-8?B?TzVuMmZxSTdvNHZ2K05GR3AzdVM2TzMyRkhReVpxOXo4WERJRlVkL3NUMTYv?=
 =?utf-8?B?ZHJIZ1ZEdk02L0dvVnFVYXc5NGtRNkt3SmRJVm9hVmlKc3NNRi9wUFd0U2x3?=
 =?utf-8?B?ZmFlZ2hJY2RnQWdCZGV1U213T3Jjb1ZnU09oUXNMN2FYaVVFb2kwaDl1YlRJ?=
 =?utf-8?B?U3JrS2FzbVVFVmZ0ZmZOTHBsNjJMUDBhbEZLTURhTnJXLytGaE9LR3NNajlP?=
 =?utf-8?B?RXRVZFkzQk52QmxnUG5aeVUzM0pwRmRLeUxRU2pqczdjbk9uNlhTSWllOWVa?=
 =?utf-8?B?eXZ3RnZzQm5YNjVHdDVuckdrK3RVa3A5OFpWQ2lGS21xZERkM2VkZlZTZk90?=
 =?utf-8?B?cm0vbStnR0YzT1N0emxPN2Q1b2YyM3Z4d0UyRUlZMDFqZldvTm5yRnBvOWJ6?=
 =?utf-8?B?RkliTFdLWHA5b0RUc2FtNjFZcUhhQnA5cE9yNitxVEcrSUVySGtTMjZaUkdi?=
 =?utf-8?B?N0ZHaHVCT1BzSXk1Ym13MmdQdkUwRG4vRVVJcFRnMVhqZjI1UDFMcmZDaEpV?=
 =?utf-8?B?S2wrTmVzWFZuYUNNSitrR1BVRHRhZTg3QmRzekYrRkFlSW8vU3dTK1M2WWJ2?=
 =?utf-8?B?VHJEcDVCU0lzWmhsZWJUOXJLWDRvcWdzcXFpVXpPREhVb1lQcjR5b2wrV2Ju?=
 =?utf-8?B?VENPejdMcnJZUkZRWUdka3p2ZEJuN0tFcEZQemdxamNkWFFuQXZEelpCNnRZ?=
 =?utf-8?B?QWNGVndmVFZRazU2Wi9FekpzUGp1Ujl6QUc5K1lhUjZVbnowdVVyZXVSVEJP?=
 =?utf-8?B?WU1NRVh1TW9WakhVcHJ0elZzcGVlMWIrSExHdm9nTTl5M1N6Y2RiL2xCNHJ4?=
 =?utf-8?B?MjB3cU52a0xHY1JGbDdEaHVFWVVYNlJTVVduNkxoUEpkOUFzNTBvSjE2N29X?=
 =?utf-8?B?VHdtR2VSNzIvSUlyd0loZUFsNnkvK2NQSGd4dnkyZzVVdm1kaUpTQ0hUdUI4?=
 =?utf-8?B?Zkk1V1o0ZTEyOFpnZUc5bVZpVyt2VUNlK0FpKzN0aUI4RDdabUdyOWxpUExH?=
 =?utf-8?B?cWU2OXBIZXROSnp6TTNnOTErcGd4NmgwU292UDVGbmFsMVg4cjBPYWNRaWMw?=
 =?utf-8?B?MFh4UGlYQ2FHYUJLandHYUllVW1TSlphb0crM2ZGWllqWVZrS2JqcUplQzRQ?=
 =?utf-8?B?Wk5lOU91Tk5rYlkxbVI0djh1N1RQUXMrL2haYnpTR1plYklrZDdxeWxGWVB3?=
 =?utf-8?B?ZzVQaHp4ak1uVE5TczhJRFFnWkhRUW05VU1HVlgxbEhQM3JFMTdPSXhCeW9W?=
 =?utf-8?B?UkUvLytmVEZjVkhSSGhiNWRyRzVKL1RnWG1nVm92ai9WVGhSL1JqNUxMV2Vy?=
 =?utf-8?B?UnFON2VBTGZ0MHdDWjlrNjhMM3JTemRlU21nMURsekV3Kzl1UlVsZFVwa0x6?=
 =?utf-8?B?VEtMNWNKSGVsM2JuRXNEakZiS2RyV3pVZHlMQmxWTUx2RjNld3B0bkdIR1R4?=
 =?utf-8?B?YlFIckxGNnBrdnBMYWZmNUVNaWRyM3phRS9ENGR4YVFob1MvN3Y4MVUzdzBM?=
 =?utf-8?Q?SBRU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f7a77a-b523-44aa-037f-08db786f7d30
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 07:07:23.9779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0RVBDON+6RU5LoEcAK/xgLQKKhIbp5OWvUjh+Cx+iInCPy5/SWLx+m7TmXBe1j52Rh/e1XMToHnStVtBbVeOHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8677
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQWxleGFuZGVyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFs
ZXhhbmRlciBTdGVpbiA8YWxleGFuZGVyLnN0ZWluQGV3LnRxLWdyb3VwLmNvbT4NCj4gU2VudDog
MjAyM+W5tDbmnIgyOeaXpSAxNDo0Mw0KPiBUbzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3Jn
OyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsNCj4gZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc7IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+DQo+IENj
OiBsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb207IG1jaGVoYWJAa2VybmVsLm9yZzsN
Cj4gcm9iaCtkdEBrZXJuZWwub3JnOyBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7
IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+IFhhdmllciBSb3VtZWd1ZSAoT1NTKSA8eGF2aWVyLnJv
dW1lZ3VlQG9zcy5ueHAuY29tPjsNCj4ga2VybmVsQHBlbmd1dHJvbml4LmRlOyBqYWNvcG8ubW9u
ZGlAaWRlYXNvbmJvYXJkLmNvbTsNCj4gc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbQ0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY1IDMvM10gbWVkaWE6IG54cDogaW14OC1pc2k6IGFkZCBJU0kg
c3VwcG9ydCBmb3IgaS5NWDkzDQo+IA0KPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVt
YWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3Igb3BlbmluZw0KPiBh
dHRhY2htZW50cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAn
UmVwb3J0IHRoaXMgZW1haWwnDQo+IGJ1dHRvbg0KPiANCj4gDQo+IEhpIEd1b25pdSwNCj4gDQo+
IHRoYW5rcyBmb3IgdGhlIHBhdGNoIHNlcmllcy4NCj4gDQo+IEFtIERvbm5lcnN0YWcsIDI5LiBK
dW5pIDIwMjMsIDAzOjM2OjIxIENFU1Qgc2NocmllYg0KPiBndW9uaXUuemhvdUBvc3MubnhwLmNv
bToNCj4gPiAqKioqKioqKioqKioqKioqKioqKg0KPiA+IEFjaHR1bmcgZXh0ZXJuZSBFLU1haWw6
IMOWZmZuZW4gU2llIEFuaMOkbmdlIHVuZCBMaW5rcyBudXIsIHdlbm4gU2llDQo+ID4gd2lzc2Vu
LCBkYXNzIGRpZXNlIGF1cyBlaW5lciBzaWNoZXJlbiBRdWVsbGUgc3RhbW1lbiB1bmQgc2ljaGVy
IHNpbmQuDQo+ID4gTGVpdGVuIFNpZSBkaWUgRS1NYWlsIGltIFp3ZWlmZWxzZmFsbCB6dXIgUHLD
vGZ1bmcgYW4gZGVuIElULUhlbHBkZXNrIHdlaXRlci4NCj4gPiBBdHRlbnRpb24gZXh0ZXJuYWwg
ZW1haWw6IE9wZW4gYXR0YWNobWVudHMgYW5kIGxpbmtzIG9ubHkgaWYgeW91IGtub3cNCj4gPiB0
aGF0IHRoZXkgYXJlIGZyb20gYSBzZWN1cmUgc291cmNlIGFuZCBhcmUgc2FmZS4gSW4gZG91YnQg
Zm9yd2FyZCB0aGUNCj4gPiBlbWFpbCB0byB0aGUgSVQtSGVscGRlc2sgdG8gY2hlY2sgaXQuICoq
KioqKioqKioqKioqKioqKioqDQo+ID4NCj4gPiBGcm9tOiAiR3Vvbml1Lnpob3UiIDxndW9uaXUu
emhvdUBueHAuY29tPg0KPiA+DQo+ID4gaS5NWDkzIHVzZSBhIGRpZmZlcmVudCBnYXNrZXQgd2hp
Y2ggaGFzIGRpZmZlcmVudCByZWdpc3RlciBkZWZpbml0aW9uDQo+ID4gY29tcGFyZWQgd2l0aCBp
Lk1YOC4gSGVuY2UgaW1wbGVtZW50IHRoZSBnYXNrZXQgY2FsbGJhY2tzIGluIG9yZGVyIHRvDQo+
ID4gYWRkIElTSSBzdXBwb3J0IGZvciBpLk1YOTMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBH
dW9uaXUuemhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+IC0tLQ0K
PiA+ICAuLi4vcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUuYyAgICAgfCAxNSAr
KysrKysrKysrDQo+ID4gIC4uLi9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5o
ICAgICB8ICAyICsrDQo+ID4gIC4uLi9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktZ2Fz
a2V0LmMgICB8IDMwICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA0
NyBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1jb3JlLmMgaW5kZXgNCj4gPiA1MTY1Zjg5NjBj
MmMuLjI3YmQxOGI3ZWU2NSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L254cC9pbXg4LWlzaS9pbXg4LWlzaS1jb3JlLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1jb3JlLmMNCj4gPiBAQCAtMzA3LDYgKzMwNywy
MCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG14Y19pc2lfcGxhdF9kYXRhDQo+IG14Y19pbXg4bXBf
ZGF0YSA9DQo+ID4geyAuaGFzXzM2Yml0X2RtYSAgICAgICAgICAgICAgPSB0cnVlLA0KPiA+ICB9
Ow0KPiA+DQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXhjX2lzaV9wbGF0X2RhdGEgbXhjX2lt
eDkzX2RhdGEgPSB7DQo+ID4gKyAgICAgLm1vZGVsICAgICAgICAgICAgICAgICAgPSBNWENfSVNJ
X0lNWDkzLA0KPiA+ICsgICAgIC5udW1fcG9ydHMgICAgICAgICAgICAgID0gMSwNCj4gPiArICAg
ICAubnVtX2NoYW5uZWxzICAgICAgICAgICA9IDEsDQo+ID4gKyAgICAgLnJlZ19vZmZzZXQgICAg
ICAgICAgICAgPSAwLA0KPiA+ICsgICAgIC5pZXJfcmVnICAgICAgICAgICAgICAgID0gJm14Y19p
bXg4X2lzaV9pZXJfdjIsDQo+ID4gKyAgICAgLnNldF90aGQgICAgICAgICAgICAgICAgPSAmbXhj
X2lteDhfaXNpX3RoZF92MSwNCj4gPiArICAgICAuY2xrcyAgICAgICAgICAgICAgICAgICA9IG14
Y19pbXg4bW5fY2xrcywNCj4gPiArICAgICAubnVtX2Nsa3MgICAgICAgICAgICAgICA9IEFSUkFZ
X1NJWkUobXhjX2lteDhtbl9jbGtzKSwNCj4gPiArICAgICAuYnVmX2FjdGl2ZV9yZXZlcnNlICAg
ICA9IHRydWUsDQo+ID4gKyAgICAgLmdhc2tldF9vcHMgICAgICAgICAgICAgPSAmbXhjX2lteDkz
X2dhc2tldF9vcHMsDQo+ID4gKyAgICAgLmhhc18zNmJpdF9kbWEgICAgICAgICAgPSBmYWxzZSwN
Cj4gPiArfTsNCj4gPiArDQo+ID4gIC8qDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IC0tLS0tDQo+
ID4gLS0gKiBQb3dlciBtYW5hZ2VtZW50DQo+ID4gICAqLw0KPiA+IEBAIC01MTgsNiArNTMyLDcg
QEAgc3RhdGljIGludCBteGNfaXNpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ID4g
KnBkZXYpICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBteGNfaXNpX29mX21hdGNo
W10gPSB7DQo+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJmc2wsaW14OG1uLWlzaSIsIC5kYXRh
ID0gJm14Y19pbXg4bW5fZGF0YSB9LA0KPiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAiZnNsLGlt
eDhtcC1pc2kiLCAuZGF0YSA9ICZteGNfaW14OG1wX2RhdGEgfSwNCj4gPiArICAgICB7IC5jb21w
YXRpYmxlID0gImZzbCxpbXg5My1pc2kiLCAuZGF0YSA9ICZteGNfaW14OTNfZGF0YSB9LA0KPiA+
ICAgICAgIHsgLyogc2VudGluZWwgKi8gfSwNCj4gPiAgfTsNCj4gPiAgTU9EVUxFX0RFVklDRV9U
QUJMRShvZiwgbXhjX2lzaV9vZl9tYXRjaCk7IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUuaA0KPiA+IGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5oIGluZGV4DQo+ID4gNzhj
YTA0N2Q5M2QxLi4yODEwZWJlOWI1ZjcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5oDQo+ID4gKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5oDQo+ID4gQEAgLTE1OCw2
ICsxNTgsNyBAQCBzdHJ1Y3QgbXhjX2dhc2tldF9vcHMgeyAgZW51bSBtb2RlbCB7DQo+ID4gICAg
ICAgTVhDX0lTSV9JTVg4TU4sDQo+ID4gICAgICAgTVhDX0lTSV9JTVg4TVAsDQo+ID4gKyAgICAg
TVhDX0lTSV9JTVg5MywNCj4gPiAgfTsNCj4gPg0KPiA+ICBzdHJ1Y3QgbXhjX2lzaV9wbGF0X2Rh
dGEgew0KPiA+IEBAIC0yOTUsNiArMjk2LDcgQEAgc3RydWN0IG14Y19pc2lfZGV2IHsgIH07DQo+
ID4NCj4gPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBteGNfZ2Fza2V0X29wcyBteGNfaW14OF9nYXNr
ZXRfb3BzOw0KPiA+ICtleHRlcm4gY29uc3Qgc3RydWN0IG14Y19nYXNrZXRfb3BzIG14Y19pbXg5
M19nYXNrZXRfb3BzOw0KPiA+DQo+ID4gIGludCBteGNfaXNpX2Nyb3NzYmFyX2luaXQoc3RydWN0
IG14Y19pc2lfZGV2ICppc2kpOyAgdm9pZA0KPiA+IG14Y19pc2lfY3Jvc3NiYXJfY2xlYW51cChz
dHJ1Y3QgbXhjX2lzaV9jcm9zc2JhciAqeGJhcik7IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWdhc2tldC5jDQo+ID4gYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1nYXNrZXQuYyBpbmRleA0K
PiA+IDFkNjMyZGM2MDY5OS4uNTBhYzFkM2EyYjZmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWdhc2tldC5jDQo+ID4gKysrIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktZ2Fza2V0LmMNCj4g
PiBAQCAtNTMsMyArNTMsMzMgQEAgY29uc3Qgc3RydWN0IG14Y19nYXNrZXRfb3BzIG14Y19pbXg4
X2dhc2tldF9vcHMgPSB7DQo+ID4gICAgICAgLmVuYWJsZSA9IG14Y19pbXg4X2dhc2tldF9lbmFi
bGUsDQo+ID4gICAgICAgLmRpc2FibGUgPSBteGNfaW14OF9nYXNrZXRfZGlzYWJsZSwgIH07DQo+
ID4gKw0KPiA+ICsvKg0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAtLS0tLQ0KPiA+IC0tICsgKiBp
Lk1YOTMgZ2Fza2V0DQo+ID4gKyAqKi8NCj4gPiArDQo+ID4gKyNkZWZpbmUgRElTUF9NSVhfQ0FN
RVJBX01VWCAgICAgICAgICAgICAgICAgICAgIDB4MzANCj4gDQo+IFdoaWNoIHBlcmlwaGVyYWwg
ZG9lcyB0aGlzIHJlZmVyIHRvPyBJIHdvdWxkIGFzc3VtZSBpdCBpcyB0aGUgTWVkaWEgTWl4IERv
bWFpbg0KPiBCbG9jayBDb250cm9sLCBidXQgdGhlcmUgaXMgbm8gcmVnaXN0ZXIgYXQgMHgzMCBt
ZW50aW9uZWQgaW4gdGhlIHJlZmVyZW5jZSBtYW51YWwuDQo+IFlvdSBoYXZlIHNvbWUgYWRkaXRp
b25hbCBpbmZvcm1hdGlvbj8NCj4gDQo+IEFsc28gd2hpY2ggdHlwZSBvZiBpbnB1dCBkaWQgeW91
IHVzZT8gTUlQSS1DU0kyIG9yIHBhcmFsbGVsIGludGVyZmFjZT8NCg0KWWVzLCBpdCdzIE1lZGlh
IE1peCBEb21haW4gQmxvY2sgQ29udHJvbChJIG5hbWUgaXQgRGlzcF9NaXggZHVlIHRvIGhpc3Rv
cnkgcmVhc29uKS4NCg0KSSBjaGVjayBSTSBpbiBOWFAgV2Vic2l0ZSBhbmQgZG9uJ3QgZm91bmQg
MHgzMCBhcyB5b3Ugc2FpZCBzaW5jZSBpdCdzIFJFVjIsIG5vdCBsYXRlc3Qgb25lIHdoaWNoDQpz
dGlsbCB1bmRlciByZXZpZXcuDQoNClRoZSBpbnB1dCBpcyBNSVBJIENTSS0yIGJ5IGRlZmF1bHQu
KFdlIHVzZSBkZWZhdWx0IHZhbHVlIGluIHRoZSBzZXJpYWxzKQ0KDQo+IA0KPiBUaGFua3MgYW5k
IGJlc3QgcmVnYXJkcywNCj4gQWxleGFuZGVyDQo+IA0KPiA+ICsjZGVmaW5lIERJU1BfTUlYX0NB
TUVSQV9NVVhfREFUQV9UWVBFKHgpICAgICAgICAoKCh4KSAmIDB4M2YpIDw8IDMpDQo+ID4gKyNk
ZWZpbmUgRElTUF9NSVhfQ0FNRVJBX01VWF9HQVNLRVRfRU5BQkxFICAgICAgIEJJVCgxNikNCj4g
PiArc3RhdGljIHZvaWQgbXhjX2lteDkzX2dhc2tldF9lbmFibGUoc3RydWN0IG14Y19pc2lfZGV2
ICppc2ksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCB2NGwyX21idXNfZnJhbWVfZGVzYw0KPiAqZmQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB2NGwyX21idXNfZnJhbWVmbXQNCj4gKmZtdCwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdW5zaWduZWQgaW50IHBv
cnQpIHsNCj4gPiArICAgICB1MzIgdmFsOw0KPiA+ICsNCj4gPiArICAgICB2YWwgPSBESVNQX01J
WF9DQU1FUkFfTVVYX0RBVEFfVFlQRShmZC0+ZW50cnlbMF0uYnVzLmNzaTIuZHQpOw0KPiA+ICsg
ICAgIHZhbCB8PSBESVNQX01JWF9DQU1FUkFfTVVYX0dBU0tFVF9FTkFCTEU7DQo+ID4gKyAgICAg
cmVnbWFwX3dyaXRlKGlzaS0+Z2Fza2V0LCBESVNQX01JWF9DQU1FUkFfTVVYLCB2YWwpOyB9DQo+
ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBteGNfaW14OTNfZ2Fza2V0X2Rpc2FibGUoc3RydWN0IG14
Y19pc2lfZGV2ICppc2ksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgcG9ydCkgew0KPiA+ICsgICAgIHJlZ21hcF93cml0ZShpc2ktPmdhc2tldCwg
RElTUF9NSVhfQ0FNRVJBX01VWCwgMCk7IH0NCj4gPiArDQo+ID4gK2NvbnN0IHN0cnVjdCBteGNf
Z2Fza2V0X29wcyBteGNfaW14OTNfZ2Fza2V0X29wcyA9IHsNCj4gPiArICAgICAuZW5hYmxlID0g
bXhjX2lteDkzX2dhc2tldF9lbmFibGUsDQo+ID4gKyAgICAgLmRpc2FibGUgPSBteGNfaW14OTNf
Z2Fza2V0X2Rpc2FibGUsIH07DQo+IA0KPiANCj4gLS0NCj4gVFEtU3lzdGVtcyBHbWJIIHwgTcO8
aGxzdHJhw59lIDIsIEd1dCBEZWxsaW5nIHwgODIyMjkgU2VlZmVsZCwgR2VybWFueQ0KPiBBbXRz
Z2VyaWNodCBNw7xuY2hlbiwgSFJCIDEwNTAxOA0KPiBHZXNjaMOkZnRzZsO8aHJlcjogRGV0bGVm
IFNjaG5laWRlciwgUsO8ZGlnZXIgU3RhaGwsIFN0ZWZhbiBTY2huZWlkZXINCj4gaHR0cDovL3d3
dy50cS1ncm91cC5jb20vDQo+IA0KDQo=
