Return-Path: <linux-media+bounces-3230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E877E825071
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 10:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C3A31F22915
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 09:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415CB2420C;
	Fri,  5 Jan 2024 09:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lv7prpUc"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6116622EFC
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 09:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704445250;
	bh=An2ADCiLLYcsvFJdiBFKTBezo4gqpDY46k8axB9M22c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lv7prpUcEYE/+HEZL41e6cEV+fCxQdzKKuYSxrHDz+uhZJkdJx94m1jtAJrVTfWT5
	 sWTYR7ybDVLp6gaazXWL5Z6pKuVNq54gTl2ef/FITn6GknGIwZh/9l/cU7clW3OME6
	 XO36oqyrt1uQ73QRAYIWCGSQ8NTvvutM8KKOufMFlcxI1FQw08s97XZkAo9xvHZU3b
	 fZUPr14KoJytAkf6uDdUZM0y3KRnYGXzZJVdDy6k988nQOaFXi9m5AEeH1J72rW3js
	 A6kM9fNvpd6+bhp24gUGUoAWpXZi1Xqna8/uDpAB63DU5TL5Xe+KybnUi98YGlflom
	 e4AWMpRobrCbQ==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3A1A63782037;
	Fri,  5 Jan 2024 09:00:50 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: j-luthra@ti.com,
	mchehab@kernel.org,
	mripard@kernel.org,
	sakari.ailus@linux.intel.com
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org
Subject: [PATCH v3 5/5] media: ti: j721e-csi2rx: add support for RGB formats
Date: Fri,  5 Jan 2024 10:00:25 +0100
Message-ID: <20240105090025.1245112-6-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105090025.1245112-1-julien.massot@collabora.com>
References: <20240105090025.1245112-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jai Luthra <j-luthra@ti.com>

Add support for RGB565, RGB888 and BGR888 media bus formats.

The pixel formats for these have a different byte-order than the MIPI
bus formats, given the SHIM IP [1] unpacks them into memory as follows:

MIPI RGB888 unpacks to:
BYTE3		BYTE2		BYTE1		BYTE0
00000000	RRRRRRRR	GGGGGGGG	BBBBBBBB

MIPI RGB565 unpacks to:
BIT 15-11	BIT 10-5	BIT 4-0
RRRRR		GGGGGG		BBBBB

[1]: AM62x TRM: 12.6.1.4.5 "CSI_RX_IF Data Memory Organization Details"

Link: https://www.ti.com/lit/pdf/spruiv7
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 6e58112957ce..15ddc851737a 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -188,6 +188,24 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 		.csi_dt			= MIPI_CSI2_DT_RAW10,
 		.bpp			= 16,
 		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_RGB565X,
+		.code			= MEDIA_BUS_FMT_RGB565_1X16,
+		.csi_dt			= MIPI_CSI2_DT_RGB565,
+		.bpp			= 16,
+		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_XBGR32,
+		.code			= MEDIA_BUS_FMT_RGB888_1X24,
+		.csi_dt			= MIPI_CSI2_DT_RGB888,
+		.bpp			= 32,
+		.size			= SHIM_DMACNTX_SIZE_32,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_RGBX32,
+		.code			= MEDIA_BUS_FMT_BGR888_1X24,
+		.csi_dt			= MIPI_CSI2_DT_RGB888,
+		.bpp			= 32,
+		.size			= SHIM_DMACNTX_SIZE_32,
 	},
 
 	/* More formats can be supported but they are not listed for now. */
-- 
2.43.0


