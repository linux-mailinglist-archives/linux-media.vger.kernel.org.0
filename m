Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF9823B3A1
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 05:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729678AbgHDDlu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 23:41:50 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:57883 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728516AbgHDDlt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 23:41:49 -0400
X-UUID: 836d74b0833441c3b6b38086999e5454-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HSVXRY4N8XTU9rw7IxKDpLdXyRgi/jTHzR2IxwV5AdU=;
        b=ehQysKGTndnisSI3ZulIg8WAdl00eSkHx6nuPgmBSDRGm76xT7WUh/yaB8tpaCZf7lZATFp6mcDVnw7/Icd+19wJYukO06YRu24AlcwuvygGZ5JuOtoKlRBOOfG2NZ9i8rmecUrPs9xnAnfadbDTdMQlAqKjFzL6GB0h874Msr0=;
X-UUID: 836d74b0833441c3b6b38086999e5454-20200804
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 477469917; Tue, 04 Aug 2020 11:41:45 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:41:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:41:43 +0800
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
Subject: [PATCH v11 02/28] media: platform: Improve queue set up flow for bug fixing
Date:   Tue, 4 Aug 2020 11:40:36 +0800
Message-ID: <20200804034102.22983-3-xia.jiang@mediatek.com>
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

QWRkIGNoZWNraW5nIGNyZWF0ZWQgYnVmZmVyIHNpemUgZm9sbG93IGluIG10a19qcGVnX3F1ZXVl
X3NldHVwKCkuDQoNClJldmlld2VkLWJ5OiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3Jn
Pg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5nIDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0t
DQp2MTE6IG5vIGNoYW5nZXMNCi0tLQ0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcv
bXRrX2pwZWdfY29yZS5jIHwgNyArKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtf
anBlZ19jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2Nv
cmUuYw0KaW5kZXggNGFkNGE0YjMwYTBlLi42N2EwMjJkMDRkZjcgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KKysrIGIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCkBAIC01NzEsNiArNTcx
LDEzIEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfcXVldWVfc2V0dXAoc3RydWN0IHZiMl9xdWV1ZSAq
cSwNCiAJaWYgKCFxX2RhdGEpDQogCQlyZXR1cm4gLUVJTlZBTDsNCiANCisJaWYgKCpudW1fcGxh
bmVzKSB7DQorCQlmb3IgKGkgPSAwOyBpIDwgKm51bV9wbGFuZXM7IGkrKykNCisJCQlpZiAoc2l6
ZXNbaV0gPCBxX2RhdGEtPnNpemVpbWFnZVtpXSkNCisJCQkJcmV0dXJuIC1FSU5WQUw7DQorCQly
ZXR1cm4gMDsNCisJfQ0KKw0KIAkqbnVtX3BsYW5lcyA9IHFfZGF0YS0+Zm10LT5jb2xwbGFuZXM7
DQogCWZvciAoaSA9IDA7IGkgPCBxX2RhdGEtPmZtdC0+Y29scGxhbmVzOyBpKyspIHsNCiAJCXNp
emVzW2ldID0gcV9kYXRhLT5zaXplaW1hZ2VbaV07DQotLSANCjIuMTguMA0K

