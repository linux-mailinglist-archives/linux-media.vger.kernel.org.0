Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDFC923B384
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 05:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730598AbgHDDnA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 23:43:00 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:46105 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730424AbgHDDmK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 23:42:10 -0400
X-UUID: acf6a34cb4ec4a358994cbf651f1874f-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6E8DiyzZA11dvXTPp0lczGdv2dbKntgs7vbRnr2/Bzs=;
        b=TMnL9TfPF3MM2Ew2sJmrQko8ohGTiUr3cV/JQUhRxBROVyB889CcgWP7Bq8MFmlACWiYa8EJVZK8Bz7exUEz+P+I1JLk2Mp+taJQpbmIFBnfd4GMpJJdXehmEylR2xt6c9vMcO3TOtJY0xEFJhG7+DL5RvgiYfntZVUz9etubbs=;
X-UUID: acf6a34cb4ec4a358994cbf651f1874f-20200804
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1409302344; Tue, 04 Aug 2020 11:42:08 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:42:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:42:05 +0800
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
Subject: [PATCH v11 21/28] media: platform: Refactor mtk_jpeg_set_default_params()
Date:   Tue, 4 Aug 2020 11:40:55 +0800
Message-ID: <20200804034102.22983-22-xia.jiang@mediatek.com>
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

Q2FsbCBtdGtfanBlZ190cnlfZm10X21wbGFuZSgpIHRvIHJlcGxhY2UgdGhlIG9yaWdpbmFsIGNv
bXB1dGF0aW9uIG9mDQpzaXplaW1hZ2UgYW5kIGJ5dGVzcGVybGluZSwgYmVjYXVzZSB0aGF0IG10
a19qcGVnX3RyeV9mbXRfbXBsYW5lKCkNCmFscmVhZHkgZGlkIGl0Lg0KDQpSZXZpZXdlZC1ieTog
VG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4NClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFu
ZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjExOiBubyBjaGFuZ2VzDQotLS0NCiBk
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyB8IDEyICsrLS0t
LS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBl
Z19jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUu
Yw0KaW5kZXggMDM3NmJkM2JkYmJiLi43ODgxZTljOTNkZjcgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCkBAIC04NDQsNyArODQ0LDYg
QEAgc3RhdGljIGlycXJldHVybl90IG10a19qcGVnX2RlY19pcnEoaW50IGlycSwgdm9pZCAqcHJp
dikNCiBzdGF0aWMgdm9pZCBtdGtfanBlZ19zZXRfZGVmYXVsdF9wYXJhbXMoc3RydWN0IG10a19q
cGVnX2N0eCAqY3R4KQ0KIHsNCiAJc3RydWN0IG10a19qcGVnX3FfZGF0YSAqcSA9ICZjdHgtPm91
dF9xOw0KLQlpbnQgaTsNCiANCiAJcS0+cGl4X21wLmNvbG9yc3BhY2UgPSBWNEwyX0NPTE9SU1BB
Q0VfU1JHQjsNCiAJcS0+cGl4X21wLnljYmNyX2VuYyA9IFY0TDJfWUNCQ1JfRU5DXzYwMTsNCkBA
IC04NTYsOCArODU1LDcgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdfc2V0X2RlZmF1bHRfcGFyYW1z
KHN0cnVjdCBtdGtfanBlZ19jdHggKmN0eCkNCiAJCQkJICAgICAgTVRLX0pQRUdfRk1UX0ZMQUdf
REVDX09VVFBVVCk7DQogCXEtPnBpeF9tcC53aWR0aCA9IE1US19KUEVHX01JTl9XSURUSDsNCiAJ
cS0+cGl4X21wLmhlaWdodCA9IE1US19KUEVHX01JTl9IRUlHSFQ7DQotCXEtPnBpeF9tcC5wbGFu
ZV9mbXRbMF0uYnl0ZXNwZXJsaW5lID0gMDsNCi0JcS0+cGl4X21wLnBsYW5lX2ZtdFswXS5zaXpl
aW1hZ2UgPSBNVEtfSlBFR19ERUZBVUxUX1NJWkVJTUFHRTsNCisJbXRrX2pwZWdfdHJ5X2ZtdF9t
cGxhbmUoJnEtPnBpeF9tcCwgcS0+Zm10KTsNCiANCiAJcSA9ICZjdHgtPmNhcF9xOw0KIAlxLT5m
bXQgPSBtdGtfanBlZ19maW5kX2Zvcm1hdChtdGtfanBlZ19mb3JtYXRzLCBNVEtfSlBFR19OVU1f
Rk9STUFUUywNCkBAIC04NzAsMTMgKzg2OCw3IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnX3NldF9k
ZWZhdWx0X3BhcmFtcyhzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHgpDQogCXEtPnBpeF9tcC53aWR0
aCA9IE1US19KUEVHX01JTl9XSURUSDsNCiAJcS0+cGl4X21wLmhlaWdodCA9IE1US19KUEVHX01J
Tl9IRUlHSFQ7DQogDQotCWZvciAoaSA9IDA7IGkgPCBxLT5mbXQtPmNvbHBsYW5lczsgaSsrKSB7
DQotCQl1MzIgc3RyaWRlID0gcS0+cGl4X21wLndpZHRoICogcS0+Zm10LT5oX3NhbXBsZVtpXSAv
IDQ7DQotCQl1MzIgaCA9IHEtPnBpeF9tcC5oZWlnaHQgKiBxLT5mbXQtPnZfc2FtcGxlW2ldIC8g
NDsNCi0NCi0JCXEtPnBpeF9tcC5wbGFuZV9mbXRbaV0uYnl0ZXNwZXJsaW5lID0gc3RyaWRlOw0K
LQkJcS0+cGl4X21wLnBsYW5lX2ZtdFtpXS5zaXplaW1hZ2UgPSBzdHJpZGUgKiBoOw0KLQl9DQor
CW10a19qcGVnX3RyeV9mbXRfbXBsYW5lKCZxLT5waXhfbXAsIHEtPmZtdCk7DQogfQ0KIA0KIHN0
YXRpYyBpbnQgbXRrX2pwZWdfb3BlbihzdHJ1Y3QgZmlsZSAqZmlsZSkNCi0tIA0KMi4xOC4wDQo=

