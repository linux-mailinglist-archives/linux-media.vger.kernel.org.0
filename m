Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3DC14DE94F
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 17:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243644AbiCSQcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Mar 2022 12:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243638AbiCSQcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Mar 2022 12:32:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8BB423F9CD
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 09:31:29 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79D0126E2;
        Sat, 19 Mar 2022 17:31:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647707487;
        bh=TZYcik4dG+rSsCkPCQkOBQpcllM4Z18+HB9vK0XUl5U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qrlFXGDK0VWGQQdHhcvdERYfG7ms6xhtHdDJSopcYm/CjV1lUi275VOBUbU5s7Jfn
         mQSCaM4wzW1/qVIdKYgqvy1QJvbsEVLEsiH/+n4i6WJyVhrytyhWeb/C8zncSo4kxe
         mf0426RB1mO7U6JN4l9LYnXdnz/bIGGQroZmKPkY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v3 03/17] media: rkisp1: isp: Fix and simplify (un)registration
Date:   Sat, 19 Mar 2022 18:30:46 +0200
Message-Id: <20220319163100.3083-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
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
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

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

