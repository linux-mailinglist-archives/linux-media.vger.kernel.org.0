Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 860C93A28AF
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 11:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhFJJvQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 05:51:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39492 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbhFJJvP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 05:51:15 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60B00E54;
        Thu, 10 Jun 2021 11:49:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623318558;
        bh=WMayENxf3NbWaJJyZUWJdGW3aD/6XtADEaz+wkjmFI8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pDm6npCGKmeA7+uvwpHu3otkRgu0E2+62cyq16wXKybSCFp3BSRs+eXEL4xm7LE3D
         kUdgaHxIHvFl+TtJjVwJ9JKN51mP7T9zc3RyVTRCn5PT27HBGzmdTGcOc2adCnuJ4A
         UtU5PDn2KNyVOuiCd4Cd/vMu6LyYJdWZgQ/1/+y0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 3/5] media: fix kernel doc errors for sd_state parameter
Date:   Thu, 10 Jun 2021 12:49:01 +0300
Message-Id: <20210610094903.343183-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610094903.343183-1-tomi.valkeinen@ideasonboard.com>
References: <20210609100228.278798-1-tomi.valkeinen@ideasonboard.com>
 <20210610094903.343183-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

"media: v4l2-subdev: add subdev-wide state struct" introduced some
kernel doc errors due to cfg -> sd_state rename. Fix these.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/imx274.c                      |  6 +++---
 drivers/media/i2c/imx334.c                      | 10 +++++-----
 drivers/media/i2c/mt9m032.c                     |  4 ++--
 drivers/media/i2c/tvp514x.c                     |  6 +++---
 drivers/media/platform/vsp1/vsp1_entity.c       |  6 +++---
 drivers/media/platform/xilinx/xilinx-csi2rxss.c |  6 +++---
 drivers/media/platform/xilinx/xilinx-vip.c      |  4 ++--
 7 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index e0c413cc94d7..0dce92872176 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -996,7 +996,7 @@ static int imx274_binning_goodness(struct stimx274 *imx274,
  * Must be called with imx274->lock locked.
  *
  * @imx274: The device object
- * @cfg:    The pad config we are editing for TRY requests
+ * @sd_state: The subdev state we are editing for TRY requests
  * @which:  V4L2_SUBDEV_FORMAT_ACTIVE or V4L2_SUBDEV_FORMAT_TRY from the caller
  * @width:  Input-output parameter: set to the desired width before
  *          the call, contains the chosen value after returning successfully
@@ -1061,7 +1061,7 @@ static int __imx274_change_compose(struct stimx274 *imx274,
 /**
  * imx274_get_fmt - Get the pad format
  * @sd: Pointer to V4L2 Sub device structure
- * @cfg: Pointer to sub device pad information structure
+ * @sd_state: Pointer to sub device state structure
  * @fmt: Pointer to pad level media bus format
  *
  * This function is used to get the pad format information.
@@ -1083,7 +1083,7 @@ static int imx274_get_fmt(struct v4l2_subdev *sd,
 /**
  * imx274_set_fmt - This is used to set the pad format
  * @sd: Pointer to V4L2 Sub device structure
- * @cfg: Pointer to sub device pad information structure
+ * @sd_state: Pointer to sub device state information structure
  * @format: Pointer to pad level media bus format
  *
  * This function is used to set the pad format.
diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 751ce1f8f817..062125501788 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -497,7 +497,7 @@ static const struct v4l2_ctrl_ops imx334_ctrl_ops = {
 /**
  * imx334_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
  * @sd: pointer to imx334 V4L2 sub-device structure
- * @cfg: V4L2 sub-device pad configuration
+ * @sd_state: V4L2 sub-device state
  * @code: V4L2 sub-device code enumeration need to be filled
  *
  * Return: 0 if successful, error code otherwise.
@@ -517,7 +517,7 @@ static int imx334_enum_mbus_code(struct v4l2_subdev *sd,
 /**
  * imx334_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
  * @sd: pointer to imx334 V4L2 sub-device structure
- * @cfg: V4L2 sub-device pad configuration
+ * @sd_state: V4L2 sub-device state
  * @fsize: V4L2 sub-device size enumeration need to be filled
  *
  * Return: 0 if successful, error code otherwise.
@@ -564,7 +564,7 @@ static void imx334_fill_pad_format(struct imx334 *imx334,
 /**
  * imx334_get_pad_format() - Get subdevice pad format
  * @sd: pointer to imx334 V4L2 sub-device structure
- * @cfg: V4L2 sub-device pad configuration
+ * @sd_state: V4L2 sub-device state
  * @fmt: V4L2 sub-device format need to be set
  *
  * Return: 0 if successful, error code otherwise.
@@ -594,7 +594,7 @@ static int imx334_get_pad_format(struct v4l2_subdev *sd,
 /**
  * imx334_set_pad_format() - Set subdevice pad format
  * @sd: pointer to imx334 V4L2 sub-device structure
- * @cfg: V4L2 sub-device pad configuration
+ * @sd_state: V4L2 sub-device state
  * @fmt: V4L2 sub-device format need to be set
  *
  * Return: 0 if successful, error code otherwise.
@@ -631,7 +631,7 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 /**
  * imx334_init_pad_cfg() - Initialize sub-device pad configuration
  * @sd: pointer to imx334 V4L2 sub-device structure
- * @cfg: V4L2 sub-device pad configuration
+ * @sd_state: V4L2 sub-device state
  *
  * Return: 0 if successful, error code otherwise.
  */
diff --git a/drivers/media/i2c/mt9m032.c b/drivers/media/i2c/mt9m032.c
index 8a0741058c98..ba0c0ea91c95 100644
--- a/drivers/media/i2c/mt9m032.c
+++ b/drivers/media/i2c/mt9m032.c
@@ -332,7 +332,7 @@ static int mt9m032_enum_frame_size(struct v4l2_subdev *subdev,
 /**
  * __mt9m032_get_pad_crop() - get crop rect
  * @sensor: pointer to the sensor struct
- * @cfg: v4l2_subdev_pad_config for getting the try crop rect from
+ * @sd_state: v4l2_subdev_state for getting the try crop rect from
  * @which: select try or active crop rect
  *
  * Returns a pointer the current active or fh relative try crop rect
@@ -355,7 +355,7 @@ __mt9m032_get_pad_crop(struct mt9m032 *sensor,
 /**
  * __mt9m032_get_pad_format() - get format
  * @sensor: pointer to the sensor struct
- * @cfg: v4l2_subdev_pad_config for getting the try format from
+ * @sd_state: v4l2_subdev_state for getting the try format from
  * @which: select try or active format
  *
  * Returns a pointer the current active or fh relative try format
diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index 5f159588aaeb..cee60f945036 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -853,7 +853,7 @@ static const struct v4l2_ctrl_ops tvp514x_ctrl_ops = {
 /**
  * tvp514x_enum_mbus_code() - V4L2 decoder interface handler for enum_mbus_code
  * @sd: pointer to standard V4L2 sub-device structure
- * @cfg: pad configuration
+ * @sd_state: subdev state
  * @code: pointer to v4l2_subdev_mbus_code_enum structure
  *
  * Enumertaes mbus codes supported
@@ -880,7 +880,7 @@ static int tvp514x_enum_mbus_code(struct v4l2_subdev *sd,
 /**
  * tvp514x_get_pad_format() - V4L2 decoder interface handler for get pad format
  * @sd: pointer to standard V4L2 sub-device structure
- * @cfg: pad configuration
+ * @sd_state: subdev state
  * @format: pointer to v4l2_subdev_format structure
  *
  * Retrieves pad format which is active or tried based on requirement
@@ -912,7 +912,7 @@ static int tvp514x_get_pad_format(struct v4l2_subdev *sd,
 /**
  * tvp514x_set_pad_format() - V4L2 decoder interface handler for set pad format
  * @sd: pointer to standard V4L2 sub-device structure
- * @cfg: pad configuration
+ * @sd_state: subdev state
  * @fmt: pointer to v4l2_subdev_format structure
  *
  * Set pad format for the output pad
diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
index 7d92262f3378..6ef874d29eb7 100644
--- a/drivers/media/platform/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/vsp1/vsp1_entity.c
@@ -103,7 +103,7 @@ void vsp1_entity_configure_partition(struct vsp1_entity *entity,
 /**
  * vsp1_entity_get_pad_config - Get the pad configuration for an entity
  * @entity: the entity
- * @cfg: the TRY pad configuration
+ * @sd_state: the TRY pad configuration
  * @which: configuration selector (ACTIVE or TRY)
  *
  * When called with which set to V4L2_SUBDEV_FORMAT_ACTIVE the caller must hold
@@ -131,7 +131,7 @@ vsp1_entity_get_pad_config(struct vsp1_entity *entity,
 /**
  * vsp1_entity_get_pad_format - Get a pad format from storage for an entity
  * @entity: the entity
- * @cfg: the configuration storage
+ * @sd_state: the configuration storage
  * @pad: the pad number
  *
  * Return the format stored in the given configuration for an entity's pad. The
@@ -148,7 +148,7 @@ vsp1_entity_get_pad_format(struct vsp1_entity *entity,
 /**
  * vsp1_entity_get_pad_selection - Get a pad selection from storage for entity
  * @entity: the entity
- * @cfg: the configuration storage
+ * @sd_state: the configuration storage
  * @pad: the pad number
  * @target: the selection target
  *
diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index 2773145a2226..b1baf9d7b6ec 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -698,7 +698,7 @@ __xcsi2rxss_get_pad_format(struct xcsi2rxss_state *xcsi2rxss,
 /**
  * xcsi2rxss_init_cfg - Initialise the pad format config to default
  * @sd: Pointer to V4L2 Sub device structure
- * @cfg: Pointer to sub device pad information structure
+ * @sd_state: Pointer to sub device state structure
  *
  * This function is used to initialize the pad format with the default
  * values.
@@ -725,7 +725,7 @@ static int xcsi2rxss_init_cfg(struct v4l2_subdev *sd,
 /**
  * xcsi2rxss_get_format - Get the pad format
  * @sd: Pointer to V4L2 Sub device structure
- * @cfg: Pointer to sub device pad information structure
+ * @sd_state: Pointer to sub device state structure
  * @fmt: Pointer to pad level media bus format
  *
  * This function is used to get the pad format information.
@@ -750,7 +750,7 @@ static int xcsi2rxss_get_format(struct v4l2_subdev *sd,
 /**
  * xcsi2rxss_set_format - This is used to set the pad format
  * @sd: Pointer to V4L2 Sub device structure
- * @cfg: Pointer to sub device pad information structure
+ * @sd_state: Pointer to sub device state structure
  * @fmt: Pointer to pad level media bus format
  *
  * This function is used to set the pad format. Since the pad format is fixed
diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
index b989fee8351d..07d16a007d5f 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.c
+++ b/drivers/media/platform/xilinx/xilinx-vip.c
@@ -234,7 +234,7 @@ EXPORT_SYMBOL_GPL(xvip_cleanup_resources);
 /**
  * xvip_enum_mbus_code - Enumerate the media format code
  * @subdev: V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @code: returning media bus code
  *
  * Enumerate the media bus code of the subdevice. Return the corresponding
@@ -271,7 +271,7 @@ EXPORT_SYMBOL_GPL(xvip_enum_mbus_code);
 /**
  * xvip_enum_frame_size - Enumerate the media bus frame size
  * @subdev: V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fse: returning media bus frame size
  *
  * This function is a drop-in implementation of the subdev enum_frame_size pad
-- 
2.25.1

