Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C06E295A3A
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 10:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507593AbgJVI0B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 04:26:01 -0400
Received: from mail-eopbgr1400138.outbound.protection.outlook.com ([40.107.140.138]:19552
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2443800AbgJVI0A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 04:26:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZrXhWtEC31Asyksz+9tJMonl2bFw76Tsae8P+sT9axUD4Hyvk+R4y06QsduGeIIJry9cdvOTwVKzh2Twwk3PQXBwf4lvkqcdsu90JI8sOmeQmBllRrUiRP6xXo8m5darnAtyjEuAzRL+1kCtNyHnQkebf8ZtwzYSFQJiBjy+/uWawJcTaPgyVmHm7GIQm+uciY4+TKNIjJYlYUfgmsXHcdmXVgVKzZ1UyOyTp/AOTMFBxXk8Bzjky4CUNH9tgK5QXt59ne1pG3vELj2XzRZXJGO500zkKWWgdI/ER2d97Eo7CX79gv3tZNHFVdDV83iGjnCvCmGJPeNCTYFShOVIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GIEgc93TahA6e2mc8PW561VrSrV4zSfujaSn/uzhqU=;
 b=kQ0+7WrLMHP1u2fka/BjvJuClDjYeAKJrd9j412peCrpiHiT7wFudKwQdhuBv5pFcx2tJKSABKDI5DEmdtjiWVjjrX9n6BGSsaOjEd5t2N/Y1p/+fm/wNE2GsRvClz/UVcOShAQCZ/Sjml6Bm6vtLIAGW4YfmaKDm2PVd6q7X/crlduSYzi6gKBJPWyQiW5U+db8L/kl+xQfFx0CdcG1ai1ZM1iUhDY3KxSOjEDMYZrtbyk2reyhuuWkEQq2Kt/19/8x8jYwNsaiKP/50C1XtdfvxceaT6ECnwwTHKKoliFZPwy2628TNpSqsA4jZamMlu/44t/YqDo4zkO9f1P1GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GIEgc93TahA6e2mc8PW561VrSrV4zSfujaSn/uzhqU=;
 b=DN0l17kb812kEyiMUYLyM/lma6qB+7x0zugJLdyffyXQjxqeC2KVZwU4QhdairTvI4PBx9UNxZEE8EmY3oBRU7D/W98pbILNl3p81Y9GlIq/HweSb7c1dyYMu2OhYNbJgbDxN2yyL7MndRjezqsZ2gh8bXwOnrTyRNGTJ7HUsok=
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com (2603:1096:603:3a::20)
 by OSBPR01MB3574.jpnprd01.prod.outlook.com (2603:1096:604:45::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Thu, 22 Oct
 2020 08:25:56 +0000
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2]) by OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 08:25:56 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 0/5] Add r8a77965 DRIF support
Thread-Topic: [PATCH v5 0/5] Add r8a77965 DRIF support
Thread-Index: AQHWp7GUlFkMgXXlKEK8/YS6xvIWAKmilv6AgACzVWA=
Date:   Thu, 22 Oct 2020 08:25:55 +0000
Message-ID: <OSAPR01MB2740C7430A7F512809B17AABC21D0@OSAPR01MB2740.jpnprd01.prod.outlook.com>
References: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
 <20201021214319.GO3942@pendragon.ideasonboard.com>
In-Reply-To: <20201021214319.GO3942@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [2.29.91.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: debeaa62-f6d9-46c1-6e4e-08d876641901
x-ms-traffictypediagnostic: OSBPR01MB3574:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB35742B94A418F37ED98D7B5CC21D0@OSBPR01MB3574.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JbnlvFq1NBRGfEQkJZEdLM7o7mxawcBIHjqnPOq34lgzy9NfX+P0f+xd3gPFL6d0HxGCf/oQ5z5sA1Pr+XxhT3ENewdS8syNB5nYdx68nGbkyfbp004xmBVB9LeT9SpeVCSPI6W95qr2dWijdy65GEA0o/IbBwFAGxAnUOOG3Wy2w2Syr3VmuCaQFwj+5QyJ8OE1EFjGeCGMUwgzk0IBWuJHgZR5BGCq5kfyo4hJfDKaJEpeSQt+/LAs/Z0TM7LNW44xksGG4tUBoE7f4TqA5AUL6zWIOFrpvfh6mIIFbI5/2UIXvH/9rDr9bNIAevjZJr1aLlCXObtTaD1fjAJO5g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2740.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(2906002)(53546011)(107886003)(316002)(6506007)(4326008)(6916009)(9686003)(478600001)(8936002)(7696005)(33656002)(86362001)(5660300002)(54906003)(83380400001)(8676002)(52536014)(66446008)(26005)(66556008)(76116006)(66476007)(66946007)(71200400001)(64756008)(186003)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 95TFPbGsYWacPhTRSQtjS/15mxMawzlcvnodA9/jlwAXJd4UDPsyJq9jCtdfpZG1dMAQpImpZzXUJzHihN89iqSBvB87EnelHgFzn/dBVn7Hm0yhvplVyyVWgsLZETSrc2J/zO9daw8fdS5Iu3TCja9IFaWzPTizQOJyaiTcb0bC5EMSRvV/u0e42jPJdWQ6azU9BsfBtw5Qr1H7+9SHddF9cn9mIl52/kvXtJICIQrhPnypJnN0GY3DLYT0ZpYJ+GxuEH1ma1bXSSkvIlMM5idD+bfX6sbK6CH1A3nwifmyz8wVDt3YUSUVG+3VUm0CWoJkq2/aBwxAT3Ew1TA0NwdO9Zg4AcWNvSdS/SwuZ73DYSKfeiZFIyUqMaBiWankNPZfQ4bzhkXchjfKQWI380C03sEr/buc409rKfvUG0AXvNWnmcFzVOl/brZKTSj9A5tgb5Fz0vhMLGlCVihRodPV0NM0ckkPIR8C0IuTTwdZMh75ZGq+1EMbwYSAiIgTfUO18aHH1HZZPnJYwxDMzEz2oVHRqHx7XSFRCrwEHFEDMyiqoBesqD2KDQpO29EIMFHnK00wieq222h26GnEUERq81g7jolUGaoeZ5ZcYz7DWUIWDKjWTzjeQNq7sgEqfB5gOfixGiuYdzUebkrpSA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2740.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: debeaa62-f6d9-46c1-6e4e-08d876641901
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2020 08:25:55.9857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZkN8FY3t6hY4MoTbdxEHHrfTMf/5fs1loqFLjfUcC5sP0CCrpCTldcUL6JgqVW2jeva+YzMCFMHDnCtWDp8B/e/xQiU3gJaj+fQHps4c2aI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3574
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IDIxIE9jdG9iZXIgMjAyMCAyMjo0Mw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHY1IDAvNV0gQWRkIHI4YTc3OTY1IERSSUYgc3VwcG9ydA0KPiANCj4g
SGkgRmFicml6aW8sDQo+IA0KPiBPbiBXZWQsIE9jdCAyMSwgMjAyMCBhdCAwMjo1MzoyN1BNICsw
MTAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6DQo+ID4gRGVhciBBbGwsDQo+ID4NCj4gPiB0aGlz
IHNlcmllcyBpcyB0byBhZGQgRFJJRiBzdXBwb3J0IGZvciB0aGUgcjhhNzc5NjUNCj4gPiAoYS5r
LmEuIFItQ2FyIE0zLU4pLiBWZXJzaW9uIDUgZml4ZXMgYSB3YXJuaW5nIHJlcG9ydGVkDQo+ID4g
YnkgJ21ha2UgZHRfYmluZGluZ19jaGVjaycsIGFzIHJlcG9ydGVkIGJ5IFJvYi4NCj4gDQo+IFBh
dGNoIDEvNSB0byA0LzUgdGFrZW4gaW4gbXkgdHJlZSwgSSdsbCBzZW5kIGEgcHVsbCByZXF1ZXN0
IHRvDQo+IGxpbnV4LW1lZGlhIHdoZW4gdGhlIG1lcmdlIHdpbmRvdyBjbG9zZXMuIEkgZXhwZWN0
IEdlZXJ0IHRvIGhhbmRsZSA1LzUuDQoNCkdyZWF0LCB0aGFuayB5b3UuDQoNCkZhYg0KDQo+IA0K
PiA+IEZhYnJpemlvIENhc3RybyAoNSk6DQo+ID4gICBNQUlOVEFJTkVSUzogVXBkYXRlIE1BSU5U
QUlORVJTIGZvciBSZW5lc2FzIERSSUYgZHJpdmVyDQo+ID4gICBtZWRpYTogZHQtYmluZGluZ3M6
IG1lZGlhOiByZW5lc2FzLGRyaWY6IENvbnZlcnQgdG8ganNvbi1zY2hlbWENCj4gPiAgIG1lZGlh
OiBkdC1iaW5kaW5nczogbWVkaWE6IHJlbmVzYXMsZHJpZjogQWRkIHI4YTc3OTkwIHN1cHBvcnQN
Cj4gPiAgIG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6IHJlbmVzYXMsZHJpZjogQWRkIHI4YTc3
OTY1IHN1cHBvcnQNCj4gPiAgIGFybTY0OiBkdHM6IHI4YTc3OTY1OiBBZGQgRFJJRiBzdXBwb3J0
DQo+ID4NCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL3JlbmVzYXMsZHJpZi50eHQgICAgICAgICAg
IHwgMTc3IC0tLS0tLS0tLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9yZW5lc2FzLGRyaWYu
eWFtbCAgICAgICAgICB8IDI3OSArKysrKysrKysrKysrKysrKysNCj4gPiAgTUFJTlRBSU5FUlMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstDQo+ID4gIGFyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2NS5kdHNpICAgICB8IDEyMCArKysrKysrKw0KPiA+
ICA0IGZpbGVzIGNoYW5nZWQsIDQwMSBpbnNlcnRpb25zKCspLCAxNzkgZGVsZXRpb25zKC0pDQo+
ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NA0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVkaWEvcmVuZXNhcyxkcmlmLnR4dA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3JlbmVzYXMsZHJpZi55YW1sDQo+
IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
