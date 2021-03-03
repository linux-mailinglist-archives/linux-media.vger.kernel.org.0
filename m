Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E61C32C793
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355650AbhCDAcR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243233AbhCCSJl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 13:09:41 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120D8C06175F
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 10:08:54 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id v5so38563918lft.13
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 10:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bSsDnS6dbLhvTy+AVlfdF3LogW8QXbBSHC6yrMiBxcc=;
        b=eubOFCkwtk73peY4EPbEunGR/uk+5JCUWi3g2QGv85tqPZ3PNrVG8gXXANyHv0NmcI
         K8W/I2nmnxLYCZwal7WUloHZciQ0TZBa+YkM51io8pPygVXfN4iEHPbEIkcloO1M+QdE
         yp6KZrQ8JJvCWbb+a/iyFgVAQ5h/ZeAAnLpo4Lr8JwiQMJXyqU6ps1S4lYXkoo4SDcbY
         SU3lDszVeY8JmB96TjpUU9ViKu8ZYRCHJboG9K7JKj5cw1kPbKWkxp/1BL+UUZxD4Mbw
         w6jJiBjzRM4lnYSLrC05WxSwhXiUNQsQXGBfnFG5Qmgba/+sWnheE9s8JOl+zj6CcTzV
         sB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bSsDnS6dbLhvTy+AVlfdF3LogW8QXbBSHC6yrMiBxcc=;
        b=Zom6fkbTeYr4bhRrJCyPkzgqIyBsf79qXOndmhxg2Rj/xqP2nGBoDrY4/8r96tX/kn
         bUvbM8MF03EIcbGNm28r/aSDsQWsY6WsiLbDNCssxc7I5zp4kfsc7OcFLRRA7uYTx6yp
         jZn3NRQWcj1DpJNM0JRSo+pOYOvQyFO5QnzTUhCIFhzl9OEaTjkGRbcBB8EM3i77/HZM
         h54XTt+xhTGWhD+QSRSnWFuzleO8CexCIwl+ytDZ/u82aiqVLU57EH1VrYeePO3Z28op
         0izSY0P1deEqcOFmdIFbl7qIQKQMDzq42FbKB+gM6ruJ6qRuHuM/mC3sEx+tPRpGbBRV
         Q6RA==
X-Gm-Message-State: AOAM532tf4YSd4J4VfInlM36oTbRrLdIcgej7vysnEON5NZP8QWmi1Lc
        sQaQumb4lC50fNsTqBrH4lodhQ==
X-Google-Smtp-Source: ABdhPJy0ovoxjIHjD8PCduT0ojbEEFGT4iXC21oduORhhszKoXbyOpWTh6E4hh/eMLxk+A997Kk40Q==
X-Received: by 2002:a05:6512:2208:: with SMTP id h8mr16310190lfu.636.1614794932537;
        Wed, 03 Mar 2021 10:08:52 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id j15sm2220990lfm.138.2021.03.03.10.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 10:08:51 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     mchehab@kernel.org, niklas.soderlund@ragnatech.se, bparrot@ti.com,
        mickael.guene@st.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [RFC PATCH 1/4] media: rcar-vin: use v4l2_get_link_freq() to calculate phypll frequency
Date:   Wed,  3 Mar 2021 21:08:14 +0300
Message-Id: <20210303180817.12285-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303180817.12285-1-andrey.konovalov@linaro.org>
References: <20210303180817.12285-1-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To get the link frequency value, or to calculate a parameter depending on
it the receiver driver should use V4L2_CID_LINK_FREQ. If V4L2_CID_LINK_FREQ
control is not implemented in the remote subdevice, the link frequency
can be calculated from V4L2_CID_PIXEL_RATE control value. But the latter
may not give the correct link frequency, and should only be used as the
last resort. v4l2_get_link_freq() does exactly that, so use it instead
of reading V4L2_CID_PIXEL_RATE directly.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e06cd512aba2..eec8f9dd9060 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -455,29 +455,25 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
 			   unsigned int lanes)
 {
 	struct v4l2_subdev *source;
-	struct v4l2_ctrl *ctrl;
-	u64 mbps;
+	s64 mbps;
 
 	if (!priv->remote)
 		return -ENODEV;
 
 	source = priv->remote;
 
-	/* Read the pixel rate control from remote. */
-	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (!ctrl) {
-		dev_err(priv->dev, "no pixel rate control in subdev %s\n",
+	/* Read the link frequency from the remote subdev. */
+	mbps = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
+	if (mbps < 0) {
+		dev_err(priv->dev, "failed to get link rate from subdev %s\n",
 			source->name);
-		return -EINVAL;
+		return mbps;
 	}
-
 	/*
 	 * Calculate the phypll in mbps.
-	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
 	 * bps = link_freq * 2
 	 */
-	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
-	do_div(mbps, lanes * 1000000);
+	do_div(mbps, 1000000 / 2);
 
 	return mbps;
 }
-- 
2.17.1

