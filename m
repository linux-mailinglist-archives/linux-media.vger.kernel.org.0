Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E23744AB66
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 11:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245270AbhKIKYE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 05:24:04 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:56480 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S245273AbhKIKYA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Nov 2021 05:24:00 -0500
X-UUID: 318ab3fefb5a41b3861666742e535f3b-20211109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=qixhrxsNd93h9WfbpzKUws2e16haCSuiLBS9jrpe5ro=;
        b=MBn+9oyE1jtfJH43yKImkbaXYayJ4fDotFiAm/lN+hHQMZ5nd3mJ3kxSp+8U4LxcudHWmK8GpxgawZi36KG5lM9a+DGYapHKxTF05U03nttZQ8ltzvN9Fa9PIYp+D7kmeQcjATCMvJIzP9fKUDiOLUUHLGVOifdsREkf6uca7aA=;
X-UUID: 318ab3fefb5a41b3861666742e535f3b-20211109
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1653227899; Tue, 09 Nov 2021 18:21:11 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 18:21:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Nov 2021 18:21:08 +0800
Message-ID: <725aba6313f045f2d91a851e5563e35d3f8b754f.camel@mediatek.com>
Subject: Re: [PATCH v8, 03/17] media: mtk-vcodec: Refactor vcodec pm
 interface
From:   "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Tzung-Bi Shih" <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Tzung-Bi Shih <tzungbi@google.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Date:   Tue, 9 Nov 2021 18:21:08 +0800
In-Reply-To: <2a25abdc-691b-9409-15ed-980af460c6c6@collabora.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
         <20211029035527.454-4-yunfei.dong@mediatek.com>
         <2a25abdc-691b-9409-15ed-980af460c6c6@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgZGFmbmEsDQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLg0KT24gRnJpLCAyMDIxLTEw
LTI5IGF0IDEzOjM1ICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3RlOg0KPiANCj4gT24gMjku
MTAuMjEgMDU6NTUsIFl1bmZlaSBEb25nIHdyb3RlOg0KPiA+IFVzaW5nIHRoZSBuZWVkZWQgcGFy
YW0gZm9yIHBtIGluaXQvcmVsZWFzZSBmdW5jdGlvbiBhbmQgcmVtb3ZlDQo+ID4gdW51c2VkDQo+
ID4gcGFyYW0gbXRrZGV2IGluICdzdHJ1Y3QgbXRrX3Zjb2RlY19wbScuDQo+ID4gDQo+ID4gUmV2
aWV3ZWQtYnk6IFR6dW5nLUJpIFNoaWggPHR6dW5nYmlAZ29vZ2xlLmNvbT4NCj4gPiBSZXZpZXdl
ZC1CeTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiA+IGFuZ2Vsb2dpb2FjY2hpbm8u
ZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5mZWkgRG9uZyA8
eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPg0KPiANCj4gSGksDQo+IEkgYWxyZWFkeSBjb21tZW50
ZWQgb24gdjcgdGhhdCBzaW5jZSB0aGUgcG0gaW1wbGVtZW50YXRpb24gZm9yIGRlYw0KPiBhbmQg
ZW5jIGlzIGlkZW50aWNhbCwNCj4geW91IHNob3VsZCBiZXR0ZXIgZG8gdGhlIHNhbWUgcmVmYWN0
b3IgdG8gZW5jIGFuZCBkZWMgb3IgYmV0dGVyDQo+IHJlbW92ZSB0aGUgY29kZSBkdXBsaWNhdGlv
bi4NCj4gDQpBZGQgcGF0Y2ggMTggYW5kIDE5IGluIHY5IHRvIHJlbW92ZSBkZWNvZGVyIGFuZCBl
bmNvZGVyIHBtIGludGVyZmFjZXMuDQo+IFRoYW5rcywNCj4gRGFmbmENCj4gDQpUaGFua3MsDQpZ
dW5mZWkgRG9uZw0KPiA+IC0tLQ0KPiA+ICAgLi4uL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zj
b2RlY19kZWNfZHJ2LmMgIHwgIDYgKystLS0NCj4gPiAgIC4uLi9wbGF0Zm9ybS9tdGstdmNvZGVj
L210a192Y29kZWNfZGVjX3BtLmMgICB8IDIyICsrKysrKysrLS0tLQ0KPiA+IC0tLS0tLS0NCj4g
PiAgIC4uLi9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX3BtLmggICB8ICA1ICsr
Ky0tDQo+ID4gICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2Rydi5oICAgICAg
fCAgMSAtDQo+ID4gICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19wbS5j
ICAgfCAgMSAtDQo+ID4gICA1IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDIwIGRl
bGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMgDQo+ID4gYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMNCj4gPiBpbmRleCAwNTVkNTBl
NTI3MjAuLjNhYzRjMzkzNWU0ZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMNCj4gPiBAQCAtMjQ5
LDcgKzI0OSw3IEBAIHN0YXRpYyBpbnQgbXRrX3Zjb2RlY19wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAJaWYgKElTX0VSUihkZXYtPmZ3X2hhbmRsZXIpKQ0K
PiA+ICAgCQlyZXR1cm4gUFRSX0VSUihkZXYtPmZ3X2hhbmRsZXIpOw0KPiA+ICAgDQo+ID4gLQly
ZXQgPSBtdGtfdmNvZGVjX2luaXRfZGVjX3BtKGRldik7DQo+ID4gKwlyZXQgPSBtdGtfdmNvZGVj
X2luaXRfZGVjX3BtKGRldi0+cGxhdF9kZXYsICZkZXYtPnBtKTsNCj4gPiAgIAlpZiAocmV0IDwg
MCkgew0KPiA+ICAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gZ2V0IG10IHZjb2Rl
YyBjbG9jaw0KPiA+IHNvdXJjZSIpOw0KPiA+ICAgCQlnb3RvIGVycl9kZWNfcG07DQo+ID4gQEAg
LTM3OCw3ICszNzgsNyBAQCBzdGF0aWMgaW50IG10a192Y29kZWNfcHJvYmUoc3RydWN0DQo+ID4g
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgZXJyX2RlY19hbGxvYzoNCj4gPiAgIAl2NGwy
X2RldmljZV91bnJlZ2lzdGVyKCZkZXYtPnY0bDJfZGV2KTsNCj4gPiAgIGVycl9yZXM6DQo+ID4g
LQltdGtfdmNvZGVjX3JlbGVhc2VfZGVjX3BtKGRldik7DQo+ID4gKwltdGtfdmNvZGVjX3JlbGVh
c2VfZGVjX3BtKCZkZXYtPnBtKTsNCj4gPiAgIGVycl9kZWNfcG06DQo+ID4gICAJbXRrX3Zjb2Rl
Y19md19yZWxlYXNlKGRldi0+ZndfaGFuZGxlcik7DQo+ID4gICAJcmV0dXJuIHJldDsNCj4gPiBA
QCAtNDE4LDcgKzQxOCw3IEBAIHN0YXRpYyBpbnQgbXRrX3Zjb2RlY19kZWNfcmVtb3ZlKHN0cnVj
dA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgIAkJdmlkZW9fdW5yZWdpc3Rlcl9k
ZXZpY2UoZGV2LT52ZmRfZGVjKTsNCj4gPiAgIA0KPiA+ICAgCXY0bDJfZGV2aWNlX3VucmVnaXN0
ZXIoJmRldi0+djRsMl9kZXYpOw0KPiA+IC0JbXRrX3Zjb2RlY19yZWxlYXNlX2RlY19wbShkZXYp
Ow0KPiA+ICsJbXRrX3Zjb2RlY19yZWxlYXNlX2RlY19wbSgmZGV2LT5wbSk7DQo+ID4gICAJbXRr
X3Zjb2RlY19md19yZWxlYXNlKGRldi0+ZndfaGFuZGxlcik7DQo+ID4gICAJcmV0dXJuIDA7DQo+
ID4gICB9DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2Rl
Yy9tdGtfdmNvZGVjX2RlY19wbS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12
Y29kZWMvbXRrX3Zjb2RlY19kZWNfcG0uYw0KPiA+IGluZGV4IDYwMzhkYjk2ZjcxYy4uMjBiZDE1
N2E4NTVjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2Rl
Yy9tdGtfdmNvZGVjX2RlY19wbS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstdmNvZGVjL210a192Y29kZWNfZGVjX3BtLmMNCj4gPiBAQCAtMTMsMTggKzEzLDE1IEBADQo+
ID4gICAjaW5jbHVkZSAibXRrX3Zjb2RlY19kZWNfcG0uaCINCj4gPiAgICNpbmNsdWRlICJtdGtf
dmNvZGVjX3V0aWwuaCINCj4gPiAgIA0KPiA+IC1pbnQgbXRrX3Zjb2RlY19pbml0X2RlY19wbShz
dHJ1Y3QgbXRrX3Zjb2RlY19kZXYgKm10a2RldikNCj4gPiAraW50IG10a192Y29kZWNfaW5pdF9k
ZWNfcG0oc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4gPiArCXN0cnVjdCBtdGtfdmNv
ZGVjX3BtICpwbSkNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7DQo+
ID4gLQlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2Ow0KPiA+IC0Jc3RydWN0IG10a192Y29k
ZWNfcG0gKnBtOw0KPiA+ICsJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqbGFyYl9wZGV2Ow0KPiA+
ICAgCXN0cnVjdCBtdGtfdmNvZGVjX2NsayAqZGVjX2NsazsNCj4gPiAgIAlzdHJ1Y3QgbXRrX3Zj
b2RlY19jbGtfaW5mbyAqY2xrX2luZm87DQo+ID4gICAJaW50IGkgPSAwLCByZXQgPSAwOw0KPiA+
ICAgDQo+ID4gLQlwZGV2ID0gbXRrZGV2LT5wbGF0X2RldjsNCj4gPiAtCXBtID0gJm10a2Rldi0+
cG07DQo+ID4gLQlwbS0+bXRrZGV2ID0gbXRrZGV2Ow0KPiA+ICAgCWRlY19jbGsgPSAmcG0tPnZk
ZWNfY2xrOw0KPiA+ICAgCW5vZGUgPSBvZl9wYXJzZV9waGFuZGxlKHBkZXYtPmRldi5vZl9ub2Rl
LCAibWVkaWF0ZWssbGFyYiIsIDApOw0KPiA+ICAgCWlmICghbm9kZSkgew0KPiA+IEBAIC0zMiwx
MyArMjksMTIgQEAgaW50IG10a192Y29kZWNfaW5pdF9kZWNfcG0oc3RydWN0DQo+ID4gbXRrX3Zj
b2RlY19kZXYgKm10a2RldikNCj4gPiAgIAkJcmV0dXJuIC0xOw0KPiA+ICAgCX0NCj4gPiAgIA0K
PiA+IC0JcGRldiA9IG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUobm9kZSk7DQo+ID4gKwlsYXJiX3Bk
ZXYgPSBvZl9maW5kX2RldmljZV9ieV9ub2RlKG5vZGUpOw0KPiA+ICAgCW9mX25vZGVfcHV0KG5v
ZGUpOw0KPiA+IC0JaWYgKFdBUk5fT04oIXBkZXYpKSB7DQo+ID4gKwlpZiAoV0FSTl9PTighbGFy
Yl9wZGV2KSkgew0KPiA+ICAgCQlyZXR1cm4gLTE7DQo+ID4gICAJfQ0KPiA+IC0JcG0tPmxhcmJ2
ZGVjID0gJnBkZXYtPmRldjsNCj4gPiAtCXBkZXYgPSBtdGtkZXYtPnBsYXRfZGV2Ow0KPiA+ICsJ
cG0tPmxhcmJ2ZGVjID0gJmxhcmJfcGRldi0+ZGV2Ow0KPiA+ICAgCXBtLT5kZXYgPSAmcGRldi0+
ZGV2Ow0KPiA+ICAgDQo+ID4gICAJZGVjX2Nsay0+Y2xrX251bSA9DQo+ID4gQEAgLTgyLDEwICs3
OCwxMCBAQCBpbnQgbXRrX3Zjb2RlY19pbml0X2RlY19wbShzdHJ1Y3QNCj4gPiBtdGtfdmNvZGVj
X2RldiAqbXRrZGV2KQ0KPiA+ICAgCXJldHVybiByZXQ7DQo+ID4gICB9DQo+ID4gICANCj4gPiAt
dm9pZCBtdGtfdmNvZGVjX3JlbGVhc2VfZGVjX3BtKHN0cnVjdCBtdGtfdmNvZGVjX2RldiAqZGV2
KQ0KPiA+ICt2b2lkIG10a192Y29kZWNfcmVsZWFzZV9kZWNfcG0oc3RydWN0IG10a192Y29kZWNf
cG0gKnBtKQ0KPiA+ICAgew0KPiA+IC0JcG1fcnVudGltZV9kaXNhYmxlKGRldi0+cG0uZGV2KTsN
Cj4gPiAtCXB1dF9kZXZpY2UoZGV2LT5wbS5sYXJidmRlYyk7DQo+ID4gKwlwbV9ydW50aW1lX2Rp
c2FibGUocG0tPmRldik7DQo+ID4gKwlwdXRfZGV2aWNlKHBtLT5sYXJidmRlYyk7DQo+ID4gICB9
DQo+ID4gICANCj4gPiAgIGludCBtdGtfdmNvZGVjX2RlY19wd19vbihzdHJ1Y3QgbXRrX3Zjb2Rl
Y19wbSAqcG0pDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZj
b2RlYy9tdGtfdmNvZGVjX2RlY19wbS5oDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfcG0uaA0KPiA+IGluZGV4IDI4MGFlYWVmZGI2NS4uYTNk
ZjZhZWY2Y2I5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZj
b2RlYy9tdGtfdmNvZGVjX2RlY19wbS5oDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX3BtLmgNCj4gPiBAQCAtOSw4ICs5LDkgQEANCj4g
PiAgIA0KPiA+ICAgI2luY2x1ZGUgIm10a192Y29kZWNfZHJ2LmgiDQo+ID4gICANCj4gPiAtaW50
IG10a192Y29kZWNfaW5pdF9kZWNfcG0oc3RydWN0IG10a192Y29kZWNfZGV2ICpkZXYpOw0KPiA+
IC12b2lkIG10a192Y29kZWNfcmVsZWFzZV9kZWNfcG0oc3RydWN0IG10a192Y29kZWNfZGV2ICpk
ZXYpOw0KPiA+ICtpbnQgbXRrX3Zjb2RlY19pbml0X2RlY19wbShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2LA0KPiA+ICsJc3RydWN0IG10a192Y29kZWNfcG0gKnBtKTsNCj4gPiArdm9pZCBt
dGtfdmNvZGVjX3JlbGVhc2VfZGVjX3BtKHN0cnVjdCBtdGtfdmNvZGVjX3BtICpwbSk7DQo+ID4g
ICANCj4gPiAgIGludCBtdGtfdmNvZGVjX2RlY19wd19vbihzdHJ1Y3QgbXRrX3Zjb2RlY19wbSAq
cG0pOw0KPiA+ICAgdm9pZCBtdGtfdmNvZGVjX2RlY19wd19vZmYoc3RydWN0IG10a192Y29kZWNf
cG0gKnBtKTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNv
ZGVjL210a192Y29kZWNfZHJ2LmgNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZj
b2RlYy9tdGtfdmNvZGVjX2Rydi5oDQo+ID4gaW5kZXggMWQyMzcwNjA4ZDBkLi4wZmE5ZDg1MTE0
YjkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210
a192Y29kZWNfZHJ2LmgNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29k
ZWMvbXRrX3Zjb2RlY19kcnYuaA0KPiA+IEBAIC0xOTUsNyArMTk1LDYgQEAgc3RydWN0IG10a192
Y29kZWNfcG0gew0KPiA+ICAgCXN0cnVjdCBtdGtfdmNvZGVjX2Nsawl2ZW5jX2NsazsNCj4gPiAg
IAlzdHJ1Y3QgZGV2aWNlCSpsYXJidmVuYzsNCj4gPiAgIAlzdHJ1Y3QgZGV2aWNlCSpkZXY7DQo+
ID4gLQlzdHJ1Y3QgbXRrX3Zjb2RlY19kZXYJKm10a2RldjsNCj4gPiAgIH07DQo+ID4gICANCj4g
PiAgIC8qKg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29k
ZWMvbXRrX3Zjb2RlY19lbmNfcG0uYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGst
dmNvZGVjL210a192Y29kZWNfZW5jX3BtLmMNCj4gPiBpbmRleCAxYjJlNDkzMGVkMjcuLjBjOGM4
Zjg2Nzg4YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29k
ZWMvbXRrX3Zjb2RlY19lbmNfcG0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19wbS5jDQo+ID4gQEAgLTI2LDcgKzI2LDYgQEAgaW50
IG10a192Y29kZWNfaW5pdF9lbmNfcG0oc3RydWN0IG10a192Y29kZWNfZGV2DQo+ID4gKm10a2Rl
dikNCj4gPiAgIAlwZGV2ID0gbXRrZGV2LT5wbGF0X2RldjsNCj4gPiAgIAlwbSA9ICZtdGtkZXYt
PnBtOw0KPiA+ICAgCW1lbXNldChwbSwgMCwgc2l6ZW9mKHN0cnVjdCBtdGtfdmNvZGVjX3BtKSk7
DQo+ID4gLQlwbS0+bXRrZGV2ID0gbXRrZGV2Ow0KPiA+ICAgCXBtLT5kZXYgPSAmcGRldi0+ZGV2
Ow0KPiA+ICAgCWRldiA9ICZwZGV2LT5kZXY7DQo+ID4gICAJZW5jX2NsayA9ICZwbS0+dmVuY19j
bGs7DQo+ID4gDQo=

