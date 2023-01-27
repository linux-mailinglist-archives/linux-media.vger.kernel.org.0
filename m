Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03A8D67DC40
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 03:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbjA0C10 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 21:27:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233212AbjA0C10 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 21:27:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50EA04109B
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 18:27:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2636B2B3;
        Fri, 27 Jan 2023 03:27:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674786443;
        bh=y++PVNIJN8a7GEgVg8qGV4r79tB+1d24Xp2hKJjGuoA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NeO/4FasZueGqTOoQx9WBSMWMj2r3/nDVwzaMmpmNvgGHC1mQQGdha+nAMenMqf6f
         FV/OPzJd8F5hAijVCJOnl/hH7Abf9BEEAD4N6dOwTndvC3JUNrUbQp8eNyEEQfYe3i
         kYJaO83Rea9SL5u9Luu5tfN+1xc1y1+bTdIkRSE4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 3/6] media: imx: imx7-media-csi: Drop unneeded check when starting streaming
Date:   Fri, 27 Jan 2023 04:27:12 +0200
Message-Id: <20230127022715.27234-4-laurent.pinchart@ideasonboard.com>
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

The .s_stream() operation is guaranteed not to be called to start/stop
an already started/stopped subdev. Remove the unneeded check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index e96bee4e5921..973a4d015279 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1734,9 +1734,6 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 		goto out_unlock;
 	}
 
-	if (csi->is_streaming == !!enable)
-		goto out_unlock;
-
 	if (enable) {
 		ret = imx7_csi_init(csi);
 		if (ret < 0)
-- 
Regards,

Laurent Pinchart

