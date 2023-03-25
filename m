Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5C66C90D0
	for <lists+linux-media@lfdr.de>; Sat, 25 Mar 2023 21:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjCYU4I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 16:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjCYU4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 16:56:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7412FA5CB;
        Sat, 25 Mar 2023 13:56:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04A519A8;
        Sat, 25 Mar 2023 21:56:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679777765;
        bh=g4tzjIW8B+784pTs2VxFlpddIhr0cvUc79i3cDR9EOc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IKKxHqEUt605ozw049O+6TjyA/VzahOsEIh3l5Hz8t0bdincMkaqs7589eWNbLz6E
         U3vJL1esBEYHbu7xhAZSB5vCaaILwO2MQUudxcevUfvdn/jQT2cN4tj+s24Q+YolLl
         oEw/zWnnhotTVCZBr05dcJQK2jOgFftuQRAHtRm8=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 1/2] media: i2c: adv7604: Enable video adjustment
Date:   Sat, 25 Mar 2023 22:56:09 +0200
Message-Id: <20230325205610.22583-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230325205610.22583-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230325205610.22583-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The video adjustments (contrast, brightness, saturation and hue) are
ignored by default by the device when the VID_ADJ_EN bit is clear. The
corresponding V4L2 controls exposed by the drivers have thus no effect.
Fix this by setting the VID_ADJ_EN bit.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/adv7604.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 9d218962d7c8..3af0e67f9edb 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -1805,6 +1805,9 @@ static void select_input(struct v4l2_subdev *sd)
 		v4l2_dbg(2, debug, sd, "%s: Unknown port %d selected\n",
 				__func__, state->selected_input);
 	}
+
+	/* Enable video adjustment (contrast, saturation, brightness and hue) */
+	cp_write_clr_set(sd, 0x3e, 0x80, 0x80);
 }
 
 static int adv76xx_s_routing(struct v4l2_subdev *sd,
-- 
Regards,

Laurent Pinchart

