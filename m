Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3BDE4779E6
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 18:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235468AbhLPRCs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 12:02:48 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:33101 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235524AbhLPRCr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 12:02:47 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C14E71BF20B;
        Thu, 16 Dec 2021 17:02:42 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/5] media: adv748x: Add flags to adv748x_subdev_init()
Date:   Thu, 16 Dec 2021 18:03:19 +0100
Message-Id: <20211216170323.141321-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216170323.141321-1-jacopo+renesas@jmondi.org>
References: <20211216170323.141321-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a flags parameter to the adv748x_subdev_init() function that
allows to pass additional flags to the v4l2_subdevice.

This will be used to identify the CSI-2 subdevices as multiplexed.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/adv748x/adv748x-afe.c  | 2 +-
 drivers/media/i2c/adv748x/adv748x-core.c | 4 ++--
 drivers/media/i2c/adv748x/adv748x-csi2.c | 2 +-
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 2 +-
 drivers/media/i2c/adv748x/adv748x.h      | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index 02eabe10ab97..0d05e8a8887f 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -510,7 +510,7 @@ int adv748x_afe_init(struct adv748x_afe *afe)
 	afe->curr_norm = V4L2_STD_NTSC_M;
 
 	adv748x_subdev_init(&afe->sd, state, &adv748x_afe_ops,
-			    MEDIA_ENT_F_ATV_DECODER, "afe");
+			    MEDIA_ENT_F_ATV_DECODER, 0, "afe");
 
 	/* Identify the first connector found as a default input if set */
 	for (i = ADV748X_PORT_AIN0; i <= ADV748X_PORT_AIN7; i++) {
diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 4e54148147b9..0961b1468465 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -583,10 +583,10 @@ static int __maybe_unused adv748x_resume_early(struct device *dev)
 
 void adv748x_subdev_init(struct v4l2_subdev *sd, struct adv748x_state *state,
 			 const struct v4l2_subdev_ops *ops, u32 function,
-			 const char *ident)
+			 u32 flags, const char *ident)
 {
 	v4l2_subdev_init(sd, ops);
-	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | flags;
 
 	/* the owner is the same as the i2c_client's driver owner */
 	sd->owner = state->dev->driver->owner;
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 589e9644fcdc..6cbb47a715ab 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -313,7 +313,7 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 		return 0;
 
 	adv748x_subdev_init(&tx->sd, state, &adv748x_csi2_ops,
-			    MEDIA_ENT_F_VID_IF_BRIDGE,
+			    MEDIA_ENT_F_VID_IF_BRIDGE, 0,
 			    is_txa(tx) ? "txa" : "txb");
 
 	/* Ensure that matching is based upon the endpoint fwnodes */
diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index 52fa7bd75660..535a21b3c350 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -732,7 +732,7 @@ int adv748x_hdmi_init(struct adv748x_hdmi *hdmi)
 	hdmi->aspect_ratio.denominator = 9;
 
 	adv748x_subdev_init(&hdmi->sd, state, &adv748x_ops_hdmi,
-			    MEDIA_ENT_F_IO_DTV, "hdmi");
+			    MEDIA_ENT_F_IO_DTV, 0, "hdmi");
 
 	hdmi->pads[ADV748X_HDMI_SINK].flags = MEDIA_PAD_FL_SINK;
 	hdmi->pads[ADV748X_HDMI_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 31bac06d46b5..92c8caee6a42 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -426,7 +426,7 @@ static inline struct v4l2_subdev *adv748x_get_remote_sd(struct media_pad *pad)
 
 void adv748x_subdev_init(struct v4l2_subdev *sd, struct adv748x_state *state,
 			 const struct v4l2_subdev_ops *ops, u32 function,
-			 const char *ident);
+			 u32 flags, const char *ident);
 
 int adv748x_register_subdevs(struct adv748x_state *state,
 			     struct v4l2_device *v4l2_dev);
-- 
2.33.1

