Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4698E38E466
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbhEXKqZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60880 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232704AbhEXKqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:18 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61C7D29DE;
        Mon, 24 May 2021 12:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853090;
        bh=Gmt0ISfgLtB7KMKgSgSiPvBJj8TbX/482BngXSWVQBk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JmMAllUgqd3x+5JCdctHBDnLd12wdZayxSFe2FdkUnxSuRuar/J+6kB3yIG6lRg7g
         eyw3oTfdRPwoc719HlskEiJ5eWGG/9fyoR4QlE2pm+rTT0I5sfMS+rnBMvq0EsIWyn
         Pr8/RQi2+M23zO4VjWdmoybR9z8H9ebb5yyHTpU8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v7 25/27] v4l: subdev: add routing & stream config to v4l2_subdev_state
Date:   Mon, 24 May 2021 13:44:06 +0300
Message-Id: <20210524104408.599645-26-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add routing and stream_configs to struct v4l2_subdev_state. This lets
the drivers to implement V4L2_SUBDEV_FORMAT_TRY support for routing and
the stream configurations.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 3 +++
 include/media/v4l2-subdev.h           | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index b30b456d8d99..13cffe9d9b89 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1227,6 +1227,9 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
 
 void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
 {
+	v4l2_subdev_free_routing(&state->routing);
+	v4l2_uninit_stream_configs(&state->stream_configs);
+
 	kvfree(state->pads);
 	kvfree(state);
 }
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 39c6b811463a..973db58c2d9b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -712,6 +712,8 @@ struct v4l2_subdev_krouting {
  * struct v4l2_subdev_state - Used for storing subdev information.
  *
  * @pads: &struct v4l2_subdev_pad_config array
+ * @routing: routing table for the subdev
+ * @stream_configs: stream configurations (only for V4L2_SUBDEV_FL_MULTIPLEXED)
  *
  * This structure only needs to be passed to the pad op if the 'which' field
  * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
@@ -719,6 +721,8 @@ struct v4l2_subdev_krouting {
  */
 struct v4l2_subdev_state {
 	struct v4l2_subdev_pad_config *pads;
+	struct v4l2_subdev_krouting routing;
+	struct v4l2_subdev_stream_configs stream_configs;
 };
 
 /**
-- 
2.25.1

