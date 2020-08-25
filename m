Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC00725119E
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 07:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgHYFjK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 01:39:10 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:35280 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728145AbgHYFjK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 01:39:10 -0400
X-UUID: bd94c9fa368a4a7a80f5ff7bd8c919c9-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=VRegGJ4jV43Hdy8Pytxo0IKxzzf+VLe4lBHE+Uv90dM=;
        b=oYDoh1MCKW1tSpK6SqegVMnHSCYkZNOGtgIdYX2Bnb2sAv2cpr/78Lwx8r/Gmse1ZQtP/WRfxmxkFIZb8XsVvT3Ej9chGGipXP/vmdumfSAala4DCiTp4Sieuz8OWjpbNQXySTf3TyOIVdeAgjwPRdJjnWuGTOOgSXoBV3xkaBk=;
X-UUID: bd94c9fa368a4a7a80f5ff7bd8c919c9-20200825
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <tiffany.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 415149096; Tue, 25 Aug 2020 13:39:06 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 13:39:05 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 13:39:05 +0800
Message-ID: <1598333944.1969.0.camel@mtksdaap41>
Subject: Re: [PATCH v4 14/17] media: mtk-vcodec: venc: use platform data for
 ENUM_FRAMESIZES
From:   Tiffany Lin <tiffany.lin@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>
CC:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Date:   Tue, 25 Aug 2020 13:39:04 +0800
In-Reply-To: <20200821103608.2310097-15-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
         <20200821103608.2310097-15-acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDIwLTA4LTIxIGF0IDE5OjM2ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gdmlkaW9jX2VudW1fZnJhbWVzaXplcygpIGFzc3VtZXMgdGhhdCBhbGwgZW5jb2RlcnMg
c3VwcG9ydCBILjI2NCBhbmQgVlA4LA0KPiB3aGljaCBpcyBub3QgbmVjZXNzYXJpbHkgdHJ1ZSBh
bmQgcmVxdWlyZXMgdG8gZHVwbGljYXRlIGluZm9ybWF0aW9uIGFib3V0DQo+IHRoZSBzdXBwb3J0
ZWQgY29kZWNzIHdoaWNoIGlzIGFscmVhZHkgc3RvcmVkIGluIHRoZSBwbGF0Zm9ybSBkYXRhLg0K
PiANCj4gRml4IHRoaXMgYnkgcmVmZXJyaW5nIHRvIHRoZSBwbGF0Zm9ybSBkYXRhIHRvIGZpbmQg
b3V0IHdoZXRoZXIgYSBnaXZlbg0KPiBmb3JtYXQgaXMgc3VwcG9ydGVkLiBTaW5jZSB0aGUgc3Vw
cG9ydGVkIHNpemVzIGFyZSBhbGwgdGhlIHNhbWUNCj4gcmVnYXJkbGVzcyBvZiB0aGUgZm9ybWF0
LCB3ZSBjYW4gdGhlbiByZXR1cm4gYSBjb3B5IG9mIGEgc3RhdGljIHZhbHVlIGlmDQo+IHRoZSBm
b3JtYXQgaXMgc3VwcG9ydGVkLg0KPiANCg0KQWNrZWQtYnk6IFRpZmZhbnkgTGluIDx0aWZmYW55
LmxpbkBtZWRpYXRlay5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIENvdXJib3Qg
PGFjb3VyYm90QGNocm9taXVtLm9yZz4NCj4gLS0tDQo+ICAuLi4vcGxhdGZvcm0vbXRrLXZjb2Rl
Yy9tdGtfdmNvZGVjX2VuYy5jICAgICAgfCAyNCArKysrKysrKy0tLS0tLS0tLS0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5j
LmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYw0K
PiBpbmRleCAxYTk4MWQ4NDJjMTkuLmY4ZDRmYmU5MjdmOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMNCj4gKysrIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMNCj4gQEAgLTI2
LDE3ICsyNiw5IEBADQo+ICANCj4gIHN0YXRpYyB2b2lkIG10a192ZW5jX3dvcmtlcihzdHJ1Y3Qg
d29ya19zdHJ1Y3QgKndvcmspOw0KPiAgDQo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG10a19jb2Rl
Y19mcmFtZXNpemVzIG10a192ZW5jX2ZyYW1lc2l6ZXNbXSA9IHsNCj4gLQl7DQo+IC0JCS5mb3Vy
Y2MJPSBWNEwyX1BJWF9GTVRfSDI2NCwNCj4gLQkJLnN0ZXB3aXNlID0geyBNVEtfVkVOQ19NSU5f
VywgTVRLX1ZFTkNfTUFYX1csIDE2LA0KPiAtCQkJICAgICAgTVRLX1ZFTkNfTUlOX0gsIE1US19W
RU5DX01BWF9ILCAxNiB9LA0KPiAtCX0sDQo+IC0Jew0KPiAtCQkuZm91cmNjID0gVjRMMl9QSVhf
Rk1UX1ZQOCwNCj4gLQkJLnN0ZXB3aXNlID0geyBNVEtfVkVOQ19NSU5fVywgTVRLX1ZFTkNfTUFY
X1csIDE2LA0KPiAtCQkJICAgICAgTVRLX1ZFTkNfTUlOX0gsIE1US19WRU5DX01BWF9ILCAxNiB9
LA0KPiAtCX0sDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfZnJtc2l6ZV9zdGVwd2lzZSBt
dGtfdmVuY19mcmFtZXNpemVzID0gew0KPiArCU1US19WRU5DX01JTl9XLCBNVEtfVkVOQ19NQVhf
VywgMTYsDQo+ICsJTVRLX1ZFTkNfTUlOX0gsIE1US19WRU5DX01BWF9ILCAxNiwNCj4gIH07DQo+
ICANCj4gICNkZWZpbmUgTlVNX1NVUFBPUlRFRF9GUkFNRVNJWkUgQVJSQVlfU0laRShtdGtfdmVu
Y19mcmFtZXNpemVzKQ0KPiBAQCAtMTM0LDE3ICsxMjYsMjEgQEAgc3RhdGljIGludCB2aWRpb2Nf
ZW51bV9mbXQoc3RydWN0IHY0bDJfZm10ZGVzYyAqZiwNCj4gIHN0YXRpYyBpbnQgdmlkaW9jX2Vu
dW1fZnJhbWVzaXplcyhzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqZmgsDQo+ICAJCQkJICBzdHJ1
Y3QgdjRsMl9mcm1zaXplZW51bSAqZnNpemUpDQo+ICB7DQo+ICsJY29uc3Qgc3RydWN0IG10a192
Y29kZWNfZW5jX3BkYXRhICpwZGF0YSA9DQo+ICsJCWZoX3RvX2N0eChmaCktPmRldi0+dmVuY19w
ZGF0YTsNCj4gIAlpbnQgaSA9IDA7DQo+ICANCj4gIAlpZiAoZnNpemUtPmluZGV4ICE9IDApDQo+
ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgDQo+IC0JZm9yIChpID0gMDsgaSA8IE5VTV9TVVBQT1JU
RURfRlJBTUVTSVpFOyArK2kpIHsNCj4gLQkJaWYgKGZzaXplLT5waXhlbF9mb3JtYXQgIT0gbXRr
X3ZlbmNfZnJhbWVzaXplc1tpXS5mb3VyY2MpDQo+ICsJZm9yIChpID0gMDsgaSA8IHBkYXRhLT5u
dW1fY2FwdHVyZV9mb3JtYXRzOyArK2kpIHsNCj4gKwkJY29uc3Qgc3RydWN0IG10a192aWRlb19m
bXQgKmZtdCA9ICZwZGF0YS0+Y2FwdHVyZV9mb3JtYXRzW2ldOw0KPiArDQo+ICsJCWlmIChmc2l6
ZS0+cGl4ZWxfZm9ybWF0ICE9IGZtdC0+Zm91cmNjKQ0KPiAgCQkJY29udGludWU7DQo+ICANCj4g
IAkJZnNpemUtPnR5cGUgPSBWNEwyX0ZSTVNJWkVfVFlQRV9TVEVQV0lTRTsNCj4gLQkJZnNpemUt
PnN0ZXB3aXNlID0gbXRrX3ZlbmNfZnJhbWVzaXplc1tpXS5zdGVwd2lzZTsNCj4gKwkJZnNpemUt
PnN0ZXB3aXNlID0gbXRrX3ZlbmNfZnJhbWVzaXplczsNCj4gIAkJcmV0dXJuIDA7DQo+ICAJfQ0K
PiAgDQoNCg==

