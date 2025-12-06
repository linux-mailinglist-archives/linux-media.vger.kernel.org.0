Return-Path: <linux-media+bounces-48353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 538C8CAA413
	for <lists+linux-media@lfdr.de>; Sat, 06 Dec 2025 11:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFDFF300B69D
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 10:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158E328CF5D;
	Sat,  6 Dec 2025 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQ4Cqsne"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FEB257423
	for <linux-media@vger.kernel.org>; Sat,  6 Dec 2025 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765016560; cv=none; b=cggyMGx08iyvM5dhya8kHDHIzjEMzd/P7e2/tE7XxffFjLhv+DrZrhkKT1AO8qmSaLVetsq7IumkW7yDGeN9LgMcXkPMUP6ufqfRQGIfHXo+B9eXVMBpK2RWW8lInqpK+DhPGynSxt8BU1H1are/mKzLS1OH47n/rp27romlx2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765016560; c=relaxed/simple;
	bh=m5XQ03NkmU7Dyvrl3uNqx25v8w2wEU616h/uh5i28kk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KwUGClmiw4n1gBiiF14ypK5DGf5MyJkVpNGkuZ/srE9qqAsx7i/9ofooj7LkBgtYKYflvrKWdVBzpcvaUKcb+trDyYljbkleibwcrrrESixIOjCQtHwsjZDvk/HjaygUwZDln6aAaqv2JEIvmR4fwtleJZW4riNDSIqIdJ87/h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQ4Cqsne; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37b983fbd45so27088171fa.3
        for <linux-media@vger.kernel.org>; Sat, 06 Dec 2025 02:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765016557; x=1765621357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HePzOK2YwREM++8Zxr7PF7Xhi3Zuwv6TtIklSs2K0TA=;
        b=nQ4CqsneFUan92LE9cSkUhyui/hLJnf3IcO4ZJFHQxl9FC3aKGHvm0YDJjjTLoOOlG
         js62dyj+jxNc/JDgb8UOSo+iKhbM7ZKJLTs8u2Eegs3UifzHMJ9qhixKkV3pizBk2Zpz
         5ZiNhmXTc1Ghs64Fs9WK77+OMtPVQSNgHB47Uz9hMCsu13vaSx4cszK4s0PDq867MVnN
         W5ExW6hz/BCzv2acRzqITVtrmhUD156ic+zwysyAe9PSD40aagERwPPZglTut+qdqOlX
         niCJf3ZW+z5BOMLininLwk0TUHShIhKNi97bmDL1F7z4U+P8WuSnaE130HpJvFXR2LHI
         sScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765016557; x=1765621357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HePzOK2YwREM++8Zxr7PF7Xhi3Zuwv6TtIklSs2K0TA=;
        b=s2+J9hCd4NOd7ftYZMs/N5nyNGxPM6mXEOp0XSj5y5FjbS24OLUIwV3yfPgdX3Npeq
         6F3w125BYcqUbpzEwtinFV8dX9jciIa1q9oOoFkyT7gNYiflP0dL5EXMprmzfIkv3X35
         GwUuLPbsaO+wYXd121CFrEvoP5Cjx2tfzW3dxY1PTaLwpnFl678rlyj9Er7wjReOf5vV
         gFuOvCwa314XX9E/JT7ejTgE57s8lO52XuxQrSRxLKlSEWx1iXHM0E/Sx2K4ZbH1auD1
         RnAUk+u4q8RvHsl+DXOUHUAU4MJQq6LZ8qzlpbxylm/ht/8i0wVbedmFkU6BFFJ2tFRj
         xJnw==
X-Forwarded-Encrypted: i=1; AJvYcCVTMmRxWs5vnaujMEqsBCy1ZSGBB04qDsbGe/P7J9G+si9cIVzKdr2ZI/PsClgbWIFSs7Z1S+fx0TXohw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRFLA19W23W4H84mnbZzW8MWtd3Kl4DiQzz7xkFNrrUv1L/sgK
	+tT47tYF65iMlWyx3/JuR9b+l44zcpJld2uzt65w1glLISDg/sMCDeCaUnxThfyGbBU=
X-Gm-Gg: ASbGnctUVRNh8aTvME9ZgZktqj6MXNJHoFQK5RIQjJeUUQfYoXATWwLJEffrmciogf3
	j8PK8AA3qEwifl0BiWAXypc2Q8bzvMvJ1nm5aTnkjMgmL46LxcyP93f0+r15GtUEcejsg2GSZfB
	c01MXpgKOjmvHKAOF1wy9p0q4NdNUkDfibGB3vs8ig5stUnjOvWNBKVrLxg7zwke8J5NizJMuiw
	M2dRn/3yjDD46Y0/Cfl2aYOnQoHv2pxOti+CK/R/MNpUuiaBJOhibMIzgeNLAOSC0KQvH33r55A
	u1lEyyqa8m/8VhicrWQNhCQ70T21rGc0U+fkZ4WXwr1kzPOaq4hswEzlhvP58ji0ySUMn6NBNah
	7eFXkSLxq1l31WAWyTgo+LA4nEKkR/4hLdgvcmKXc1NrE6zpxOuiJm9LPwiOyWnIfvzh86p26lL
	iFSaHQ8TC0JKYf/Jk=
X-Google-Smtp-Source: AGHT+IHZhU14o4ScBHW4P11RxOcWO7E57dLHDLPGPlafHtqW8aK0T9R3cLmmCnbIYLub9+VE97fizQ==
X-Received: by 2002:a05:600c:8b0c:b0:477:a219:cdb7 with SMTP id 5b1f17b1804b1-47939c8b376mr21743575e9.0.1765009703680;
        Sat, 06 Dec 2025 00:28:23 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6d9dsm123094705e9.2.2025.12.06.00.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 00:28:23 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	=?UTF-8?q?Olivier=20Cr=C3=AAte?= <olivier.crete@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] media: rkvdec: Add support for the VDPU346 variant
Date: Sat,  6 Dec 2025 08:28:08 +0000
Message-Id: <20251206082809.2040679-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251206082809.2040679-1-christianshewitt@gmail.com>
References: <20251206082809.2040679-1-christianshewitt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VDPU346 is derived from VDPU381 but with a single core and limited
to 4K60 media. It is also limited to H264 L5.1 and omits AV1 and
AVS2 capabilities. It is used with RK3566 and RK3568.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index a1c02ef3a97c..cf68454b2217 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -295,6 +295,62 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
 	.num_ctrls = ARRAY_SIZE(rkvdec_h264_ctrl_descs),
 };
 
+static const struct rkvdec_ctrl_desc vdpu346_hevc_ctrl_descs[] = {
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_SPS,
+		.cfg.ops = &rkvdec_ctrl_ops,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_PPS,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_MODE,
+		.cfg.min = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+		.cfg.max = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+		.cfg.def = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_START_CODE,
+		.cfg.min = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
+		.cfg.def = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
+		.cfg.max = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
+	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+		.cfg.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.cfg.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+		.cfg.menu_skip_mask =
+			BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		.cfg.def = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+		.cfg.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.cfg.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
+		.cfg.ops = &rkvdec_ctrl_ops,
+		.cfg.dims = { 65 },
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
+		.cfg.ops = &rkvdec_ctrl_ops,
+		.cfg.dims = { 65 },
+	},
+};
+
+static const struct rkvdec_ctrls vdpu346_hevc_ctrls = {
+	.ctrls = vdpu346_hevc_ctrl_descs,
+	.num_ctrls = ARRAY_SIZE(vdpu346_hevc_ctrl_descs),
+};
+
 static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
@@ -449,6 +505,43 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 	}
 };
 
+static const struct rkvdec_coded_fmt_desc vdpu346_coded_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.frmsize = {
+			.min_width = 64,
+			.max_width =  65520,
+			.step_width = 64,
+			.min_height = 64,
+			.max_height =  65520,
+			.step_height = 16,
+		},
+		.ctrls = &rkvdec_h264_ctrls,
+		.ops = &rkvdec_vdpu381_h264_fmt_ops,
+		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
+		.decoded_fmts = rkvdec_h264_decoded_fmts,
+		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
+		.capability = RKVDEC_CAPABILITY_H264,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
+		.frmsize = {
+			.min_width = 64,
+			.max_width = 65472,
+			.step_width = 64,
+			.min_height = 64,
+			.max_height = 65472,
+			.step_height = 16,
+		},
+		.ctrls = &vdpu346_hevc_ctrls,
+		.ops = &rkvdec_vdpu381_hevc_fmt_ops,
+		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
+		.decoded_fmts = rkvdec_hevc_decoded_fmts,
+		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
+		.capability = RKVDEC_CAPABILITY_HEVC,
+	},
+};
+
 static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
@@ -1654,6 +1747,19 @@ static const struct rkvdec_variant rk3399_rkvdec_variant = {
 			RKVDEC_CAPABILITY_VP9,
 };
 
+static const struct rkvdec_variant rk3568_vdpu346_variant = {
+	.coded_fmts = vdpu346_coded_fmts,
+	.num_coded_fmts = ARRAY_SIZE(vdpu346_coded_fmts),
+	.rcb_sizes = vdpu381_rcb_sizes,
+	.num_rcb_sizes = ARRAY_SIZE(vdpu381_rcb_sizes),
+	.irq_handler = vdpu381_irq_handler,
+	.colmv_size = rkvdec_colmv_size,
+	.flatten_matrices = transpose_and_flatten_matrices,
+	.named_regs = true,
+	.capabilities = RKVDEC_CAPABILITY_H264 |
+			RKVDEC_CAPABILITY_HEVC,
+};
+
 static const struct rkvdec_variant rk3588_vdpu381_variant = {
 	.coded_fmts = vdpu381_coded_fmts,
 	.num_coded_fmts = ARRAY_SIZE(vdpu381_coded_fmts),
@@ -1693,6 +1799,10 @@ static const struct of_device_id of_rkvdec_match[] = {
 		.compatible = "rockchip,rk3399-vdec",
 		.data = &rk3399_rkvdec_variant,
 	},
+	{
+		.compatible = "rockchip,rk3568-vdec",
+		.data = &rk3568_vdpu346_variant,
+	},
 	{
 		.compatible = "rockchip,rk3588-vdec",
 		.data = &rk3588_vdpu381_variant,
-- 
2.34.1


