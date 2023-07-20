Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11E0A75BA94
	for <lists+linux-media@lfdr.de>; Fri, 21 Jul 2023 00:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjGTW0A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 18:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbjGTWZ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 18:25:59 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48CB5110
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 15:25:58 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6b947f8269eso237819a34.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 15:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689891957; x=1690496757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NRtCo/pmXGaq+Ec4Lg6jFF134a6G3H5LaCFpHrHJNhY=;
        b=Jnq7lLKXbXtoMOIdlGg4m5CBjCE/Qt7nsyVhqJnUQqDVCGluYnsHwX4rbW8i/L/L7/
         ViOuD92Q88JviwK81+kSGE7Aw23p/EylBMnVCLXUtqB/1Vdz662SPt8KUPwZOR9HLaet
         ugkPFcp8YSFXdBktOAPFg8A0CSwTB+bgI5sDqvtPK7AuiMSZTWvHJS71FdyFbic7Z+l5
         Hnojlb6iQp5b7gFA1GcjlUpuWL4EhtVp5fureR0T3Q3tblB3XldOSyOojZaDBmj+jhvJ
         yd3aUHmNIVOix0vuwk/xjiYpNK85RwuuAV1eMOQDpfI5VeX3YtAe1MDH3A7HoUNDPyZ0
         E+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689891957; x=1690496757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRtCo/pmXGaq+Ec4Lg6jFF134a6G3H5LaCFpHrHJNhY=;
        b=JiZ9r/1wPb/Nyln04oFaHR8X7x2j9giXpddy8t8SXTzGYGCRZlirPNSIEk3KE5RAS5
         ohCKATLUbzENcm8tc/W8M5MI9iF+3wwDDrb6YyNpQ85fBzf+KnqFpCFE70pwXSd2RQ8V
         a3kO+d14SnhbBIUjdrgf/XrgOjfLRiiijFNLCsMD+5+WvsLy2Qx7MnpnwGhi6WyEq/2L
         0vHCHeF3LHXtXutv5WpdmXe4fzlZQmi5zPPm0gTSd12skK5zYi/njwfCGiUckEDxITAQ
         5HGn8bxwOBGTWQjpzzoUu5URDmkfRjU8+nYeDE0+3eTbG1OB5OSA4+8RZUsARmOuoloC
         CTVg==
X-Gm-Message-State: ABy/qLY2Y4IbvoGcVKNTewvQPrt2GDRgeUrg03kiFYWKF4Wn8c+czaiH
        2DOTgHeFhEc6232JyQB9J6RCdfsEYOHPcw==
X-Google-Smtp-Source: APBJJlGqeFu4YgaAwNrilEk6krrpXz91TXwnhvgVeLDj1vnBlB2B+JTIuwUjmJWz4d1tf3qf+WAHcA==
X-Received: by 2002:a05:6870:3043:b0:1b3:afdc:6c08 with SMTP id u3-20020a056870304300b001b3afdc6c08mr110541oau.0.1689891957468;
        Thu, 20 Jul 2023 15:25:57 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:954b:3fb3:26f3:9d00])
        by smtp.gmail.com with ESMTPSA id n6-20020a056870034600b001a9eb707366sm962439oaf.15.2023.07.20.15.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 15:25:56 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        rmfrfs@gmail.com, alexander.stein@ew.tq-group.com,
        tharvey@gateworks.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] media: imx: imx7-media-csi: Fix applying format constraints
Date:   Thu, 20 Jul 2023 19:25:43 -0300
Message-Id: <20230720222543.1740198-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
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
Changes since v1:
- Export clamp_roundup().

 drivers/media/platform/nxp/imx7-media-csi.c | 4 ++--
 drivers/media/v4l2-core/v4l2-common.c       | 5 +++--
 include/media/v4l2-common.h                 | 2 ++
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 0bd2613b9320..f3c506fc19c4 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1137,8 +1137,8 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 	 * TODO: Implement configurable stride support.
 	 */
 	walign = 8 * 8 / cc->bpp;
-	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
-			      &pixfmt->height, 1, 0xffff, 1, 0);
+	pixfmt->width = clamp_roundup(pixfmt->width, 1, 0xffff, walign);
+	pixfmt->height = clamp_roundup(pixfmt->height, 1, 0xffff, 1);
 
 	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
 	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index bee1535b04d3..3e8c16bcb0f6 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -106,8 +106,8 @@ static unsigned int clamp_align(unsigned int x, unsigned int min,
 	return x;
 }
 
-static unsigned int clamp_roundup(unsigned int x, unsigned int min,
-				   unsigned int max, unsigned int alignment)
+unsigned int clamp_roundup(unsigned int x, unsigned int min,
+			   unsigned int max, unsigned int alignment)
 {
 	x = clamp(x, min, max);
 	if (alignment)
@@ -115,6 +115,7 @@ static unsigned int clamp_roundup(unsigned int x, unsigned int min,
 
 	return x;
 }
+EXPORT_SYMBOL(clamp_roundup);
 
 void v4l_bound_align_image(u32 *w, unsigned int wmin, unsigned int wmax,
 			   unsigned int walign,
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index d278836fd9cb..7059b99f4afa 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -521,6 +521,8 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height);
 int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 			u32 width, u32 height);
+unsigned int clamp_roundup(unsigned int x, unsigned int min,
+			   unsigned int max, unsigned int alignment);
 
 /**
  * v4l2_get_link_freq - Get link rate from transmitter
-- 
2.34.1

