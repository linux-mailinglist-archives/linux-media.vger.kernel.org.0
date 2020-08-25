Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9074C2511B1
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 07:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728892AbgHYFsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 01:48:32 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:40391 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728861AbgHYFsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 01:48:30 -0400
X-UUID: aa9a17c92df44c5094811f72fec271e5-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Gj2k2nCRgpGn8wDG6E8zsIIVRy+7rfL5+QIF8gvfJnM=;
        b=qKjjCgkp1m85TWTQ5dIfnOUzPg9It/4+aYSFJJLX9tFBjgnaKl45qOCjL3+uRjUzJ3QBZouGg03gyAGSFMAv7knJtmVT1WZjiPzhSLCXN/8F79MX1IS52Wkow2O4OANFKspfZFHUUt9jz4z8MbOkNM/MZLjz4D1Fql5AsiUdGkM=;
X-UUID: aa9a17c92df44c5094811f72fec271e5-20200825
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <tiffany.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1977490475; Tue, 25 Aug 2020 13:48:26 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 13:48:25 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 13:48:25 +0800
Message-ID: <1598334505.1969.2.camel@mtksdaap41>
Subject: Re: [PATCH v4 16/17] media: mtk-vcodec: venc: set default time per
 frame
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
Date:   Tue, 25 Aug 2020 13:48:25 +0800
In-Reply-To: <20200821103608.2310097-17-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
         <20200821103608.2310097-17-acourbot@chromium.org>
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
ZToNCj4gVGhlIHRpbWUgcGVyIGZyYW1lIHdhcyBsZWZ0IGluaXRpYWxpemVkIHRvIDAvMCwgd2hp
Y2ggbWFrZSB0aGUgZHJpdmVyDQo+IGZhaWwgdjRsMi1jb21wbGlhbmNlLCBhbmQgYWxzbyBsZWF2
ZXMgaXQgcG90ZW50aWFsbHkgZXhwb3NlZCB0byBkb2luZyBhDQo+IGRpdmlzaW9uIGJ5IHplcm8u
DQo+IA0KQWNrZWQtYnk6IFRpZmZhbnkgTGluIDx0aWZmYW55LmxpbkBtZWRpYXRlay5jb20+DQoN
Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QGNocm9taXVtLm9y
Zz4NCj4gLS0tDQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2Rl
Y19lbmMuYyB8IDUgKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zj
b2RlY19lbmMuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVj
X2VuYy5jDQo+IGluZGV4IDFiNzkxODVjZjkyMi4uMDliYWFjMmRiYzM2IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYw0KPiAr
KysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYw0K
PiBAQCAtMjQsNiArMjQsOSBAQA0KPiAgI2RlZmluZSBERlRfQ0ZHX0hFSUdIVAlNVEtfVkVOQ19N
SU5fSA0KPiAgI2RlZmluZSBNVEtfTUFYX0NUUkxTX0hJTlQJMjANCj4gIA0KPiArI2RlZmluZSBN
VEtfREVGQVVMVF9GUkFNRVJBVEVfTlVNIDEwMDENCj4gKyNkZWZpbmUgTVRLX0RFRkFVTFRfRlJB
TUVSQVRFX0RFTk9NIDMwMDAwDQo+ICsNCj4gIHN0YXRpYyB2b2lkIG10a192ZW5jX3dvcmtlcihz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspOw0KPiAgDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHY0
bDJfZnJtc2l6ZV9zdGVwd2lzZSBtdGtfdmVuY19mcmFtZXNpemVzID0gew0KPiBAQCAtMTE5Nyw2
ICsxMjAwLDggQEAgdm9pZCBtdGtfdmNvZGVjX2VuY19zZXRfZGVmYXVsdF9wYXJhbXMoc3RydWN0
IG10a192Y29kZWNfY3R4ICpjdHgpDQo+ICAJCURGVF9DRkdfV0lEVEggKiBERlRfQ0ZHX0hFSUdI
VDsNCj4gIAljdHgtPnFfZGF0YVtNVEtfUV9EQVRBX0RTVF0uYnl0ZXNwZXJsaW5lWzBdID0gMDsN
Cj4gIA0KPiArCWN0eC0+ZW5jX3BhcmFtcy5mcmFtZXJhdGVfbnVtID0gTVRLX0RFRkFVTFRfRlJB
TUVSQVRFX05VTTsNCj4gKwljdHgtPmVuY19wYXJhbXMuZnJhbWVyYXRlX2Rlbm9tID0gTVRLX0RF
RkFVTFRfRlJBTUVSQVRFX0RFTk9NOw0KPiAgfQ0KPiAgDQo+ICBpbnQgbXRrX3Zjb2RlY19lbmNf
Y3RybHNfc2V0dXAoc3RydWN0IG10a192Y29kZWNfY3R4ICpjdHgpDQoNCg==

