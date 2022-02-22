Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC2C34C040C
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 22:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234607AbiBVVrV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 16:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233604AbiBVVrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 16:47:20 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633976562
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 13:46:54 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 8C6DA4000A;
        Tue, 22 Feb 2022 21:46:50 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, aford173@gmail.com,
        slongerbeam@gmail.com, rmfrfs@gmail.com,
        alexander.stein@ew.tq-group.com, linux-imx@nxp.com,
        linux-media@vger.kernel.org
Subject: [PATCH] media: imx: csis: Store pads format separately
Date:   Tue, 22 Feb 2022 22:46:43 +0100
Message-Id: <20220222214643.587535-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the formats on the sink and source pad might be different store
them separately.

The pad format is used to configure the image width and height in
mipi_csis_system_enable(). As the csis cannot downscale, using the sink
or the source one isn't relevant.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---

Hans, this comes as a late fix for pull request
[GIT PULL FOR v5.18] De-stage imx7-mipi-csis & some fixes

I'm sorry if this arrives a bit late, but I only realized when I
exercized RGB24 today.

Can this be collected together with the above pull request ?
Thanks
  j
---
 drivers/media/platform/imx/imx-mipi-csis.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index 6f975b3702bc..c23e512886f9 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -330,7 +330,7 @@ struct csi_state {

 	struct mutex lock;	/* Protect csis_fmt, format_mbus and state */
 	const struct csis_pix_format *csis_fmt;
-	struct v4l2_mbus_framefmt format_mbus;
+	struct v4l2_mbus_framefmt format_mbus[CSIS_PADS_NUM];
 	u32 state;

 	spinlock_t slock;	/* Protect events */
@@ -535,7 +535,7 @@ static void mipi_csis_system_enable(struct csi_state *state, int on)
 /* Called with the state.lock mutex held */
 static void __mipi_csis_set_format(struct csi_state *state)
 {
-	struct v4l2_mbus_framefmt *mf = &state->format_mbus;
+	struct v4l2_mbus_framefmt *mf = &state->format_mbus[CSIS_PAD_SINK];
 	u32 val;

 	/* Color format */
@@ -967,7 +967,7 @@ mipi_csis_get_format(struct csi_state *state,
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return v4l2_subdev_get_try_format(&state->sd, sd_state, pad);

-	return &state->format_mbus;
+	return &state->format_mbus[pad];
 }

 static int mipi_csis_init_cfg(struct v4l2_subdev *sd,
--
2.35.0

