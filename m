Return-Path: <linux-media+bounces-45987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A82FBC1F099
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39F983AED24
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC4B33B6CC;
	Thu, 30 Oct 2025 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KmyL0LEQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ACD338F5B;
	Thu, 30 Oct 2025 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813810; cv=none; b=ceqcVazKPgwxI2gfxLDyy+EGSRuPWDAIK+1VkjANrYXkBg6Fk4amp6wfD2Q5zdl1C8zo6QHjLc/Nr2rD9JlQbW8S9V4Tl0d5OZE7nsd98hd4HTmruR3jsmZ7PnjiQ1BnxODZKYcuy3L6qSikRT7e8xFjF5ZcZ/lxHXQLT1zACbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813810; c=relaxed/simple;
	bh=vREb5QGLlC+MfWhaXitSYjEqSFA17LTQdF1ZiG0e5dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mnqm/06GqmaJrJnHqDJx4nPEJjC3IGJjNZT/mVNfZkWVuNHRokOrFf+R6C7maDTgoGApoDHDt3xKzjfMPmaYkT/fDmJtKSLgnq+gPbOPEm+vwpnKbstEwm1xwbasiRVccsHU/48k26WT65V/V95sPlj0jD2DGn0erkUCd1rvQwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KmyL0LEQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DE3FEAE;
	Thu, 30 Oct 2025 09:41:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761813697;
	bh=vREb5QGLlC+MfWhaXitSYjEqSFA17LTQdF1ZiG0e5dE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KmyL0LEQN7S2tjh33gXYiRpIKesw9OknqGTiDe12UqxHhItTheobmyB/4bqENdu3w
	 Ru00Tt475ltPE+cw1Q1r9YMldTTDaQa3neK7DasQ24kNCdddnBHn+LTu0PjWgvWXNi
	 vzIhJ7fqhRaoBomg93MEwfqT0jZGZDWUd2UHy+iY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Jain <uajain@igalia.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 3/8] media: imx335: Update the native pixel array width
Date: Thu, 30 Oct 2025 14:12:56 +0530
Message-ID: <20251030-imx335_binning-v4-3-534f82415aa7@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
References: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The sensor datasheet reports actual total number of pixels as 2696x2044.

This becomes important for supporting 2x2 binning modes that can go
beyond the current maximum pixel array width set here.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 770adc3106321769823f757d0d3277d1948a6bc2..145b4415ba590245ab49c0124d8094683adddf0e 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -124,12 +124,20 @@
 #define IMX335_NUM_DATA_LANES	4
 
 /* IMX335 native and active pixel array size. */
-#define IMX335_NATIVE_WIDTH		2616U
-#define IMX335_NATIVE_HEIGHT		1964U
-#define IMX335_PIXEL_ARRAY_LEFT		12U
-#define IMX335_PIXEL_ARRAY_TOP		12U
-#define IMX335_PIXEL_ARRAY_WIDTH	2592U
-#define IMX335_PIXEL_ARRAY_HEIGHT	1944U
+static const struct v4l2_rect imx335_native_area = {
+	.top = 0,
+	.left = 0,
+	.width = 2696,
+	.height = 2044,
+};
+
+static const struct v4l2_rect imx335_active_area = {
+	.top = 50,
+	.left = 52,
+	.width = 2592,
+	.height = 1944,
+};
+
 
 /**
  * struct imx335_reg_list - imx335 sensor register list
@@ -862,21 +870,13 @@ static int imx335_get_selection(struct v4l2_subdev *sd,
 {
 	switch (sel->target) {
 	case V4L2_SEL_TGT_NATIVE_SIZE:
-		sel->r.top = 0;
-		sel->r.left = 0;
-		sel->r.width = IMX335_NATIVE_WIDTH;
-		sel->r.height = IMX335_NATIVE_HEIGHT;
-
+		sel->r = imx335_native_area;
 		return 0;
 
 	case V4L2_SEL_TGT_CROP:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		sel->r.top = IMX335_PIXEL_ARRAY_TOP;
-		sel->r.left = IMX335_PIXEL_ARRAY_LEFT;
-		sel->r.width = IMX335_PIXEL_ARRAY_WIDTH;
-		sel->r.height = IMX335_PIXEL_ARRAY_HEIGHT;
-
+		sel->r = imx335_active_area;
 		return 0;
 	}
 

-- 
2.51.0

