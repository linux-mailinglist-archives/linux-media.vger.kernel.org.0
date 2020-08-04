Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED1D23B3A4
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 05:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730680AbgHDDnl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 23:43:41 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:18139 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729692AbgHDDlw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 23:41:52 -0400
X-UUID: fa35aa4fda4a4c40b4e20cc6e5696f48-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Byjc1wLNOmGkyBgzjd7FLE4kpmwc/rwCBdEF2Y14IX0=;
        b=XetZ/VNryT0wdh36mSk9jIpp/IuFFkjLANPz92m2PZGxc7MCr+ICBOk+KFkK4V9nVUWO6hpztAmrVkkf0THOB1z++UpxdKHvdsl00Wt0GlV8nVF276QAYJ1nuU7hnsqR9xlbx323u1Q0wTxf4R66eJU3kms+6+8wBbFHpWjuYpc=;
X-UUID: fa35aa4fda4a4c40b4e20cc6e5696f48-20200804
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1724872765; Tue, 04 Aug 2020 11:41:50 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:41:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:41:48 +0800
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
Subject: [PATCH v11 06/28] media: platform: Delete the resetting hardware flow in the system PM ops
Date:   Tue, 4 Aug 2020 11:40:40 +0800
Message-ID: <20200804034102.22983-7-xia.jiang@mediatek.com>
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

RGVsZXRlIHRoZSByZXNldHRpbmcgaGFyZHdhcmUgZmxvdyBpbiBzdXNwZW5kIGFuZCByZXN1bWUg
ZnVuY3Rpb24NCmJlY2F1c2UgdGhhdCByZXNldHRpbmcgb3BlcmF0aW9uIHdpbGwgYmUgZG9uZSBp
biBkZXZpY2VfcnVuKCkuDQoNClJldmlld2VkLWJ5OiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21p
dW0ub3JnPg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5nIDx4aWEuamlhbmdAbWVkaWF0ZWsuY29t
Pg0KLS0tDQp2MTE6IG5vIGNoYW5nZXMNCi0tLQ0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LWpwZWcvbXRrX2pwZWdfY29yZS5jIHwgMiAtLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtf
anBlZ19jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2Nv
cmUuYw0KaW5kZXggZmI2MjQzODU5NjllLi43Zjc0NTk3MjYyZmMgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KKysrIGIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCkBAIC0xMTkxLDcgKzEx
OTEsNiBAQCBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IG10a19qcGVnX3BtX3N1c3BlbmQoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KIHsNCiAJc3RydWN0IG10a19qcGVnX2RldiAqanBlZyA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOw0KIA0KLQltdGtfanBlZ19kZWNfcmVzZXQoanBlZy0+ZGVjX3JlZ19i
YXNlKTsNCiAJbXRrX2pwZWdfY2xrX29mZihqcGVnKTsNCiANCiAJcmV0dXJuIDA7DQpAQCAtMTIw
Miw3ICsxMjAxLDYgQEAgc3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBtdGtfanBlZ19wbV9yZXN1
bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KIAlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVnID0gZGV2
X2dldF9kcnZkYXRhKGRldik7DQogDQogCW10a19qcGVnX2Nsa19vbihqcGVnKTsNCi0JbXRrX2pw
ZWdfZGVjX3Jlc2V0KGpwZWctPmRlY19yZWdfYmFzZSk7DQogDQogCXJldHVybiAwOw0KIH0NCi0t
IA0KMi4xOC4wDQo=

