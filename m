Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 289314C5CBA
	for <lists+linux-media@lfdr.de>; Sun, 27 Feb 2022 17:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbiB0QCO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Feb 2022 11:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbiB0QCN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Feb 2022 11:02:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D774F52E2C
        for <linux-media@vger.kernel.org>; Sun, 27 Feb 2022 08:01:36 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D43DFA24;
        Sun, 27 Feb 2022 17:01:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645977693;
        bh=Fo/MAmfmbCU7QtcFYItatJyeAsk3482qu8dImgsHC4k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DNgg8NAwbvlTdTRs0bDnvsPUYeJ6cF4Q3Cbw9RGjxnKliJWAZBHoPAp5h/7C4yDF0
         lzE3jHTc+zgtRpl5TeBohvVcVHglwedCiZCYAauFn8riPfDrHUtI4yOrv1EqobdTG5
         ZlZla/OUM3cS2Z210ZvrLcae62v3DL/p9Vx7wxjU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 03/16] media: rkisp1: isp: Fix and simplify (un)registration
Date:   Sun, 27 Feb 2022 18:01:03 +0200
Message-Id: <20220227160116.18556-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
References: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
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

The rkisp1_isp_register() and rkisp1_isp_unregister() functions don't
destroy the mutex (in the error path for the former). Fix this, simplify
error handling at registration time as media_entity_cleanup() can be
called on an uninitialized entity, and make rkisp1_isp_unregister() and
safe to be called on an unregistered isp subdev to prepare for
simplification of error handling at probe time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c |  4 ++--
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 20 ++++++++++++-------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 18be7c982db7..0eccf9eb6a14 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1371,14 +1371,14 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 	if (ret) {
 		dev_err(cap->rkisp1->dev,
 			"vb2 queue init failed (err=%d)\n", ret);
-		return ret;
+		goto error;
 	}
 
 	vdev->queue = q;
 
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
-		return ret;
+		goto error;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2a35bf24e54e..f84e53b60ee1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -1090,29 +1090,35 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1)
 	mutex_init(&isp->ops_lock);
 	ret = media_entity_pads_init(&sd->entity, RKISP1_ISP_PAD_MAX, pads);
 	if (ret)
-		return ret;
+		goto error;
 
 	ret = v4l2_device_register_subdev(&rkisp1->v4l2_dev, sd);
 	if (ret) {
 		dev_err(rkisp1->dev, "Failed to register isp subdev\n");
-		goto err_cleanup_media_entity;
+		goto error;
 	}
 
 	rkisp1_isp_init_config(sd, &state);
+
 	return 0;
 
-err_cleanup_media_entity:
+error:
 	media_entity_cleanup(&sd->entity);
-
+	mutex_destroy(&isp->ops_lock);
+	isp->sd.flags = 0;
 	return ret;
 }
 
 void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
 {
-	struct v4l2_subdev *sd = &rkisp1->isp.sd;
+	struct rkisp1_isp *isp = &rkisp1->isp;
 
-	v4l2_device_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
+	if (!isp->sd.flags)
+		return;
+
+	v4l2_device_unregister_subdev(&isp->sd);
+	media_entity_cleanup(&isp->sd.entity);
+	mutex_destroy(&isp->ops_lock);
 }
 
 /* ----------------------------------------------------------------------------
-- 
Regards,

Laurent Pinchart

