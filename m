Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5755B7D9476
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235119AbjJ0J7J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbjJ0J7H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:59:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E5710E
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:59:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B44DF1BA7;
        Fri, 27 Oct 2023 11:58:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698400723;
        bh=gcg4/TbT/YhhiGJrLfT0Zc5i3WdFKkA50WpjtZuMsx0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d4V44SUvmHUb4Hko4JS1fkdQ+UYE9+ohqJQrx5Coq5/Xj4K3F+crHxNbEq0mjzULM
         Jh6QHs/lmVkIZlAA9HiE11J3auqVOxY/BZQ4pEgMXbz7qo+CzXSwh6979egSMBdgUL
         EHuzOah2BZg5vFlx1p61rQ3XISckNavGUszFPeWM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v1 7/9] media: ti: omap4iss: Fix references to pad config
Date:   Fri, 27 Oct 2023 12:58:51 +0300
Message-ID: <20231027095853.29057-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
References: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
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

V4L2 subdev operations have moved from operating on a
v4l2_subdev_pad_config to a v4l2_subdev_state a long time ago. Fix
remaining incorrect references to pad config in comments.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/omap4iss/iss_csi2.c    | 6 +++---
 drivers/staging/media/omap4iss/iss_ipipe.c   | 8 ++++----
 drivers/staging/media/omap4iss/iss_ipipeif.c | 8 ++++----
 drivers/staging/media/omap4iss/iss_resizer.c | 8 ++++----
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_csi2.c b/drivers/staging/media/omap4iss/iss_csi2.c
index 3fd4a773ad80..0e6c5bd81930 100644
--- a/drivers/staging/media/omap4iss/iss_csi2.c
+++ b/drivers/staging/media/omap4iss/iss_csi2.c
@@ -890,7 +890,7 @@ csi2_try_format(struct iss_csi2_device *csi2,
 /*
  * csi2_enum_mbus_code - Handle pixel format enumeration
  * @sd     : pointer to v4l2 subdev structure
- * @cfg    : V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @code   : pointer to v4l2_subdev_mbus_code_enum structure
  * return -EINVAL or zero on success
  */
@@ -964,7 +964,7 @@ static int csi2_enum_frame_size(struct v4l2_subdev *sd,
 /*
  * csi2_get_format - Handle get format by pads subdev method
  * @sd : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
@@ -986,7 +986,7 @@ static int csi2_get_format(struct v4l2_subdev *sd,
 /*
  * csi2_set_format - Handle set format by pads subdev method
  * @sd : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
diff --git a/drivers/staging/media/omap4iss/iss_ipipe.c b/drivers/staging/media/omap4iss/iss_ipipe.c
index ad013ed923e7..4a4eae290d65 100644
--- a/drivers/staging/media/omap4iss/iss_ipipe.c
+++ b/drivers/staging/media/omap4iss/iss_ipipe.c
@@ -188,7 +188,7 @@ __ipipe_get_format(struct iss_ipipe_device *ipipe,
 /*
  * ipipe_try_format - Try video format on a pad
  * @ipipe: ISS IPIPE device
- * @cfg: V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @pad: Pad number
  * @fmt: Format
  */
@@ -239,7 +239,7 @@ ipipe_try_format(struct iss_ipipe_device *ipipe,
 /*
  * ipipe_enum_mbus_code - Handle pixel format enumeration
  * @sd     : pointer to v4l2 subdev structure
- * @cfg    : V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @code   : pointer to v4l2_subdev_mbus_code_enum structure
  * return -EINVAL or zero on success
  */
@@ -303,7 +303,7 @@ static int ipipe_enum_frame_size(struct v4l2_subdev *sd,
 /*
  * ipipe_get_format - Retrieve the video format on a pad
  * @sd : ISP IPIPE V4L2 subdevice
- * @cfg: V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @fmt: Format
  *
  * Return 0 on success or -EINVAL if the pad is invalid or doesn't correspond
@@ -327,7 +327,7 @@ static int ipipe_get_format(struct v4l2_subdev *sd,
 /*
  * ipipe_set_format - Set the video format on a pad
  * @sd : ISP IPIPE V4L2 subdevice
- * @cfg: V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @fmt: Format
  *
  * Return 0 on success or -EINVAL if the pad is invalid or doesn't correspond
diff --git a/drivers/staging/media/omap4iss/iss_ipipeif.c b/drivers/staging/media/omap4iss/iss_ipipeif.c
index 5cafcd38438a..8fa99532d9d4 100644
--- a/drivers/staging/media/omap4iss/iss_ipipeif.c
+++ b/drivers/staging/media/omap4iss/iss_ipipeif.c
@@ -368,7 +368,7 @@ __ipipeif_get_format(struct iss_ipipeif_device *ipipeif,
 /*
  * ipipeif_try_format - Try video format on a pad
  * @ipipeif: ISS IPIPEIF device
- * @cfg: V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @pad: Pad number
  * @fmt: Format
  */
@@ -439,7 +439,7 @@ ipipeif_try_format(struct iss_ipipeif_device *ipipeif,
 /*
  * ipipeif_enum_mbus_code - Handle pixel format enumeration
  * @sd     : pointer to v4l2 subdev structure
- * @cfg    : V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @code   : pointer to v4l2_subdev_mbus_code_enum structure
  * return -EINVAL or zero on success
  */
@@ -511,7 +511,7 @@ static int ipipeif_enum_frame_size(struct v4l2_subdev *sd,
 /*
  * ipipeif_get_format - Retrieve the video format on a pad
  * @sd : ISP IPIPEIF V4L2 subdevice
- * @cfg: V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @fmt: Format
  *
  * Return 0 on success or -EINVAL if the pad is invalid or doesn't correspond
@@ -535,7 +535,7 @@ static int ipipeif_get_format(struct v4l2_subdev *sd,
 /*
  * ipipeif_set_format - Set the video format on a pad
  * @sd : ISP IPIPEIF V4L2 subdevice
- * @cfg: V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @fmt: Format
  *
  * Return 0 on success or -EINVAL if the pad is invalid or doesn't correspond
diff --git a/drivers/staging/media/omap4iss/iss_resizer.c b/drivers/staging/media/omap4iss/iss_resizer.c
index be26467ad653..58e698ef9108 100644
--- a/drivers/staging/media/omap4iss/iss_resizer.c
+++ b/drivers/staging/media/omap4iss/iss_resizer.c
@@ -427,7 +427,7 @@ __resizer_get_format(struct iss_resizer_device *resizer,
 /*
  * resizer_try_format - Try video format on a pad
  * @resizer: ISS RESIZER device
- * @cfg: V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @pad: Pad number
  * @fmt: Format
  */
@@ -488,7 +488,7 @@ resizer_try_format(struct iss_resizer_device *resizer,
 /*
  * resizer_enum_mbus_code - Handle pixel format enumeration
  * @sd     : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @code   : pointer to v4l2_subdev_mbus_code_enum structure
  * return -EINVAL or zero on success
  */
@@ -571,7 +571,7 @@ static int resizer_enum_frame_size(struct v4l2_subdev *sd,
 /*
  * resizer_get_format - Retrieve the video format on a pad
  * @sd : ISP RESIZER V4L2 subdevice
- * @cfg: V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @fmt: Format
  *
  * Return 0 on success or -EINVAL if the pad is invalid or doesn't correspond
@@ -595,7 +595,7 @@ static int resizer_get_format(struct v4l2_subdev *sd,
 /*
  * resizer_set_format - Set the video format on a pad
  * @sd : ISP RESIZER V4L2 subdevice
- * @cfg: V4L2 subdev pad config
+ * @sd_state: V4L2 subdev state
  * @fmt: Format
  *
  * Return 0 on success or -EINVAL if the pad is invalid or doesn't correspond
-- 
Regards,

Laurent Pinchart

