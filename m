Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25343A28B0
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 11:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhFJJvQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 05:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhFJJvQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 05:51:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56051C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 02:49:20 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF4C78D4;
        Thu, 10 Jun 2021 11:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623318558;
        bh=owesdr+PgApgQYmW1nT4DIUlSq6jF9GXFElEvj6nxzw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b55mfKNe9usRrtYRQN13yuGAKXGkqGpRpAE7TgsTbY5FG9g9g5AUSd7UX6F1X48f2
         3Nqn7UoVCWOiyQOrhfhiP4w0TOsFhewiPCULFqqh00eV+58bWdCd6K/AOMcvLVqawg
         c09jF9JynY+FZ4IePOqPorVzi8iAIuCiSzoNFPbQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 2/5] media: omap3isp: fix indentation
Date:   Thu, 10 Jun 2021 12:49:00 +0300
Message-Id: <20210610094903.343183-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210609100228.278798-1-tomi.valkeinen@ideasonboard.com>
References: <20210609100228.278798-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a few indentation warnings from checkpatch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/omap3isp/ispccp2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/omap3isp/ispccp2.c b/drivers/media/platform/omap3isp/ispccp2.c
index 366da6fb8b4f..acb58b6ddba1 100644
--- a/drivers/media/platform/omap3isp/ispccp2.c
+++ b/drivers/media/platform/omap3isp/ispccp2.c
@@ -619,8 +619,8 @@ static const unsigned int ccp2_fmts[] = {
  */
 static struct v4l2_mbus_framefmt *
 __ccp2_get_format(struct isp_ccp2_device *ccp2,
-		     struct v4l2_subdev_state *sd_state,
-		     unsigned int pad, enum v4l2_subdev_format_whence which)
+		  struct v4l2_subdev_state *sd_state,
+		  unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return v4l2_subdev_get_try_format(&ccp2->subdev, sd_state,
@@ -708,7 +708,7 @@ static int ccp2_enum_mbus_code(struct v4l2_subdev *sd,
 			return -EINVAL;
 
 		format = __ccp2_get_format(ccp2, sd_state, CCP2_PAD_SINK,
-					      code->which);
+					   code->which);
 		code->code = format->code;
 	}
 
@@ -753,8 +753,8 @@ static int ccp2_enum_frame_size(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int ccp2_get_format(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_format *fmt)
+			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_format *fmt)
 {
 	struct isp_ccp2_device *ccp2 = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
@@ -775,8 +775,8 @@ static int ccp2_get_format(struct v4l2_subdev *sd,
  * returns zero
  */
 static int ccp2_set_format(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_format *fmt)
+			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_format *fmt)
 {
 	struct isp_ccp2_device *ccp2 = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
-- 
2.25.1

