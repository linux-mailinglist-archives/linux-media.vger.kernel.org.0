Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA3FC19D41F
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 11:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390707AbgDCJko (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 05:40:44 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:18079 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2390641AbgDCJkn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 05:40:43 -0400
X-UUID: 7dc599fef787492bad3d551648e1860a-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1NzC3/r7pfZorLeb22GFj0dVTvtgWY91KdwBPoSAgm4=;
        b=nfjjgPbwV5iX2oVyvnUBHwfPiH55vfhaFgk4QsDY4ut0TO9k0FOw4Kc+glreFewRWw3N1RQYlxxR5unRfGX8MjTw0L5u28Mr9O2DTkBj7e1CXCsrYiHTZ/PS+UliAiBspKNiMVp9cNhe6WBKNrmW5WyO2HHNDGaD94I4HLYPw8g=;
X-UUID: 7dc599fef787492bad3d551648e1860a-20200403
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 667469995; Fri, 03 Apr 2020 17:40:39 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Apr 2020 17:40:35 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Apr 2020 17:40:34 +0800
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
Subject: [PATCH v8 03/14] media: platform: Improve getting and requesting irq flow for bug fixing
Date:   Fri, 3 Apr 2020 17:40:22 +0800
Message-ID: <20200403094033.8288-4-xia.jiang@mediatek.com>
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

RGVsZXRlIHBsYXRmb3JtX2dldF9yZXNvdXJjZSBvcGVyYXRpb24gZm9yIGlycS4NClJldHVybiBh
Y3R1YWwgdmFsdWUgcmF0aGVyIHRoYW4gRUlOVkFMIHdoZW4gZmFpbCB0byBnZXQgYW5kIHJlcXVl
c3QNCmlycS4NCg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5nIDx4aWEuamlhbmdAbWVkaWF0ZWsu
Y29tPg0KLS0tDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3Jl
LmMgfCA3ICsrLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9t
dGtfanBlZ19jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVn
X2NvcmUuYw0KaW5kZXggZGEwZGFlNGIwZmM5Li5lMmExZDg1MDgxM2IgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KKysrIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCkBAIC0xMTAzLDEy
ICsxMTAzLDEwIEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCiAJCXJldHVybiByZXQ7DQogCX0NCiANCi0JcmVzID0gcGxhdGZvcm1fZ2V0
X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfSVJRLCAwKTsNCiAJZGVjX2lycSA9IHBsYXRmb3Jt
X2dldF9pcnEocGRldiwgMCk7DQotCWlmICghcmVzIHx8IGRlY19pcnEgPCAwKSB7DQorCWlmIChk
ZWNfaXJxIDwgMCkgew0KIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIGdldCBkZWNf
aXJxICVkLlxuIiwgZGVjX2lycSk7DQotCQlyZXQgPSAtRUlOVkFMOw0KLQkJcmV0dXJuIHJldDsN
CisJCXJldHVybiBkZWNfaXJxOw0KIAl9DQogDQogCXJldCA9IGRldm1fcmVxdWVzdF9pcnEoJnBk
ZXYtPmRldiwgZGVjX2lycSwgbXRrX2pwZWdfZGVjX2lycSwgMCwNCkBAIC0xMTE2LDcgKzExMTQs
NiBAQCBzdGF0aWMgaW50IG10a19qcGVnX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQogCWlmIChyZXQpIHsNCiAJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byByZXF1
ZXN0IGRlY19pcnEgJWQgKCVkKVxuIiwNCiAJCQlkZWNfaXJxLCByZXQpOw0KLQkJcmV0ID0gLUVJ
TlZBTDsNCiAJCWdvdG8gZXJyX3JlcV9pcnE7DQogCX0NCiANCi0tIA0KMi4xOC4wDQo=

