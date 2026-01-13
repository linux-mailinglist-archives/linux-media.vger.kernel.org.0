Return-Path: <linux-media+bounces-50520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCCFD178BB
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 352063043F66
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999103815D5;
	Tue, 13 Jan 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="krfmXr4f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A563815FE
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295266; cv=none; b=Rbspnm6hADUq5BgRopjJfefA5+L0Z6XPuPFz0TwZc7Bs7l5+LEujJ+PC7zBnv663LacN9E2j92jAILanYy4rMtYrDqcSO9EQoRsQ1oCnKYqFsa5CeNY2vaxbKBRphP5I1/uWlX+6XTePN6613rCkce4Oixono8g4fHaZkvfZ3Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295266; c=relaxed/simple;
	bh=yhc2p8mv6ev7MJOu6/5Z04VanMMnTHyoknUD8DPOCKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M4c+E/8O84drKKBXSoQt/hGoCFcsu27v7tSwv6UxlCwuFnRITFUDMlY02yy7tYMH3/deunK4GqY978YxasDWmwI9p1denSwc4MXg7rUV/pn4qSx8DxdLR6qNcY50ktCbTO5d4TNnDdUIyp6QNkim/SpwrhufYJF0K2WlvoJstk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=krfmXr4f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EE7C2E0;
	Tue, 13 Jan 2026 10:07:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295237;
	bh=yhc2p8mv6ev7MJOu6/5Z04VanMMnTHyoknUD8DPOCKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=krfmXr4fP9RsUIFXQ5/mTeHXKYcmVBzPxHj2/gsJRbwW0CDhNGi2YTfT0o0D/90Qf
	 DWRtqEqHM+R3WTP11NXfULH6geN5F0Cxi3Bmd/+3OGSC+QR8ykYLtSxULCGyd22LQY
	 Cu+7KaQtrPWhxl20D+/X0eaU02IajbMe8UAUJ/+c=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:22 +0530
Subject: [PATCH 02/10] platform/raspberrypi: vchiq-mmal: Support ISP
 parameters and stats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-b4-vchiq-isp-v1-2-ea0b300bffc8@ideasonboard.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
In-Reply-To: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4938;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=yhc2p8mv6ev7MJOu6/5Z04VanMMnTHyoknUD8DPOCKE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtE2m1yON+5mGDfmSptZJi1Ey4bJ2xdPqLJF
 dPHhcU68yiJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLRAAKCRBD3pH5JJpx
 RcoLEAC78P4sk4mCCBgvlUmGxEpVjyniQfPvfDFH+FDeJ2GzCwXdxAI6nTp5UXiNGk9HCKqB0IH
 hTo4gm2WJlDnO6t5wGX8JHiWRV2pXEDyTMoY2WS0pkkIKG53wiYUzBoeza5zIRaXnHw8+YUUTCC
 D2BuJgQuJPWSnTVUTpT/aJQf7o2L0oySJB61dBRPW/d6cqtuCsMvyFeGr7sn3OfpLLaM869flHK
 n2yAPaCewX8hHuo9zz/ULI9nv2DMHd2dOdPIUlIRWc5ecPvpHFde8YJ0EU16BeQv1n0+yxefmO3
 yHm0zkqCa5x97CXUyPvfR8ujdAvu8L+yocXJsD1dG6zQVTS62sYJNYSYbweXD0m3t8F9ywrGV0I
 fBAa8fJ9466CR+BYuQcq4n9AYx67LAzXt6eupyD2Qyfl4m7ubgqnvwwBF0Xij0uFpKFNoICANeW
 /khg7A3FvRkpMdxPIKlteMH1zrj7Ld74iBLVt0U1caD+3QFpFR8Iva+R95A+k7DdOf8/0eihZ6u
 QoCvX9kywp+Fopojv1bBde6+eXkyCuW+8Tn/vTyLBTPXGJ6hX5SGUlPhsxPMFrR+HRjOc5hIsFi
 ZUmFOn3sOaGZpqK1NdZ+e8rnzGLP3oFZzZnC9oPRt/UG5w69JFHYuULp5B3AfPS5eycn10cBls2
 AIqFzxETZlVWKDA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The ISP used on BCM2835 and derivative platforms is behind the VCHIQ
bus, where some parameters and statistics are accessed through the MMAL
layer.

So add the relevant structures, macros and enum values.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/linux/raspberrypi/mmal-encodings.h  |  4 ++
 include/linux/raspberrypi/mmal-parameters.h | 86 +++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/include/linux/raspberrypi/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
index e15ae7b24f73fd055806e2e88e5eec0e1b8bfe9d..eadf2e9814082c861a93ae8119e8ecb27a2fb331 100644
--- a/include/linux/raspberrypi/mmal-encodings.h
+++ b/include/linux/raspberrypi/mmal-encodings.h
@@ -73,6 +73,10 @@
  */
 #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')
 
+/** ISP image statistics format
+ */
+#define MMAL_ENCODING_BRCM_STATS       MMAL_FOURCC('S', 'T', 'A', 'T')
+
 /* }@ */
 
 /** \name Pre-defined audio encodings */
diff --git a/include/linux/raspberrypi/mmal-parameters.h b/include/linux/raspberrypi/mmal-parameters.h
index a0cdd28101f2dd67fd6b64ce1c95c0cbbfe15fc4..6ae5a7a1932c44a73bd482ae72e1191868871ea9 100644
--- a/include/linux/raspberrypi/mmal-parameters.h
+++ b/include/linux/raspberrypi/mmal-parameters.h
@@ -223,6 +223,64 @@ enum mmal_parameter_camera_type {
 	MMAL_PARAMETER_SHUTTER_SPEED,
 		/**< Takes a @ref MMAL_PARAMETER_AWB_GAINS_T */
 	MMAL_PARAMETER_CUSTOM_AWB_GAINS,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_SETTINGS_T */
+	MMAL_PARAMETER_CAMERA_SETTINGS,
+		/**< Takes a @ref MMAL_PARAMETER_PRIVACY_INDICATOR_T */
+	MMAL_PARAMETER_PRIVACY_INDICATOR,
+		/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_STILLS_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_ANNOTATE_T */
+	MMAL_PARAMETER_ANNOTATE,
+		/**< Takes a @ref MMAL_PARAMETER_STEREOSCOPIC_MODE_T */
+	MMAL_PARAMETER_STEREOSCOPIC_MODE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_INTERFACE_T */
+	MMAL_PARAMETER_CAMERA_INTERFACE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_CLOCKING_MODE_T */
+	MMAL_PARAMETER_CAMERA_CLOCKING_MODE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_CONFIG_T */
+	MMAL_PARAMETER_CAMERA_RX_CONFIG,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_TIMING_T */
+	MMAL_PARAMETER_CAMERA_RX_TIMING,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_DPF_CONFIG,
+
+	/* 0x50 */
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_JPEG_RESTART_INTERVAL,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_CAMERA_ISP_BLOCK_OVERRIDE,
+		/**< Takes a @ref MMAL_PARAMETER_LENS_SHADING_T */
+	MMAL_PARAMETER_LENS_SHADING_OVERRIDE,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_BLACK_LEVEL,
+		/**< Takes a @ref MMAL_PARAMETER_RESIZE_T */
+	MMAL_PARAMETER_RESIZE_PARAMS,
+		/**< Takes a @ref MMAL_PARAMETER_CROP_T */
+	MMAL_PARAMETER_CROP,
+		/**< Takes a @ref MMAL_PARAMETER_INT32_T */
+	MMAL_PARAMETER_OUTPUT_SHIFT,
+		/**< Takes a @ref MMAL_PARAMETER_INT32_T */
+	MMAL_PARAMETER_CCM_SHIFT,
+		/**< Takes a @ref MMAL_PARAMETER_CUSTOM_CCM_T */
+	MMAL_PARAMETER_CUSTOM_CCM,
+		/**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
+	MMAL_PARAMETER_ANALOG_GAIN,
+		/**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
+	MMAL_PARAMETER_DIGITAL_GAIN,
+		/**< Takes a @ref MMAL_PARAMETER_DENOISE_T */
+	MMAL_PARAMETER_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_SHARPEN_T */
+	MMAL_PARAMETER_SHARPEN,
+		/**< Takes a @ref MMAL_PARAMETER_GEQ_T */
+	MMAL_PARAMETER_GEQ,
+		/**< Tales a @ref MMAP_PARAMETER_DPC_T */
+	MMAL_PARAMETER_DPC,
+		/**< Tales a @ref MMAP_PARAMETER_GAMMA_T */
+	MMAL_PARAMETER_GAMMA,
+		/**< Takes a @ref MMAL_PARAMETER_CDN_T */
+	MMAL_PARAMETER_CDN,
 };
 
 enum mmal_parameter_camera_config_timestamp_mode {
@@ -749,4 +807,32 @@ struct mmal_parameter_camera_info {
 				flashes[MMAL_PARAMETER_CAMERA_INFO_MAX_FLASHES];
 };
 
+enum mmal_parameter_ls_gain_format_type {
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U0P8_1 = 0,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_0 = 1,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_1 = 2,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_0 = 3,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_1 = 4,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_0 = 5,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_1 = 6,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U4P10  = 7,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_DUMMY  = 0x7FFFFFFF
+};
+
+struct mmal_parameter_lens_shading_v2 {
+	u32 enabled;
+	u32 grid_cell_size;
+	u32 grid_width;
+	u32 grid_stride;
+	u32 grid_height;
+	u32 mem_handle_table;
+	u32 ref_transform;
+	u32 corner_sampled;
+	enum mmal_parameter_ls_gain_format_type gain_format;
+};
+
+struct mmal_parameter_crop {
+	struct vchiq_mmal_rect rect;
+};
+
 #endif

-- 
2.52.0


