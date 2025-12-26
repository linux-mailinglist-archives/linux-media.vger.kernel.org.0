Return-Path: <linux-media+bounces-49575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BF4CDEA67
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 12:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65CB33024108
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 11:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B77E31B822;
	Fri, 26 Dec 2025 11:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rj0YS5hV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D755B31B80B
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 11:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766748716; cv=none; b=e7W5HHSzgD3ID06wVm5oiiapbN+qtyS4mUmUY1Rh4sIkttKZCSuZe8a+9CGTbGtykyidvDqPvTEdNuR1XHKeAbx/ULzZnZRZMRhOLGshhl53L7qpeDRsGdTpsN9fjix/7xHPDT7X1up/Lkt69Goqlha6yFn5jVAfNW9OROZ9jqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766748716; c=relaxed/simple;
	bh=N170/wcwZcC6UGcnBD4mfpj8N8jv2FwKTbOrfG/2glU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WN9pRRhSvo5JS3D3CItFv9XkN6PQfE69aFuXGH4vidDr/3mHKxAyf/DKLmydpinSN73eni3c8uBmTOvQrTOwZMaAYMHJB0l4DppqLmX7AZrknz+cnevOl+5u6TxiE1unsGugF1hdDQhCP+HNraOfd/EbUzgei2m0rOChom8nZx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rj0YS5hV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso10925155e9.2
        for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 03:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766748713; x=1767353513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rhf0TH4eJNjuHSmbRZBfmqwPKHrm+PMdGGpE2aA2ePg=;
        b=Rj0YS5hV7ckfTKZHIfCLDLCXZAF+njrMoxCRCSlmoZok7NCm8XzGHBMsbo0kn+v0of
         c2zThAl9muSHwuiiI/dGBxk4pZIaCpuCyNtdb32XfPTuRuDrAjRre+gW2C0Eq9Cq7I6k
         8naaZwqj/N20zBq4T3u3EZqVJerueaN1iinmFRDKXtS3o4CW+Q9qsuB+QETRag4nzJm1
         3/evY0NpIeh+bL1upDCtp4grhgO6CAzTvQ0VMZLLqgk9ENWiQNLvHkhhAAHjTmuarLuE
         47TgGhg8GHbc0xjMVrNkbK//x+yP2Z1Ba0NpepoFBEMnrieMrcaugyGiprUWDKCRepXh
         Nmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766748713; x=1767353513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rhf0TH4eJNjuHSmbRZBfmqwPKHrm+PMdGGpE2aA2ePg=;
        b=oeL2LGUq2FAo7xZZBK1W/XpVdR66m3WzNPIhm04nJ/72D55QEpxPwytLO7lNw96pnN
         WKH64cR0EFwhBK3ZcYw2puMMngkxESsRdsf8zFulxmkz95hfiMvZbLUabN4jL7qbw2HN
         b21PHQKA4n4ayg8OcKiKzW48Kx/feLZSOyDF10Ig9vCIgiirTjOCM4wNFXqs3nTjCh4L
         /CH/5+HRLyIJZYVv8lHnC6iuF0VRkPajM2Q8waYybj6KUN66YbBb44PN1PAwaufK/mLQ
         c5pXqNSwYwd51t2fx/HoF74sPgFPFp72XyAA8z7zaH3L7kFTYBxJtE44cOGTQD2y/R9M
         z+DA==
X-Forwarded-Encrypted: i=1; AJvYcCXBOEx+Ff5zVB0FKfroxaKOHjv0k6lBTTx1kc9KcfOnKI+zvS+95Mgm2KKWtYWjLp6x5e3TZmh2rmOiwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeTnr9sHfpZKw+k2b0JnVFF9nmQM7tBmpCuHzxOWG5wurFfH4b
	HkYe8mxHMXh94MjoHCe3M9EV2Y8bcCVahfqRzVD60iN59nCvFXs0QykI
X-Gm-Gg: AY/fxX5SCQ1NRr2WLVH5Pt1cMWfZtyITcJCh4RrZIAyGrsfcPSIxBmkZETwBssA6a72
	zzj7CYSnPlob/wOyQj2h9H3IpmF2fu+n0t8Ra322TpgIKjqz8rnRnZUN0cpqOcCgCXAOjH8CheT
	7FflDjiqh+8JPtYawkKRutwk6jl3gsP5HCsTRHlBobruLIxsAZJmZv5Yi4Iqp/v6Env4MMRcXUo
	Nyvu9DFSL/VHdDWMHCbR9cTSexk8JFXnfq2WreEVIfCGVC5r7X7FOGnL8knDmIBgGIzVqpkr8Nd
	jBGKLhNZpqyIJ8YUGCp4RuWj3SOyL9IuK5tLa0ayp4bglppG/WtuUw6K1ZVSEXgUrIFvds6NMf9
	YTU++oLmKenxAuYAMRmNPkerwG8mpzcoLbOCbGQeJpTNzsiV0U/hWy5G/ixofy+wmU2H9T/Hgs8
	58wyq4UtUZWSmqDEs=
X-Google-Smtp-Source: AGHT+IEdX/opTeKmbf9vs+IfU8RNLfI0e1Jx0FbC8ZOgZmZVG+BhcxQJNX7MD2OXkK7u+x0+7A8c8A==
X-Received: by 2002:a05:600c:3506:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-47d195499e5mr211765625e9.2.1766748712900;
        Fri, 26 Dec 2025 03:31:52 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1bdsm44182107f8f.8.2025.12.26.03.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 03:31:52 -0800 (PST)
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
Cc: Nicolas Dufresne <nicolas.collabora@collabora.com>
Subject: [PATCH v2 2/3] media: rkvdec: Add support for the VDPU346 variant
Date: Fri, 26 Dec 2025 11:31:39 +0000
Message-Id: <20251226113140.573759-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251226113140.573759-1-christianshewitt@gmail.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VDPU346 is similar to VDPU381 but with a single core and limited
to 4K60 media. It is also limited to H264 L5.1 and omits AV1 and
AVS2 capabilities. VDPU346 is used with RK3566 and RK3568.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Nicolas Dufresne <nicolas.collabora@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index e547057dc75f..6b39e99d8a8b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -236,6 +236,62 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctrls = {
 	.num_ctrls = ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
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
@@ -463,6 +519,41 @@ static const struct rkvdec_coded_fmt_desc rk3288_coded_fmts[] = {
 	}
 };
 
+static const struct rkvdec_coded_fmt_desc vdpu346_coded_fmts[] = {
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
+	},
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
+	},
+};
+
 static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
@@ -1643,6 +1734,14 @@ static const struct rkvdec_variant_ops vdpu381_variant_ops = {
 	.flatten_matrices = transpose_and_flatten_matrices,
 };
 
+static const struct rkvdec_variant vdpu346_variant = {
+	.coded_fmts = vdpu346_coded_fmts,
+	.num_coded_fmts = ARRAY_SIZE(vdpu346_coded_fmts),
+	.rcb_sizes = vdpu381_rcb_sizes,
+	.num_rcb_sizes = ARRAY_SIZE(vdpu381_rcb_sizes),
+	.ops = &vdpu381_variant_ops,
+};
+
 static const struct rkvdec_variant vdpu381_variant = {
 	.coded_fmts = vdpu381_coded_fmts,
 	.num_coded_fmts = ARRAY_SIZE(vdpu381_coded_fmts),
@@ -1691,6 +1790,10 @@ static const struct of_device_id of_rkvdec_match[] = {
 		.compatible = "rockchip,rk3399-vdec",
 		.data = &rk3399_rkvdec_variant,
 	},
+	{
+		.compatible = "rockchip,rk3568-vdec",
+		.data = &vdpu346_variant,
+	},
 	{
 		.compatible = "rockchip,rk3588-vdec",
 		.data = &vdpu381_variant,
-- 
2.34.1


