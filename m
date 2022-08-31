Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38B3A5A7FDC
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbiHaOQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbiHaOQN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:16:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4E6AC279
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:15:45 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EB393006;
        Wed, 31 Aug 2022 16:14:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955279;
        bh=ECBuH6CFlbHmWdn8c4+EeVHuasYaXErlDXKrKC7KXVo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GzpYkeU7bR11wspEOQaRUYbb479PKjkz9MUL2EFRLCJpbUiWpkBqHaNNqKgBh1BrP
         RVP0o2dLs3iLXk/L9DFpaKMzX9k7zOz+ZkohtDAZsQtYEKdzkwrVcuXJ3LGmzO6iSo
         fHv5NLgRiFcKrQo2ZaTAMbzkoIfJV6/Y32u28Kvs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v14 28/34] media: subdev: add streams to v4l2_subdev_get_fmt() helper function
Date:   Wed, 31 Aug 2022 17:13:51 +0300
Message-Id: <20220831141357.1396081-29-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add streams support to v4l2_subdev_get_fmt() helper function. Subdev
drivers that do not need to do anything special in their get_fmt op can
use this helper directly for v4l2_subdev_pad_ops.get_fmt.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a4ae11c27e24..76788798e976 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1438,10 +1438,14 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 {
 	struct v4l2_mbus_framefmt *fmt;
 
-	if (format->pad >= sd->entity.num_pads)
-		return -EINVAL;
+	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
+		fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
+							  format->stream);
+	else if (format->pad < sd->entity.num_pads && format->stream == 0)
+		fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
+	else
+		fmt = NULL;
 
-	fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
 	if (!fmt)
 		return -EINVAL;
 
-- 
2.34.1

