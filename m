Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61B446F41D2
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 12:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233864AbjEBKh0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 May 2023 06:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233819AbjEBKgf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 May 2023 06:36:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DF55257
        for <linux-media@vger.kernel.org>; Tue,  2 May 2023 03:36:12 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC03B9B9;
        Tue,  2 May 2023 12:36:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683023768;
        bh=eKvwpX+TdTBVpJ/cJ+W524plrDuH7X1vhpSBOvAuQsg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hSTN9BZ/RiHLwzMTWRzOCbWkGM4MGWQ3dHLw4/v72C+9Ebv7bNc5m87FmlgYnn8rb
         rGGeVYkGwKxUqoqjiFW0A5gyLkEFnf4vvcYOWca+glSUuXmSPVeEFTSm6FvDfRSayO
         3eoskH0XflCKMv/WSBPFNF8S4gKxDGFb2L58jlvA=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mickael Guene <mickael.guene@st.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     hugues.fruchet@foss.st.com, alain.volmat@foss.st.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 2/2] media: i2c: Propagate format from sink to source pad
Date:   Tue,  2 May 2023 11:35:47 +0100
Message-Id: <20230502103547.150918-3-dan.scally@ideasonboard.com>
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

When setting formats on the sink pad, propagate the adjusted format
over to the subdev's source pad. Use the MIPID02_SOURCE macro to fetch the pad's
try format rather than relying on the pad field of the format to facilitate
this - the function is specific to the source pad anyway.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/i2c/st-mipid02.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index f20f87562bf1..04112f26bc9d 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -750,7 +750,7 @@ static void mipid02_set_fmt_source(struct v4l2_subdev *sd,
 	if (format->which != V4L2_SUBDEV_FORMAT_TRY)
 		return;
 
-	*v4l2_subdev_get_try_format(sd, sd_state, format->pad) = format->format;
+	*v4l2_subdev_get_try_format(sd, sd_state, MIPID02_SOURCE) = format->format;
 }
 
 static void mipid02_set_fmt_sink(struct v4l2_subdev *sd,
@@ -768,6 +768,9 @@ static void mipid02_set_fmt_sink(struct v4l2_subdev *sd,
 		fmt = &bridge->fmt;
 
 	*fmt = format->format;
+
+	/* Propagate the format change to the source pad */
+	mipid02_set_fmt_source(sd, sd_state, format);
 }
 
 static int mipid02_set_fmt(struct v4l2_subdev *sd,
-- 
2.34.1

