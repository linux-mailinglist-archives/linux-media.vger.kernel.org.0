Return-Path: <linux-media+bounces-10556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B61CE8B8D2D
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 17:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4EC3B23AD0
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 15:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A4C13340D;
	Wed,  1 May 2024 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="sF6+cUNB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta24.mxroute.com (mail-108-mta24.mxroute.com [136.175.108.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B4E133297
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 15:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714577494; cv=none; b=cy07649DPjhExriUh99cuDMaXYeakLazYT9fLwMR3PfjwgDtMsRWoxdukVoNPrVW21d1WadKTBs+yhOsiAnz+CMeVka6ktACTqzJQeK9RuqdGIMCQiWZzAgbDgpTQi/GceDAw32J6rVohv3pr8/3z5RGorxqY6H898JGXadpaqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714577494; c=relaxed/simple;
	bh=pQK2j/aOaMt8ywl27zkrasiDgTR0TE4do7sZJlOPRRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9K43KuNkW4rKqkaXnqFyPExL2gYHAUEhEJhijgH9Fy8TMKDE/+xJHAlbeSVXVIJDRYz78tiQO/2ZIvnKJ5GV5f9M+1/1WECcFJBFePtpYjnLK3m7lRCtAjC9Vi3xxF6vAQVQ5g1bPwscVWuiLgDNjpV9FIjMRzt/BFnHzH40iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=sF6+cUNB; arc=none smtp.client-ip=136.175.108.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta24.mxroute.com (ZoneMTA) with ESMTPSA id 18f34c2a8f10008ca2.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 May 2024 15:25:23 +0000
X-Zone-Loop: b172f6bc72044d29956f5a22e005cd2d3af113cb6cc2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xTu7TgWqZVAd6M9P/qgtMjmNVXvV33CqoO1c4TcfXKM=; b=sF6+cUNBUNjUpX54jnLdLfUJIB
	BGdEb7Z5kkBFMr+Ptoo6XYiM6pFNSQTyuq+fvVd0y6QMca8E+nMI91AXkF4HVZ2PP2ayDMGVEUKra
	9JkFDSQZmK9IshV7fe5PgK8n2QzE1xb2f2SqoxSkEqX/k9bDcfndtBkDRniMQGSH2Hy2ELhHjqU6w
	jMECHm+ut9IKOpSK8FDKjaEwCFshnzPnWa0ej09cZgMqT0vu5EvQQPzpnFXHTv7cNJniwfr9X8piY
	8V+p/7tAJggLTgBkqdUry5hmGENrD9xShLHlsKDb6W0sjmCGF2MZD0jDmqAgQJmxAQcA7cDeZva34
	xXeYbUaw==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v5 15/25] media: i2c: imx258: Set pixel_rate range to the same as the value
Date: Wed,  1 May 2024 09:24:32 -0600
Message-ID: <20240501152442.1072627-16-git@luigi311.com>
In-Reply-To: <20240501152442.1072627-1-git@luigi311.com>
References: <20240501152442.1072627-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

With a read only control there is limited point in advertising
a minimum and maximum for the control, so change to set the
value, min, and max all to the selected pixel rate.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/media/i2c/imx258.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 9c83ba1232fa..4eb5f2eba491 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -971,7 +971,8 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 
 		link_freq = imx258->link_freq_menu_items[mode->link_freq_index];
 		pixel_rate = link_freq_to_pixel_rate(link_freq, imx258->nlanes);
-		__v4l2_ctrl_s_ctrl_int64(imx258->pixel_rate, pixel_rate);
+		__v4l2_ctrl_modify_range(imx258->pixel_rate, pixel_rate,
+					 pixel_rate, 1, pixel_rate);
 		/* Update limits and set FPS to default */
 		vblank_def = imx258->cur_mode->vts_def -
 			     imx258->cur_mode->height;
@@ -1261,8 +1262,7 @@ static int imx258_init_controls(struct imx258 *imx258)
 	struct v4l2_ctrl *vflip, *hflip;
 	s64 vblank_def;
 	s64 vblank_min;
-	s64 pixel_rate_min;
-	s64 pixel_rate_max;
+	s64 pixel_rate;
 	int ret;
 
 	ctrl_hdlr = &imx258->ctrl_handler;
@@ -1293,18 +1293,13 @@ static int imx258_init_controls(struct imx258 *imx258)
 	if (vflip)
 		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate_max =
-		link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
-					imx258->nlanes);
-	pixel_rate_min =
-		link_freq_to_pixel_rate(imx258->link_freq_menu_items[1],
-					imx258->nlanes);
+	pixel_rate = link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
+					     imx258->nlanes);
 	/* By default, PIXEL_RATE is read only */
 	imx258->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
 				V4L2_CID_PIXEL_RATE,
-				pixel_rate_min, pixel_rate_max,
-				1, pixel_rate_max);
-
+				pixel_rate, pixel_rate,
+				1, pixel_rate);
 
 	vblank_def = imx258->cur_mode->vts_def - imx258->cur_mode->height;
 	vblank_min = imx258->cur_mode->vts_min - imx258->cur_mode->height;
-- 
2.44.0


