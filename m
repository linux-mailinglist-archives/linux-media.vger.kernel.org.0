Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 554DD563433
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 15:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbiGANQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 09:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiGANQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 09:16:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9675723F
        for <linux-media@vger.kernel.org>; Fri,  1 Jul 2022 06:16:22 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 959CD6BB;
        Fri,  1 Jul 2022 15:16:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656681379;
        bh=BYIj1K22uZXBuCU6l+jbswdE7AHRyI52aHQWBsi8xDQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TfpQr+lDKTv5uH98Dk0v90/9dvah05/Yqib924xBrdtgGILqKIIWfnitSwoAk4fZr
         ZudpXcPkf7IiVoxtx6PxtU1dDl+gKJsh7lxbzJPi8gO2gFpjpGHCwvKsP1u0HpTTsl
         dIakq45olAxHzAxkMqECNU6h7thlJtDSeTOLFc28=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 2/2] media: stm32: dcmi: Fix subdev op call with uninitialized state
Date:   Fri,  1 Jul 2022 16:15:59 +0300
Message-Id: <20220701131559.66715-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220701131559.66715-1-tomi.valkeinen@ideasonboard.com>
References: <20220701131559.66715-1-tomi.valkeinen@ideasonboard.com>
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

stm32-dcmi calls its source subdev with v4l2_subdev_call() using a
v4l2_subdev_state constructed on stack. This means that init_cfg is
never called for that state, and a source subdev that depends on the
init_cfg call may break.

A new macro has been added for this particular purpose, which properly
initializes the state, so let's use v4l2_subdev_call_state_try() here.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 09a743cd7004..eb831b5932e7 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -999,10 +999,6 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
 	const struct dcmi_format *sd_fmt;
 	struct dcmi_framesize sd_fsize;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
-	struct v4l2_subdev_pad_config pad_cfg;
-	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -1037,8 +1033,7 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
 	}
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
-			       &pad_state, &format);
+	ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
 	if (ret < 0)
 		return ret;
 
@@ -1187,10 +1182,6 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
-	struct v4l2_subdev_pad_config pad_cfg;
-	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
 	int ret;
 
 	sd_fmt = find_format_by_fourcc(dcmi, pix->pixelformat);
@@ -1203,8 +1194,7 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
 	}
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
-			       &pad_state, &format);
+	ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
 	if (ret < 0)
 		return ret;
 
-- 
2.34.1

