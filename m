Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA47D5644
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2019 14:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbfJMMvu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Oct 2019 08:51:50 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42059 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729130AbfJMMvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 08:51:50 -0400
Received: by mail-lf1-f68.google.com with SMTP id c195so9943205lfg.9;
        Sun, 13 Oct 2019 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FZxFeCrxFGIcNgaEcgClIP7u+VMGwh8RhrVDPR5Zq0I=;
        b=pooACeax7mz1/0X5y6X0Ewndd0h99RtJrVFzzITjfRFomFGoUP4/L/x4kg9LdE9gN1
         pNhLWhm6WKL/R6dBsNDs5yG7MDW4OKNDFp3KioEciSyg8fxddgTx9ncC4y1y+gp8kEqj
         zsS7WlbZ9IKiQFNnZDcQc7R180d1rKHamMKWIQoFsVgRyQOo97piWSMVOFKiJ2hRft34
         sz1sCsVYuPdWCH4In7HXSde8VJcPQ8nBibqAGey/SHbgRDFmcz/XZTQKkbF3PGbeglAR
         d/VKdIG1zBY/veezFUX7f0+VMPBO80sdwUnGsYLu9bfvGydu6PQlVNP2+ocpVor7ueSg
         IwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FZxFeCrxFGIcNgaEcgClIP7u+VMGwh8RhrVDPR5Zq0I=;
        b=STgyhZ+8znyuig1duARPT9h7agcqkNGCJqjGADQywfGqONLSrb3/R8pAsku4y9MkYw
         UpaynCJ/43dAls8XNCtrBgE4BWez8U8DWfndLnhcX9+Wa+B9r9A4fURi0TYMTjjxUMO+
         i54U7194qplVvZrL/gswwxnxloEQjufwnbDmxwNj6hnffjSDcvvDUMuHUcLKp+QPF+l6
         m5rT2Mgepa6mw+iC/2y7V73V/keFKgEYs87xHwSxNol0uZlBTAwvuzT3bSgmAjzi5prY
         +GTYEh/CIFaG+L4God/NZoJUKYALV1YWmLaQ8sJIHbSXTb6EIim6QDFpXIPUos8/EUY6
         BniQ==
X-Gm-Message-State: APjAAAXbYj8kmHL6qkacsAP3byVFAehed6FY3smytHpp7LHU7ixMcgpQ
        /OzqIkOadazdIlGqulmwe8ARGcGH
X-Google-Smtp-Source: APXvYqz9uFYOwjLL9FvQPo6/ra4IRVTRHcsbtllp799O5s/ms8pVqxBTg3zugJM+4NNeD1ugrc/B4w==
X-Received: by 2002:a19:6a18:: with SMTP id u24mr14082419lfu.52.1570971106640;
        Sun, 13 Oct 2019 05:51:46 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id m18sm3327243lfb.73.2019.10.13.05.51.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Oct 2019 05:51:46 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH 2/6] media: ov6650: Drop obsolete .pclk_limit attribute
Date:   Sun, 13 Oct 2019 14:50:46 +0200
Message-Id: <20191013125050.4153-3-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191013125050.4153-1-jmkrzyszt@gmail.com>
References: <20191013125050.4153-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

That attribute used to be obtained from platform data by a soc_camera
host interface and passed to the sensor driver for .s_mbus_fmt() video
operation callback, later reused as .set_fmt() pad operation callback,
to be able to limit frame rate.  The driver stored that value in its
private structure for further use from .g/s_parm(), later converted to
g/s_frame_interval().

On conversion of the driver from soc_camera sensor to a standalone V4L2
subdevice by commit 23a52386fabe ("media: ov6650: convert to standalone
v4l2 subdevice"), that attribute had been replaced by a constant and
hardcoded to an arbitrarily chosen pixel clock limit.  Drop it.  Host
interfaces can limit frame rate if needed by calling
.s_frame_interval().

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index f60aeb1f7813..a50244401491 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -197,7 +197,6 @@ struct ov6650 {
 	struct v4l2_clk		*clk;
 	bool			half_scale;	/* scale down output by 2 */
 	struct v4l2_rect	rect;		/* sensor cropping window */
-	unsigned long		pclk_limit;	/* from host */
 	unsigned long		pclk_max;	/* from resolution and format */
 	struct v4l2_fract	tpf;		/* as requested with s_frame_interval */
 	u32 code;
@@ -546,8 +545,7 @@ static bool is_unscaled_ok(int width, int height, struct v4l2_rect *rect)
 	return width > rect->width >> 1 || height > rect->height >> 1;
 }
 
-static u8 to_clkrc(struct v4l2_fract *timeperframe,
-		unsigned long pclk_limit, unsigned long pclk_max)
+static u8 to_clkrc(struct v4l2_fract *timeperframe, unsigned long pclk_max)
 {
 	unsigned long pclk;
 
@@ -557,9 +555,6 @@ static u8 to_clkrc(struct v4l2_fract *timeperframe,
 	else
 		pclk = pclk_max;
 
-	if (pclk_limit && pclk_limit < pclk)
-		pclk = pclk_limit;
-
 	return (pclk_max - 1) / pclk;
 }
 
@@ -653,10 +648,9 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 
 	clkrc = CLKRC_12MHz;
 	mclk = 12000000;
-	priv->pclk_limit = 1334000;
 	dev_dbg(&client->dev, "using 12MHz input clock\n");
 
-	clkrc |= to_clkrc(&priv->tpf, priv->pclk_limit, priv->pclk_max);
+	clkrc |= to_clkrc(&priv->tpf, priv->pclk_max);
 
 	pclk = priv->pclk_max / GET_CLKRC_DIV(clkrc);
 	dev_dbg(&client->dev, "pixel clock divider: %ld.%ld\n",
@@ -756,7 +750,7 @@ static int ov6650_g_frame_interval(struct v4l2_subdev *sd,
 	struct ov6650 *priv = to_ov6650(client);
 
 	ival->interval.numerator = GET_CLKRC_DIV(to_clkrc(&priv->tpf,
-			priv->pclk_limit, priv->pclk_max));
+							  priv->pclk_max));
 	ival->interval.denominator = FRAME_RATE_MAX;
 
 	dev_dbg(&client->dev, "Frame interval: %u/%u s\n",
@@ -787,7 +781,7 @@ static int ov6650_s_frame_interval(struct v4l2_subdev *sd,
 	tpf->numerator = div;
 	tpf->denominator = FRAME_RATE_MAX;
 
-	clkrc = to_clkrc(tpf, priv->pclk_limit, priv->pclk_max);
+	clkrc = to_clkrc(tpf, priv->pclk_max);
 
 	ret = ov6650_reg_rmw(client, REG_CLKRC, clkrc, CLKRC_DIV_MASK);
 	if (!ret) {
-- 
2.21.0

