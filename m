Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B144722CE
	for <lists+linux-media@lfdr.de>; Mon, 13 Dec 2021 09:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbhLMIkw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 03:40:52 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:45992 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231538AbhLMIkv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 03:40:51 -0500
X-UUID: a631a786f5a04c128010e934aacb8b1e-20211213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=GSzSVKBHcCIP8i05vY1cn8G54b7JCcScJgo+oQsDzPk=;
        b=F2dkMt2udbtHKEpQhJqdxNPXJ9KPy+IQfOHeyO9/8BHnGmjz5QczFDKs1PsMMYuN+EIIuxH1lvM2+33AqQt8QRKiF13RWhXg03JrMm23i2/D4IztzbA5hLOhNygVEXU7zLPIcbBTKUPhGXKXLvTQwjd2zFRRAo9XIdi6Gq6TkvQ=;
X-UUID: a631a786f5a04c128010e934aacb8b1e-20211213
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 804574782; Mon, 13 Dec 2021 16:40:48 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Dec 2021 16:40:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 13 Dec
 2021 16:40:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Dec 2021 16:40:45 +0800
Message-ID: <87c70b080162b63454609d647ff1e2b39d06d406.camel@mediatek.com>
Subject: Re: [PATCH v12, 06/19] media: mtk-vcodec: Add to support multi
 hardware decode
From:   "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To:     Steve Cho <stevecho@chromium.org>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        "Tiffany Lin" <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        "Fritz Koenig" <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Mon, 13 Dec 2021 16:40:47 +0800
In-Reply-To: <CAC-pXoOCa+13u--9sCKDorh+RbuhL89Ajur1t8bSx6w=MgoyYg@mail.gmail.com>
References: <20211202034544.2750-1-yunfei.dong@mediatek.com>
         <20211202034544.2750-7-yunfei.dong@mediatek.com>
         <CAC-pXoOCa+13u--9sCKDorh+RbuhL89Ajur1t8bSx6w=MgoyYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU3RldmUsDQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLA0KT24gVGh1LCAyMDIxLTEy
LTA5IGF0IDE1OjI5IC0wODAwLCBTdGV2ZSBDaG8gd3JvdGU6DQo+IEZldyBjb21tZW50cyBhbmQg
cXVlc3Rpb25zLg0KPiANCj4gT24gV2VkLCBEZWMgMSwgMjAyMSBhdCA3OjQ2IFBNIFl1bmZlaSBE
b25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+IHdyb3RlOg0KPiA+IA0KPiA+IFRoZXJl
IGFyZSBtb3JlIHRoYW4gdHdvIGhhcmR3YXJlcyBmb3IgZGVjb2RlcjogTEFUMCwgTEFUMSBhbmQg
Q09SRS4NCj4gPiBJbiBvcmRlciB0bw0KPiA+IG1hbmFnZSB0aGVzZSBoYXJkd2FyZXMsIHJlZ2lz
dGVyIGVhY2ggaGFyZHdhcmUgYXMgaW5kZXBlbmRlbnQNCj4gPiBwbGF0Zm9ybSBkZXZpY2UNCj4g
PiBmb3IgdGhlIGxhcmJzIGFyZSBkaWZmZXJlbnQuDQo+IA0KPiBiYXNpYyBxdWVzdGlvbjogd2hh
dCBpcyAibGFyYnMiPw0KPiANCkNhbiByZWdhcmQgbGFyYnMgYXMgc29tZSBoYXJkd2FyZSB3aGlj
aCBkZWNvZGUgZGVwZW5kcyBvbi4NCj4gPiANCj4gPiBFYWNoIGhhcmR3YXJlIG1vZHVsZSBjb250
cm9scyBpdHMgb3duIGluZm9ybWF0aW9uIHdoaWNoIGluY2x1ZGVzDQo+ID4gaW50ZXJydXB0L3Bv
d2VyLw0KPiA+IGNsb2Nrcy9yZWdpc3RlcnMuDQo+ID4gDQo+ID4gQ2FsbGluZyBvZl9wbGF0Zm9y
bV9wb3B1bGF0ZSBpbiBwYXJlbnQgZGV2aWNlLCBhbmQgdXNlDQo+ID4gc3ViZGV2X2JpdG1hcCB0
byByZWNvcmQNCj4gPiB3aGV0aGVyIHRoZSBoYXJkd2FyZXMgYXJlIHJlZ2lzdGVyZWQgZG9uZS4N
Cj4gDQo+IG5pdDogcy9yZWdpc3RlcmVkIGRvbmUvcmVnaXN0ZXJlZC8gPw0KPiANCkZpeCBpbiB2
MTMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1l
ZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNv
ZGVjL01ha2VmaWxlICAgIHwgICA1ICstDQo+ID4gIC4uLi9wbGF0Zm9ybS9tdGstdmNvZGVjL210
a192Y29kZWNfZGVjX2Rydi5jICB8IDExMSArKysrKysrLS0tLQ0KPiA+ICAuLi4vcGxhdGZvcm0v
bXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19ody5jICAgfCAxNzINCj4gPiArKysrKysrKysrKysr
KysrKysNCj4gPiAgLi4uL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfaHcuaCAg
IHwgIDUxICsrKysrKw0KPiA+ICAuLi4vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19zdGF0ZWZ1
bC5jICAgICAgfCAgIDEgKw0KPiA+ICAuLi4vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19zdGF0
ZWxlc3MuYyAgICAgfCAgIDIgKw0KPiA+ICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNv
ZGVjX2Rydi5oICAgICAgfCAgMTkgKysNCj4gPiAgNyBmaWxlcyBjaGFuZ2VkLCAzMjkgaW5zZXJ0
aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay0NCj4gPiB2Y29kZWMvbXRrX3Zjb2RlY19kZWNfaHcuYw0KPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstDQo+ID4gdmNv
ZGVjL210a192Y29kZWNfZGVjX2h3LmgNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL01ha2VmaWxlDQo+ID4gYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay12Y29kZWMvTWFrZWZpbGUNCj4gPiBpbmRleCBjYThlOWU3YTljNGUuLmM2MWJm
YjE3OWJjYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29k
ZWMvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMv
TWFrZWZpbGUNCj4gPiBAQCAtMiw3ICsyLDggQEANCj4gPiANCj4gPiAgb2JqLSQoQ09ORklHX1ZJ
REVPX01FRElBVEVLX1ZDT0RFQykgKz0gbXRrLXZjb2RlYy1kZWMubyBcDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRrLXZjb2RlYy1lbmMubyBcDQo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRrLXZjb2RlYy1jb21tb24ubw0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG10ay12Y29kZWMtY29t
bW9uLm8gXA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG10ay12
Y29kZWMtZGVjLWh3Lm8NCj4gPiANCj4gPiAgbXRrLXZjb2RlYy1kZWMteSA6PSB2ZGVjL3ZkZWNf
aDI2NF9pZi5vIFwNCj4gPiAgICAgICAgICAgICAgICAgdmRlYy92ZGVjX3ZwOF9pZi5vIFwNCj4g
PiBAQCAtMTYsNiArMTcsOCBAQCBtdGstdmNvZGVjLWRlYy15IDo9IHZkZWMvdmRlY19oMjY0X2lm
Lm8gXA0KPiA+ICAgICAgICAgICAgICAgICBtdGtfdmNvZGVjX2RlY19zdGF0ZWxlc3MubyBcDQo+
ID4gICAgICAgICAgICAgICAgIG10a192Y29kZWNfZGVjX3BtLm8gXA0KPiA+IA0KPiA+ICttdGst
dmNvZGVjLWRlYy1ody15IDo9IG10a192Y29kZWNfZGVjX2h3Lm8NCj4gPiArDQo+ID4gIG10ay12
Y29kZWMtZW5jLXkgOj0gdmVuYy92ZW5jX3ZwOF9pZi5vIFwNCj4gPiAgICAgICAgICAgICAgICAg
dmVuYy92ZW5jX2gyNjRfaWYubyBcDQo+ID4gICAgICAgICAgICAgICAgIG10a192Y29kZWNfZW5j
Lm8gXA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMv
bXRrX3Zjb2RlY19kZWNfZHJ2LmMgDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12
Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMNCj4gPiBpbmRleCBiN2E1MWU5NmQ0YmEuLjk1ZmJl
OWJlM2Y2ZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29k
ZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMNCj4gPiBAQCAtMTgsMTkgKzE4LDQwIEBA
DQo+ID4gDQo+ID4gICNpbmNsdWRlICJtdGtfdmNvZGVjX2Rydi5oIg0KPiA+ICAjaW5jbHVkZSAi
bXRrX3Zjb2RlY19kZWMuaCINCj4gPiArI2luY2x1ZGUgIm10a192Y29kZWNfZGVjX2h3LmgiDQo+
ID4gICNpbmNsdWRlICJtdGtfdmNvZGVjX2RlY19wbS5oIg0KPiA+ICAjaW5jbHVkZSAibXRrX3Zj
b2RlY19pbnRyLmgiDQo+ID4gICNpbmNsdWRlICJtdGtfdmNvZGVjX3V0aWwuaCINCj4gPiAgI2lu
Y2x1ZGUgIm10a192Y29kZWNfZncuaCINCj4gPiANCj4gPiAtI2RlZmluZSBWREVDX0hXX0FDVElW
RSAweDEwDQo+ID4gLSNkZWZpbmUgVkRFQ19JUlFfQ0ZHICAgMHgxMQ0KPiA+IC0jZGVmaW5lIFZE
RUNfSVJRX0NMUiAgIDB4MTANCj4gPiAtI2RlZmluZSBWREVDX0lSUV9DRkdfUkVHICAgICAgIDB4
YTQNCj4gPiAtDQo+ID4gIG1vZHVsZV9wYXJhbShtdGtfdjRsMl9kYmdfbGV2ZWwsIGludCwgMDY0
NCk7DQo+ID4gIG1vZHVsZV9wYXJhbShtdGtfdmNvZGVjX2RiZywgYm9vbCwgMDY0NCk7DQo+ID4g
DQo+ID4gK3N0YXRpYyBpbnQgbXRrX3Zjb2RlY19zdWJkZXZfZGV2aWNlX2NoZWNrKHN0cnVjdCBt
dGtfdmNvZGVjX2Rldg0KPiA+ICp2ZGVjX2RldikNCj4gPiArew0KPiA+ICsgICAgICAgc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHZkZWNfZGV2LT5wbGF0X2RldjsNCj4gPiArICAgICAg
IHN0cnVjdCBkZXZpY2Vfbm9kZSAqc3ViZGV2X25vZGU7DQo+ID4gKyAgICAgICBlbnVtIG10a192
ZGVjX2h3X2lkIGh3X2lkeDsNCj4gPiArICAgICAgIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
Km9mX2lkOw0KPiA+ICsgICAgICAgaW50IGk7DQo+ID4gKw0KPiA+ICsgICAgICAgZm9yIChpID0g
MDsgaSA8IEFSUkFZX1NJWkUobXRrX3ZkZWNfaHdfbWF0Y2gpOyBpKyspIHsNCj4gPiArICAgICAg
ICAgICAgICAgb2ZfaWQgPSAmbXRrX3ZkZWNfaHdfbWF0Y2hbaV07DQo+ID4gKyAgICAgICAgICAg
ICAgIHN1YmRldl9ub2RlID0gb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVMTCwgTlVMTCwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBvZl9pZC0+Y29tcGF0aWJsZSk7DQo+ID4gKyAgICAg
ICAgICAgICAgIGlmICghc3ViZGV2X25vZGUpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBod19pZHggPSAoZW51bSBtdGtf
dmRlY19od19pZCkodWludHB0cl90KW9mX2lkLQ0KPiA+ID5kYXRhOw0KPiA+ICsgICAgICAgICAg
ICAgICBpZiAoIXRlc3RfYml0KGh3X2lkeCwgdmRlY19kZXYtPnN1YmRldl9iaXRtYXApKSB7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAiVmRlYyAlZCBp
cyBub3QgcmVhZHkiLA0KPiA+IGh3X2lkeCk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FQUdBSU47DQo+ID4gKyAgICAgICAgICAgICAgIH0NCj4gPiArICAgICAgIH0NCj4g
PiArDQo+ID4gKyAgICAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIGly
cXJldHVybl90IG10a192Y29kZWNfZGVjX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKnByaXYp
DQo+ID4gIHsNCj4gPiAgICAgICAgIHN0cnVjdCBtdGtfdmNvZGVjX2RldiAqZGV2ID0gcHJpdjsN
Cj4gPiBAQCAtOTUsNiArMTE2LDQyIEBAIHN0YXRpYyBpbnQgbXRrX3Zjb2RlY19nZXRfcmVnX2Jh
c2VzKHN0cnVjdA0KPiA+IG10a192Y29kZWNfZGV2ICpkZXYpDQo+ID4gICAgICAgICByZXR1cm4g
MDsNCj4gPiAgfQ0KPiA+IA0KPiA+ICtzdGF0aWMgaW50IG10a192Y29kZWNfaW5pdF9kZWNfcmVz
b3VyY2VzKHN0cnVjdCBtdGtfdmNvZGVjX2Rldg0KPiA+ICpkZXYpDQo+ID4gK3sNCj4gPiArICAg
ICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSBkZXYtPnBsYXRfZGV2Ow0KPiA+ICsg
ICAgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgICByZXQgPSBtdGtfdmNvZGVjX2dldF9y
ZWdfYmFzZXMoZGV2KTsNCj4gPiArICAgICAgIGlmIChyZXQpDQo+ID4gKyAgICAgICAgICAgICAg
IHJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKGRldi0+dmRlY19wZGF0YS0+aXNf
c3ViZGV2X3N1cHBvcnRlZCkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ID4gKw0K
PiA+ICsgICAgICAgZGV2LT5kZWNfaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCj4g
PiArICAgICAgIGlmIChkZXYtPmRlY19pcnEgPCAwKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGRl
dl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byBnZXQgaXJxIG51bWJlciIpOw0KPiA+ICsgICAg
ICAgICAgICAgICByZXR1cm4gZGV2LT5kZWNfaXJxOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4g
PiArICAgICAgIGlycV9zZXRfc3RhdHVzX2ZsYWdzKGRldi0+ZGVjX2lycSwgSVJRX05PQVVUT0VO
KTsNCj4gPiArICAgICAgIHJldCA9IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRldiwgZGV2LT5k
ZWNfaXJxLA0KPiA+ICsgICAgICAgICAgICAgICBtdGtfdmNvZGVjX2RlY19pcnFfaGFuZGxlciwg
MCwgcGRldi0+bmFtZSwgZGV2KTsNCj4gPiArICAgICAgIGlmIChyZXQpIHsNCj4gPiArICAgICAg
ICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIGluc3RhbGwgZGV2LT5kZWNf
aXJxIA0KPiA+ICVkICglZCkiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRldi0+ZGVj
X2lycSwgcmV0KTsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAgICAg
IH0NCj4gPiArDQo+ID4gKyAgICAgICByZXQgPSBtdGtfdmNvZGVjX2luaXRfZGVjX3BtKHBkZXYs
ICZkZXYtPnBtKTsNCj4gPiArICAgICAgIGlmIChyZXQgPCAwKSB7DQo+ID4gKyAgICAgICAgICAg
ICAgIGRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byBnZXQgbXQgdmNvZGVjIGNsb2NrDQo+
ID4gc291cmNlIik7DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gKyAgICAg
ICB9DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0
YXRpYyBpbnQgZm9wc192Y29kZWNfb3BlbihzdHJ1Y3QgZmlsZSAqZmlsZSkNCj4gPiAgew0KPiA+
ICAgICAgICAgc3RydWN0IG10a192Y29kZWNfZGV2ICpkZXYgPSB2aWRlb19kcnZkYXRhKGZpbGUp
Ow0KPiA+IEBAIC0xMTYsNiArMTczLDEyIEBAIHN0YXRpYyBpbnQgZm9wc192Y29kZWNfb3Blbihz
dHJ1Y3QgZmlsZSAqZmlsZSkNCj4gPiAgICAgICAgIGluaXRfd2FpdHF1ZXVlX2hlYWQoJmN0eC0+
cXVldWUpOw0KPiA+ICAgICAgICAgbXV0ZXhfaW5pdCgmY3R4LT5sb2NrKTsNCj4gPiANCj4gPiAr
ICAgICAgIHJldCA9IG10a192Y29kZWNfc3ViZGV2X2RldmljZV9jaGVjayhkZXYpOw0KPiA+ICsg
ICAgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgICAgICAgICBtdGtfdjRsMl9lcnIoIkZhaWxl
ZCB0byBjaGVjayB2ZGVjIGNvbXAgZGV2aWNlLiIpOw0KPiANCj4gYmFzaWMgcXVlc3Rpb246IHdo
YXQgaXMgImNvbXAiIGRldmljZT8NCj4gDQpUaGlzIGxpbmUgY2FuIGJlIHJlbW92ZWQsICJjb21w
IiBpcyBzdWJkZXYuDQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX2N0cmxzX3NldHVwOw0K
PiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiAgICAgICAgIGN0eC0+dHlwZSA9IE1US19JTlNUX0RF
Q09ERVI7DQo+ID4gICAgICAgICByZXQgPSBkZXYtPnZkZWNfcGRhdGEtPmN0cmxzX3NldHVwKGN0
eCk7DQo+ID4gICAgICAgICBpZiAocmV0KSB7DQo+ID4gQEAgLTIyMCw3ICsyODMsNiBAQCBzdGF0
aWMgaW50IG10a192Y29kZWNfcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiA+ICB7DQo+ID4gICAgICAgICBzdHJ1Y3QgbXRrX3Zjb2RlY19kZXYgKmRldjsNCj4gPiAg
ICAgICAgIHN0cnVjdCB2aWRlb19kZXZpY2UgKnZmZF9kZWM7DQo+ID4gLSAgICAgICBzdHJ1Y3Qg
cmVzb3VyY2UgKnJlczsNCj4gPiAgICAgICAgIHBoYW5kbGUgcnByb2NfcGhhbmRsZTsNCj4gPiAg
ICAgICAgIGVudW0gbXRrX3Zjb2RlY19md190eXBlIGZ3X3R5cGU7DQo+ID4gICAgICAgICBpbnQg
cmV0Ow0KPiA+IEBAIC0yNDksMzIgKzMxMSwxMCBAQCBzdGF0aWMgaW50IG10a192Y29kZWNfcHJv
YmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgICAgaWYgKElT
X0VSUihkZXYtPmZ3X2hhbmRsZXIpKQ0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VS
UihkZXYtPmZ3X2hhbmRsZXIpOw0KPiA+IA0KPiA+IC0gICAgICAgcmV0ID0gbXRrX3Zjb2RlY19p
bml0X2RlY19wbShkZXYtPnBsYXRfZGV2LCAmZGV2LT5wbSk7DQo+ID4gLSAgICAgICBpZiAocmV0
IDwgMCkgew0KPiA+IC0gICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQg
dG8gZ2V0IG10IHZjb2RlYyBjbG9jaw0KPiA+IHNvdXJjZSIpOw0KPiA+IC0gICAgICAgICAgICAg
ICBnb3RvIGVycl9kZWNfcG07DQo+ID4gLSAgICAgICB9DQo+ID4gLQ0KPiA+IC0gICAgICAgcmV0
ID0gbXRrX3Zjb2RlY19nZXRfcmVnX2Jhc2VzKGRldik7DQo+ID4gLSAgICAgICBpZiAocmV0KQ0K
PiA+IC0gICAgICAgICAgICAgICBnb3RvIGVycl9yZXM7DQo+ID4gLQ0KPiA+IC0gICAgICAgcmVz
ID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfSVJRLCAwKTsNCj4gPiAt
ICAgICAgIGlmIChyZXMgPT0gTlVMTCkgew0KPiA+IC0gICAgICAgICAgICAgICBkZXZfZXJyKCZw
ZGV2LT5kZXYsICJmYWlsZWQgdG8gZ2V0IGlycSByZXNvdXJjZSIpOw0KPiA+IC0gICAgICAgICAg
ICAgICByZXQgPSAtRU5PRU5UOw0KPiA+IC0gICAgICAgICAgICAgICBnb3RvIGVycl9yZXM7DQo+
ID4gLSAgICAgICB9DQo+ID4gLQ0KPiA+IC0gICAgICAgZGV2LT5kZWNfaXJxID0gcGxhdGZvcm1f
Z2V0X2lycShwZGV2LCAwKTsNCj4gPiAtICAgICAgIGlycV9zZXRfc3RhdHVzX2ZsYWdzKGRldi0+
ZGVjX2lycSwgSVJRX05PQVVUT0VOKTsNCj4gPiAtICAgICAgIHJldCA9IGRldm1fcmVxdWVzdF9p
cnEoJnBkZXYtPmRldiwgZGV2LT5kZWNfaXJxLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
IG10a192Y29kZWNfZGVjX2lycV9oYW5kbGVyLCAwLCBwZGV2LT5uYW1lLA0KPiA+IGRldik7DQo+
ID4gKyAgICAgICByZXQgPSBtdGtfdmNvZGVjX2luaXRfZGVjX3Jlc291cmNlcyhkZXYpOw0KPiA+
ICAgICAgICAgaWYgKHJldCkgew0KPiA+IC0gICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5k
ZXYsICJGYWlsZWQgdG8gaW5zdGFsbCBkZXYtPmRlY19pcnEgDQo+ID4gJWQgKCVkKSIsDQo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgZGV2LT5kZWNfaXJxLA0KPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgIHJldCk7DQo+ID4gLSAgICAgICAgICAgICAgIGdvdG8gZXJyX3JlczsNCj4gPiAr
ICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIGluaXQgZGVjDQo+
ID4gcmVzb3VyY2VzIik7DQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX2RlY19wbTsNCj4g
PiAgICAgICAgIH0NCj4gPiANCj4gPiAgICAgICAgIG11dGV4X2luaXQoJmRldi0+ZGVjX211dGV4
KTsNCj4gPiBAQCAtMzI5LDYgKzM2OSwxNSBAQCBzdGF0aWMgaW50IG10a192Y29kZWNfcHJvYmUo
c3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgICAgICAgICAgICBn
b3RvIGVycl9ldmVudF93b3JrcTsNCj4gPiAgICAgICAgIH0NCj4gPiANCj4gPiArICAgICAgIGlm
IChkZXYtPnZkZWNfcGRhdGEtPmlzX3N1YmRldl9zdXBwb3J0ZWQpIHsNCj4gPiArICAgICAgICAg
ICAgICAgcmV0ID0gb2ZfcGxhdGZvcm1fcG9wdWxhdGUocGRldi0+ZGV2Lm9mX25vZGUsIE5VTEws
DQo+ID4gTlVMTCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAmcGRldi0+ZGV2KTsNCj4g
PiArICAgICAgICAgICAgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IG10a192NGwyX2VycigiTWFpbiBkZXZpY2UNCj4gPiBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSBmYWls
ZWQuIik7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfZXZlbnRfd29ya3E7
DQo+ID4gKyAgICAgICAgICAgICAgIH0NCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gICAgICAg
ICBpZiAoZGV2LT52ZGVjX3BkYXRhLT51c2VzX3N0YXRlbGVzc19hcGkpIHsNCj4gPiAgICAgICAg
ICAgICAgICAgZGV2LT5tZGV2X2RlYy5kZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICAgICAgICAgICAg
ICAgICBzdHJzY3B5KGRldi0+bWRldl9kZWMubW9kZWwsIE1US19WQ09ERUNfREVDX05BTUUsDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNv
ZGVjX2RlY19ody5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRr
X3Zjb2RlY19kZWNfaHcuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAw
MDAwMDAwMDAwLi4wMjVhMTAzMDA4YmENCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX2h3LmMNCj4gPiBA
QCAtMCwwICsxLDE3MiBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MA0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjEgTWVkaWFUZWsgSW5jLg0KPiA+
ICsgKiBBdXRob3I6IFl1bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4g
KyAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0KPiA+ICsjaW5j
bHVkZSA8bGludXgvaXJxLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4N
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJtdGtf
dmNvZGVjX2Rydi5oIg0KPiA+ICsjaW5jbHVkZSAibXRrX3Zjb2RlY19kZWMuaCINCj4gPiArI2lu
Y2x1ZGUgIm10a192Y29kZWNfZGVjX2h3LmgiDQo+ID4gKyNpbmNsdWRlICJtdGtfdmNvZGVjX2Rl
Y19wbS5oIg0KPiA+ICsjaW5jbHVkZSAibXRrX3Zjb2RlY19pbnRyLmgiDQo+ID4gKyNpbmNsdWRl
ICJtdGtfdmNvZGVjX3V0aWwuaCINCj4gPiArDQo+ID4gK2NvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgbXRrX3ZkZWNfaHdfbWF0Y2hbXSA9IHsNCj4gPiArICAgICAgIHsNCj4gPiArICAgICAgICAg
ICAgICAgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXRrLXZjb2RlYy1sYXQiLA0KPiA+ICsgICAg
ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX1ZERUNfTEFUMCwNCj4gPiArICAgICAgIH0s
DQo+IA0KPiBBcmUgd2Ugc3VwcG9zZWQgdG8gaGF2ZSBMQVQxIGhlcmUgYXMgd2VsbD8NCkF0IGN1
cnJlbnQgcGVyaW9kLCBuZWVkIG5vdCB0byBhZGQgaXQuIExBVDEgbWF5IGJlIHVzZWQgaW4gdGhl
IGZ1dHVyZS4NCj4gDQo+ID4gKyAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgIC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ay12Y29kZWMtY29yZSIsDQo+ID4gKyAgICAgICAgICAgICAgIC5k
YXRhID0gKHZvaWQgKilNVEtfVkRFQ19DT1JFLA0KPiA+ICsgICAgICAgfSwNCj4gPiArICAgICAg
IHt9LA0KPiA+ICt9Ow0KPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChtdGtfdmRlY19od19tYXRjaCk7
DQo+ID4gKw0KPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdGtfdmRlY19od19tYXRjaCk7
DQo+ID4gKw0KPiA+ICtzdGF0aWMgaXJxcmV0dXJuX3QgbXRrX3ZkZWNfaHdfaXJxX2hhbmRsZXIo
aW50IGlycSwgdm9pZCAqcHJpdikNCj4gPiArew0KPiA+ICsgICAgICAgc3RydWN0IG10a192ZGVj
X2h3X2RldiAqZGV2ID0gcHJpdjsNCj4gPiArICAgICAgIHN0cnVjdCBtdGtfdmNvZGVjX2N0eCAq
Y3R4Ow0KPiA+ICsgICAgICAgdTMyIGNnX3N0YXR1czsNCj4gPiArICAgICAgIHVuc2lnbmVkIGlu
dCBkZWNfZG9uZV9zdGF0dXM7DQo+ID4gKyAgICAgICB2b2lkIF9faW9tZW0gKnZkZWNfbWlzY19h
ZGRyID0gZGV2LT5yZWdfYmFzZVtWREVDX0hXX01JU0NdDQo+ID4gKw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWREVDX0lSUV9DRkdfUkVHOw0KPiA+ICsNCj4g
PiArICAgICAgIGN0eCA9IG10a192Y29kZWNfZ2V0X2N1cnJfY3R4KGRldi0+bWFpbl9kZXYpOw0K
PiA+ICsNCj4gPiArICAgICAgIC8qIGNoZWNrIGlmIEhXIGFjdGl2ZSBvciBub3QgKi8NCj4gPiAr
ICAgICAgIGNnX3N0YXR1cyA9IHJlYWRsKGRldi0+cmVnX2Jhc2VbVkRFQ19IV19TWVNdKTsNCj4g
PiArICAgICAgIGlmIChjZ19zdGF0dXMgJiBWREVDX0hXX0FDVElWRSkgew0KPiA+ICsgICAgICAg
ICAgICAgICBtdGtfdjRsMl9lcnIoInZkZWMgYWN0aXZlIGlzIG5vdCAweDAgKDB4JTA4eCkiLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNnX3N0YXR1cyk7DQo+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybiBJUlFfSEFORExFRDsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAg
ICBkZWNfZG9uZV9zdGF0dXMgPSByZWFkbCh2ZGVjX21pc2NfYWRkcik7DQo+ID4gKyAgICAgICBp
ZiAoKGRlY19kb25lX3N0YXR1cyAmIE1US19WREVDX0lSUV9TVEFUVVNfREVDX1NVQ0NFU1MpICE9
DQo+ID4gKyAgICAgICAgICAgTVRLX1ZERUNfSVJRX1NUQVRVU19ERUNfU1VDQ0VTUykNCj4gPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOw0KPiA+ICsNCj4gPiArICAgICAgIC8q
IGNsZWFyIGludGVycnVwdCAqLw0KPiA+ICsgICAgICAgd3JpdGVsKGRlY19kb25lX3N0YXR1cyB8
IFZERUNfSVJRX0NGRywgdmRlY19taXNjX2FkZHIpOw0KPiANCj4gSXMgVkRFQ19JUlFfQ0ZHIGFs
c28gaW50ZW5kZWQgZm9yIGNsZWFyIGludGVycnVwdD8NCj4gDQpWREVDX0lSUV9DRkcgYW5kIFZE
RUNfSVJRX0NMUiBhcmUgZGlmZmVyZW50IGJpdHMgdG8gY2xlYXIgaW50ZXJydXB0Lg0KPiA+ICsg
ICAgICAgd3JpdGVsKGRlY19kb25lX3N0YXR1cyAmIH5WREVDX0lSUV9DTFIsIHZkZWNfbWlzY19h
ZGRyKTsNCj4gPiArDQo+ID4gKyAgICAgICB3YWtlX3VwX2N0eChjdHgsIE1US19JTlNUX0lSUV9S
RUNFSVZFRCk7DQo+ID4gKw0KPiA+ICsgICAgICAgbXRrX3Y0bDJfZGVidWcoMywgIndha2UgdXAg
Y3R4ICVkLCBkZWNfZG9uZV9zdGF0dXM9JXgiLA0KPiA+ICsgICAgICAgICAgICAgICBjdHgtPmlk
LCBkZWNfZG9uZV9zdGF0dXMpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiBJUlFfSEFORExF
RDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBtdGtfdmRlY19od19pbml0X2lycShz
dHJ1Y3QgbXRrX3ZkZWNfaHdfZGV2ICpkZXYpDQo+ID4gK3sNCj4gPiArICAgICAgIHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSBkZXYtPnBsYXRfZGV2Ow0KPiA+ICsgICAgICAgaW50IHJl
dDsNCj4gPiArDQo+ID4gKyAgICAgICBkZXYtPmRlY19pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBk
ZXYsIDApOw0KPiA+ICsgICAgICAgaWYgKGRldi0+ZGVjX2lycSA8IDApIHsNCj4gPiArICAgICAg
ICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIGdldCBpcnEgcmVzb3VyY2Ui
KTsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGRldi0+ZGVjX2lycTsNCj4gPiArICAgICAg
IH0NCj4gPiArDQo+ID4gKyAgICAgICBpcnFfc2V0X3N0YXR1c19mbGFncyhkZXYtPmRlY19pcnEs
IElSUV9OT0FVVE9FTik7DQo+ID4gKyAgICAgICByZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2
LT5kZXYsIGRldi0+ZGVjX2lycSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG10a192ZGVjX2h3X2lycV9oYW5kbGVyLCAwLCBwZGV2LQ0KPiA+ID5uYW1lLCBkZXYpOw0KPiA+
ICsgICAgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5k
ZXYsICJGYWlsZWQgdG8gaW5zdGFsbCBkZXYtPmRlY19pcnEgDQo+ID4gJWQgKCVkKSIsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgZGV2LT5kZWNfaXJxLCByZXQpOw0KPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHJl
dHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IG10a192ZGVjX2h3X3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gK3sNCj4gPiArICAgICAgIHN0cnVj
dCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+ID4gKyAgICAgICBzdHJ1Y3QgbXRrX3ZkZWNf
aHdfZGV2ICpzdWJkZXZfZGV2Ow0KPiA+ICsgICAgICAgc3RydWN0IG10a192Y29kZWNfZGV2ICpt
YWluX2RldjsNCj4gPiArICAgICAgIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm9mX2lkOw0K
PiA+ICsgICAgICAgaW50IGh3X2lkeDsNCj4gPiArICAgICAgIGludCByZXQ7DQo+ID4gKw0KPiA+
ICsgICAgICAgaWYgKCFkZXYtPnBhcmVudCkgew0KPiA+ICsgICAgICAgICAgICAgICBkZXZfZXJy
KGRldiwgIm5vIHBhcmVudCBmb3IgaGFyZHdhcmUgZGV2aWNlcy5cbiIpOw0KPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAg
ICBtYWluX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYtPnBhcmVudCk7DQo+ID4gKyAgICAgICBp
ZiAoIW1haW5fZGV2KSB7DQo+ID4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVk
IHRvIGdldCBwYXJlbnQgZHJpdmVyIGRhdGEiKTsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgc3ViZGV2X2RldiA9
IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqc3ViZGV2X2RldiksDQo+ID4gR0ZQX0tFUk5FTCk7
DQo+ID4gKyAgICAgICBpZiAoIXN1YmRldl9kZXYpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOw0KPiA+ICsNCj4gPiArICAgICAgIHN1YmRldl9kZXYtPnBsYXRfZGV2ID0gcGRl
djsNCj4gPiArICAgICAgIHJldCA9IG10a192Y29kZWNfaW5pdF9kZWNfcG0ocGRldiwgJnN1YmRl
dl9kZXYtPnBtKTsNCj4gPiArICAgICAgIGlmIChyZXQpDQo+ID4gKyAgICAgICAgICAgICAgIHJl
dHVybiByZXQ7DQo+ID4gKw0KPiA+ICsgICAgICAgc3ViZGV2X2Rldi0+cmVnX2Jhc2VbVkRFQ19I
V19NSVNDXSA9DQo+ID4gKyAgICAgICAgICAgICAgIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZShwZGV2LCAwKTsNCj4gPiArICAgICAgIGlmIChJU19FUlIoKF9fZm9yY2Ugdm9pZCAqKXN1
YmRldl9kZXYtDQo+ID4gPnJlZ19iYXNlW1ZERUNfSFdfTUlTQ10pKSB7DQo+ID4gKyAgICAgICAg
ICAgICAgIHJldCA9IFBUUl9FUlIoKF9fZm9yY2Ugdm9pZCAqKXN1YmRldl9kZXYtDQo+ID4gPnJl
Z19iYXNlW1ZERUNfSFdfTUlTQ10pOw0KPiA+ICsgICAgICAgICAgICAgICBnb3RvIGVycjsNCj4g
PiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICByZXQgPSBtdGtfdmRlY19od19pbml0X2ly
cShzdWJkZXZfZGV2KTsNCj4gPiArICAgICAgIGlmIChyZXQpDQo+ID4gKyAgICAgICAgICAgICAg
IGdvdG8gZXJyOw0KPiA+ICsNCj4gPiArICAgICAgIG9mX2lkID0gb2ZfbWF0Y2hfZGV2aWNlKG10
a192ZGVjX2h3X21hdGNoLCBkZXYpOw0KPiA+ICsgICAgICAgaWYgKCFvZl9pZCkgew0KPiA+ICsg
ICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkNhbid0IGdldCB2ZGVjIHN1YmRldiBpZC5cbiIp
Ow0KPiA+ICsgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOw0KPiA+ICsgICAgICAgICAgICAg
ICBnb3RvIGVycjsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICBod19pZHggPSAo
ZW51bSBtdGtfdmRlY19od19pZCkodWludHB0cl90KW9mX2lkLT5kYXRhOw0KPiA+ICsgICAgICAg
aWYgKGh3X2lkeCA+PSBNVEtfVkRFQ19IV19NQVgpIHsNCj4gPiArICAgICAgICAgICAgICAgZGV2
X2VycihkZXYsICJIYXJkd2FyZSBpbmRleCAlZCBub3QgY29ycmVjdC5cbiIsDQo+ID4gaHdfaWR4
KTsNCj4gPiArICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsNCj4gPiArICAgICAgICAgICAg
ICAgZ290byBlcnI7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgbWFpbl9kZXYt
PnN1YmRldl9kZXZbaHdfaWR4XSA9IHN1YmRldl9kZXY7DQo+ID4gKyAgICAgICBzdWJkZXZfZGV2
LT5od19pZHggPSBod19pZHg7DQo+ID4gKyAgICAgICBzdWJkZXZfZGV2LT5tYWluX2RldiA9IG1h
aW5fZGV2Ow0KPiA+ICsgICAgICAgc3ViZGV2X2Rldi0+cmVnX2Jhc2VbVkRFQ19IV19TWVNdID0g
bWFpbl9kZXYtDQo+ID4gPnJlZ19iYXNlW1ZERUNfSFdfU1lTXTsNCj4gPiArICAgICAgIHNldF9i
aXQoc3ViZGV2X2Rldi0+aHdfaWR4LCBtYWluX2Rldi0+c3ViZGV2X2JpdG1hcCk7DQo+ID4gKw0K
PiA+ICsgICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgc3ViZGV2X2Rldik7DQo+ID4g
KyAgICAgICByZXR1cm4gMDsNCj4gPiArZXJyOg0KPiA+ICsgICAgICAgbXRrX3Zjb2RlY19yZWxl
YXNlX2RlY19wbSgmc3ViZGV2X2Rldi0+cG0pOw0KPiA+ICsgICAgICAgcmV0dXJuIHJldDsNCj4g
PiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXRrX3ZkZWNf
ZHJpdmVyID0gew0KPiA+ICsgICAgICAgLnByb2JlICA9IG10a192ZGVjX2h3X3Byb2JlLA0KPiA+
ICsgICAgICAgLmRyaXZlciA9IHsNCj4gPiArICAgICAgICAgICAgICAgLm5hbWUgICA9ICJtdGst
dmRlYy1jb21wIiwNCj4gPiArICAgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gbXRrX3Zk
ZWNfaHdfbWF0Y2gsDQo+ID4gKyAgICAgICB9LA0KPiA+ICt9Ow0KPiA+ICttb2R1bGVfcGxhdGZv
cm1fZHJpdmVyKG10a192ZGVjX2RyaXZlcik7DQo+ID4gKw0KPiA+ICtNT0RVTEVfTElDRU5TRSgi
R1BMIHYyIik7DQo+ID4gK01PRFVMRV9ERVNDUklQVElPTigiTWVkaWF0ZWsgdmlkZW8gZGVjb2Rl
ciBoYXJkd2FyZSBkcml2ZXIiKTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX2h3LmgNCj4gPiBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19ody5oDQo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmY3ZjM2NzkwNjI5ZA0KPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRr
X3Zjb2RlY19kZWNfaHcuaA0KPiA+IEBAIC0wLDAgKzEsNTEgQEANCj4gPiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IChjKSAy
MDIxIE1lZGlhVGVrIEluYy4NCj4gPiArICogQXV0aG9yOiBZdW5mZWkgRG9uZyA8eXVuZmVpLmRv
bmdAbWVkaWF0ZWsuY29tPg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpZm5kZWYgX01US19WQ09E
RUNfREVDX0hXX0hfDQo+ID4gKyNkZWZpbmUgX01US19WQ09ERUNfREVDX0hXX0hfDQo+ID4gKw0K
PiA+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPg0KPiA+ICsNCj4gPiArI2luY2x1ZGUgIm10a192Y29kZWNfZHJ2LmgiDQo+ID4g
Kw0KPiA+ICsjZGVmaW5lIFZERUNfSFdfQUNUSVZFIDB4MTANCj4gPiArI2RlZmluZSBWREVDX0lS
UV9DRkcgMHgxMQ0KPiA+ICsjZGVmaW5lIFZERUNfSVJRX0NMUiAweDEwDQo+ID4gKyNkZWZpbmUg
VkRFQ19JUlFfQ0ZHX1JFRyAweGE0DQo+ID4gKw0KPiA+ICtleHRlcm4gY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZA0KPiA+IG10a192ZGVjX2h3X21hdGNoW01US19WREVDX0hXX01BWF07DQo+ID4g
Kw0KPiA+ICsvKioNCj4gPiArICogZW51bSBtdGtfdmRlY19od19yZWdfaWR4IC0gc3ViZGV2IGhh
cmR3YXJlIHJlZ2lzdGVyIGJhc2UgaW5kZXgNCj4gPiArICovDQo+ID4gK2VudW0gbXRrX3ZkZWNf
aHdfcmVnX2lkeCB7DQo+ID4gKyAgICAgICBWREVDX0hXX1NZUywNCj4gPiArICAgICAgIFZERUNf
SFdfTUlTQywNCj4gPiArICAgICAgIFZERUNfSFdfTUFYDQo+ID4gK307DQo+ID4gKw0KPiA+ICsv
KioNCj4gPiArICogc3RydWN0IG10a192ZGVjX2h3X2RldiAtIHZkZWMgaGFyZHdhcmUgZHJpdmVy
IGRhdGENCj4gPiArICogQHBsYXRfZGV2OiBwbGF0Zm9ybSBkZXZpY2UNCj4gPiArICogQG1haW5f
ZGV2OiBtYWluIGRldmljZQ0KPiA+ICsgKiBAcmVnX2Jhc2U6IE1hcHBlZCBhZGRyZXNzIG9mIE1U
SyBWY29kZWMgcmVnaXN0ZXJzLg0KPiA+ICsgKg0KPiA+ICsgKiBAZGVjX2lycTogZGVjb2RlciBp
cnEgcmVzb3VyY2UNCj4gPiArICogQHBtOiBwb3dlciBtYW5hZ2VtZW50IGNvbnRyb2wNCj4gPiAr
ICogQGh3X2lkeDogZWFjaCBoYXJkd2FyZSBpbmRleA0KPiA+ICsgKi8NCj4gPiArc3RydWN0IG10
a192ZGVjX2h3X2RldiB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwbGF0
X2RldjsNCj4gPiArICAgICAgIHN0cnVjdCBtdGtfdmNvZGVjX2RldiAqbWFpbl9kZXY7DQo+ID4g
KyAgICAgICB2b2lkIF9faW9tZW0gKnJlZ19iYXNlW1ZERUNfSFdfTUFYXTsNCj4gPiArDQo+ID4g
KyAgICAgICBpbnQgZGVjX2lycTsNCj4gPiArICAgICAgIHN0cnVjdCBtdGtfdmNvZGVjX3BtIHBt
Ow0KPiA+ICsgICAgICAgaW50IGh3X2lkeDsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyNlbmRpZiAv
KiBfTVRLX1ZDT0RFQ19ERUNfSFdfSF8gKi8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tdGstDQo+ID4gdmNvZGVjL210a192Y29kZWNfZGVjX3N0YXRlZnVsLmMgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay0NCj4gPiB2Y29kZWMvbXRrX3Zjb2RlY19kZWNfc3Rh
dGVmdWwuYw0KPiA+IGluZGV4IGJlZjQ5MjQ0ZTYxYi4uYzdmOTI1OWFkMDk0IDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19z
dGF0ZWZ1bC5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210
a192Y29kZWNfZGVjX3N0YXRlZnVsLmMNCj4gPiBAQCAtNjI1LDQgKzYyNSw1IEBAIGNvbnN0IHN0
cnVjdCBtdGtfdmNvZGVjX2RlY19wZGF0YQ0KPiA+IG10a192ZGVjXzgxNzNfcGRhdGEgPSB7DQo+
ID4gICAgICAgICAubnVtX2ZyYW1lc2l6ZXMgPSBOVU1fU1VQUE9SVEVEX0ZSQU1FU0laRSwNCj4g
PiAgICAgICAgIC53b3JrZXIgPSBtdGtfdmRlY193b3JrZXIsDQo+ID4gICAgICAgICAuZmx1c2hf
ZGVjb2RlciA9IG10a192ZGVjX2ZsdXNoX2RlY29kZXIsDQo+ID4gKyAgICAgICAuaXNfc3ViZGV2
X3N1cHBvcnRlZCA9IGZhbHNlLA0KPiA+ICB9Ow0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL210ay0NCj4gPiB2Y29kZWMvbXRrX3Zjb2RlY19kZWNfc3RhdGVsZXNzLmMg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay0NCj4gPiB2Y29kZWMvbXRrX3Zjb2RlY19kZWNf
c3RhdGVsZXNzLmMNCj4gPiBpbmRleCAyNmU0ZDZmNGVjMDQuLjJkMjg1NTE1YjYyNSAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19k
ZWNfc3RhdGVsZXNzLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29k
ZWMvbXRrX3Zjb2RlY19kZWNfc3RhdGVsZXNzLmMNCj4gPiBAQCAtMzU3LDYgKzM1Nyw3IEBAIGNv
bnN0IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wZGF0YQ0KPiA+IG10a192ZGVjXzgxODNfcGRhdGEg
PSB7DQo+IA0KPiA4MTczIG1pZ2h0IGJlIG9ubHkgb25lIGZvciBzdGF0ZWZ1bC4gQnV0IHdlIGhh
dmUgbXVsdGlwbGUgcGxhdGZvcm1zDQo+IGZvciA4MTgzLiBTaG91bGRuJ3QgdGhpcyBuYW1lIHJl
ZmxlY3QgdGhpcz8NCj4gDQpUaGlzIHBsYXRmb3JtIGlzIHVzZWQgZm9yIG10ODE4MywgYWxsIG10
ODE4MyBuZWVkIHRvIHVzZWQgaXQuDQpBbmQgODE3MyBpcyBzdGF0ZWZ1bCwgODE4MyBpcyBzdGF0
ZWxlc3MuDQo+ID4gICAgICAgICAudXNlc19zdGF0ZWxlc3NfYXBpID0gdHJ1ZSwNCj4gPiAgICAg
ICAgIC53b3JrZXIgPSBtdGtfdmRlY193b3JrZXIsDQo+ID4gICAgICAgICAuZmx1c2hfZGVjb2Rl
ciA9IG10a192ZGVjX2ZsdXNoX2RlY29kZXIsDQo+ID4gKyAgICAgICAuaXNfc3ViZGV2X3N1cHBv
cnRlZCA9IGZhbHNlLA0KPiA+ICB9Ow0KPiA+IA0KPiA+ICBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2Rl
Y19kZWNfcGRhdGEgbXRrX2xhdF9zaWdfY29yZV9wZGF0YSA9IHsNCj4gPiBAQCAtMzczLDQgKzM3
NCw1IEBAIGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wZGF0YQ0KPiA+IG10a19sYXRfc2ln
X2NvcmVfcGRhdGEgPSB7DQo+IA0KPiBXaGljaCBwbGF0Zm9ybXMgaXMgdGhpcyBzdXBwb3NlZCB0
byBiZSB1c2VkPyBTb21lIGNvbW1lbnRzIG9uIHRoaXMNCj4gbWlnaHQgYmUgaGVscGZ1bC4NCj4g
DQpBZGQgaW4gdjEzLg0KDQpUaGFua3MsDQpZdW5mZWkgRG9uZw0KPiA+ICAgICAgICAgLnVzZXNf
c3RhdGVsZXNzX2FwaSA9IHRydWUsDQo+ID4gICAgICAgICAud29ya2VyID0gbXRrX3ZkZWNfd29y
a2VyLA0KPiA+ICAgICAgICAgLmZsdXNoX2RlY29kZXIgPSBtdGtfdmRlY19mbHVzaF9kZWNvZGVy
LA0KPiA+ICsgICAgICAgLmlzX3N1YmRldl9zdXBwb3J0ZWQgPSB0cnVlLA0KPiA+ICB9Ow0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2Rl
Y19kcnYuaA0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29k
ZWNfZHJ2LmgNCj4gPiBpbmRleCAwZmE5ZDg1MTE0YjkuLjIxNjBmMjYyNjNlZiAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kcnYu
aA0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVj
X2Rydi5oDQo+ID4gQEAgLTkzLDYgKzkzLDE3IEBAIGVudW0gbXRrX2ZtdF90eXBlIHsNCj4gPiAg
ICAgICAgIE1US19GTVRfRlJBTUUgPSAyLA0KPiA+ICB9Ow0KPiA+IA0KPiA+ICsvKioNCj4gPiAr
ICogc3RydWN0IG10a192ZGVjX2h3X2lkIC0gSGFyZHdhcmUgaW5kZXggdXNlZCB0byBzZXBhcmF0
ZQ0KPiA+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgICBkaWZmZXJlbnQgaGFyZHdhcmUNCj4g
PiArICovDQo+ID4gK2VudW0gbXRrX3ZkZWNfaHdfaWQgew0KPiA+ICsgICAgICAgTVRLX1ZERUNf
Q09SRSwNCj4gPiArICAgICAgIE1US19WREVDX0xBVDAsDQo+ID4gKyAgICAgICBNVEtfVkRFQ19M
QVQxLA0KPiA+ICsgICAgICAgTVRLX1ZERUNfSFdfTUFYLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAg
LyoNCj4gPiAgICogc3RydWN0IG10a192aWRlb19mbXQgLSBTdHJ1Y3R1cmUgdXNlZCB0byBzdG9y
ZSBpbmZvcm1hdGlvbg0KPiA+IGFib3V0IHBpeGVsZm9ybWF0cw0KPiA+ICAgKi8NCj4gPiBAQCAt
MzMyLDYgKzM0Myw3IEBAIGVudW0gbXRrX2NoaXAgew0KPiA+ICAgKg0KPiA+ICAgKiBAY2hpcDog
Y2hpcCB0aGlzIGRlY29kZXIgaXMgY29tcGF0aWJsZSB3aXRoDQo+ID4gICAqDQo+ID4gKyAqIEBp
c19zdWJkZXZfc3VwcG9ydGVkOiB3aGV0aGVyIHN1cHBvcnQgcGFyZW50LW5vZGUNCj4gPiBhcmNo
aXRlY3R1cmUoc3ViZGV2KQ0KPiA+ICAgKiBAdXNlc19zdGF0ZWxlc3NfYXBpOiB3aGV0aGVyIHRo
ZSBkZWNvZGVyIHVzZXMgdGhlIHN0YXRlbGVzcyBBUEkNCj4gPiB3aXRoIHJlcXVlc3RzDQo+ID4g
ICAqLw0KPiA+IA0KPiA+IEBAIC0zNTMsNiArMzY1LDcgQEAgc3RydWN0IG10a192Y29kZWNfZGVj
X3BkYXRhIHsNCj4gPiANCj4gPiAgICAgICAgIGVudW0gbXRrX2NoaXAgY2hpcDsNCj4gPiANCj4g
PiArICAgICAgIGJvb2wgaXNfc3ViZGV2X3N1cHBvcnRlZDsNCj4gPiAgICAgICAgIGJvb2wgdXNl
c19zdGF0ZWxlc3NfYXBpOw0KPiA+ICB9Ow0KPiA+IA0KPiA+IEBAIC00MjMsNiArNDM2LDkgQEAg
c3RydWN0IG10a192Y29kZWNfZW5jX3BkYXRhIHsNCj4gPiAgICogQHBtOiBwb3dlciBtYW5hZ2Vt
ZW50IGNvbnRyb2wNCj4gPiAgICogQGRlY19jYXBhYmlsaXR5OiB1c2VkIHRvIGlkZW50aWZ5IGRl
Y29kZSBjYXBhYmlsaXR5LCBleDogNGsNCj4gPiAgICogQGVuY19jYXBhYmlsaXR5OiB1c2VkIHRv
IGlkZW50aWZ5IGVuY29kZSBjYXBhYmlsaXR5DQo+ID4gKyAqDQo+ID4gKyAqIEBzdWJkZXZfZGV2
OiBzdWJkZXYgaGFyZHdhcmUgZGV2aWNlDQo+ID4gKyAqIEBzdWJkZXZfYml0bWFwOiB1c2VkIHRv
IHJlY29yZCBoYXJkd2FyZSBpcyByZWFkeSBvciBub3QNCj4gPiAgICovDQo+ID4gIHN0cnVjdCBt
dGtfdmNvZGVjX2RldiB7DQo+ID4gICAgICAgICBzdHJ1Y3QgdjRsMl9kZXZpY2UgdjRsMl9kZXY7
DQo+ID4gQEAgLTQ2MCw2ICs0NzYsOSBAQCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZXYgew0KPiA+ICAg
ICAgICAgc3RydWN0IG10a192Y29kZWNfcG0gcG07DQo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQg
ZGVjX2NhcGFiaWxpdHk7DQo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgZW5jX2NhcGFiaWxpdHk7
DQo+ID4gKw0KPiA+ICsgICAgICAgdm9pZCAqc3ViZGV2X2RldltNVEtfVkRFQ19IV19NQVhdOw0K
PiA+ICsgICAgICAgREVDTEFSRV9CSVRNQVAoc3ViZGV2X2JpdG1hcCwgTVRLX1ZERUNfSFdfTUFY
KTsNCj4gPiAgfTsNCj4gPiANCj4gPiAgc3RhdGljIGlubGluZSBzdHJ1Y3QgbXRrX3Zjb2RlY19j
dHggKmZoX3RvX2N0eChzdHJ1Y3QgdjRsMl9maCAqZmgpDQo+ID4gLS0NCj4gPiAyLjI1LjENCj4g
PiANCg==

