Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 849435F3028
	for <lists+linux-media@lfdr.de>; Mon,  3 Oct 2022 14:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiJCMTp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Oct 2022 08:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiJCMTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Oct 2022 08:19:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D572AEB
        for <linux-media@vger.kernel.org>; Mon,  3 Oct 2022 05:19:40 -0700 (PDT)
Received: from desky.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F14A519;
        Mon,  3 Oct 2022 14:19:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664799569;
        bh=d2VY8XT4NxsezXc7iiA19djs/AOhbqu7vS6adA7IB6U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kgf+txVIcarfGkDIZpgOMkMuIDx289XKi+akDfSp+Wt9Ved1sKtfEsZJNZw9WHABI
         gfjzUaT1ImOtCIlvrbV5/4NVd5Ktqf2FZVFi7X1EerVbweEhmhS1H4SG0HLU3bqlAw
         XB86nLbb/SiawpJEQPe4THFJXoFKVQu6boFDifs0=
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
Subject: [PATCH v15 13/19] media: subdev: add streams to v4l2_subdev_get_fmt() helper function
Date:   Mon,  3 Oct 2022 15:18:46 +0300
Message-Id: <20221003121852.616745-14-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
index 7d2d8e8d3aea..2f2ede00e60f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1380,10 +1380,14 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
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

