Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0A167DC41
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 03:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233267AbjA0C12 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 21:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233212AbjA0C11 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 21:27:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AC6410BB
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 18:27:26 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1DF3E1F;
        Fri, 27 Jan 2023 03:27:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674786445;
        bh=UHIkPkwZm6/9cnA4BwQ2sO1/+Ta+kRFQXtk/IO9ZaJA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UpXDkhvp4DpduCKnXK+upY07QKumyQ5y8yBXXQzbZ2awvvqeyuqZpmvn/rzlwpn98
         ssb7y5ukmPDS5ZrgkCFaQXxiBxdVtkRC8A0+PnB8SmkPoK+JJ95+XzF3PVw1ZuDqiT
         0KPhBpjZ+L4qxH99zuggkvf4wq8cU2v/WVXNaEhg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 4/6] media: imx: imx7-media-csi: Drop unneeded src_sd check
Date:   Fri, 27 Jan 2023 04:27:13 +0200
Message-Id: <20230127022715.27234-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
References: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
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

The .s_stream() and .link_validate() operations can't be called with a
NULL src_sd, as subdev nodes are not registered before the async
notifier completes. Remove the unneeded checks.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 973a4d015279..f02a88e1ca10 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1729,11 +1729,6 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&csi->lock);
 
-	if (!csi->src_sd) {
-		ret = -EPIPE;
-		goto out_unlock;
-	}
-
 	if (enable) {
 		ret = imx7_csi_init(csi);
 		if (ret < 0)
@@ -2024,9 +2019,6 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 	unsigned int i;
 	int ret;
 
-	if (!csi->src_sd)
-		return -EPIPE;
-
 	/*
 	 * Validate the source link, and record whether the source uses the
 	 * parallel input or the CSI-2 receiver.
-- 
Regards,

Laurent Pinchart

