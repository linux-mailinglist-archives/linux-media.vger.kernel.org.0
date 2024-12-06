Return-Path: <linux-media+bounces-22782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9949E68D1
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5DB1284C9A
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFC01FA844;
	Fri,  6 Dec 2024 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dpo1sSO6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D965F1DFDA1;
	Fri,  6 Dec 2024 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473650; cv=none; b=VtfxOGbqaic2m75O38msGJiFZfqQUWZBhz0D6Z5AfLcHnBXoLEgkO8J6VffjdlYnOY+gDKoAO+Ri3EM86T7utprCLuAb4Umig4GyBWQCrKKrSjayF30aF+q6UXB/ehAweuq28aTwuqFuC7RvtstGkv4CobbeFviNM+Aw5xeoGjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473650; c=relaxed/simple;
	bh=af3P1y/AaDEhRKiWsMEMRg/+bubJgEEA6od+ONwb6wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QsFOZsSVL8tpylX35Q4ZoEjSBMXRtQfvjA5cosl6Yif1F/w0vckRYWu4ddFjj+8Ba2JqlEKEdEFjv0AUxNk+KA9Np8hZ2nK62gqDPZNQ9WDc6V892rPwB1TisfdcSQ/UcmcwR9yPhdG+LnThcYqtPi7YD9WCHK09W2VZYMbXcpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dpo1sSO6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B8E31980;
	Fri,  6 Dec 2024 09:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473609;
	bh=af3P1y/AaDEhRKiWsMEMRg/+bubJgEEA6od+ONwb6wg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dpo1sSO634+Ya7VJTmUVMvhwnB5Z8Rh175cPBn0z0RbhGxfX53tKkHzQ6FUuweuEM
	 xloQM4yddh5kQHkoQeLEjGsQbYs01657WCNX/EWfY1ZgY/Ix1gug7nK0bfhZ9DhuHN
	 w/xzO9T6cGVfy3QfCoS2pziOiasfuHMXwXipp/MU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:44 +0200
Subject: [PATCH v4 08/15] media: i2c: ds90ub960: Add RGB24, RAW8 and RAW10
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-8-466786eec7cc@ideasonboard.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2061;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=af3P1y/AaDEhRKiWsMEMRg/+bubJgEEA6od+ONwb6wg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVe/jYMWYstY3ZwDXeRlraFIILoPxlvK91S8
 9U5a2NADlKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1XgAKCRD6PaqMvJYe
 9c6nEACDVriBFbjGt9dmaNO+iwyRdZz2wJZ5/ZnfHHXw1n5VV9qOCnABPB4qLnPmMUYT1cVo+PU
 BseymEcl4lSGY46JJBL9mmSpqwORWo/wc2B23zaaGKdx0c+OyPiJdwWnbPwCvvuBcw9W7rQDjGE
 Vr1zUOv6xklhzzPm6khgfvQJq3zpm4a5jR1PZ7OmFiy3WOh/5E7rvE8bdAFZqhmWCK1yazlhc51
 zWkKDwI8ZiGCs7L1VUrcsX3yG6d5fw/EACV3pGdUJs9DF3agkvkByYX94LfhcyRiFnEra85X/LJ
 uStKmi1Ujl4xx0Rj27k4NXbB/+1At2y/EEZOo0cODCVNgzW81ZazTdgOVkVWMWmgE9DZ+N6hjdc
 v9qEZbu8v93GTeAGfMOxiq3iH0BkY2ZZ5o1zv+7YxSl1zxdZ1Tgb2enZZvXR3OuaCLvOFLljIaK
 5tu6gqJuIs+CYoLQrzZoBNXihAK61Hsl/PAwfUMshvJ+YVEmUYioi+9Zos0zkhLL4M7CJkHD/8X
 MSfBP7xD2zPOEvoLFx6dAbtMOMYuPMsdfCUzzHifrhVgSvVoveROP+II/5Pwz6Z24d5iO+eRi2v
 iPlEi6BYuIA/WWeAumCToUVfxeGfEk8NspYdaWZclnKPrvd9tYWsDXrD3sGKqlOwyN3hx7xQbBy
 pBV3vDZevzSwnpg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add RGB24 and RAW8 and RAW10 bayer formats. RGB24 is mostly for TPG
purposes, but RAW8 and RAW10 are widely used by sensors.

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index bd575bca2b42..721898e5c913 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -581,11 +581,23 @@ struct ub960_format_info {
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


