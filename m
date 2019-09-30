Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3A4C216D
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 15:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731210AbfI3NEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 09:04:41 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43420 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730929AbfI3NEk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 09:04:40 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4bOH003771;
        Mon, 30 Sep 2019 08:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569848677;
        bh=6eJVirsFiqTwdMuIYCCTbpbN4VdfqWDO+ZLJ0ZgDJQ8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=x6Pjc23c3k+auPDuYzOClk5zDeTwu06PRXU1WBPtQ549yS0+YDpm2+WvB6HEgUxm6
         RUPiT6yGXj6dOXt31tSGI2HNW+2dGcoWYvgilTyoXNmqRjXeY54K1t2h9xkv5kE5nU
         tG+esKFq6Ama5V52tdqM92jQZ3ITWufDGapaQXrA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4bJk057362;
        Mon, 30 Sep 2019 08:04:37 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 08:04:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 08:04:36 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4Zig115624;
        Mon, 30 Sep 2019 08:04:36 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: [Patch v5 1/8] media: i2c: ov2659: Fix for image wrap-around in lower resolution
Date:   Mon, 30 Sep 2019 08:06:37 -0500
Message-ID: <20190930130644.8704-2-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930130644.8704-1-bparrot@ti.com>
References: <20190930130644.8704-1-bparrot@ti.com>
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
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
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

