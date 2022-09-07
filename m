Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42AF95B0DBB
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 22:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiIGUE4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 16:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbiIGUEz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 16:04:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949E520F75
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 13:04:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB57AE81;
        Wed,  7 Sep 2022 22:04:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662581089;
        bh=6Yde0QeO7axbIOr0yg8qR2SESdJqpYa6mDnpGbDyfD8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DzmCMB14Y5Sptxs84ysNTwzvmWdlgr6b4I7dZceitWEgKs+vLu5qk9lQ9qYg0bJTF
         b9LXGyA2HkugA2nDFu+TtBjlh0qZpI1EfyVL7GP4pzt4dWrVZzHxWztSC52FuXX6/W
         Kh8V91oAmgpT0pTPzH/N3lmK2kpDVrbZXxBBQBtk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH 6/6] staging: media: imx: Make imx_media_of_add_csi() static
Date:   Wed,  7 Sep 2022 23:04:24 +0300
Message-Id: <20220907200424.32136-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
References: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
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

The imx_media_of_add_csi() function is only called in its compilation
unit. Make it static and don't export it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-of.c | 5 ++---
 drivers/staging/media/imx/imx-media.h    | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index 59f1eb7b62bc..92a99010c150 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -16,8 +16,8 @@
 #include <video/imx-ipu-v3.h>
 #include "imx-media.h"
 
-int imx_media_of_add_csi(struct imx_media_dev *imxmd,
-			 struct device_node *csi_np)
+static int imx_media_of_add_csi(struct imx_media_dev *imxmd,
+				struct device_node *csi_np)
 {
 	struct v4l2_async_subdev *asd;
 	int ret = 0;
@@ -41,7 +41,6 @@ int imx_media_of_add_csi(struct imx_media_dev *imxmd,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(imx_media_of_add_csi);
 
 int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 			     struct device_node *np)
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 5a1436dbb12d..c12ecaf378fe 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -252,8 +252,6 @@ void imx_media_unregister_ipu_internal_subdevs(struct imx_media_dev *imxmd);
 /* imx-media-of.c */
 int imx_media_add_of_subdevs(struct imx_media_dev *dev,
 			     struct device_node *np);
-int imx_media_of_add_csi(struct imx_media_dev *imxmd,
-			 struct device_node *csi_np);
 
 /* imx-media-vdic.c */
 struct v4l2_subdev *imx_media_vdic_register(struct v4l2_device *v4l2_dev,
-- 
Regards,

Laurent Pinchart

