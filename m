Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E902445A6
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgHNHNS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:13:18 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:8537 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726688AbgHNHNR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:13:17 -0400
X-UUID: 81485fdb3dfe4795973dc49d713a8d3f-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RWe0Ff77FvM6nCgnp8TrIQ2+6TXTbgL+dXGr6O+hJsw=;
        b=Lwu6r2lN3GHFSETiadxuO+pLkmcvB7RPKF9ypxUM133vav89NzK8iQWuoZsujZk84cGyhtxlA6gpiAusZUrU00wmQxBy0IBczSZRRaDagRtWyzUUfpVhPUfeFZn/K1PzYVzu5EAPoxpAV2pOuzuaYeqBoaC/iFkPmfW6OFrOqbY=;
X-UUID: 81485fdb3dfe4795973dc49d713a8d3f-20200814
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1377380110; Fri, 14 Aug 2020 15:13:14 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:11 +0800
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
Subject: [PATCH v12 08/29] media: platform: Improve the implementation of the system PM ops
Date:   Fri, 14 Aug 2020 15:11:41 +0800
Message-ID: <20200814071202.25067-10-xia.jiang@mediatek.com>
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

QWRkIHY0bDJfbTJtX3N1c3BlbmQoKSBmdW5jdGlvbiBjYWxsIGluIG10a19qcGVnX3N1c3BlbmQo
KSB0byBtYWtlIHN1cmUNCnRoYXQgdGhlIGN1cnJlbnQgZnJhbWUgaXMgcHJvY2Vzc2VkIGNvbXBs
ZXRlbHkgYmVmb3JlIHN1c3BlbmQuDQpBZGQgdjRsMl9tMm1fcmVzdW1lKCkgZnVuY3Rpb24gY2Fs
bCBpbiBtdGtfanBlZ19yZXN1bWUoKSB0byB1bmJsb2NrIHRoZQ0KZHJpdmVyIGZyb20gc2NoZWR1
bGluZyBuZXh0IGZyYW1lLg0KDQpSZXZpZXdlZC1ieTogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9t
aXVtLm9yZz4NClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNv
bT4NCi0tLQ0KdjEyOiBubyBjaGFuZ2VzDQotLS0NCiAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLWpw
ZWcvbXRrX2pwZWdfY29yZS5jICAgIHwgMTggKysrKysrKystLS0tLS0tLS0tDQogMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQppbmRleCA3Zjc0NTk3MjYy
ZmMuLmVlNGFhZjYxODU1MSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LWpwZWcvbXRrX2pwZWdfY29yZS5jDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1q
cGVnL210a19qcGVnX2NvcmUuYw0KQEAgLTEyMDcsMjQgKzEyMDcsMjIgQEAgc3RhdGljIF9fbWF5
YmVfdW51c2VkIGludCBtdGtfanBlZ19wbV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KIA0K
IHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgbXRrX2pwZWdfc3VzcGVuZChzdHJ1Y3QgZGV2aWNl
ICpkZXYpDQogew0KLQlpbnQgcmV0Ow0KLQ0KLQlpZiAocG1fcnVudGltZV9zdXNwZW5kZWQoZGV2
KSkNCi0JCXJldHVybiAwOw0KKwlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVnID0gZGV2X2dldF9k
cnZkYXRhKGRldik7DQogDQotCXJldCA9IG10a19qcGVnX3BtX3N1c3BlbmQoZGV2KTsNCi0JcmV0
dXJuIHJldDsNCisJdjRsMl9tMm1fc3VzcGVuZChqcGVnLT5tMm1fZGV2KTsNCisJcmV0dXJuIHBt
X3J1bnRpbWVfZm9yY2Vfc3VzcGVuZChkZXYpOw0KIH0NCiANCiBzdGF0aWMgX19tYXliZV91bnVz
ZWQgaW50IG10a19qcGVnX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogew0KKwlzdHJ1Y3Qg
bXRrX2pwZWdfZGV2ICpqcGVnID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQogCWludCByZXQ7DQog
DQotCWlmIChwbV9ydW50aW1lX3N1c3BlbmRlZChkZXYpKQ0KLQkJcmV0dXJuIDA7DQotDQotCXJl
dCA9IG10a19qcGVnX3BtX3Jlc3VtZShkZXYpOw0KKwlyZXQgPSBwbV9ydW50aW1lX2ZvcmNlX3Jl
c3VtZShkZXYpOw0KKwlpZiAocmV0IDwgMCkNCisJCXJldHVybiByZXQ7DQogDQorCXY0bDJfbTJt
X3Jlc3VtZShqcGVnLT5tMm1fZGV2KTsNCiAJcmV0dXJuIHJldDsNCiB9DQogDQotLSANCjIuMTgu
MA0K

