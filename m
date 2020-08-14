Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D192445BA
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgHNHP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:15:29 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:8537 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726656AbgHNHNQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:13:16 -0400
X-UUID: ecc3d3922ff04653970235261010ae24-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lNCIABXkVF174TYBNF+UNKo498GDhMq8A+L7bicPU5k=;
        b=qlaTT+n+Z3v0R4I3gLYjSCnpVvMtGjVm4ATe84HHBBAWV3zX/6Qw9e5KDh2mJHMCE/S2Rhi6ijUt9/eV2PDR3uxNjy4xVc8z9B1HeYWXZD06odiCDTXWJ6TDQD8UmwnEUy/vHLRW/i+BhLNUXR5ct5Lf/TvO0Ti718ubfselQPU=;
X-UUID: ecc3d3922ff04653970235261010ae24-20200814
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1315696491; Fri, 14 Aug 2020 15:13:11 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:07 +0800
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
Subject: [PATCH v12 05/29] media: platform: Improve power on and power off flow
Date:   Fri, 14 Aug 2020 15:11:38 +0800
Message-ID: <20200814071202.25067-7-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200814071202.25067-1-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Q2FsbCBwbV9ydW50aW1lX2dldF9zeW5jKCkgYmVmb3JlIHN0YXJ0aW5nIGEgZnJhbWUgYW5kIHRo
ZW4NCnBtX3J1bnRpbWVfcHV0KCkgYWZ0ZXIgY29tcGxldGluZyBpdC4gVGhpcyBjYW4gc2F2ZSBw
b3dlciBmb3IgdGhlIHRpbWUNCmJldHdlZW4gcHJvY2Vzc2luZyB0d28gZnJhbWVzLg0KDQpSZXZp
ZXdlZC1ieTogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4NClNpZ25lZC1vZmYtYnk6
IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjEyOiBubyBjaGFuZ2Vz
DQotLS0NCiAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jICAgfCAy
NyArKysrKy0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MjEgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay1qcGVnL210a19qcGVnX2NvcmUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcv
bXRrX2pwZWdfY29yZS5jDQppbmRleCAxMjYwOWNhNDZmZDkuLmZiNjI0Mzg1OTY5ZSAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQor
KysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KQEAg
LTcxMCwyMyArNzEwLDYgQEAgc3RhdGljIHN0cnVjdCB2YjJfdjRsMl9idWZmZXIgKm10a19qcGVn
X2J1Zl9yZW1vdmUoc3RydWN0IG10a19qcGVnX2N0eCAqY3R4LA0KIAkJcmV0dXJuIHY0bDJfbTJt
X2RzdF9idWZfcmVtb3ZlKGN0eC0+ZmgubTJtX2N0eCk7DQogfQ0KIA0KLXN0YXRpYyBpbnQgbXRr
X2pwZWdfc3RhcnRfc3RyZWFtaW5nKHN0cnVjdCB2YjJfcXVldWUgKnEsIHVuc2lnbmVkIGludCBj
b3VudCkNCi17DQotCXN0cnVjdCBtdGtfanBlZ19jdHggKmN0eCA9IHZiMl9nZXRfZHJ2X3ByaXYo
cSk7DQotCXN0cnVjdCB2YjJfdjRsMl9idWZmZXIgKnZiOw0KLQlpbnQgcmV0ID0gMDsNCi0NCi0J
cmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhjdHgtPmpwZWctPmRldik7DQotCWlmIChyZXQgPCAw
KQ0KLQkJZ290byBlcnI7DQotDQotCXJldHVybiAwOw0KLWVycjoNCi0Jd2hpbGUgKCh2YiA9IG10
a19qcGVnX2J1Zl9yZW1vdmUoY3R4LCBxLT50eXBlKSkpDQotCQl2NGwyX20ybV9idWZfZG9uZSh2
YiwgVkIyX0JVRl9TVEFURV9RVUVVRUQpOw0KLQlyZXR1cm4gcmV0Ow0KLX0NCi0NCiBzdGF0aWMg
dm9pZCBtdGtfanBlZ19zdG9wX3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICpxKQ0KIHsNCiAJ
c3RydWN0IG10a19qcGVnX2N0eCAqY3R4ID0gdmIyX2dldF9kcnZfcHJpdihxKTsNCkBAIC03NTEs
OCArNzM0LDYgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdfc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZi
Ml9xdWV1ZSAqcSkNCiANCiAJd2hpbGUgKCh2YiA9IG10a19qcGVnX2J1Zl9yZW1vdmUoY3R4LCBx
LT50eXBlKSkpDQogCQl2NGwyX20ybV9idWZfZG9uZSh2YiwgVkIyX0JVRl9TVEFURV9FUlJPUik7
DQotDQotCXBtX3J1bnRpbWVfcHV0X3N5bmMoY3R4LT5qcGVnLT5kZXYpOw0KIH0NCiANCiBzdGF0
aWMgY29uc3Qgc3RydWN0IHZiMl9vcHMgbXRrX2pwZWdfcW9wcyA9IHsNCkBAIC03NjEsNyArNzQy
LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2YjJfb3BzIG10a19qcGVnX3FvcHMgPSB7DQogCS5i
dWZfcXVldWUgICAgICAgICAgPSBtdGtfanBlZ19idWZfcXVldWUsDQogCS53YWl0X3ByZXBhcmUg
ICAgICAgPSB2YjJfb3BzX3dhaXRfcHJlcGFyZSwNCiAJLndhaXRfZmluaXNoICAgICAgICA9IHZi
Ml9vcHNfd2FpdF9maW5pc2gsDQotCS5zdGFydF9zdHJlYW1pbmcgICAgPSBtdGtfanBlZ19zdGFy
dF9zdHJlYW1pbmcsDQogCS5zdG9wX3N0cmVhbWluZyAgICAgPSBtdGtfanBlZ19zdG9wX3N0cmVh
bWluZywNCiB9Ow0KIA0KQEAgLTgxMiw3ICs3OTIsNyBAQCBzdGF0aWMgdm9pZCBtdGtfanBlZ19k
ZXZpY2VfcnVuKHZvaWQgKnByaXYpDQogCXN0cnVjdCBtdGtfanBlZ19zcmNfYnVmICpqcGVnX3Ny
Y19idWY7DQogCXN0cnVjdCBtdGtfanBlZ19icyBiczsNCiAJc3RydWN0IG10a19qcGVnX2ZiIGZi
Ow0KLQlpbnQgaTsNCisJaW50IGksIHJldDsNCiANCiAJc3JjX2J1ZiA9IHY0bDJfbTJtX25leHRf
c3JjX2J1ZihjdHgtPmZoLm0ybV9jdHgpOw0KIAlkc3RfYnVmID0gdjRsMl9tMm1fbmV4dF9kc3Rf
YnVmKGN0eC0+ZmgubTJtX2N0eCk7DQpAQCAtODMyLDYgKzgxMiwxMCBAQCBzdGF0aWMgdm9pZCBt
dGtfanBlZ19kZXZpY2VfcnVuKHZvaWQgKnByaXYpDQogCQlyZXR1cm47DQogCX0NCiANCisJcmV0
ID0gcG1fcnVudGltZV9nZXRfc3luYyhqcGVnLT5kZXYpOw0KKwlpZiAocmV0IDwgMCkNCisJCWdv
dG8gZGVjX2VuZDsNCisNCiAJbXRrX2pwZWdfc2V0X2RlY19zcmMoY3R4LCAmc3JjX2J1Zi0+dmIy
X2J1ZiwgJmJzKTsNCiAJaWYgKG10a19qcGVnX3NldF9kZWNfZHN0KGN0eCwgJmpwZWdfc3JjX2J1
Zi0+ZGVjX3BhcmFtLCAmZHN0X2J1Zi0+dmIyX2J1ZiwgJmZiKSkNCiAJCWdvdG8gZGVjX2VuZDsN
CkBAIC05NTcsNiArOTQxLDcgQEAgc3RhdGljIGlycXJldHVybl90IG10a19qcGVnX2RlY19pcnEo
aW50IGlycSwgdm9pZCAqcHJpdikNCiAJdjRsMl9tMm1fYnVmX2RvbmUoc3JjX2J1ZiwgYnVmX3N0
YXRlKTsNCiAJdjRsMl9tMm1fYnVmX2RvbmUoZHN0X2J1ZiwgYnVmX3N0YXRlKTsNCiAJdjRsMl9t
Mm1fam9iX2ZpbmlzaChqcGVnLT5tMm1fZGV2LCBjdHgtPmZoLm0ybV9jdHgpOw0KKwlwbV9ydW50
aW1lX3B1dChjdHgtPmpwZWctPmRldik7DQogCXJldHVybiBJUlFfSEFORExFRDsNCiB9DQogDQot
LSANCjIuMTguMA0K

