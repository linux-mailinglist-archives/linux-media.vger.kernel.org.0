Return-Path: <linux-media+bounces-48349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F0CAA2CC
	for <lists+linux-media@lfdr.de>; Sat, 06 Dec 2025 09:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CADE311EBC7
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 08:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F20E29E0FD;
	Sat,  6 Dec 2025 08:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4zXS4Ps"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D3F1FE451
	for <linux-media@vger.kernel.org>; Sat,  6 Dec 2025 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765009700; cv=none; b=Z1BCAA2u1LElpyBnS9w0E8wksyPWOmvutxYms3yFcs/iUOTKZ14cbJuaTKVLgo9GESHKljrV3SnK8A3MbXSbHGa8kxzaaBWUj1JFQyWCyZMVySB7mBgnE/slJY0aLQlJrUUvB12Jdg0eor+Iv2MynYn69yK1UFLbgD9sIhdrJ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765009700; c=relaxed/simple;
	bh=66/0LGwhPBNZZcINEUO9HXjaMhfiwQEPBMwcQigYeNs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XaxkVHNsKgTUU5pck6E6Ak1OqHpTya7ZI24LLAKkGEUYhTLR4uZjtgYCt1t43vTsJG9FxKVwLIZgsJcXuZwBS037G9wiF79Q8vJqjctnOf8YK5QW8yfpi+lbu3OiWZT4qcpYVBITIH+F1hoJl996Cl4WdCbqJrDaz+ZVWPJtgx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4zXS4Ps; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so32458475e9.3
        for <linux-media@vger.kernel.org>; Sat, 06 Dec 2025 00:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765009697; x=1765614497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FezSaBLf7wCo5DY/lU0PUbH+WokJ3F83+Nys5IdDnP0=;
        b=U4zXS4PsbA0EtO0W9mjxmSIT5QT5gv4j0QUBxH0QCPDSrYgvgTKttIpbxwwOx2fBu/
         9oScrDQptH6yewBNwsbIeYd515zpav7J2hFdl3Ct3z5R8sTrZqUk6UsGmVoZIa6+XfaQ
         LOJxTqndQKXrw+cpX081vTrGcc38aN8q6dBAnrWuRBWgj7vUILrtJ9SWDcohRiJsESQB
         DjFXfPIH5ZO3s0xvp7mps5gimku0FpTpUcpIfbRPq15Ly+HUWjT83GQLtC6G2yXXwQ2J
         fWbZ1IrfeajQlDGwAuOzFG6zbajEVPthfyMOIRrY1snDY0q1bC9nkLzSSokEbDDXRds1
         rb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765009697; x=1765614497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FezSaBLf7wCo5DY/lU0PUbH+WokJ3F83+Nys5IdDnP0=;
        b=uzEuyYtzJw84W0aJAZhPFSiPer46HxIZQ+rdcPhwNWy3zgI5qyXVSSU1vqEU765ZUI
         /b8h0pS+j2EnxBCwOmMGwc02N42HAdhEkYMc6KUDmNIts5QvWthnYFvus7B1DaaXRjyS
         vYHnvg34y0STJBojseHe0LUdvaa+T6zzuncjpNXn2+m0auoyI6I9vT6qX9ghoiUzj+DH
         QjvOqdlPSti8Fq0wF6NyMxfdNucUczsVUTj++CwIt6Er+/180QwuH92Xf9Qb0QVTpgcm
         8qjJWXo9KjD7pmhYigLJxvCVJKo4l9o4/WPTldsk4zlRuWF//7EQJXe2j32Pn5NW2St1
         iN2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxtZnRzX9U7Ht4I8RnZ2TEiqlpgf1jHNVuHQnSc0urubQMQWy3amm4VmpwSIwmlkm/wjTWxxsEXS8hhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxifN8t63Q/sueb0ivWf2JEppnf+3ODSaf8W/bxvV557aXzS3ZO
	eNc9rCsZ5+Is+LJTT5W6AoUVD2qD4aImUlXMtMjg5Zbf8h1YtOlYPftq
X-Gm-Gg: ASbGncsoVXAS4ZnsPONvk/m/2vS/1apsSyaM7dVnNa90pUIhfUjFN/d2bK4OvcEGkwv
	6jFVJP06p1kURUIM/8Rh7UiSEojW1xim0RhU/Fe5DkFUIeWKzMDz9A+OkP872dHXMjXyB8hgEYZ
	ax60l0QOd9Lvmkqdr7wv/BxV8WxkRqS9wMPUGHxtjTJbilPz/wBKAY5yqedfr5rMdwXd2V+kRdo
	qnrb3LO/K7nOFX5PCNJ68HzAS/mZn1Jajk3dvMRlQ6EN9DbC0uCqmHpA196thPvX6woMYNsjWa9
	FdQBSGBFcyVyfRzgVYeJeN24uqRVxQYvKfJBrv8FH5EBcBqVJcdCPHYf3dQ3DS/z4J9tFW75Udh
	n1SNIhO38I5imSONmTFAzdZxe/IImPg2NppHsBtEfiH7GsBWRyWu6Z6LyB4YYnxcbCH/1AAq6DT
	MIAJSr8IXzkcHXdVk=
X-Google-Smtp-Source: AGHT+IEkUrPBcFh97XMz8GJKKpFnTbZn0ROoOhlMrdyTdBPLjuhn+cNwEGqKaQDpj9DV4jFElIFQvw==
X-Received: by 2002:a05:600c:1f8d:b0:477:af74:ed64 with SMTP id 5b1f17b1804b1-47939e3d0a6mr13423475e9.27.1765009697222;
        Sat, 06 Dec 2025 00:28:17 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6d9dsm123094705e9.2.2025.12.06.00.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 00:28:16 -0800 (PST)
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
Subject: [PATCH DO-NOT-MERGE 1/4] media: rkvdec: minor fixes for current DETLEV patches
Date: Sat,  6 Dec 2025 08:28:06 +0000
Message-Id: <20251206082809.2040679-2-christianshewitt@gmail.com>
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

RK3588 TRM Part 1 para 5.5.9 shows RKVDEC_SWREG12_SENCODARY_EN as
the register name so the 'secondary' typo looks maybe intentional,
but using correct spellings improves code readability.

RK3588 TRM Part 1 para 5.4.3 shows RKVDEC_1080P_PIXELS should use
1920x1088 (to be 4px aligned) not 1920x1080.

Also correct some H264 references in the H265 driver.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h    | 4 ++--
 .../media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
index 11b545e9ee7e..7cc6cbb8e549 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
@@ -24,7 +24,7 @@
 
 #define MAX_SLICE_NUMBER	0x3fff
 
-#define RKVDEC_1080P_PIXELS		(1920 * 1080)
+#define RKVDEC_1080P_PIXELS		(1920 * 1088)
 #define RKVDEC_4K_PIXELS		(4096 * 2304)
 #define RKVDEC_8K_PIXELS		(7680 * 4320)
 #define RKVDEC_TIMEOUT_1080p		(0xefffff)
@@ -90,7 +90,7 @@ struct rkvdec_vdpu381_regs_common {
 		u32 reserved4			: 7;
 	} reg011;
 
-	struct rkvdec_vdpu381_sencodary_en {
+	struct rkvdec_vdpu381_secondary_en {
 		u32 wr_ddr_align_en		: 1;
 		u32 colmv_compress_en		: 1;
 		u32 fbc_e			: 1;
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index dd7481a4353d..b4fc0d423c16 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -275,11 +275,11 @@ static void set_pps_ref_pic_poc(struct rkvdec_hevc_sps_pps *hw_ps, u32 poc, int
 static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 			    struct rkvdec_hevc_run *run)
 {
-	struct rkvdec_hevc_ctx *h264_ctx = ctx->priv;
+	struct rkvdec_hevc_ctx *h265_ctx = ctx->priv;
 	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
 	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
 	const struct v4l2_ctrl_hevc_decode_params *dec_params = run->decode_params;
-	struct rkvdec_hevc_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
+	struct rkvdec_hevc_priv_tbl *priv_tbl = h265_ctx->priv_tbl.cpu;
 	struct rkvdec_hevc_sps_pps *hw_ps;
 	bool tiles_enabled;
 	s32 max_cu_width;
@@ -479,7 +479,7 @@ static void config_registers(struct rkvdec_ctx *ctx,
 
 	memset(regs, 0, sizeof(*regs));
 
-	/* Set H264 mode */
+	/* Set HEVC mode */
 	regs->common.reg008_dec_mode = VDPU383_MODE_HEVC;
 
 	/* Set input stream length */
-- 
2.34.1


