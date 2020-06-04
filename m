Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC9D41EE0DA
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728623AbgFDJJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:09:46 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:56880 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728188AbgFDJIP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 05:08:15 -0400
X-UUID: 3ca66dc8564d480cbb5e31ed25bba095-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=B/w2ehlpdSMG2o1JAKklslgzvugqL0CKOQBnvbbutuc=;
        b=smMkJ/utJzrgVNvDcRT4RUMjB2jRAkpK1P0DlNYTdIwqNZhC5IWx3v5tpfnMSQInPWaX8lm1rNUgtJMTJn7D8H99yQcXOVaibtxXjhX0n57XKJaABNtk6xOueU9X+NAAvE6b6tIrmXbRvVRIFLiSO3TF+dk0d/qfaWz9zr4nVOU=;
X-UUID: 3ca66dc8564d480cbb5e31ed25bba095-20200604
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 157217895; Thu, 04 Jun 2020 17:08:12 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 17:08:09 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 17:08:08 +0800
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
Subject: [PATCH RESEND v9 08/18] media: platform: Cancel the last frame handling flow
Date:   Thu, 4 Jun 2020 17:05:43 +0800
Message-ID: <20200604090553.10861-10-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200604090553.10861-1-xia.jiang@mediatek.com>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhlcmUgaXMgbm8gbmVlZCB0byBxdWV1ZSBhbiBlbXB0eSBidWZmZXIgZm9yIHNpZ25hbGluZyBh
IGxhc3QgZnJhbWUsDQpiZWNhdXNlIGFsbCBmcmFtZXMgYXJlIHNlcGFyYXRlIGZyb20gZWFjaCBv
dGhlciBpbiBKUEVHLg0KDQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0BtZWRp
YXRlay5jb20+DQotLS0NCnY5OiBuZXcgcGF0Y2gNCi0tLQ0KIC4uLi9tZWRpYS9wbGF0Zm9ybS9t
dGstanBlZy9tdGtfanBlZ19jb3JlLmMgICB8IDIxICstLS0tLS0tLS0tLS0tLS0tLS0NCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIwIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KaW5kZXggNDliZGJm
MWM0MzVmLi5iYjRlYmNlODgxZWUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstanBlZy9tdGtfanBlZ19jb3JlLmMNCkBAIC01NSwxNSArNTUsOSBAQCBzdGF0aWMgc3RydWN0
IG10a19qcGVnX2ZtdCBtdGtfanBlZ19mb3JtYXRzW10gPSB7DQogDQogI2RlZmluZSBNVEtfSlBF
R19OVU1fRk9STUFUUyBBUlJBWV9TSVpFKG10a19qcGVnX2Zvcm1hdHMpDQogDQotZW51bSB7DQot
CU1US19KUEVHX0JVRl9GTEFHU19JTklUCQkJPSAwLA0KLQlNVEtfSlBFR19CVUZfRkxBR1NfTEFT
VF9GUkFNRQkJPSAxLA0KLX07DQotDQogc3RydWN0IG10a19qcGVnX3NyY19idWYgew0KIAlzdHJ1
Y3QgdmIyX3Y0bDJfYnVmZmVyIGI7DQogCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsNCi0JaW50IGZs
YWdzOw0KIAlzdHJ1Y3QgbXRrX2pwZWdfZGVjX3BhcmFtIGRlY19wYXJhbTsNCiB9Ow0KIA0KQEAg
LTUyMCw4ICs1MTQsNiBAQCBzdGF0aWMgaW50IG10a19qcGVnX3FidWYoc3RydWN0IGZpbGUgKmZp
bGUsIHZvaWQgKnByaXYsIHN0cnVjdCB2NGwyX2J1ZmZlciAqYnVmKQ0KIA0KIAl2YiA9IHZiMl9n
ZXRfYnVmZmVyKHZxLCBidWYtPmluZGV4KTsNCiAJanBlZ19zcmNfYnVmID0gbXRrX2pwZWdfdmIy
X3RvX3NyY2J1Zih2Yik7DQotCWpwZWdfc3JjX2J1Zi0+ZmxhZ3MgPSAoYnVmLT5tLnBsYW5lc1sw
XS5ieXRlc3VzZWQgPT0gMCkgPw0KLQkJTVRLX0pQRUdfQlVGX0ZMQUdTX0xBU1RfRlJBTUUgOiBN
VEtfSlBFR19CVUZfRkxBR1NfSU5JVDsNCiBlbmQ6DQogCXJldHVybiB2NGwyX20ybV9xYnVmKGZp
bGUsIGZoLT5tMm1fY3R4LCBidWYpOw0KIH0NCkBAIC02NzYsMTAgKzY2OCw2IEBAIHN0YXRpYyB2
b2lkIG10a19qcGVnX2J1Zl9xdWV1ZShzdHJ1Y3QgdmIyX2J1ZmZlciAqdmIpDQogCXBhcmFtID0g
JmpwZWdfc3JjX2J1Zi0+ZGVjX3BhcmFtOw0KIAltZW1zZXQocGFyYW0sIDAsIHNpemVvZigqcGFy
YW0pKTsNCiANCi0JaWYgKGpwZWdfc3JjX2J1Zi0+ZmxhZ3MgJiBNVEtfSlBFR19CVUZfRkxBR1Nf
TEFTVF9GUkFNRSkgew0KLQkJdjRsMl9kYmcoMSwgZGVidWcsICZqcGVnLT52NGwyX2RldiwgIkdv
dCBlb3NcbiIpOw0KLQkJZ290byBlbmQ7DQotCX0NCiAJaGVhZGVyX3ZhbGlkID0gbXRrX2pwZWdf
cGFyc2UocGFyYW0sICh1OCAqKXZiMl9wbGFuZV92YWRkcih2YiwgMCksDQogCQkJCSAgICAgIHZi
Ml9nZXRfcGxhbmVfcGF5bG9hZCh2YiwgMCkpOw0KIAlpZiAoIWhlYWRlcl92YWxpZCkgew0KQEAg
LTc5MiwxOSArNzgwLDEyIEBAIHN0YXRpYyB2b2lkIG10a19qcGVnX2RldmljZV9ydW4odm9pZCAq
cHJpdikNCiAJc3RydWN0IG10a19qcGVnX3NyY19idWYgKmpwZWdfc3JjX2J1ZjsNCiAJc3RydWN0
IG10a19qcGVnX2JzIGJzOw0KIAlzdHJ1Y3QgbXRrX2pwZWdfZmIgZmI7DQotCWludCBpLCByZXQ7
DQorCWludCByZXQ7DQogDQogCXNyY19idWYgPSB2NGwyX20ybV9uZXh0X3NyY19idWYoY3R4LT5m
aC5tMm1fY3R4KTsNCiAJZHN0X2J1ZiA9IHY0bDJfbTJtX25leHRfZHN0X2J1ZihjdHgtPmZoLm0y
bV9jdHgpOw0KIAlqcGVnX3NyY19idWYgPSBtdGtfanBlZ192YjJfdG9fc3JjYnVmKCZzcmNfYnVm
LT52YjJfYnVmKTsNCiANCi0JaWYgKGpwZWdfc3JjX2J1Zi0+ZmxhZ3MgJiBNVEtfSlBFR19CVUZf
RkxBR1NfTEFTVF9GUkFNRSkgew0KLQkJZm9yIChpID0gMDsgaSA8IGRzdF9idWYtPnZiMl9idWYu
bnVtX3BsYW5lczsgaSsrKQ0KLQkJCXZiMl9zZXRfcGxhbmVfcGF5bG9hZCgmZHN0X2J1Zi0+dmIy
X2J1ZiwgaSwgMCk7DQotCQlidWZfc3RhdGUgPSBWQjJfQlVGX1NUQVRFX0RPTkU7DQotCQlnb3Rv
IGRlY19lbmQ7DQotCX0NCi0NCiAJaWYgKG10a19qcGVnX2NoZWNrX3Jlc29sdXRpb25fY2hhbmdl
KGN0eCwgJmpwZWdfc3JjX2J1Zi0+ZGVjX3BhcmFtKSkgew0KIAkJbXRrX2pwZWdfcXVldWVfc3Jj
X2NoZ19ldmVudChjdHgpOw0KIAkJY3R4LT5zdGF0ZSA9IE1US19KUEVHX1NPVVJDRV9DSEFOR0U7
DQotLSANCjIuMTguMA0K

