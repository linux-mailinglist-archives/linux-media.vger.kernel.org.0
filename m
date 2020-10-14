Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF6E28E2D9
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 17:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbgJNPK5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 11:10:57 -0400
Received: from mail-eopbgr1400114.outbound.protection.outlook.com ([40.107.140.114]:37663
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726006AbgJNPK5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 11:10:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGBL5gjiaytU5bsFWTcA1wYjwWNnfMboofCGodE3wYk9Q38ZhGWmcyG/K/ogG6ZhFLcDbmsz48UN21/s/AK1d2L9gCQVVYYiCNpvvWMQnwAkwEA68SJKY1JVFIGz17DbpnYrp9r+CYcfEAwmSpWfwr5kCPmPOo5SpMGSWQ+uAQealgg3tMuVtRssSa6OuH0HDc/13TyNBlBtHrofw8pQCjFHfVc9MlannQ9Frmv73KOWu3zkR/z8y2s2DWhexQE1H4qoWRFk3V24VVRiL/uo528k0WrrQSX9o8viQDxzT5WjVV0hKFRHT70qcdKQl0q3+T4RMVGHDxUY/kXvTt/HEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr11fah/eT6mGDtzl5hmM8qyf+LTf2JMMZwPq7vxvQU=;
 b=njpyRSCDEOfX1MZMAgnqh4OOaa+yWE8UgdcrUu9Xk+V3TeXEaqMKFhNn3hlOjpuBT3Ev0l6zTNq3Yjfim+VINgSaeZs8tAYrrOqLrhrSbAS5xxZRpjaoEK4A/DaQwkcTMvXaN7reZKBhAyAUXbvzeAxfI6E/i698aDR7eV5LpxDkJTXOgkTRRVh308pNH5p75caTYmjuwEtath9zsuhMEKR+ZIW0wBJ/8mlAZb8aoAiclhH4hx8/tQjP4zVJ1pRvY9Zme8nUJmwwbnCHQPPMcpl3ngsWRnF3c1gte8NRPMEfAzUbVGEzHTvZkW8VlxSgEh+5gOwqIzjuyDuIFEGaZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr11fah/eT6mGDtzl5hmM8qyf+LTf2JMMZwPq7vxvQU=;
 b=M5bOI5DkulRrobIw7bPHhmotGohzbaSytnFH+OOXohmcOytvXu0ZaENHzcXQNWUGci86/nZO6r8uXso2WYRuLKKLator5fiFdrx6g/pvC465YVvdCVkOPMJ3MjnR5EC2vuflJl2Efu+pdkQ7z7Sv6FYAiHha+fcKTS24NmHwXek=
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com (2603:1096:603:3a::20)
 by OSAPR01MB4626.jpnprd01.prod.outlook.com (2603:1096:604:67::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Wed, 14 Oct
 2020 15:10:51 +0000
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2]) by OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2%7]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 15:10:51 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v3 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Thread-Topic: [PATCH v3 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Thread-Index: AQHWoXHV0Hm+Vql8mkuPsDjEtpWJ/KmXHBsAgAAPwYA=
Date:   Wed, 14 Oct 2020 15:10:51 +0000
Message-ID: <OSAPR01MB2740A3D25AFE8A750B72A01EC2050@OSAPR01MB2740.jpnprd01.prod.outlook.com>
References: <20201013150150.14801-1-fabrizio.castro.jz@renesas.com>
 <20201013150150.14801-3-fabrizio.castro.jz@renesas.com>
 <CAMuHMdU-X0qmM+fVTV9czNa5++c9-N9GRowzaV9c+tcyXyrPHg@mail.gmail.com>
In-Reply-To: <CAMuHMdU-X0qmM+fVTV9czNa5++c9-N9GRowzaV9c+tcyXyrPHg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ca5d1e22-c45b-4294-5c1d-08d8705356e9
x-ms-traffictypediagnostic: OSAPR01MB4626:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB46266E40D7223B77E0E3F216C2050@OSAPR01MB4626.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fTEnLpcl4mjUeW6y25rpIhRmxfYJXe4fYYgvRhpOXntWHU9zoBzdnDVzVV9iyvIrbBFOtfPwAk1cl+tlMXG7mhWMuE4Kin4b5idS/HcPVtUZ+0N6XodTHq82HaeNIN/s+eDeXfWy8rbYAjEIinK+bbB4KdOfpaXf0ASv8SqDfaXGnPWY5t5k5X3CIcylE2u4hobxtx/NfBnrwOSfY9cUaBPpmHPij/+7xFrmsHqeGwOAOdyZVYg7ZJAaNxJY5ZUHVVVst04zyvu/LltdPaPkMs849PvU4IoVBeepcIBamwa+R2AKuCRC0ukvPYEoL0l7g+Fo7JdV1MTwVvEjvZlItw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2740.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39850400004)(136003)(346002)(55016002)(66476007)(76116006)(64756008)(66446008)(66556008)(66946007)(5660300002)(4326008)(26005)(316002)(52536014)(54906003)(8676002)(83380400001)(8936002)(9686003)(86362001)(478600001)(2906002)(71200400001)(6506007)(53546011)(33656002)(6916009)(7696005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 3t6aV+1cnZz5IXZosa18uDRuAyy6kQhlRUNiERqlgyr07GU13SV6X72wmBye+2FybMLOGgcjVRoT02ciDypzghI3a5Gn2dydxBWuBtHlm3D9KALRFLN25XegjCSn2oY26pDlM47VvYDb50B2f3CA1wv+rKQV1eHM5lCFpwb4UemScutsOsaGB9xFjpS2YmOQB5G7hGqaBnv9h4wK9wzoR3tz4yHe+N+giYLD9dUX+t3RHLH1xirirvzuHJA2S8/JAvnEr/xcpE05nhEtQVY3hCJBkRA2EAoAO3tnOdNooSaJdj+50ISzEURB8A3QNw01oCrWHY76C96tKTm+Komh7av1OKpfNfYBo6LXrhRXoHWesbVXwIE9jb87154U5I3bBozImAdspQKzoq6Gg0kk4HPGrJXdRy8f6fBcaF9vXjbsffAeO/k+ObQAlymixYSsQOj8/vBRRNUo6hbTvv7naC8b8yB3g2OSpenVJjmNRwrQpIx0WapaxINjEoTonp/cVmY8y53BzEw6g4eO2EZz+90pn59KbA71rVxwxey/ihb5lMHp+YZEYJDscv5feBncRYdmcpeOZ3jptFcnMqQ6ymX6CFnKECk9fP7TJVzBN+/2I+lKWwiAloLREniEoycdPGtkXySz8VmOdcW5J8dOPQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2740.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5d1e22-c45b-4294-5c1d-08d8705356e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2020 15:10:51.4256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lRhUOGTadm4B0DC6FxDaf3IcH1tTN7AygykS01lSZzv90A/aGFF9pZR6P5/Ar8P/eSA5fM1FMVD366jIvN295hT1hjxy+o1ZK7NKEc+4bUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4626
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxNCBPY3RvYmVy
IDIwMjAgMTQ6NDANCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAyLzVdIG1lZGlhOiBkdC1iaW5k
aW5nczogbWVkaWE6IHJlbmVzYXMsZHJpZjogQ29udmVydA0KPiB0byBqc29uLXNjaGVtYQ0KPg0K
PiBIaSBGYWJyaXppbywNCj4NCj4gT24gVHVlLCBPY3QgMTMsIDIwMjAgYXQgNTowMiBQTSBGYWJy
aXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4gd3JvdGU6DQo+
ID4gQ29udmVydCB0aGUgUmVuZXNhcyBEUklGIGJpbmRpbmdzIHRvIERUIHNjaGVtYSBhbmQgdXBk
YXRlDQo+ID4gTUFJTlRBSU5FUlMgYWNjb3JkaW5nbHkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4NCj4gPiBS
ZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtDQo+IGxhZC5yakBi
cC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+IC0tLQ0KPiA+IHYyLT4zOg0KPiA+ICog
UmVtb3ZlZCB0aGUgZGVmaW5pdGlvbiBvZiBwaW5jdHJsLTAgYW5kIHBpbmN0cmwtbmFtZXMsIGFz
DQo+ID4gICBzdWdnZXN0ZWQgYnkgR2VlcnQNCj4gPiAqIEFkZGVkICJwb3dlci1kb21haW5zIiB0
byB0aGUgbGlzdCBvZiByZXF1aXJlZCBwcm9wZXJ0aWVzLA0KPiA+ICAgYXMgc3VnZ2VzdGVkIGJ5
IEdlZXJ0DQo+ID4gKiBSZXdvcmtlZCB0aGUgY29uZGl0aW9uYWwgcmVxdWlyZW1lbnRzLCBHZWVy
dCwgd2hhdCBkbyB5b3UNCj4gPiAgIHRoaW5rPw0KPg0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUh
DQo+DQo+DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9yZW5lc2FzLGRyaWYueWFtbA0KPg0KPiA+ICthbGxPZjoNCj4g
PiArICAtIGlmOg0KPiA+ICsgICAgICByZXF1aXJlZDoNCj4gPiArICAgICAgICAtIHJlbmVzYXMs
cHJpbWFyeS1ib25kDQo+ID4gKyAgICB0aGVuOg0KPiA+ICsgICAgICByZXF1aXJlZDoNCj4gPiAr
ICAgICAgICAtIHBpbmN0cmwtMA0KPiA+ICsgICAgICAgIC0gcGluY3RybC1uYW1lcw0KPiA+ICsg
ICAgICAgIC0gcG9ydA0KPiA+ICsNCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICByZXF1aXJlZDoN
Cj4gPiArICAgICAgICAtIHBvcnQNCj4gPiArICAgIHRoZW46DQo+ID4gKyAgICAgIHJlcXVpcmVk
Og0KPiA+ICsgICAgICAgIC0gcGluY3RybC0wDQo+ID4gKyAgICAgICAgLSBwaW5jdHJsLW5hbWVz
DQo+ID4gKw0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIG5vdDoNCj4gPiArICAgICAgICByZXF1
aXJlZDoNCj4gPiArICAgICAgICAgIC0gcG9ydA0KPiA+ICsgICAgdGhlbjoNCj4NCj4gVGhpcyBj
YW4ganVzdCBiZSBhbiAiZWxzZSIgYnJhbmNoIGZvciB0aGUgcHJldmlvdXMgImlmIiBzdGF0ZW1l
bnQ/DQoNClllcywgaXQncyBlcXVpdmFsZW50LiBJJ2xsIHNlbmQgb3V0IHY0IHRvIHRhY2tsZSB0
aGlzLg0KDQpUaGFua3MsDQpGYWINCg0KPg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsg
ICAgICAgIHBpbmN0cmwtMDogZmFsc2UNCj4gPiArICAgICAgICBwaW5jdHJsLW5hbWVzOiBmYWxz
ZQ0KPg0KPiBXaXRoIHRoZSBhYm92ZSBmaXhlZC9jbGFyaWZpZWQ6DQo+IFJldmlld2VkLWJ5OiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPg0KPiBHcntvZXRq
ZSxlZXRpbmd9cywNCj4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4NCj4gLS0N
Cj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEz
MiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4NCj4gSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0K
PiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBHbWJI
LCBHZXNjaGFlZnRzZnVlaHJlci9QcmVzaWRlbnQ6IENhcnN0ZW4gSmF1Y2gsIFNpdHogZGVyIEdl
c2VsbHNjaGFmdC9SZWdpc3RlcmVkIG9mZmljZTogRHVlc3NlbGRvcmYsIEFyY2FkaWFzdHJhc3Nl
IDEwLCA0MDQ3MiBEdWVzc2VsZG9yZiwgR2VybWFueSwgSGFuZGVsc3JlZ2lzdGVyL0NvbW1lcmNp
YWwgUmVnaXN0ZXI6IER1ZXNzZWxkb3JmLCBIUkIgMzcwOCBVU3QtSUROci4vVGF4IGlkZW50aWZp
Y2F0aW9uIG5vLjogREUgMTE5MzUzNDA2IFdFRUUtUmVnLi1Oci4vV0VFRSByZWcuIG5vLjogREUg
MTQ5Nzg2NDcNCg==
