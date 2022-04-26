Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06B5A50F1B8
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 09:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343666AbiDZHJm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 03:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343788AbiDZHJe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 03:09:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF39037A03
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 00:06:28 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56574488;
        Tue, 26 Apr 2022 09:06:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650956786;
        bh=dC6G2mVi3S8L2lcxFYl4LkD4H4vLZvnx+1qt5i+0EME=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ud9nAGr4uKOIHMX8mLx/lpD+/rV7uVqGALW2Tu9J/dsF328uTXg/xmK36yGAhdut6
         Rfq1p28O15DfhMQdFN83mvnE66P3hQsjcZTtwGA99gpS0UAoFdz0gsxaMnmVDbzgDn
         xF2qmRp2BPLdiu1MfsDdqO3WhzGIPYzmLtJanpu8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 1/5] media: ti: cal: fix useless variable init
Date:   Tue, 26 Apr 2022 10:06:14 +0300
Message-Id: <20220426070618.68536-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426070618.68536-1-tomi.valkeinen@ideasonboard.com>
References: <20220426070618.68536-1-tomi.valkeinen@ideasonboard.com>
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

'ret' is initialized needlessly in cal_legacy_try_fmt_vid_cap(). We can
also move the variable to the for block, which is the only place where
it is used.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal-video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index 3e936a2ca36c..1cbd9bda1892 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -195,7 +195,7 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
 	struct cal_ctx *ctx = video_drvdata(file);
 	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_size_enum fse;
-	int ret, found;
+	int found;
 
 	fmtinfo = find_format_by_pix(ctx, f->fmt.pix.pixelformat);
 	if (!fmtinfo) {
@@ -210,12 +210,13 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
 	f->fmt.pix.field = ctx->v_fmt.fmt.pix.field;
 
 	/* check for/find a valid width/height */
-	ret = 0;
 	found = false;
 	fse.pad = 0;
 	fse.code = fmtinfo->code;
 	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	for (fse.index = 0; ; fse.index++) {
+		int ret;
+
 		ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size,
 				       NULL, &fse);
 		if (ret)
-- 
2.34.1

