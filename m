Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8C4639F2
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 19:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfGIRJS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 13:09:18 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:57796 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725816AbfGIRJS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Jul 2019 13:09:18 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 24581C1E3E;
        Tue,  9 Jul 2019 17:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1562692157; bh=WrA0k0gM3rHwZMbfMfr9Wgl1w2mijUXXWiE8+cKe8L4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lqV/pzUFpnykl2TYKhn/oO81H+s0AtcEAovorWi4RKCUkVJsncLCKi1Dn2aMpu6zD
         1FnsEBdU7bvqQT4BpFrHQgoak5ZNecTKY9wh2NfuDtEpo9Y/sL+LJoBG14yhnmrgBO
         xYczZ6zTuW9n5Vqj9SVv4eQlJmKWHaIsXJN8W6Xxu4ILEZ78l1T7qrCFuhxG6tI7rQ
         TFtWVEAj5+s3FTHBNTq8Zcc/tTN7h5CfFPTB3aRvkPUIsA+NS6z93D5BYCQGsX4cFu
         4zgtRKX/PlSwF8UBmi0qIS1YcG2si3isowY3cqfeFTLfhdy7n3zrYw3SpjWbS1fTI4
         C7gIGkQzrrdCw==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6A0D6A023B;
        Tue,  9 Jul 2019 17:09:15 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 9 Jul 2019 10:08:52 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 9 Jul 2019 10:08:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrA0k0gM3rHwZMbfMfr9Wgl1w2mijUXXWiE8+cKe8L4=;
 b=rcdvgYTLtQ7j+U2HwkSyZ6+NyAOKLSq7i3/8I90vkDsiIzOxIl5m+3bbVBKsDPGMr7XslyI+IofaZWQh8NrmxLf0P1GFEKHfNfPwAPT86Um6f4UyvQTdH1p+A9NdDu2HrCuQ72lJi6+dkmDkS1Mbre0zVe21pDJzWVx87XVgrKE=
Received: from MN2PR12MB3710.namprd12.prod.outlook.com (10.255.236.23) by
 MN2PR12MB3984.namprd12.prod.outlook.com (10.255.238.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 17:08:51 +0000
Received: from MN2PR12MB3710.namprd12.prod.outlook.com
 ([fe80::8025:feba:c9cf:ba9f]) by MN2PR12MB3710.namprd12.prod.outlook.com
 ([fe80::8025:feba:c9cf:ba9f%3]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 17:08:51 +0000
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
Thread-Index: AQHVIIrZEAgDFXEPAEq65DEFTPH6j6bChZAAgAAnWnA=
Date:   Tue, 9 Jul 2019 17:08:51 +0000
Message-ID: <MN2PR12MB3710465D7065DAF1F2D45C45CBF10@MN2PR12MB3710.namprd12.prod.outlook.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
 <ae0ffeca-9305-b5a2-3480-da623d15ce67@microchip.com>
In-Reply-To: <ae0ffeca-9305-b5a2-3480-da623d15ce67@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=lolivei@synopsys.com; 
x-originating-ip: [188.83.227.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5f9b6aa-0013-4d36-76ef-08d704901d6d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MN2PR12MB3984;
x-ms-traffictypediagnostic: MN2PR12MB3984:
x-microsoft-antispam-prvs: <MN2PR12MB39849B167072D47E713EAB7ACBF10@MN2PR12MB3984.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(376002)(39860400002)(346002)(366004)(54534003)(199004)(189003)(4326008)(8676002)(81166006)(2201001)(11346002)(256004)(81156014)(86362001)(8936002)(478600001)(446003)(110136005)(71200400001)(71190400001)(316002)(2501003)(25786009)(26005)(486006)(53936002)(9686003)(186003)(476003)(66066001)(5660300002)(33656002)(52536014)(305945005)(102836004)(7736002)(7696005)(3846002)(6116002)(76176011)(6246003)(229853002)(7416002)(107886003)(74316002)(66556008)(68736007)(14454004)(76116006)(66476007)(73956011)(66446008)(2906002)(6506007)(53546011)(64756008)(55016002)(66946007)(6436002)(99286004)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3984;H:MN2PR12MB3710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OnS9ku7CJVvEc6soQHkC2YuuXqfbOyMep1A2+DIXIz0UHomXRopkbJ6WmlZiIctmSmKf8f+UJhDm8b/uqT4+sEfdMB13xM5GvBzZ9HQlh7bWabqewcrLprT52WULRWD8gwCWDYgcz6JSZUp8g1SJkfcN3fJekwhHDokZl7RM+hwjNvLqAbnpbqZgiTcIXMqJ71hKq523NOm/iemD7vtOfKxyjLODLgS4xfuQVugVH2abJXz0g3t7cGmozAuU9T+x70JeV52j/5ehCyVsANzIcZquomoXdWHUpl6JGat/hO0Y5xe4cqSeA9yWcfuoUgmkZcHxLsqbnu6S5SlHASSg/UHCrMJnkeMaMVQn4yKPSz9fSwFCMjaXxW6gUSv9HLdnIyaxJ5EeSlbTWpbohXfb8TqMbeNXS6gQpZ09RsRM//g=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f9b6aa-0013-4d36-76ef-08d704901d6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 17:08:51.0550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lolivei@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3984
X-OriginatorOrg: synopsys.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRXVnZW4sDQoNCg0KRnJvbTogRXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tIDxFdWdlbi5I
cmlzdGV2QG1pY3JvY2hpcC5jb20+DQpEYXRlOiBUdWUsIEp1bCAwOSwgMjAxOSBhdCAxNTozMzo1
MA0KDQo+IA0KPiANCj4gT24gMTEuMDYuMjAxOSAyMjoyMCwgTHVpcyBPbGl2ZWlyYSB3cm90ZToN
Cj4gPiBGcm9tOiBMdWlzIE9saXZlaXJhIDxsb2xpdmVpQHN5bm9wc3lzLmNvbT4NCj4gPiANCj4g
PiBBZGQgYmluZGluZ3MgZm9yIFN5bm9wc3lzIERlc2lnbldhcmUgTUlQSSBDU0ktMiBob3N0Lg0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEx1aXMgT2xpdmVpcmEgPGxvbGl2ZWlAc3lub3BzeXMu
Y29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZWxvZw0KPiA+IHYzLXY0DQo+ID4gLSByZW1vdmUgInBs
YXQiIGZyb20gdGhlIGJsb2NrIG5hbWUgQHJvYiBAbGF1cmVudA0KPiA+IC0gcmVtb3ZlICJwaHkt
bmFtZXMiIHdoZW4gc2luZ2xlLWVudHJ5IEByb2INCj4gPiAtIHJlbW92ZSAic25wcyxvdXRwdXQt
dHlwZSIgLT4gd2VudCB0byB0aGUgZHJpdmVyIGNvbmZpZyBAbGF1cmVudA0KPiA+IA0KPiA+ICAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc25wcyxkdy1jc2kudHh0ICAgICAgfCA0MSAr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9u
cygrKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZWRpYS9zbnBzLGR3LWNzaS50eHQNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3NucHMsZHctY3NpLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zbnBzLGR3LWNzaS50eHQNCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLjYxM2I3ZjkNCj4gPiAt
LS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL3NucHMsZHctY3NpLnR4dA0KPiA+IEBAIC0wLDAgKzEsNDEgQEANCj4gPiArU3lub3Bz
eXMgRGVzaWduV2FyZSBDU0ktMiBIb3N0IGNvbnRyb2xsZXINCj4gPiArDQo+ID4gK0Rlc2NyaXB0
aW9uDQo+ID4gKy0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICtUaGlzIEhXIGJsb2NrIGlzIHVzZWQg
dG8gcmVjZWl2ZSBpbWFnZSBjb21pbmcgZnJvbSBhbiBNSVBJIENTSS0yIGNvbXBhdGlibGUNCj4g
PiArY2FtZXJhLg0KPiA+ICsNCj4gPiArUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiArLSBjb21w
YXRpYmxlCQk6IHNoYWxsIGJlICJzbnBzLGR3LWNzaSINCj4gPiArLSByZWcJCQk6IHBoeXNpY2Fs
IGJhc2UgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgZGV2aWNlIG1lbW9yeQ0KPiA+ICsJCQkgIG1h
cHBlZCByZWdpc3RlcnM7DQo+ID4gKy0gaW50ZXJydXB0cwkJOiBEVyBDU0ktMiBIb3N0IGludGVy
cnVwdHMNCj4gPiArLSBwaHlzCQkJOiBMaXN0IG9mIG9uZSBQSFkgc3BlY2lmaWVyIChhcyBkZWZp
bmVkIGluDQo+ID4gKwkJCSAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9w
aHktYmluZGluZ3MudHh0KS4NCj4gPiArCQkJICBUaGlzIFBIWSBpcyBhIE1JUEkgRFBIWSB3b3Jr
aW5nIGluIFJYIG1vZGUuDQo+ID4gKy0gcmVzZXRzCQk6IFJlZmVyZW5jZSB0byBhIHJlc2V0IGNv
bnRyb2xsZXIgKG9wdGlvbmFsKQ0KPiA+ICsNCj4gPiArVGhlIHBlci1ib2FyZCBzZXR0aW5nczoN
Cj4gPiArIC0gcG9ydCBzdWItbm9kZSBkZXNjcmliaW5nIGEgc2luZ2xlIGVuZHBvaW50IGNvbm5l
Y3RlZCB0byB0aGUgY2FtZXJhIGFzDQo+ID4gKyAgIGRlc2NyaWJlZCBpbiB2aWRlby1pbnRlcmZh
Y2VzLnR4dFsxXS4NCj4gPiArDQo+ID4gK0V4YW1wbGU6DQo+ID4gKw0KPiA+ICsJY3NpMjogY3Np
MkAzMDAwIHsNCj4gPiArCQljb21wYXRpYmxlID0gInNucHMsZHctY3NpIjsNCj4gPiArCQkjYWRk
cmVzcy1jZWxscyA9IDwxPjsNCj4gPiArCQkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArCQlyZWcg
PSA8IDB4MDMwMDAgMHg3RkY+Ow0KPiA+ICsJCXBoeXMgPSA8Jm1pcGlfZHBoeV9yeD47DQo+ID4g
KwkJcmVzZXRzID0gPCZkd19yc3QgMT47DQo+ID4gKwkJaW50ZXJydXB0cyA9IDwyPjsNCj4gPiAr
DQo+ID4gKwkJcG9ydEAwIHsNCj4gPiArCQkJcmVnID0gPDA+Ow0KPiA+ICsJCQljc2lfZXAxOiBl
bmRwb2ludCB7DQo+ID4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmNhbWVyYV8xPjsNCj4gPiAr
CQkJCWRhdGEtbGFuZXMgPSA8MSAyPjsNCj4gPiArCQkJfTsNCj4gDQo+IEhlbGxvIEx1aXMsDQo+
IA0KPiBXaGljaCBpcyB0aGUgb3V0cHV0IHBvcnQgKGVuZHBvaW50KSA6IGhvdyB0byBjb25uZWN0
IHRoZSBvdXRwdXQgb2YgDQo+IGNzaTJob3N0IHRvIGFub3RoZXIgbm9kZSA/DQo+IEkgbWVhbiwg
dGhlIHNlY29uZCBwb3J0IG9mIHRoaXMgYmxvY2ssIG9yLCBob3cgaXMgdGhlIGRhdGEgdGFrZW4g
ZnJvbSANCj4gY3NpMmhvc3QgPw0KPiANCg0KSSB1bmRlcnN0YW5kIHlvdXIgcXVlc3Rpb24sIEkg
dGhpbmsgeW91IGd1ZXNzZWQgdGhpcyBpcyBub3QgdGhlIGNvbXBsZXRlIA0KcGlwZWxpbmUgKEkg
aGF2ZSBhIHRvcCBkcml2ZXIgdGhhdCBpbnRlcmFjdHMgd2l0aCB0aGlzIG9uZSkuDQpJIHdhcyBu
b3QgcGxhbm5pbmcgdG8gc3VibWl0IGl0LCBkbyB5b3UgdGhpbmsgSSBzaG91bGQ/DQoNClRoZSBi
ZWhhdmlvciBpcyB2ZXJ5IHNpbWlsYXIgd2l0aCB0aGlzIG9uZSANCi4vZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9leHlub3M0LWlzL21lZGlhLWRldi5jDQoNCg0KPiBUaGFua3MsDQo+IA0KPiBFdWdl
bg0KPiANCj4gPiArCQl9Ow0KPiA+ICsJfTsNCj4gPiANCg0KVGhhbmtzLA0KTHVpcw0K
