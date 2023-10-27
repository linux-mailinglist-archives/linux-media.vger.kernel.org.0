Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A237D9352
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345573AbjJ0JQ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345561AbjJ0JQz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:16:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE306C0
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:16:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B5F1BBB;
        Fri, 27 Oct 2023 11:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698398198;
        bh=XNzEXg+sXmdXBC8/6Z1GSOgk6k7ySRSGX3ivdINsXZg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LLA1mkV5MSEgzuXHXu+yqRcxUB72cLGEQoOGSK70AhJU4oZDAjqQwqTUeNMNnuFtr
         1/P0lvhXouX0qZnnX5UoV8nxDvkv+YExGr7eH4W3yhyWzUndTwVa/VOOwizstxcaCu
         Vs9JJJO8QKNKtlwep1+Jqt2FRo8QgP6AHhgMQUyo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 6/9] media: atomisp: Use accessors for pad config 'try_*' fields
Date:   Fri, 27 Oct 2023 12:16:46 +0300
Message-ID: <20231027091649.10553-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
References: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The 'try_*' fields of the v4l2_subdev_pad_config structure are meant to
be accessed through helper functions. Replace direct access with usage
of the v4l2_subdev_get_pad_format(), v4l2_subdev_get_pad_crop() and
v4l2_subdev_get_pad_compose() helpers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c  | 2 +-
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 2 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c  | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_tpg.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 9fa390fbc5f3..5e438c5fd4a9 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -561,7 +561,7 @@ static int gc2235_set_fmt(struct v4l2_subdev *sd,
 
 	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sd_state->pads->try_fmt = *fmt;
+		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
 		mutex_unlock(&dev->input_lock);
 		return 0;
 	}
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 1c6643c442ef..db76f52e1dc8 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -666,7 +666,7 @@ static int mt9m114_set_fmt(struct v4l2_subdev *sd,
 	fmt->height = res->height;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sd_state->pads->try_fmt = *fmt;
+		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
 		return 0;
 	}
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 6a72691ed5b7..ae70e04040dd 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -671,7 +671,7 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 
 	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sd_state->pads->try_fmt = *fmt;
+		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
 		return 0;
 	}
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_tpg.c b/drivers/staging/media/atomisp/pci/atomisp_tpg.c
index 074826a5b706..b2376ebf45a1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_tpg.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_tpg.c
@@ -47,7 +47,7 @@ static int tpg_set_fmt(struct v4l2_subdev *sd,
 	/* only raw8 grbg is supported by TPG */
 	fmt->code = MEDIA_BUS_FMT_SGRBG8_1X8;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sd_state->pads->try_fmt = *fmt;
+		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
 		return 0;
 	}
 	return 0;
-- 
Regards,

Laurent Pinchart

