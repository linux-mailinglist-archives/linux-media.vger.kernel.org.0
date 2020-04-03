Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05E9D19D400
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 11:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403840AbgDCJlK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 05:41:10 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:51482 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2403794AbgDCJlJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 05:41:09 -0400
X-UUID: d9f3a38ca16849808c89a05f007dc862-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6dN1GgsfwAHyVkKZX2n+eOaaQgO90AAheL/GZ5XbwcM=;
        b=pzOQAYdxSUpLuvp5dwDpu6vPRp1eMc3ut1egFbHcnoWyvjO4Kij/oUR8beAvLHncemXDli8FTgNNjUOB25XxApGHOSppGYB5hoIgpsu6XT8hcJk88eY63iLaQDDBaeo6BOwU+oHM8idC7oM/ZV75SG/MSmvtFUNWnsmxGy4sh3c=;
X-UUID: d9f3a38ca16849808c89a05f007dc862-20200403
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 477652841; Fri, 03 Apr 2020 17:41:01 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Apr 2020 17:40:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Apr 2020 17:40:35 +0800
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
Subject: [PATCH v8 04/14] media: platform: Change the fixed device node number to unfixed value
Date:   Fri, 3 Apr 2020 17:40:23 +0800
Message-ID: <20200403094033.8288-5-xia.jiang@mediatek.com>
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

Q2hhbmdlIGRldmljZSBub2RlIG51bWJlciBmcm9tIDMgdG8gLTEgYmVjYXVzZSB0aGF0IHRoZSBk
cml2ZXIgd2lsbA0KYWxzbyBzdXBwb3J0IGpwZWcgZW5jb2Rlci4NCg0KU2lnbmVkLW9mZi1ieTog
WGlhIEppYW5nIDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQppbmRleCBlMmExZDg1MDgxM2IuLmE1MzZm
YTk1YjNkNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRr
X2pwZWdfY29yZS5jDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19q
cGVnX2NvcmUuYw0KQEAgLTExNTQsNyArMTE1NCw3IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJanBlZy0+ZGVjX3ZkZXYtPmRldmlj
ZV9jYXBzID0gVjRMMl9DQVBfU1RSRUFNSU5HIHwNCiAJCQkJICAgICAgVjRMMl9DQVBfVklERU9f
TTJNX01QTEFORTsNCiANCi0JcmV0ID0gdmlkZW9fcmVnaXN0ZXJfZGV2aWNlKGpwZWctPmRlY192
ZGV2LCBWRkxfVFlQRV9HUkFCQkVSLCAzKTsNCisJcmV0ID0gdmlkZW9fcmVnaXN0ZXJfZGV2aWNl
KGpwZWctPmRlY192ZGV2LCBWRkxfVFlQRV9HUkFCQkVSLCAtMSk7DQogCWlmIChyZXQpIHsNCiAJ
CXY0bDJfZXJyKCZqcGVnLT52NGwyX2RldiwgIkZhaWxlZCB0byByZWdpc3RlciB2aWRlbyBkZXZp
Y2VcbiIpOw0KIAkJZ290byBlcnJfZGVjX3ZkZXZfcmVnaXN0ZXI7DQotLSANCjIuMTguMA0K

