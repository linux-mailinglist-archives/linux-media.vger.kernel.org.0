Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D67B619D41B
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 11:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403767AbgDCJkq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 05:40:46 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:36555 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2390702AbgDCJkp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 05:40:45 -0400
X-UUID: 940d031f705f423cbf2016f97a7028a7-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pm/C6wkpcwoRE/CCieW0EFzNKBkWkCFOYLbu5+5Ga74=;
        b=mAkq41iZCfO1aP0e5kXXhKJUNEhVDFlDH42XUxx+qmD8eyH2bDlrpcMx8fm04xbglvjSiYaYreptPwXv8oFubSz3ekVbqe92azTA97PwTOERvP2VnBmxWHob8h218p9/OuC/KwTYRY9LJpZRc6jYPPiB98jk8OG3TmZnzYCbUic=;
X-UUID: 940d031f705f423cbf2016f97a7028a7-20200403
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1495600782; Fri, 03 Apr 2020 17:40:41 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Apr 2020 17:40:37 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Apr 2020 17:40:36 +0800
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
Subject: [PATCH v8 05/14] media: platform: Improve power on and power off flow
Date:   Fri, 3 Apr 2020 17:40:24 +0800
Message-ID: <20200403094033.8288-6-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200403094033.8288-1-xia.jiang@mediatek.com>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
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
b3dlciBmb3IgdGhlIHRpbWUNCmJldHdlZW4gcHJvY2Vzc2luZyB0d28gZnJhbWVzLg0KDQpTaWdu
ZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0NCiAuLi4v
bWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jICAgfCAyNyArKysrKy0tLS0t
LS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25z
KC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19q
cGVnX2NvcmUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29y
ZS5jDQppbmRleCBhNTM2ZmE5NWIzZDYuLmRkNWNhZGQxMDFlZiAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQorKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KQEAgLTcxMCwyMyArNzEw
LDYgQEAgc3RhdGljIHN0cnVjdCB2YjJfdjRsMl9idWZmZXIgKm10a19qcGVnX2J1Zl9yZW1vdmUo
c3RydWN0IG10a19qcGVnX2N0eCAqY3R4LA0KIAkJcmV0dXJuIHY0bDJfbTJtX2RzdF9idWZfcmVt
b3ZlKGN0eC0+ZmgubTJtX2N0eCk7DQogfQ0KIA0KLXN0YXRpYyBpbnQgbXRrX2pwZWdfc3RhcnRf
c3RyZWFtaW5nKHN0cnVjdCB2YjJfcXVldWUgKnEsIHVuc2lnbmVkIGludCBjb3VudCkNCi17DQot
CXN0cnVjdCBtdGtfanBlZ19jdHggKmN0eCA9IHZiMl9nZXRfZHJ2X3ByaXYocSk7DQotCXN0cnVj
dCB2YjJfdjRsMl9idWZmZXIgKnZiOw0KLQlpbnQgcmV0ID0gMDsNCi0NCi0JcmV0ID0gcG1fcnVu
dGltZV9nZXRfc3luYyhjdHgtPmpwZWctPmRldik7DQotCWlmIChyZXQgPCAwKQ0KLQkJZ290byBl
cnI7DQotDQotCXJldHVybiAwOw0KLWVycjoNCi0Jd2hpbGUgKCh2YiA9IG10a19qcGVnX2J1Zl9y
ZW1vdmUoY3R4LCBxLT50eXBlKSkpDQotCQl2NGwyX20ybV9idWZfZG9uZSh2YiwgVkIyX0JVRl9T
VEFURV9RVUVVRUQpOw0KLQlyZXR1cm4gcmV0Ow0KLX0NCi0NCiBzdGF0aWMgdm9pZCBtdGtfanBl
Z19zdG9wX3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICpxKQ0KIHsNCiAJc3RydWN0IG10a19q
cGVnX2N0eCAqY3R4ID0gdmIyX2dldF9kcnZfcHJpdihxKTsNCkBAIC03NTEsOCArNzM0LDYgQEAg
c3RhdGljIHZvaWQgbXRrX2pwZWdfc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1ZSAqcSkN
CiANCiAJd2hpbGUgKCh2YiA9IG10a19qcGVnX2J1Zl9yZW1vdmUoY3R4LCBxLT50eXBlKSkpDQog
CQl2NGwyX20ybV9idWZfZG9uZSh2YiwgVkIyX0JVRl9TVEFURV9FUlJPUik7DQotDQotCXBtX3J1
bnRpbWVfcHV0X3N5bmMoY3R4LT5qcGVnLT5kZXYpOw0KIH0NCiANCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHZiMl9vcHMgbXRrX2pwZWdfcW9wcyA9IHsNCkBAIC03NjEsNyArNzQyLDYgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB2YjJfb3BzIG10a19qcGVnX3FvcHMgPSB7DQogCS5idWZfcXVldWUgICAg
ICAgICAgPSBtdGtfanBlZ19idWZfcXVldWUsDQogCS53YWl0X3ByZXBhcmUgICAgICAgPSB2YjJf
b3BzX3dhaXRfcHJlcGFyZSwNCiAJLndhaXRfZmluaXNoICAgICAgICA9IHZiMl9vcHNfd2FpdF9m
aW5pc2gsDQotCS5zdGFydF9zdHJlYW1pbmcgICAgPSBtdGtfanBlZ19zdGFydF9zdHJlYW1pbmcs
DQogCS5zdG9wX3N0cmVhbWluZyAgICAgPSBtdGtfanBlZ19zdG9wX3N0cmVhbWluZywNCiB9Ow0K
IA0KQEAgLTgxMiw3ICs3OTIsNyBAQCBzdGF0aWMgdm9pZCBtdGtfanBlZ19kZXZpY2VfcnVuKHZv
aWQgKnByaXYpDQogCXN0cnVjdCBtdGtfanBlZ19zcmNfYnVmICpqcGVnX3NyY19idWY7DQogCXN0
cnVjdCBtdGtfanBlZ19icyBiczsNCiAJc3RydWN0IG10a19qcGVnX2ZiIGZiOw0KLQlpbnQgaTsN
CisJaW50IGksIHJldDsNCiANCiAJc3JjX2J1ZiA9IHY0bDJfbTJtX25leHRfc3JjX2J1ZihjdHgt
PmZoLm0ybV9jdHgpOw0KIAlkc3RfYnVmID0gdjRsMl9tMm1fbmV4dF9kc3RfYnVmKGN0eC0+Zmgu
bTJtX2N0eCk7DQpAQCAtODMyLDYgKzgxMiwxMCBAQCBzdGF0aWMgdm9pZCBtdGtfanBlZ19kZXZp
Y2VfcnVuKHZvaWQgKnByaXYpDQogCQlyZXR1cm47DQogCX0NCiANCisJcmV0ID0gcG1fcnVudGlt
ZV9nZXRfc3luYyhqcGVnLT5kZXYpOw0KKwlpZiAocmV0IDwgMCkNCisJCWdvdG8gZGVjX2VuZDsN
CisNCiAJbXRrX2pwZWdfc2V0X2RlY19zcmMoY3R4LCAmc3JjX2J1Zi0+dmIyX2J1ZiwgJmJzKTsN
CiAJaWYgKG10a19qcGVnX3NldF9kZWNfZHN0KGN0eCwgJmpwZWdfc3JjX2J1Zi0+ZGVjX3BhcmFt
LCAmZHN0X2J1Zi0+dmIyX2J1ZiwgJmZiKSkNCiAJCWdvdG8gZGVjX2VuZDsNCkBAIC05NTcsNiAr
OTQxLDcgQEAgc3RhdGljIGlycXJldHVybl90IG10a19qcGVnX2RlY19pcnEoaW50IGlycSwgdm9p
ZCAqcHJpdikNCiAJdjRsMl9tMm1fYnVmX2RvbmUoc3JjX2J1ZiwgYnVmX3N0YXRlKTsNCiAJdjRs
Ml9tMm1fYnVmX2RvbmUoZHN0X2J1ZiwgYnVmX3N0YXRlKTsNCiAJdjRsMl9tMm1fam9iX2Zpbmlz
aChqcGVnLT5tMm1fZGV2LCBjdHgtPmZoLm0ybV9jdHgpOw0KKwlwbV9ydW50aW1lX3B1dF9zeW5j
KGN0eC0+anBlZy0+ZGV2KTsNCiAJcmV0dXJuIElSUV9IQU5ETEVEOw0KIH0NCiANCi0tIA0KMi4x
OC4wDQo=

