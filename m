Return-Path: <linux-media+bounces-20604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 287289B6940
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 17:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D310D1F223A2
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 16:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3D82144C0;
	Wed, 30 Oct 2024 16:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QYofRV1r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B390A26296;
	Wed, 30 Oct 2024 16:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730306111; cv=none; b=DRcfzM3PyKgh4+3Wrhptg/SNeW0Qr62nAc8DL1vzHVg3TXIJxdgYwkshpHC9kRIT9kH5rE+2hA2DyMPG467PpXE9lKEEj0L91fX4cr9Lm7vXbC1fEHPDs+u3hbqRgCjqJpQkuNsehF3hl1C2qhCWvY5A389Wkd780PziSHcexO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730306111; c=relaxed/simple;
	bh=8aIoP0AITAVflNZ02qtNP/BZx4ZXfd+7ncAMgQYji4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pWD3pEjOGHKV0Q2+vEyMoaCQlEVvJ5OJPRTx98y+wlWjF5TC+JFGUln/XhiiANKIrLx8rdMYJaYuZ2ZNIGHXmhRAMc6XQ9w+in35aB0d/1RZIhIgB/rBXvrSE580TGfMbTre3Gidu68gpzpOv4nYlCXK2X+Gg+A2WGd7FCTN8qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QYofRV1r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a7a3:a679:a325:f9b7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FEEB1083;
	Wed, 30 Oct 2024 17:35:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730306103;
	bh=8aIoP0AITAVflNZ02qtNP/BZx4ZXfd+7ncAMgQYji4Q=;
	h=From:To:Cc:Subject:Date:From;
	b=QYofRV1rnjD+1WphbZ8+WiiZBdtERciBx3EEzuCgTNLktQJWKGiRvLBN1k4whBX5f
	 EVYgDph54PY2pesCNO7QqK0UHvw2riGrjN0YItiQEyFqdaqBi+MRkmHtveNdJTJlR+
	 TQhOrUbKgM08mRuxst/Ac5qofHPlrD8aQBZgwxuQ=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: imx283: Report correct V4L2_SEL_TGT_CROP
Date: Wed, 30 Oct 2024 17:34:21 +0100
Message-ID: <20241030163439.245035-1-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The target crop rectangle is initialized with the crop of the default
sensor mode. This is incorrect when a different sensor mode gets
selected. Fix that by updating the crop rectangle when changing the
sensor mode.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 3174d5ffd2d7..c8863c9e0ccf 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1123,6 +1123,7 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
+	struct v4l2_rect *crop;
 	struct v4l2_mbus_framefmt *format;
 	const struct imx283_mode *mode;
 	struct imx283 *imx283 = to_imx283(sd);
@@ -1149,6 +1150,9 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
 
 	*format = fmt->format;
 
+	crop = v4l2_subdev_state_get_crop(sd_state, IMAGE_PAD);
+	*crop = mode->crop;
+
 	return 0;
 }
 
-- 
2.43.0


