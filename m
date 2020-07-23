Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 979D722A581
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387576AbgGWDGM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:06:12 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:30338 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387439AbgGWDGK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:10 -0400
X-UUID: 235fd4f218f64446972cc7e7b75956ef-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UPn0irM2Y3NL1Pv4s2r49CBIR7T/bOvEXtRqzkuIHuA=;
        b=PvBmpkSfnUhZTqzUf7NvepKBxGW2c3FOltvagzcdrcr3OMxRomefmjzWlabdwzF+FaRb/2ksD8WOSID4KB47mcv7t7iMbLysVFVGQxGlhcHXrHGd3hXV4dolWFBhGxlNrGoLIMVP29HU1gF0r1pIgsu9Rl/FaSpJ3WQk9kGdwWE=;
X-UUID: 235fd4f218f64446972cc7e7b75956ef-20200723
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1673864514; Thu, 23 Jul 2020 11:06:06 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:04 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:00 +0800
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
Subject: [PATCH v10 02/28] media: platform: Improve queue set up flow for bug fixing
Date:   Thu, 23 Jul 2020 11:04:25 +0800
Message-ID: <20200723030451.5616-3-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
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
DQp2MTA6IG5vIGNoYW5nZXMNCi0tLQ0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcv
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

