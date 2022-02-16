Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29E1D4B92D3
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 22:04:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234285AbiBPVEM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 16:04:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234064AbiBPVEI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 16:04:08 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82742B0B23;
        Wed, 16 Feb 2022 13:03:47 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C478E1BF209;
        Wed, 16 Feb 2022 21:03:44 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 01/10] media: adv748x: Add flags to adv748x_subdev_init()
Date:   Wed, 16 Feb 2022 22:04:38 +0100
Message-Id: <20220216210447.481006-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220216210447.481006-1-jacopo+renesas@jmondi.org>
References: <20220216210447.481006-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
2.35.0

