Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3AF7109AB5
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 10:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfKZJIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 04:08:05 -0500
Received: from mail-eopbgr00067.outbound.protection.outlook.com ([40.107.0.67]:5103
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726346AbfKZJIF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 04:08:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRq+g04G3H1MDAtV5tR6+lgORvVx7WM6Aqv612KpjgNpU7AcTtZ5C7qP9RM+eZbB1ITvejm2gZxjq2UYOhROxnlRt/OfBAfxbWn71KlZ7tKeUuRpSc94kEmjwzkwikmG1diDNGyI7EELjTQ/ZkitzL/GPSrA6v5SvbadFsvbwCZHD1WFQvx7BvlEQBGq4Q1XRcbvqZRHSGjbATr1N7nTNGXOFiFpfiOJloq1l9JS+7nj2+MApLHCOny9gDIGWx8jVMj/kJEh3z4kERZau3beH86/mnFSJXaSw5dbPY5ufqnpGsq1ExopJ3W4e8E3ZHPLd/zXgkUUt0G5xJvdGWVjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqfR/hkyt82tS+qZKk69WmpDdmTyYVKjjRmrGeirqcA=;
 b=Oi0Tj4GU1wHv9Ni8EhB/P0lf3tUohINz7gREXon0hmCl3pZFTJWdUJi978DldPEkdzlED0OIMCC90l1ySn20oMvGBZk4QvDM3PntTmsVxp0VoKAUfblWaOecPYzf3IwGlKANciX9p7BARCpkXLSmTzdgMJu0HLXpSfyGVvq+VbYxHKf/2C3G6KLdw8h4gOK0iAq5Y0YWeM0eyZqHSDypeKilMSGcF7e+gWHiQEh+eplNOJJE1MfXAoH98ZanzSZbWj/zZa7YT1EuQwej7TXXM/kZrn2HYUSIwHTHP3qX1xJauLCwJ+j61bMO478w8q2BvzlIIGO9T+MgCGMgVOhF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqfR/hkyt82tS+qZKk69WmpDdmTyYVKjjRmrGeirqcA=;
 b=ba/Y9XvGpxj/WwU8IdjzNrEc3qMw5SYwAfuKZQ9z3VP7rTXbvJVTRPUp9vwYmVEOWzCvENv4toBQQQ8p81616zIGCKjy/FbEQCm9fRdXbMU2LeOZbWY/uTcTB/0eB+zNsnFy6az3r9rhUoxXHQ4DOglzVlo93iNXL+EOgkFqkIQ=
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com (52.134.16.148) by
 VI1PR0402MB3566.eurprd04.prod.outlook.com (52.134.4.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Tue, 26 Nov 2019 09:07:59 +0000
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::1d41:f7cc:ffa2:270c]) by VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::1d41:f7cc:ffa2:270c%6]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 09:07:59 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>,
        "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mikhail.ulyanov@cogentembedded.com" 
        <mikhail.ulyanov@cogentembedded.com>,
        "bin.liu@mediatek.com" <bin.liu@mediatek.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "rick.chang@mediatek.com" <rick.chang@mediatek.com>
Subject: Re: [EXT] [PATCH 1/5] media: add v4l2 JPEG helpers
Thread-Topic: [EXT] [PATCH 1/5] media: add v4l2 JPEG helpers
Thread-Index: AQHVmjPfVphiWqXazkWNQNikF5+RWaeb1OGAgABTxoCAARTvAA==
Date:   Tue, 26 Nov 2019 09:07:59 +0000
Message-ID: <1574759278.19906.45.camel@nxp.com>
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
         <20191113150538.9807-2-p.zabel@pengutronix.de>
         <1574681817.19906.28.camel@nxp.com>
         <c96cdd650f7250699c1f3c73ccfc28d304dbb88a.camel@pengutronix.de>
In-Reply-To: <c96cdd650f7250699c1f3c73ccfc28d304dbb88a.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mirela.rabulea@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0270d4bb-592c-447e-c5d4-08d772502244
x-ms-traffictypediagnostic: VI1PR0402MB3566:
x-microsoft-antispam-prvs: <VI1PR0402MB35664CDA86BF3A29C166BEAF8F450@VI1PR0402MB3566.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(199004)(189003)(2501003)(446003)(3846002)(6116002)(44832011)(2906002)(99286004)(4001150100001)(103116003)(4326008)(2616005)(86362001)(256004)(478600001)(6506007)(14454004)(76176011)(11346002)(305945005)(25786009)(7416002)(71200400001)(71190400001)(7736002)(14444005)(102836004)(66556008)(54906003)(110136005)(26005)(6486002)(6436002)(316002)(81166006)(5660300002)(186003)(229853002)(6246003)(8676002)(81156014)(8936002)(6512007)(66066001)(66476007)(66446008)(36756003)(64756008)(66946007)(50226002)(91956017)(76116006)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3566;H:VI1PR0402MB3918.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vu0wq8Adkeaaj6kTd5i2nSpms/Jw9RGQ3OyJXs4y6aG/SywIt0TxX1BTKyeMUzGH4P/JYiINvbo37bullY2tAteqhIEvqDqoyYmsGBRxlzuoX2aHrFEqdNOXMFoMeQfUu/SN9FMp6Mp29ygUEX5S/kn4RpQvU5W0iHMbvCIVzu0aNe3B12G8fWPcW7wjSwsANF7qUkbKBK50gGWKhDS5vcIPC1Hj/ZsA3+xP0rM9uLBux4C+kCT4X1BHy0AXpfedlS23/qOFBgHNtj3pySTrPwnSc8uE2EFvnglEQ1m1AB9qHGZ5j/z6bQW6sL9+e6+nozkn0GkkNJuow0KfrG7ZDkya/A9x5H1BQ7YBkqGa0StanvrfWhAFdis1qZDg5pR0j3qbRYPpOzR6m0Vyb2TelBUXrUVIbrA3ohCxMCCVYLesjn9W5Des51l9BsTbyqfW
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B11ECB814A8A45448CC308F62FA7A97A@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0270d4bb-592c-447e-c5d4-08d772502244
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 09:07:59.2038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WISciT6zURV+U4Mggxgcoe4rDXXx2iRaCLE7uHHDqoUv6ii8jrKT+4P/Iroh1Qsjlohz1bqV0qXfaKbxwepFnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3566
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUGhpbGlwcCwNCg0KT24gTHUsIDIwMTktMTEtMjUgYXQgMTc6MzYgKzAxMDAsIFBoaWxpcHAg
WmFiZWwgd3JvdGU6DQo+wqANCj7CoA0KPiA+IDEuIEl0IGlzIG5lY2Vzc2FyeSB0byBzdXBwb3J0
IEFSR0IgKDQgY29tcG9uZW50cykNCj4gT2suIEknbGwgYWRkIHN1cHBvcnQgZm9yIDQtY29tcG9u
ZW50IGltYWdlcy4NClRoYW5rcy4NCj4gIElzIHRoZXJlIGEgcmVhc29uYWJsZQ0KPiBkZWZhdWx0
IGNvbG9yIGVuY29kaW5nIGZvciA0LWNvbXBvbmVudCBpbWFnZXMgaWYgdGhlIEFQUDE0IG1hcmtl
cg0KPiBzZWdtZW50IGlzIG5vdCBwcmVzZW50Pw0KQmVzaWRlcyBBUFAxNCwgSSBkaWQgbm90IGZp
bmQgYW55dGhpbmcgZWxzZSB0aGF0IHdvcmtzLCB3aXRob3V0IEFQUDE0LA0KUkdCL0FSR0IgY29s
b3JzIGFyZSBkaXN0b3J0ZWQsIHRoZSBvbmx5IGVzc3BsYW5hdGlvbiBmb3IgdGhpcyB3YXMgdGhl
DQpvbmUgZnJvbSBSZWMgVC44NzIuDQo+IA0KPiA+IA0KPiA+IDIuIEl0IGlzIG5lY2Vzc2FyeSB0
byBzdXBwb3J0IGV4dGVuZGVkIHNlcXVlbnRpYWwgKHBhcnNlIFNPRjEpDQo+IERvIHlvdSByZXF1
aXJlIGFyaXRobWV0aWMgY29kaW5nIG9yIDEyLWJpdCBzYW1wbGUgcHJlY2lzaW9uIGFzIHdlbGws
DQo+IG9yDQo+IGp1c3QgZXh0ZW5kZWQgc2VxdWVudGlhbCB3aXRoIEh1ZmZtYW4gY29kaW5nIGFu
ZCA4LWJpdCBzYW1wbGUNCj4gcHJlY2lzaW9uPw0KVGhlIGlteDgganBlZyBzdXBwb3J0cyBib3Ro
IDgtYml0IGFuZCAxMi1iaXQgc2FtcGxlIHByZWNpc2lvbi4gSSBvbmx5DQp0ZXN0ZWQgd2l0aCA4
LWJpdCBzYW1wbGVzLCBzb21lIGxpdHRsZSBhZGp1c3RtZW50cyBtaWdodCBiZSBuZWNlc3NhcnkN
CmZvciAxMi1iaXQgaW4gdGhlIGlteDgganBlZyBkcml2ZXIsIGhhdmluZyBzb21ldGhpbmcgZm9y
IGl0IGluIHRoZQ0KY29tbW9uIGNvZGUgd291bGQgbWFrZSBpdCBlYXNpZXIuDQoNCg0KPiBJIHNl
ZSB5b3UgdXNlZCB0aGUgIkFQUDE0IG1hcmtlciBzZWdtZW50IGZvciBjb2xvdXIgZW5jb2Rpbmci
IGFzDQo+IHNwZWNpZmllZCBpbiBSZWNvbW1lbmRhdGlvbiBULjg3MiBbMV0uIEknbGwgYWRkIHN1
cHBvcnQgZm9yIHRoaXMgdG8NCj4gdGhlDQo+IGNvbW1vbiBjb2RlLg0KVGhhbmtzLg0KPsKgDQo+
ID4gDQo+ID4gNC4gSXQgaXMgbmVjZXNzYXJ5IHRvIGJlIGFibGUgdG8gbW9kaWZ5L3BhdGNoIHRo
ZSBjb21wb25lbnQgSUQncw0KPiA+IGluc2lkZQ0KPiA+IFNPRiAmIFNPUyBzZWdtZW50czsgdGhp
cyBpcyBkdWUgdG8gYSBoYXJkd2FyZSBsaW1pdGF0aW9uIHRoYXQgdGhlDQo+ID4gY29tcG9uZW50
IElEJ3MgbXVzdCBiZSAwLi4zIG9yIDEuLjQsIGhvd2V2ZXIgaXQgaXMgcG9zc2libGUgdG8NCj4g
PiBkZWNvZGUgYQ0KPiA+IGpwZWcgdGhhdCB2aW9sYXRlcyB0aGlzIGNvbmRpdGlvbiwgaWYgdGhl
IGNvbXBvbmVudCBJRCdzIGFyZQ0KPiA+IHBhdGNoZWQgdG8NCj4gPiBhY2NlcHRlZCB2YWx1ZXMu
DQo+IEludGVyZXN0aW5nLiBJJ20gbm90IHN1cmUgaWYgdGhpcyBpcyBzb21ldGhpbmcgd2Ugc2hv
dWxkIGRvDQo+IHVuY29uZGl0aW9uYWxseSBpbiB0aGUgY29tbW9uIGNvZGUuIE1heWJlIHRoaXMg
d2FycmFudHMgYSBmbGFnLg0KSSBmb3Jnb3QgdG8gbWVudGlvbizCoG14Y19qcGVnX3ZhbGlkX2Nv
bXBfaWQgaXMgd2hlcmUgSSBkaWQgdGhpcyBoYWNrLA0KYW5kIHRoYXQgcGF0Y2hpbmcgb2YgdGhl
IGNvbXBvbmVudCBJRHMgaGFwcGVucyBkaXJlY3RseSBvdmVyIHRoZSBzb3VyY2UNCihPVVRQVVQp
IGJ1ZmZlci4gSWYgdGhlcmUgd29uJ3QgYmUgYSBoZWxwZXIgZm9yIGl0LCBJIHdpbGwgc3RpbGwg
aGF2ZQ0KdG8gYmUgYWJsZSB0byBwYXJzZSB0aGUgU09GL1NPUyBzZWdtZW50cywgd2hpY2ggSSB3
YXMgaG9waW5nIHRvIGRyb3ANCmFmdGVyIHVzaW5nIHRoZSBjb21tb24gaGVscGVycy4NCj4gDQo+
ID4gDQo+ID4gSSBoYXZlIGEgY29uY2VybiByZWxhdGVkIHRvIHBlcmZvcm1hbmNlLCBhYm91dCBw
YXJzaW5nIHRoZSBqcGVnDQo+ID4gbGlrZQ0KPiA+IHRoYXQsIGJ1dCBJIGRpZCBub3QgZ2V0IHRv
IG1lYXN1cmUgYW55dGhpbmcgeWV0LCBhcyBJIGNvdWxkIG5vdA0KPiA+IGZ1bGx5DQo+ID4gaW50
ZWdyYXRlIGlteDgganBlZyBkcml2ZXIgd2l0aCB0aGUgaGVscGVycywgSQ0KPiA+IHVzZWQgdjRs
Ml9qcGVnX3BhcnNlX2hlYWRlciwgYnV0IEkgYWxzbyBoYWQgdG8ga2VlcCBteSBvbGQNCj4gPiBz
dHJ1Y3R1cmVzLg0KPiA+IFBsZWFzZSB0YWtlIGEgbG9vayBpbiBteSBpbXg4IHBhdGNoLCBhdCBt
eGMtanBlZy5oLCBzdHJ1Y3QNCj4gPiBteGNfanBlZ19zb2Yvc3RydWN0IG14Y19qcGVnX3Nvcywg
dGhlc2UgYXJlIF9fcGFja2VkIHN0cnVjdHVyZXMsDQo+ID4gdGhleQ0KPiA+IHdvcmsgcXVpdGUg
d2VsbCB2aWEgYSBzaW1wbGUgY2FzdCBhbmQgYWxsb3cgbW9kaWZpY2F0aW9ucyB0b28sIHRoZQ0K
PiA+IGRvd25zaWRlIGlzIHRoYXQgZmllbGRzIGJpZ2dlciB0aGFuIHU4IG1pZ2h0IHJlcXVpcmUg
c3dhcHBpbmcuDQo+IFdlIGNhbid0IHVzZSBiaXRmaWVsZHMgZm9yIGV4dGVybmFsIGRhdGEgaW4g
cG9ydGFibGUgY29kZSwgYW5kIEknbQ0KPiBub3QgYQ0KPiBiaWcgZmFuIG9mIHVzaW5nIF9fYmUx
NiBpbiB0aGUgQVBJLCBidXQgd2UgY291bGQgY2VydGFpbmx5IHVzZSB0aGlzDQo+IGludGVybmFs
bHkgYW5kIHNlZSBpZiB0aGF0IHNwZWVkcyB1cCBwYXJzaW5nLiBUaGVyZSBhcmUgcXVpdGUgYSBm
ZXcNCj4gc3VwZXJmbHVvdXMgYm91bmRzIGNoZWNrcyByaWdodCBub3cgdGhhdCBjYW4gYmUgb3B0
aW1pemVkIGF3YXkuDQo+IEknZCBzdGlsbCBsaWtlIHRvIGNvcHkgdGhlIHBhcnNlZCBoZWFkZXJz
IGludG8gYSBzdHJ1Y3R1cmUgcHJvdmlkZWQNCj4gYnkNCj4gdGhlIGNhbGxlci4NCk9rLCBJJ2xs
IHRyeSB0byBkbyBzb21lIG1lYXN1cmVtZW50cyBhZnRlciB0aGUgbmV4dCB2ZXJzaW9uLCB3aXRo
DQp2ZXJzdXMgd2l0aG91dCB0aGUgaGVscGVycy4NCj4gDQo+ID4gDQo+ID4gUGxlYXNlIGFsc28g
c2VlIGJlbG93IG15IGNvbW1lbnRzLg0KPiBJJ2xsIHRha2UgdGhlc2UgaW50byBhY2NvdW50IGZv
ciB0aGUgbmV4dCB2ZXJzaW9uLiBUaGFuayB5b3UgZm9yIHRoZQ0KPiBmZWVkYmFjayENClRoYW5r
IHlvdSENCj4gDQo+IHJlZ2FyZHMNCj4gUGhpbGlwcA0KPiA=
