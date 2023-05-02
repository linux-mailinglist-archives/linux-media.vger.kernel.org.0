Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 810956F41D1
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 12:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233645AbjEBKhY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 May 2023 06:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233864AbjEBKgc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 May 2023 06:36:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED685273
        for <linux-media@vger.kernel.org>; Tue,  2 May 2023 03:36:10 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20653838;
        Tue,  2 May 2023 12:36:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683023767;
        bh=H2HNj57Oi7/BW0vfiwit3TsbVkwUWdZfhjCsEj3Eop0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WGK+8SFE2j+mOS7MQzxJvEuw9gGaDpZRrOIgr4vMsGh5oe1h8K8r3OqHrRJFefjQy
         77AhrO+GlVoASHilXkKuEnLUbxPfd9CtyUHQhyWeYNqA1vN6lPS+ES/Y2EbZyODmhy
         zH1BaxeR+J0b63aj1ttAt5+ZGwxXK8EpUSBNd5Bg=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mickael Guene <mickael.guene@st.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     hugues.fruchet@foss.st.com, alain.volmat@foss.st.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 1/2] media: i2c: Correct format propagation for st-mipid02
Date:   Tue,  2 May 2023 11:35:46 +0100
Message-Id: <20230502103547.150918-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502103547.150918-1-dan.scally@ideasonboard.com>
References: <20230502103547.150918-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Format propagation in the st-mipid02 driver is incorrect in that when
setting format for V4L2_SUBDEV_FORMAT_TRY on the source pad, the
_active_ rather than _try_ format from the sink pad is propagated.
This causes problems with format negotiation - update the function to
propagate the correct format.

Fixes: 642bb5e88fed ("media: st-mipid02: MIPID02 CSI-2 to PARALLEL bridge driver")
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/i2c/st-mipid02.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 31b89aff0e86..f20f87562bf1 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -736,8 +736,13 @@ static void mipid02_set_fmt_source(struct v4l2_subdev *sd,
 {
 	struct mipid02_dev *bridge = to_mipid02_dev(sd);
 
-	/* source pad mirror active sink pad */
-	format->format = bridge->fmt;
+	/* source pad mirror sink pad */
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		format->format = bridge->fmt;
+	else
+		format->format = *v4l2_subdev_get_try_format(sd, sd_state,
+							     MIPID02_SINK_0);
+
 	/* but code may need to be converted */
 	format->format.code = serial_to_parallel_code(format->format.code);
 
-- 
2.34.1

