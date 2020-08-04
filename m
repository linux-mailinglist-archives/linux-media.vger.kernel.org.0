Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85DEA23B354
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 05:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbgHDDlv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 23:41:51 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:19944 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729673AbgHDDlu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 23:41:50 -0400
X-UUID: 2ae9f27344b24260a2799671184f3926-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=H3sLdFQdZ+y1gcWlTJAmGlvvVuotRjpV6X/+JwP4WLY=;
        b=dK4MxSJQjkzgGqyHgifyuF6G82XRmXrNT3uOxxpopWGnQ4BVVcon//un+n441GjPu4xFJED8JSCw0q6sZcL3+V/NNUlgm23kMnSTFZkKcj1cIVPNmKsR8I/yy/gyqiqpMQ5CB/BBWZkz29k6mc/8bGA6FEWXp75X6Dpunfwo6wM=;
X-UUID: 2ae9f27344b24260a2799671184f3926-20200804
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1264155820; Tue, 04 Aug 2020 11:41:46 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:41:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:41:44 +0800
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
Subject: [PATCH v11 03/28] media: platform: Improve getting and requesting irq flow for bug fixing
Date:   Tue, 4 Aug 2020 11:40:37 +0800
Message-ID: <20200804034102.22983-4-xia.jiang@mediatek.com>
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

RGVsZXRlIHBsYXRmb3JtX2dldF9yZXNvdXJjZSBvcGVyYXRpb24gZm9yIGlycS4NClJldHVybiBh
Y3R1YWwgdmFsdWUgcmF0aGVyIHRoYW4gRUlOVkFMIHdoZW4gZmFpbCB0byBnZXQgYW5kIHJlcXVl
c3QNCmlycS4NCg0KUmV2aWV3ZWQtYnk6IFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+
DQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0N
CnYxMTogbm8gY2hhbmdlcw0KLS0tDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9t
dGtfanBlZ19jb3JlLmMgfCA3ICsrLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1q
cGVnL210a19qcGVnX2NvcmUuYw0KaW5kZXggNjdhMDIyZDA0ZGY3Li4yNjc3NTgwOTQxYjAgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUu
Yw0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMN
CkBAIC0xMTAzLDEyICsxMTAzLDEwIEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJCXJldHVybiByZXQ7DQogCX0NCiANCi0JcmVzID0g
cGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfSVJRLCAwKTsNCiAJZGVjX2ly
cSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7DQotCWlmICghcmVzIHx8IGRlY19pcnEgPCAw
KSB7DQorCWlmIChkZWNfaXJxIDwgMCkgew0KIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVk
IHRvIGdldCBkZWNfaXJxICVkLlxuIiwgZGVjX2lycSk7DQotCQlyZXQgPSAtRUlOVkFMOw0KLQkJ
cmV0dXJuIHJldDsNCisJCXJldHVybiBkZWNfaXJxOw0KIAl9DQogDQogCXJldCA9IGRldm1fcmVx
dWVzdF9pcnEoJnBkZXYtPmRldiwgZGVjX2lycSwgbXRrX2pwZWdfZGVjX2lycSwgMCwNCkBAIC0x
MTE2LDcgKzExMTQsNiBAQCBzdGF0aWMgaW50IG10a19qcGVnX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQogCWlmIChyZXQpIHsNCiAJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZh
aWxlZCB0byByZXF1ZXN0IGRlY19pcnEgJWQgKCVkKVxuIiwNCiAJCQlkZWNfaXJxLCByZXQpOw0K
LQkJcmV0ID0gLUVJTlZBTDsNCiAJCWdvdG8gZXJyX3JlcV9pcnE7DQogCX0NCiANCi0tIA0KMi4x
OC4wDQo=

