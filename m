Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D072320028A
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 09:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbgFSHMo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 03:12:44 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:31793 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729080AbgFSHMl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 03:12:41 -0400
X-UUID: 2a41c7a71e8548eb9f4581e19eb902ed-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=sU2yodu52kHAngph3lY1etIFjGoRAmnTFcEZex/XlNw=;
        b=rJanF4yEjLeVa/C488ipGMWhq74NWKx7ZOgfTwXvvx4C/wS7EMo/kvDpaHrW3P278ZM018nCxuf69QdYJnWh7+2kWMgmz5MzNIHazlu4IjE6GqeAbh3uBmzX55zZOwyvL9t+f1JusihGNIR6aYO1hNdxX+To07zuZBcHlFrgpLQ=;
X-UUID: 2a41c7a71e8548eb9f4581e19eb902ed-20200619
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <tiffany.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1634906651; Fri, 19 Jun 2020 15:12:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 15:12:35 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jun 2020 15:12:35 +0800
Message-ID: <1592550754.23952.4.camel@mtksdaap41>
Subject: Re: [PATCH 08/10] media: mtk-vcodec: add support for MT8183 encoder
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
Date:   Fri, 19 Jun 2020 15:12:34 +0800
In-Reply-To: <20200520082723.96136-9-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
         <20200520082723.96136-9-acourbot@chromium.org>
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
ZToNCj4gRnJvbTogWXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+
IE5vdyB0aGF0IGFsbCB0aGUgc3VwcG9ydGluZyBibG9ja3MgYXJlIHByZXNlbnQsIGVuYWJsZSBl
bmNvZGVyIGZvcg0KPiBNVDgxODMuDQo+IA0KDQpBY2tlZC1ieTogVGlmZmFueSBMaW4gPHRpZmZh
bnkubGluQG1lZGlhdGVrLmNvbT4NCg0KDQo+IFNpZ25lZC1vZmYtYnk6IFl1bmZlaSBEb25nIDx5
dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+IFthY291cmJvdDogcmVmYWN0b3IsIGNsZWFudXAg
YW5kIHNwbGl0XQ0KPiBDby1kZXZlbG9wZWQtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJv
dEBjaHJvbWl1bS5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291
cmJvdEBjaHJvbWl1bS5vcmc+DQo+IC0tLQ0KPiAgLi4uL3BsYXRmb3JtL210ay12Y29kZWMvbXRr
X3Zjb2RlY19kcnYuaCAgICAgIHwgIDEgKw0KPiAgLi4uL3BsYXRmb3JtL210ay12Y29kZWMvbXRr
X3Zjb2RlY19lbmNfZHJ2LmMgIHwgMjIgKysrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZHJ2LmggYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kcnYuaA0KPiBpbmRleCA1OWI0Yjc1MDY2NmIu
LmEyNzE2MTE3NTBhZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGst
dmNvZGVjL210a192Y29kZWNfZHJ2LmgNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstdmNvZGVjL210a192Y29kZWNfZHJ2LmgNCj4gQEAgLTMwMiw2ICszMDIsNyBAQCBzdHJ1Y3Qg
bXRrX3Zjb2RlY19jdHggew0KPiAgDQo+ICBlbnVtIG10a19jaGlwIHsNCj4gIAlNVEtfTVQ4MTcz
LA0KPiArCU1US19NVDgxODMsDQo+ICB9Ow0KPiAgDQo+ICAvKioNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19kcnYuYyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19kcnYuYw0KPiBp
bmRleCBjOGE0Yjg1YTgxYzQuLmI4ZmU0MDhkZDZjNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jX2Rydi5jDQo+ICsrKyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19kcnYuYw0KPiBA
QCAtNjIsNiArNjIsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfdmlkZW9fZm10IG10a192
aWRlb19mb3JtYXRzX2NhcHR1cmVfbXQ4MTczW10gPSAgew0KPiAgCX0sDQo+ICB9Ow0KPiAgDQo+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a192aWRlb19mbXQgbXRrX3ZpZGVvX2Zvcm1hdHNfY2Fw
dHVyZV9tdDgxODNbXSA9ICB7DQo+ICsJew0KPiArCQkuZm91cmNjID0gVjRMMl9QSVhfRk1UX0gy
NjQsDQo+ICsJCS50eXBlID0gTVRLX0ZNVF9FTkMsDQo+ICsJCS5udW1fcGxhbmVzID0gMSwNCj4g
Kwl9LA0KPiArfTsNCj4gKw0KPiAgLyogV2FrZSB1cCBjb250ZXh0IHdhaXRfcXVldWUgKi8NCj4g
IHN0YXRpYyB2b2lkIHdha2VfdXBfY3R4KHN0cnVjdCBtdGtfdmNvZGVjX2N0eCAqY3R4LCB1bnNp
Z25lZCBpbnQgcmVhc29uKQ0KPiAgew0KPiBAQCAtNDI0LDggKzQzMiwyMiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG10a192Y29kZWNfZW5jX3BkYXRhIG10ODE3M19wZGF0YSA9IHsNCj4gIAkubWF4
X2JpdHJhdGUgPSA0MDAwMDAwLA0KPiAgfTsNCj4gIA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGtfdmNvZGVjX2VuY19wZGF0YSBtdDgxODNfcGRhdGEgPSB7DQo+ICsJLmNoaXAgPSBNVEtfTVQ4
MTgzLA0KPiArCS5oYXNfbHRfaXJxID0gZmFsc2UsDQo+ICsJLnVzZXNfZXh0ID0gdHJ1ZSwNCj4g
KwkuY2FwdHVyZV9mb3JtYXRzID0gbXRrX3ZpZGVvX2Zvcm1hdHNfY2FwdHVyZV9tdDgxODMsDQo+
ICsJLm51bV9jYXB0dXJlX2Zvcm1hdHMgPSBBUlJBWV9TSVpFKG10a192aWRlb19mb3JtYXRzX2Nh
cHR1cmVfbXQ4MTgzKSwNCj4gKwkvKiBNVDgxODMgc3VwcG9ydHMgdGhlIHNhbWUgb3V0cHV0IGZv
cm1hdHMgYXMgTVQ4MTczICovDQo+ICsJLm91dHB1dF9mb3JtYXRzID0gbXRrX3ZpZGVvX2Zvcm1h
dHNfb3V0cHV0X210ODE3MywNCj4gKwkubnVtX291dHB1dF9mb3JtYXRzID0gQVJSQVlfU0laRSht
dGtfdmlkZW9fZm9ybWF0c19vdXRwdXRfbXQ4MTczKSwNCj4gKwkubWluX2JpdHJhdGUgPSA2NCwN
Cj4gKwkubWF4X2JpdHJhdGUgPSA0MDAwMDAwMCwNCj4gK307DQo+ICsNCj4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a192Y29kZWNfZW5jX21hdGNoW10gPSB7DQo+ICAJey5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My12Y29kZWMtZW5jIiwgLmRhdGEgPSAmbXQ4MTcz
X3BkYXRhfSwNCj4gKwl7LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLXZjb2RlYy1lbmMi
LCAuZGF0YSA9ICZtdDgxODNfcGRhdGF9LA0KPiAgCXt9LA0KPiAgfTsNCj4gIE1PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsIG10a192Y29kZWNfZW5jX21hdGNoKTsNCg0K

