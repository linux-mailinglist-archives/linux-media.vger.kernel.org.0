Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4FB79EA2E
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 15:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241089AbjIMN4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 09:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241085AbjIMN4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 09:56:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09ACB19B1
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 06:56:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0B1C755;
        Wed, 13 Sep 2023 15:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694613296;
        bh=fsByUU7nCtze1yks81eQ9ufwI5bTlAd30RtyBxPmJ04=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fSYOG+kqJWyBXGfBM5d8JD9/PvZm2AOzy+hKMp+y+lt9uuCzhyiqsx+xF5wy5NQQq
         zhdfoXTtaESIFPVgJVNJo1gMgmR6xgxLpKOdW7x1kmkELmVpk0rKXL0z5OQXf40Vot
         h3SeLspx2vo9DhiEpXrQt3nWwqPjvbQtO0sMHt0k=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 02/20] media: i2c: imx219: Drop unused macros
Date:   Wed, 13 Sep 2023 16:56:20 +0300
Message-ID: <20230913135638.26277-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
References: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop a handful of macros that are not used and don't provide any value.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index c5aeec50b9e8..229dfe24304b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -72,12 +72,6 @@
 
 #define IMX219_VBLANK_MIN		4
 
-/*Frame Length Line*/
-#define IMX219_FLL_MIN			0x08a6
-#define IMX219_FLL_MAX			0xffff
-#define IMX219_FLL_STEP			1
-#define IMX219_FLL_DEFAULT		0x0c98
-
 /* HBLANK control - read only */
 #define IMX219_PPL_DEFAULT		3448
 
@@ -105,10 +99,6 @@
 #define IMX219_TESTP_COLOUR_MIN		0
 #define IMX219_TESTP_COLOUR_MAX		0x03ff
 #define IMX219_TESTP_COLOUR_STEP	1
-#define IMX219_TESTP_RED_DEFAULT	IMX219_TESTP_COLOUR_MAX
-#define IMX219_TESTP_GREENR_DEFAULT	0
-#define IMX219_TESTP_BLUE_DEFAULT	0
-#define IMX219_TESTP_GREENB_DEFAULT	0
 
 /* External clock frequency is 24.0M */
 #define IMX219_XCLK_FREQ		24000000
-- 
Regards,

Laurent Pinchart

