Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4A01EDE5D
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 09:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgFDHbP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 03:31:15 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:36044 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727768AbgFDH3X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 03:29:23 -0400
X-UUID: 113561acb4354d378f5f95fac83ddf6d-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Gfwa+HEA1Fp8IFUeQUFuA37/N+o4Grdg0TxloGU3uxw=;
        b=PhZG2KRuoIqangRBxEDXB9lubZQEx9oWCB88yMzlpQYUffatlijEClT79/1ditbGF2lJEOanmv3jZwWHvvDs85bq92QOQCUyQGP41N30KxnroC7n5FiVp0Vr0a0s0JKcKoZVRQMHT8f1DmjIvL3Rt3gpdvTSexzZoeeFfPxhLyI=;
X-UUID: 113561acb4354d378f5f95fac83ddf6d-20200604
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 211813436; Thu, 04 Jun 2020 15:29:18 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 15:29:15 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 15:29:13 +0800
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
Subject: [PATCH v9 02/18] media: platform: Improve queue set up flow for bug fixing
Date:   Thu, 4 Jun 2020 15:26:52 +0800
Message-ID: <20200604072708.9468-3-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200604072708.9468-1-xia.jiang@mediatek.com>
References: <20200604072708.9468-1-xia.jiang@mediatek.com>
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
DQp2OTogbm8gY2hhbmdlcw0KLS0tDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9t
dGtfanBlZ19jb3JlLmMgfCA3ICsrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19q
cGVnX2NvcmUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29y
ZS5jDQppbmRleCA0YWQ0YTRiMzBhMGUuLjY3YTAyMmQwNGRmNyAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQorKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KQEAgLTU3MSw2ICs1NzEs
MTMgQEAgc3RhdGljIGludCBtdGtfanBlZ19xdWV1ZV9zZXR1cChzdHJ1Y3QgdmIyX3F1ZXVlICpx
LA0KIAlpZiAoIXFfZGF0YSkNCiAJCXJldHVybiAtRUlOVkFMOw0KIA0KKwlpZiAoKm51bV9wbGFu
ZXMpIHsNCisJCWZvciAoaSA9IDA7IGkgPCAqbnVtX3BsYW5lczsgaSsrKQ0KKwkJCWlmIChzaXpl
c1tpXSA8IHFfZGF0YS0+c2l6ZWltYWdlW2ldKQ0KKwkJCQlyZXR1cm4gLUVJTlZBTDsNCisJCXJl
dHVybiAwOw0KKwl9DQorDQogCSpudW1fcGxhbmVzID0gcV9kYXRhLT5mbXQtPmNvbHBsYW5lczsN
CiAJZm9yIChpID0gMDsgaSA8IHFfZGF0YS0+Zm10LT5jb2xwbGFuZXM7IGkrKykgew0KIAkJc2l6
ZXNbaV0gPSBxX2RhdGEtPnNpemVpbWFnZVtpXTsNCi0tIA0KMi4xOC4wDQo=

