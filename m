Return-Path: <linux-media+bounces-44836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D997BE712B
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 10:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B2084FCD8A
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF86427877D;
	Fri, 17 Oct 2025 08:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tdx3Movb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601ED271441;
	Fri, 17 Oct 2025 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760688869; cv=none; b=lpfMBFTVHA34caIdBLyDrt2bZDcuN32N2o3XIUJhWvE+vQjNAn8XKjMT7i41rzCdwFGgq/uzdtEYuK9SWhlE4Z5tuK89F7914QOggy4Rl42vfIwJ/w18QnmJwjTIUkmhdoj6lxO32yQQcNeon/U9d+vDVL+c7h1dQhTpFFwGs7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760688869; c=relaxed/simple;
	bh=Oofl3IFmbQbxGrlpyCmCAZh1xKDxPMsqOUsZ45j7OsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dlPaYITJigcJ6nSnJiFzj+O0JSzJupRK1mqc4NtMEpuE5N6tZFrdBbL4a605h+eaWOfQgoEJsvEcnH987CMG0B1XvlrH/kBRvDIZ4vwF/v/pTl/8o6PosZlrQkg5u4I4C0SaWComVMl/j26+UZAKMbI3LxwmwC8S+4CK7bg7oas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Tdx3Movb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:2112:eb18:6ce9:5a39:76a2])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0030C1E2F;
	Fri, 17 Oct 2025 10:12:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760688759;
	bh=Oofl3IFmbQbxGrlpyCmCAZh1xKDxPMsqOUsZ45j7OsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tdx3Movb0bDVeilteFdX+v/sx4Y3hXIHRrBYCx24+1fe/kbQur5VfKrOHOSyJEfCp
	 Cz02PPEgCJSno6i6WkKEyUWAbX+cEeXFXn0mIjIIJzEm5iHcp+xzdwghZb2t3GFbeE
	 Ve9jHgE60DfoI8j0+L+6cNkjo+3krsnvj5OdWg1Q=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Oct 2025 13:43:49 +0530
Subject: [PATCH 1/2] media: i2c: imx219: Fix 1920x1080 mode to use 1:1
 pixel aspect ratio
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-imx219-1080p-v1-1-9173d5a47a0c@ideasonboard.com>
References: <20251017-imx219-1080p-v1-0-9173d5a47a0c@ideasonboard.com>
In-Reply-To: <20251017-imx219-1080p-v1-0-9173d5a47a0c@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=8SZm99f+rftgGOpRtMJy2AmvPN5HZJgT0f6H4Q0hi/k=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBo8frObKqqluFD5NttMK5T7EaqA7TTxx1jqlGIl
 J3lFUwSkAGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaPH6zgAKCRBD3pH5JJpx
 RSVgEAC1x/2H1siWB6rfMrCrFgnFQeNA3mF7O3mUsPq5OutPeQ25rbeOvU7FD4QUgAWK/yqqhi9
 WmVK/QueTiqqXMWMoqaq34XCSqvoxpSEv9r59CWO+261mxfVvZ6j3j+Z3oOQ1lmbgSceft+f6c9
 V4HgJPOzPBEf8CdycadC3yGXc8GR4WD6+j2Uq8dHz52wYRsrgBezGsEy6k6eNFdzkiu64xzsXP0
 4R/2YIJVnRME5nEUeLBEHnKvIw9pep+32BoRtgWNdKdTudQbx7rELBCEpjd3Oh6FyhHZd23KMw9
 oOJPYLM+YvnV2TQj2E+Yjc81GKQOw3mlxJEa77gIPBaTc1EpwDwoVeQBWG+6ckIAKYnAQoQyC38
 oFOimJIpJL6TRGXv7xZ5YNHJUg65Onyy9/e0+JX+uWEvd6MB+vW3TAzL+tdKxZEBPJl1AJhfBsw
 UZZRAPzVtqvyUvOrqslJKFXrrTCM7MGg8GDdreD8jbM3qrqqLT9f8jfyQirvxhqAvmWtlfJLZTL
 qh/sx9IyrmfkA/Pw4wkpk7rZ8hsEHnr4bYnyaQ4/auI8cqp9B2y3ebg5qw8iIYqQYlm4U3XM8tr
 20EB7PVHXAQ0yAXUdzONBekCEUd/CqdMbrhGMpmIKDqSgWv+Aa9IYd5iCGdRlBAq0Jr+gx9Qkph
 UaIu7fxkm9adF+A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Commit 0af46fbc333d ("media: i2c: imx219: Calculate crop rectangle
dynamically") meant that the 1920x1080 mode switched from using no
binning to using vertical binning but no horizontal binning, which
resulted in stretched pixels.

Until proper controls are available to independently select horizontal
and vertical binning, restore the original 1:1 pixel aspect ratio by
forcing binning to be uniform in both directions.

Cc: stable@vger.kernel.org
Fixes: 0af46fbc333d ("media: i2c: imx219: Calculate crop rectangle dynamically")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
[Add comment & reword commit message]
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index c680aa6c3a55a9d865e79ad337b258cb681f98fe..300935b1ef2497050fe2808e4ceedda389a75b50 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -856,7 +856,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx219_mode *mode;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
-	u8 bin_h, bin_v;
+	u8 bin_h, bin_v, binning;
 	u32 prev_line_len;
 
 	format = v4l2_subdev_state_get_format(state, 0);
@@ -877,9 +877,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
 	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
 
+	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
+	binning = min(bin_h, bin_v);
+
 	crop = v4l2_subdev_state_get_crop(state, 0);
-	crop->width = format->width * bin_h;
-	crop->height = format->height * bin_v;
+	crop->width = format->width * binning;
+	crop->height = format->height * binning;
 	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
 	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
 

-- 
2.51.0


