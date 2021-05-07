Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2059376545
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 14:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236618AbhEGMiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 08:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbhEGMiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 08:38:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466B1C061574
        for <linux-media@vger.kernel.org>; Fri,  7 May 2021 05:37:00 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5272C8A1;
        Fri,  7 May 2021 14:36:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620391016;
        bh=Cugm65dp6wMYYpGMe9vCicD0E/d7W+AQc/VCe9eIHQY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rWb2wOZO9GKTIycXwFUgagEY9YLOFaErOENV2Qq3fyhhuKK0EB5y78JYq43rG9Il7
         CWET7oZYaISLhMFeTM4MyoE4+ivqgeAa6DcNENGzHFFawlVsgSm+tYD/OwAE7LEfT9
         PxCjEeN4r/zFZ2AwwVpjpU6ygjPLXFWdPHTAZBmI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, john.wei@mediatek.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC 02/11] media: v4l2-subdev: driver fixes for subdev-wide state struct
Date:   Fri,  7 May 2021 15:35:49 +0300
Message-Id: <20210507123558.146948-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
References: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change two drivers as an example to use the new struct
v4l2_subdev_pad_config.

All drivers need to be fixed, and these fixes need to be squashed into
the previous commit.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c                   | 10 +++++-----
 drivers/media/platform/ti-vpe/cal-camerarx.c | 12 ++++++------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index b4f52cee1dff..b29f887cbf84 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2227,7 +2227,7 @@ static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
 }
 
 static int ov5640_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *cfg,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
@@ -2285,7 +2285,7 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 }
 
 static int ov5640_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *cfg,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
@@ -2818,7 +2818,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 }
 
 static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *cfg,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->pad != 0)
@@ -2838,7 +2838,7 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
 
 static int ov5640_enum_frame_interval(
 	struct v4l2_subdev *sd,
-	struct v4l2_subdev_pad_config *cfg,
+	struct v4l2_subdev_state *cfg,
 	struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
@@ -2924,7 +2924,7 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int ov5640_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *cfg,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad != 0)
diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 36103f5af6e9..5b41ba493599 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -621,7 +621,7 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
 
 static struct v4l2_mbus_framefmt *
 cal_camerarx_get_pad_format(struct cal_camerarx *phy,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *cfg,
 			    unsigned int pad, u32 which)
 {
 	switch (which) {
@@ -652,7 +652,7 @@ static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
-					  struct v4l2_subdev_pad_config *cfg,
+					  struct v4l2_subdev_state *cfg,
 					  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -689,7 +689,7 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
-					   struct v4l2_subdev_pad_config *cfg,
+					   struct v4l2_subdev_state *cfg,
 					   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -739,7 +739,7 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *cfg,
 				   struct v4l2_subdev_format *format)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -756,7 +756,7 @@ static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *cfg,
 				   struct v4l2_subdev_format *format)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -806,7 +806,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg)
+				    struct v4l2_subdev_state *cfg)
 {
 	struct v4l2_subdev_format format = {
 		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
-- 
2.25.1

