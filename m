Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 113F22DB11
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 12:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfE2Kya (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 06:54:30 -0400
Received: from mail-oln040092069023.outbound.protection.outlook.com ([40.92.69.23]:8935
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725894AbfE2Kya (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 06:54:30 -0400
Received: from AM5EUR02FT056.eop-EUR02.prod.protection.outlook.com
 (10.152.8.54) by AM5EUR02HT133.eop-EUR02.prod.protection.outlook.com
 (10.152.9.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16; Wed, 29 May
 2019 10:54:27 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com (10.152.8.60) by
 AM5EUR02FT056.mail.protection.outlook.com (10.152.9.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Wed, 29 May 2019 10:54:27 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::883e:1bd6:cd36:5fb0]) by VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::883e:1bd6:cd36:5fb0%4]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 10:54:27 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
CC:     Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: dt-bindings: rockchip: Document RK3328 VPU binding
Thread-Topic: [PATCH] media: dt-bindings: rockchip: Document RK3328 VPU
 binding
Thread-Index: AQHVFgzihlhmdNUSwkKzxCU6ATy8kQ==
Date:   Wed, 29 May 2019 10:54:27 +0000
Message-ID: <VI1PR03MB4206A833FF54A3235571896CAC1F0@VI1PR03MB4206.eurprd03.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P193CA0088.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::29) To VI1PR03MB4206.eurprd03.prod.outlook.com
 (2603:10a6:803:51::23)
x-incomingtopheadermarker: OriginalChecksum:A37DCEC0744D90776D608EE1B853CCB01D945B1C56F5D83F60FBFFE7190CF193;UpperCasedChecksum:BCA00BE91E788EF7747F9C0F3BC2D1C4FB5121767231C16A3BDDE41AA21B026F;SizeAsReceived:7665;Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [8XddgOlttuYKrvkyvGFKAR8D4EwiBt50]
x-microsoft-original-message-id: <20190529105409.23451-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);SRVR:AM5EUR02HT133;
x-ms-traffictypediagnostic: AM5EUR02HT133:
x-microsoft-antispam-message-info: OpOkS7wTfOIL24rblTBMu0c9zLFBmICSHEM4mTrzlzj0LrmJj4GH9pzyEseBqk2Gk4FpKe3QiyU1WBiIM4Lhb6302/36mJF5Ic9viF4sKGtWk1RsFupY21YvsLb7D2tsy5G89SMDwCaAJttrB+DfQjFiyhTWEeapxTbzr7nc9kSTp3FKN5Iqae9aQygScT03
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 096f17cb-7919-43b3-67ff-08d6e42403fd
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 10:54:27.1629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT133
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VXBkYXRlIGRldmljZXRyZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBSb2NrY2hpcCBWUFUg
b24gUkszMzI4Lg0KDQpTaWduZWQtb2ZmLWJ5OiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28u
c2U+DQotLS0NCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9yb2NrY2hpcC12cHUudHh0
IHwgMTggKysrKysrKysrKysrKysrKy0tDQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvcm9ja2NoaXAtdnB1LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9yb2NrY2hpcC12cHUudHh0DQppbmRleCAzNWRjNDY0YWQ3Yzgu
LjMzOTI1MmQ5YzUxNSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9yb2NrY2hpcC12cHUudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvcm9ja2NoaXAtdnB1LnR4dA0KQEAgLTEsMTQgKzEsMTcgQEANCiBk
ZXZpY2UtdHJlZSBiaW5kaW5ncyBmb3Igcm9ja2NoaXAgVlBVIGNvZGVjDQogDQogUm9ja2NoaXAg
KFZpZGVvIFByb2Nlc3NpbmcgVW5pdCkgcHJlc2VudCBpbiB2YXJpb3VzIFJvY2tjaGlwIHBsYXRm
b3JtcywNCi1zdWNoIGFzIFJLMzI4OCBhbmQgUkszMzk5Lg0KK3N1Y2ggYXMgUkszMjg4LCBSSzMz
MjggYW5kIFJLMzM5OS4NCiANCiBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KIC0gY29tcGF0aWJsZTog
dmFsdWUgc2hvdWxkIGJlIG9uZSBvZiB0aGUgZm9sbG93aW5nDQogCQkicm9ja2NoaXAscmszMjg4
LXZwdSI7DQorCQkicm9ja2NoaXAscmszMzI4LXZwdSI7DQogCQkicm9ja2NoaXAscmszMzk5LXZw
dSI7DQogLSBpbnRlcnJ1cHRzOiBlbmNvZGluZyBhbmQgZGVjb2RpbmcgaW50ZXJydXB0IHNwZWNp
ZmllcnMNCi0tIGludGVycnVwdC1uYW1lczogc2hvdWxkIGJlICJ2ZXB1IiBhbmQgInZkcHUiDQor
LSBpbnRlcnJ1cHQtbmFtZXM6IHNob3VsZCBiZQ0KKwkJInZlcHUiLCAidmRwdSIgb24gUkszMjg4
IGFuZCBSSzMzOTksDQorCQkidmRwdSIgb24gUkszMzI4Lg0KIC0gY2xvY2tzOiBwaGFuZGxlIHRv
IFZQVSBhY2xrLCBoY2xrIGNsb2Nrcw0KIC0gY2xvY2stbmFtZXM6IHNob3VsZCBiZSAiYWNsayIg
YW5kICJoY2xrIg0KIC0gcG93ZXItZG9tYWluczogcGhhbmRsZSB0byBwb3dlciBkb21haW4gbm9k
ZQ0KQEAgLTI3LDMgKzMwLDE0IEBAIFNvQy1zcGVjaWZpYyBEVCBlbnRyeToNCiAJCXBvd2VyLWRv
bWFpbnMgPSA8JnBvd2VyIFJLMzI4OF9QRF9WSURFTz47DQogCQlpb21tdXMgPSA8JnZwdV9tbXU+
Ow0KIAl9Ow0KKw0KKwl2cHU6IHZpZGVvLWNvZGVjQGZmMzUwMDAwIHsNCisJCWNvbXBhdGlibGUg
PSAicm9ja2NoaXAscmszMzI4LXZwdSI7DQorCQlyZWcgPSA8MHgwIDB4ZmYzNTAwMDAgMHgwIDB4
ODAwPjsNCisJCWludGVycnVwdHMgPSA8R0lDX1NQSSA5IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0K
KwkJaW50ZXJydXB0LW5hbWVzID0gInZkcHUiOw0KKwkJY2xvY2tzID0gPCZjcnUgQUNMS19WUFU+
LCA8JmNydSBIQ0xLX1ZQVT47DQorCQljbG9jay1uYW1lcyA9ICJhY2xrIiwgImhjbGsiOw0KKwkJ
cG93ZXItZG9tYWlucyA9IDwmcG93ZXIgUkszMzI4X1BEX1ZQVT47DQorCQlpb21tdXMgPSA8JnZw
dV9tbXU+Ow0KKwl9Ow0KLS0gDQoyLjE3LjENCg0K
