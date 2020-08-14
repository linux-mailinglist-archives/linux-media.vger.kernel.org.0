Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B373E24459B
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgHNHNK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:13:10 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:43863 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726124AbgHNHNJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:13:09 -0400
X-UUID: c4d7adcfebc44bdabbd7c79337dff38c-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jjQ3/ypIM7Mh9GdtoVOvGRTZnbomWvhxJcEQ3E4l6ZA=;
        b=J2ZEwSbN2/HqLmXBDehrd2UVv2TnZtU3N8Tc+FQhMMSEjOOG/TH8l5siBsO9JfyeUHwokWwQYUOAG5OZm/fVXGUyHM8JG88kWLAFlWqUUkmCaOWLgnEYqoJU55FUHiMZM1pFWSq5ttVpuQ3k2a4B1HlDWPoWX/u7J8lGsxlK974=;
X-UUID: c4d7adcfebc44bdabbd7c79337dff38c-20200814
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 883879637; Fri, 14 Aug 2020 15:13:07 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:03 +0800
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
Subject: [PATCH v12 02/29] media: platform: Improve queue set up flow for bug fixing
Date:   Fri, 14 Aug 2020 15:11:35 +0800
Message-ID: <20200814071202.25067-4-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200814071202.25067-1-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
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
DQp2MTI6IG5vIGNoYW5nZXMNCi0tLQ0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcv
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

