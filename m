Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAB257DA5C
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 08:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234247AbiGVGez (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 02:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234110AbiGVGex (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 02:34:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8157465587
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 23:34:52 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AE9C6D5;
        Fri, 22 Jul 2022 08:34:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658471690;
        bh=LONPrpHOZTqcagfC+nmyMlusOSsY/hWMJ+o47b5Zyzw=;
        h=From:To:Cc:Subject:Date:From;
        b=cgZSV3OUKRU7EM2pNCpiyxGhGY+GeZbrwduK21PaWIBOClQtKOgF8oLFL6d9e3g29
         5YWYsM999Jd8NEkQjNGolYjZKWTGxVeSBFEf/AJ6oE6fzWNGPl4nsbFwKNdEQc4Fjq
         bD5QqbDJoHlYSnaRDwv47NnCgoOmDsEK7TnIDc7A=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 1/5] media: ti: cal: fix useless variable init
Date:   Fri, 22 Jul 2022 09:34:20 +0300
Message-Id: <20220722063424.174288-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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
---
 drivers/media/platform/ti/cal/cal-video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index 07ae1a34e6b0..a4d764c96a90 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -191,7 +191,7 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
 	struct cal_ctx *ctx = video_drvdata(file);
 	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_size_enum fse;
-	int ret, found;
+	int found;
 
 	fmtinfo = find_format_by_pix(ctx, f->fmt.pix.pixelformat);
 	if (!fmtinfo) {
@@ -206,12 +206,13 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
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

