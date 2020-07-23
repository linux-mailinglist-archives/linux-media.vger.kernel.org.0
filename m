Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6058622A587
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387700AbgGWDGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:06:20 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:40956 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387646AbgGWDGS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:18 -0400
X-UUID: 187b30dbaaa64b5da876b8840395ecaf-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cZZKLjLUqA7lu/jFmHD2bgqKPtFaBSRp1fqq2KtRdZ4=;
        b=kfa4gm++cGDPpkSN9NAMkWrgm37OeEWLy5IlVCg6Faym2ofI8+AI14TMKCcJBTMbZc8xkWzOGjC1yrFEqWuaqLcSCk8w+DfLOAESvnkodjcxxf5Rzh8Lc8VM0h+dnoJMY9YW3Ssp+IJ4pBpBQoFVxOYaw/FdIa2eW60F0FRhhVU=;
X-UUID: 187b30dbaaa64b5da876b8840395ecaf-20200723
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 42823826; Thu, 23 Jul 2020 11:06:13 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:12 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:08 +0800
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
        <maoguang.meng@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v10 08/28] media: platform: Add mechanism to handle jpeg hardware's locking up
Date:   Thu, 23 Jul 2020 11:04:31 +0800
Message-ID: <20200723030451.5616-9-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhlcmUgaXMgYSBkZWxheWVkIHdvcmsgc2NoZWR1bGVkIGJlZm9yZSBzdGFydGluZyB0aGUgaGFy
ZHdhcmUgYW5kDQpjYW5jZWxlZCBpbiB0aGUgaW50ZXJydXB0IGhhbmRsZXIuIElmIHRoZSBkZWxh
eWVkIHdvcmsgaXMgZXhlY3V0ZWQsIGl0DQpyZXNldHMgdGhlIGhhcmR3YXJlIGFuZCByZXBvcnRz
IHRoZSBmYWlsdXJlIHRvIFY0TDIsIHNvIHRoYXQgdGhlDQpleGVjdXRpb24gY2FuIGNvbnRpbnVl
IGZyb20gbmV4dCBmcmFtZXMuDQoNClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFuZyA8eGlhLmppYW5n
QG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjEwOiBuZXcgYWRkIHBhdGNoDQotLS0NCiAuLi4vbWVkaWEv
cGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jICAgfCAyNSArKysrKysrKysrKysrKysr
KysrDQogLi4uL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaCAgIHwgIDQg
KysrDQogMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQppbmRleCBlZTRhYWY2MTg1
NTEuLjliYWVlYWNiNDQ1MiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LWpwZWcvbXRrX2pwZWdfY29yZS5jDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1q
cGVnL210a19qcGVnX2NvcmUuYw0KQEAgLTgxNiw2ICs4MTYsOSBAQCBzdGF0aWMgdm9pZCBtdGtf
anBlZ19kZXZpY2VfcnVuKHZvaWQgKnByaXYpDQogCWlmIChyZXQgPCAwKQ0KIAkJZ290byBkZWNf
ZW5kOw0KIA0KKwlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJmpwZWctPmpvYl90aW1lb3V0X3dvcmss
DQorCQkJICAgICAgbXNlY3NfdG9famlmZmllcyhNVEtfSlBFR19IV19USU1FT1VUX01TRUMpKTsN
CisNCiAJbXRrX2pwZWdfc2V0X2RlY19zcmMoY3R4LCAmc3JjX2J1Zi0+dmIyX2J1ZiwgJmJzKTsN
CiAJaWYgKG10a19qcGVnX3NldF9kZWNfZHN0KGN0eCwgJmpwZWdfc3JjX2J1Zi0+ZGVjX3BhcmFt
LCAmZHN0X2J1Zi0+dmIyX2J1ZiwgJmZiKSkNCiAJCWdvdG8gZGVjX2VuZDsNCkBAIC05MTEsNiAr
OTE0LDggQEAgc3RhdGljIGlycXJldHVybl90IG10a19qcGVnX2RlY19pcnEoaW50IGlycSwgdm9p
ZCAqcHJpdikNCiAJdTMyIGRlY19yZXQ7DQogCWludCBpOw0KIA0KKwljYW5jZWxfZGVsYXllZF93
b3JrKCZqcGVnLT5qb2JfdGltZW91dF93b3JrKTsNCisNCiAJZGVjX3JldCA9IG10a19qcGVnX2Rl
Y19nZXRfaW50X3N0YXR1cyhqcGVnLT5kZWNfcmVnX2Jhc2UpOw0KIAlkZWNfaXJxX3JldCA9IG10
a19qcGVnX2RlY19lbnVtX3Jlc3VsdChkZWNfcmV0KTsNCiAJY3R4ID0gdjRsMl9tMm1fZ2V0X2N1
cnJfcHJpdihqcGVnLT5tMm1fZGV2KTsNCkBAIC0xMDY2LDYgKzEwNzEsMjUgQEAgc3RhdGljIGlu
dCBtdGtfanBlZ19jbGtfaW5pdChzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVnKQ0KIAlyZXR1cm4g
UFRSX0VSUl9PUl9aRVJPKGpwZWctPmNsa19qZGVjX3NtaSk7DQogfQ0KIA0KK3N0YXRpYyB2b2lk
IG10a19qcGVnX2pvYl90aW1lb3V0X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KK3sN
CisJc3RydWN0IG10a19qcGVnX2RldiAqanBlZyA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3Qg
bXRrX2pwZWdfZGV2LA0KKwkJCQkJCSBqb2JfdGltZW91dF93b3JrLndvcmspOw0KKwlzdHJ1Y3Qg
bXRrX2pwZWdfY3R4ICpjdHg7DQorCXN0cnVjdCB2YjJfdjRsMl9idWZmZXIgKnNyY19idWYsICpk
c3RfYnVmOw0KKw0KKwljdHggPSB2NGwyX20ybV9nZXRfY3Vycl9wcml2KGpwZWctPm0ybV9kZXYp
Ow0KKwlzcmNfYnVmID0gdjRsMl9tMm1fc3JjX2J1Zl9yZW1vdmUoY3R4LT5maC5tMm1fY3R4KTsN
CisJZHN0X2J1ZiA9IHY0bDJfbTJtX2RzdF9idWZfcmVtb3ZlKGN0eC0+ZmgubTJtX2N0eCk7DQor
DQorCW10a19qcGVnX2RlY19yZXNldChqcGVnLT5kZWNfcmVnX2Jhc2UpOw0KKw0KKwlwbV9ydW50
aW1lX3B1dChqcGVnLT5kZXYpOw0KKw0KKwl2NGwyX20ybV9idWZfZG9uZShzcmNfYnVmLCBWQjJf
QlVGX1NUQVRFX0VSUk9SKTsNCisJdjRsMl9tMm1fYnVmX2RvbmUoZHN0X2J1ZiwgVkIyX0JVRl9T
VEFURV9FUlJPUik7DQorCXY0bDJfbTJtX2pvYl9maW5pc2goanBlZy0+bTJtX2RldiwgY3R4LT5m
aC5tMm1fY3R4KTsNCit9DQogc3RhdGljIGludCBtdGtfanBlZ19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KIHsNCiAJc3RydWN0IG10a19qcGVnX2RldiAqanBlZzsNCkBAIC0x
MDgwLDYgKzExMDQsNyBAQCBzdGF0aWMgaW50IG10a19qcGVnX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQogCW11dGV4X2luaXQoJmpwZWctPmxvY2spOw0KIAlzcGluX2xvY2tf
aW5pdCgmanBlZy0+aHdfbG9jayk7DQogCWpwZWctPmRldiA9ICZwZGV2LT5kZXY7DQorCUlOSVRf
REVMQVlFRF9XT1JLKCZqcGVnLT5qb2JfdGltZW91dF93b3JrLCBtdGtfanBlZ19qb2JfdGltZW91
dF93b3JrKTsNCiANCiAJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VS
Q0VfTUVNLCAwKTsNCiAJanBlZy0+ZGVjX3JlZ19iYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNl
KCZwZGV2LT5kZXYsIHJlcyk7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstanBlZy9tdGtfanBlZ19jb3JlLmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVn
L210a19qcGVnX2NvcmUuaA0KaW5kZXggOTk5YmQxNDI3ODA5Li4zMjBjNGY4YTAxNGEgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaA0K
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmgNCkBA
IC0yOCw2ICsyOCw4IEBADQogDQogI2RlZmluZSBNVEtfSlBFR19ERUZBVUxUX1NJWkVJTUFHRQko
MSAqIDEwMjQgKiAxMDI0KQ0KIA0KKyNkZWZpbmUgTVRLX0pQRUdfSFdfVElNRU9VVF9NU0VDIDEw
MDANCisNCiBlbnVtIG10a19qcGVnX2N0eF9zdGF0ZSB7DQogCU1US19KUEVHX0lOSVQgPSAwLA0K
IAlNVEtfSlBFR19SVU5OSU5HLA0KQEAgLTQ4LDYgKzUwLDcgQEAgZW51bSBtdGtfanBlZ19jdHhf
c3RhdGUgew0KICAqIEBjbGtfamRlYzoJCUpQRUcgaHcgd29ya2luZyBjbG9jaw0KICAqIEBjbGtf
amRlY19zbWk6CUpQRUcgU01JIGJ1cyBjbG9jaw0KICAqIEBsYXJiOgkJU01JIGRldmljZQ0KKyAq
IEBqb2JfdGltZW91dF93b3JrOglJUlEgdGltZW91dCBzdHJ1Y3R1cmUNCiAgKi8NCiBzdHJ1Y3Qg
bXRrX2pwZWdfZGV2IHsNCiAJc3RydWN0IG11dGV4CQlsb2NrOw0KQEAgLTYyLDYgKzY1LDcgQEAg
c3RydWN0IG10a19qcGVnX2RldiB7DQogCXN0cnVjdCBjbGsJCSpjbGtfamRlYzsNCiAJc3RydWN0
IGNsawkJKmNsa19qZGVjX3NtaTsNCiAJc3RydWN0IGRldmljZQkJKmxhcmI7DQorCXN0cnVjdCBk
ZWxheWVkX3dvcmsgam9iX3RpbWVvdXRfd29yazsNCiB9Ow0KIA0KIC8qKg0KLS0gDQoyLjE4LjAN
Cg==

