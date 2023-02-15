Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 691BC698026
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 17:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjBOQFz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 11:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjBOQFy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 11:05:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1094B39CFE
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 08:05:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFCFE10B;
        Wed, 15 Feb 2023 17:05:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676477151;
        bh=IYW1L9KuAlE6/w2NMZL1g5g6848vNQVMna+G+LtaZpM=;
        h=From:To:Cc:Subject:Date:From;
        b=SSXpQgo7scqZrZsybKtg5qf4n1D1wJoj4S67zSLPYyZUwqCTSfTHxx2ziYUdEAvzb
         vROCYHNGsqwS74WS8TUjO/G/Np0zgAq3HiDpMEyqooHInXVBjh6RT3Ra4Adg43GVk3
         94xiQ8+9oVsAjouFCyGdWY1+mi/4/To2iPpd7gT0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Eugen Hristev <eugen.hristev@collabora.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] media: Fix indentation issues introduced by subdev-wide state struct
Date:   Wed, 15 Feb 2023 18:05:50 +0200
Message-Id: <20230215160550.5108-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
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

Commit 0d346d2a6f54 ("media: v4l2-subdev: add subdev-wide state struct")
applied a large media tree-wide change produced by coccinelle. It was so
large that a set of identical indentation issues went unnoticed during
review. Fix them.

While at it, and because it's easy to review both changes together, add
a trailing comma for the last (and only) struct member initialization of
the related structures, to avoid future changes should new fields need
to be initialized.

Fixes: 0d346d2a6f54 ("media: v4l2-subdev: add subdev-wide state struct")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/pci/saa7134/saa7134-empress.c        |  4 ++--
 drivers/media/platform/atmel/atmel-isi.c           |  4 ++--
 drivers/media/platform/intel/pxa_camera.c          |  4 ++--
 drivers/media/platform/marvell/mcam-core.c         |  4 ++--
 drivers/media/platform/renesas/renesas-ceu.c       |  4 ++--
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      | 14 +++++++-------
 drivers/media/platform/via/via-camera.c            |  4 ++--
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  8 ++++----
 .../media/deprecated/atmel/atmel-isc-base.c        |  4 ++--
 9 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
index aafbb34765b0..434fa1ee1c33 100644
--- a/drivers/media/pci/saa7134/saa7134-empress.c
+++ b/drivers/media/pci/saa7134/saa7134-empress.c
@@ -139,8 +139,8 @@ static int empress_try_fmt_vid_cap(struct file *file, void *priv,
 	struct saa7134_dev *dev = video_drvdata(file);
 	struct v4l2_subdev_pad_config pad_cfg;
 	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
+		.pads = &pad_cfg,
+	};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 4d15814e4481..fbfec3b81713 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -587,8 +587,8 @@ static int isi_try_fmt(struct atmel_isi *isi, struct v4l2_format *f,
 	struct v4l2_pix_format *pixfmt = &f->fmt.pix;
 	struct v4l2_subdev_pad_config pad_cfg = {};
 	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
+		.pads = &pad_cfg,
+	};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 54270d6b6f50..56b363c93f8c 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -1794,8 +1794,8 @@ static int pxac_vidioc_try_fmt_vid_cap(struct file *filp, void *priv,
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	struct v4l2_subdev_pad_config pad_cfg;
 	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
+		.pads = &pad_cfg,
+	};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index ad4a7922d0d7..154bdcb3f2cc 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -1351,8 +1351,8 @@ static int mcam_vidioc_try_fmt_vid_cap(struct file *filp, void *priv,
 	struct v4l2_pix_format *pix = &fmt->fmt.pix;
 	struct v4l2_subdev_pad_config pad_cfg;
 	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
+		.pads = &pad_cfg,
+	};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index f70f91b006b7..6bab72def972 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -795,8 +795,8 @@ static int __ceu_try_fmt(struct ceu_device *ceudev, struct v4l2_format *v4l2_fmt
 	struct v4l2_subdev *v4l2_sd = ceu_sd->v4l2_sd;
 	struct v4l2_subdev_pad_config pad_cfg;
 	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
+		.pads = &pad_cfg,
+	};
 	const struct ceu_fmt *ceu_fmt;
 	u32 mbus_code_old;
 	u32 mbus_code;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index f76afd8112b2..c15ae0218118 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -123,8 +123,8 @@ rkisp1_rsz_get_pad_fmt(struct rkisp1_resizer *rsz,
 		       unsigned int pad, u32 which)
 {
 	struct v4l2_subdev_state state = {
-		.pads = rsz->pad_cfg
-		};
+		.pads = rsz->pad_cfg,
+	};
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return v4l2_subdev_get_try_format(&rsz->sd, sd_state, pad);
 	else
@@ -137,8 +137,8 @@ rkisp1_rsz_get_pad_crop(struct rkisp1_resizer *rsz,
 			unsigned int pad, u32 which)
 {
 	struct v4l2_subdev_state state = {
-		.pads = rsz->pad_cfg
-		};
+		.pads = rsz->pad_cfg,
+	};
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return v4l2_subdev_get_try_crop(&rsz->sd, sd_state, pad);
 	else
@@ -366,7 +366,7 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
 	struct v4l2_subdev_pad_config dummy_cfg;
 	struct v4l2_subdev_state pad_state = {
 		.pads = &dummy_cfg
-		};
+	};
 	u32 pad = code->pad;
 	int ret;
 
@@ -733,8 +733,8 @@ static void rkisp1_rsz_unregister(struct rkisp1_resizer *rsz)
 static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
 {
 	struct v4l2_subdev_state state = {
-		.pads = rsz->pad_cfg
-		};
+		.pads = rsz->pad_cfg,
+	};
 	static const char * const dev_names[] = {
 		RKISP1_RSZ_MP_DEV_NAME,
 		RKISP1_RSZ_SP_DEV_NAME
diff --git a/drivers/media/platform/via/via-camera.c b/drivers/media/platform/via/via-camera.c
index 95483c84c3f2..0cd4d706afdc 100644
--- a/drivers/media/platform/via/via-camera.c
+++ b/drivers/media/platform/via/via-camera.c
@@ -845,8 +845,8 @@ static int viacam_do_try_fmt(struct via_camera *cam,
 	int ret;
 	struct v4l2_subdev_pad_config pad_cfg;
 	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
+		.pads = &pad_cfg,
+	};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 47f18ac5e40e..73a5ef9c97ec 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4254,8 +4254,8 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	struct v4l2_subdev_pad_config pad_cfg;
 	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
+		.pads = &pad_cfg,
+	};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -4882,8 +4882,8 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 	const struct atomisp_format_bridge *format;
 	struct v4l2_subdev_pad_config pad_cfg;
 	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
+		.pads = &pad_cfg,
+	};
 	struct v4l2_subdev_format vformat = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
diff --git a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
index 99e61bbfc9bc..0d48ae1bd71a 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
@@ -860,8 +860,8 @@ static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f,
 	struct v4l2_pix_format *pixfmt = &f->fmt.pix;
 	struct v4l2_subdev_pad_config pad_cfg = {};
 	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
+		.pads = &pad_cfg,
+	};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};

base-commit: 83e0f265aa8d0e37cc8e15d318b64da0ec03ff41
-- 
Regards,

Laurent Pinchart

