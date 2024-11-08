Return-Path: <linux-media+bounces-21132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9349C1945
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AA54B24736
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AE31E47C1;
	Fri,  8 Nov 2024 09:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hyNw1H7D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2E31E5703;
	Fri,  8 Nov 2024 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058532; cv=none; b=pWSWfoDeHmws9VKdFWqmhCdXAuH6uVmeGdfHnJUUwc2sEEm9TgeQk8dC0+WOAAyKulqxtDzxiSNopzH087AMf4JSk/zmPXhPhVyC38gCtiYIiRK0RZbL6SO10d5EqUY2bunrMObhg+nbNKfthCbpLm6mpknGKBP9fBo0iYwkARY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058532; c=relaxed/simple;
	bh=/xIm447+xdq2t3RQ6TKOBOkTeZS8d2PO9dwv9gsXniE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WygK8dYGml2Hjfb2UAfgD0e2JqNPnGmwdocC0KE+yz8vc6Gf/1rliTw1lVfV02FOf0nY00icXbTBAhcE9JUipuV6rpZeL+U2kHacsww2D8eecJu1/ETwAnXgegHNjI5egHx5T7+N6DiqsQIcZgcylr4T1+IdRQxPTCHgw+oOX48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hyNw1H7D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B31EF1986;
	Fri,  8 Nov 2024 10:35:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058511;
	bh=/xIm447+xdq2t3RQ6TKOBOkTeZS8d2PO9dwv9gsXniE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hyNw1H7D/mgGtip6oku6JV4aLdgSf4biEb5l72M5UV+0ckjETk1ktPv43efRs8bV1
	 dQjmYVDiwVEKKqc73JWpDr6DUJPtLJ7L2m0WSgxbpR5FOEc4Vg9zkRobVQIfZR6Y4X
	 TeU0uQh03c2EaxDGAb/UQxQSvxxTeAi/Td0NCIPQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:52 +0200
Subject: [PATCH v2 08/15] media: i2c: ds90ub960: Add RGB24, RAW8 and RAW10
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-8-c7db3b2ad89f@ideasonboard.com>
References: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
In-Reply-To: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
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
 bh=/xIm447+xdq2t3RQ6TKOBOkTeZS8d2PO9dwv9gsXniE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtQRPbnRY0mI9A4AmR3CN4kTK+XmstTBpx+V
 r9jL1bDP9mJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bUAAKCRD6PaqMvJYe
 9WcvD/wMVZYZnp6DaSMG66WfWWbhWuO/XX80s8IKNdyU1QZP/ldTO4x+dK1g+y7lMmtnuo1sal5
 yMYRAy9AlL30yr43M29OAKmcRGwsgQHpbdp1Mbje8r+kYs9NbweKDynwLzRR7pUEpeCxQrDilqD
 Y83krus0eyGCCQ7ukeP/ZzE/qCwZRKiItg+ql0/cBbUzV3yprk8IPS/tufDp7+JA/+ED/L56Ehc
 fTxwsur52Khd7SMQAzFFBQrL+OoJpMYI5WwXxoefFMYle7ZVbqa16Qo8xpzFyc75S+66cFDd0Gc
 iNR5QhMQLFbpm+JyyIumkH/65JRR37i5183ulLNLqSjv1OLvvyTg8KTpMUcyCq07ytuqVxxS4iv
 5oiWOG5b9WU6jw9vc5ZLUS55x7zX3xOVdWz9i6OR0MflLBef/bofcMwDOe0Fbmz8s0Lk1Wt0op+
 lEIQIL6cAjAu513jktbq2HDbBhXbUyELK8230shYPfG39hljVF684mWhbVWIdocDVO7DEQYIiiF
 sunDb522Pq2lk0OMYACyjqW/TMQoDnm9wYh271N3GwjcnGaIi834p/z+oYURbleEPHaSzbHheRO
 Sa38neKXXMuIDdvtZllTXCxpSfyyWIEnEdclU1RHDybq9aHLlb6YMfR1cLRDD9vhRjL+kQx1FM1
 BEeS+m2GZlV+pww==
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


