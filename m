Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED14BE122
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 17:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439511AbfIYPVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 11:21:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46942 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439435AbfIYPU6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 11:20:58 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PFKu7J126045;
        Wed, 25 Sep 2019 10:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569424856;
        bh=WtqmEi9DS9vToPu+lMcovAc3Qiw/sm8n37sRiCL1Reo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GhE+k4yLKVftnr211aRAI30SMleEij1Al+lHg2XGWgc+5qedXnqRlXbunJ17tMok9
         dlg3eg3e72A/zk6/dLiK72hR9REeu5+UlFIsCTtIT+dqYghhH5INHFLI9kPu6SQYr7
         7QjpCpXgHJWc2GjtYXmmYAaDj5ensDHfqewIB7DI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PFKu86101613;
        Wed, 25 Sep 2019 10:20:56 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 10:20:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 10:20:56 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PFKssp047659;
        Wed, 25 Sep 2019 10:20:56 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 2/3] media: ov5640: Fix 1920x1080 mode to remove extra enable/disable
Date:   Wed, 25 Sep 2019 10:23:00 -0500
Message-ID: <20190925152301.21645-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925152301.21645-1-bparrot@ti.com>
References: <20190925152301.21645-1-bparrot@ti.com>
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
index c2a44f30d56e..aa56a5a93283 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -493,7 +493,6 @@ static const struct reg_value ov5640_setting_720P_1280_720[] = {
 };
 
 static const struct reg_value ov5640_setting_1080P_1920_1080[] = {
-	{0x3008, 0x42, 0, 0},
 	{0x3c07, 0x08, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
 	{0x3814, 0x11, 0, 0},
@@ -521,7 +520,7 @@ static const struct reg_value ov5640_setting_1080P_1920_1080[] = {
 	{0x3a0e, 0x03, 0, 0}, {0x3a0d, 0x04, 0, 0}, {0x3a14, 0x04, 0, 0},
 	{0x3a15, 0x60, 0, 0}, {0x4407, 0x04, 0, 0},
 	{0x460b, 0x37, 0, 0}, {0x460c, 0x20, 0, 0}, {0x3824, 0x04, 0, 0},
-	{0x4005, 0x1a, 0, 0}, {0x3008, 0x02, 0, 0},
+	{0x4005, 0x1a, 0, 0},
 };
 
 static const struct reg_value ov5640_setting_QSXGA_2592_1944[] = {
-- 
2.17.1

