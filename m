Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E37B85214B0
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241426AbiEJMDi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241430AbiEJMDh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA765418B
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:40 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 764CCB60;
        Tue, 10 May 2022 13:59:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183968;
        bh=R6JzINy4gD6TovfrdcP/5VdD1wSGdqHELXNnBkONj8c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TOaOwPNTWN5VDFEYvvVriB0A4NilhrSTdD/GF7a/r1dlWjTEFWQbL9nUJHoXtEL0v
         NmKzR+PVR41f66RwC2LJ/tGwHJZ4OvuDfCcbYbC2SvQdqsk+KDwn7fB2OxOTRnrhR0
         bwZyZ6SXd1+Dh+w1x/cSgEplZ/nyQvIsOBkFJWmc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 21/50] staging: media: imx: imx7-media-csi: Don't initialize unused fields
Date:   Tue, 10 May 2022 14:58:30 +0300
Message-Id: <20220510115859.19777-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx_media_dev structure contains three fields that are not used by
this driver or any helper code that it calls. Don't initialize them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index b6643952da25..7e932884fd02 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1821,8 +1821,6 @@ static int imx7_csi_media_dev_init(struct imx7_csi *csi)
 	imxmd->md.ops = &imx7_csi_media_ops;
 	imxmd->md.dev = csi->dev;
 
-	mutex_init(&imxmd->mutex);
-
 	imxmd->v4l2_dev.mdev = &imxmd->md;
 	strscpy(imxmd->v4l2_dev.name, "imx-media",
 		sizeof(imxmd->v4l2_dev.name));
@@ -1838,10 +1836,6 @@ static int imx7_csi_media_dev_init(struct imx7_csi *csi)
 		goto cleanup;
 	}
 
-	INIT_LIST_HEAD(&imxmd->vdev_list);
-
-	v4l2_async_nf_init(&imxmd->notifier);
-
 	return 0;
 
 cleanup:
-- 
Regards,

Laurent Pinchart

