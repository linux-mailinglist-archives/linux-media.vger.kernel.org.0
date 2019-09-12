Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42149B0F52
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 14:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731961AbfILM60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 08:58:26 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56712 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731759AbfILM6Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 08:58:25 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CCw69W005001;
        Thu, 12 Sep 2019 07:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568293086;
        bh=iTVrMjr1jpW2jGLDHpDluWhwBeMusQS6Cqz8cCy6Yzo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=YAoYmJHQZUFfBR2Q9ICsVAEQNc0ebeLN38J+zRT8FfnpG3g6y3yenUFcck6OUSy89
         Z0g7f3Mi0kxtTiPHCgolzPXfNBGJ5cA3qfYDcA67TJZs2BIK5MMiPHEmNIMtk7Kk8c
         96wwmQDbfbdSaRiT7L/M4oZm5nW9n/r7uuUBbFA8=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CCw60H103419
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 07:58:06 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 07:58:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 07:58:05 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CCw4Zf095654;
        Thu, 12 Sep 2019 07:58:05 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: [Patch 1/6] media: i2c: ov2659: Fix for image wrap-around in lower resolution
Date:   Thu, 12 Sep 2019 08:00:02 -0500
Message-ID: <20190912130007.4469-2-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912130007.4469-1-bparrot@ti.com>
References: <20190912130007.4469-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Based on recently found sensor configuration examples, it was
discovered that when scaling and binning are used for the lower
resolutions (i.e. 640x480, 320x240) the read offset has to be
increased otherwise the image appears to be wrapped around.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/media/i2c/ov2659.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index f4ded0669ff9..17573257097d 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -661,7 +661,7 @@ static struct sensor_register ov2659_vga[] = {
 	{ REG_TIMING_HORIZ_FORMAT, 0x01 },
 	{ 0x370a, 0x52 },
 	{ REG_VFIFO_READ_START_H, 0x00 },
-	{ REG_VFIFO_READ_START_L, 0x80 },
+	{ REG_VFIFO_READ_START_L, 0xa0 },
 	{ REG_ISP_CTRL02, 0x10 },
 	{ REG_NULL, 0x00 },
 };
@@ -709,7 +709,7 @@ static  struct sensor_register ov2659_qvga[] = {
 	{ REG_TIMING_HORIZ_FORMAT, 0x01 },
 	{ 0x370a, 0x52 },
 	{ REG_VFIFO_READ_START_H, 0x00 },
-	{ REG_VFIFO_READ_START_L, 0x80 },
+	{ REG_VFIFO_READ_START_L, 0xa0 },
 	{ REG_ISP_CTRL02, 0x10 },
 	{ REG_NULL, 0x00 },
 };
-- 
2.17.1

