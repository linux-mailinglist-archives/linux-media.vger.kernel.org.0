Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF8C11EE097
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbgFDJIP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:08:15 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:56880 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728483AbgFDJIN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 05:08:13 -0400
X-UUID: addd7404b82c47d2af0562ce856f199c-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TnjwBQvQ5h3AjbH2PoWNsEXpr//vl+jKu9XA1SmH/CQ=;
        b=IFJZ9X3dVuau+PpQuGmjodEBC84fZY1kczsClSJO3c8SSIF2yOiZeBVeNlDR5JZ6yqFe47uXx+Gjc937pmBs/fA7bZN6zkVbCrI2nHKVxR5LcEMFDc9YQlFGcWfsxT/oEdP0QE69raEZc8Ycggfz7lFJa8J0NciKanDGgGh/dmM=;
X-UUID: addd7404b82c47d2af0562ce856f199c-20200604
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1284567535; Thu, 04 Jun 2020 17:08:09 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 17:08:05 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 17:08:04 +0800
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
Subject: [PATCH RESEND v9 05/18] media: platform: Improve power on and power off flow
Date:   Thu, 4 Jun 2020 17:05:40 +0800
Message-ID: <20200604090553.10861-7-xia.jiang@mediatek.com>
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

Q2FsbCBwbV9ydW50aW1lX2dldF9zeW5jKCkgYmVmb3JlIHN0YXJ0aW5nIGEgZnJhbWUgYW5kIHRo
ZW4NCnBtX3J1bnRpbWVfcHV0KCkgYWZ0ZXIgY29tcGxldGluZyBpdC4gVGhpcyBjYW4gc2F2ZSBw
b3dlciBmb3IgdGhlIHRpbWUNCmJldHdlZW4gcHJvY2Vzc2luZyB0d28gZnJhbWVzLg0KDQpTaWdu
ZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0NCnY5OiB1
c2UgcG1fcnVudGltZV9wdXQoKSB0byByZXBsYWNlIHBtX3J1bnRpbWVfcHV0X3N5bmMoKQ0KLS0t
DQogLi4uL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyAgIHwgMjcgKysr
KystLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIxIGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBl
Zy9tdGtfanBlZ19jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19q
cGVnX2NvcmUuYw0KaW5kZXggMTI2MDljYTQ2ZmQ5Li5mYjYyNDM4NTk2OWUgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KKysrIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCkBAIC03MTAs
MjMgKzcxMCw2IEBAIHN0YXRpYyBzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICptdGtfanBlZ19idWZf
cmVtb3ZlKHN0cnVjdCBtdGtfanBlZ19jdHggKmN0eCwNCiAJCXJldHVybiB2NGwyX20ybV9kc3Rf
YnVmX3JlbW92ZShjdHgtPmZoLm0ybV9jdHgpOw0KIH0NCiANCi1zdGF0aWMgaW50IG10a19qcGVn
X3N0YXJ0X3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICpxLCB1bnNpZ25lZCBpbnQgY291bnQp
DQotew0KLQlzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHggPSB2YjJfZ2V0X2Rydl9wcml2KHEpOw0K
LQlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICp2YjsNCi0JaW50IHJldCA9IDA7DQotDQotCXJldCA9
IHBtX3J1bnRpbWVfZ2V0X3N5bmMoY3R4LT5qcGVnLT5kZXYpOw0KLQlpZiAocmV0IDwgMCkNCi0J
CWdvdG8gZXJyOw0KLQ0KLQlyZXR1cm4gMDsNCi1lcnI6DQotCXdoaWxlICgodmIgPSBtdGtfanBl
Z19idWZfcmVtb3ZlKGN0eCwgcS0+dHlwZSkpKQ0KLQkJdjRsMl9tMm1fYnVmX2RvbmUodmIsIFZC
Ml9CVUZfU1RBVEVfUVVFVUVEKTsNCi0JcmV0dXJuIHJldDsNCi19DQotDQogc3RhdGljIHZvaWQg
bXRrX2pwZWdfc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1ZSAqcSkNCiB7DQogCXN0cnVj
dCBtdGtfanBlZ19jdHggKmN0eCA9IHZiMl9nZXRfZHJ2X3ByaXYocSk7DQpAQCAtNzUxLDggKzcz
NCw2IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnX3N0b3Bfc3RyZWFtaW5nKHN0cnVjdCB2YjJfcXVl
dWUgKnEpDQogDQogCXdoaWxlICgodmIgPSBtdGtfanBlZ19idWZfcmVtb3ZlKGN0eCwgcS0+dHlw
ZSkpKQ0KIAkJdjRsMl9tMm1fYnVmX2RvbmUodmIsIFZCMl9CVUZfU1RBVEVfRVJST1IpOw0KLQ0K
LQlwbV9ydW50aW1lX3B1dF9zeW5jKGN0eC0+anBlZy0+ZGV2KTsNCiB9DQogDQogc3RhdGljIGNv
bnN0IHN0cnVjdCB2YjJfb3BzIG10a19qcGVnX3FvcHMgPSB7DQpAQCAtNzYxLDcgKzc0Miw2IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgdmIyX29wcyBtdGtfanBlZ19xb3BzID0gew0KIAkuYnVmX3F1
ZXVlICAgICAgICAgID0gbXRrX2pwZWdfYnVmX3F1ZXVlLA0KIAkud2FpdF9wcmVwYXJlICAgICAg
ID0gdmIyX29wc193YWl0X3ByZXBhcmUsDQogCS53YWl0X2ZpbmlzaCAgICAgICAgPSB2YjJfb3Bz
X3dhaXRfZmluaXNoLA0KLQkuc3RhcnRfc3RyZWFtaW5nICAgID0gbXRrX2pwZWdfc3RhcnRfc3Ry
ZWFtaW5nLA0KIAkuc3RvcF9zdHJlYW1pbmcgICAgID0gbXRrX2pwZWdfc3RvcF9zdHJlYW1pbmcs
DQogfTsNCiANCkBAIC04MTIsNyArNzkyLDcgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdfZGV2aWNl
X3J1bih2b2lkICpwcml2KQ0KIAlzdHJ1Y3QgbXRrX2pwZWdfc3JjX2J1ZiAqanBlZ19zcmNfYnVm
Ow0KIAlzdHJ1Y3QgbXRrX2pwZWdfYnMgYnM7DQogCXN0cnVjdCBtdGtfanBlZ19mYiBmYjsNCi0J
aW50IGk7DQorCWludCBpLCByZXQ7DQogDQogCXNyY19idWYgPSB2NGwyX20ybV9uZXh0X3NyY19i
dWYoY3R4LT5maC5tMm1fY3R4KTsNCiAJZHN0X2J1ZiA9IHY0bDJfbTJtX25leHRfZHN0X2J1Zihj
dHgtPmZoLm0ybV9jdHgpOw0KQEAgLTgzMiw2ICs4MTIsMTAgQEAgc3RhdGljIHZvaWQgbXRrX2pw
ZWdfZGV2aWNlX3J1bih2b2lkICpwcml2KQ0KIAkJcmV0dXJuOw0KIAl9DQogDQorCXJldCA9IHBt
X3J1bnRpbWVfZ2V0X3N5bmMoanBlZy0+ZGV2KTsNCisJaWYgKHJldCA8IDApDQorCQlnb3RvIGRl
Y19lbmQ7DQorDQogCW10a19qcGVnX3NldF9kZWNfc3JjKGN0eCwgJnNyY19idWYtPnZiMl9idWYs
ICZicyk7DQogCWlmIChtdGtfanBlZ19zZXRfZGVjX2RzdChjdHgsICZqcGVnX3NyY19idWYtPmRl
Y19wYXJhbSwgJmRzdF9idWYtPnZiMl9idWYsICZmYikpDQogCQlnb3RvIGRlY19lbmQ7DQpAQCAt
OTU3LDYgKzk0MSw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBtdGtfanBlZ19kZWNfaXJxKGludCBp
cnEsIHZvaWQgKnByaXYpDQogCXY0bDJfbTJtX2J1Zl9kb25lKHNyY19idWYsIGJ1Zl9zdGF0ZSk7
DQogCXY0bDJfbTJtX2J1Zl9kb25lKGRzdF9idWYsIGJ1Zl9zdGF0ZSk7DQogCXY0bDJfbTJtX2pv
Yl9maW5pc2goanBlZy0+bTJtX2RldiwgY3R4LT5maC5tMm1fY3R4KTsNCisJcG1fcnVudGltZV9w
dXQoY3R4LT5qcGVnLT5kZXYpOw0KIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQogfQ0KIA0KLS0gDQoy
LjE4LjANCg==

