Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 308E275B8CC
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 22:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjGTUhn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 16:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGTUhm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 16:37:42 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF26E12F
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 13:37:41 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1babd7fe2cdso216330fac.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689885461; x=1690490261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N1wqOxmotibR6luqRCo8gXZ5+VUekAjRyJKonjmii38=;
        b=mIiwMIOd/fjQfo1bo3adwM0KafXx2nTr3LdEw+MY1n/3E4i9rqjkoJuSTIojnzf5va
         yPSXwSgGA8MtHwCYQnfMaMyfdyEF9lF1RSDZ2fY+b3cVz9nMyrnbCjqX5/LYVG1ufWY4
         ABob2quKes2NP4U+YcJ2yfgE69mNOsYNPxocjTOOl3+MIZo4TXKmEasZIFG2SnxWTgEK
         HgxRop3/WMYI5NKpqj/YFudwX7XfesbfzmowsL1hpycfPQQO/drsobN+jn8NqQBwWENe
         XoQC7lbwxmmv9OM0tU4pHMLKhb+5tqE2lk9PcilO994ZmtSn+E3OTNEtFG2gNPzfK5Cz
         caDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689885461; x=1690490261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1wqOxmotibR6luqRCo8gXZ5+VUekAjRyJKonjmii38=;
        b=LHJ7kP6nBZzOEt3y8aULVOGQiADbVMkqYrnhji6Dp/ilKnViHs6Aqr6h173OtBbDJg
         5DS6IDoGpCR8LaNNZBXfdP61bmtKQxR6mZF5xZunpYjW+Npm5SmMWQPAhkcGtfbrBglA
         EeTGOSGATeNNkDertFgMV/JgDnvhjKNAV8YqLIjJa9vTd+7jlUN/6pMc21f721+qhOz1
         RA5eEeW2URfpadKbqcqH7ANNF7XZuml1r4ovffOpI3zWjhST9z1pWvoRtV80zZafG0AU
         GJHWA+mV/H60tD5H7W46CafITaTQ28c7zcP7BwxPefFEYw/FZR49OT3DS/R8XzkX7kYh
         N2Ow==
X-Gm-Message-State: ABy/qLb/I3FADd5wdI6YZ7DjSfOUvn2c6H6wS0xBwEPytuxblYkNRPM0
        lhHvBvYN3xD4lkRNQrAnc7E=
X-Google-Smtp-Source: APBJJlEeLQ3EHZGZePw+FmqUGza5mD2Rm0eJgGDvzKrqXIbJ6JSHxXeDhKpMi4l6ovg7eHVmd9xftw==
X-Received: by 2002:a05:6808:1887:b0:3a4:8cdb:db8f with SMTP id bi7-20020a056808188700b003a48cdbdb8fmr18752oib.0.1689885460899;
        Thu, 20 Jul 2023 13:37:40 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:954b:3fb3:26f3:9d00])
        by smtp.gmail.com with ESMTPSA id f7-20020a05680807c700b003a40b3fce01sm770829oij.10.2023.07.20.13.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 13:37:40 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        rmfrfs@gmail.com, alexander.stein@ew.tq-group.com,
        tharvey@gateworks.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH] media: imx: imx7-media-csi: Fix applying format constraints
Date:   Thu, 20 Jul 2023 17:36:35 -0300
Message-Id: <20230720203635.1676734-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

v4l_bound_align_image() aligns to a multiple power of 2 of walign, but the
result only needs to be a multiple of walign.

This causes a 640x480 sensor that used to report:

	Width/Height      : 640/480
        
to incorrectly report:

	Width/Height      : 768/480

Fix this problem by doing the correct alignment via clamp_roundup().

Reported-by: Tim Harvey <tharvey@gateworks.com>
Fixes: 6f482c4729d9 ("media: imx: imx7-media-csi: Get rid of superfluous call to imx7_csi_mbus_fmt_to_pix_fmt")
Co-developed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 0bd2613b9320..d964b5a714c5 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1108,6 +1108,17 @@ static int imx7_csi_video_g_fmt_vid_cap(struct file *file, void *fh,
 	return 0;
 }
 
+/* Borrowed from drivers/media/v4l2-core/v4l2-common.c */
+static unsigned int clamp_roundup(unsigned int x, unsigned int min,
+				  unsigned int max, unsigned int alignment)
+{
+	x = clamp(x, min, max);
+	if (alignment)
+		x = round_up(x, alignment);
+
+	return x;
+}
+
 static const struct imx7_csi_pixfmt *
 __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 			 struct v4l2_rect *compose)
@@ -1137,8 +1148,8 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 	 * TODO: Implement configurable stride support.
 	 */
 	walign = 8 * 8 / cc->bpp;
-	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
-			      &pixfmt->height, 1, 0xffff, 1, 0);
+	pixfmt->width = clamp_roundup(pixfmt->width, 1, 0xffff, walign);
+	pixfmt->height = clamp_roundup(pixfmt->height, 1, 0xffff, 1);
 
 	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
 	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
-- 
2.34.1

