Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D722F18DF
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388840AbhAKO4O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:56:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388765AbhAKO4L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:56:11 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08EDC0617B1
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 06:54:53 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id y23so138253wmi.1
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 06:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tHVsXtMiml7BeUACbg86G/7vdz6mKeSHlUF/QzTEklQ=;
        b=PjacKNZyR9RFcS0iQu+Egy58/Z7nGvb6hhfgUK+kQS5UMnzrHYRMUOnYVugTHpc7Th
         FeravoD05+QzRJWlYcN6OnTln5sA9ICkj+zt3vx51CbVMva+sOZww8KduJjHtmRjurNR
         3T7CK9q5k80kTAbXAdr73jwTjJLJ1q+owFUSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tHVsXtMiml7BeUACbg86G/7vdz6mKeSHlUF/QzTEklQ=;
        b=Ns2Pkdm4lSJmSMBwlvigmU7eOm/9jYBLTBN4htoCelixtqZmymQg+lcQAwXadcG+U9
         c1H6ELK4ErnY/E9/qqBXMA0NIVUzBTz5ZwRmiOTVn+601MpQ0czAj27JIbNMgwjD5zKG
         VPXbqfs1mLgDboGwsC4e21ktQT3b47/TNdIZoFqzAkiEoQ1ScOMy3KHIx3sJKE7ESHd2
         6vklwmb+W5gmyYcyN99KD17HUHToWBxWzBfSEqN9uIhQb8kwVZm2N+gAERiIEfY+cpZA
         6rVq/WFH00ashnO+zY2PfnHtca3NLeTq+W7Vc701EBvI1iY1Ef5GvOYgS3vSwkHKrigC
         zWFg==
X-Gm-Message-State: AOAM533zUC/z7h0BkOl0WWY9bMaPH+0Ln3/UjEMuzwoCh6+IVQQK1F/r
        I7/c2VUmnfsGgBAvejrMT1x9iLvKibYROGp1/Xo=
X-Google-Smtp-Source: ABdhPJy2Yqvv8vnAD8dsW6R5NcyWQfQF8aj87/xcEKNPdZNNNWa/JIH6DHJ9w4F0tgSqAKBzOqBPbQ==
X-Received: by 2002:a05:600c:2117:: with SMTP id u23mr53230wml.153.1610376892464;
        Mon, 11 Jan 2021 06:54:52 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id s133sm17780wmf.38.2021.01.11.06.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 06:54:51 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 6/9] media: sum4i-csi: Do not zero reserved fields
Date:   Mon, 11 Jan 2021 15:54:42 +0100
Message-Id: <20210111145445.28854-7-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210111145445.28854-1-ribalda@chromium.org>
References: <20210111145445.28854-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Core code already clears reserved fields of struct
v4l2_pix_format_mplane, check: 4e1e0eb0e074 ("media: v4l2-ioctl: Zero
v4l2_plane_pix_format reserved fields").

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 1a2f65d83a6c..4785faddf630 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -113,8 +113,6 @@ static void _sun4i_csi_try_fmt(struct sun4i_csi *csi,
 	pix->num_planes = _fmt->num_planes;
 	pix->pixelformat = _fmt->fourcc;
 
-	memset(pix->reserved, 0, sizeof(pix->reserved));
-
 	/* Align the width and height on the subsampling */
 	width = ALIGN(pix->width, _fmt->hsub);
 	height = ALIGN(pix->height, _fmt->vsub);
@@ -131,8 +129,6 @@ static void _sun4i_csi_try_fmt(struct sun4i_csi *csi,
 		bpl = pix->width / hsub * _fmt->bpp[i] / 8;
 		pix->plane_fmt[i].bytesperline = bpl;
 		pix->plane_fmt[i].sizeimage = bpl * pix->height / vsub;
-		memset(pix->plane_fmt[i].reserved, 0,
-		       sizeof(pix->plane_fmt[i].reserved));
 	}
 }
 
-- 
2.30.0.284.gd98b1dd5eaa7-goog

