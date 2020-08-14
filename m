Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1822D24459E
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgHNHNO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:13:14 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:30883 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726631AbgHNHNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:13:12 -0400
X-UUID: 898099b2a58e451f8718aaa200a3904d-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PfBIGUrIviYGr2ArAJzuIJhObrGxChLvMOqQoOCeIP0=;
        b=QQzpRW4hO6g/0l8ItjYKY4BLgrv5hi7Nlgo4z3qfazz5Em3MtEYZweJp5nsIcZW97tr30UIyAKF/7qqS5AyvjdT//zNXNhKVMgsW3okAeXnslfTnfqKWnN/xNrtsz75AxTjWh8t3UxxV0oema677f6Sx+wj1YVBSIcpvzRQSzZc=;
X-UUID: 898099b2a58e451f8718aaa200a3904d-20200814
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1095006358; Fri, 14 Aug 2020 15:13:09 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:06 +0800
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
Subject: [PATCH v12 04/29] media: platform: Change the fixed device node number to unfixed value
Date:   Fri, 14 Aug 2020 15:11:37 +0800
Message-ID: <20200814071202.25067-6-xia.jiang@mediatek.com>
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

VGhlIGRyaXZlciBjYW4gYmUgaW5zdGFudGlhdGVkIG11bHRpcGxlIHRpbWVzLCBlLmcuIGZvciBh
IGRlY29kZXIgYW5kDQphbiBlbmNvZGVyLiBNb3Jlb3Zlciwgb3RoZXIgZHJpdmVycyBjb3VsZCBj
b2V4aXN0IG9uIHRoZSBzYW1lIHN5c3RlbS4NClRoaXMgbWFrZXMgdGhlIHN0YXRpYyB2aWRlbyBu
b2RlIG51bWJlciBhc3NpZ25tZW50IHBvaW50bGVzcywgc28gc3dpdGNoDQp0byBhdXRvbWF0aWMg
YXNzaWdubWVudCBpbnN0ZWFkLg0KDQpSZXZpZXdlZC1ieTogVG9tYXN6IEZpZ2EgPHRmaWdhQGNo
cm9taXVtLm9yZz4NClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVr
LmNvbT4NCi0tLQ0KdjEyOiBubyBjaGFuZ2VzDQotLS0NCiBkcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay1qcGVnL210a19qcGVnX2NvcmUuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstanBlZy9tdGtfanBlZ19jb3JlLmMNCmluZGV4IDI2Nzc1ODA5NDFiMC4uMTI2MDljYTQ2ZmQ5
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19j
b3JlLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29y
ZS5jDQpAQCAtMTE1NCw3ICsxMTU0LDcgQEAgc3RhdGljIGludCBtdGtfanBlZ19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAlqcGVnLT5kZWNfdmRldi0+ZGV2aWNlX2NhcHMg
PSBWNEwyX0NBUF9TVFJFQU1JTkcgfA0KIAkJCQkgICAgICBWNEwyX0NBUF9WSURFT19NMk1fTVBM
QU5FOw0KIA0KLQlyZXQgPSB2aWRlb19yZWdpc3Rlcl9kZXZpY2UoanBlZy0+ZGVjX3ZkZXYsIFZG
TF9UWVBFX1ZJREVPLCAzKTsNCisJcmV0ID0gdmlkZW9fcmVnaXN0ZXJfZGV2aWNlKGpwZWctPmRl
Y192ZGV2LCBWRkxfVFlQRV9WSURFTywgLTEpOw0KIAlpZiAocmV0KSB7DQogCQl2NGwyX2Vycigm
anBlZy0+djRsMl9kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgdmlkZW8gZGV2aWNlXG4iKTsNCiAJ
CWdvdG8gZXJyX2RlY192ZGV2X3JlZ2lzdGVyOw0KLS0gDQoyLjE4LjANCg==

