Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46E122A586
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387688AbgGWDGS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:06:18 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:23327 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387668AbgGWDGR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:17 -0400
X-UUID: 4b0365745c2f4e9fa2c8b0fb7c80db01-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2HC8KSULeKnTQu8TU3nMZXcQFZT55+m/f0oQcHcZGA8=;
        b=aICd1JweCjIyccElcOuJCvGvy3dwEf0j08m43SWbb2NG3+JqAI5FGCqJTlxFplsHH3lLMpBmZ3+/iSr3RYwdDfsKVv9TmiZXlV/seWsGyFzh1RP99FWe1e85js7ZZ6+2C1MufUZwAqDqeH7u9IV2YD+ypIqm406sGK6PIEjHfKE=;
X-UUID: 4b0365745c2f4e9fa2c8b0fb7c80db01-20200723
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1216919613; Thu, 23 Jul 2020 11:06:12 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:10 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:07 +0800
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
Subject: [PATCH v10 07/28] media: platform: Improve the implementation of the system PM ops
Date:   Thu, 23 Jul 2020 11:04:30 +0800
Message-ID: <20200723030451.5616-8-xia.jiang@mediatek.com>
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

QWRkIHY0bDJfbTJtX3N1c3BlbmQoKSBmdW5jdGlvbiBjYWxsIGluIG10a19qcGVnX3N1c3BlbmQo
KSB0byBtYWtlIHN1cmUNCnRoYXQgdGhlIGN1cnJlbnQgZnJhbWUgaXMgcHJvY2Vzc2VkIGNvbXBs
ZXRlbHkgYmVmb3JlIHN1c3BlbmQuDQpBZGQgdjRsMl9tMm1fcmVzdW1lKCkgZnVuY3Rpb24gY2Fs
bCBpbiBtdGtfanBlZ19yZXN1bWUoKSB0byB1bmJsb2NrIHRoZQ0KZHJpdmVyIGZyb20gc2NoZWR1
bGluZyBuZXh0IGZyYW1lLg0KDQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0Bt
ZWRpYXRlay5jb20+DQotLS0NCnYxMDogdXNlIHBtX3J1bnRpbWVfZm9yY2VfKiBoZWxwZXJzDQot
LS0NCiAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jICAgIHwgMTgg
KysrKysrKystLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1q
cGVnL210a19qcGVnX2NvcmUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRr
X2pwZWdfY29yZS5jDQppbmRleCA3Zjc0NTk3MjYyZmMuLmVlNGFhZjYxODU1MSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQorKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KQEAgLTEy
MDcsMjQgKzEyMDcsMjIgQEAgc3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBtdGtfanBlZ19wbV9y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KIA0KIHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQg
bXRrX2pwZWdfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQogew0KLQlpbnQgcmV0Ow0KLQ0K
LQlpZiAocG1fcnVudGltZV9zdXNwZW5kZWQoZGV2KSkNCi0JCXJldHVybiAwOw0KKwlzdHJ1Y3Qg
bXRrX2pwZWdfZGV2ICpqcGVnID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQogDQotCXJldCA9IG10
a19qcGVnX3BtX3N1c3BlbmQoZGV2KTsNCi0JcmV0dXJuIHJldDsNCisJdjRsMl9tMm1fc3VzcGVu
ZChqcGVnLT5tMm1fZGV2KTsNCisJcmV0dXJuIHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZChkZXYp
Ow0KIH0NCiANCiBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IG10a19qcGVnX3Jlc3VtZShzdHJ1
Y3QgZGV2aWNlICpkZXYpDQogew0KKwlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVnID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7DQogCWludCByZXQ7DQogDQotCWlmIChwbV9ydW50aW1lX3N1c3BlbmRl
ZChkZXYpKQ0KLQkJcmV0dXJuIDA7DQotDQotCXJldCA9IG10a19qcGVnX3BtX3Jlc3VtZShkZXYp
Ow0KKwlyZXQgPSBwbV9ydW50aW1lX2ZvcmNlX3Jlc3VtZShkZXYpOw0KKwlpZiAocmV0IDwgMCkN
CisJCXJldHVybiByZXQ7DQogDQorCXY0bDJfbTJtX3Jlc3VtZShqcGVnLT5tMm1fZGV2KTsNCiAJ
cmV0dXJuIHJldDsNCiB9DQogDQotLSANCjIuMTguMA0K

