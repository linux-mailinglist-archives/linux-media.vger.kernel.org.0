Return-Path: <linux-media+bounces-22599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2169E3857
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F71B2861B2
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B19D1C2337;
	Wed,  4 Dec 2024 11:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XNw0MJT6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265FD1B3950;
	Wed,  4 Dec 2024 11:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310360; cv=none; b=YwiqtA8SaeMYXVev+8DPl4AdyIFekt1/GnSZJHZvOFSG6KiY4BOFuGQUM7LHmIHiOiErF+9XmYGhI1l7cUxkdlSdwi+/4wEH+fvSDS5N/KS/Fvj2y5iw+6DwxIX7OzixGPE0dHFI3wI0D4zPbq9Zl192H0jcwygQpRzZZ4ClSAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310360; c=relaxed/simple;
	bh=/xIm447+xdq2t3RQ6TKOBOkTeZS8d2PO9dwv9gsXniE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=py+8F6HnThrdVW0ZGd3X4qFpia0iTn6W6gSxytm9ugtRi0IrHSIk0V6UvKodWSxL3yIXTlEXbScSJkqBhpftlnclXsPMCgvSqZZLRxM3dsH6uB0zKZDtlKRANuVPXyWGie7rzXysLmjXsVjq3CvnBaqbHTI4pTwOx22rW7SGf5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XNw0MJT6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6BC918E5;
	Wed,  4 Dec 2024 12:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310321;
	bh=/xIm447+xdq2t3RQ6TKOBOkTeZS8d2PO9dwv9gsXniE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XNw0MJT6ZUVIy5flAibVFIOsW0ruof6oIUXTaAOURitWr6lYWHCocKyFEY8Fwhvn6
	 yqQQ2L9gqOWoaTicxYxwYTVuaFmYsJyGU1uKeKz5SmbmAMBJzjbrlgYTvU7PQfHRxB
	 tEzpvzwGT+o9qi2EBYljeHHAyyDEpMgFYd8ou824=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:22 +0200
Subject: [PATCH v3 08/15] media: i2c: ds90ub960: Add RGB24, RAW8 and RAW10
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-8-a933c109b323@ideasonboard.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
In-Reply-To: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/xIm447+xdq2t3RQ6TKOBOkTeZS8d2PO9dwv9gsXniE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeENfy+291E3/4FKwDUrE/ZK90sE+2PGhwsC
 iZhIlBk4nqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3hAAKCRD6PaqMvJYe
 9ZxVD/9axHsielmtClBguKUXT5S7Uy0qa9NGZDwqYp6VJ5ZCqimRHA8edQfVIbU+e6QtFfqHg3V
 VYMA9eho/Lzf9vvlbBNCsIT1eACx3DQObvSNVRrpHgcjWGMUC7y0lPBg/u2xoDNf3bJ5ukcG92N
 CjQKJuXJeiy1E2979W6CTBJn3XdMM22Z0h4mxJiRaqUlJUAIE88YKp8BTu+cTRGb5QftTXZe6dL
 zIq9M9f0azKXhNv7ri5bZgVEycYKuLCSkXu9DFW4CgY6g/q6n+N8jQFr0PnC8GDUEqN3E+ERkOD
 8cIQNQayU/IEjSs22klMf+xdiIV9XU+5146fn0S5KZIU2YwVydPp8R4D6iN3r8O3hMT8RmWnvwm
 p2qVmlO8FPS81+04TsG0KFthZpB09jNdoBq2+7Uw6f+UKHt0wbcs+cIFmOLCd4aGsAaoyRY4f9f
 Qk6Gvs64l0f4MdgHq/fgsZvuo9orcQ2xGoOaTK6/7HUjqTaVh1CYnVdS8VwRNKMU+wn0xOsaOt3
 +F9NOS2bF2VPz8f3LN2qEkCRyV3ghYG1aa6X7/Z2zLCQMXYmj9V6XmxYhFrPazp9L8TgMkQGYcN
 j6lUbRu77BjIWWP54MYPzH+kl5w8wJAQvPdoSFZ0LBr3WhKaQ6Hv6BXSvULmxNmt0GLJ+5urgVT
 tdINWGKlbZ2Qo6w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add RGB24 and RAW8 and RAW10 bayer formats. RGB24 is mostly for TPG
purposes, but RAW8 and RAW10 are widely used by sensors.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 03938def6ae9..c2035cabf579 100644
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


