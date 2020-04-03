Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF70919D421
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 11:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390694AbgDCJlp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 05:41:45 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:9336 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727792AbgDCJkp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 05:40:45 -0400
X-UUID: bc295ed7dbf64c989aed5ac3bb866d23-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7LIi7H/1aKJu6aJs2kP5tkzvs49e5IwR0+jnoVPzHLw=;
        b=CtX2lzOgOcTBrH2shlONAH/Zl4Bhe+WFCJa3Iv6TXk1mIMZVUH1ZgMaGByosA/a74ahf/a5o0yD75Od2Tgb5yDcgFjbljmIdmyPg6/ykCTa1AfiOtiX6oegvToIn+JPwoeHUz/Vqqxm+ZDx+LpGKd/zJ96MrJTzpP10SMs0lqAQ=;
X-UUID: bc295ed7dbf64c989aed5ac3bb866d23-20200403
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 79399704; Fri, 03 Apr 2020 17:40:41 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Apr 2020 17:40:33 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Apr 2020 17:40:33 +0800
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
Subject: [PATCH v8 02/14] media: platform: Improve queue set up flow for bug fixing
Date:   Fri, 3 Apr 2020 17:40:21 +0800
Message-ID: <20200403094033.8288-3-xia.jiang@mediatek.com>
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

QWRkIGNoZWNraW5nIGNyZWF0ZWQgYnVmZmVyIHNpemUgZm9sbG93IGluIG10a19qcGVnX3F1ZXVl
X3NldHVwKCkuDQoNClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVr
LmNvbT4NCi0tLQ0Kdjg6IG5vIGNoYW5nZXMNCi0tLQ0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jIHwgNyArKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGst
anBlZy9tdGtfanBlZ19jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210
a19qcGVnX2NvcmUuYw0KaW5kZXggY2RlNTkyNzVkNDljLi5kYTBkYWU0YjBmYzkgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KKysr
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCkBAIC01
NzEsNiArNTcxLDEzIEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfcXVldWVfc2V0dXAoc3RydWN0IHZi
Ml9xdWV1ZSAqcSwNCiAJaWYgKCFxX2RhdGEpDQogCQlyZXR1cm4gLUVJTlZBTDsNCiANCisJaWYg
KCpudW1fcGxhbmVzKSB7DQorCQlmb3IgKGkgPSAwOyBpIDwgKm51bV9wbGFuZXM7IGkrKykNCisJ
CQlpZiAoc2l6ZXNbaV0gPCBxX2RhdGEtPnNpemVpbWFnZVtpXSkNCisJCQkJcmV0dXJuIC1FSU5W
QUw7DQorCQlyZXR1cm4gMDsNCisJfQ0KKw0KIAkqbnVtX3BsYW5lcyA9IHFfZGF0YS0+Zm10LT5j
b2xwbGFuZXM7DQogCWZvciAoaSA9IDA7IGkgPCBxX2RhdGEtPmZtdC0+Y29scGxhbmVzOyBpKysp
IHsNCiAJCXNpemVzW2ldID0gcV9kYXRhLT5zaXplaW1hZ2VbaV07DQotLSANCjIuMTguMA0K

