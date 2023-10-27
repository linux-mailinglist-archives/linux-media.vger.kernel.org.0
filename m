Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D122C7D946F
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345675AbjJ0J67 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345663AbjJ0J66 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:58:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5569D
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:58:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FBF8EF2;
        Fri, 27 Oct 2023 11:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698400719;
        bh=nq1Rj5q7KBs/lUttGTDrfyVjmASXK6xBMmTq7vf4Yn0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fk9WfV464adohaxrLTOcThhe29eEQhDm3XznTVTelhPGQY1dKAiitj3tda7rgniGb
         +0iqq81nGs+yy5U6b6QTJjY1F0hV+u8VvLZ9xoHrhxct857UzY8hGSyQMRyisKOqow
         cDPnCh2PC3BcKhLFXP3RB4IB9cH2TNNrCsTgOMhQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Subject: [PATCH v1 4/9] media: qcom: camss: Fix references to pad config
Date:   Fri, 27 Oct 2023 12:58:48 +0300
Message-ID: <20231027095853.29057-5-laurent.pinchart@ideasonboard.com>
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
 .../media/platform/qcom/camss/camss-csid.c    | 12 +++++-----
 .../media/platform/qcom/camss/camss-csiphy.c  | 12 +++++-----
 .../media/platform/qcom/camss/camss-ispif.c   | 12 +++++-----
 drivers/media/platform/qcom/camss/camss-vfe.c | 24 +++++++++----------
 4 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 07fbdba354dc..bbe253f7571f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -263,7 +263,7 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 /*
  * __csid_get_format - Get pointer to format structure
  * @csid: CSID device
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @pad: pad from which format is requested
  * @which: TRY or ACTIVE format
  *
@@ -284,7 +284,7 @@ __csid_get_format(struct csid_device *csid,
 /*
  * csid_try_format - Handle try format by pad subdev method
  * @csid: CSID device
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @pad: pad on which format is requested
  * @fmt: pointer to v4l2 format structure
  * @which: wanted subdev format
@@ -352,7 +352,7 @@ static void csid_try_format(struct csid_device *csid,
 /*
  * csid_enum_mbus_code - Handle pixel format enumeration
  * @sd: CSID V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @code: pointer to v4l2_subdev_mbus_code_enum structure
  * return -EINVAL or zero on success
  */
@@ -393,7 +393,7 @@ static int csid_enum_mbus_code(struct v4l2_subdev *sd,
 /*
  * csid_enum_frame_size - Handle frame size enumeration
  * @sd: CSID V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fse: pointer to v4l2_subdev_frame_size_enum structure
  * return -EINVAL or zero on success
  */
@@ -430,7 +430,7 @@ static int csid_enum_frame_size(struct v4l2_subdev *sd,
 /*
  * csid_get_format - Handle get format by pads subdev method
  * @sd: CSID V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  *
  * Return -EINVAL or zero on success
@@ -454,7 +454,7 @@ static int csid_get_format(struct v4l2_subdev *sd,
 /*
  * csid_set_format - Handle set format by pads subdev method
  * @sd: CSID V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  *
  * Return -EINVAL or zero on success
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 169b2cd6f644..264c99efeae8 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -312,7 +312,7 @@ static int csiphy_set_stream(struct v4l2_subdev *sd, int enable)
 /*
  * __csiphy_get_format - Get pointer to format structure
  * @csiphy: CSIPHY device
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @pad: pad from which format is requested
  * @which: TRY or ACTIVE format
  *
@@ -333,7 +333,7 @@ __csiphy_get_format(struct csiphy_device *csiphy,
 /*
  * csiphy_try_format - Handle try format by pad subdev method
  * @csiphy: CSIPHY device
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @pad: pad on which format is requested
  * @fmt: pointer to v4l2 format structure
  * @which: wanted subdev format
@@ -380,7 +380,7 @@ static void csiphy_try_format(struct csiphy_device *csiphy,
 /*
  * csiphy_enum_mbus_code - Handle pixel format enumeration
  * @sd: CSIPHY V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @code: pointer to v4l2_subdev_mbus_code_enum structure
  * return -EINVAL or zero on success
  */
@@ -413,7 +413,7 @@ static int csiphy_enum_mbus_code(struct v4l2_subdev *sd,
 /*
  * csiphy_enum_frame_size - Handle frame size enumeration
  * @sd: CSIPHY V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fse: pointer to v4l2_subdev_frame_size_enum structure
  * return -EINVAL or zero on success
  */
@@ -450,7 +450,7 @@ static int csiphy_enum_frame_size(struct v4l2_subdev *sd,
 /*
  * csiphy_get_format - Handle get format by pads subdev method
  * @sd: CSIPHY V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  *
  * Return -EINVAL or zero on success
@@ -474,7 +474,7 @@ static int csiphy_get_format(struct v4l2_subdev *sd,
 /*
  * csiphy_set_format - Handle set format by pads subdev method
  * @sd: CSIPHY V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  *
  * Return -EINVAL or zero on success
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index 6f763b5ac8c8..d5efcfbec8c3 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -866,7 +866,7 @@ static int ispif_set_stream(struct v4l2_subdev *sd, int enable)
 /*
  * __ispif_get_format - Get pointer to format structure
  * @ispif: ISPIF line
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @pad: pad from which format is requested
  * @which: TRY or ACTIVE format
  *
@@ -887,7 +887,7 @@ __ispif_get_format(struct ispif_line *line,
 /*
  * ispif_try_format - Handle try format by pad subdev method
  * @ispif: ISPIF line
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @pad: pad on which format is requested
  * @fmt: pointer to v4l2 format structure
  * @which: wanted subdev format
@@ -935,7 +935,7 @@ static void ispif_try_format(struct ispif_line *line,
 /*
  * ispif_enum_mbus_code - Handle pixel format enumeration
  * @sd: ISPIF V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @code: pointer to v4l2_subdev_mbus_code_enum structure
  * return -EINVAL or zero on success
  */
@@ -968,7 +968,7 @@ static int ispif_enum_mbus_code(struct v4l2_subdev *sd,
 /*
  * ispif_enum_frame_size - Handle frame size enumeration
  * @sd: ISPIF V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fse: pointer to v4l2_subdev_frame_size_enum structure
  * return -EINVAL or zero on success
  */
@@ -1005,7 +1005,7 @@ static int ispif_enum_frame_size(struct v4l2_subdev *sd,
 /*
  * ispif_get_format - Handle get format by pads subdev method
  * @sd: ISPIF V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  *
  * Return -EINVAL or zero on success
@@ -1029,7 +1029,7 @@ static int ispif_get_format(struct v4l2_subdev *sd,
 /*
  * ispif_set_format - Handle set format by pads subdev method
  * @sd: ISPIF V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  *
  * Return -EINVAL or zero on success
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index daa4f5477f72..74fe577a84aa 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -815,7 +815,7 @@ static int vfe_set_stream(struct v4l2_subdev *sd, int enable)
 /*
  * __vfe_get_format - Get pointer to format structure
  * @line: VFE line
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @pad: pad from which format is requested
  * @which: TRY or ACTIVE format
  *
@@ -836,7 +836,7 @@ __vfe_get_format(struct vfe_line *line,
 /*
  * __vfe_get_compose - Get pointer to compose selection structure
  * @line: VFE line
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @which: TRY or ACTIVE format
  *
  * Return pointer to TRY or ACTIVE compose rectangle structure
@@ -856,7 +856,7 @@ __vfe_get_compose(struct vfe_line *line,
 /*
  * __vfe_get_crop - Get pointer to crop selection structure
  * @line: VFE line
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @which: TRY or ACTIVE format
  *
  * Return pointer to TRY or ACTIVE crop rectangle structure
@@ -875,7 +875,7 @@ __vfe_get_crop(struct vfe_line *line,
 /*
  * vfe_try_format - Handle try format by pad subdev method
  * @line: VFE line
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @pad: pad on which format is requested
  * @fmt: pointer to v4l2 format structure
  * @which: wanted subdev format
@@ -936,7 +936,7 @@ static void vfe_try_format(struct vfe_line *line,
 /*
  * vfe_try_compose - Handle try compose selection by pad subdev method
  * @line: VFE line
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @rect: pointer to v4l2 rect structure
  * @which: wanted subdev format
  */
@@ -975,7 +975,7 @@ static void vfe_try_compose(struct vfe_line *line,
 /*
  * vfe_try_crop - Handle try crop selection by pad subdev method
  * @line: VFE line
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @rect: pointer to v4l2 rect structure
  * @which: wanted subdev format
  */
@@ -1018,7 +1018,7 @@ static void vfe_try_crop(struct vfe_line *line,
 /*
  * vfe_enum_mbus_code - Handle pixel format enumeration
  * @sd: VFE V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @code: pointer to v4l2_subdev_mbus_code_enum structure
  *
  * return -EINVAL or zero on success
@@ -1052,7 +1052,7 @@ static int vfe_enum_mbus_code(struct v4l2_subdev *sd,
 /*
  * vfe_enum_frame_size - Handle frame size enumeration
  * @sd: VFE V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fse: pointer to v4l2_subdev_frame_size_enum structure
  *
  * Return -EINVAL or zero on success
@@ -1090,7 +1090,7 @@ static int vfe_enum_frame_size(struct v4l2_subdev *sd,
 /*
  * vfe_get_format - Handle get format by pads subdev method
  * @sd: VFE V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  *
  * Return -EINVAL or zero on success
@@ -1118,7 +1118,7 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
 /*
  * vfe_set_format - Handle set format by pads subdev method
  * @sd: VFE V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  *
  * Return -EINVAL or zero on success
@@ -1169,7 +1169,7 @@ static int vfe_set_format(struct v4l2_subdev *sd,
 /*
  * vfe_get_selection - Handle get selection by pads subdev method
  * @sd: VFE V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @sel: pointer to v4l2 subdev selection structure
  *
  * Return -EINVAL or zero on success
@@ -1239,7 +1239,7 @@ static int vfe_get_selection(struct v4l2_subdev *sd,
 /*
  * vfe_set_selection - Handle set selection by pads subdev method
  * @sd: VFE V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @sel: pointer to v4l2 subdev selection structure
  *
  * Return -EINVAL or zero on success
-- 
Regards,

Laurent Pinchart

