Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C39A94DB530
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 16:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357342AbiCPPsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 11:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357331AbiCPPsO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 11:48:14 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE436D386;
        Wed, 16 Mar 2022 08:46:59 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id B4559240011;
        Wed, 16 Mar 2022 15:46:55 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 01/10] media: adv748x: Add flags to adv748x_subdev_init()
Date:   Wed, 16 Mar 2022 16:46:32 +0100
Message-Id: <20220316154641.511667-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316154641.511667-1-jacopo+renesas@jmondi.org>
References: <20220316154641.511667-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
index bd4f3fe0e309..8c2701e1da0e 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -297,7 +297,7 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
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
2.35.1

