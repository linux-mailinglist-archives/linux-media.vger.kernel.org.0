Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C3323B358
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 05:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729723AbgHDDlz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 23:41:55 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:34765 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729710AbgHDDlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 23:41:55 -0400
X-UUID: 00c439a70f124bb4b4d22e1f1ba59d34-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=T206XQpMfXYf+0AvODKQPGGQsO7Nm22nEW5m9gZP/gU=;
        b=EFJHRf5WdNhRdfgHWC/cp3Pooedvtk0+R+3pOucoFnzZalxECC1PHNxqzQ0rCtIiW6CRWyQutXgLerfp36b7Gi8BKeseZWIxlhvnqxGZ1uc71MraY6ap5UNb4Io+ByFwwbFAGyYhKs5xzvQTDnVSxgUQqIvIMSHBKB5eW4ba3Cc=;
X-UUID: 00c439a70f124bb4b4d22e1f1ba59d34-20200804
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1675386594; Tue, 04 Aug 2020 11:41:53 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:41:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:41:50 +0800
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
Subject: [PATCH v11 08/28] media: platform: Add mechanism to handle jpeg hardware's locking up
Date:   Tue, 4 Aug 2020 11:40:42 +0800
Message-ID: <20200804034102.22983-9-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200804034102.22983-1-xia.jiang@mediatek.com>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
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
IGZyb20gbmV4dCBmcmFtZXMuDQoNClJldmlld2VkLWJ5OiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hy
b21pdW0ub3JnPg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5nIDx4aWEuamlhbmdAbWVkaWF0ZWsu
Y29tPg0KLS0tDQp2MTE6IG5vIGNoYW5nZXMNCi0tLQ0KIC4uLi9tZWRpYS9wbGF0Zm9ybS9tdGst
anBlZy9tdGtfanBlZ19jb3JlLmMgICB8IDI1ICsrKysrKysrKysrKysrKysrKysNCiAuLi4vbWVk
aWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oICAgfCAgNCArKysNCiAyIGZpbGVz
IGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCmluZGV4IGVlNGFhZjYxODU1MS4uOWJhZWVhY2I0
NDUyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBl
Z19jb3JlLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdf
Y29yZS5jDQpAQCAtODE2LDYgKzgxNiw5IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnX2RldmljZV9y
dW4odm9pZCAqcHJpdikNCiAJaWYgKHJldCA8IDApDQogCQlnb3RvIGRlY19lbmQ7DQogDQorCXNj
aGVkdWxlX2RlbGF5ZWRfd29yaygmanBlZy0+am9iX3RpbWVvdXRfd29yaywNCisJCQkgICAgICBt
c2Vjc190b19qaWZmaWVzKE1US19KUEVHX0hXX1RJTUVPVVRfTVNFQykpOw0KKw0KIAltdGtfanBl
Z19zZXRfZGVjX3NyYyhjdHgsICZzcmNfYnVmLT52YjJfYnVmLCAmYnMpOw0KIAlpZiAobXRrX2pw
ZWdfc2V0X2RlY19kc3QoY3R4LCAmanBlZ19zcmNfYnVmLT5kZWNfcGFyYW0sICZkc3RfYnVmLT52
YjJfYnVmLCAmZmIpKQ0KIAkJZ290byBkZWNfZW5kOw0KQEAgLTkxMSw2ICs5MTQsOCBAQCBzdGF0
aWMgaXJxcmV0dXJuX3QgbXRrX2pwZWdfZGVjX2lycShpbnQgaXJxLCB2b2lkICpwcml2KQ0KIAl1
MzIgZGVjX3JldDsNCiAJaW50IGk7DQogDQorCWNhbmNlbF9kZWxheWVkX3dvcmsoJmpwZWctPmpv
Yl90aW1lb3V0X3dvcmspOw0KKw0KIAlkZWNfcmV0ID0gbXRrX2pwZWdfZGVjX2dldF9pbnRfc3Rh
dHVzKGpwZWctPmRlY19yZWdfYmFzZSk7DQogCWRlY19pcnFfcmV0ID0gbXRrX2pwZWdfZGVjX2Vu
dW1fcmVzdWx0KGRlY19yZXQpOw0KIAljdHggPSB2NGwyX20ybV9nZXRfY3Vycl9wcml2KGpwZWct
Pm0ybV9kZXYpOw0KQEAgLTEwNjYsNiArMTA3MSwyNSBAQCBzdGF0aWMgaW50IG10a19qcGVnX2Ns
a19pbml0KHN0cnVjdCBtdGtfanBlZ19kZXYgKmpwZWcpDQogCXJldHVybiBQVFJfRVJSX09SX1pF
Uk8oanBlZy0+Y2xrX2pkZWNfc21pKTsNCiB9DQogDQorc3RhdGljIHZvaWQgbXRrX2pwZWdfam9i
X3RpbWVvdXRfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQorew0KKwlzdHJ1Y3QgbXRr
X2pwZWdfZGV2ICpqcGVnID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBtdGtfanBlZ19kZXYs
DQorCQkJCQkJIGpvYl90aW1lb3V0X3dvcmsud29yayk7DQorCXN0cnVjdCBtdGtfanBlZ19jdHgg
KmN0eDsNCisJc3RydWN0IHZiMl92NGwyX2J1ZmZlciAqc3JjX2J1ZiwgKmRzdF9idWY7DQorDQor
CWN0eCA9IHY0bDJfbTJtX2dldF9jdXJyX3ByaXYoanBlZy0+bTJtX2Rldik7DQorCXNyY19idWYg
PSB2NGwyX20ybV9zcmNfYnVmX3JlbW92ZShjdHgtPmZoLm0ybV9jdHgpOw0KKwlkc3RfYnVmID0g
djRsMl9tMm1fZHN0X2J1Zl9yZW1vdmUoY3R4LT5maC5tMm1fY3R4KTsNCisNCisJbXRrX2pwZWdf
ZGVjX3Jlc2V0KGpwZWctPmRlY19yZWdfYmFzZSk7DQorDQorCXBtX3J1bnRpbWVfcHV0KGpwZWct
PmRldik7DQorDQorCXY0bDJfbTJtX2J1Zl9kb25lKHNyY19idWYsIFZCMl9CVUZfU1RBVEVfRVJS
T1IpOw0KKwl2NGwyX20ybV9idWZfZG9uZShkc3RfYnVmLCBWQjJfQlVGX1NUQVRFX0VSUk9SKTsN
CisJdjRsMl9tMm1fam9iX2ZpbmlzaChqcGVnLT5tMm1fZGV2LCBjdHgtPmZoLm0ybV9jdHgpOw0K
K30NCiBzdGF0aWMgaW50IG10a19qcGVnX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQogew0KIAlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVnOw0KQEAgLTEwODAsNiArMTEwNCw3
IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCiAJbXV0ZXhfaW5pdCgmanBlZy0+bG9jayk7DQogCXNwaW5fbG9ja19pbml0KCZqcGVnLT5o
d19sb2NrKTsNCiAJanBlZy0+ZGV2ID0gJnBkZXYtPmRldjsNCisJSU5JVF9ERUxBWUVEX1dPUkso
JmpwZWctPmpvYl90aW1lb3V0X3dvcmssIG10a19qcGVnX2pvYl90aW1lb3V0X3dvcmspOw0KIA0K
IAlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOw0K
IAlqcGVnLT5kZWNfcmVnX2Jhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwg
cmVzKTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19q
cGVnX2NvcmUuaCBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29y
ZS5oDQppbmRleCA5OTliZDE0Mjc4MDkuLjMyMGM0ZjhhMDE0YSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oDQorKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaA0KQEAgLTI4LDYgKzI4LDgg
QEANCiANCiAjZGVmaW5lIE1US19KUEVHX0RFRkFVTFRfU0laRUlNQUdFCSgxICogMTAyNCAqIDEw
MjQpDQogDQorI2RlZmluZSBNVEtfSlBFR19IV19USU1FT1VUX01TRUMgMTAwMA0KKw0KIGVudW0g
bXRrX2pwZWdfY3R4X3N0YXRlIHsNCiAJTVRLX0pQRUdfSU5JVCA9IDAsDQogCU1US19KUEVHX1JV
Tk5JTkcsDQpAQCAtNDgsNiArNTAsNyBAQCBlbnVtIG10a19qcGVnX2N0eF9zdGF0ZSB7DQogICog
QGNsa19qZGVjOgkJSlBFRyBodyB3b3JraW5nIGNsb2NrDQogICogQGNsa19qZGVjX3NtaToJSlBF
RyBTTUkgYnVzIGNsb2NrDQogICogQGxhcmI6CQlTTUkgZGV2aWNlDQorICogQGpvYl90aW1lb3V0
X3dvcms6CUlSUSB0aW1lb3V0IHN0cnVjdHVyZQ0KICAqLw0KIHN0cnVjdCBtdGtfanBlZ19kZXYg
ew0KIAlzdHJ1Y3QgbXV0ZXgJCWxvY2s7DQpAQCAtNjIsNiArNjUsNyBAQCBzdHJ1Y3QgbXRrX2pw
ZWdfZGV2IHsNCiAJc3RydWN0IGNsawkJKmNsa19qZGVjOw0KIAlzdHJ1Y3QgY2xrCQkqY2xrX2pk
ZWNfc21pOw0KIAlzdHJ1Y3QgZGV2aWNlCQkqbGFyYjsNCisJc3RydWN0IGRlbGF5ZWRfd29yayBq
b2JfdGltZW91dF93b3JrOw0KIH07DQogDQogLyoqDQotLSANCjIuMTguMA0K

