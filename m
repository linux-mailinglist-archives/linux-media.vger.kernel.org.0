Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8F7A10C21A
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 03:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbfK1CDG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Nov 2019 21:03:06 -0500
Received: from vps.xff.cz ([195.181.215.36]:35232 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728789AbfK1CDG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Nov 2019 21:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1574906584; bh=RQDxlS9cbGfCHiTwpM+hDX9ba2b7M56PlxJbEpAHn64=;
        h=From:To:Cc:Subject:Date:From;
        b=HZ6ehS36f/dOdSnmk5GP4TRHuPE5bEB17WNVtwVPxZ+dU+9XgmjOztv287/Y7dPU6
         jVbH7zLVqAMBBJN73o67NC1c0PSAdpoW5Q07s95ocjhsEOGKRZQjX7Yt84jnjY0+PU
         BD1aJHCmMZ14EpvKQA70oEFi9rhFMBAIr4B/8VUI=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com
Cc:     Ondrej Jirman <megous@megous.com>,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-media@vger.kernel.org (open list:CSI DRIVERS FOR ALLWINNER V3s),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner
        sunXi SoC support), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: sun6i-csi: Fix incorrect HSYNC/VSYNC/PCLK polarity configuration
Date:   Thu, 28 Nov 2019 03:02:59 +0100
Message-Id: <20191128020259.1338188-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This was discovered by writing a new camera driver and wondering, why
hsync/vsync polarity setting behaves in reverse to what would be
expected. Verified by looking at the actual signals and the SoC
user manual.

Fixes: 5cc7522d8965 ("media: sun6i: Add support for Allwinner CSI V3s")
Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index f17e5550602d..98bbcca59a90 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -417,12 +417,12 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_dev *sdev)
 		if (flags & V4L2_MBUS_FIELD_EVEN_LOW)
 			cfg |= CSI_IF_CFG_FIELD_POSITIVE;
 
-		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
+		if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
 			cfg |= CSI_IF_CFG_VREF_POL_POSITIVE;
-		if (flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
+		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
 			cfg |= CSI_IF_CFG_HREF_POL_POSITIVE;
 
-		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+		if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
 			cfg |= CSI_IF_CFG_CLK_POL_FALLING_EDGE;
 		break;
 	case V4L2_MBUS_BT656:
-- 
2.24.0

