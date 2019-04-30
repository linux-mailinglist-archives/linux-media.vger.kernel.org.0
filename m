Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 135BB102C2
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2019 00:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbfD3Wud (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 18:50:33 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38443 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbfD3Wuc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 18:50:32 -0400
Received: by mail-pl1-f196.google.com with SMTP id a59so49931pla.5;
        Tue, 30 Apr 2019 15:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ezODg6p2RaUyIgygy5ezrvnYxzM6HJfuNXxj/MfO2qg=;
        b=LuY+lRxzxmdSwsBfo2P5vL4y6GnCGLn+EqMTY8g8z6OFCCungLaj2EyO5tuLbcDcyo
         BtN9sXsVhkYeyr68E+1kfJTDz+t9egbr0YffFgL3UvVKxSDeLBMFdhm5lFxlZHWAWjEX
         VFQrVZt1oZAcZLiGn/dz4hKW4xYCVca14SjRddwwdgLrWcXaHJBrFPI5uybjr8MnP7Mi
         yL20Ar5WaDJSRtOXeun+SCcJjfUfv2bkJ3jaIMjEY4mcVd8etYkqvBf0iwAxsUIA6sP1
         LF4hDhQyGN7deRe+FrC9RU0kj51xdKb4YkJKUQ9J5zWQbsyy6rcgVcUSi74UOKQMMYkQ
         wRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ezODg6p2RaUyIgygy5ezrvnYxzM6HJfuNXxj/MfO2qg=;
        b=e8ZTiG7AuYofAnXwd2qtsBnMEioHGskp1CzLgGP1ON3EXkDz7NU2r0AIHSfucOWyQC
         hPBo2v/xp7GEjTeA8TjWJTWrzH+TfIbAsh41CJkP1IcAgZTolqlAaFDxBlA+emsfi0CR
         H/s98sdnX07GJvohIiO3BmS4XG/ShCrYtDE8QUAt/SSmxMAMCSIMlRzHjlC9/BULSnnC
         nzxOzFKKsCg1OagNiToobVOpetE6jWrNusmfKgrs8mTH9IQFBtAxWaOGbq3YL4+Gps77
         wTVrvMk9rWUB/YYos72FWaWKXuW80dFTleLsRSpxjiNzJ4OW5q782Umykvd+npktR8jw
         dBzQ==
X-Gm-Message-State: APjAAAUltEHgIqlPJVFdYHENzYPJsq+fZrcfgvbMTg5tXhffEHmjW5Bl
        AcAPUdWlb/oX45u+QIb6XNUN11Go
X-Google-Smtp-Source: APXvYqz9iw6ZIYq4MlvduzMZjXpHUEDGabZyZYnL+H4HTGw3XgAaUBVkOtiT9CFLmEiOcW5OuZwgoQ==
X-Received: by 2002:a17:902:9048:: with SMTP id w8mr72298465plz.195.1556664629520;
        Tue, 30 Apr 2019 15:50:29 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id l23sm9804654pgj.36.2019.04.30.15.50.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 15:50:28 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/8] media: staging/imx: Switch to sync registration for IPU subdevs
Date:   Tue, 30 Apr 2019 15:50:11 -0700
Message-Id: <20190430225018.30252-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430225018.30252-1-slongerbeam@gmail.com>
References: <20190430225018.30252-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Because the IPU sub-devices VDIC and IC are not present in the
device-tree, platform devices were created for them instead. This
allowed these sub-devices to be added to the media device's async
notifier and registered asynchronously along with the other
sub-devices that do have a device-tree presence (CSI and devices
external to the IPU and SoC).

But that approach isn't really necessary. The IPU sub-devices don't
actually require a backing device (sd->dev is allowed to be NULL).
And that approach can't get around the fact that the IPU sub-devices
are not part of a device hierarchy, which makes it awkward to retrieve
the parent IPU of these devices.

By registering them synchronously, they can be registered from the CSI
async bound notifier, so the init function for them can be given the CSI
subdev, who's dev->parent is the IPU. That is a somewhat cleaner way
to retrieve the parent IPU.

So convert to synchronous registration for the VDIC and IC task
sub-devices, at the time a CSI sub-device is bound. There is no longer
a backing device for them (sd->dev is NULL), but that's ok. Also
set the VDIC/IC sub-device owner as the IPU, so that a reference can
be taken on the IPU module.

Since the VDIC and IC task drivers are no longer platform drivers,
they are now statically linked to imx-media module.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v3:
- statically link VDIC and IC task objects to imx-media module in
  Makefile.
---
 drivers/staging/media/imx/Makefile            |   6 +-
 drivers/staging/media/imx/imx-ic-common.c     |  70 ++--
 drivers/staging/media/imx/imx-ic-prp.c        |  34 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  70 ++--
 drivers/staging/media/imx/imx-ic.h            |   7 +-
 drivers/staging/media/imx/imx-media-capture.c |   7 +-
 drivers/staging/media/imx/imx-media-csi.c     |   2 +-
 drivers/staging/media/imx/imx-media-dev.c     | 121 +-----
 .../staging/media/imx/imx-media-internal-sd.c | 356 ++++++++----------
 drivers/staging/media/imx/imx-media-of.c      |  38 +-
 drivers/staging/media/imx/imx-media-vdic.c    |  85 ++---
 drivers/staging/media/imx/imx-media.h         |  67 ++--
 drivers/staging/media/imx/imx7-media-csi.c    |   3 +-
 13 files changed, 327 insertions(+), 539 deletions(-)

diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
index d2d909a36239..86f0c81b6a3b 100644
--- a/drivers/staging/media/imx/Makefile
+++ b/drivers/staging/media/imx/Makefile
@@ -1,14 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
-imx-media-objs := imx-media-dev.o imx-media-internal-sd.o imx-media-of.o
+imx-media-objs := imx-media-dev.o imx-media-internal-sd.o imx-media-of.o \
+	imx-ic-common.o imx-ic-prp.o imx-ic-prpencvf.o imx-media-vdic.o
 imx-media-objs += imx-media-dev-common.o
 imx-media-common-objs := imx-media-utils.o imx-media-fim.o
-imx-media-ic-objs := imx-ic-common.o imx-ic-prp.o imx-ic-prpencvf.o
 
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media.o
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-capture.o
-obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-vdic.o
-obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-ic.o
 
 obj-$(CONFIG_VIDEO_IMX_CSI) += imx-media-csi.o
 obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
diff --git a/drivers/staging/media/imx/imx-ic-common.c b/drivers/staging/media/imx/imx-ic-common.c
index 1addb0893c57..ad0c291db03c 100644
--- a/drivers/staging/media/imx/imx-ic-common.c
+++ b/drivers/staging/media/imx/imx-ic-common.c
@@ -8,8 +8,6 @@
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
  */
-#include <linux/module.h>
-#include <linux/platform_device.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-subdev.h>
 #include "imx-media.h"
@@ -24,23 +22,25 @@ static struct imx_ic_ops *ic_ops[IC_NUM_OPS] = {
 	[IC_TASK_VIEWFINDER]     = &imx_ic_prpencvf_ops,
 };
 
-static int imx_ic_probe(struct platform_device *pdev)
+struct v4l2_subdev *imx_media_ic_register(struct imx_media_dev *imxmd,
+					  struct device *ipu_dev,
+					  struct ipu_soc *ipu,
+					  u32 grp_id)
 {
-	struct imx_media_ipu_internal_sd_pdata *pdata;
+	struct v4l2_device *v4l2_dev = &imxmd->v4l2_dev;
 	struct imx_ic_priv *priv;
 	int ret;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(ipu_dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
-	platform_set_drvdata(pdev, &priv->sd);
-	priv->dev = &pdev->dev;
+	priv->ipu_dev = ipu_dev;
+	priv->ipu = ipu;
+	priv->md = imxmd;
 
-	/* get our ipu_id, grp_id and IC task id */
-	pdata = priv->dev->platform_data;
-	priv->ipu_id = pdata->ipu_id;
-	switch (pdata->grp_id) {
+	/* get our IC task id */
+	switch (grp_id) {
 	case IMX_MEDIA_GRP_ID_IPU_IC_PRP:
 		priv->task_id = IC_TASK_PRP;
 		break;
@@ -51,7 +51,7 @@ static int imx_ic_probe(struct platform_device *pdev)
 		priv->task_id = IC_TASK_VIEWFINDER;
 		break;
 	default:
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	v4l2_subdev_init(&priv->sd, ic_ops[priv->task_id]->subdev_ops);
@@ -59,55 +59,35 @@ static int imx_ic_probe(struct platform_device *pdev)
 	priv->sd.internal_ops = ic_ops[priv->task_id]->internal_ops;
 	priv->sd.entity.ops = ic_ops[priv->task_id]->entity_ops;
 	priv->sd.entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
-	priv->sd.dev = &pdev->dev;
-	priv->sd.owner = THIS_MODULE;
+	priv->sd.owner = ipu_dev->driver->owner;
 	priv->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
-	priv->sd.grp_id = pdata->grp_id;
-	strscpy(priv->sd.name, pdata->sd_name, sizeof(priv->sd.name));
+	priv->sd.grp_id = grp_id;
+	imx_media_grp_id_to_sd_name(priv->sd.name, sizeof(priv->sd.name),
+				    priv->sd.grp_id, ipu_get_num(ipu));
 
 	ret = ic_ops[priv->task_id]->init(priv);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
-	ret = v4l2_async_register_subdev(&priv->sd);
-	if (ret)
+	ret = v4l2_device_register_subdev(v4l2_dev, &priv->sd);
+	if (ret) {
 		ic_ops[priv->task_id]->remove(priv);
+		return ERR_PTR(ret);
+	}
 
-	return ret;
+	return &priv->sd;
 }
 
-static int imx_ic_remove(struct platform_device *pdev)
+int imx_media_ic_unregister(struct v4l2_subdev *sd)
 {
-	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
 	struct imx_ic_priv *priv = container_of(sd, struct imx_ic_priv, sd);
 
 	v4l2_info(sd, "Removing\n");
 
 	ic_ops[priv->task_id]->remove(priv);
 
-	v4l2_async_unregister_subdev(sd);
+	v4l2_device_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 
 	return 0;
 }
-
-static const struct platform_device_id imx_ic_ids[] = {
-	{ .name = "imx-ipuv3-ic" },
-	{ },
-};
-MODULE_DEVICE_TABLE(platform, imx_ic_ids);
-
-static struct platform_driver imx_ic_driver = {
-	.probe = imx_ic_probe,
-	.remove = imx_ic_remove,
-	.id_table = imx_ic_ids,
-	.driver = {
-		.name = "imx-ipuv3-ic",
-	},
-};
-module_platform_driver(imx_ic_driver);
-
-MODULE_DESCRIPTION("i.MX IC subdev driver");
-MODULE_AUTHOR("Steve Longerbeam <steve_longerbeam@mentor.com>");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:imx-ipuv3-ic");
diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 3d43cdcb4bb9..663db200e594 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -39,16 +39,12 @@
 #define S_ALIGN    1 /* multiple of 2 */
 
 struct prp_priv {
-	struct imx_media_dev *md;
 	struct imx_ic_priv *ic_priv;
 	struct media_pad pad[PRP_NUM_PADS];
 
 	/* lock to protect all members below */
 	struct mutex lock;
 
-	/* IPU units we require */
-	struct ipu_soc *ipu;
-
 	struct v4l2_subdev *src_sd;
 	struct v4l2_subdev *sink_sd_prpenc;
 	struct v4l2_subdev *sink_sd_prpvf;
@@ -66,7 +62,7 @@ static inline struct prp_priv *sd_to_priv(struct v4l2_subdev *sd)
 {
 	struct imx_ic_priv *ic_priv = v4l2_get_subdevdata(sd);
 
-	return ic_priv->prp_priv;
+	return ic_priv->task_priv;
 }
 
 static int prp_start(struct prp_priv *priv)
@@ -74,12 +70,10 @@ static int prp_start(struct prp_priv *priv)
 	struct imx_ic_priv *ic_priv = priv->ic_priv;
 	bool src_is_vdic;
 
-	priv->ipu = priv->md->ipu[ic_priv->ipu_id];
-
 	/* set IC to receive from CSI or VDI depending on source */
 	src_is_vdic = !!(priv->src_sd->grp_id & IMX_MEDIA_GRP_ID_IPU_VDIC);
 
-	ipu_set_ic_src_mux(priv->ipu, priv->csi_id, src_is_vdic);
+	ipu_set_ic_src_mux(ic_priv->ipu, priv->csi_id, src_is_vdic);
 
 	return 0;
 }
@@ -220,12 +214,12 @@ static int prp_link_setup(struct media_entity *entity,
 {
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
 	struct imx_ic_priv *ic_priv = v4l2_get_subdevdata(sd);
-	struct prp_priv *priv = ic_priv->prp_priv;
+	struct prp_priv *priv = ic_priv->task_priv;
 	struct v4l2_subdev *remote_sd;
 	int ret = 0;
 
-	dev_dbg(ic_priv->dev, "link setup %s -> %s", remote->entity->name,
-		local->entity->name);
+	dev_dbg(ic_priv->ipu_dev, "%s: link setup %s -> %s",
+		ic_priv->sd.name, remote->entity->name, local->entity->name);
 
 	remote_sd = media_entity_to_v4l2_subdev(remote->entity);
 
@@ -299,7 +293,7 @@ static int prp_link_validate(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_format *sink_fmt)
 {
 	struct imx_ic_priv *ic_priv = v4l2_get_subdevdata(sd);
-	struct prp_priv *priv = ic_priv->prp_priv;
+	struct prp_priv *priv = ic_priv->task_priv;
 	struct v4l2_subdev *csi;
 	int ret;
 
@@ -308,7 +302,7 @@ static int prp_link_validate(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	csi = imx_media_find_upstream_subdev(priv->md, &ic_priv->sd.entity,
+	csi = imx_media_find_upstream_subdev(ic_priv->md, &ic_priv->sd.entity,
 					     IMX_MEDIA_GRP_ID_IPU_CSI);
 	if (IS_ERR(csi))
 		csi = NULL;
@@ -355,7 +349,7 @@ static int prp_link_validate(struct v4l2_subdev *sd,
 static int prp_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx_ic_priv *ic_priv = v4l2_get_subdevdata(sd);
-	struct prp_priv *priv = ic_priv->prp_priv;
+	struct prp_priv *priv = ic_priv->task_priv;
 	int ret = 0;
 
 	mutex_lock(&priv->lock);
@@ -372,7 +366,8 @@ static int prp_s_stream(struct v4l2_subdev *sd, int enable)
 	if (priv->stream_count != !enable)
 		goto update_count;
 
-	dev_dbg(ic_priv->dev, "stream %s\n", enable ? "ON" : "OFF");
+	dev_dbg(ic_priv->ipu_dev, "%s: stream %s\n", sd->name,
+		enable ? "ON" : "OFF");
 
 	if (enable)
 		ret = prp_start(priv);
@@ -444,9 +439,6 @@ static int prp_registered(struct v4l2_subdev *sd)
 	int i, ret;
 	u32 code;
 
-	/* get media device */
-	priv->md = dev_get_drvdata(sd->v4l2_dev->dev);
-
 	for (i = 0; i < PRP_NUM_PADS; i++) {
 		priv->pad[i].flags = (i == PRP_SINK_PAD) ?
 			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
@@ -498,12 +490,12 @@ static int prp_init(struct imx_ic_priv *ic_priv)
 {
 	struct prp_priv *priv;
 
-	priv = devm_kzalloc(ic_priv->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(ic_priv->ipu_dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	mutex_init(&priv->lock);
-	ic_priv->prp_priv = priv;
+	ic_priv->task_priv = priv;
 	priv->ic_priv = ic_priv;
 
 	return 0;
@@ -511,7 +503,7 @@ static int prp_init(struct imx_ic_priv *ic_priv)
 
 static void prp_remove(struct imx_ic_priv *ic_priv)
 {
-	struct prp_priv *priv = ic_priv->prp_priv;
+	struct prp_priv *priv = ic_priv->task_priv;
 
 	mutex_destroy(&priv->lock);
 }
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 5c8e6ad8c025..069cce512280 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -54,7 +54,6 @@
 #define S_ALIGN       1 /* multiple of 2 */
 
 struct prp_priv {
-	struct imx_media_dev *md;
 	struct imx_ic_priv *ic_priv;
 	struct media_pad pad[PRPENCVF_NUM_PADS];
 	/* the video device at output pad */
@@ -64,7 +63,6 @@ struct prp_priv {
 	struct mutex lock;
 
 	/* IPU units we require */
-	struct ipu_soc *ipu;
 	struct ipu_ic *ic;
 	struct ipuv3_channel *out_ch;
 	struct ipuv3_channel *rot_in_ch;
@@ -160,9 +158,7 @@ static int prp_get_ipu_resources(struct prp_priv *priv)
 	struct ipuv3_channel *out_ch, *rot_in_ch, *rot_out_ch;
 	int ret, task = ic_priv->task_id;
 
-	priv->ipu = priv->md->ipu[ic_priv->ipu_id];
-
-	ic = ipu_ic_get(priv->ipu, task);
+	ic = ipu_ic_get(ic_priv->ipu, task);
 	if (IS_ERR(ic)) {
 		v4l2_err(&ic_priv->sd, "failed to get IC\n");
 		ret = PTR_ERR(ic);
@@ -170,7 +166,7 @@ static int prp_get_ipu_resources(struct prp_priv *priv)
 	}
 	priv->ic = ic;
 
-	out_ch = ipu_idmac_get(priv->ipu, prp_channel[task].out_ch);
+	out_ch = ipu_idmac_get(ic_priv->ipu, prp_channel[task].out_ch);
 	if (IS_ERR(out_ch)) {
 		v4l2_err(&ic_priv->sd, "could not get IDMAC channel %u\n",
 			 prp_channel[task].out_ch);
@@ -179,7 +175,7 @@ static int prp_get_ipu_resources(struct prp_priv *priv)
 	}
 	priv->out_ch = out_ch;
 
-	rot_in_ch = ipu_idmac_get(priv->ipu, prp_channel[task].rot_in_ch);
+	rot_in_ch = ipu_idmac_get(ic_priv->ipu, prp_channel[task].rot_in_ch);
 	if (IS_ERR(rot_in_ch)) {
 		v4l2_err(&ic_priv->sd, "could not get IDMAC channel %u\n",
 			 prp_channel[task].rot_in_ch);
@@ -188,7 +184,7 @@ static int prp_get_ipu_resources(struct prp_priv *priv)
 	}
 	priv->rot_in_ch = rot_in_ch;
 
-	rot_out_ch = ipu_idmac_get(priv->ipu, prp_channel[task].rot_out_ch);
+	rot_out_ch = ipu_idmac_get(ic_priv->ipu, prp_channel[task].rot_out_ch);
 	if (IS_ERR(rot_out_ch)) {
 		v4l2_err(&ic_priv->sd, "could not get IDMAC channel %u\n",
 			 prp_channel[task].rot_out_ch);
@@ -468,13 +464,13 @@ static int prp_setup_rotation(struct prp_priv *priv)
 	incc = priv->cc[PRPENCVF_SINK_PAD];
 	outcc = vdev->cc;
 
-	ret = imx_media_alloc_dma_buf(priv->md, &priv->rot_buf[0],
+	ret = imx_media_alloc_dma_buf(ic_priv->md, &priv->rot_buf[0],
 				      outfmt->sizeimage);
 	if (ret) {
 		v4l2_err(&ic_priv->sd, "failed to alloc rot_buf[0], %d\n", ret);
 		return ret;
 	}
-	ret = imx_media_alloc_dma_buf(priv->md, &priv->rot_buf[1],
+	ret = imx_media_alloc_dma_buf(ic_priv->md, &priv->rot_buf[1],
 				      outfmt->sizeimage);
 	if (ret) {
 		v4l2_err(&ic_priv->sd, "failed to alloc rot_buf[1], %d\n", ret);
@@ -547,14 +543,16 @@ static int prp_setup_rotation(struct prp_priv *priv)
 unsetup_vb2:
 	prp_unsetup_vb2_buf(priv, VB2_BUF_STATE_QUEUED);
 free_rot1:
-	imx_media_free_dma_buf(priv->md, &priv->rot_buf[1]);
+	imx_media_free_dma_buf(ic_priv->md, &priv->rot_buf[1]);
 free_rot0:
-	imx_media_free_dma_buf(priv->md, &priv->rot_buf[0]);
+	imx_media_free_dma_buf(ic_priv->md, &priv->rot_buf[0]);
 	return ret;
 }
 
 static void prp_unsetup_rotation(struct prp_priv *priv)
 {
+	struct imx_ic_priv *ic_priv = priv->ic_priv;
+
 	ipu_ic_task_disable(priv->ic);
 
 	ipu_idmac_disable_channel(priv->out_ch);
@@ -565,8 +563,8 @@ static void prp_unsetup_rotation(struct prp_priv *priv)
 
 	ipu_ic_disable(priv->ic);
 
-	imx_media_free_dma_buf(priv->md, &priv->rot_buf[0]);
-	imx_media_free_dma_buf(priv->md, &priv->rot_buf[1]);
+	imx_media_free_dma_buf(ic_priv->md, &priv->rot_buf[0]);
+	imx_media_free_dma_buf(ic_priv->md, &priv->rot_buf[1]);
 }
 
 static int prp_setup_norotation(struct prp_priv *priv)
@@ -606,7 +604,7 @@ static int prp_setup_norotation(struct prp_priv *priv)
 
 	ipu_cpmem_dump(priv->out_ch);
 	ipu_ic_dump(priv->ic);
-	ipu_dump(priv->ipu);
+	ipu_dump(ic_priv->ipu);
 
 	ipu_ic_enable(priv->ic);
 
@@ -658,7 +656,7 @@ static int prp_start(struct prp_priv *priv)
 
 	outfmt = &vdev->fmt.fmt.pix;
 
-	ret = imx_media_alloc_dma_buf(priv->md, &priv->underrun_buf,
+	ret = imx_media_alloc_dma_buf(ic_priv->md, &priv->underrun_buf,
 				      outfmt->sizeimage);
 	if (ret)
 		goto out_put_ipu;
@@ -678,10 +676,10 @@ static int prp_start(struct prp_priv *priv)
 	if (ret)
 		goto out_free_underrun;
 
-	priv->nfb4eof_irq = ipu_idmac_channel_irq(priv->ipu,
+	priv->nfb4eof_irq = ipu_idmac_channel_irq(ic_priv->ipu,
 						  priv->out_ch,
 						  IPU_IRQ_NFB4EOF);
-	ret = devm_request_irq(ic_priv->dev, priv->nfb4eof_irq,
+	ret = devm_request_irq(ic_priv->ipu_dev, priv->nfb4eof_irq,
 			       prp_nfb4eof_interrupt, 0,
 			       "imx-ic-prp-nfb4eof", priv);
 	if (ret) {
@@ -692,12 +690,12 @@ static int prp_start(struct prp_priv *priv)
 
 	if (ipu_rot_mode_is_irt(priv->rot_mode))
 		priv->eof_irq = ipu_idmac_channel_irq(
-			priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
+			ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
 	else
 		priv->eof_irq = ipu_idmac_channel_irq(
-			priv->ipu, priv->out_ch, IPU_IRQ_EOF);
+			ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
 
-	ret = devm_request_irq(ic_priv->dev, priv->eof_irq,
+	ret = devm_request_irq(ic_priv->ipu_dev, priv->eof_irq,
 			       prp_eof_interrupt, 0,
 			       "imx-ic-prp-eof", priv);
 	if (ret) {
@@ -722,13 +720,13 @@ static int prp_start(struct prp_priv *priv)
 	return 0;
 
 out_free_eof_irq:
-	devm_free_irq(ic_priv->dev, priv->eof_irq, priv);
+	devm_free_irq(ic_priv->ipu_dev, priv->eof_irq, priv);
 out_free_nfb4eof_irq:
-	devm_free_irq(ic_priv->dev, priv->nfb4eof_irq, priv);
+	devm_free_irq(ic_priv->ipu_dev, priv->nfb4eof_irq, priv);
 out_unsetup:
 	prp_unsetup(priv, VB2_BUF_STATE_QUEUED);
 out_free_underrun:
-	imx_media_free_dma_buf(priv->md, &priv->underrun_buf);
+	imx_media_free_dma_buf(ic_priv->md, &priv->underrun_buf);
 out_put_ipu:
 	prp_put_ipu_resources(priv);
 	return ret;
@@ -760,12 +758,12 @@ static void prp_stop(struct prp_priv *priv)
 		v4l2_warn(&ic_priv->sd,
 			  "upstream stream off failed: %d\n", ret);
 
-	devm_free_irq(ic_priv->dev, priv->eof_irq, priv);
-	devm_free_irq(ic_priv->dev, priv->nfb4eof_irq, priv);
+	devm_free_irq(ic_priv->ipu_dev, priv->eof_irq, priv);
+	devm_free_irq(ic_priv->ipu_dev, priv->nfb4eof_irq, priv);
 
 	prp_unsetup(priv, VB2_BUF_STATE_ERROR);
 
-	imx_media_free_dma_buf(priv->md, &priv->underrun_buf);
+	imx_media_free_dma_buf(ic_priv->md, &priv->underrun_buf);
 
 	/* cancel the EOF timeout timer */
 	del_timer_sync(&priv->eof_timeout_timer);
@@ -1015,8 +1013,8 @@ static int prp_link_setup(struct media_entity *entity,
 	struct v4l2_subdev *remote_sd;
 	int ret = 0;
 
-	dev_dbg(ic_priv->dev, "link setup %s -> %s", remote->entity->name,
-		local->entity->name);
+	dev_dbg(ic_priv->ipu_dev, "%s: link setup %s -> %s",
+		ic_priv->sd.name, remote->entity->name, local->entity->name);
 
 	mutex_lock(&priv->lock);
 
@@ -1182,7 +1180,8 @@ static int prp_s_stream(struct v4l2_subdev *sd, int enable)
 	if (priv->stream_count != !enable)
 		goto update_count;
 
-	dev_dbg(ic_priv->dev, "stream %s\n", enable ? "ON" : "OFF");
+	dev_dbg(ic_priv->ipu_dev, "%s: stream %s\n", sd->name,
+		enable ? "ON" : "OFF");
 
 	if (enable)
 		ret = prp_start(priv);
@@ -1242,12 +1241,10 @@ static int prp_s_frame_interval(struct v4l2_subdev *sd,
 static int prp_registered(struct v4l2_subdev *sd)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
+	struct imx_ic_priv *ic_priv = priv->ic_priv;
 	int i, ret;
 	u32 code;
 
-	/* get media device */
-	priv->md = dev_get_drvdata(sd->v4l2_dev->dev);
-
 	for (i = 0; i < PRPENCVF_NUM_PADS; i++) {
 		priv->pad[i].flags = (i == PRPENCVF_SINK_PAD) ?
 			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
@@ -1274,7 +1271,7 @@ static int prp_registered(struct v4l2_subdev *sd)
 	if (ret)
 		return ret;
 
-	ret = imx_media_add_video_device(priv->md, priv->vdev);
+	ret = imx_media_add_video_device(ic_priv->md, priv->vdev);
 	if (ret)
 		goto unreg;
 
@@ -1329,7 +1326,7 @@ static int prp_init(struct imx_ic_priv *ic_priv)
 {
 	struct prp_priv *priv;
 
-	priv = devm_kzalloc(ic_priv->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(ic_priv->ipu_dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
@@ -1339,7 +1336,8 @@ static int prp_init(struct imx_ic_priv *ic_priv)
 	spin_lock_init(&priv->irqlock);
 	timer_setup(&priv->eof_timeout_timer, prp_eof_timeout, 0);
 
-	priv->vdev = imx_media_capture_device_init(&ic_priv->sd,
+	priv->vdev = imx_media_capture_device_init(ic_priv->ipu_dev,
+						   &ic_priv->sd,
 						   PRPENCVF_SRC_PAD);
 	if (IS_ERR(priv->vdev))
 		return PTR_ERR(priv->vdev);
diff --git a/drivers/staging/media/imx/imx-ic.h b/drivers/staging/media/imx/imx-ic.h
index 6b2267bda8ab..1dcbb37aeada 100644
--- a/drivers/staging/media/imx/imx-ic.h
+++ b/drivers/staging/media/imx/imx-ic.h
@@ -14,11 +14,11 @@
 #include <media/v4l2-subdev.h>
 
 struct imx_ic_priv {
-	struct device *dev;
+	struct device *ipu_dev;
+	struct ipu_soc *ipu;
+	struct imx_media_dev *md;
 	struct v4l2_subdev sd;
-	int    ipu_id;
 	int    task_id;
-	void   *prp_priv;
 	void   *task_priv;
 };
 
@@ -33,6 +33,5 @@ struct imx_ic_ops {
 
 extern struct imx_ic_ops imx_ic_prp_ops;
 extern struct imx_ic_ops imx_ic_prpencvf_ops;
-extern struct imx_ic_ops imx_ic_pp_ops;
 
 #endif
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 9703c85b19c4..211ec4df2066 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -804,18 +804,19 @@ void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev)
 EXPORT_SYMBOL_GPL(imx_media_capture_device_unregister);
 
 struct imx_media_video_dev *
-imx_media_capture_device_init(struct v4l2_subdev *src_sd, int pad)
+imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
+			      int pad)
 {
 	struct capture_priv *priv;
 	struct video_device *vfd;
 
-	priv = devm_kzalloc(src_sd->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return ERR_PTR(-ENOMEM);
 
 	priv->src_sd = src_sd;
 	priv->src_sd_pad = pad;
-	priv->dev = src_sd->dev;
+	priv->dev = dev;
 
 	mutex_init(&priv->mutex);
 	spin_lock_init(&priv->q_lock);
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 41965d8b56c4..93b107eab5f5 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1987,7 +1987,7 @@ static int imx_csi_probe(struct platform_device *pdev)
 	imx_media_grp_id_to_sd_name(priv->sd.name, sizeof(priv->sd.name),
 				    priv->sd.grp_id, ipu_get_num(priv->ipu));
 
-	priv->vdev = imx_media_capture_device_init(&priv->sd,
+	priv->vdev = imx_media_capture_device_init(priv->sd.dev, &priv->sd,
 						   CSI_SRC_PAD_IDMAC);
 	if (IS_ERR(priv->vdev))
 		return PTR_ERR(priv->vdev);
diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
index 0a7d1d183141..55181756a940 100644
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@ -32,111 +32,24 @@ static inline struct imx_media_dev *notifier2dev(struct v4l2_async_notifier *n)
 	return container_of(n, struct imx_media_dev, notifier);
 }
 
-/*
- * Adds a subdev to the root notifier's async subdev list. If fwnode is
- * non-NULL, adds the async as a V4L2_ASYNC_MATCH_FWNODE match type,
- * otherwise as a V4L2_ASYNC_MATCH_DEVNAME match type using the dev_name
- * of the given platform_device. This is called during driver load when
- * forming the async subdev list.
- */
-int imx_media_add_async_subdev(struct imx_media_dev *imxmd,
-			       struct fwnode_handle *fwnode,
-			       struct platform_device *pdev)
-{
-	struct device_node *np = to_of_node(fwnode);
-	struct imx_media_async_subdev *imxasd;
-	struct v4l2_async_subdev *asd;
-	const char *devname = NULL;
-	int ret;
-
-	if (fwnode) {
-		asd = v4l2_async_notifier_add_fwnode_subdev(&imxmd->notifier,
-							    fwnode,
-							    sizeof(*imxasd));
-	} else {
-		devname = dev_name(&pdev->dev);
-		asd = v4l2_async_notifier_add_devname_subdev(&imxmd->notifier,
-							     devname,
-							     sizeof(*imxasd));
-	}
-
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
-		if (ret == -EEXIST) {
-			if (np)
-				dev_dbg(imxmd->md.dev, "%s: already added %pOFn\n",
-					__func__, np);
-			else
-				dev_dbg(imxmd->md.dev, "%s: already added %s\n",
-					__func__, devname);
-		}
-		return ret;
-	}
-
-	imxasd = to_imx_media_asd(asd);
-
-	if (devname)
-		imxasd->pdev = pdev;
-
-	if (np)
-		dev_dbg(imxmd->md.dev, "%s: added %pOFn, match type FWNODE\n",
-			__func__, np);
-	else
-		dev_dbg(imxmd->md.dev, "%s: added %s, match type DEVNAME\n",
-			__func__, devname);
-
-	return 0;
-}
-
-/*
- * get IPU from this CSI and add it to the list of IPUs
- * the media driver will control.
- */
-static int imx_media_get_ipu(struct imx_media_dev *imxmd,
-			     struct v4l2_subdev *csi_sd)
-{
-	struct ipu_soc *ipu;
-	int ipu_id;
-
-	ipu = dev_get_drvdata(csi_sd->dev->parent);
-	if (!ipu) {
-		v4l2_err(&imxmd->v4l2_dev,
-			 "CSI %s has no parent IPU!\n", csi_sd->name);
-		return -ENODEV;
-	}
-
-	ipu_id = ipu_get_num(ipu);
-	if (ipu_id > 1) {
-		v4l2_err(&imxmd->v4l2_dev, "invalid IPU id %d!\n", ipu_id);
-		return -ENODEV;
-	}
-
-	if (!imxmd->ipu[ipu_id])
-		imxmd->ipu[ipu_id] = ipu;
-
-	return 0;
-}
-
 /* async subdev bound notifier */
 int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
 			   struct v4l2_subdev *sd,
 			   struct v4l2_async_subdev *asd)
 {
 	struct imx_media_dev *imxmd = notifier2dev(notifier);
-	int ret = 0;
-
-	mutex_lock(&imxmd->mutex);
+	int ret;
 
 	if (sd->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI) {
-		ret = imx_media_get_ipu(imxmd, sd);
+		/* register the IPU internal subdevs */
+		ret = imx_media_register_ipu_internal_subdevs(imxmd, sd);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
 	v4l2_info(&imxmd->v4l2_dev, "subdev %s bound\n", sd->name);
-out:
-	mutex_unlock(&imxmd->mutex);
-	return ret;
+
+	return 0;
 }
 
 /*
@@ -147,7 +60,6 @@ static int imx_media_create_links(struct v4l2_async_notifier *notifier)
 {
 	struct imx_media_dev *imxmd = notifier2dev(notifier);
 	struct v4l2_subdev *sd;
-	int ret;
 
 	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
 		switch (sd->grp_id) {
@@ -155,22 +67,15 @@ static int imx_media_create_links(struct v4l2_async_notifier *notifier)
 		case IMX_MEDIA_GRP_ID_IPU_IC_PRP:
 		case IMX_MEDIA_GRP_ID_IPU_IC_PRPENC:
 		case IMX_MEDIA_GRP_ID_IPU_IC_PRPVF:
-		case IMX_MEDIA_GRP_ID_IPU_CSI0:
-		case IMX_MEDIA_GRP_ID_IPU_CSI1:
-			ret = imx_media_create_ipu_internal_links(imxmd, sd);
-			if (ret)
-				return ret;
 			/*
-			 * the CSIs straddle between the external and the IPU
-			 * internal entities, so create the external links
-			 * to the CSI sink pads.
+			 * links have already been created for the
+			 * sync-registered subdevs.
 			 */
-			if (sd->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI)
-				imx_media_create_csi_of_links(imxmd, sd);
 			break;
+		case IMX_MEDIA_GRP_ID_IPU_CSI0:
+		case IMX_MEDIA_GRP_ID_IPU_CSI1:
 		case IMX_MEDIA_GRP_ID_CSI:
 			imx_media_create_csi_of_links(imxmd, sd);
-
 			break;
 		default:
 			/*
@@ -480,12 +385,10 @@ static int imx_media_probe(struct platform_device *pdev)
 
 	ret = imx_media_dev_notifier_register(imxmd);
 	if (ret)
-		goto del_int;
+		goto cleanup;
 
 	return 0;
 
-del_int:
-	imx_media_remove_ipu_internal_subdevs(imxmd);
 cleanup:
 	v4l2_async_notifier_cleanup(&imxmd->notifier);
 	v4l2_device_unregister(&imxmd->v4l2_dev);
@@ -502,7 +405,7 @@ static int imx_media_remove(struct platform_device *pdev)
 	v4l2_info(&imxmd->v4l2_dev, "Removing imx-media\n");
 
 	v4l2_async_notifier_unregister(&imxmd->notifier);
-	imx_media_remove_ipu_internal_subdevs(imxmd);
+	imx_media_unregister_ipu_internal_subdevs(imxmd);
 	v4l2_async_notifier_cleanup(&imxmd->notifier);
 	media_device_unregister(&imxmd->md);
 	v4l2_device_unregister(&imxmd->v4l2_dev);
diff --git a/drivers/staging/media/imx/imx-media-internal-sd.c b/drivers/staging/media/imx/imx-media-internal-sd.c
index dc510dcfe160..618a930da37c 100644
--- a/drivers/staging/media/imx/imx-media-internal-sd.c
+++ b/drivers/staging/media/imx/imx-media-internal-sd.c
@@ -13,208 +13,138 @@
 #include <linux/platform_device.h>
 #include "imx-media.h"
 
-enum isd_enum {
-	isd_csi0 = 0,
-	isd_csi1,
-	isd_vdic,
-	isd_ic_prp,
-	isd_ic_prpenc,
-	isd_ic_prpvf,
-	num_isd,
-};
-
-static const struct internal_subdev_id {
-	enum isd_enum index;
-	const char *name;
-	u32 grp_id;
-} isd_id[num_isd] = {
-	[isd_csi0] = {
-		.index = isd_csi0,
-		.grp_id = IMX_MEDIA_GRP_ID_IPU_CSI0,
-		.name = "imx-ipuv3-csi",
-	},
-	[isd_csi1] = {
-		.index = isd_csi1,
-		.grp_id = IMX_MEDIA_GRP_ID_IPU_CSI1,
-		.name = "imx-ipuv3-csi",
-	},
-	[isd_vdic] = {
-		.index = isd_vdic,
-		.grp_id = IMX_MEDIA_GRP_ID_IPU_VDIC,
-		.name = "imx-ipuv3-vdic",
-	},
-	[isd_ic_prp] = {
-		.index = isd_ic_prp,
-		.grp_id = IMX_MEDIA_GRP_ID_IPU_IC_PRP,
-		.name = "imx-ipuv3-ic",
-	},
-	[isd_ic_prpenc] = {
-		.index = isd_ic_prpenc,
-		.grp_id = IMX_MEDIA_GRP_ID_IPU_IC_PRPENC,
-		.name = "imx-ipuv3-ic",
-	},
-	[isd_ic_prpvf] = {
-		.index = isd_ic_prpvf,
-		.grp_id = IMX_MEDIA_GRP_ID_IPU_IC_PRPVF,
-		.name = "imx-ipuv3-ic",
-	},
-};
+/* max pads per internal-sd */
+#define MAX_INTERNAL_PADS   8
+/* max links per internal-sd pad */
+#define MAX_INTERNAL_LINKS  8
 
 struct internal_subdev;
 
 struct internal_link {
-	const struct internal_subdev *remote;
+	int remote;
 	int local_pad;
 	int remote_pad;
 };
 
-/* max pads per internal-sd */
-#define MAX_INTERNAL_PADS   8
-/* max links per internal-sd pad */
-#define MAX_INTERNAL_LINKS  8
-
 struct internal_pad {
+	int num_links;
 	struct internal_link link[MAX_INTERNAL_LINKS];
 };
 
-static const struct internal_subdev {
-	const struct internal_subdev_id *id;
+struct internal_subdev {
+	u32 grp_id;
 	struct internal_pad pad[MAX_INTERNAL_PADS];
-} int_subdev[num_isd] = {
-	[isd_csi0] = {
-		.id = &isd_id[isd_csi0],
+
+	struct v4l2_subdev * (*sync_register)(struct imx_media_dev *imxmd,
+					      struct device *ipu_dev,
+					      struct ipu_soc *ipu,
+					      u32 grp_id);
+	int (*sync_unregister)(struct v4l2_subdev *sd);
+};
+
+static const struct internal_subdev int_subdev[NUM_IPU_SUBDEVS] = {
+	[IPU_CSI0] = {
+		.grp_id = IMX_MEDIA_GRP_ID_IPU_CSI0,
 		.pad[CSI_SRC_PAD_DIRECT] = {
+			.num_links = 2,
 			.link = {
 				{
 					.local_pad = CSI_SRC_PAD_DIRECT,
-					.remote = &int_subdev[isd_ic_prp],
+					.remote = IPU_IC_PRP,
 					.remote_pad = PRP_SINK_PAD,
 				}, {
 					.local_pad = CSI_SRC_PAD_DIRECT,
-					.remote = &int_subdev[isd_vdic],
+					.remote = IPU_VDIC,
 					.remote_pad = VDIC_SINK_PAD_DIRECT,
 				},
 			},
 		},
 	},
 
-	[isd_csi1] = {
-		.id = &isd_id[isd_csi1],
+	[IPU_CSI1] = {
+		.grp_id = IMX_MEDIA_GRP_ID_IPU_CSI1,
 		.pad[CSI_SRC_PAD_DIRECT] = {
+			.num_links = 2,
 			.link = {
 				{
 					.local_pad = CSI_SRC_PAD_DIRECT,
-					.remote = &int_subdev[isd_ic_prp],
+					.remote = IPU_IC_PRP,
 					.remote_pad = PRP_SINK_PAD,
 				}, {
 					.local_pad = CSI_SRC_PAD_DIRECT,
-					.remote = &int_subdev[isd_vdic],
+					.remote = IPU_VDIC,
 					.remote_pad = VDIC_SINK_PAD_DIRECT,
 				},
 			},
 		},
 	},
 
-	[isd_vdic] = {
-		.id = &isd_id[isd_vdic],
+	[IPU_VDIC] = {
+		.grp_id = IMX_MEDIA_GRP_ID_IPU_VDIC,
+		.sync_register = imx_media_vdic_register,
+		.sync_unregister = imx_media_vdic_unregister,
 		.pad[VDIC_SRC_PAD_DIRECT] = {
+			.num_links = 1,
 			.link = {
 				{
 					.local_pad = VDIC_SRC_PAD_DIRECT,
-					.remote = &int_subdev[isd_ic_prp],
+					.remote = IPU_IC_PRP,
 					.remote_pad = PRP_SINK_PAD,
 				},
 			},
 		},
 	},
 
-	[isd_ic_prp] = {
-		.id = &isd_id[isd_ic_prp],
+	[IPU_IC_PRP] = {
+		.grp_id = IMX_MEDIA_GRP_ID_IPU_IC_PRP,
+		.sync_register = imx_media_ic_register,
+		.sync_unregister = imx_media_ic_unregister,
 		.pad[PRP_SRC_PAD_PRPENC] = {
+			.num_links = 1,
 			.link = {
 				{
 					.local_pad = PRP_SRC_PAD_PRPENC,
-					.remote = &int_subdev[isd_ic_prpenc],
-					.remote_pad = 0,
+					.remote = IPU_IC_PRPENC,
+					.remote_pad = PRPENCVF_SINK_PAD,
 				},
 			},
 		},
 		.pad[PRP_SRC_PAD_PRPVF] = {
+			.num_links = 1,
 			.link = {
 				{
 					.local_pad = PRP_SRC_PAD_PRPVF,
-					.remote = &int_subdev[isd_ic_prpvf],
-					.remote_pad = 0,
+					.remote = IPU_IC_PRPVF,
+					.remote_pad = PRPENCVF_SINK_PAD,
 				},
 			},
 		},
 	},
 
-	[isd_ic_prpenc] = {
-		.id = &isd_id[isd_ic_prpenc],
+	[IPU_IC_PRPENC] = {
+		.grp_id = IMX_MEDIA_GRP_ID_IPU_IC_PRPENC,
+		.sync_register = imx_media_ic_register,
+		.sync_unregister = imx_media_ic_unregister,
 	},
 
-	[isd_ic_prpvf] = {
-		.id = &isd_id[isd_ic_prpvf],
+	[IPU_IC_PRPVF] = {
+		.grp_id = IMX_MEDIA_GRP_ID_IPU_IC_PRPVF,
+		.sync_register = imx_media_ic_register,
+		.sync_unregister = imx_media_ic_unregister,
 	},
 };
 
-/* form a device name given an internal subdev and ipu id */
-static inline void isd_to_devname(char *devname, int sz,
-				  const struct internal_subdev *isd,
-				  int ipu_id)
-{
-	int pdev_id = ipu_id * num_isd + isd->id->index;
-
-	snprintf(devname, sz, "%s.%d", isd->id->name, pdev_id);
-}
-
-static const struct internal_subdev *find_intsd_by_grp_id(u32 grp_id)
-{
-	enum isd_enum i;
-
-	for (i = 0; i < num_isd; i++) {
-		const struct internal_subdev *isd = &int_subdev[i];
-
-		if (isd->id->grp_id == grp_id)
-			return isd;
-	}
-
-	return NULL;
-}
-
-static struct v4l2_subdev *find_sink(struct imx_media_dev *imxmd,
-				     struct v4l2_subdev *src,
-				     const struct internal_link *link)
-{
-	char sink_devname[32];
-	int ipu_id;
-
-	/*
-	 * retrieve IPU id from subdev name, note: can't get this from
-	 * struct imx_media_ipu_internal_sd_pdata because if src is
-	 * a CSI, it has different struct ipu_client_platformdata which
-	 * does not contain IPU id.
-	 */
-	if (sscanf(src->name, "ipu%d", &ipu_id) != 1)
-		return NULL;
-
-	isd_to_devname(sink_devname, sizeof(sink_devname),
-		       link->remote, ipu_id - 1);
-
-	return imx_media_find_subdev_by_devname(imxmd, sink_devname);
-}
-
-static int create_ipu_internal_link(struct imx_media_dev *imxmd,
-				    struct v4l2_subdev *src,
-				    const struct internal_link *link)
+static int create_internal_link(struct imx_media_dev *imxmd,
+				struct v4l2_subdev *src,
+				struct v4l2_subdev *sink,
+				const struct internal_link *link)
 {
-	struct v4l2_subdev *sink;
 	int ret;
 
-	sink = find_sink(imxmd, src, link);
-	if (!sink)
-		return -ENODEV;
+	/* skip if this link already created */
+	if (media_entity_find_link(&src->entity.pads[link->local_pad],
+				   &sink->entity.pads[link->remote_pad]))
+		return 0;
 
 	v4l2_info(&imxmd->v4l2_dev, "%s:%d -> %s:%d\n",
 		  src->name, link->local_pad,
@@ -223,25 +153,21 @@ static int create_ipu_internal_link(struct imx_media_dev *imxmd,
 	ret = media_create_pad_link(&src->entity, link->local_pad,
 				    &sink->entity, link->remote_pad, 0);
 	if (ret)
-		v4l2_err(&imxmd->v4l2_dev,
-			 "create_pad_link failed: %d\n", ret);
+		v4l2_err(&imxmd->v4l2_dev, "%s failed: %d\n", __func__, ret);
 
 	return ret;
 }
 
-int imx_media_create_ipu_internal_links(struct imx_media_dev *imxmd,
-					struct v4l2_subdev *sd)
+static int create_ipu_internal_links(struct imx_media_dev *imxmd,
+				     const struct internal_subdev *intsd,
+				     struct v4l2_subdev *sd,
+				     int ipu_id)
 {
-	const struct internal_subdev *intsd;
 	const struct internal_pad *intpad;
 	const struct internal_link *link;
 	struct media_pad *pad;
 	int i, j, ret;
 
-	intsd = find_intsd_by_grp_id(sd->grp_id);
-	if (!intsd)
-		return -ENODEV;
-
 	/* create the source->sink links */
 	for (i = 0; i < sd->entity.num_pads; i++) {
 		intpad = &intsd->pad[i];
@@ -250,13 +176,13 @@ int imx_media_create_ipu_internal_links(struct imx_media_dev *imxmd,
 		if (!(pad->flags & MEDIA_PAD_FL_SOURCE))
 			continue;
 
-		for (j = 0; ; j++) {
-			link = &intpad->link[j];
+		for (j = 0; j < intpad->num_links; j++) {
+			struct v4l2_subdev *sink;
 
-			if (!link->remote)
-				break;
+			link = &intpad->link[j];
+			sink = imxmd->sync_sd[ipu_id][link->remote];
 
-			ret = create_ipu_internal_link(imxmd, sd, link);
+			ret = create_internal_link(imxmd, sd, sink, link);
 			if (ret)
 				return ret;
 		}
@@ -265,85 +191,115 @@ int imx_media_create_ipu_internal_links(struct imx_media_dev *imxmd,
 	return 0;
 }
 
-/* register an internal subdev as a platform device */
-static int add_internal_subdev(struct imx_media_dev *imxmd,
-			       const struct internal_subdev *isd,
-			       int ipu_id)
+int imx_media_register_ipu_internal_subdevs(struct imx_media_dev *imxmd,
+					    struct v4l2_subdev *csi)
 {
-	struct imx_media_ipu_internal_sd_pdata pdata;
-	struct platform_device_info pdevinfo = {};
-	struct platform_device *pdev;
+	struct device *ipu_dev = csi->dev->parent;
+	const struct internal_subdev *intsd;
+	struct v4l2_subdev *sd;
+	struct ipu_soc *ipu;
+	int i, ipu_id, ret;
 
-	pdata.grp_id = isd->id->grp_id;
+	ipu = dev_get_drvdata(ipu_dev);
+	if (!ipu) {
+		v4l2_err(&imxmd->v4l2_dev, "invalid IPU device!\n");
+		return -ENODEV;
+	}
 
-	/* the id of IPU this subdev will control */
-	pdata.ipu_id = ipu_id;
+	ipu_id = ipu_get_num(ipu);
+	if (ipu_id > 1) {
+		v4l2_err(&imxmd->v4l2_dev, "invalid IPU id %d!\n", ipu_id);
+		return -ENODEV;
+	}
 
-	/* create subdev name */
-	imx_media_grp_id_to_sd_name(pdata.sd_name, sizeof(pdata.sd_name),
-				    pdata.grp_id, ipu_id);
+	mutex_lock(&imxmd->mutex);
 
-	pdevinfo.name = isd->id->name;
-	pdevinfo.id = ipu_id * num_isd + isd->id->index;
-	pdevinfo.parent = imxmd->md.dev;
-	pdevinfo.data = &pdata;
-	pdevinfo.size_data = sizeof(pdata);
-	pdevinfo.dma_mask = DMA_BIT_MASK(32);
+	/* register the synchronous subdevs */
+	for (i = 0; i < NUM_IPU_SUBDEVS; i++) {
+		intsd = &int_subdev[i];
 
-	pdev = platform_device_register_full(&pdevinfo);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
+		sd = imxmd->sync_sd[ipu_id][i];
 
-	return imx_media_add_async_subdev(imxmd, NULL, pdev);
-}
+		/*
+		 * skip if this sync subdev already registered or its
+		 * not a sync subdev (one of the CSIs)
+		 */
+		if (sd || !intsd->sync_register)
+			continue;
 
-/* adds the internal subdevs in one ipu */
-int imx_media_add_ipu_internal_subdevs(struct imx_media_dev *imxmd,
-				       int ipu_id)
-{
-	enum isd_enum i;
-	int ret;
+		mutex_unlock(&imxmd->mutex);
+		sd = intsd->sync_register(imxmd, ipu_dev, ipu, intsd->grp_id);
+		mutex_lock(&imxmd->mutex);
+		if (IS_ERR(sd)) {
+			ret = PTR_ERR(sd);
+			goto err_unwind;
+		}
 
-	for (i = 0; i < num_isd; i++) {
-		const struct internal_subdev *isd = &int_subdev[i];
+		imxmd->sync_sd[ipu_id][i] = sd;
+	}
 
-		/*
-		 * the CSIs are represented in the device-tree, so those
-		 * devices are already added to the async subdev list by
-		 * of_parse_subdev().
-		 */
-		switch (isd->id->grp_id) {
-		case IMX_MEDIA_GRP_ID_IPU_CSI0:
-		case IMX_MEDIA_GRP_ID_IPU_CSI1:
-			ret = 0;
-			break;
-		default:
-			ret = add_internal_subdev(imxmd, isd, ipu_id);
-			break;
+	/*
+	 * all the sync subdevs are registered, create the media links
+	 * between them.
+	 */
+	for (i = 0; i < NUM_IPU_SUBDEVS; i++) {
+		intsd = &int_subdev[i];
+
+		if (intsd->grp_id == csi->grp_id) {
+			sd = csi;
+		} else {
+			sd = imxmd->sync_sd[ipu_id][i];
+			if (!sd)
+				continue;
 		}
 
-		if (ret)
-			goto remove;
+		ret = create_ipu_internal_links(imxmd, intsd, sd, ipu_id);
+		if (ret) {
+			mutex_unlock(&imxmd->mutex);
+			imx_media_unregister_ipu_internal_subdevs(imxmd);
+			return ret;
+		}
 	}
 
+	mutex_unlock(&imxmd->mutex);
 	return 0;
 
-remove:
-	imx_media_remove_ipu_internal_subdevs(imxmd);
+err_unwind:
+	while (--i >= 0) {
+		intsd = &int_subdev[i];
+		sd = imxmd->sync_sd[ipu_id][i];
+		if (!sd || !intsd->sync_unregister)
+			continue;
+		mutex_unlock(&imxmd->mutex);
+		intsd->sync_unregister(sd);
+		mutex_lock(&imxmd->mutex);
+	}
+
+	mutex_unlock(&imxmd->mutex);
 	return ret;
 }
 
-void imx_media_remove_ipu_internal_subdevs(struct imx_media_dev *imxmd)
+void imx_media_unregister_ipu_internal_subdevs(struct imx_media_dev *imxmd)
 {
-	struct imx_media_async_subdev *imxasd;
-	struct v4l2_async_subdev *asd;
+	const struct internal_subdev *intsd;
+	struct v4l2_subdev *sd;
+	int i, j;
 
-	list_for_each_entry(asd, &imxmd->notifier.asd_list, asd_list) {
-		imxasd = to_imx_media_asd(asd);
+	mutex_lock(&imxmd->mutex);
 
-		if (!imxasd->pdev)
-			continue;
+	for (i = 0; i < 2; i++) {
+		for (j = 0; j < NUM_IPU_SUBDEVS; j++) {
+			intsd = &int_subdev[j];
+			sd = imxmd->sync_sd[i][j];
+
+			if (!sd || !intsd->sync_unregister)
+				continue;
 
-		platform_device_unregister(imxasd->pdev);
+			mutex_unlock(&imxmd->mutex);
+			intsd->sync_unregister(sd);
+			mutex_lock(&imxmd->mutex);
+		}
 	}
+
+	mutex_unlock(&imxmd->mutex);
 }
diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index 12383f4785ad..b7034699391d 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -23,6 +23,9 @@
 int imx_media_of_add_csi(struct imx_media_dev *imxmd,
 			 struct device_node *csi_np)
 {
+	struct v4l2_async_subdev *asd;
+	int ret = 0;
+
 	if (!of_device_is_available(csi_np)) {
 		dev_dbg(imxmd->md.dev, "%s: %pOFn not enabled\n", __func__,
 			csi_np);
@@ -30,18 +33,25 @@ int imx_media_of_add_csi(struct imx_media_dev *imxmd,
 	}
 
 	/* add CSI fwnode to async notifier */
-	return imx_media_add_async_subdev(imxmd, of_fwnode_handle(csi_np),
-					  NULL);
+	asd = v4l2_async_notifier_add_fwnode_subdev(&imxmd->notifier,
+						    of_fwnode_handle(csi_np),
+						    sizeof(*asd));
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
+		if (ret == -EEXIST)
+			dev_dbg(imxmd->md.dev, "%s: already added %pOFn\n",
+				__func__, csi_np);
+	}
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(imx_media_of_add_csi);
 
 int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 			     struct device_node *np)
 {
-	bool ipu_found[2] = {false, false};
 	struct device_node *csi_np;
 	int i, ret;
-	u32 ipu_id;
 
 	for (i = 0; ; i++) {
 		csi_np = of_parse_phandle(np, "ports", i);
@@ -59,31 +69,11 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 			/* other error, can't continue */
 			goto err_out;
 		}
-
-		ret = of_alias_get_id(csi_np->parent, "ipu");
-		if (ret < 0)
-			goto err_out;
-		if (ret > 1) {
-			ret = -EINVAL;
-			goto err_out;
-		}
-
-		ipu_id = ret;
-
-		if (!ipu_found[ipu_id]) {
-			ret = imx_media_add_ipu_internal_subdevs(imxmd,
-								 ipu_id);
-			if (ret)
-				goto err_out;
-		}
-
-		ipu_found[ipu_id] = true;
 	}
 
 	return 0;
 
 err_out:
-	imx_media_remove_ipu_internal_subdevs(imxmd);
 	of_node_put(csi_np);
 	return ret;
 }
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 5439b88dba20..5dd4c733de97 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -8,13 +8,6 @@
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
  */
-#include <linux/delay.h>
-#include <linux/interrupt.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/sched.h>
-#include <linux/slab.h>
-#include <linux/timer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
@@ -69,12 +62,12 @@ struct vdic_pipeline_ops {
 #define S_ALIGN    1 /* multiple of 2 */
 
 struct vdic_priv {
-	struct device        *dev;
-	struct ipu_soc       *ipu;
+	struct device *ipu_dev;
+	struct ipu_soc *ipu;
+
 	struct imx_media_dev *md;
 	struct v4l2_subdev   sd;
 	struct media_pad pad[VDIC_NUM_PADS];
-	int ipu_id;
 
 	/* lock to protect all members below */
 	struct mutex lock;
@@ -149,8 +142,6 @@ static int vdic_get_ipu_resources(struct vdic_priv *priv)
 	struct ipuv3_channel *ch;
 	struct ipu_vdi *vdi;
 
-	priv->ipu = priv->md->ipu[priv->ipu_id];
-
 	vdi = ipu_vdi_get(priv->ipu);
 	if (IS_ERR(vdi)) {
 		v4l2_err(&priv->sd, "failed to get VDIC\n");
@@ -515,7 +506,8 @@ static int vdic_s_stream(struct v4l2_subdev *sd, int enable)
 	if (priv->stream_count != !enable)
 		goto update_count;
 
-	dev_dbg(priv->dev, "stream %s\n", enable ? "ON" : "OFF");
+	dev_dbg(priv->ipu_dev, "%s: stream %s\n", sd->name,
+		enable ? "ON" : "OFF");
 
 	if (enable)
 		ret = vdic_start(priv);
@@ -690,8 +682,8 @@ static int vdic_link_setup(struct media_entity *entity,
 	struct v4l2_subdev *remote_sd;
 	int ret = 0;
 
-	dev_dbg(priv->dev, "link setup %s -> %s", remote->entity->name,
-		local->entity->name);
+	dev_dbg(priv->ipu_dev, "%s: link setup %s -> %s",
+		sd->name, remote->entity->name, local->entity->name);
 
 	mutex_lock(&priv->lock);
 
@@ -864,9 +856,6 @@ static int vdic_registered(struct v4l2_subdev *sd)
 	int i, ret;
 	u32 code;
 
-	/* get media device */
-	priv->md = dev_get_drvdata(sd->v4l2_dev->dev);
-
 	for (i = 0; i < VDIC_NUM_PADS; i++) {
 		priv->pad[i].flags = (i == VDIC_SRC_PAD_DIRECT) ?
 			MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
@@ -938,77 +927,55 @@ static const struct v4l2_subdev_internal_ops vdic_internal_ops = {
 	.unregistered = vdic_unregistered,
 };
 
-static int imx_vdic_probe(struct platform_device *pdev)
+struct v4l2_subdev *imx_media_vdic_register(struct imx_media_dev *imxmd,
+					    struct device *ipu_dev,
+					    struct ipu_soc *ipu,
+					    u32 grp_id)
 {
-	struct imx_media_ipu_internal_sd_pdata *pdata;
+	struct v4l2_device *v4l2_dev = &imxmd->v4l2_dev;
 	struct vdic_priv *priv;
 	int ret;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(ipu_dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
-	platform_set_drvdata(pdev, &priv->sd);
-	priv->dev = &pdev->dev;
-
-	pdata = priv->dev->platform_data;
-	priv->ipu_id = pdata->ipu_id;
+	priv->ipu_dev = ipu_dev;
+	priv->ipu = ipu;
+	priv->md = imxmd;
 
 	v4l2_subdev_init(&priv->sd, &vdic_subdev_ops);
 	v4l2_set_subdevdata(&priv->sd, priv);
 	priv->sd.internal_ops = &vdic_internal_ops;
 	priv->sd.entity.ops = &vdic_entity_ops;
 	priv->sd.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
-	priv->sd.dev = &pdev->dev;
-	priv->sd.owner = THIS_MODULE;
+	priv->sd.owner = ipu_dev->driver->owner;
 	priv->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
-	/* get our group id */
-	priv->sd.grp_id = pdata->grp_id;
-	strscpy(priv->sd.name, pdata->sd_name, sizeof(priv->sd.name));
+	priv->sd.grp_id = grp_id;
+	imx_media_grp_id_to_sd_name(priv->sd.name, sizeof(priv->sd.name),
+				    priv->sd.grp_id, ipu_get_num(ipu));
 
 	mutex_init(&priv->lock);
 
-	ret = v4l2_async_register_subdev(&priv->sd);
+	ret = v4l2_device_register_subdev(v4l2_dev, &priv->sd);
 	if (ret)
 		goto free;
 
-	return 0;
+	return &priv->sd;
 free:
 	mutex_destroy(&priv->lock);
-	return ret;
+	return ERR_PTR(ret);
 }
 
-static int imx_vdic_remove(struct platform_device *pdev)
+int imx_media_vdic_unregister(struct v4l2_subdev *sd)
 {
-	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
 	struct vdic_priv *priv = v4l2_get_subdevdata(sd);
 
 	v4l2_info(sd, "Removing\n");
 
-	v4l2_async_unregister_subdev(sd);
+	v4l2_device_unregister_subdev(sd);
 	mutex_destroy(&priv->lock);
 	media_entity_cleanup(&sd->entity);
 
 	return 0;
 }
-
-static const struct platform_device_id imx_vdic_ids[] = {
-	{ .name = "imx-ipuv3-vdic" },
-	{ },
-};
-MODULE_DEVICE_TABLE(platform, imx_vdic_ids);
-
-static struct platform_driver imx_vdic_driver = {
-	.probe = imx_vdic_probe,
-	.remove = imx_vdic_remove,
-	.id_table = imx_vdic_ids,
-	.driver = {
-		.name = "imx-ipuv3-vdic",
-	},
-};
-module_platform_driver(imx_vdic_driver);
-
-MODULE_DESCRIPTION("i.MX VDIC subdev driver");
-MODULE_AUTHOR("Steve Longerbeam <steve_longerbeam@mentor.com>");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:imx-ipuv3-vdic");
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index dd603a6b3a70..fadde3435cb7 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -19,6 +19,19 @@
 #include <media/videobuf2-dma-contig.h>
 #include <video/imx-ipu-v3.h>
 
+/*
+ * Enumeration of the IPU internal sub-devices
+ */
+enum {
+	IPU_CSI0 = 0,
+	IPU_CSI1,
+	IPU_VDIC,
+	IPU_IC_PRP,
+	IPU_IC_PRPENC,
+	IPU_IC_PRPVF,
+	NUM_IPU_SUBDEVS,
+};
+
 /*
  * Pad definitions for the subdevs with multiple source or
  * sink pads
@@ -115,25 +128,6 @@ struct imx_media_pad_vdev {
 	struct list_head list;
 };
 
-struct imx_media_ipu_internal_sd_pdata {
-	char sd_name[V4L2_SUBDEV_NAME_SIZE];
-	u32 grp_id;
-	int ipu_id;
-};
-
-struct imx_media_async_subdev {
-	/* the base asd - must be first in this struct */
-	struct v4l2_async_subdev asd;
-	/* the platform device of IPU-internal subdevs */
-	struct platform_device *pdev;
-};
-
-static inline struct imx_media_async_subdev *
-to_imx_media_asd(struct v4l2_async_subdev *asd)
-{
-	return container_of(asd, struct imx_media_async_subdev, asd);
-}
-
 struct imx_media_dev {
 	struct media_device md;
 	struct v4l2_device  v4l2_dev;
@@ -146,11 +140,11 @@ struct imx_media_dev {
 	/* master video device list */
 	struct list_head vdev_list;
 
-	/* IPUs this media driver control, valid after subdevs bound */
-	struct ipu_soc *ipu[2];
-
 	/* for async subdev registration */
 	struct v4l2_async_notifier notifier;
+
+	/* the IPU internal subdev's registered synchronously */
+	struct v4l2_subdev *sync_sd[2][NUM_IPU_SUBDEVS];
 };
 
 enum codespace_sel {
@@ -225,10 +219,6 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
 				  bool on);
 
 /* imx-media-dev.c */
-int imx_media_add_async_subdev(struct imx_media_dev *imxmd,
-			       struct fwnode_handle *fwnode,
-			       struct platform_device *pdev);
-
 int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
 			   struct v4l2_subdev *sd,
 			   struct v4l2_async_subdev *asd);
@@ -252,11 +242,9 @@ struct imx_media_fim *imx_media_fim_init(struct v4l2_subdev *sd);
 void imx_media_fim_free(struct imx_media_fim *fim);
 
 /* imx-media-internal-sd.c */
-int imx_media_add_ipu_internal_subdevs(struct imx_media_dev *imxmd,
-				       int ipu_id);
-int imx_media_create_ipu_internal_links(struct imx_media_dev *imxmd,
-					struct v4l2_subdev *sd);
-void imx_media_remove_ipu_internal_subdevs(struct imx_media_dev *imxmd);
+int imx_media_register_ipu_internal_subdevs(struct imx_media_dev *imxmd,
+					    struct v4l2_subdev *csi);
+void imx_media_unregister_ipu_internal_subdevs(struct imx_media_dev *imxmd);
 
 /* imx-media-of.c */
 int imx_media_add_of_subdevs(struct imx_media_dev *dev,
@@ -268,9 +256,24 @@ int imx_media_create_csi_of_links(struct imx_media_dev *imxmd,
 int imx_media_of_add_csi(struct imx_media_dev *imxmd,
 			 struct device_node *csi_np);
 
+/* imx-media-vdic.c */
+struct v4l2_subdev *imx_media_vdic_register(struct imx_media_dev *imxmd,
+					    struct device *ipu_dev,
+					    struct ipu_soc *ipu,
+					    u32 grp_id);
+int imx_media_vdic_unregister(struct v4l2_subdev *sd);
+
+/* imx-ic-common.c */
+struct v4l2_subdev *imx_media_ic_register(struct imx_media_dev *imxmd,
+					  struct device *ipu_dev,
+					  struct ipu_soc *ipu,
+					  u32 grp_id);
+int imx_media_ic_unregister(struct v4l2_subdev *sd);
+
 /* imx-media-capture.c */
 struct imx_media_video_dev *
-imx_media_capture_device_init(struct v4l2_subdev *src_sd, int pad);
+imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
+			      int pad);
 void imx_media_capture_device_remove(struct imx_media_video_dev *vdev);
 int imx_media_capture_device_register(struct imx_media_video_dev *vdev);
 void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 18eb5d3ecf10..95f3808762b4 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1292,7 +1292,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	csi->sd.grp_id = IMX_MEDIA_GRP_ID_CSI;
 	snprintf(csi->sd.name, sizeof(csi->sd.name), "csi");
 
-	csi->vdev = imx_media_capture_device_init(&csi->sd, IMX7_CSI_PAD_SRC);
+	csi->vdev = imx_media_capture_device_init(csi->sd.dev, &csi->sd,
+						  IMX7_CSI_PAD_SRC);
 	if (IS_ERR(csi->vdev))
 		return PTR_ERR(csi->vdev);
 
-- 
2.17.1

