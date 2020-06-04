Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF831EDE26
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 09:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgFDH3p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 03:29:45 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:1374 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728145AbgFDH3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 03:29:45 -0400
X-UUID: f159f1d61e624658a837e44e07e2d8e7-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ylDEr3lfKwEawoYHpqUoyNEwFxVCxmRB4bljVi40+Jw=;
        b=DqYqpm1/+15ErFiX6i9L+AloGMX80VAua9Ba79XosgT+BR1Ev8HVva8Aa2ZBeIfbt6+h4iTaRhWuOakNSZNMtdu7yxwmXpTd/UN8+E1yE2dCrwPio53csBwzreoV69OtvvM0ao76NugOHfO/5DLQUQplyePQbLCJmHjinJ5zvzE=;
X-UUID: f159f1d61e624658a837e44e07e2d8e7-20200604
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1337255306; Thu, 04 Jun 2020 15:29:38 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 15:29:34 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 15:29:33 +0800
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        <srv_heupstream@mediatek.com>, <senozhatsky@chromium.org>,
        <mojahsu@chromium.org>, <drinkcat@chromium.org>,
        <maoguang.meng@mediatek.com>, <sj.huang@mediatek.com>,
        Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v9 17/18] media: platform: Rename existing functions/defines/variables
Date:   Thu, 4 Jun 2020 15:27:07 +0800
Message-ID: <20200604072708.9468-18-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200604072708.9468-1-xia.jiang@mediatek.com>
References: <20200604072708.9468-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UmVuYW1lIGV4aXN0aW5nIGZ1bmNpdG9ucy9kZWZpbmVzL3ZhcmlhYmxlcyB3aXRoIGEgIF9kZWMg
cHJlZml4IGFuZA0Kd2l0aG91dCBkZWNfIHByZWZpeCB0byBwcmVwYXJlIGZvciB0aGUgYWRkaXRp
b24gb2YgdGhlIGpwZWcgZW5jb2Rlcg0KZmVhdHVyZS4NCg0KU2lnbmVkLW9mZi1ieTogWGlhIEpp
YW5nIDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2OTogbmV3IHBhdGNoDQotLS0NCiAu
Li4vbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jICAgfCAxOTYgKysrKysr
KysrLS0tLS0tLS0tDQogLi4uL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUu
aCAgIHwgICA4ICstDQogLi4uL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2RlY19o
dy5oIHwgICA3ICstDQogMyBmaWxlcyBjaGFuZ2VkLCAxMDcgaW5zZXJ0aW9ucygrKSwgMTA0IGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBl
Zy9tdGtfanBlZ19jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19q
cGVnX2NvcmUuYw0KaW5kZXggZTBlNTIyYTUwMmUxLi44ZDVhNzhjNzc1YTYgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KKysrIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCkBAIC0yNyw3
ICsyNyw3IEBADQogI2luY2x1ZGUgIm10a19qcGVnX2NvcmUuaCINCiAjaW5jbHVkZSAibXRrX2pw
ZWdfZGVjX3BhcnNlLmgiDQogDQotc3RhdGljIHN0cnVjdCBtdGtfanBlZ19mbXQgbXRrX2pwZWdf
Zm9ybWF0c1tdID0gew0KK3N0YXRpYyBzdHJ1Y3QgbXRrX2pwZWdfZm10IG10a19qcGVnX2RlY19m
b3JtYXRzW10gPSB7DQogCXsNCiAJCS5mb3VyY2MJCT0gVjRMMl9QSVhfRk1UX0pQRUcsDQogCQku
Y29scGxhbmVzCT0gMSwNCkBAIC01Myw3ICs1Myw3IEBAIHN0YXRpYyBzdHJ1Y3QgbXRrX2pwZWdf
Zm10IG10a19qcGVnX2Zvcm1hdHNbXSA9IHsNCiAJfSwNCiB9Ow0KIA0KLSNkZWZpbmUgTVRLX0pQ
RUdfTlVNX0ZPUk1BVFMgQVJSQVlfU0laRShtdGtfanBlZ19mb3JtYXRzKQ0KKyNkZWZpbmUgTVRL
X0pQRUdfREVDX05VTV9GT1JNQVRTIEFSUkFZX1NJWkUobXRrX2pwZWdfZGVjX2Zvcm1hdHMpDQog
DQogc3RydWN0IG10a19qcGVnX3NyY19idWYgew0KIAlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyIGI7
DQpAQCAtNzUsMTIgKzc1LDEyIEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IG10a19qcGVnX3NyY19i
dWYgKm10a19qcGVnX3ZiMl90b19zcmNidWYoDQogCXJldHVybiBjb250YWluZXJfb2YodG9fdmIy
X3Y0bDJfYnVmZmVyKHZiKSwgc3RydWN0IG10a19qcGVnX3NyY19idWYsIGIpOw0KIH0NCiANCi1z
dGF0aWMgaW50IG10a19qcGVnX3F1ZXJ5Y2FwKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2
LA0KK3N0YXRpYyBpbnQgbXRrX2pwZWdfZGVjX3F1ZXJ5Y2FwKHN0cnVjdCBmaWxlICpmaWxlLCB2
b2lkICpwcml2LA0KIAkJCSAgICAgc3RydWN0IHY0bDJfY2FwYWJpbGl0eSAqY2FwKQ0KIHsNCiAJ
c3RydWN0IG10a19qcGVnX2RldiAqanBlZyA9IHZpZGVvX2RydmRhdGEoZmlsZSk7DQogDQotCXN0
cnNjcHkoY2FwLT5kcml2ZXIsIE1US19KUEVHX05BTUUgIiBkZWNvZGVyIiwgc2l6ZW9mKGNhcC0+
ZHJpdmVyKSk7DQorCXN0cnNjcHkoY2FwLT5kcml2ZXIsIE1US19KUEVHX05BTUUsIHNpemVvZihj
YXAtPmRyaXZlcikpOw0KIAlzdHJzY3B5KGNhcC0+Y2FyZCwgTVRLX0pQRUdfTkFNRSAiIGRlY29k
ZXIiLCBzaXplb2YoY2FwLT5jYXJkKSk7DQogCXNucHJpbnRmKGNhcC0+YnVzX2luZm8sIHNpemVv
ZihjYXAtPmJ1c19pbmZvKSwgInBsYXRmb3JtOiVzIiwNCiAJCSBkZXZfbmFtZShqcGVnLT5kZXYp
KTsNCkBAIC0xMDksMjIgKzEwOSwyMyBAQCBzdGF0aWMgaW50IG10a19qcGVnX2VudW1fZm10KHN0
cnVjdCBtdGtfanBlZ19mbXQgKm10a19qcGVnX2Zvcm1hdHMsIGludCBuLA0KIAlyZXR1cm4gMDsN
CiB9DQogDQotc3RhdGljIGludCBtdGtfanBlZ19lbnVtX2ZtdF92aWRfY2FwKHN0cnVjdCBmaWxl
ICpmaWxlLCB2b2lkICpwcml2LA0KLQkJCQkgICAgIHN0cnVjdCB2NGwyX2ZtdGRlc2MgKmYpDQor
c3RhdGljIGludCBtdGtfanBlZ19kZWNfZW51bV9mbXRfdmlkX2NhcChzdHJ1Y3QgZmlsZSAqZmls
ZSwgdm9pZCAqcHJpdiwNCisJCQkJCSBzdHJ1Y3QgdjRsMl9mbXRkZXNjICpmKQ0KIHsNCi0JcmV0
dXJuIG10a19qcGVnX2VudW1fZm10KG10a19qcGVnX2Zvcm1hdHMsIE1US19KUEVHX05VTV9GT1JN
QVRTLCBmLA0KKwlyZXR1cm4gbXRrX2pwZWdfZW51bV9mbXQobXRrX2pwZWdfZGVjX2Zvcm1hdHMs
DQorCQkJCSBNVEtfSlBFR19ERUNfTlVNX0ZPUk1BVFMsIGYsDQogCQkJCSBNVEtfSlBFR19GTVRf
RkxBR19ERUNfQ0FQVFVSRSk7DQogfQ0KIA0KLXN0YXRpYyBpbnQgbXRrX2pwZWdfZW51bV9mbXRf
dmlkX291dChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJpdiwNCi0JCQkJICAgICBzdHJ1Y3Qg
djRsMl9mbXRkZXNjICpmKQ0KK3N0YXRpYyBpbnQgbXRrX2pwZWdfZGVjX2VudW1fZm10X3ZpZF9v
dXQoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQorCQkJCQkgc3RydWN0IHY0bDJfZm10
ZGVzYyAqZikNCiB7DQotCXJldHVybiBtdGtfanBlZ19lbnVtX2ZtdChtdGtfanBlZ19mb3JtYXRz
LCBNVEtfSlBFR19OVU1fRk9STUFUUywgZiwNCi0JCQkJIE1US19KUEVHX0ZNVF9GTEFHX0RFQ19P
VVRQVVQpOw0KKwlyZXR1cm4gbXRrX2pwZWdfZW51bV9mbXQobXRrX2pwZWdfZGVjX2Zvcm1hdHMs
IE1US19KUEVHX0RFQ19OVU1fRk9STUFUUywNCisJCQkJIGYsIE1US19KUEVHX0ZNVF9GTEFHX0RF
Q19PVVRQVVQpOw0KIH0NCiANCi1zdGF0aWMgc3RydWN0IG10a19qcGVnX3FfZGF0YSAqbXRrX2pw
ZWdfZ2V0X3FfZGF0YShzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHgsDQotCQkJCQkJICAgZW51bSB2
NGwyX2J1Zl90eXBlIHR5cGUpDQorc3RhdGljIHN0cnVjdCBtdGtfanBlZ19xX2RhdGEgKg0KK210
a19qcGVnX2dldF9xX2RhdGEoc3RydWN0IG10a19qcGVnX2N0eCAqY3R4LCBlbnVtIHY0bDJfYnVm
X3R5cGUgdHlwZSkNCiB7DQogCWlmIChWNEwyX1RZUEVfSVNfT1VUUFVUKHR5cGUpKQ0KIAkJcmV0
dXJuICZjdHgtPm91dF9xOw0KQEAgLTE0MSw4ICsxNDIsOCBAQCBzdGF0aWMgc3RydWN0IG10a19q
cGVnX2ZtdCAqbXRrX2pwZWdfZmluZF9mb3JtYXQoc3RydWN0IG10a19qcGVnX2N0eCAqY3R4LA0K
IAkJICAgTVRLX0pQRUdfRk1UX0ZMQUdfREVDX09VVFBVVCA6DQogCQkgICBNVEtfSlBFR19GTVRf
RkxBR19ERUNfQ0FQVFVSRTsNCiANCi0JZm9yIChrID0gMDsgayA8IE1US19KUEVHX05VTV9GT1JN
QVRTOyBrKyspIHsNCi0JCXN0cnVjdCBtdGtfanBlZ19mbXQgKmZtdCA9ICZtdGtfanBlZ19mb3Jt
YXRzW2tdOw0KKwlmb3IgKGsgPSAwOyBrIDwgTVRLX0pQRUdfREVDX05VTV9GT1JNQVRTOyBrKysp
IHsNCisJCXN0cnVjdCBtdGtfanBlZ19mbXQgKmZtdCA9ICZtdGtfanBlZ19kZWNfZm9ybWF0c1tr
XTsNCiANCiAJCWlmIChmbXQtPmZvdXJjYyA9PSBwaXhlbGZvcm1hdCAmJiBmbXQtPmZsYWdzICYg
Zm10X2ZsYWcpDQogCQkJcmV0dXJuIGZtdDsNCkBAIC0yNzAsOCArMjcxLDggQEAgc3RhdGljIGlu
dCBtdGtfanBlZ19nX2ZtdF92aWRfbXBsYW5lKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2
LA0KIAlyZXR1cm4gMDsNCiB9DQogDQotc3RhdGljIGludCBtdGtfanBlZ190cnlfZm10X3ZpZF9j
YXBfbXBsYW5lKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LA0KLQkJCQkJICAgc3RydWN0
IHY0bDJfZm9ybWF0ICpmKQ0KK3N0YXRpYyBpbnQgbXRrX2pwZWdfZGVjX3RyeV9mbXRfdmlkX2Nh
cF9tcGxhbmUoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQorCQkJCQkgICAgICAgc3Ry
dWN0IHY0bDJfZm9ybWF0ICpmKQ0KIHsNCiAJc3RydWN0IG10a19qcGVnX2N0eCAqY3R4ID0gbXRr
X2pwZWdfZmhfdG9fY3R4KHByaXYpOw0KIAlzdHJ1Y3QgbXRrX2pwZWdfZm10ICpmbXQ7DQpAQCAt
MjkxLDggKzI5Miw4IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfdHJ5X2ZtdF92aWRfY2FwX21wbGFu
ZShzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJpdiwNCiAJcmV0dXJuIG10a19qcGVnX3RyeV9m
bXRfbXBsYW5lKGYsIGZtdCwgY3R4LCBNVEtfSlBFR19GTVRfVFlQRV9DQVBUVVJFKTsNCiB9DQog
DQotc3RhdGljIGludCBtdGtfanBlZ190cnlfZm10X3ZpZF9vdXRfbXBsYW5lKHN0cnVjdCBmaWxl
ICpmaWxlLCB2b2lkICpwcml2LA0KLQkJCQkJICAgc3RydWN0IHY0bDJfZm9ybWF0ICpmKQ0KK3N0
YXRpYyBpbnQgbXRrX2pwZWdfZGVjX3RyeV9mbXRfdmlkX291dF9tcGxhbmUoc3RydWN0IGZpbGUg
KmZpbGUsIHZvaWQgKnByaXYsDQorCQkJCQkgICAgICAgc3RydWN0IHY0bDJfZm9ybWF0ICpmKQ0K
IHsNCiAJc3RydWN0IG10a19qcGVnX2N0eCAqY3R4ID0gbXRrX2pwZWdfZmhfdG9fY3R4KHByaXYp
Ow0KIAlzdHJ1Y3QgbXRrX2pwZWdfZm10ICpmbXQ7DQpAQCAtMzY0LDI0ICszNjUsMjQgQEAgc3Rh
dGljIGludCBtdGtfanBlZ19zX2ZtdF9tcGxhbmUoc3RydWN0IG10a19qcGVnX2N0eCAqY3R4LA0K
IAlyZXR1cm4gMDsNCiB9DQogDQotc3RhdGljIGludCBtdGtfanBlZ19zX2ZtdF92aWRfb3V0X21w
bGFuZShzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJpdiwNCi0JCQkJCSBzdHJ1Y3QgdjRsMl9m
b3JtYXQgKmYpDQorc3RhdGljIGludCBtdGtfanBlZ19kZWNfc19mbXRfdmlkX291dF9tcGxhbmUo
c3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQorCQkJCQkgICAgIHN0cnVjdCB2NGwyX2Zv
cm1hdCAqZikNCiB7DQogCWludCByZXQ7DQogDQotCXJldCA9IG10a19qcGVnX3RyeV9mbXRfdmlk
X291dF9tcGxhbmUoZmlsZSwgcHJpdiwgZik7DQorCXJldCA9IG10a19qcGVnX2RlY190cnlfZm10
X3ZpZF9vdXRfbXBsYW5lKGZpbGUsIHByaXYsIGYpOw0KIAlpZiAocmV0KQ0KIAkJcmV0dXJuIHJl
dDsNCiANCiAJcmV0dXJuIG10a19qcGVnX3NfZm10X21wbGFuZShtdGtfanBlZ19maF90b19jdHgo
cHJpdiksIGYpOw0KIH0NCiANCi1zdGF0aWMgaW50IG10a19qcGVnX3NfZm10X3ZpZF9jYXBfbXBs
YW5lKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LA0KLQkJCQkJIHN0cnVjdCB2NGwyX2Zv
cm1hdCAqZikNCitzdGF0aWMgaW50IG10a19qcGVnX2RlY19zX2ZtdF92aWRfY2FwX21wbGFuZShz
dHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJpdiwNCisJCQkJCSAgICAgc3RydWN0IHY0bDJfZm9y
bWF0ICpmKQ0KIHsNCiAJaW50IHJldDsNCiANCi0JcmV0ID0gbXRrX2pwZWdfdHJ5X2ZtdF92aWRf
Y2FwX21wbGFuZShmaWxlLCBwcml2LCBmKTsNCisJcmV0ID0gbXRrX2pwZWdfZGVjX3RyeV9mbXRf
dmlkX2NhcF9tcGxhbmUoZmlsZSwgcHJpdiwgZik7DQogCWlmIChyZXQpDQogCQlyZXR1cm4gcmV0
Ow0KIA0KQEAgLTQxMCw4ICs0MTEsOCBAQCBzdGF0aWMgaW50IG10a19qcGVnX3N1YnNjcmliZV9l
dmVudChzdHJ1Y3QgdjRsMl9maCAqZmgsDQogCXJldHVybiB2NGwyX2N0cmxfc3Vic2NyaWJlX2V2
ZW50KGZoLCBzdWIpOw0KIH0NCiANCi1zdGF0aWMgaW50IG10a19qcGVnX2dfc2VsZWN0aW9uKHN0
cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LA0KLQkJCQlzdHJ1Y3QgdjRsMl9zZWxlY3Rpb24g
KnMpDQorc3RhdGljIGludCBtdGtfanBlZ19kZWNfZ19zZWxlY3Rpb24oc3RydWN0IGZpbGUgKmZp
bGUsIHZvaWQgKnByaXYsDQorCQkJCSAgICBzdHJ1Y3QgdjRsMl9zZWxlY3Rpb24gKnMpDQogew0K
IAlzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHggPSBtdGtfanBlZ19maF90b19jdHgocHJpdik7DQog
DQpAQCAtNDM5LDggKzQ0MCw4IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfZ19zZWxlY3Rpb24oc3Ry
dWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQogCXJldHVybiAwOw0KIH0NCiANCi1zdGF0aWMg
aW50IG10a19qcGVnX3Nfc2VsZWN0aW9uKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LA0K
LQkJCQlzdHJ1Y3QgdjRsMl9zZWxlY3Rpb24gKnMpDQorc3RhdGljIGludCBtdGtfanBlZ19kZWNf
c19zZWxlY3Rpb24oc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQorCQkJCSAgICBzdHJ1
Y3QgdjRsMl9zZWxlY3Rpb24gKnMpDQogew0KIAlzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHggPSBt
dGtfanBlZ19maF90b19jdHgocHJpdik7DQogDQpAQCAtNDgzLDIwICs0ODQsMjAgQEAgc3RhdGlj
IGludCBtdGtfanBlZ19xYnVmKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LCBzdHJ1Y3Qg
djRsMl9idWZmZXIgKmJ1ZikNCiAJcmV0dXJuIHY0bDJfbTJtX3FidWYoZmlsZSwgZmgtPm0ybV9j
dHgsIGJ1Zik7DQogfQ0KIA0KLXN0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9pb2N0bF9vcHMgbXRr
X2pwZWdfaW9jdGxfb3BzID0gew0KLQkudmlkaW9jX3F1ZXJ5Y2FwICAgICAgICAgICAgICAgID0g
bXRrX2pwZWdfcXVlcnljYXAsDQotCS52aWRpb2NfZW51bV9mbXRfdmlkX2NhcAk9IG10a19qcGVn
X2VudW1fZm10X3ZpZF9jYXAsDQotCS52aWRpb2NfZW51bV9mbXRfdmlkX291dAk9IG10a19qcGVn
X2VudW1fZm10X3ZpZF9vdXQsDQotCS52aWRpb2NfdHJ5X2ZtdF92aWRfY2FwX21wbGFuZQk9IG10
a19qcGVnX3RyeV9mbXRfdmlkX2NhcF9tcGxhbmUsDQotCS52aWRpb2NfdHJ5X2ZtdF92aWRfb3V0
X21wbGFuZQk9IG10a19qcGVnX3RyeV9mbXRfdmlkX291dF9tcGxhbmUsDQorc3RhdGljIGNvbnN0
IHN0cnVjdCB2NGwyX2lvY3RsX29wcyBtdGtfanBlZ19kZWNfaW9jdGxfb3BzID0gew0KKwkudmlk
aW9jX3F1ZXJ5Y2FwICAgICAgICAgICAgICAgID0gbXRrX2pwZWdfZGVjX3F1ZXJ5Y2FwLA0KKwku
dmlkaW9jX2VudW1fZm10X3ZpZF9jYXAJPSBtdGtfanBlZ19kZWNfZW51bV9mbXRfdmlkX2NhcCwN
CisJLnZpZGlvY19lbnVtX2ZtdF92aWRfb3V0CT0gbXRrX2pwZWdfZGVjX2VudW1fZm10X3ZpZF9v
dXQsDQorCS52aWRpb2NfdHJ5X2ZtdF92aWRfY2FwX21wbGFuZQk9IG10a19qcGVnX2RlY190cnlf
Zm10X3ZpZF9jYXBfbXBsYW5lLA0KKwkudmlkaW9jX3RyeV9mbXRfdmlkX291dF9tcGxhbmUJPSBt
dGtfanBlZ19kZWNfdHJ5X2ZtdF92aWRfb3V0X21wbGFuZSwNCiAJLnZpZGlvY19nX2ZtdF92aWRf
Y2FwX21wbGFuZSAgICA9IG10a19qcGVnX2dfZm10X3ZpZF9tcGxhbmUsDQogCS52aWRpb2NfZ19m
bXRfdmlkX291dF9tcGxhbmUgICAgPSBtdGtfanBlZ19nX2ZtdF92aWRfbXBsYW5lLA0KLQkudmlk
aW9jX3NfZm10X3ZpZF9jYXBfbXBsYW5lICAgID0gbXRrX2pwZWdfc19mbXRfdmlkX2NhcF9tcGxh
bmUsDQotCS52aWRpb2Nfc19mbXRfdmlkX291dF9tcGxhbmUgICAgPSBtdGtfanBlZ19zX2ZtdF92
aWRfb3V0X21wbGFuZSwNCisJLnZpZGlvY19zX2ZtdF92aWRfY2FwX21wbGFuZSAgICA9IG10a19q
cGVnX2RlY19zX2ZtdF92aWRfY2FwX21wbGFuZSwNCisJLnZpZGlvY19zX2ZtdF92aWRfb3V0X21w
bGFuZSAgICA9IG10a19qcGVnX2RlY19zX2ZtdF92aWRfb3V0X21wbGFuZSwNCiAJLnZpZGlvY19x
YnVmICAgICAgICAgICAgICAgICAgICA9IG10a19qcGVnX3FidWYsDQogCS52aWRpb2Nfc3Vic2Ny
aWJlX2V2ZW50ICAgICAgICAgPSBtdGtfanBlZ19zdWJzY3JpYmVfZXZlbnQsDQotCS52aWRpb2Nf
Z19zZWxlY3Rpb24JCT0gbXRrX2pwZWdfZ19zZWxlY3Rpb24sDQotCS52aWRpb2Nfc19zZWxlY3Rp
b24JCT0gbXRrX2pwZWdfc19zZWxlY3Rpb24sDQorCS52aWRpb2NfZ19zZWxlY3Rpb24JCT0gbXRr
X2pwZWdfZGVjX2dfc2VsZWN0aW9uLA0KKwkudmlkaW9jX3Nfc2VsZWN0aW9uCQk9IG10a19qcGVn
X2RlY19zX3NlbGVjdGlvbiwNCiANCiAJLnZpZGlvY19jcmVhdGVfYnVmcwkJPSB2NGwyX20ybV9p
b2N0bF9jcmVhdGVfYnVmcywNCiAJLnZpZGlvY19wcmVwYXJlX2J1ZgkJPSB2NGwyX20ybV9pb2N0
bF9wcmVwYXJlX2J1ZiwNCkBAIC02MTUsNyArNjE2LDcgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdf
c2V0X3F1ZXVlX2RhdGEoc3RydWN0IG10a19qcGVnX2N0eCAqY3R4LA0KIAkJIHBhcmFtLT5kZWNf
dywgcGFyYW0tPmRlY19oKTsNCiB9DQogDQotc3RhdGljIHZvaWQgbXRrX2pwZWdfYnVmX3F1ZXVl
KHN0cnVjdCB2YjJfYnVmZmVyICp2YikNCitzdGF0aWMgdm9pZCBtdGtfanBlZ19kZWNfYnVmX3F1
ZXVlKHN0cnVjdCB2YjJfYnVmZmVyICp2YikNCiB7DQogCXN0cnVjdCBtdGtfanBlZ19jdHggKmN0
eCA9IHZiMl9nZXRfZHJ2X3ByaXYodmItPnZiMl9xdWV1ZSk7DQogCXN0cnVjdCBtdGtfanBlZ19k
ZWNfcGFyYW0gKnBhcmFtOw0KQEAgLTY2Myw3ICs2NjQsNyBAQCBzdGF0aWMgc3RydWN0IHZiMl92
NGwyX2J1ZmZlciAqbXRrX2pwZWdfYnVmX3JlbW92ZShzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHgs
DQogCQlyZXR1cm4gdjRsMl9tMm1fZHN0X2J1Zl9yZW1vdmUoY3R4LT5maC5tMm1fY3R4KTsNCiB9
DQogDQotc3RhdGljIHZvaWQgbXRrX2pwZWdfc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1
ZSAqcSkNCitzdGF0aWMgdm9pZCBtdGtfanBlZ19kZWNfc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZi
Ml9xdWV1ZSAqcSkNCiB7DQogCXN0cnVjdCBtdGtfanBlZ19jdHggKmN0eCA9IHZiMl9nZXRfZHJ2
X3ByaXYocSk7DQogCXN0cnVjdCB2YjJfdjRsMl9idWZmZXIgKnZiOw0KQEAgLTY4OSwxMyArNjkw
LDEzIEBAIHN0YXRpYyB2b2lkIG10a19qcGVnX3N0b3Bfc3RyZWFtaW5nKHN0cnVjdCB2YjJfcXVl
dWUgKnEpDQogCQl2NGwyX20ybV9idWZfZG9uZSh2YiwgVkIyX0JVRl9TVEFURV9FUlJPUik7DQog
fQ0KIA0KLXN0YXRpYyBjb25zdCBzdHJ1Y3QgdmIyX29wcyBtdGtfanBlZ19xb3BzID0gew0KK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgdmIyX29wcyBtdGtfanBlZ19kZWNfcW9wcyA9IHsNCiAJLnF1ZXVl
X3NldHVwICAgICAgICA9IG10a19qcGVnX3F1ZXVlX3NldHVwLA0KIAkuYnVmX3ByZXBhcmUgICAg
ICAgID0gbXRrX2pwZWdfYnVmX3ByZXBhcmUsDQotCS5idWZfcXVldWUgICAgICAgICAgPSBtdGtf
anBlZ19idWZfcXVldWUsDQorCS5idWZfcXVldWUgICAgICAgICAgPSBtdGtfanBlZ19kZWNfYnVm
X3F1ZXVlLA0KIAkud2FpdF9wcmVwYXJlICAgICAgID0gdmIyX29wc193YWl0X3ByZXBhcmUsDQog
CS53YWl0X2ZpbmlzaCAgICAgICAgPSB2YjJfb3BzX3dhaXRfZmluaXNoLA0KLQkuc3RvcF9zdHJl
YW1pbmcgICAgID0gbXRrX2pwZWdfc3RvcF9zdHJlYW1pbmcsDQorCS5zdG9wX3N0cmVhbWluZyAg
ICAgPSBtdGtfanBlZ19kZWNfc3RvcF9zdHJlYW1pbmcsDQogfTsNCiANCiBzdGF0aWMgdm9pZCBt
dGtfanBlZ19zZXRfZGVjX3NyYyhzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHgsDQpAQCAtNzM1LDcg
KzczNiw3IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfc2V0X2RlY19kc3Qoc3RydWN0IG10a19qcGVn
X2N0eCAqY3R4LA0KIAlyZXR1cm4gMDsNCiB9DQogDQotc3RhdGljIHZvaWQgbXRrX2pwZWdfZGV2
aWNlX3J1bih2b2lkICpwcml2KQ0KK3N0YXRpYyB2b2lkIG10a19qcGVnX2RlY19kZXZpY2VfcnVu
KHZvaWQgKnByaXYpDQogew0KIAlzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHggPSBwcml2Ow0KIAlz
dHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVnID0gY3R4LT5qcGVnOw0KQEAgLTc2MywxNSArNzY0LDE2
IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnX2RldmljZV9ydW4odm9pZCAqcHJpdikNCiAJCWdvdG8g
ZGVjX2VuZDsNCiANCiAJbXRrX2pwZWdfc2V0X2RlY19zcmMoY3R4LCAmc3JjX2J1Zi0+dmIyX2J1
ZiwgJmJzKTsNCi0JaWYgKG10a19qcGVnX3NldF9kZWNfZHN0KGN0eCwgJmpwZWdfc3JjX2J1Zi0+
ZGVjX3BhcmFtLCAmZHN0X2J1Zi0+dmIyX2J1ZiwgJmZiKSkNCisJaWYgKG10a19qcGVnX3NldF9k
ZWNfZHN0KGN0eCwgJmpwZWdfc3JjX2J1Zi0+ZGVjX3BhcmFtLA0KKwkJCQkgJmRzdF9idWYtPnZi
Ml9idWYsICZmYikpDQogCQlnb3RvIGRlY19lbmQ7DQogDQogCXNwaW5fbG9ja19pcnFzYXZlKCZq
cGVnLT5od19sb2NrLCBmbGFncyk7DQotCW10a19qcGVnX2RlY19yZXNldChqcGVnLT5kZWNfcmVn
X2Jhc2UpOw0KLQltdGtfanBlZ19kZWNfc2V0X2NvbmZpZyhqcGVnLT5kZWNfcmVnX2Jhc2UsDQor
CW10a19qcGVnX2RlY19yZXNldChqcGVnLT5yZWdfYmFzZSk7DQorCW10a19qcGVnX2RlY19zZXRf
Y29uZmlnKGpwZWctPnJlZ19iYXNlLA0KIAkJCQkmanBlZ19zcmNfYnVmLT5kZWNfcGFyYW0sICZi
cywgJmZiKTsNCiANCi0JbXRrX2pwZWdfZGVjX3N0YXJ0KGpwZWctPmRlY19yZWdfYmFzZSk7DQor
CW10a19qcGVnX2RlY19zdGFydChqcGVnLT5yZWdfYmFzZSk7DQogCXNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJmpwZWctPmh3X2xvY2ssIGZsYWdzKTsNCiAJcmV0dXJuOw0KIA0KQEAgLTc4MywxOSAr
Nzg1LDE5IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnX2RldmljZV9ydW4odm9pZCAqcHJpdikNCiAJ
djRsMl9tMm1fam9iX2ZpbmlzaChqcGVnLT5tMm1fZGV2LCBjdHgtPmZoLm0ybV9jdHgpOw0KIH0N
CiANCi1zdGF0aWMgaW50IG10a19qcGVnX2pvYl9yZWFkeSh2b2lkICpwcml2KQ0KK3N0YXRpYyBp
bnQgbXRrX2pwZWdfZGVjX2pvYl9yZWFkeSh2b2lkICpwcml2KQ0KIHsNCiAJc3RydWN0IG10a19q
cGVnX2N0eCAqY3R4ID0gcHJpdjsNCiANCiAJcmV0dXJuIChjdHgtPnN0YXRlID09IE1US19KUEVH
X1JVTk5JTkcpID8gMSA6IDA7DQogfQ0KIA0KLXN0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9tMm1f
b3BzIG10a19qcGVnX20ybV9vcHMgPSB7DQotCS5kZXZpY2VfcnVuID0gbXRrX2pwZWdfZGV2aWNl
X3J1biwNCi0JLmpvYl9yZWFkeSAgPSBtdGtfanBlZ19qb2JfcmVhZHksDQorc3RhdGljIGNvbnN0
IHN0cnVjdCB2NGwyX20ybV9vcHMgbXRrX2pwZWdfZGVjX20ybV9vcHMgPSB7DQorCS5kZXZpY2Vf
cnVuID0gbXRrX2pwZWdfZGVjX2RldmljZV9ydW4sDQorCS5qb2JfcmVhZHkgID0gbXRrX2pwZWdf
ZGVjX2pvYl9yZWFkeSwNCiB9Ow0KIA0KLXN0YXRpYyBpbnQgbXRrX2pwZWdfcXVldWVfaW5pdCh2
b2lkICpwcml2LCBzdHJ1Y3QgdmIyX3F1ZXVlICpzcmNfdnEsDQorc3RhdGljIGludCBtdGtfanBl
Z19kZWNfcXVldWVfaW5pdCh2b2lkICpwcml2LCBzdHJ1Y3QgdmIyX3F1ZXVlICpzcmNfdnEsDQog
CQkJICAgICAgIHN0cnVjdCB2YjJfcXVldWUgKmRzdF92cSkNCiB7DQogCXN0cnVjdCBtdGtfanBl
Z19jdHggKmN0eCA9IHByaXY7DQpAQCAtODA1LDcgKzgwNyw3IEBAIHN0YXRpYyBpbnQgbXRrX2pw
ZWdfcXVldWVfaW5pdCh2b2lkICpwcml2LCBzdHJ1Y3QgdmIyX3F1ZXVlICpzcmNfdnEsDQogCXNy
Y192cS0+aW9fbW9kZXMgPSBWQjJfRE1BQlVGIHwgVkIyX01NQVA7DQogCXNyY192cS0+ZHJ2X3By
aXYgPSBjdHg7DQogCXNyY192cS0+YnVmX3N0cnVjdF9zaXplID0gc2l6ZW9mKHN0cnVjdCBtdGtf
anBlZ19zcmNfYnVmKTsNCi0Jc3JjX3ZxLT5vcHMgPSAmbXRrX2pwZWdfcW9wczsNCisJc3JjX3Zx
LT5vcHMgPSAmbXRrX2pwZWdfZGVjX3FvcHM7DQogCXNyY192cS0+bWVtX29wcyA9ICZ2YjJfZG1h
X2NvbnRpZ19tZW1vcHM7DQogCXNyY192cS0+dGltZXN0YW1wX2ZsYWdzID0gVjRMMl9CVUZfRkxB
R19USU1FU1RBTVBfQ09QWTsNCiAJc3JjX3ZxLT5sb2NrID0gJmN0eC0+anBlZy0+bG9jazsNCkBA
IC04MTgsNyArODIwLDcgQEAgc3RhdGljIGludCBtdGtfanBlZ19xdWV1ZV9pbml0KHZvaWQgKnBy
aXYsIHN0cnVjdCB2YjJfcXVldWUgKnNyY192cSwNCiAJZHN0X3ZxLT5pb19tb2RlcyA9IFZCMl9E
TUFCVUYgfCBWQjJfTU1BUDsNCiAJZHN0X3ZxLT5kcnZfcHJpdiA9IGN0eDsNCiAJZHN0X3ZxLT5i
dWZfc3RydWN0X3NpemUgPSBzaXplb2Yoc3RydWN0IHY0bDJfbTJtX2J1ZmZlcik7DQotCWRzdF92
cS0+b3BzID0gJm10a19qcGVnX3FvcHM7DQorCWRzdF92cS0+b3BzID0gJm10a19qcGVnX2RlY19x
b3BzOw0KIAlkc3RfdnEtPm1lbV9vcHMgPSAmdmIyX2RtYV9jb250aWdfbWVtb3BzOw0KIAlkc3Rf
dnEtPnRpbWVzdGFtcF9mbGFncyA9IFY0TDJfQlVGX0ZMQUdfVElNRVNUQU1QX0NPUFk7DQogCWRz
dF92cS0+bG9jayA9ICZjdHgtPmpwZWctPmxvY2s7DQpAQCAtODU3LDcgKzg1OSw3IEBAIHN0YXRp
YyBpcnFyZXR1cm5fdCBtdGtfanBlZ19kZWNfaXJxKGludCBpcnEsIHZvaWQgKnByaXYpDQogCXUz
MiBkZWNfcmV0Ow0KIAlpbnQgaTsNCiANCi0JZGVjX3JldCA9IG10a19qcGVnX2RlY19nZXRfaW50
X3N0YXR1cyhqcGVnLT5kZWNfcmVnX2Jhc2UpOw0KKwlkZWNfcmV0ID0gbXRrX2pwZWdfZGVjX2dl
dF9pbnRfc3RhdHVzKGpwZWctPnJlZ19iYXNlKTsNCiAJZGVjX2lycV9yZXQgPSBtdGtfanBlZ19k
ZWNfZW51bV9yZXN1bHQoZGVjX3JldCk7DQogCWN0eCA9IHY0bDJfbTJtX2dldF9jdXJyX3ByaXYo
anBlZy0+bTJtX2Rldik7DQogCWlmICghY3R4KSB7DQpAQCAtODcwLDcgKzg3Miw3IEBAIHN0YXRp
YyBpcnFyZXR1cm5fdCBtdGtfanBlZ19kZWNfaXJxKGludCBpcnEsIHZvaWQgKnByaXYpDQogCWpw
ZWdfc3JjX2J1ZiA9IG10a19qcGVnX3ZiMl90b19zcmNidWYoJnNyY19idWYtPnZiMl9idWYpOw0K
IA0KIAlpZiAoZGVjX2lycV9yZXQgPj0gTVRLX0pQRUdfREVDX1JFU1VMVF9VTkRFUkZMT1cpDQot
CQltdGtfanBlZ19kZWNfcmVzZXQoanBlZy0+ZGVjX3JlZ19iYXNlKTsNCisJCW10a19qcGVnX2Rl
Y19yZXNldChqcGVnLT5yZWdfYmFzZSk7DQogDQogCWlmIChkZWNfaXJxX3JldCAhPSBNVEtfSlBF
R19ERUNfUkVTVUxUX0VPRl9ET05FKSB7DQogCQlkZXZfZXJyKGpwZWctPmRldiwgImRlY29kZSBm
YWlsZWRcbiIpOw0KQEAgLTg5MSw3ICs4OTMsNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgbXRrX2pw
ZWdfZGVjX2lycShpbnQgaXJxLCB2b2lkICpwcml2KQ0KIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQog
fQ0KIA0KLXN0YXRpYyB2b2lkIG10a19qcGVnX3NldF9kZWZhdWx0X3BhcmFtcyhzdHJ1Y3QgbXRr
X2pwZWdfY3R4ICpjdHgpDQorc3RhdGljIHZvaWQgbXRrX2pwZWdfc2V0X2RlY19kZWZhdWx0X3Bh
cmFtcyhzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHgpDQogew0KIAlzdHJ1Y3QgbXRrX2pwZWdfcV9k
YXRhICpxID0gJmN0eC0+b3V0X3E7DQogCWludCBpOw0KQEAgLTkyMyw3ICs5MjUsNyBAQCBzdGF0
aWMgdm9pZCBtdGtfanBlZ19zZXRfZGVmYXVsdF9wYXJhbXMoc3RydWN0IG10a19qcGVnX2N0eCAq
Y3R4KQ0KIAl9DQogfQ0KIA0KLXN0YXRpYyBpbnQgbXRrX2pwZWdfb3BlbihzdHJ1Y3QgZmlsZSAq
ZmlsZSkNCitzdGF0aWMgaW50IG10a19qcGVnX2RlY19vcGVuKHN0cnVjdCBmaWxlICpmaWxlKQ0K
IHsNCiAJc3RydWN0IG10a19qcGVnX2RldiAqanBlZyA9IHZpZGVvX2RydmRhdGEoZmlsZSk7DQog
CXN0cnVjdCB2aWRlb19kZXZpY2UgKnZmZCA9IHZpZGVvX2RldmRhdGEoZmlsZSk7DQpAQCAtOTQ1
LDEzICs5NDcsMTMgQEAgc3RhdGljIGludCBtdGtfanBlZ19vcGVuKHN0cnVjdCBmaWxlICpmaWxl
KQ0KIA0KIAljdHgtPmpwZWcgPSBqcGVnOw0KIAljdHgtPmZoLm0ybV9jdHggPSB2NGwyX20ybV9j
dHhfaW5pdChqcGVnLT5tMm1fZGV2LCBjdHgsDQotCQkJCQkgICAgbXRrX2pwZWdfcXVldWVfaW5p
dCk7DQorCQkJCQkgICAgbXRrX2pwZWdfZGVjX3F1ZXVlX2luaXQpOw0KIAlpZiAoSVNfRVJSKGN0
eC0+ZmgubTJtX2N0eCkpIHsNCiAJCXJldCA9IFBUUl9FUlIoY3R4LT5maC5tMm1fY3R4KTsNCiAJ
CWdvdG8gZXJyb3I7DQogCX0NCiANCi0JbXRrX2pwZWdfc2V0X2RlZmF1bHRfcGFyYW1zKGN0eCk7
DQorCW10a19qcGVnX3NldF9kZWNfZGVmYXVsdF9wYXJhbXMoY3R4KTsNCiAJbXV0ZXhfdW5sb2Nr
KCZqcGVnLT5sb2NrKTsNCiAJcmV0dXJuIDA7DQogDQpAQCAtOTc4LDkgKzk4MCw5IEBAIHN0YXRp
YyBpbnQgbXRrX2pwZWdfcmVsZWFzZShzdHJ1Y3QgZmlsZSAqZmlsZSkNCiAJcmV0dXJuIDA7DQog
fQ0KIA0KLXN0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9maWxlX29wZXJhdGlvbnMgbXRrX2pwZWdf
Zm9wcyA9IHsNCitzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfZmlsZV9vcGVyYXRpb25zIG10a19q
cGVnX2RlY19mb3BzID0gew0KIAkub3duZXIgICAgICAgICAgPSBUSElTX01PRFVMRSwNCi0JLm9w
ZW4gICAgICAgICAgID0gbXRrX2pwZWdfb3BlbiwNCisJLm9wZW4gICAgICAgICAgID0gbXRrX2pw
ZWdfZGVjX29wZW4sDQogCS5yZWxlYXNlICAgICAgICA9IG10a19qcGVnX3JlbGVhc2UsDQogCS5w
b2xsICAgICAgICAgICA9IHY0bDJfbTJtX2ZvcF9wb2xsLA0KIAkudW5sb2NrZWRfaW9jdGwgPSB2
aWRlb19pb2N0bDIsDQpAQCAtMTAxNiw3ICsxMDE4LDcgQEAgc3RhdGljIGludCBtdGtfanBlZ19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIHsNCiAJc3RydWN0IG10a19qcGVn
X2RldiAqanBlZzsNCiAJc3RydWN0IHJlc291cmNlICpyZXM7DQotCWludCBkZWNfaXJxOw0KKwlp
bnQganBlZ19pcnE7DQogCWludCByZXQ7DQogDQogCWpwZWcgPSBkZXZtX2t6YWxsb2MoJnBkZXYt
PmRldiwgc2l6ZW9mKCpqcGVnKSwgR0ZQX0tFUk5FTCk7DQpAQCAtMTAyOCwyMyArMTAzMCwyMyBA
QCBzdGF0aWMgaW50IG10a19qcGVnX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQogCWpwZWctPmRldiA9ICZwZGV2LT5kZXY7DQogDQogCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNv
dXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQotCWpwZWctPmRlY19yZWdfYmFzZSA9IGRl
dm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOw0KLQlpZiAoSVNfRVJSKGpwZWct
PmRlY19yZWdfYmFzZSkpIHsNCi0JCXJldCA9IFBUUl9FUlIoanBlZy0+ZGVjX3JlZ19iYXNlKTsN
CisJanBlZy0+cmVnX2Jhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcmVz
KTsNCisJaWYgKElTX0VSUihqcGVnLT5yZWdfYmFzZSkpIHsNCisJCXJldCA9IFBUUl9FUlIoanBl
Zy0+cmVnX2Jhc2UpOw0KIAkJcmV0dXJuIHJldDsNCiAJfQ0KIA0KLQlkZWNfaXJxID0gcGxhdGZv
cm1fZ2V0X2lycShwZGV2LCAwKTsNCi0JaWYgKGRlY19pcnEgPCAwKSB7DQotCQlkZXZfZXJyKCZw
ZGV2LT5kZXYsICJGYWlsZWQgdG8gZ2V0IGRlY19pcnEgJWQuXG4iLCBkZWNfaXJxKTsNCi0JCXJl
dHVybiBkZWNfaXJxOw0KKwlqcGVnX2lycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7DQor
CWlmIChqcGVnX2lycSA8IDApIHsNCisJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byBn
ZXQganBlZ19pcnEgJWQuXG4iLCBqcGVnX2lycSk7DQorCQlyZXR1cm4ganBlZ19pcnE7DQogCX0N
CiANCi0JcmV0ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBkZWNfaXJxLCBtdGtfanBl
Z19kZWNfaXJxLCAwLA0KKwlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIGpwZWdf
aXJxLCBtdGtfanBlZ19kZWNfaXJxLCAwLA0KIAkJCSAgICAgICBwZGV2LT5uYW1lLCBqcGVnKTsN
CiAJaWYgKHJldCkgew0KLQkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIHJlcXVlc3Qg
ZGVjX2lycSAlZCAoJWQpXG4iLA0KLQkJCWRlY19pcnEsIHJldCk7DQorCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBqcGVnX2lycSAlZCAoJWQpXG4iLA0KKwkJCWpwZWdf
aXJxLCByZXQpOw0KIAkJZ290byBlcnJfcmVxX2lycTsNCiAJfQ0KIA0KQEAgLTEwNjEsNDAgKzEw
NjMsNDAgQEAgc3RhdGljIGludCBtdGtfanBlZ19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KIAkJZ290byBlcnJfZGV2X3JlZ2lzdGVyOw0KIAl9DQogDQotCWpwZWctPm0ybV9k
ZXYgPSB2NGwyX20ybV9pbml0KCZtdGtfanBlZ19tMm1fb3BzKTsNCisJanBlZy0+bTJtX2RldiA9
IHY0bDJfbTJtX2luaXQoJm10a19qcGVnX2RlY19tMm1fb3BzKTsNCiAJaWYgKElTX0VSUihqcGVn
LT5tMm1fZGV2KSkgew0KIAkJdjRsMl9lcnIoJmpwZWctPnY0bDJfZGV2LCAiRmFpbGVkIHRvIGlu
aXQgbWVtMm1lbSBkZXZpY2VcbiIpOw0KIAkJcmV0ID0gUFRSX0VSUihqcGVnLT5tMm1fZGV2KTsN
CiAJCWdvdG8gZXJyX20ybV9pbml0Ow0KIAl9DQogDQotCWpwZWctPmRlY192ZGV2ID0gdmlkZW9f
ZGV2aWNlX2FsbG9jKCk7DQotCWlmICghanBlZy0+ZGVjX3ZkZXYpIHsNCisJanBlZy0+dmRldiA9
IHZpZGVvX2RldmljZV9hbGxvYygpOw0KKwlpZiAoIWpwZWctPnZkZXYpIHsNCiAJCXJldCA9IC1F
Tk9NRU07DQotCQlnb3RvIGVycl9kZWNfdmRldl9hbGxvYzsNCisJCWdvdG8gZXJyX3ZmZF9qcGVn
X2FsbG9jOw0KIAl9DQotCXNucHJpbnRmKGpwZWctPmRlY192ZGV2LT5uYW1lLCBzaXplb2YoanBl
Zy0+ZGVjX3ZkZXYtPm5hbWUpLA0KKwlzbnByaW50ZihqcGVnLT52ZGV2LT5uYW1lLCBzaXplb2Yo
anBlZy0+dmRldi0+bmFtZSksDQogCQkgIiVzLWRlYyIsIE1US19KUEVHX05BTUUpOw0KLQlqcGVn
LT5kZWNfdmRldi0+Zm9wcyA9ICZtdGtfanBlZ19mb3BzOw0KLQlqcGVnLT5kZWNfdmRldi0+aW9j
dGxfb3BzID0gJm10a19qcGVnX2lvY3RsX29wczsNCi0JanBlZy0+ZGVjX3ZkZXYtPm1pbm9yID0g
LTE7DQotCWpwZWctPmRlY192ZGV2LT5yZWxlYXNlID0gdmlkZW9fZGV2aWNlX3JlbGVhc2U7DQot
CWpwZWctPmRlY192ZGV2LT5sb2NrID0gJmpwZWctPmxvY2s7DQotCWpwZWctPmRlY192ZGV2LT52
NGwyX2RldiA9ICZqcGVnLT52NGwyX2RldjsNCi0JanBlZy0+ZGVjX3ZkZXYtPnZmbF9kaXIgPSBW
RkxfRElSX00yTTsNCi0JanBlZy0+ZGVjX3ZkZXYtPmRldmljZV9jYXBzID0gVjRMMl9DQVBfU1RS
RUFNSU5HIHwNCisJanBlZy0+dmRldi0+Zm9wcyA9ICZtdGtfanBlZ19kZWNfZm9wczsNCisJanBl
Zy0+dmRldi0+aW9jdGxfb3BzID0gJm10a19qcGVnX2RlY19pb2N0bF9vcHM7DQorCWpwZWctPnZk
ZXYtPm1pbm9yID0gLTE7DQorCWpwZWctPnZkZXYtPnJlbGVhc2UgPSB2aWRlb19kZXZpY2VfcmVs
ZWFzZTsNCisJanBlZy0+dmRldi0+bG9jayA9ICZqcGVnLT5sb2NrOw0KKwlqcGVnLT52ZGV2LT52
NGwyX2RldiA9ICZqcGVnLT52NGwyX2RldjsNCisJanBlZy0+dmRldi0+dmZsX2RpciA9IFZGTF9E
SVJfTTJNOw0KKwlqcGVnLT52ZGV2LT5kZXZpY2VfY2FwcyA9IFY0TDJfQ0FQX1NUUkVBTUlORyB8
DQogCQkJCSAgICAgIFY0TDJfQ0FQX1ZJREVPX00yTV9NUExBTkU7DQogDQotCXJldCA9IHZpZGVv
X3JlZ2lzdGVyX2RldmljZShqcGVnLT5kZWNfdmRldiwgVkZMX1RZUEVfVklERU8sIC0xKTsNCisJ
cmV0ID0gdmlkZW9fcmVnaXN0ZXJfZGV2aWNlKGpwZWctPnZkZXYsIFZGTF9UWVBFX1ZJREVPLCAt
MSk7DQogCWlmIChyZXQpIHsNCiAJCXY0bDJfZXJyKCZqcGVnLT52NGwyX2RldiwgIkZhaWxlZCB0
byByZWdpc3RlciB2aWRlbyBkZXZpY2VcbiIpOw0KLQkJZ290byBlcnJfZGVjX3ZkZXZfcmVnaXN0
ZXI7DQorCQlnb3RvIGVycl92ZmRfanBlZ19yZWdpc3RlcjsNCiAJfQ0KIA0KLQl2aWRlb19zZXRf
ZHJ2ZGF0YShqcGVnLT5kZWNfdmRldiwganBlZyk7DQorCXZpZGVvX3NldF9kcnZkYXRhKGpwZWct
PnZkZXYsIGpwZWcpOw0KIAl2NGwyX2luZm8oJmpwZWctPnY0bDJfZGV2LA0KIAkJICAiZGVjb2Rl
ciBkZXZpY2UgcmVnaXN0ZXJlZCBhcyAvZGV2L3ZpZGVvJWQgKCVkLCVkKVxuIiwNCi0JCSAganBl
Zy0+ZGVjX3ZkZXYtPm51bSwgVklERU9fTUFKT1IsIGpwZWctPmRlY192ZGV2LT5taW5vcik7DQor
CQkgIGpwZWctPnZkZXYtPm51bSwgVklERU9fTUFKT1IsIGpwZWctPnZkZXYtPm1pbm9yKTsNCiAN
CiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwganBlZyk7DQogDQpAQCAtMTEwMiwxMCArMTEw
NCwxMCBAQCBzdGF0aWMgaW50IG10a19qcGVnX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQogDQogCXJldHVybiAwOw0KIA0KLWVycl9kZWNfdmRldl9yZWdpc3RlcjoNCi0Jdmlk
ZW9fZGV2aWNlX3JlbGVhc2UoanBlZy0+ZGVjX3ZkZXYpOw0KK2Vycl92ZmRfanBlZ19yZWdpc3Rl
cjoNCisJdmlkZW9fZGV2aWNlX3JlbGVhc2UoanBlZy0+dmRldik7DQogDQotZXJyX2RlY192ZGV2
X2FsbG9jOg0KK2Vycl92ZmRfanBlZ19hbGxvYzoNCiAJdjRsMl9tMm1fcmVsZWFzZShqcGVnLT5t
Mm1fZGV2KTsNCiANCiBlcnJfbTJtX2luaXQ6DQpAQCAtMTEyNSw4ICsxMTI3LDggQEAgc3RhdGlj
IGludCBtdGtfanBlZ19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJc3Ry
dWN0IG10a19qcGVnX2RldiAqanBlZyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KIA0K
IAlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7DQotCXZpZGVvX3VucmVnaXN0ZXJfZGV2
aWNlKGpwZWctPmRlY192ZGV2KTsNCi0JdmlkZW9fZGV2aWNlX3JlbGVhc2UoanBlZy0+ZGVjX3Zk
ZXYpOw0KKwl2aWRlb191bnJlZ2lzdGVyX2RldmljZShqcGVnLT52ZGV2KTsNCisJdmlkZW9fZGV2
aWNlX3JlbGVhc2UoanBlZy0+dmRldik7DQogCXY0bDJfbTJtX3JlbGVhc2UoanBlZy0+bTJtX2Rl
dik7DQogCXY0bDJfZGV2aWNlX3VucmVnaXN0ZXIoJmpwZWctPnY0bDJfZGV2KTsNCiANCmRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaCBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oDQppbmRleCA1
ZmNkZjY5NTA3ODIuLjBiNTllNDg0OTVkNSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaA0KQEAgLTUxLDggKzUxLDggQEAgZW51bSBtdGtf
anBlZ19jdHhfc3RhdGUgew0KICAqIEB2NGwyX2RldjoJCXY0bDIgZGV2aWNlIGZvciBtZW0ybWVt
IG1vZGUNCiAgKiBAbTJtX2RldjoJCXY0bDIgbWVtMm1lbSBkZXZpY2UgZGF0YQ0KICAqIEBhbGxv
Y19jdHg6CQl2aWRlb2J1ZjIgbWVtb3J5IGFsbG9jYXRvcidzIGNvbnRleHQNCi0gKiBAZGVjX3Zk
ZXY6CQl2aWRlbyBkZXZpY2Ugbm9kZSBmb3IgZGVjb2RlciBtZW0ybWVtIG1vZGUNCi0gKiBAZGVj
X3JlZ19iYXNlOglKUEVHIHJlZ2lzdGVycyBtYXBwaW5nDQorICogQHZkZXY6CQl2aWRlbyBkZXZp
Y2Ugbm9kZSBmb3IganBlZyBtZW0ybWVtIG1vZGUNCisgKiBAcmVnX2Jhc2U6CQlKUEVHIHJlZ2lz
dGVycyBtYXBwaW5nDQogICogQGNsa19qZGVjOgkJSlBFRyBodyB3b3JraW5nIGNsb2NrDQogICog
QGNsa19qZGVjX3NtaToJSlBFRyBTTUkgYnVzIGNsb2NrDQogICogQGxhcmI6CQlTTUkgZGV2aWNl
DQpAQCAtNjUsOCArNjUsOCBAQCBzdHJ1Y3QgbXRrX2pwZWdfZGV2IHsNCiAJc3RydWN0IHY0bDJf
ZGV2aWNlCXY0bDJfZGV2Ow0KIAlzdHJ1Y3QgdjRsMl9tMm1fZGV2CSptMm1fZGV2Ow0KIAl2b2lk
CQkJKmFsbG9jX2N0eDsNCi0Jc3RydWN0IHZpZGVvX2RldmljZQkqZGVjX3ZkZXY7DQotCXZvaWQg
X19pb21lbQkJKmRlY19yZWdfYmFzZTsNCisJc3RydWN0IHZpZGVvX2RldmljZQkqdmRldjsNCisJ
dm9pZCBfX2lvbWVtCQkqcmVnX2Jhc2U7DQogCXN0cnVjdCBjbGsJCSpjbGtfamRlYzsNCiAJc3Ry
dWN0IGNsawkJKmNsa19qZGVjX3NtaTsNCiAJc3RydWN0IGRldmljZQkJKmxhcmI7DQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19kZWNfaHcuaCBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfZGVjX2h3LmgNCmluZGV4
IDFjYzM3ZGJmYzhlNy4uY2UyNjNkYjVmMzBhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19kZWNfaHcuaA0KKysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19kZWNfaHcuaA0KQEAgLTMsMTAgKzMsMTEgQEANCiAg
KiBDb3B5cmlnaHQgKGMpIDIwMTYgTWVkaWFUZWsgSW5jLg0KICAqIEF1dGhvcjogTWluZyBIc2l1
IFRzYWkgPG1pbmdoc2l1LnRzYWlAbWVkaWF0ZWsuY29tPg0KICAqICAgICAgICAgUmljayBDaGFu
ZyA8cmljay5jaGFuZ0BtZWRpYXRlay5jb20+DQorICogICAgICAgICBYaWEgSmlhbmcgPHhpYS5q
aWFuZ0BtZWRpYXRlay5jb20+DQogICovDQogDQotI2lmbmRlZiBfTVRLX0pQRUdfSFdfSA0KLSNk
ZWZpbmUgX01US19KUEVHX0hXX0gNCisjaWZuZGVmIF9NVEtfSlBFR19ERUNfSFdfSA0KKyNkZWZp
bmUgX01US19KUEVHX0RFQ19IV19IDQogDQogI2luY2x1ZGUgPG1lZGlhL3ZpZGVvYnVmMi1jb3Jl
Lmg+DQogDQpAQCAtNzUsNCArNzYsNCBAQCB2b2lkIG10a19qcGVnX2RlY19zZXRfY29uZmlnKHZv
aWQgX19pb21lbSAqYmFzZSwNCiB2b2lkIG10a19qcGVnX2RlY19yZXNldCh2b2lkIF9faW9tZW0g
KmRlY19yZWdfYmFzZSk7DQogdm9pZCBtdGtfanBlZ19kZWNfc3RhcnQodm9pZCBfX2lvbWVtICpk
ZWNfcmVnX2Jhc2UpOw0KIA0KLSNlbmRpZiAvKiBfTVRLX0pQRUdfSFdfSCAqLw0KKyNlbmRpZiAv
KiBfTVRLX0pQRUdfREVDX0hXX0ggKi8NCi0tIA0KMi4xOC4wDQo=

