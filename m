Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52972002B1
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 09:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730163AbgFSH0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 03:26:47 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:43498 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729548AbgFSH0p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 03:26:45 -0400
X-UUID: cb4e97cc38a6451881bb3c3d3bf66cf3-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=eQoJ9KXWB/1E7lE5XEnrCQlWfnxepw1IVr/KHwvdxvg=;
        b=i/Q5ongTL/UYfpEV17QRNVPf4radt65Bs/SCOjsjzfxELnXGIgP+8hXqyfwnFSzeym0Wu/nWjwNVKKcurnEj4+0admKpC2FEqfLbIpCpvv/kRocpp8i8xXi3269434AfFAnc/BUPvHUSMMQI1encrYm3OYHM+SfV4+ExieKxYHQ=;
X-UUID: cb4e97cc38a6451881bb3c3d3bf66cf3-20200619
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <tiffany.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1164342137; Fri, 19 Jun 2020 15:26:36 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 15:26:35 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jun 2020 15:26:34 +0800
Message-ID: <1592551593.32358.1.camel@mtksdaap41>
Subject: Re: [PATCH 06/10] media: mtk-vcodec: venc: specify supported
 formats per-chip
From:   Tiffany Lin <tiffany.lin@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>
CC:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        "Pi-Hsun Shih" <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Date:   Fri, 19 Jun 2020 15:26:33 +0800
In-Reply-To: <20200520082723.96136-7-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
         <20200520082723.96136-7-acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIwLTA1LTIwIGF0IDE3OjI3ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gRGlmZmVyZW50IGNoaXBzIGhhdmUgZGlmZmVyZW50IHN1cHBvcnRlZCBiaXRyYXRlIHJh
bmdlcy4gTW92ZSB0aGUgbGlzdA0KPiBvZiBzdXBwb3J0ZWQgZm9ybWF0cyB0byB0aGUgcGxhdGZv
cm0gZGF0YSwgYW5kIHNwbGl0IHRoZSBvdXRwdXQgYW5kDQo+IGNhcHR1cmUgZm9ybWF0cyBpbnRv
IHR3byBsaXN0cyB0byBtYWtlIGl0IGVhc2llciB0byBmaW5kIHRoZSBkZWZhdWx0DQo+IGZvcm1h
dCBmb3IgZWFjaCBxdWV1ZS4NCj4gDQoNCkRvZXMgdGhpcyBwYXRjaCBwYXNzIHY0bDIgY29tcGxp
YW5jZSB0ZXN0Pw0KDQoNCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3Vy
Ym90QGNocm9taXVtLm9yZz4NCj4gLS0tDQo+ICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtf
dmNvZGVjX2Rydi5oICAgICAgfCAgIDggKysNCj4gIC4uLi9wbGF0Zm9ybS9tdGstdmNvZGVjL210
a192Y29kZWNfZW5jLmMgICAgICB8IDEyMiArKysrKysrLS0tLS0tLS0tLS0NCj4gIC4uLi9wbGF0
Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jX2Rydi5jICB8ICA0MCArKysrKysNCj4gIDMg
ZmlsZXMgY2hhbmdlZCwgOTUgaW5zZXJ0aW9ucygrKSwgNzUgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNf
ZHJ2LmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kcnYu
aA0KPiBpbmRleCBiOGY5MTNkZThkODAuLjU5YjRiNzUwNjY2YiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZHJ2LmgNCj4gKysrIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZHJ2LmgNCj4gQEAg
LTMxMyw2ICszMTMsMTAgQEAgZW51bSBtdGtfY2hpcCB7DQo+ICAgKiBAaGFzX2x0X2lycTogd2hl
dGhlciB0aGUgZW5jb2RlciB1c2VzIHRoZSBMVCBpcnENCj4gICAqIEBtaW5fYmlyYXRlOiBtaW5p
bXVtIHN1cHBvcnRlZCBlbmNvZGluZyBiaXRyYXRlDQo+ICAgKiBAbWF4X2JpdHJhdGU6IG1heGlt
dW0gc3VwcG9ydGVkIGVuY29kaW5nIGJpdHJhdGUNCj4gKyAqIEBjYXB0dXJlX2Zvcm1hdHM6IGFy
cmF5IG9mIHN1cHBvcnRlZCBjYXB0dXJlIGZvcm1hdHMNCj4gKyAqIEBudW1fY2FwdHVyZV9mb3Jt
YXRzOiBudW1iZXIgb2YgZW50cmllcyBpbiBjYXB0dXJlX2Zvcm1hdHMNCj4gKyAqIEBvdXRwdXRf
Zm9ybWF0czogYXJyYXkgb2Ygc3VwcG9ydGVkIG91dHB1dCBmb3JtYXRzDQo+ICsgKiBAbnVtX291
dHB1dF9mb3JtYXRzOiBudW1iZXIgb2YgZW50cmllcyBpbiBvdXRwdXRfZm9ybWF0cw0KPiAgICov
DQo+ICBzdHJ1Y3QgbXRrX3Zjb2RlY19lbmNfcGRhdGEgew0KPiAgCWVudW0gbXRrX2NoaXAgY2hp
cDsNCj4gQEAgLTMyMSw2ICszMjUsMTAgQEAgc3RydWN0IG10a192Y29kZWNfZW5jX3BkYXRhIHsN
Cj4gIAlib29sIGhhc19sdF9pcnE7DQo+ICAJdW5zaWduZWQgbG9uZyBtaW5fYml0cmF0ZTsNCj4g
IAl1bnNpZ25lZCBsb25nIG1heF9iaXRyYXRlOw0KPiArCWNvbnN0IHN0cnVjdCBtdGtfdmlkZW9f
Zm10ICpjYXB0dXJlX2Zvcm1hdHM7DQo+ICsJc2l6ZV90IG51bV9jYXB0dXJlX2Zvcm1hdHM7DQo+
ICsJY29uc3Qgc3RydWN0IG10a192aWRlb19mbXQgKm91dHB1dF9mb3JtYXRzOw0KPiArCXNpemVf
dCBudW1fb3V0cHV0X2Zvcm1hdHM7DQo+ICB9Ow0KPiAgDQo+ICAvKioNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuYy5jIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMNCj4gaW5kZXgg
NTBiYTlkYTU5MTUzLi4wNTc0M2E3NDVhMTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuYy5jDQo+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuYy5jDQo+IEBAIC0yMyw0NyArMjMs
OSBAQA0KPiAgI2RlZmluZSBERlRfQ0ZHX1dJRFRICU1US19WRU5DX01JTl9XDQo+ICAjZGVmaW5l
IERGVF9DRkdfSEVJR0hUCU1US19WRU5DX01JTl9IDQo+ICAjZGVmaW5lIE1US19NQVhfQ1RSTFNf
SElOVAkyMA0KPiAtI2RlZmluZSBPVVRfRk1UX0lEWAkJMA0KPiAtI2RlZmluZSBDQVBfRk1UX0lE
WAkJNA0KPiAtDQo+ICANCj4gIHN0YXRpYyB2b2lkIG10a192ZW5jX3dvcmtlcihzdHJ1Y3Qgd29y
a19zdHJ1Y3QgKndvcmspOw0KPiAgDQo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG10a192aWRlb19m
bXQgbXRrX3ZpZGVvX2Zvcm1hdHNbXSA9IHsNCj4gLQl7DQo+IC0JCS5mb3VyY2MgPSBWNEwyX1BJ
WF9GTVRfTlYxMk0sDQo+IC0JCS50eXBlID0gTVRLX0ZNVF9GUkFNRSwNCj4gLQkJLm51bV9wbGFu
ZXMgPSAyLA0KPiAtCX0sDQo+IC0Jew0KPiAtCQkuZm91cmNjID0gVjRMMl9QSVhfRk1UX05WMjFN
LA0KPiAtCQkudHlwZSA9IE1US19GTVRfRlJBTUUsDQo+IC0JCS5udW1fcGxhbmVzID0gMiwNCj4g
LQl9LA0KPiAtCXsNCj4gLQkJLmZvdXJjYyA9IFY0TDJfUElYX0ZNVF9ZVVY0MjBNLA0KPiAtCQku
dHlwZSA9IE1US19GTVRfRlJBTUUsDQo+IC0JCS5udW1fcGxhbmVzID0gMywNCj4gLQl9LA0KPiAt
CXsNCj4gLQkJLmZvdXJjYyA9IFY0TDJfUElYX0ZNVF9ZVlU0MjBNLA0KPiAtCQkudHlwZSA9IE1U
S19GTVRfRlJBTUUsDQo+IC0JCS5udW1fcGxhbmVzID0gMywNCj4gLQl9LA0KPiAtCXsNCj4gLQkJ
LmZvdXJjYyA9IFY0TDJfUElYX0ZNVF9IMjY0LA0KPiAtCQkudHlwZSA9IE1US19GTVRfRU5DLA0K
PiAtCQkubnVtX3BsYW5lcyA9IDEsDQo+IC0JfSwNCj4gLQl7DQo+IC0JCS5mb3VyY2MgPSBWNEwy
X1BJWF9GTVRfVlA4LA0KPiAtCQkudHlwZSA9IE1US19GTVRfRU5DLA0KPiAtCQkubnVtX3BsYW5l
cyA9IDEsDQo+IC0JfSwNCj4gLX07DQo+IC0NCj4gLSNkZWZpbmUgTlVNX0ZPUk1BVFMgQVJSQVlf
U0laRShtdGtfdmlkZW9fZm9ybWF0cykNCj4gLQ0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtf
Y29kZWNfZnJhbWVzaXplcyBtdGtfdmVuY19mcmFtZXNpemVzW10gPSB7DQo+ICAJew0KPiAgCQku
Zm91cmNjCT0gVjRMMl9QSVhfRk1UX0gyNjQsDQo+IEBAIC0xNTYsMjcgKzExOCwxNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHY0bDJfY3RybF9vcHMgbXRrX3Zjb2RlY19lbmNfY3RybF9vcHMgPSB7
DQo+ICAJLnNfY3RybCA9IHZpZGlvY192ZW5jX3NfY3RybCwNCj4gIH07DQo+ICANCj4gLXN0YXRp
YyBpbnQgdmlkaW9jX2VudW1fZm10KHN0cnVjdCB2NGwyX2ZtdGRlc2MgKmYsIGJvb2wgb3V0cHV0
X3F1ZXVlKQ0KPiArc3RhdGljIGludCB2aWRpb2NfZW51bV9mbXQoc3RydWN0IHY0bDJfZm10ZGVz
YyAqZiwNCj4gKwkJCSAgIGNvbnN0IHN0cnVjdCBtdGtfdmlkZW9fZm10ICpmb3JtYXRzLA0KPiAr
CQkJICAgc2l6ZV90IG51bV9mb3JtYXRzKQ0KPiAgew0KPiAtCWNvbnN0IHN0cnVjdCBtdGtfdmlk
ZW9fZm10ICpmbXQ7DQo+IC0JaW50IGksIGogPSAwOw0KPiArCWlmIChmLT5pbmRleCA+PSBudW1f
Zm9ybWF0cykNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICANCj4gLQlmb3IgKGkgPSAwOyBpIDwg
TlVNX0ZPUk1BVFM7ICsraSkgew0KPiAtCQlpZiAob3V0cHV0X3F1ZXVlICYmIG10a192aWRlb19m
b3JtYXRzW2ldLnR5cGUgIT0gTVRLX0ZNVF9GUkFNRSkNCj4gLQkJCWNvbnRpbnVlOw0KPiAtCQlp
ZiAoIW91dHB1dF9xdWV1ZSAmJiBtdGtfdmlkZW9fZm9ybWF0c1tpXS50eXBlICE9IE1US19GTVRf
RU5DKQ0KPiAtCQkJY29udGludWU7DQo+ICsJZi0+cGl4ZWxmb3JtYXQgPSBmb3JtYXRzW2YtPmlu
ZGV4XS5mb3VyY2M7DQo+ICsJbWVtc2V0KGYtPnJlc2VydmVkLCAwLCBzaXplb2YoZi0+cmVzZXJ2
ZWQpKTsNCj4gIA0KPiAtCQlpZiAoaiA9PSBmLT5pbmRleCkgew0KPiAtCQkJZm10ID0gJm10a192
aWRlb19mb3JtYXRzW2ldOw0KPiAtCQkJZi0+cGl4ZWxmb3JtYXQgPSBmbXQtPmZvdXJjYzsNCj4g
LQkJCW1lbXNldChmLT5yZXNlcnZlZCwgMCwgc2l6ZW9mKGYtPnJlc2VydmVkKSk7DQo+IC0JCQly
ZXR1cm4gMDsNCj4gLQkJfQ0KPiAtCQkrK2o7DQo+IC0JfQ0KPiAtDQo+IC0JcmV0dXJuIC1FSU5W
QUw7DQo+ICsJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbnQgdmlkaW9jX2VudW1f
ZnJhbWVzaXplcyhzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqZmgsDQo+IEBAIC0yMDIsMTMgKzE1
NCwyMSBAQCBzdGF0aWMgaW50IHZpZGlvY19lbnVtX2ZyYW1lc2l6ZXMoc3RydWN0IGZpbGUgKmZp
bGUsIHZvaWQgKmZoLA0KPiAgc3RhdGljIGludCB2aWRpb2NfZW51bV9mbXRfdmlkX2NhcChzdHJ1
Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJpdiwNCj4gIAkJCQkgICBzdHJ1Y3QgdjRsMl9mbXRkZXNj
ICpmKQ0KPiAgew0KPiAtCXJldHVybiB2aWRpb2NfZW51bV9mbXQoZiwgZmFsc2UpOw0KPiArCWNv
bnN0IHN0cnVjdCBtdGtfdmNvZGVjX2VuY19wZGF0YSAqcGRhdGEgPQ0KPiArCQlmaF90b19jdHgo
cHJpdiktPmRldi0+dmVuY19wZGF0YTsNCj4gKw0KPiArCXJldHVybiB2aWRpb2NfZW51bV9mbXQo
ZiwgcGRhdGEtPmNhcHR1cmVfZm9ybWF0cywNCj4gKwkJCSAgICAgICBwZGF0YS0+bnVtX2NhcHR1
cmVfZm9ybWF0cyk7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbnQgdmlkaW9jX2VudW1fZm10X3Zp
ZF9vdXQoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQo+ICAJCQkJICAgc3RydWN0IHY0
bDJfZm10ZGVzYyAqZikNCj4gIHsNCj4gLQlyZXR1cm4gdmlkaW9jX2VudW1fZm10KGYsIHRydWUp
Ow0KPiArCWNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2VuY19wZGF0YSAqcGRhdGEgPQ0KPiArCQlm
aF90b19jdHgocHJpdiktPmRldi0+dmVuY19wZGF0YTsNCj4gKw0KPiArCXJldHVybiB2aWRpb2Nf
ZW51bV9mbXQoZiwgcGRhdGEtPm91dHB1dF9mb3JtYXRzLA0KPiArCQkJICAgICAgIHBkYXRhLT5u
dW1fb3V0cHV0X2Zvcm1hdHMpOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgaW50IHZpZGlvY192ZW5j
X3F1ZXJ5Y2FwKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LA0KPiBAQCAtMjY2LDEzICsy
MjYsMjAgQEAgc3RhdGljIHN0cnVjdCBtdGtfcV9kYXRhICptdGtfdmVuY19nZXRfcV9kYXRhKHN0
cnVjdCBtdGtfdmNvZGVjX2N0eCAqY3R4LA0KPiAgCXJldHVybiAmY3R4LT5xX2RhdGFbTVRLX1Ff
REFUQV9EU1RdOw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG10a192aWRlb19m
bXQgKm10a192ZW5jX2ZpbmRfZm9ybWF0KHN0cnVjdCB2NGwyX2Zvcm1hdCAqZikNCj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgbXRrX3ZpZGVvX2ZtdCAqbXRrX3ZlbmNfZmluZF9mb3JtYXQoc3RydWN0
IHY0bDJfZm9ybWF0ICpmLA0KPiArCWNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2VuY19wZGF0YSAq
cGRhdGEpDQo+ICB7DQo+ICAJY29uc3Qgc3RydWN0IG10a192aWRlb19mbXQgKmZtdDsNCj4gIAl1
bnNpZ25lZCBpbnQgazsNCj4gIA0KPiAtCWZvciAoayA9IDA7IGsgPCBOVU1fRk9STUFUUzsgaysr
KSB7DQo+IC0JCWZtdCA9ICZtdGtfdmlkZW9fZm9ybWF0c1trXTsNCj4gKwlmb3IgKGsgPSAwOyBr
IDwgcGRhdGEtPm51bV9jYXB0dXJlX2Zvcm1hdHM7IGsrKykgew0KPiArCQlmbXQgPSAmcGRhdGEt
PmNhcHR1cmVfZm9ybWF0c1trXTsNCj4gKwkJaWYgKGZtdC0+Zm91cmNjID09IGYtPmZtdC5waXgu
cGl4ZWxmb3JtYXQpDQo+ICsJCQlyZXR1cm4gZm10Ow0KPiArCX0NCj4gKw0KPiArCWZvciAoayA9
IDA7IGsgPCBwZGF0YS0+bnVtX291dHB1dF9mb3JtYXRzOyBrKyspIHsNCj4gKwkJZm10ID0gJnBk
YXRhLT5vdXRwdXRfZm9ybWF0c1trXTsNCj4gIAkJaWYgKGZtdC0+Zm91cmNjID09IGYtPmZtdC5w
aXgucGl4ZWxmb3JtYXQpDQo+ICAJCQlyZXR1cm4gZm10Ow0KPiAgCX0NCj4gQEAgLTQxNCw2ICsz
ODEsNyBAQCBzdGF0aWMgaW50IHZpZGlvY192ZW5jX3NfZm10X2NhcChzdHJ1Y3QgZmlsZSAqZmls
ZSwgdm9pZCAqcHJpdiwNCj4gIAkJCSAgICAgc3RydWN0IHY0bDJfZm9ybWF0ICpmKQ0KPiAgew0K
PiAgCXN0cnVjdCBtdGtfdmNvZGVjX2N0eCAqY3R4ID0gZmhfdG9fY3R4KHByaXYpOw0KPiArCWNv
bnN0IHN0cnVjdCBtdGtfdmNvZGVjX2VuY19wZGF0YSAqcGRhdGEgPSBjdHgtPmRldi0+dmVuY19w
ZGF0YTsNCj4gIAlzdHJ1Y3QgdmIyX3F1ZXVlICp2cTsNCj4gIAlzdHJ1Y3QgbXRrX3FfZGF0YSAq
cV9kYXRhOw0KPiAgCWludCBpLCByZXQ7DQo+IEBAIC00MzYsMTAgKzQwNCwxMCBAQCBzdGF0aWMg
aW50IHZpZGlvY192ZW5jX3NfZm10X2NhcChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJpdiwN
Cj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJfQ0KPiAgDQo+IC0JZm10ID0gbXRrX3ZlbmNfZmlu
ZF9mb3JtYXQoZik7DQo+ICsJZm10ID0gbXRrX3ZlbmNfZmluZF9mb3JtYXQoZiwgcGRhdGEpOw0K
PiAgCWlmICghZm10KSB7DQo+IC0JCWYtPmZtdC5waXgucGl4ZWxmb3JtYXQgPSBtdGtfdmlkZW9f
Zm9ybWF0c1tDQVBfRk1UX0lEWF0uZm91cmNjOw0KPiAtCQlmbXQgPSBtdGtfdmVuY19maW5kX2Zv
cm1hdChmKTsNCj4gKwkJZm10ID0gJmN0eC0+ZGV2LT52ZW5jX3BkYXRhLT5jYXB0dXJlX2Zvcm1h
dHNbMF07DQo+ICsJCWYtPmZtdC5waXgucGl4ZWxmb3JtYXQgPSBmbXQtPmZvdXJjYzsNCj4gIAl9
DQo+ICANCj4gIAlxX2RhdGEtPmZtdCA9IGZtdDsNCj4gQEAgLTQ3Niw2ICs0NDQsNyBAQCBzdGF0
aWMgaW50IHZpZGlvY192ZW5jX3NfZm10X291dChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJp
diwNCj4gIAkJCSAgICAgc3RydWN0IHY0bDJfZm9ybWF0ICpmKQ0KPiAgew0KPiAgCXN0cnVjdCBt
dGtfdmNvZGVjX2N0eCAqY3R4ID0gZmhfdG9fY3R4KHByaXYpOw0KPiArCWNvbnN0IHN0cnVjdCBt
dGtfdmNvZGVjX2VuY19wZGF0YSAqcGRhdGEgPSBjdHgtPmRldi0+dmVuY19wZGF0YTsNCj4gIAlz
dHJ1Y3QgdmIyX3F1ZXVlICp2cTsNCj4gIAlzdHJ1Y3QgbXRrX3FfZGF0YSAqcV9kYXRhOw0KPiAg
CWludCByZXQsIGk7DQo+IEBAIC00OTksMTAgKzQ2OCwxMCBAQCBzdGF0aWMgaW50IHZpZGlvY192
ZW5jX3NfZm10X291dChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJpdiwNCj4gIAkJcmV0dXJu
IC1FSU5WQUw7DQo+ICAJfQ0KPiAgDQo+IC0JZm10ID0gbXRrX3ZlbmNfZmluZF9mb3JtYXQoZik7
DQo+ICsJZm10ID0gbXRrX3ZlbmNfZmluZF9mb3JtYXQoZiwgcGRhdGEpOw0KPiAgCWlmICghZm10
KSB7DQo+IC0JCWYtPmZtdC5waXgucGl4ZWxmb3JtYXQgPSBtdGtfdmlkZW9fZm9ybWF0c1tPVVRf
Rk1UX0lEWF0uZm91cmNjOw0KPiAtCQlmbXQgPSBtdGtfdmVuY19maW5kX2Zvcm1hdChmKTsNCj4g
KwkJZm10ID0gJmN0eC0+ZGV2LT52ZW5jX3BkYXRhLT5vdXRwdXRfZm9ybWF0c1swXTsNCj4gKwkJ
Zi0+Zm10LnBpeC5waXhlbGZvcm1hdCA9IGZtdC0+Zm91cmNjOw0KPiAgCX0NCj4gIA0KPiAgCXBp
eF9mbXRfbXAtPmhlaWdodCA9IGNsYW1wKHBpeF9mbXRfbXAtPmhlaWdodCwNCj4gQEAgLTU4MCwx
MSArNTQ5LDEyIEBAIHN0YXRpYyBpbnQgdmlkaW9jX3RyeV9mbXRfdmlkX2NhcF9tcGxhbmUoc3Ry
dWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQo+ICB7DQo+ICAJY29uc3Qgc3RydWN0IG10a192
aWRlb19mbXQgKmZtdDsNCj4gIAlzdHJ1Y3QgbXRrX3Zjb2RlY19jdHggKmN0eCA9IGZoX3RvX2N0
eChwcml2KTsNCj4gKwljb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19lbmNfcGRhdGEgKnBkYXRhID0g
Y3R4LT5kZXYtPnZlbmNfcGRhdGE7DQo+ICANCj4gLQlmbXQgPSBtdGtfdmVuY19maW5kX2Zvcm1h
dChmKTsNCj4gKwlmbXQgPSBtdGtfdmVuY19maW5kX2Zvcm1hdChmLCBwZGF0YSk7DQo+ICAJaWYg
KCFmbXQpIHsNCj4gLQkJZi0+Zm10LnBpeC5waXhlbGZvcm1hdCA9IG10a192aWRlb19mb3JtYXRz
W0NBUF9GTVRfSURYXS5mb3VyY2M7DQo+IC0JCWZtdCA9IG10a192ZW5jX2ZpbmRfZm9ybWF0KGYp
Ow0KPiArCQlmbXQgPSAmY3R4LT5kZXYtPnZlbmNfcGRhdGEtPmNhcHR1cmVfZm9ybWF0c1swXTsN
Cj4gKwkJZi0+Zm10LnBpeC5waXhlbGZvcm1hdCA9IGZtdC0+Zm91cmNjOw0KPiAgCX0NCj4gIAlm
LT5mbXQucGl4X21wLmNvbG9yc3BhY2UgPSBjdHgtPmNvbG9yc3BhY2U7DQo+ICAJZi0+Zm10LnBp
eF9tcC55Y2Jjcl9lbmMgPSBjdHgtPnljYmNyX2VuYzsNCj4gQEAgLTU5OCwxMSArNTY4LDEzIEBA
IHN0YXRpYyBpbnQgdmlkaW9jX3RyeV9mbXRfdmlkX291dF9tcGxhbmUoc3RydWN0IGZpbGUgKmZp
bGUsIHZvaWQgKnByaXYsDQo+ICAJCQkJCSBzdHJ1Y3QgdjRsMl9mb3JtYXQgKmYpDQo+ICB7DQo+
ICAJY29uc3Qgc3RydWN0IG10a192aWRlb19mbXQgKmZtdDsNCj4gKwlzdHJ1Y3QgbXRrX3Zjb2Rl
Y19jdHggKmN0eCA9IGZoX3RvX2N0eChwcml2KTsNCj4gKwljb25zdCBzdHJ1Y3QgbXRrX3Zjb2Rl
Y19lbmNfcGRhdGEgKnBkYXRhID0gY3R4LT5kZXYtPnZlbmNfcGRhdGE7DQo+ICANCj4gLQlmbXQg
PSBtdGtfdmVuY19maW5kX2Zvcm1hdChmKTsNCj4gKwlmbXQgPSBtdGtfdmVuY19maW5kX2Zvcm1h
dChmLCBwZGF0YSk7DQo+ICAJaWYgKCFmbXQpIHsNCj4gLQkJZi0+Zm10LnBpeC5waXhlbGZvcm1h
dCA9IG10a192aWRlb19mb3JtYXRzW09VVF9GTVRfSURYXS5mb3VyY2M7DQo+IC0JCWZtdCA9IG10
a192ZW5jX2ZpbmRfZm9ybWF0KGYpOw0KPiArCQlmbXQgPSAmY3R4LT5kZXYtPnZlbmNfcGRhdGEt
Pm91dHB1dF9mb3JtYXRzWzBdOw0KPiArCQlmLT5mbXQucGl4LnBpeGVsZm9ybWF0ID0gZm10LT5m
b3VyY2M7DQo+ICAJfQ0KPiAgCWlmICghZi0+Zm10LnBpeF9tcC5jb2xvcnNwYWNlKSB7DQo+ICAJ
CWYtPmZtdC5waXhfbXAuY29sb3JzcGFjZSA9IFY0TDJfQ09MT1JTUEFDRV9SRUM3MDk7DQo+IEBA
IC0xMTg3LDcgKzExNTksNyBAQCB2b2lkIG10a192Y29kZWNfZW5jX3NldF9kZWZhdWx0X3BhcmFt
cyhzdHJ1Y3QgbXRrX3Zjb2RlY19jdHggKmN0eCkNCj4gIAlxX2RhdGEtPmNvZGVkX2hlaWdodCA9
IERGVF9DRkdfSEVJR0hUOw0KPiAgCXFfZGF0YS0+ZmllbGQgPSBWNEwyX0ZJRUxEX05PTkU7DQo+
ICANCj4gLQlxX2RhdGEtPmZtdCA9ICZtdGtfdmlkZW9fZm9ybWF0c1tPVVRfRk1UX0lEWF07DQo+
ICsJcV9kYXRhLT5mbXQgPSAmY3R4LT5kZXYtPnZlbmNfcGRhdGEtPm91dHB1dF9mb3JtYXRzWzBd
Ow0KPiAgDQo+ICAJdjRsX2JvdW5kX2FsaWduX2ltYWdlKCZxX2RhdGEtPmNvZGVkX3dpZHRoLA0K
PiAgCQkJCU1US19WRU5DX01JTl9XLA0KPiBAQCAtMTIxNiw3ICsxMTg4LDcgQEAgdm9pZCBtdGtf
dmNvZGVjX2VuY19zZXRfZGVmYXVsdF9wYXJhbXMoc3RydWN0IG10a192Y29kZWNfY3R4ICpjdHgp
DQo+ICAJbWVtc2V0KHFfZGF0YSwgMCwgc2l6ZW9mKHN0cnVjdCBtdGtfcV9kYXRhKSk7DQo+ICAJ
cV9kYXRhLT5jb2RlZF93aWR0aCA9IERGVF9DRkdfV0lEVEg7DQo+ICAJcV9kYXRhLT5jb2RlZF9o
ZWlnaHQgPSBERlRfQ0ZHX0hFSUdIVDsNCj4gLQlxX2RhdGEtPmZtdCA9ICZtdGtfdmlkZW9fZm9y
bWF0c1tDQVBfRk1UX0lEWF07DQo+ICsJcV9kYXRhLT5mbXQgPSAmY3R4LT5kZXYtPnZlbmNfcGRh
dGEtPmNhcHR1cmVfZm9ybWF0c1swXTsNCj4gIAlxX2RhdGEtPmZpZWxkID0gVjRMMl9GSUVMRF9O
T05FOw0KPiAgCWN0eC0+cV9kYXRhW01US19RX0RBVEFfRFNUXS5zaXplaW1hZ2VbMF0gPQ0KPiAg
CQlERlRfQ0ZHX1dJRFRIICogREZUX0NGR19IRUlHSFQ7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmNfZHJ2LmMgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmNfZHJ2LmMNCj4gaW5kZXgg
MjIxZmEwMzAzMDc1Li5jOGE0Yjg1YTgxYzQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19kcnYuYw0KPiArKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmNfZHJ2LmMNCj4gQEAgLTI2
LDYgKzI2LDQyIEBADQo+ICBtb2R1bGVfcGFyYW0obXRrX3Y0bDJfZGJnX2xldmVsLCBpbnQsIFNf
SVJVR08gfCBTX0lXVVNSKTsNCj4gIG1vZHVsZV9wYXJhbShtdGtfdmNvZGVjX2RiZywgYm9vbCwg
U19JUlVHTyB8IFNfSVdVU1IpOw0KPiAgDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a192aWRl
b19mbXQgbXRrX3ZpZGVvX2Zvcm1hdHNfb3V0cHV0X210ODE3M1tdID0gew0KPiArCXsNCj4gKwkJ
LmZvdXJjYyA9IFY0TDJfUElYX0ZNVF9OVjEyTSwNCj4gKwkJLnR5cGUgPSBNVEtfRk1UX0ZSQU1F
LA0KPiArCQkubnVtX3BsYW5lcyA9IDIsDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS5mb3VyY2MgPSBW
NEwyX1BJWF9GTVRfTlYyMU0sDQo+ICsJCS50eXBlID0gTVRLX0ZNVF9GUkFNRSwNCj4gKwkJLm51
bV9wbGFuZXMgPSAyLA0KPiArCX0sDQo+ICsJew0KPiArCQkuZm91cmNjID0gVjRMMl9QSVhfRk1U
X1lVVjQyME0sDQo+ICsJCS50eXBlID0gTVRLX0ZNVF9GUkFNRSwNCj4gKwkJLm51bV9wbGFuZXMg
PSAzLA0KPiArCX0sDQo+ICsJew0KPiArCQkuZm91cmNjID0gVjRMMl9QSVhfRk1UX1lWVTQyME0s
DQo+ICsJCS50eXBlID0gTVRLX0ZNVF9GUkFNRSwNCj4gKwkJLm51bV9wbGFuZXMgPSAzLA0KPiAr
CX0sDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a192aWRlb19mbXQgbXRr
X3ZpZGVvX2Zvcm1hdHNfY2FwdHVyZV9tdDgxNzNbXSA9ICB7DQo+ICsJew0KPiArCQkuZm91cmNj
ID0gVjRMMl9QSVhfRk1UX0gyNjQsDQo+ICsJCS50eXBlID0gTVRLX0ZNVF9FTkMsDQo+ICsJCS5u
dW1fcGxhbmVzID0gMSwNCj4gKwl9LA0KPiArCXsNCj4gKwkJLmZvdXJjYyA9IFY0TDJfUElYX0ZN
VF9WUDgsDQo+ICsJCS50eXBlID0gTVRLX0ZNVF9FTkMsDQo+ICsJCS5udW1fcGxhbmVzID0gMSwN
Cj4gKwl9LA0KPiArfTsNCj4gKw0KPiAgLyogV2FrZSB1cCBjb250ZXh0IHdhaXRfcXVldWUgKi8N
Cj4gIHN0YXRpYyB2b2lkIHdha2VfdXBfY3R4KHN0cnVjdCBtdGtfdmNvZGVjX2N0eCAqY3R4LCB1
bnNpZ25lZCBpbnQgcmVhc29uKQ0KPiAgew0KPiBAQCAtMzgwLDYgKzQxNiwxMCBAQCBzdGF0aWMg
aW50IG10a192Y29kZWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19lbmNfcGRhdGEgbXQ4MTczX3BkYXRhID0gew0K
PiAgCS5jaGlwID0gTVRLX01UODE3MywNCj4gIAkuaGFzX2x0X2lycSA9IHRydWUsDQo+ICsJLmNh
cHR1cmVfZm9ybWF0cyA9IG10a192aWRlb19mb3JtYXRzX2NhcHR1cmVfbXQ4MTczLA0KPiArCS5u
dW1fY2FwdHVyZV9mb3JtYXRzID0gQVJSQVlfU0laRShtdGtfdmlkZW9fZm9ybWF0c19jYXB0dXJl
X210ODE3MyksDQo+ICsJLm91dHB1dF9mb3JtYXRzID0gbXRrX3ZpZGVvX2Zvcm1hdHNfb3V0cHV0
X210ODE3MywNCj4gKwkubnVtX291dHB1dF9mb3JtYXRzID0gQVJSQVlfU0laRShtdGtfdmlkZW9f
Zm9ybWF0c19vdXRwdXRfbXQ4MTczKSwNCj4gIAkubWluX2JpdHJhdGUgPSAxLA0KPiAgCS5tYXhf
Yml0cmF0ZSA9IDQwMDAwMDAsDQo+ICB9Ow0KDQo=

