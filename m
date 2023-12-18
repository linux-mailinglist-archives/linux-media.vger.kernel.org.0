Return-Path: <linux-media+bounces-2540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63367816A49
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 10:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EE4F28311D
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 09:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA37812B6F;
	Mon, 18 Dec 2023 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RLM5BROm"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EE4125B6
	for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702893401;
	bh=uYTKJWHaZAhMGIVbyRGxE4c8rZ2fe97FvQLs3nZBIq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RLM5BROm4WloAO6LJy90gKF9v/pyxcxnZD+4MFnlMroz3Sp4Kj9e++yo+OTEVA0+C
	 G21RjdNGue7zt35eP1LuEFNLOsMxYflLwX2NCMbqWfu63oQULTv9JIC6xn0BNg5u93
	 eKtFvO7Ze79b53MnvRKTAGl8B/xyOfDoOJWsMtRtxIpdWA6txfus3HIZ7o45+UQ7iU
	 MW8E/DEc1nzqXJP+eyV6PXVo6h3IhKRbT0Sb3dzouEDzkyo9t9V2JRAv1h5QsExIte
	 +kDt7Gq9L1VTCUBCqBaImj2H2rwmwSD8S4uilQd9OeLTtUIbLLSvHp4cMorAFBJnu0
	 7WLs9Gv+tcZHQ==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A6783378149B;
	Mon, 18 Dec 2023 09:56:40 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: j-luthra@ti.com,
	mchehab@kernel.org,
	mripard@kernel.org,
	sakari.ailus@linux.intel.com
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 3/5] media: ti: j721e-csi2rx: add GREY format
Date: Mon, 18 Dec 2023 10:56:02 +0100
Message-ID: <20231218095604.1950737-4-julien.massot@collabora.com>
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

Add Grey format to properly select RAW8 data type.

Tested with a ST VG5661 sensor.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
Acked-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 9518c78cee4a..6e58112957ce 100644
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


