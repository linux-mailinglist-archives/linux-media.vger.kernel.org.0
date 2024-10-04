Return-Path: <linux-media+bounces-19097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0859906C5
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04C22B27235
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AB01C3023;
	Fri,  4 Oct 2024 14:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vM3H1dAd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A62B1AA79B;
	Fri,  4 Oct 2024 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053249; cv=none; b=cy0pB70R8JmhqTx8Ue+LxsZ+8oDggp6CJHHrTizytl/Mt2h0eE8DFCim6BCLHchpqgKVtFYw2beyxkeDlXNSEH4ToNSY5TcTjhQ66G9r5U6nVHMKSqBrrj5qRY+qKD44GLxLGEDTzw1OusYPK/+JzlBBl/vmrcga8sXkLk9gNhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053249; c=relaxed/simple;
	bh=YZwoXk1L8PJ7hPEEE4HBMEf7JF2aTivwff5T/dhxk50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jbD0GBQZHhEpTvkNUHFXcWnojQu4sOXUqnaoDGVGbWrKWTUyIMdrFGSN6wAIgPIns89EV+y1K1nksHe57YKwAn8zliv76qbuql7pTZdtSGOna6xUYaCxiP1AmdPH1/Kpsw7MFlYWgELJmKSuaQlALqvxhGXW5PUKpa6Am5wjqkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vM3H1dAd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 802DFF89;
	Fri,  4 Oct 2024 16:45:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053143;
	bh=YZwoXk1L8PJ7hPEEE4HBMEf7JF2aTivwff5T/dhxk50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vM3H1dAd3Mv8C7eIub2xi87rHlTDfi+jloSUeldsDBs+5psqEYXpTExi9f229TfVE
	 PDGSrKuYonLBb8M1HnNkGZ/Nlu+xDB7xEmb6lQkZLghZIAk0MbMOvpr8Zr6yoSzY8Z
	 v0N+tGowIbh9T8MjVuJt0wGOol7dwogPNVqoBHRQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Oct 2024 17:46:38 +0300
Subject: [PATCH 07/13] media: i2c: ds90ub960: Add RGB24, RAW8 and RAW10
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ub9xx-fixes-v1-7-e30a4633c786@ideasonboard.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
In-Reply-To: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=YZwoXk1L8PJ7hPEEE4HBMEf7JF2aTivwff5T/dhxk50=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///ubNa/tNoH1W/FIvlR9qAZptXHoCIXsJw5H
 cuDizX7Fi6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//7gAKCRD6PaqMvJYe
 9QvhEACXMLAvEhGLpGRGz5x5/dSh89K2BualW4plfZNZctoDd7xjdthFVuy4gnLg48Pkyt4z7X2
 GkrluMDRrYYNt/dweN2OeuTTZCPZ+W3ARvM++R+5P0XZGnfcNecxY/37HD5hiiVXY/8x99998dM
 FkUxEGLUUuze5Ru+IVqM+EK6oE0BGkgtbSvIKOMpo66OXjV/iuPPsYhFSA6ZHJ4sdrPHblQhJYo
 Tm+C5SYtIKJcrlUT7W0Vrp7NFGvMPLNP7MFoNNAPh72JDs/rrMBa8EJ4SXYxFx25CRU2t+EfjpH
 CEI3nVaq0qr2bl6hNNs1gptOQpvm62EZL9XH9jFdWZlgzehdGuPEi6jWrPQr5tHKeFVkEiAJHK/
 Y/fKA2G82GYSVI5VJmSALS+uC4VvIe9DGIeKirMEYyMvJZSSU6z70rxlEjScg7lhZvybs0VzNiW
 yWz/OwtdmoFyH4yFLuutj41CCj/In1zhYu6t/XVwC2tEgt6wwqBGLL8edNSK+XFWlOMsT8vpEmh
 8UgY7aLKYTxpWi8opm97TLKLDSu/wrTo1kCocCL91SRGP/pSi0BuYHGM7Dw1qD8aX3DQJubJfb3
 j/ADsspxVP8K2BiNrq5NQw6FkUnrlYS7k0JPqs7fIQbSZ4nGS/FCNp+bzni05C8R8WjX2sFmbKO
 OlhEbL4vmrW2eqg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add RGB24 and RAW8 and RAW10 bayer formats. RGB24 is mostly for TPG
purposes, but RAW8 and RAW10 are widely used by sensors.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 5238088e23e2..09a19553ec53 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -580,11 +580,23 @@ struct ub960_format_info {
 };
 
 static const struct ub960_format_info ub960_formats[] = {
+	{ .code = MEDIA_BUS_FMT_RGB888_1X24, .bpp = 24, .datatype = MIPI_CSI2_DT_RGB888, },
+
 	{ .code = MEDIA_BUS_FMT_YUYV8_1X16, .bpp = 16, .datatype = MIPI_CSI2_DT_YUV422_8B, },
 	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16, .datatype = MIPI_CSI2_DT_YUV422_8B, },
 	{ .code = MEDIA_BUS_FMT_VYUY8_1X16, .bpp = 16, .datatype = MIPI_CSI2_DT_YUV422_8B, },
 	{ .code = MEDIA_BUS_FMT_YVYU8_1X16, .bpp = 16, .datatype = MIPI_CSI2_DT_YUV422_8B, },
 
+	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .bpp = 8, .datatype = MIPI_CSI2_DT_RAW8, },
+	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, .datatype = MIPI_CSI2_DT_RAW8, },
+	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, .datatype = MIPI_CSI2_DT_RAW8, },
+	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, .datatype = MIPI_CSI2_DT_RAW8, },
+
+	{ .code = MEDIA_BUS_FMT_SBGGR10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+	{ .code = MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+	{ .code = MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+	{ .code = MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10, .datatype = MIPI_CSI2_DT_RAW10, },
+
 	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .bpp = 12, .datatype = MIPI_CSI2_DT_RAW12, },
 	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .bpp = 12, .datatype = MIPI_CSI2_DT_RAW12, },
 	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .bpp = 12, .datatype = MIPI_CSI2_DT_RAW12, },

-- 
2.43.0


