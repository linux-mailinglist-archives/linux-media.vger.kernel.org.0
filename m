Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36291EDE59
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 09:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbgFDHbH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 03:31:07 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:36044 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728043AbgFDH30 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 03:29:26 -0400
X-UUID: 5327963303df4aa5804250a63c17ce6c-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QieJajFUSDAATn0RLbYQatSFJzOR4F4C/wwtZYRLLOI=;
        b=urlwNGJMglfiOfVBtiNVNFvRQHANpd6QP7IEQ7h9SFbaZ6A6H9F0q0P7Z1zrtZ4uuLkY7w+P53Q4zCzA61+mCJAK7vjctUIDJ7FP0Yk/wVxKZEjb3iVa8mHXxKOAHxzG6cK87pjWAvelQthuzcYTWW3YQuY6EzwE3PTscMi+yp0=;
X-UUID: 5327963303df4aa5804250a63c17ce6c-20200604
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 831859998; Thu, 04 Jun 2020 15:29:21 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 15:29:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 15:29:16 +0800
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
Subject: [PATCH v9 04/18] media: platform: Change the fixed device node number to unfixed value
Date:   Thu, 4 Jun 2020 15:26:54 +0800
Message-ID: <20200604072708.9468-5-xia.jiang@mediatek.com>
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

VGhlIGRyaXZlciBjYW4gYmUgaW5zdGFudGlhdGVkIG11bHRpcGxlIHRpbWVzLCBlLmcuIGZvciBh
IGRlY29kZXIgYW5kDQphbiBlbmNvZGVyLiBNb3Jlb3Zlciwgb3RoZXIgZHJpdmVycyBjb3VsZCBj
b2V4aXN0IG9uIHRoZSBzYW1lIHN5c3RlbS4NClRoaXMgbWFrZXMgdGhlIHN0YXRpYyB2aWRlbyBu
b2RlIG51bWJlciBhc3NpZ25tZW50IHBvaW50bGVzcywgc28gc3dpdGNoDQp0byBhdXRvbWF0aWMg
YXNzaWdubWVudCBpbnN0ZWFkLg0KDQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFu
Z0BtZWRpYXRlay5jb20+DQotLS0NCnY5OiBjaGFuZ2UgdGhlIGNvbW1pdCBtZXNzYWdlDQotLS0N
CiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyB8IDIgKy0N
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCmluZGV4IDI2
Nzc1ODA5NDFiMC4uMTI2MDljYTQ2ZmQ5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQpAQCAtMTE1NCw3ICsxMTU0LDcgQEAgc3RhdGlj
IGludCBtdGtfanBlZ19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAlqcGVn
LT5kZWNfdmRldi0+ZGV2aWNlX2NhcHMgPSBWNEwyX0NBUF9TVFJFQU1JTkcgfA0KIAkJCQkgICAg
ICBWNEwyX0NBUF9WSURFT19NMk1fTVBMQU5FOw0KIA0KLQlyZXQgPSB2aWRlb19yZWdpc3Rlcl9k
ZXZpY2UoanBlZy0+ZGVjX3ZkZXYsIFZGTF9UWVBFX1ZJREVPLCAzKTsNCisJcmV0ID0gdmlkZW9f
cmVnaXN0ZXJfZGV2aWNlKGpwZWctPmRlY192ZGV2LCBWRkxfVFlQRV9WSURFTywgLTEpOw0KIAlp
ZiAocmV0KSB7DQogCQl2NGwyX2VycigmanBlZy0+djRsMl9kZXYsICJGYWlsZWQgdG8gcmVnaXN0
ZXIgdmlkZW8gZGV2aWNlXG4iKTsNCiAJCWdvdG8gZXJyX2RlY192ZGV2X3JlZ2lzdGVyOw0KLS0g
DQoyLjE4LjANCg==

