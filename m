Return-Path: <linux-media+bounces-2543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8814D816A4C
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 10:57:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA9021C229C7
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 09:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5F312B94;
	Mon, 18 Dec 2023 09:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Db1kw1mm"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B67512B6C
	for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702893402;
	bh=MDExTYdJkWIk2zvfyiU5HH3RUQbAn6qsgeRa4iGvBrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Db1kw1mmiqrLMw9bfiuNsSCgBxKIz+ROpArztmv9IALpR2eO3nttvjTAns73+BFsN
	 9yE+DVzmbZwB3yYjhp8ctqw1PwEqFn+nKUsokWWs1X7lEyUfaB29+j3kGJ+Qf7Dhhi
	 bfKsYXVyc4MBfXKL0tWdiDBJkOU5C4eUKcgz1+8fr+gL56Tfs7SsibWJGLGxqdAXxd
	 Fo4rWQ+vZW66qWMFBQdVlBMAWYqumNWfvy0ZaBd1AAdvwRWDIug6riQaXm3QW9sWeO
	 da7PpK0XEuVusSTl9cQfuSijl4BWDrN0YDF/wrHiwTTWTQ44/nS9NOpTwsTRHV4DnI
	 tnkO+CLwh2Oew==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4C9A237814A8;
	Mon, 18 Dec 2023 09:56:42 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: j-luthra@ti.com,
	mchehab@kernel.org,
	mripard@kernel.org,
	sakari.ailus@linux.intel.com
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 5/5] media: ti: j721e-csi2rx: add support for RGB formats
Date: Mon, 18 Dec 2023 10:56:04 +0100
Message-ID: <20231218095604.1950737-6-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218095604.1950737-1-julien.massot@collabora.com>
References: <20231218095604.1950737-1-julien.massot@collabora.com>
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
Signed-off-by: Julien Massot <julien.massot@collabora.com>
Tested-by: Julien Massot <julien.massot@collabora.com>
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


