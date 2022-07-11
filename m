Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56A9E56D254
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 03:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiGKBGn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 21:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiGKBGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 21:06:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C46D14D0D
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 18:06:41 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADA0225B;
        Mon, 11 Jul 2022 03:06:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657501599;
        bh=rG85t3rz1wW1muKuj+6RfVfqLYXgQxGWuEEey9KFPP8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qPyC/tiI23r872RYV3D2EUpXuOGrCuWlY+JQPhxvqg7jlCyXn/JrAVe+wkCbquHFd
         ZjgqN4HvHoRq2TJnLlmvJ+d+K00qckgkR+HNWjjHc+Eetv+Uu1odeT4VukERglQBYl
         yEiw8NjpSj2R2w7MRqZ4rLLRMX9p9f1tQY9BexrI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2.1 38/55] media: rkisp1: isp: Disallow multiple active sources
Date:   Mon, 11 Jul 2022 04:06:08 +0300
Message-Id: <20220711010608.1755-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-39-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-39-laurent.pinchart@ideasonboard.com>
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

The ISP supports multiple source subdevs, but can only capture from a
single one at a time. The source is selected through link setup. The
driver finds the active source in its .s_stream() handler using the
media_entity_remote_pad() function. This fails to reject invalid
configurations with multiple active sources. Fix it by using the
media_pad_remote_pad_unique() helper instead, and inline
rkisp1_isp_get_source() in rkisp1_isp_s_stream() as the function is
small and has a single caller.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
---
Changes since v2:

- Update media_pad_remote_pad_unique() function name in commit message
---
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 30 ++++++++-----------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 37623b73b1d9..d7e2802d11f5 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -58,20 +58,6 @@
  * Helpers
  */
 
-static struct v4l2_subdev *rkisp1_isp_get_source(struct v4l2_subdev *sd)
-{
-	struct media_pad *local, *remote;
-	struct media_entity *sensor_me;
-
-	local = &sd->entity.pads[RKISP1_ISP_PAD_SINK_VIDEO];
-	remote = media_pad_remote_pad_first(local);
-	if (!remote)
-		return NULL;
-
-	sensor_me = remote->entity;
-	return media_entity_to_v4l2_subdev(sensor_me);
-}
-
 static struct v4l2_mbus_framefmt *
 rkisp1_isp_get_pad_fmt(struct rkisp1_isp *isp,
 		       struct v4l2_subdev_state *sd_state,
@@ -743,6 +729,8 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	const struct rkisp1_sensor_async *asd;
+	struct media_pad *source_pad;
+	struct media_pad *sink_pad;
 	int ret;
 
 	if (!enable) {
@@ -754,10 +742,18 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 		return 0;
 	}
 
-	rkisp1->source = rkisp1_isp_get_source(sd);
+	sink_pad = &isp->pads[RKISP1_ISP_PAD_SINK_VIDEO];
+	source_pad = media_pad_remote_pad_unique(sink_pad);
+	if (IS_ERR(source_pad)) {
+		dev_dbg(rkisp1->dev, "Failed to get source for ISP: %ld\n",
+			PTR_ERR(source_pad));
+		return -EPIPE;
+	}
+
+	rkisp1->source = media_entity_to_v4l2_subdev(source_pad->entity);
 	if (!rkisp1->source) {
-		dev_warn(rkisp1->dev, "No link between isp and source\n");
-		return -ENODEV;
+		/* This should really not happen, so is not worth a message. */
+		return -EPIPE;
 	}
 
 	asd = container_of(rkisp1->source->asd, struct rkisp1_sensor_async,
-- 
Regards,

Laurent Pinchart

