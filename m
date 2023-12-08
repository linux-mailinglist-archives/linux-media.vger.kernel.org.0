Return-Path: <linux-media+bounces-1983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8044780A746
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFA5B1C20E4D
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6E130350;
	Fri,  8 Dec 2023 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FJ09JNX2"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7C6FB
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 07:23:47 -0800 (PST)
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0613866073BF;
	Fri,  8 Dec 2023 15:23:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702049026;
	bh=bZARkojTz4JnOHoYbdnhpJJwdc5KGpsee8ig2wSxtsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FJ09JNX2qnLMRpLlIXAvVdsV2r5+ZDH3Wio/6yeXBTvUHhWt62HMI9eqtpq/P0svx
	 VNcKz5gphEnqKTbdYVODMUCXxdzHPO/u4nQMPPnxOeD0Ndmu7cDLFngYZnV2GGgQ+R
	 znoBaIkVSLw/bpW0SXfA0tqshisrZccNGKg5cvezCVJAxbw4FCewUziTKfMSXsVNeC
	 EG2LLNmsF3lR+j5pY5/DoA3tyRpLCkn46p4OI5ODbadUccus+JlwP2bNKTwaj9mboN
	 TdNQACHw3xpu8AuuWZnPNMMbKdSrwzLNYEpOwZOpiyrj5VjjWuqtQi9m0qRFjIMXAn
	 xfp7dzn7I1rpA==
From: Julien Massot <julien.massot@collabora.com>
To: linux-media@vger.kernel.org,
	j-luthra@ti.com
Cc: kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 3/3] media: ti: j721e-csi2rx: add GREY format
Date: Fri,  8 Dec 2023 16:22:55 +0100
Message-ID: <20231208152255.472467-4-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208152255.472467-1-julien.massot@collabora.com>
References: <20231208152255.472467-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Grey format to properly select RAW8 data type.

Tested with a ST VG5661 sensor.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index ada61391c8d2..46d37401512b 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -158,6 +158,12 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 		.csi_dt			= MIPI_CSI2_DT_RAW8,
 		.bpp			= 8,
 		.size			= SHIM_DMACNTX_SIZE_8,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_GREY,
+		.code			= MEDIA_BUS_FMT_Y8_1X8,
+		.csi_dt			= MIPI_CSI2_DT_RAW8,
+		.bpp			= 8,
+		.size			= SHIM_DMACNTX_SIZE_8,
 	}, {
 		.fourcc			= V4L2_PIX_FMT_SBGGR10,
 		.code			= MEDIA_BUS_FMT_SBGGR10_1X10,
-- 
2.43.0


