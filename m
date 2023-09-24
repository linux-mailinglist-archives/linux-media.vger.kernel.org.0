Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 241697ACA84
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 17:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjIXPdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 11:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIXPdM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 11:33:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E9BC6
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 08:33:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3B611AC0;
        Sun, 24 Sep 2023 17:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695569484;
        bh=qm12WSkddr1SZQTti+8FRG4p5syuxWG3UOeqbYjtiNs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kF65cX4aVOQDCdnD/vEUItGWM7yVBWRQNh7wfPUCDskU9zHiwppias9XKCvxtt1Cp
         okdf6y9D/DBUrrtGlREAKhpnxCfyKG/4GIDhuW3EiUUQcoqVE4MwcS7KetnXZgPJ25
         nM143Gyv+thtSxRWNVA1LsYh5fb5WA7ieU+vo5wQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 04/20] media: i2c: imx219: Drop IMX219_REG_CSI_LANE_MODE from common regs array
Date:   Sun, 24 Sep 2023 18:32:53 +0300
Message-ID: <20230924153309.12423-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
References: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX219_REG_CSI_LANE_MODE is configured twice, once with a hardcoded
value in the imx219_common_regs registers array, and once with the value
appropriate for the system in imx219_configure_lanes(). The latter is
enough, drop the former.

Fixes: ceddfd4493b3 ("media: i2c: imx219: Support four-lane operation")
Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 530b03d78e34..a14de8f3dee7 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -214,7 +214,6 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
 	{ IMX219_REG_Y_ODD_INC_A, 1 },
 
 	/* Output setup registers */
-	{ IMX219_REG_CSI_LANE_MODE, IMX219_CSI_2_LANE_MODE },
 	{ IMX219_REG_DPHY_CTRL, IMX219_DPHY_CTRL_TIMING_AUTO },
 	{ IMX219_REG_EXCK_FREQ, IMX219_EXCK_FREQ(IMX219_XCLK_FREQ / 1000000) },
 };
-- 
Regards,

Laurent Pinchart

