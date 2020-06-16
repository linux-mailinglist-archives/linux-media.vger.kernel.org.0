Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDAE1FABDD
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 11:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgFPJG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 05:06:29 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:23447 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725901AbgFPJG2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 05:06:28 -0400
X-UUID: 6a25a40d68cf40a6abafc52b0823ca70-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=yy2c2I/DACjQjjI52CFqNSnT2s8hYTmD36xB1qTyu+A=;
        b=GHYeggtyXIR2QoaGVc24OjQnn9kSMMdeN58zRXwj0t67gbmQmIWKlozfie9DU457RM5IYLkPRmAS56lgTtLOme7NHn/bf9R1MzhTtBHBU1rpxUUCJOLB70ZvKmc6oZ4m5JUE+e6Lw77muDoiXuiNyYXm/fd0qxd2BaDeCMihIxY=;
X-UUID: 6a25a40d68cf40a6abafc52b0823ca70-20200616
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <tiffany.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1348129179; Tue, 16 Jun 2020 17:06:26 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 17:06:25 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Jun 2020 17:06:24 +0800
Message-ID: <1592298384.25202.1.camel@mtksdaap41>
Subject: Re: [PATCH 05/10] media: mtk-vcodec: venc: specify bitrate range
 per-chip
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
Date:   Tue, 16 Jun 2020 17:06:24 +0800
In-Reply-To: <20200520082723.96136-6-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
         <20200520082723.96136-6-acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2A1F73E059354B0B70941DD73A5B39900D0F9FA4C1406B6C5335F99D847CA9412000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIwLTA1LTIwIGF0IDE3OjI3ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gRGlmZmVyZW50IGNoaXBzIGhhdmUgZGlmZmVyZW50IHN1cHBvcnRlZCBiaXRyYXRlIHJh
bmdlcy4gTW92ZSB0aGUgbWluDQo+IGFuZCBtYXggc3VwcG9ydGVkIGJpdHJhdGVzIHRvIHRoZSBw
bGF0Zm9ybSBkYXRhLg0KPiANCg0KQWNrZWQtYnk6IFRpZmZhbnkgTGluIDx0aWZmYW55LmxpbkBt
ZWRpYXRlay5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3Vy
Ym90QGNocm9taXVtLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12
Y29kZWMvbXRrX3Zjb2RlY19kcnYuaCAgICAgfCA0ICsrKysNCj4gIGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuYy5jICAgICB8IDMgKystDQo+ICBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmNfZHJ2LmMgfCAyICsrDQo+
ICAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVj
X2Rydi5oIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZHJ2
LmgNCj4gaW5kZXggZTdiMTU1ZTc0MzJlLi5iOGY5MTNkZThkODAgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2Rydi5oDQo+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2Rydi5oDQo+IEBA
IC0zMTEsMTIgKzMxMSwxNiBAQCBlbnVtIG10a19jaGlwIHsNCj4gICAqDQo+ICAgKiBAdXNlc19l
eHQ6IHdoZXRoZXIgdGhlIGVuY29kZXIgdXNlcyB0aGUgZXh0ZW5kZWQgZmlybXdhcmUgbWVzc2Fn
aW5nIGZvcm1hdA0KPiAgICogQGhhc19sdF9pcnE6IHdoZXRoZXIgdGhlIGVuY29kZXIgdXNlcyB0
aGUgTFQgaXJxDQo+ICsgKiBAbWluX2JpcmF0ZTogbWluaW11bSBzdXBwb3J0ZWQgZW5jb2Rpbmcg
Yml0cmF0ZQ0KPiArICogQG1heF9iaXRyYXRlOiBtYXhpbXVtIHN1cHBvcnRlZCBlbmNvZGluZyBi
aXRyYXRlDQo+ICAgKi8NCj4gIHN0cnVjdCBtdGtfdmNvZGVjX2VuY19wZGF0YSB7DQo+ICAJZW51
bSBtdGtfY2hpcCBjaGlwOw0KPiAgDQo+ICAJYm9vbCB1c2VzX2V4dDsNCj4gIAlib29sIGhhc19s
dF9pcnE7DQo+ICsJdW5zaWduZWQgbG9uZyBtaW5fYml0cmF0ZTsNCj4gKwl1bnNpZ25lZCBsb25n
IG1heF9iaXRyYXRlOw0KPiAgfTsNCj4gIA0KPiAgLyoqDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYyBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuYy5jDQo+IGluZGV4IGQ0NjlmZjY0
NjRiMi4uNTBiYTlkYTU5MTUzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYw0KPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYw0KPiBAQCAtMTIzMiw3ICsxMjMyLDggQEAg
aW50IG10a192Y29kZWNfZW5jX2N0cmxzX3NldHVwKHN0cnVjdCBtdGtfdmNvZGVjX2N0eCAqY3R4
KQ0KPiAgCXY0bDJfY3RybF9oYW5kbGVyX2luaXQoaGFuZGxlciwgTVRLX01BWF9DVFJMU19ISU5U
KTsNCj4gIA0KPiAgCXY0bDJfY3RybF9uZXdfc3RkKGhhbmRsZXIsIG9wcywgVjRMMl9DSURfTVBF
R19WSURFT19CSVRSQVRFLA0KPiAtCQkJMSwgNDAwMDAwMCwgMSwgNDAwMDAwMCk7DQo+ICsJCQkg
IGN0eC0+ZGV2LT52ZW5jX3BkYXRhLT5taW5fYml0cmF0ZSwNCj4gKwkJCSAgY3R4LT5kZXYtPnZl
bmNfcGRhdGEtPm1heF9iaXRyYXRlLCAxLCA0MDAwMDAwKTsNCj4gIAl2NGwyX2N0cmxfbmV3X3N0
ZChoYW5kbGVyLCBvcHMsIFY0TDJfQ0lEX01QRUdfVklERU9fQl9GUkFNRVMsDQo+ICAJCQkwLCAy
LCAxLCAwKTsNCj4gIAl2NGwyX2N0cmxfbmV3X3N0ZChoYW5kbGVyLCBvcHMsIFY0TDJfQ0lEX01Q
RUdfVklERU9fRlJBTUVfUkNfRU5BQkxFLA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jX2Rydi5jIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jX2Rydi5jDQo+IGluZGV4IGMxMzY1MjA5
MjYzZS4uMjIxZmEwMzAzMDc1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmNfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jX2Rydi5jDQo+IEBAIC0zODAsNiArMzgw
LDggQEAgc3RhdGljIGludCBtdGtfdmNvZGVjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a192Y29kZWNfZW5jX3BkYXRhIG10ODE3
M19wZGF0YSA9IHsNCj4gIAkuY2hpcCA9IE1US19NVDgxNzMsDQo+ICAJLmhhc19sdF9pcnEgPSB0
cnVlLA0KPiArCS5taW5fYml0cmF0ZSA9IDEsDQo+ICsJLm1heF9iaXRyYXRlID0gNDAwMDAwMCwN
Cj4gIH07DQo+ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a192Y29k
ZWNfZW5jX21hdGNoW10gPSB7DQoNCg==

