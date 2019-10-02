Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6FEBC8A2B
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 15:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbfJBNt3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 09:49:29 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:32888 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfJBNt2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 09:49:28 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92DnRX1033253;
        Wed, 2 Oct 2019 08:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570024167;
        bh=Y5zSvT/b+Zn6u0NpvtiNBkTEoMKBgt57ESJcMEktGNE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=zUG33KFWNwgEt9LVgcg5q5pQr/44asrhPXdElNG8P/3KGUus+OrYvrmb2Z+nlexnM
         WHNhpM7+SRiexU+smGofAlkvPIN6+KTCfzQrpssNpQqQsZHH1fPrYfZUrwMVt7jEJE
         EKqYq56BVkfiJ4LdSfhiTcGz5gQ5yhPIbQquKkEE=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92DnRfe084379;
        Wed, 2 Oct 2019 08:49:27 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 08:49:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 08:49:16 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92DnOmA035733;
        Wed, 2 Oct 2019 08:49:27 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 2/3] media: ov5640: Fix 1920x1080 mode to remove extra enable/disable
Date:   Wed, 2 Oct 2019 08:51:33 -0500
Message-ID: <20191002135134.12273-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002135134.12273-1-bparrot@ti.com>
References: <20191002135134.12273-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the 1920x1080 register array an extra pair of reset ctrl disable
re-enable was causing unwanted init delays.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/ov5640.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 5198dc887400..103a4e8f88e1 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -492,7 +492,6 @@ static const struct reg_value ov5640_setting_720P_1280_720[] = {
 };
 
 static const struct reg_value ov5640_setting_1080P_1920_1080[] = {
-	{0x3008, 0x42, 0, 0},
 	{0x3c07, 0x08, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
 	{0x3814, 0x11, 0, 0},
@@ -520,7 +519,7 @@ static const struct reg_value ov5640_setting_1080P_1920_1080[] = {
 	{0x3a0e, 0x03, 0, 0}, {0x3a0d, 0x04, 0, 0}, {0x3a14, 0x04, 0, 0},
 	{0x3a15, 0x60, 0, 0}, {0x4407, 0x04, 0, 0},
 	{0x460b, 0x37, 0, 0}, {0x460c, 0x20, 0, 0}, {0x3824, 0x04, 0, 0},
-	{0x4005, 0x1a, 0, 0}, {0x3008, 0x02, 0, 0},
+	{0x4005, 0x1a, 0, 0},
 };
 
 static const struct reg_value ov5640_setting_QSXGA_2592_1944[] = {
-- 
2.17.1

