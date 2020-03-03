Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24ACF177608
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 13:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729340AbgCCMfI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 07:35:08 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:20202 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728468AbgCCMfI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 07:35:08 -0500
X-UUID: 2026562028d3456daee84eba16f2b567-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/8999aCb+RKIpV1G0FjTHSIgyuMbUnkxh715LDiAQiQ=;
        b=cNXkOeYb/gHjS7qxvtr/ta8RTBnfhKEZwGqGJrhEfHOvbZBpoanvGgSUFku3d5/x2oLef8qNyaWCNC/zFRa/0hXx36/FQeQ+BzSu4g/83N7GC135umuCNUBv8VxPKEsIq2b/QM+6QcR6Gsev9YX6GP86y1pC8ai0K+LErZxGVkw=;
X-UUID: 2026562028d3456daee84eba16f2b567-20200303
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 292873796; Tue, 03 Mar 2020 20:34:59 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 20:34:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Mar 2020 20:35:38 +0800
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
        <srv_heupstream@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v7 02/11] media: platform: Improve queue set up flow for bug fixing
Date:   Tue, 3 Mar 2020 20:34:37 +0800
Message-ID: <20200303123446.20095-3-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200303123446.20095-1-xia.jiang@mediatek.com>
References: <20200303123446.20095-1-xia.jiang@mediatek.com>
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
LmNvbT4NCi0tLQ0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29y
ZS5jIHwgNyArKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KaW5kZXgg
Y2RlNTkyNzVkNDljLi5kYTBkYWU0YjBmYzkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCkBAIC01NzEsNiArNTcxLDEzIEBAIHN0YXRp
YyBpbnQgbXRrX2pwZWdfcXVldWVfc2V0dXAoc3RydWN0IHZiMl9xdWV1ZSAqcSwNCiAJaWYgKCFx
X2RhdGEpDQogCQlyZXR1cm4gLUVJTlZBTDsNCiANCisJaWYgKCpudW1fcGxhbmVzKSB7DQorCQlm
b3IgKGkgPSAwOyBpIDwgKm51bV9wbGFuZXM7IGkrKykNCisJCQlpZiAoc2l6ZXNbaV0gPCBxX2Rh
dGEtPnNpemVpbWFnZVtpXSkNCisJCQkJcmV0dXJuIC1FSU5WQUw7DQorCQlyZXR1cm4gMDsNCisJ
fQ0KKw0KIAkqbnVtX3BsYW5lcyA9IHFfZGF0YS0+Zm10LT5jb2xwbGFuZXM7DQogCWZvciAoaSA9
IDA7IGkgPCBxX2RhdGEtPmZtdC0+Y29scGxhbmVzOyBpKyspIHsNCiAJCXNpemVzW2ldID0gcV9k
YXRhLT5zaXplaW1hZ2VbaV07DQotLSANCjIuMTguMA0K

