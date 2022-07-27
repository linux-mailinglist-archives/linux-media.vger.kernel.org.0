Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0216582489
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbiG0Khb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbiG0Kh3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:37:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4BE2474C2
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:37:28 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3D3F1381;
        Wed, 27 Jul 2022 12:37:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918232;
        bh=Ujjd6IAMCbVFPiEGDGrFdoaJ8u/aADRoH+wCIpuE/6U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GjawgH101b6XbxR7s/1PbC1+NwFp/zD9lhhNYRAUEZFuXsxMH8U43NnxzsMvD07Mb
         G/6CH90VbnmpxMw/oUNeJLFrvMDyINk3xfA5tfFGgCpMXi9ypPjZ6uBWgpYArleVG2
         d1gAP9zyg+yvL3htyq2KAcf0zAbE4Gz8UX/ZN/6s=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v12 20/30] media: subdev: add streams to v4l2_subdev_get_fmt() helper function
Date:   Wed, 27 Jul 2022 13:36:29 +0300
Message-Id: <20220727103639.581567-21-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
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
index 0dd612f09f35..95fd2e07d69f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1455,10 +1455,14 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
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

