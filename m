Return-Path: <linux-media+bounces-42721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 730EDB84D4B
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 15:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FF1F7B7C8E
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 13:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FF430BB88;
	Thu, 18 Sep 2025 13:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fZm4WIhX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4573081CE;
	Thu, 18 Sep 2025 13:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202083; cv=none; b=JltfBd8J/zYodxPiHhm3pY6/QAwHPYaijx02sZzKrObmmdO6x5mPongVxSfnMb6AAOp3MJraqbDx0r/18F0f74LqHKJNG59bKM8BFkOMVPXdaKk6fP06QXeuTx11Hs+0z4iQNiZo1oFpDTKeMT+tvqCaBiG+gtyu0hmLHHtJvzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202083; c=relaxed/simple;
	bh=IIvG0NOL5JlNAN8mr1RA0akmqtdsvU09cK9Dkf74kVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEHHEct0LeDz05n2SP+dCrg87fJ307BLJstn67OF2e9PkJFbJMDQqCW6fUDTCUwPqqLKZ+2V/8PwQ8sXeyICqNrHJH41doPcMEoKh30Avp/0BmFRVvLGe7ug5iqbh81qcbNpZ7e1GkLaF2qet66diD5E03rbuw23oFpISk2GEEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fZm4WIhX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from Monstersaurus.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30913C6E;
	Thu, 18 Sep 2025 15:26:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758201998;
	bh=IIvG0NOL5JlNAN8mr1RA0akmqtdsvU09cK9Dkf74kVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fZm4WIhXjqaQ7mPJopOUvKzxnDJ/jAPO6wy0tVivNZhLLeKW9gM+/R/WpDprxTo4Y
	 tqvuyshtyU3fqLx9RsxFfEiixk4OXUz8Kb6i523aT6bWOtcEYqCQ65wERvmxkDGe5w
	 oJ4AqtDoYWBkDVtPBOu6r4x7hmjp+8z5QKupG9YI=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] media: i2c: imx283: Report correct V4L2_SEL_TGT_CROP
Date: Thu, 18 Sep 2025 14:27:51 +0100
Message-ID: <20250918132753.3154059-2-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250918132753.3154059-1-kieran.bingham@ideasonboard.com>
References: <20250918132753.3154059-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Klug <stefan.klug@ideasonboard.com>

The target crop rectangle is initialized with the crop of the default
sensor mode. This is incorrect when a different sensor mode gets
selected. Fix that by updating the crop rectangle when changing the
sensor mode.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 67e8bb432d10..06c4b01868c0 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -956,6 +956,7 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
+	struct v4l2_rect *crop;
 	struct v4l2_mbus_framefmt *format;
 	const struct imx283_mode *mode;
 	struct imx283 *imx283 = to_imx283(sd);
@@ -982,6 +983,9 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
 
 	*format = fmt->format;
 
+	crop = v4l2_subdev_state_get_crop(sd_state, IMAGE_PAD);
+	*crop = mode->crop;
+
 	return 0;
 }
 
-- 
2.50.1


