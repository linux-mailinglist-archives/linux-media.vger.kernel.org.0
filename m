Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA463233DAE
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 05:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731271AbgGaDVC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 23:21:02 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:18288 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731244AbgGaDVB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 23:21:01 -0400
X-UUID: 16e9392bd7364aaf890b543b7096d87f-20200731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=LweoCW7u41q+HSMVZXfqKKkgVKA1sH4ZjdqFdMsBerE=;
        b=X9UoXAr6ouk6C9Apo5II03OS1Fx1T22FtxE+95Ff5JIDIh6WaO6FItBBJbMtfL1YxFcWfwCtA/9pwqmoG6R8VwlgdQikunxMs4Ly8fnwqppIf6S/7IqGO14NkY/y0fUwrYzh45+YNBBjK1h5XxT+8ynn7hdb59h06tv5fyc2VqY=;
X-UUID: 16e9392bd7364aaf890b543b7096d87f-20200731
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 129061187; Fri, 31 Jul 2020 11:20:44 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 31 Jul
 2020 11:20:34 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 31 Jul 2020 11:20:30 +0800
Message-ID: <1596165602.17247.10.camel@mhfsdcap03>
Subject: Re: [PATCH v10 22/28] media: platform: Change the call functions of
 getting/enable/disable the jpeg's clock
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        <srv_heupstream@mediatek.com>, <senozhatsky@chromium.org>,
        <mojahsu@chromium.org>, <drinkcat@chromium.org>,
        <maoguang.meng@mediatek.com>
Date:   Fri, 31 Jul 2020 11:20:02 +0800
In-Reply-To: <20200730163419.GA3779380@chromium.org>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
         <20200723030451.5616-23-xia.jiang@mediatek.com>
         <20200730163419.GA3779380@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C3E134842F386A9EE67149A0D56802F68BD2E0220DD0C4A211C8A74D97BFF4552000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVGh1LCAyMDIwLTA3LTMwIGF0IDE2OjM0ICswMDAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4g
SGkgWGlhLA0KPiANCj4gT24gVGh1LCBKdWwgMjMsIDIwMjAgYXQgMTE6MDQ6NDVBTSArMDgwMCwg
WGlhIEppYW5nIHdyb3RlOg0KPiA+IFVzZSB0aGUgZ2VuZXJpYyBvZl9wcm9wZXJ0eV8qIGhlbHBl
cnMgdG8gZ2V0IHRoZSBjbG9ja19udW1zIGFuZCBjbG9ja3MNCj4gPiBmcm9tIGRldmljZSB0cmVl
Lg0KPiA+IFVzZSB0aGUgZ2VuZXJpYyBjbGtfYnVsa18qIGhlbHBlcnMgdG8gZW5hYmxlIGFuZCBk
aXNhYmxlIGNsb2Nrcy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5q
aWFuZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gdjEwOiBuZXcgYWRkIHBhdGNoDQo+ID4g
LS0tDQo+ID4gIC4uLi9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgICB8
IDQ3ICsrKysrKysrKysrKysrKy0tLS0NCj4gPiAgLi4uL21lZGlhL3BsYXRmb3JtL210ay1qcGVn
L210a19qcGVnX2NvcmUuaCAgIHwgIDggKystLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQyIGlu
c2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiANCj4gVGhhbmsgeW91IGZvciB0
aGUgcGF0Y2guIFBsZWFzZSBzZWUgbXkgY29tbWVudHMgaW5saW5lLg0KPiANCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KPiA+IGluZGV4
IDc4ODFlOWM5M2RmNy4uOTIxZWQyMWY3ZGIzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCj4gPiBAQCAtNzgzLDE0ICs3
ODMsMTUgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdfY2xrX29uKHN0cnVjdCBtdGtfanBlZ19kZXYg
KmpwZWcpDQo+ID4gIAlyZXQgPSBtdGtfc21pX2xhcmJfZ2V0KGpwZWctPmxhcmIpOw0KPiA+ICAJ
aWYgKHJldCkNCj4gPiAgCQlkZXZfZXJyKGpwZWctPmRldiwgIm10a19zbWlfbGFyYl9nZXQgbGFy
YnZkZWMgZmFpbCAlZFxuIiwgcmV0KTsNCj4gPiAtCWNsa19wcmVwYXJlX2VuYWJsZShqcGVnLT5j
bGtfamRlY19zbWkpOw0KPiA+IC0JY2xrX3ByZXBhcmVfZW5hYmxlKGpwZWctPmNsa19qZGVjKTsN
Cj4gPiArDQo+ID4gKwlyZXQgPSBjbGtfYnVsa19wcmVwYXJlX2VuYWJsZShqcGVnLT5udW1fY2xr
cywganBlZy0+Y2xrcyk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWRldl9lcnIoanBlZy0+ZGV2
LCAiRmFpbGVkIHRvIG9wZW4ganBlZyBjbGs6ICVkXG4iLCByZXQpOw0KPiA+ICB9DQo+ID4gIA0K
PiA+ICBzdGF0aWMgdm9pZCBtdGtfanBlZ19jbGtfb2ZmKHN0cnVjdCBtdGtfanBlZ19kZXYgKmpw
ZWcpDQo+ID4gIHsNCj4gPiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShqcGVnLT5jbGtfamRlYyk7
DQo+ID4gLQljbGtfZGlzYWJsZV91bnByZXBhcmUoanBlZy0+Y2xrX2pkZWNfc21pKTsNCj4gPiAr
CWNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKGpwZWctPm51bV9jbGtzLCBqcGVnLT5jbGtzKTsN
Cj4gPiAgCW10a19zbWlfbGFyYl9wdXQoanBlZy0+bGFyYik7DQo+ID4gIH0NCj4gPiAgDQo+ID4g
QEAgLTkzOSw2ICs5NDAsNyBAQCBzdGF0aWMgaW50IG10a19qcGVnX2Nsa19pbml0KHN0cnVjdCBt
dGtfanBlZ19kZXYgKmpwZWcpDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9k
ZTsNCj4gPiAgCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7DQo+ID4gKwlpbnQgcmV0LCBp
Ow0KPiA+ICANCj4gPiAgCW5vZGUgPSBvZl9wYXJzZV9waGFuZGxlKGpwZWctPmRldi0+b2Zfbm9k
ZSwgIm1lZGlhdGVrLGxhcmIiLCAwKTsNCj4gPiAgCWlmICghbm9kZSkNCj4gPiBAQCAtOTUyLDEy
ICs5NTQsMzkgQEAgc3RhdGljIGludCBtdGtfanBlZ19jbGtfaW5pdChzdHJ1Y3QgbXRrX2pwZWdf
ZGV2ICpqcGVnKQ0KPiA+ICANCj4gPiAgCWpwZWctPmxhcmIgPSAmcGRldi0+ZGV2Ow0KPiA+ICAN
Cj4gPiAtCWpwZWctPmNsa19qZGVjID0gZGV2bV9jbGtfZ2V0KGpwZWctPmRldiwgImpwZ2RlYyIp
Ow0KPiA+IC0JaWYgKElTX0VSUihqcGVnLT5jbGtfamRlYykpDQo+ID4gLQkJcmV0dXJuIFBUUl9F
UlIoanBlZy0+Y2xrX2pkZWMpOw0KPiA+ICsJanBlZy0+bnVtX2Nsa3MgPQ0KPiA+ICsJCW9mX3By
b3BlcnR5X2NvdW50X3N0cmluZ3MoanBlZy0+ZGV2LT5vZl9ub2RlLCAiY2xvY2stbmFtZXMiKTsN
Cj4gPiArDQo+ID4gKwlpZiAoanBlZy0+bnVtX2Nsa3MgPiAwKSB7DQo+ID4gKwkJanBlZy0+Y2xr
cyA9IGRldm1fa2NhbGxvYyhqcGVnLT5kZXYsIGpwZWctPm51bV9jbGtzLA0KPiA+ICsJCQkJCSAg
c2l6ZW9mKHN0cnVjdCBjbGtfYnVsa19kYXRhKSwNCj4gPiArCQkJCQkgIEdGUF9LRVJORUwpOw0K
PiA+ICsJCWlmICghanBlZy0+Y2xrcykNCj4gPiArCQkJcmV0dXJuIC1FTk9NRU07DQo+ID4gKwl9
IGVsc2Ugew0KPiA+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byBnZXQganBlZyBj
bG9jayBjb3VudFxuIik7DQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKwl9DQo+ID4gKw0K
PiA+ICsJZm9yIChpID0gMDsgaSA8IGpwZWctPm51bV9jbGtzOyBpKyspIHsNCj4gPiArCQlyZXQg
PSBvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZ19pbmRleChqcGVnLT5kZXYtPm9mX25vZGUsDQo+ID4g
KwkJCQkJCSAgICAiY2xvY2stbmFtZXMiLCBpLA0KPiA+ICsJCQkJCQkgICAgJmpwZWctPmNsa3Mt
PmlkKTsNCj4gDQo+IFRoZSBuYW1lcyBvZiB0aGUgY2xvY2tzIG11c3QgYmUgZXhwbGljaXRseSBz
cGVjaWZpZWQgaW4gdGhlIGRyaXZlciwgYXMgcGVyDQo+IHRoZSBEVCBiaW5kaW5ncy4NCkRlYXIg
VG9tYXN6LA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQpZb3UgbWVhbiB0aGF0IEkgc2hv
dWxkIGtlZXAgdGhlIHY5IHZlcnNpb24gYWJvdXQgbmFtZXMgb2YgdGhlIGNsb2NrcyBpbg0KdGhl
IG1hdGNoIGRhdGEuDQpUaGUgdjEwIHZlcnNpb24gYWJvdXQgdGhlIG5hbWVzIG9mIHRoZSBjbG9j
a3MgZm9sbG93cyB0aGUgdXBzdHJlYW1lZA0KbXRrX3ZlbmMvdmRlYy5JIHRoaW5rIHRoYXQgdGhp
cyBtZXRob2QgaXMgbW9yZSBnZW5lcmljLiBGb3IgZXhhbXBsZSx3aGVuDQpvdGhlciBwcm9qZWN0
IGhhcyBtb3JlIGNsb2Nrcywgd2UgY2FuIGdldCB0aGUgbmFtZXMgb2YgY2xvY2tzIGZyb20gZHRz
aQ0Kd2l0aG91dCBjaGFuZ2luZyB0aGUgZHJpdmVyIGNvZGUuDQpXaGF0IGFib3V0IHlvdXIgZnVy
dGhlciBvcGluaW9uPyANCg0KQmVzdCBSZWdhcmRzLA0KWGlhIEppYW5nDQo+IA0KPiBCZXN0IHJl
Z2FyZHMsDQo+IFRvbWFzeg0KDQo=

