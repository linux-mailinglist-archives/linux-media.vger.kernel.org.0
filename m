Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D5037654B
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 14:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236827AbhEGMiH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 08:38:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59808 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236794AbhEGMiG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 08:38:06 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C03ABBA;
        Fri,  7 May 2021 14:37:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620391025;
        bh=T9y0lwkVpTBvak2wxtK0+frKPsFgMQzQ1QwRKrYqRG8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jjfDJiCFVdHPj9AksJ+gnABuZhSqyUWHLpHtU8GTs+mLRBkQDyvh+xAXUSZjwP9xi
         JJGKwCwn4+wDOyIhLX70QETg7XeOfAtmPOKChM14Qyy/mVP2bTkCf1EAe3+o7nLH8M
         rUi6r+yuY3lV1q7FuNJv/tg0+52a0lYDBeMIwqSw=
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
Subject: [RFC 10/11] v4l: subdev: add V4L2_SUBDEV_FL_MULTIPLEXED
Date:   Fri,  7 May 2021 15:35:57 +0300
Message-Id: <20210507123558.146948-11-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
References: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2_SUBDEV_FL_MULTIPLEXED, which indicates that the subdev supports
routing and per-stream configuration. These drivers do not need the old
pad based configuration, so we can skip the allocation in
v4l2_subdev_alloc_state().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 3 ++-
 include/media/v4l2-subdev.h           | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 0acc2607b78c..f5cca45becf4 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1188,7 +1188,8 @@ struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
 		goto err;
 	}
 
-	if (sd->entity.num_pads) {
+	/* Drivers that support streams do not need the legacy pad config */
+	if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED) && sd->entity.num_pads) {
 		state->pads = kvmalloc_array(sd->entity.num_pads,
 					     sizeof(*state->pads),
 					     GFP_KERNEL | __GFP_ZERO);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1c3de4a0606e..cc9953d88ce2 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -900,6 +900,12 @@ struct v4l2_subdev_internal_ops {
  * should set this flag.
  */
 #define V4L2_SUBDEV_FL_HAS_EVENTS		(1U << 3)
+/*
+ * Set this flag if this subdev supports multiplexed streams. This means
+ * that the driver supports routing and handles the stream parameter in its
+ * v4l2_subdev_pad_ops handlers.
+ */
+#define V4L2_SUBDEV_FL_MULTIPLEXED		(1U << 4)
 
 struct regulator_bulk_data;
 
-- 
2.25.1

