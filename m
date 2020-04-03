Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F324319DFEE
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 22:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgDCU6v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 16:58:51 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41892 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728417AbgDCU6v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 16:58:51 -0400
Received: by mail-pg1-f194.google.com with SMTP id m13so125849pgd.8
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2020 13:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CwMotThQ9KwnaApySbZIN99PefRmZ9AR8BTcnm4Sl0o=;
        b=pxNQeQ/7j89yvV0nRcq2JtbGFPIMhmqFVkVvs6nxGaKoXoGjFA18KGmkbcoJCnOlEa
         dlM2NtH00NyVmWMhnhDYxwDLAu2YZroG6BxAaC5Dwesc2ILLTMbBKxTk3rlnDdQkwEyd
         1Rpr0WEI4OoGPRzKDqYwc6zwCm29sFr+XJxdNYvoJJ0OH3H6YgZp6jxTLK3F5S4nfKec
         ZB2oz8PUE+niFPyjG9RRTl4WlQSJP6GXvGBx813bkc68NMvjDUgKPwHton1kRLpPsWhz
         iyNxvKheWYt5RC1WP4tPUKKCSBerpBnA4N0tjNNK/u31EiEMsJnYac7rElt4OCgH73ot
         Jebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CwMotThQ9KwnaApySbZIN99PefRmZ9AR8BTcnm4Sl0o=;
        b=cCnUltFlroKLCqpR6wM8wOfM0jCEu9RtKs6vCScrzhlXTBSgXWmRto2uxMbyvFwv4C
         J72DKaGvpLGRYDk2O6vP1bCirzQGCrl9FmyhzCW1uYLIT0ZpqsV2Cj/DHF8NQJxqzxjK
         QGaYTHpwD2vY0ihBf/hQZxW4wwNbQWQsa6kqPf4WifUkqUfyMMDCOEtXBftaWAVnxoPG
         wotxyv2ip+IvLavvWx/tP/+5J256VW+cO1sXspmP45E74ofkhU7o/gdNCyK2d553EnV1
         26cbybkr20yLeo2p5JQj91c8OjbnMadF/bzPvlEEZ9y1kPgnjIxRIginuIxdut8eYYV0
         B8wQ==
X-Gm-Message-State: AGi0PuaX10mswIxPbOX5IfONlQScAwjHTtCfqWyEUz1pCmPHCAkydvDR
        6aIUdwDVxv4YtjddloFP2C4Rf+f00UQ=
X-Google-Smtp-Source: APiQypJUAmto1SWfvJRDlMLcR13o1Pc7OljBJYVWoCQfeZMBJj2LmqTWP5Z46xW02voSdYYmBQBE8w==
X-Received: by 2002:a63:5714:: with SMTP id l20mr9704340pgb.65.1585947529676;
        Fri, 03 Apr 2020 13:58:49 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id s39sm6521266pjb.10.2020.04.03.13.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 13:58:49 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 03/12] media: imx: utils: Inline init_mbus_colorimetry() in its caller
Date:   Fri,  3 Apr 2020 13:58:30 -0700
Message-Id: <20200403205839.4531-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403205839.4531-1-slongerbeam@gmail.com>
References: <20200403205839.4531-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The init_mbus_colorimetry() function is small and used in a single
place. The code becomes easier to follow if it gets inline in its
caller. Do so.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 24 +++++++++------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 00a71f01786c..cf0aba8d53ba 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -210,19 +210,6 @@ static const struct imx_media_pixfmt ipu_rgb_formats[] = {
 
 #define NUM_IPU_RGB_FORMATS ARRAY_SIZE(ipu_rgb_formats)
 
-static void init_mbus_colorimetry(struct v4l2_mbus_framefmt *mbus,
-				  const struct imx_media_pixfmt *fmt)
-{
-	mbus->colorspace = (fmt->cs == IPUV3_COLORSPACE_RGB) ?
-		V4L2_COLORSPACE_SRGB : V4L2_COLORSPACE_SMPTE170M;
-	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
-	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
-	mbus->quantization =
-		V4L2_MAP_QUANTIZATION_DEFAULT(fmt->cs == IPUV3_COLORSPACE_RGB,
-					      mbus->colorspace,
-					      mbus->ycbcr_enc);
-}
-
 static const struct imx_media_pixfmt *find_format(u32 fourcc,
 						  u32 code,
 						  enum codespace_sel cs_sel,
@@ -423,7 +410,16 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	}
 
 	mbus->code = code;
-	init_mbus_colorimetry(mbus, lcc);
+
+	mbus->colorspace = (lcc->cs == IPUV3_COLORSPACE_RGB) ?
+		V4L2_COLORSPACE_SRGB : V4L2_COLORSPACE_SMPTE170M;
+	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
+	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
+	mbus->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(lcc->cs == IPUV3_COLORSPACE_RGB,
+					      mbus->colorspace,
+					      mbus->ycbcr_enc);
+
 	if (cc)
 		*cc = lcc;
 
-- 
2.17.1

