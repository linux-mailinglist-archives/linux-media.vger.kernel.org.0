Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB1564525
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 12:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727206AbfGJKXQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 06:23:16 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:55634 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726097AbfGJKXP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 06:23:15 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 45129C0177;
        Wed, 10 Jul 2019 10:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1562754195; bh=tQoK3Kp8+419WuKaJrjc59MzB5E+W/pcfc+oj3uRV9Y=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=mVJLxsQodjjCAezti7Zxp3ofWTbXuiaAovd0r603mH9LmRVDukA3+qrfTD/Q/TmGe
         h3wblJ063HS2m0lBn4GHBmzjSzDHEOoMwPLh9OtQJF74cDea1qnGmnfILeFZ0AuqXl
         SDxYbrNJSBGc8/nLAqW5f/e/APxT0b4pC1MYJ2nxvsZJi96K/vwKyo9mfSqwP41tsk
         F2f/ETrzqJ6ZlThme4/Po428x17wk9vhiKFY24YSZ4Uae5DD0mRNIemGnkxPE1yf/H
         NCLEcbVmfBB9n2N4ckgicBNgAlDwRWuPDa261x8ppCzKcNTUDH4YGNRSb3Jmq4Ikxc
         63WgEs1hMJiQQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id CDDFAA0091;
        Wed, 10 Jul 2019 10:23:12 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 10 Jul 2019 03:23:12 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 10 Jul 2019 03:23:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moAmI1iYDV7q2JL71yUAKQksCgvmww3dmvdMPpoSEGj9SnX6xFGCAP0mszAm2FNOujyNgcO26K3m1jklo4qf9r6hX3DAveZOB4Y+2HM5h4IB/2yy5T4gaRudE3kNk2hWRa7R+Am02jIyidKbSKQ997jCIOacnw28Gl0UkBcRijgmznHFacd7hA25Lu9vB4BiRYjhY9zxSAF4SU9BXaUTXc573w4sYS86d/dwtRO+p0XaUvZhf0hcV5dJTWD2kB6q1JPskJtZBoyJU57UBfGC/quBC8wOTyvSQldlFJ5ouV8Ulh7nWvSjrsc3KNXce8fbMQDf6I/TJ9KaxTPmESyW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQoK3Kp8+419WuKaJrjc59MzB5E+W/pcfc+oj3uRV9Y=;
 b=M75m7Dc9VEM5tixSnyMHP4BqHkfVR7xVHbEuKG2z/nFLbd/ScvJYb5WUrL4ohqdhPz63IUiPRPAgwR+4U+kf87zQ//lQZ8XpHL3Gifo1DooQ/Lu4KYNa9LClG+9raWAs/aRgRj3uB6PLXzf13D1l9YiFMTf/0iwTGmdYFQBmiOxxzHHLfktWfdwTFTC15U23goSzLnXqAd1df7JCWogq/AbFhHVifo+gm2PUZbyDd8R/gJd8ftYrUwcbfi4En/4+YzgcI/DNalOTWLxtqW8kZ2h88Ml5eX49xP0A19jPjii/WomKD9AgWp0l2eTcqNnwHq33N2g8HhfPGS5qaHg2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=synopsys.com;dmarc=pass action=none
 header.from=synopsys.com;dkim=pass header.d=synopsys.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQoK3Kp8+419WuKaJrjc59MzB5E+W/pcfc+oj3uRV9Y=;
 b=V8X0TFToi+BIw6UVmz/SVoe6/CbAsMgIvnfpsMo21rk4WduUO/D0vRvLhLBSVqk8cDeCRZK+l2S1KBEh+c0BY3ahbCX3Nczgwl3p+lHo1HSYcN5JlOzl24eILX+C5q0laEUP+7ro/6ti2z2ndUK8+CfbQh+HOgQlCbuVVzvPP2I=
Received: from MN2PR12MB3710.namprd12.prod.outlook.com (10.255.236.23) by
 MN2PR12MB3982.namprd12.prod.outlook.com (10.255.238.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 10 Jul 2019 10:23:09 +0000
Received: from MN2PR12MB3710.namprd12.prod.outlook.com
 ([fe80::8025:feba:c9cf:ba9f]) by MN2PR12MB3710.namprd12.prod.outlook.com
 ([fe80::8025:feba:c9cf:ba9f%3]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 10:23:09 +0000
From:   Luis de Oliveira <Luis.Oliveira@synopsys.com>
To:     "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        "Luis.Oliveira@synopsys.com" <Luis.Oliveira@synopsys.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>,
        "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "kishon@ti.com" <kishon@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>
Subject: RE: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Thread-Topic: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Thread-Index: AQHVIIrZEAgDFXEPAEq65DEFTPH6j6bChZAAgAAnWnCAAOo8AIAAOhkw
Date:   Wed, 10 Jul 2019 10:23:09 +0000
Message-ID: <MN2PR12MB371015DA79CE9D5A713D22B1CBF00@MN2PR12MB3710.namprd12.prod.outlook.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
 <ae0ffeca-9305-b5a2-3480-da623d15ce67@microchip.com>
 <MN2PR12MB3710465D7065DAF1F2D45C45CBF10@MN2PR12MB3710.namprd12.prod.outlook.com>
 <415416c4-c6d8-f81e-82cb-126e4702801b@microchip.com>
In-Reply-To: <415416c4-c6d8-f81e-82cb-126e4702801b@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=lolivei@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e947914-3242-44d8-1cbe-08d705209b0d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MN2PR12MB3982;
x-ms-traffictypediagnostic: MN2PR12MB3982:
x-microsoft-antispam-prvs: <MN2PR12MB39829EC763737B5C84D63A7BCBF00@MN2PR12MB3982.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(39860400002)(136003)(346002)(366004)(199004)(189003)(54534003)(486006)(256004)(478600001)(33656002)(26005)(6506007)(7696005)(2906002)(55016002)(4326008)(74316002)(53546011)(76176011)(99286004)(229853002)(7416002)(102836004)(186003)(66066001)(6116002)(6246003)(107886003)(3846002)(25786009)(446003)(110136005)(316002)(53936002)(66476007)(68736007)(9686003)(7736002)(2201001)(86362001)(81156014)(8676002)(66556008)(305945005)(64756008)(66446008)(66946007)(8936002)(81166006)(14454004)(76116006)(5660300002)(52536014)(6436002)(71200400001)(2501003)(476003)(11346002)(71190400001)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3982;H:MN2PR12MB3710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sA7cTmcMeWhWB/WYu338ye0qC4zsUW1O5yeKVbLfe+MWvTdmSL/8vlw+NcATU2J+Ar/OxU4EbrBZzo0fq4I/8maUm/FgraBOs37ZWz8TTz55ZHVM/BJSAHErRyieLsJgVQ/UN469nKfLRtL3uRTWdwKXFuo8x4o4iUxcX929ixQlaZlhQNMrQ3vsNdcG6hL+hJV7FDUgptEpUH81P1qczVkbOs7bGLCDR2bTkqHGSi4LlSsEwDPmcabyoY4y94YGe6VFLWj9UjJ3m04Pi5ubtAriHd1dAOHkYzfkndCDoU2V4IOjDtZNO1rJDfmKTA66k7W3J1d/ngozA7nLvjEMnXRR2XNaMfLWevRs6LMr/ZE/0vn83VWWU8s6UJjRtvif0JP0gfwvZM+FnEsq+qdhYw2ZOCb3EwPyJeKveB2DxXA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e947914-3242-44d8-1cbe-08d705209b0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 10:23:09.2995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lolivei@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3982
X-OriginatorOrg: synopsys.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQpIaSBFdWdlbiwNCg0KDQpGcm9tOiBFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5jb20gPEV1Z2Vu
LkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCkRhdGU6IFdlZCwgSnVsIDEwLCAyMDE5IGF0IDA3OjUz
OjAyDQoNCj4gDQo+IA0KPiBPbiAwOS4wNy4yMDE5IDIwOjA4LCBMdWlzIGRlIE9saXZlaXJhIHdy
b3RlOg0KPiANCj4gPiANCj4gPiBIaSBFdWdlbiwNCj4gPiANCj4gPiANCj4gPiBGcm9tOiBFdWdl
bi5IcmlzdGV2QG1pY3JvY2hpcC5jb20gPEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCj4g
PiBEYXRlOiBUdWUsIEp1bCAwOSwgMjAxOSBhdCAxNTozMzo1MA0KPiA+IA0KPiA+Pg0KPiA+Pg0K
PiA+PiBPbiAxMS4wNi4yMDE5IDIyOjIwLCBMdWlzIE9saXZlaXJhIHdyb3RlOg0KPiA+Pj4gRnJv
bTogTHVpcyBPbGl2ZWlyYSA8bG9saXZlaUBzeW5vcHN5cy5jb20+DQo+ID4+Pg0KPiA+Pj4gQWRk
IGJpbmRpbmdzIGZvciBTeW5vcHN5cyBEZXNpZ25XYXJlIE1JUEkgQ1NJLTIgaG9zdC4NCj4gPj4+
DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBMdWlzIE9saXZlaXJhIDxsb2xpdmVpQHN5bm9wc3lzLmNv
bT4NCj4gPj4+IC0tLQ0KPiA+Pj4gQ2hhbmdlbG9nDQo+ID4+PiB2My12NA0KPiA+Pj4gLSByZW1v
dmUgInBsYXQiIGZyb20gdGhlIGJsb2NrIG5hbWUgQHJvYiBAbGF1cmVudA0KPiA+Pj4gLSByZW1v
dmUgInBoeS1uYW1lcyIgd2hlbiBzaW5nbGUtZW50cnkgQHJvYg0KPiA+Pj4gLSByZW1vdmUgInNu
cHMsb3V0cHV0LXR5cGUiIC0+IHdlbnQgdG8gdGhlIGRyaXZlciBjb25maWcgQGxhdXJlbnQNCj4g
Pj4+DQo+ID4+PiAgICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zbnBzLGR3LWNzaS50
eHQgICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysrKysNCj4gPj4+ICAgIDEgZmlsZSBjaGFu
Z2VkLCA0MSBpbnNlcnRpb25zKCspDQo+ID4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3NucHMsZHctY3NpLnR4dA0KPiA+Pj4N
Cj4gPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvc25wcyxkdy1jc2kudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL3NucHMsZHctY3NpLnR4dA0KPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPj4+IGlu
ZGV4IDAwMDAwMDAuLjYxM2I3ZjkNCj4gPj4+IC0tLSAvZGV2L251bGwNCj4gPj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zbnBzLGR3LWNzaS50eHQNCj4g
Pj4+IEBAIC0wLDAgKzEsNDEgQEANCj4gPj4+ICtTeW5vcHN5cyBEZXNpZ25XYXJlIENTSS0yIEhv
c3QgY29udHJvbGxlcg0KPiA+Pj4gKw0KPiA+Pj4gK0Rlc2NyaXB0aW9uDQo+ID4+PiArLS0tLS0t
LS0tLS0NCj4gPj4+ICsNCj4gPj4+ICtUaGlzIEhXIGJsb2NrIGlzIHVzZWQgdG8gcmVjZWl2ZSBp
bWFnZSBjb21pbmcgZnJvbSBhbiBNSVBJIENTSS0yIGNvbXBhdGlibGUNCj4gPj4+ICtjYW1lcmEu
DQo+ID4+PiArDQo+ID4+PiArUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPj4+ICstIGNvbXBhdGli
bGUJCTogc2hhbGwgYmUgInNucHMsZHctY3NpIg0KPiA+Pj4gKy0gcmVnCQkJOiBwaHlzaWNhbCBi
YXNlIGFkZHJlc3MgYW5kIHNpemUgb2YgdGhlIGRldmljZSBtZW1vcnkNCj4gPj4+ICsJCQkgIG1h
cHBlZCByZWdpc3RlcnM7DQo+ID4+PiArLSBpbnRlcnJ1cHRzCQk6IERXIENTSS0yIEhvc3QgaW50
ZXJydXB0cw0KPiA+Pj4gKy0gcGh5cwkJCTogTGlzdCBvZiBvbmUgUEhZIHNwZWNpZmllciAoYXMg
ZGVmaW5lZCBpbg0KPiA+Pj4gKwkJCSAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BoeS9waHktYmluZGluZ3MudHh0KS4NCj4gPj4+ICsJCQkgIFRoaXMgUEhZIGlzIGEgTUlQSSBE
UEhZIHdvcmtpbmcgaW4gUlggbW9kZS4NCj4gPj4+ICstIHJlc2V0cwkJOiBSZWZlcmVuY2UgdG8g
YSByZXNldCBjb250cm9sbGVyIChvcHRpb25hbCkNCj4gPj4+ICsNCj4gPj4+ICtUaGUgcGVyLWJv
YXJkIHNldHRpbmdzOg0KPiA+Pj4gKyAtIHBvcnQgc3ViLW5vZGUgZGVzY3JpYmluZyBhIHNpbmds
ZSBlbmRwb2ludCBjb25uZWN0ZWQgdG8gdGhlIGNhbWVyYSBhcw0KPiA+Pj4gKyAgIGRlc2NyaWJl
ZCBpbiB2aWRlby1pbnRlcmZhY2VzLnR4dFsxXS4NCj4gPj4+ICsNCj4gPj4+ICtFeGFtcGxlOg0K
PiA+Pj4gKw0KPiA+Pj4gKwljc2kyOiBjc2kyQDMwMDAgew0KPiA+Pj4gKwkJY29tcGF0aWJsZSA9
ICJzbnBzLGR3LWNzaSI7DQo+ID4+PiArCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPj4+ICsJ
CSNzaXplLWNlbGxzID0gPDA+Ow0KPiA+Pj4gKwkJcmVnID0gPCAweDAzMDAwIDB4N0ZGPjsNCj4g
Pj4+ICsJCXBoeXMgPSA8Jm1pcGlfZHBoeV9yeD47DQo+ID4+PiArCQlyZXNldHMgPSA8JmR3X3Jz
dCAxPjsNCj4gPj4+ICsJCWludGVycnVwdHMgPSA8Mj47DQo+ID4+PiArDQo+ID4+PiArCQlwb3J0
QDAgew0KPiA+Pj4gKwkJCXJlZyA9IDwwPjsNCj4gPj4+ICsJCQljc2lfZXAxOiBlbmRwb2ludCB7
DQo+ID4+PiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmY2FtZXJhXzE+Ow0KPiA+Pj4gKwkJCQlk
YXRhLWxhbmVzID0gPDEgMj47DQo+ID4+PiArCQkJfTsNCj4gPj4NCj4gPj4gSGVsbG8gTHVpcywN
Cj4gPj4NCj4gPj4gV2hpY2ggaXMgdGhlIG91dHB1dCBwb3J0IChlbmRwb2ludCkgOiBob3cgdG8g
Y29ubmVjdCB0aGUgb3V0cHV0IG9mDQo+ID4+IGNzaTJob3N0IHRvIGFub3RoZXIgbm9kZSA/DQo+
ID4+IEkgbWVhbiwgdGhlIHNlY29uZCBwb3J0IG9mIHRoaXMgYmxvY2ssIG9yLCBob3cgaXMgdGhl
IGRhdGEgdGFrZW4gZnJvbQ0KPiA+PiBjc2kyaG9zdCA/DQo+ID4+DQo+ID4gDQo+ID4gSSB1bmRl
cnN0YW5kIHlvdXIgcXVlc3Rpb24sIEkgdGhpbmsgeW91IGd1ZXNzZWQgdGhpcyBpcyBub3QgdGhl
IGNvbXBsZXRlDQo+ID4gcGlwZWxpbmUgKEkgaGF2ZSBhIHRvcCBkcml2ZXIgdGhhdCBpbnRlcmFj
dHMgd2l0aCB0aGlzIG9uZSkuDQo+ID4gSSB3YXMgbm90IHBsYW5uaW5nIHRvIHN1Ym1pdCBpdCwg
ZG8geW91IHRoaW5rIEkgc2hvdWxkPw0KPiANCj4gWWVzIHBsZWFzZSwgeW91IGNhbiBoYXZlIHRo
ZSBwYXRjaCB3aXRoIHN1YmplY3QgRE8gTk9UIE1FUkdFIGlmIHlvdSBkbyANCj4gbm90IHdhbnQg
dGhhdCBwYXRjaCB0byBiZSBpbmNsdWRlZCBpbiB0aGUga2VybmVsIGFuZCBqdXN0IGZvciByZWZl
cmVuY2UuDQo+IGJ1dCBpdCB3b3VsZCBoZWxwIG1lIGluIHVuZGVyc3RhbmRpbmcgeW91ciBzZXR1
cA0KPiANCj4gVGhhbmtzICENCj4gDQpPaywgdGhhbmsgeW91LiBJIHdpbGwgaW5jbHVkZWQgaXQg
bmV4dC4NCg0KPiA+IA0KPiA+IFRoZSBiZWhhdmlvciBpcyB2ZXJ5IHNpbWlsYXIgd2l0aCB0aGlz
IG9uZQ0KPiA+IC4vZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9leHlub3M0LWlzL21lZGlhLWRldi5j
DQo+ID4gDQo+ID4gDQo+ID4+IFRoYW5rcywNCj4gPj4NCj4gPj4gRXVnZW4NCj4gPj4NCj4gPj4+
ICsJCX07DQo+ID4+PiArCX07DQo+ID4+Pg0KPiA+IA0KPiA+IFRoYW5rcywNCj4gPiBMdWlzDQo+
ID4gDQoNCg0K
