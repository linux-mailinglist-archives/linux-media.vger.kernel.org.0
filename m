Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCB267FC5F
	for <lists+linux-media@lfdr.de>; Sun, 29 Jan 2023 03:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233622AbjA2Cem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 21:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbjA2Cek (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 21:34:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA6622DFF
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 18:34:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72238327;
        Sun, 29 Jan 2023 03:34:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674959678;
        bh=9BnJgFa2ShTbBnd0haHCXdM1Z5/7rx45IFsUQWjjSrg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nUpgfxQmxrj3eGmDmSYbPxuLjCV4+wxKe4UXI8YCX+t8walQVQtSmfAsSrp5k+4jc
         RXXn6SjRNifmSxTg3mNG96T2Kh6b42lS++W+gzCr09pfEHa+AiFa3Oj5423wrATi41
         8LonGCJQpgGDoJqyuGw/2IGgZWVvPPsBpK9mXYpA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v2 3/8] media: imx: imx7-media-csi: Drop unneeded check when starting streaming
Date:   Sun, 29 Jan 2023 04:34:24 +0200
Message-Id: <20230129023429.22467-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
References: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
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
index 112af7279ccf..45b29d312276 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1736,9 +1736,6 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
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

