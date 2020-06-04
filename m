Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2785D1EDE4C
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 09:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgFDH33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 03:29:29 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:15107 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728061AbgFDH33 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 03:29:29 -0400
X-UUID: e8eeac1351eb4b0c9231d7b289c30470-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZTXG1swxMq+6u0sp84wMTHDYveVRdbBvoRAsf7UsS68=;
        b=Sm4x5YXrlQbiEIsi6vDqn27KOZpz91o1tHw658+1YjRjYgsRavKK2fax8vaTtot6UsogWHuF651v1LzZXoqhVZtf626l8iGSWTuW7Pp7Oj2MDkxv1rVVu3hN59pnlIDRrnuO6ZjApV3Rgcp2cYEw0Xq9u5IgzP+2yVORqzPkbTs=;
X-UUID: e8eeac1351eb4b0c9231d7b289c30470-20200604
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1167496728; Thu, 04 Jun 2020 15:29:24 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 15:29:22 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 15:29:20 +0800
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
Subject: [PATCH v9 07/18] media: platform: Improve the implementation of the system PM ops
Date:   Thu, 4 Jun 2020 15:26:57 +0800
Message-ID: <20200604072708.9468-8-xia.jiang@mediatek.com>
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

QWRkIHY0bDJfbTJtX3N1c3BlbmQoKSBmdW5jdGlvbiBjYWxsIGluIG10a19qcGVnX3N1c3BlbmQo
KSB0byBtYWtlIHN1cmUNCnRoYXQgdGhlIGN1cnJlbnQgZnJhbWUgaXMgcHJvY2Vzc2VkIGNvbXBs
ZXRlbHkgYmVmb3JlIHN1c3BlbmQuDQpBZGQgdjRsMl9tMm1fcmVzdW1lKCkgZnVuY3Rpb24gY2Fs
bCBpbiBtdGtfanBlZ19yZXN1bWUoKSB0byB1bmJsb2NrIHRoZQ0KZHJpdmVyIGZyb20gc2NoZWR1
bGluZyBuZXh0IGZyYW1lLg0KDQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0Bt
ZWRpYXRlay5jb20+DQotLS0NCnY5OiB1c2UgdjRsMl9tMm1fc3VzcGVuZCgpIGFuZCB2NGwyX20y
bV9yZXN1bWUoKSB0byBpbXByb3ZlIHRoZQ0KICAgIGltcGxlbWVudGlvbiBvZiB0aGUgc3lzdGVt
IFBNIG9wcw0KLS0tDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19j
b3JlLmMgfCA2ICsrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5j
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCmluZGV4
IDdmNzQ1OTcyNjJmYy4uNDliZGJmMWM0MzVmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQpAQCAtMTIwOCwxMCArMTIwOCwxMyBAQCBz
dGF0aWMgX19tYXliZV91bnVzZWQgaW50IG10a19qcGVnX3BtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpDQogc3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBtdGtfanBlZ19zdXNwZW5kKHN0cnVj
dCBkZXZpY2UgKmRldikNCiB7DQogCWludCByZXQ7DQorCXN0cnVjdCBtdGtfanBlZ19kZXYgKmpw
ZWcgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCiANCiAJaWYgKHBtX3J1bnRpbWVfc3VzcGVuZGVk
KGRldikpDQogCQlyZXR1cm4gMDsNCiANCisJdjRsMl9tMm1fc3VzcGVuZChqcGVnLT5tMm1fZGV2
KTsNCisNCiAJcmV0ID0gbXRrX2pwZWdfcG1fc3VzcGVuZChkZXYpOw0KIAlyZXR1cm4gcmV0Ow0K
IH0NCkBAIC0xMjE5LDEyICsxMjIyLDE1IEBAIHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgbXRr
X2pwZWdfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQogc3RhdGljIF9fbWF5YmVfdW51c2Vk
IGludCBtdGtfanBlZ19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KIHsNCiAJaW50IHJldDsN
CisJc3RydWN0IG10a19qcGVnX2RldiAqanBlZyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KIA0K
IAlpZiAocG1fcnVudGltZV9zdXNwZW5kZWQoZGV2KSkNCiAJCXJldHVybiAwOw0KIA0KIAlyZXQg
PSBtdGtfanBlZ19wbV9yZXN1bWUoZGV2KTsNCiANCisJdjRsMl9tMm1fcmVzdW1lKGpwZWctPm0y
bV9kZXYpOw0KKw0KIAlyZXR1cm4gcmV0Ow0KIH0NCiANCi0tIA0KMi4xOC4wDQo=

