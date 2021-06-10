Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939073A28B2
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 11:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhFJJvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 05:51:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39502 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhFJJvR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 05:51:17 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 826FFE86;
        Thu, 10 Jun 2021 11:49:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623318559;
        bh=VjbI29YO5gJl3Szayh1hkM7fiViQvJKZbsJ2hUWClDc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mgix21sKaY34hp27myLTlu6waX1xOeZfL/mkiYEQhUQM06mejbvEXRl4mVZ428JcC
         VPp/BoYVpDbc4xUApRowlFKBq5woiLW6SGZJRGGaGV+SZwoYh6shapW58WTOOWGYYt
         B7/nVnuonWyADVBmblW0bIm2jxHwlkr9F75NLVqs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 5/5] media: v4l2-subdev: fix and rename check_cfg()
Date:   Thu, 10 Jun 2021 12:49:03 +0300
Message-Id: <20210610094903.343183-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610094903.343183-1-tomi.valkeinen@ideasonboard.com>
References: <20210609100228.278798-1-tomi.valkeinen@ideasonboard.com>
 <20210610094903.343183-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename check_cfg() to check_state_pads() as it is now checking the pads
of the state.

Also fix the check so that it verifies that both state and state->pads
exist.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 25c80d6de23b..daf7ffdd8882 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -148,9 +148,9 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
 	return 0;
 }
 
-static int check_cfg(u32 which, struct v4l2_subdev_state *state)
+static int check_state_pads(u32 which, struct v4l2_subdev_state *state)
 {
-	if (which == V4L2_SUBDEV_FORMAT_TRY && !state)
+	if (which == V4L2_SUBDEV_FORMAT_TRY && (!state || !state->pads))
 		return -EINVAL;
 
 	return 0;
@@ -164,7 +164,7 @@ static inline int check_format(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
-	       check_cfg(format->which, state);
+	       check_state_pads(format->which, state);
 }
 
 static int call_get_fmt(struct v4l2_subdev *sd,
@@ -191,7 +191,7 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
-	       check_cfg(code->which, state) ? :
+	       check_state_pads(code->which, state) ? :
 	       sd->ops->pad->enum_mbus_code(sd, state, code);
 }
 
@@ -203,7 +203,7 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
-	       check_cfg(fse->which, state) ? :
+	       check_state_pads(fse->which, state) ? :
 	       sd->ops->pad->enum_frame_size(sd, state, fse);
 }
 
@@ -238,7 +238,7 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
-	       check_cfg(fie->which, state) ? :
+	       check_state_pads(fie->which, state) ? :
 	       sd->ops->pad->enum_frame_interval(sd, state, fie);
 }
 
@@ -250,7 +250,7 @@ static inline int check_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
-	       check_cfg(sel->which, state);
+	       check_state_pads(sel->which, state);
 }
 
 static int call_get_selection(struct v4l2_subdev *sd,
-- 
2.25.1

