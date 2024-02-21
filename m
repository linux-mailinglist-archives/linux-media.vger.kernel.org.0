Return-Path: <linux-media+bounces-5526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 654AC85D10D
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 08:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95D3A1C22AA5
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 07:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32383A8C6;
	Wed, 21 Feb 2024 07:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="k79V6Tl1";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="d+oNQomS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A03A26E
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 07:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708499760; cv=none; b=J+mfX4yeLXW5FhO3bNbfEgoMXJGmgQDV1ZZh/MvLgjTdCbLd/S9UbVc5lvrgCYK1TPzDB8+cVcdWqKYfsUcyY3ykOY5QzVJZ2r+VTRJVBlXJhX+e6LKaDXeNeLSEMFG5Am1fz8WqF3XLlrtlqNTrD0yVOVKrezlgl+EfqsUay5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708499760; c=relaxed/simple;
	bh=l+GowOlQJNiTzIp7BNlvqI2qcTcPnoTO9kqHcNIwJOI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ghkG1Zz29MPbOKKlfSPmb4k0+10AaLASK+sxiV/tIR+/DFb2Hs78PKIvbNW+COFAt/FJKZnUzk3ubuyvhg9JTgKYAFBoTYuEESo1wIsFOur5yK5T/a18RQGu/NY81m/VDXrR1CdhUmxkz7XuNRRg/DnZdEvfXDly9vzErTJkCts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=k79V6Tl1; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=d+oNQomS reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1708499756; x=1740035756;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5qSUrU6e2SmDtJxdmcHwpdh07Hk6NDpyFgCxgJB/5j8=;
  b=k79V6Tl1/WDtg3lYqEvl36wJpzSh884ixY895g0wYUjHwjaWPuyehHur
   j8Nt0dDD6roBCtvi9xeSO0V+FtcxvV4NwhpYJeli1qgJPOBZzCMyw5248
   Cpwc4g5aDBZiZXZTj8GZbZFy1jMeh6SYiazglKj4FoEU/dhiZ8O+/3Q1f
   DqtdoTBOJyWma8EIMAxAg54JfFgZRWxTPibiZ2Dda07zoU2hMhS9h99g6
   Y7ZqLJJfcA+iTICaIimGGStM4lelnEBRlKjjCIc4SJVx4oixKhqa24AAH
   w+BtBymnec+dS0RmHaS4eIXkOXlUwv+ZPEfbaN6sh07zBBSP/hUJ30kzt
   A==;
X-IronPort-AV: E=Sophos;i="6.06,175,1705359600"; 
   d="scan'208";a="35512537"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Feb 2024 08:15:53 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C8CE1713F1;
	Wed, 21 Feb 2024 08:15:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1708499749; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=5qSUrU6e2SmDtJxdmcHwpdh07Hk6NDpyFgCxgJB/5j8=;
	b=d+oNQomSomy1GoLoS/TPJi3Dm8f3pNoQlEwsVwhoSVg58wARK9nob5x18nBVOzu1jeNBPr
	SEljKanZripWSXjDKNj45ZPBARkwWQJ9QxT/WbKJGOZgtnDXH9QyYHPX7itCcgOk2nG+Dr
	Uzl8YwXjrB6nrqjBvMXM+OY4YSmQzFdn4WxpFO6JW9ict4lGm628c6bBQgQ7f+ZGtDbA79
	T+jUsEmOo8DEKJT5a0PWGc3xDzTQcwbYM9UNX+EulFD05NUP87Yzjr4rkdqRsJnwRLqYhh
	W+qIJ9loZs6SgoKrozbK7XBFZ6+k03dJiPvyjSAPO4hsa9H+/0gifUkm3IOWEw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: i2c: imx290: Fix IMX920 typo
Date: Wed, 21 Feb 2024 08:15:50 +0100
Message-Id: <20240221071550.2769570-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Replace IMX920 by IMX290.

Fixes: b4ab57b07c5b9 ("media: i2c: imx290: Add crop selection targets support")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 89fcebe178395..d75e36018cdc0 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -150,10 +150,10 @@
 
 #define IMX290_PIXEL_ARRAY_WIDTH			1945
 #define IMX290_PIXEL_ARRAY_HEIGHT			1097
-#define IMX920_PIXEL_ARRAY_MARGIN_LEFT			12
-#define IMX920_PIXEL_ARRAY_MARGIN_RIGHT			13
-#define IMX920_PIXEL_ARRAY_MARGIN_TOP			8
-#define IMX920_PIXEL_ARRAY_MARGIN_BOTTOM		9
+#define IMX290_PIXEL_ARRAY_MARGIN_LEFT			12
+#define IMX290_PIXEL_ARRAY_MARGIN_RIGHT			13
+#define IMX290_PIXEL_ARRAY_MARGIN_TOP			8
+#define IMX290_PIXEL_ARRAY_MARGIN_BOTTOM		9
 #define IMX290_PIXEL_ARRAY_RECORDING_WIDTH		1920
 #define IMX290_PIXEL_ARRAY_RECORDING_HEIGHT		1080
 
@@ -1161,10 +1161,10 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
 		 * The sensor moves the readout by 1 pixel based on flips to
 		 * keep the Bayer order the same.
 		 */
-		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
+		sel->r.top = IMX290_PIXEL_ARRAY_MARGIN_TOP
 			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2
 			   + imx290->vflip->val;
-		sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT
+		sel->r.left = IMX290_PIXEL_ARRAY_MARGIN_LEFT
 			    + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2
 			    + imx290->hflip->val;
 		sel->r.width = format->width;
@@ -1183,8 +1183,8 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
 		return 0;
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
-		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP;
-		sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT;
+		sel->r.top = IMX290_PIXEL_ARRAY_MARGIN_TOP;
+		sel->r.left = IMX290_PIXEL_ARRAY_MARGIN_LEFT;
 		sel->r.width = IMX290_PIXEL_ARRAY_RECORDING_WIDTH;
 		sel->r.height = IMX290_PIXEL_ARRAY_RECORDING_HEIGHT;
 
-- 
2.34.1


