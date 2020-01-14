Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49CF513A003
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 04:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729384AbgANDg3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 22:36:29 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:39764 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728802AbgANDg3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 22:36:29 -0500
X-UUID: 4f42a4862b1b48f8958ddc645d1d2871-20200114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=l1LB1RrzPHfxgwSbc7kiDcv5fjLNgTXp3z5W5A8tXfo=;
        b=JtRWlBUjUQIdNpKiNDx2hsWyA8AHkZDV8bAX6XuvVKIsCOKQ3yEOPoJw9oGEmnIuOP2pVstWaSHkpYoya/jNqtEqgczp91I02utXVcB9kuppA367wpMK/otlBBLF/JwXGdcDn+zdX8KNh/LOLhJY0GxWctrqIXASVLk7UL7PkVU=;
X-UUID: 4f42a4862b1b48f8958ddc645d1d2871-20200114
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <maoguang.meng@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 725869208; Tue, 14 Jan 2020 11:36:21 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 11:35:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 Jan 2020 11:36:31 +0800
From:   <maoguang.meng@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     Maxime Ripard <mripard@kernel.org>, Sean Young <sean@mess.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Xia Jiang <xia.jiang@mediatek.com>
Subject: media: platform: VIDEO_MEDIATEK_JPEG can also depend on MTK_IOMMU
Date:   Tue, 14 Jan 2020 11:36:12 +0800
Message-ID: <20200114033612.16904-1-maoguang.meng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: D58AFFB3BD81A49B5EFA5B0B1DB085E38D02C470B92696A388E40B4F79B922552000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogTWFvZ3VhbmcgTWVuZyA8bWFvZ3VhbmcubWVuZ0BtZWRpYXRlay5jb20+DQoNCm1lZGlh
dGVrIGpwZWcgdmNvZGVjIGRyaXZlciBjYW4gZGVwZW5kIG9uIE1US19JT01NVSBvciBNVEtfSU9N
TVVfVjEuDQoNCg0KU2lnbmVkLW9mZi1ieTogTWFvZ3VhbmcgTWVuZyA8bWFvZ3VhbmcubWVuZ0Bt
ZWRpYXRlay5jb20+DQotLS0NCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL0tjb25maWcgfCAyICst
DQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL0tjb25maWcgYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL0tjb25maWcNCmluZGV4IGU4NGYzNWQzYTY4ZS4uODUzNzdjODhlOTFhIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9LY29uZmlnDQorKysgYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL0tjb25maWcNCkBAIC0yMDAsNyArMjAwLDcgQEAgY29uZmlnIFZJREVPX0lNWF9Q
WFANCiANCiBjb25maWcgVklERU9fTUVESUFURUtfSlBFRw0KIAl0cmlzdGF0ZSAiTWVkaWF0ZWsg
SlBFRyBDb2RlYyBkcml2ZXIiDQotCWRlcGVuZHMgb24gTVRLX0lPTU1VX1YxIHx8IENPTVBJTEVf
VEVTVA0KKwlkZXBlbmRzIG9uIE1US19JT01NVV9WMSB8fCBNVEtfSU9NTVUgfHwgQ09NUElMRV9U
RVNUDQogCWRlcGVuZHMgb24gVklERU9fREVWICYmIFZJREVPX1Y0TDINCiAJZGVwZW5kcyBvbiBB
UkNIX01FRElBVEVLIHx8IENPTVBJTEVfVEVTVA0KIAlzZWxlY3QgVklERU9CVUYyX0RNQV9DT05U
SUcNCi0tIA0KMi4xOC4wDQo=

