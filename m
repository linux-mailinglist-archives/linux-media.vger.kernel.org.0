Return-Path: <linux-media+bounces-42418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F4AB54B23
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 13:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D32F189C437
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 11:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD3F2FFDD6;
	Fri, 12 Sep 2025 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITgsLOYJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7941A30148C
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677030; cv=none; b=aQi8nEmXkGNRnFFG/IecaI0y5zSM69TDiA5j/CJd1lmhOJuR2I+8PYTnc2mLw8ldFCfSkRQdnTM2XeCzEb4yLXGb2NZF0tUFLOUUSbOqyjLDhEUNqKcN9Jsjw8fRlwAs4L0FvOgPZE6+putieJkbZtZYTcGbddGBB3kZWD453vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677030; c=relaxed/simple;
	bh=hTnvvxl+lyL52rYp9D+lJFkBieFPMCtFihiRlKLamkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C00ZquHwXV2eE0IOEGm4mOD+DSCdwsH1O9cqlyHzOUaQNllBmz/AtvkatIJlowm4sU+uUT6Uayiv/9A79F54UjOZPOoaN9lphT3jI6q2PECnhfC5EfrXuFmb9M+w/yWnxYmHM26oiZYtg+xEnrMHge4T+rAFGlR7V81y2F7ixY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITgsLOYJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so16080555e9.0
        for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 04:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757677027; x=1758281827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJ9s0RW4TlNtw5bKE6LaaAXASB0Bfcws+yTXIrMiB70=;
        b=ITgsLOYJ7YGQ4D3Swey0ePUC9b3IBdPUHds+gOioFSuXCWkjLzBNr/UBN0/kggVoUO
         x6Sw6bvfJJIoB/wNTwztTfp6b4Ov2ViSJ/5B2kJtWON/M2J2xT4xZIoCBAgSs0m9iM9W
         skqSFMhVX0wGTEzslrwLmXshgrZMy5FDGZqt+G87n4kHVlImARrUjDpXWD/3/es72VCe
         sw+5b4iphTp0Uo6tNXicCz7HnWzMEy+pZiPq6k4smVz2zq5aenC0S9RG3qjW9LCi8RCM
         v0OHr0khYj+WutwIOe7c1Qk3PJGfu0lV5/VIZZ5MaXOv7D4hS32O2VyWSZDnud/Thvs/
         EeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677027; x=1758281827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJ9s0RW4TlNtw5bKE6LaaAXASB0Bfcws+yTXIrMiB70=;
        b=AF2d5ef0Lq1jR/IwfEGCeDDgzRGCLds3QfDuLjwwl6/7jBZGmRsBk9XPtRJ6q7DkhE
         lXlLqm/bvsprQzbyb+qH8LJV45XBA+b53vMt0BasR+7Gh9EOVBz2cBqDnbJGy7wrz1+6
         8Cwr9Iy2Vm1kgRQVqbXZNStztzbN1WB1PdeUJDk9UzFTL/TiK7UcrKHIrSE0u1syjyoE
         gdaNV9MV/dqSvhr7cImHvweAF79CQadmLI14R+4laPNiJ2hTxWemuu3qcLUbgPv5tlGw
         /IN3wYEUz9NnyfVl1tvoVNHPPSHITE8kA0evposTiq8E2poTpnFtJfBp8A0M6pf6pUDo
         jSfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTIFHq84vj5OIeB5AszcfWd7PYpc1GhQzMfGluVwN5OiAn4U/kM7VIcl8Q8HEZgBfwZGtKTfMT1CDK7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxF3mWELaXp4xE+yVzkYDIo3axz+6eiWZDbBUvXmb9lVl/Sgm3
	s8lodyurIFn5Jk/teUEtC46lh5Omgk9x6TlVNbTpAGz+V3aXJafGZOR4
X-Gm-Gg: ASbGncsJraSVGRJStujlO9pvxm5Od4QQ/cgaoJiCXKRb3l4dsvf1dsHGxzpmOfKx0Kf
	pRtaPcGWQOVxTcDdQM/v2hfQodyDZTDjvDrB3kgOYaQ9uWX9Z0lUUM1rOLkSFBCHRdH9rTg8OKp
	bCnwFE6sGKUERTLMT3Ge6tQx9h1u72ecApUSvtDZ61HqLIhgbmhUtLKRcdXsqOTXkRUkhFTiEwA
	aAJTUh7udWV748V7cvqwY+uhsVZaYrchfhxZJi3vGCLlxJg8IyfSIzqh1iXEmgKcVcduUIizwPz
	jQEo5iyYE/YkUStt59tGv8NyDLJ9QevkUZFWEG7ziUX/JqqGmHPHO82UZ8xJ6L/hZb/0MVN8NVu
	SJr3aueiYzxjPimcAP6AloEA=
X-Google-Smtp-Source: AGHT+IGNhskNQ222hAmA35gssLgeVkjancFizkOKZkOB3I+j1naDg4fRXY348FJIKpgreqpT7a9XOw==
X-Received: by 2002:a05:600c:4fc9:b0:456:942:b162 with SMTP id 5b1f17b1804b1-45f2128cdabmr31042715e9.11.1757677026334;
        Fri, 12 Sep 2025 04:37:06 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e0372ae57sm58341885e9.8.2025.09.12.04.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:37:05 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Fri, 12 Sep 2025 13:36:11 +0200
Subject: [PATCH v2 4/5] clk: st: flexgen: remove unused compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-master-v2-4-2c0b1b891c20@gmail.com>
References: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
In-Reply-To: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4682; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=hTnvvxl+lyL52rYp9D+lJFkBieFPMCtFihiRlKLamkE=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoxAXb8Qr++0bpvmUZDjewhmn4xfqZPw+dw+VQL
 vIFLz99yM6JAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaMQF2wAKCRDnIYpo1BLC
 tTj8EACagCvpdyYmyWR46Tf5X9sd9Vpyz9s0HqkWr/OjKI7Qc3phPpfpNGkMkKK5EqsoAhZp22W
 L1VMhuFlgfOtEWby0yEft8R9/Hd6kREeMBw6e9rw0gx6/JG0yQVDnWB3P8eq2eOBnhPoyy3VWRY
 PS1t9JoZj2L6k/QNWzdw1IDQ/FVXs2JP7/9tCE2aHZ1Vf0kS3d8vt/IOpOi3gFATsFxDIkWpIrc
 0Ht4G4JvRuC09zayud9PzXJdUWvnDCrBCJwIdthHn4mFvpluaNPLgO/XhNQv1WYFb6AlXmRGyGP
 bWi1tG83LNU0OirrG5p0zfWVIGHn+cevKmaFU8g/FmvuInEYPor6SMfiyRaPMpIrvh/rq7e1jFb
 3hgyJ5Iuzu/xphK98McPopQ9NuAUe05UPbb834iWGVbaakSitaiY21KnYFNhbfgGthB2Vguz4II
 EpWn02pAbATtNd+h0h28NjEIi4nCI2ElsxUZJP695rHn7ffdy44TanwPL78J+upKpMtbuXVYZmc
 55AE1x/TEFEO77/qluqbsUvkUdeIH+uQiye5Jb7ILezL7Av0NNVDXfnq56qhVGlfkfPKJ6iJDsM
 dNsjv1Ip/FNt1PiH6HFV6HHfcWgu3ZNu/IAfp6HbieFpqZRDQjfU+gBV6mmelgA1nmqQUiBYYW8
 pICRc5B3BFmGzDw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Following B2120 boards removal in commit dee546e1adef ("ARM: sti: drop
B2120 board support"), several compatibles are left unused.  Remove
them.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/clk/st/clk-flexgen.c | 80 --------------------------------------------
 1 file changed, 80 deletions(-)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 5292208c4dd8b45edfe7c2722e934dd0299c6d34..e8e7626c76db06b2255908a6658bca1f42600c85 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -303,16 +303,6 @@ static const struct clkgen_data clkgen_video = {
 	.mode = 1,
 };
 
-static const struct clkgen_clk_out clkgen_stih407_a0_clk_out[] = {
-	/* This clk needs to be on so that memory interface is accessible */
-	{ .name = "clk-ic-lmi0", .flags = CLK_IS_CRITICAL },
-};
-
-static const struct clkgen_data clkgen_stih407_a0 = {
-	.outputs = clkgen_stih407_a0_clk_out,
-	.outputs_nb = ARRAY_SIZE(clkgen_stih407_a0_clk_out),
-};
-
 static const struct clkgen_clk_out clkgen_stih410_a0_clk_out[] = {
 	/* Those clks need to be on so that memory interface is accessible */
 	{ .name = "clk-ic-lmi0", .flags = CLK_IS_CRITICAL },
@@ -324,51 +314,6 @@ static const struct clkgen_data clkgen_stih410_a0 = {
 	.outputs_nb = ARRAY_SIZE(clkgen_stih410_a0_clk_out),
 };
 
-static const struct clkgen_clk_out clkgen_stih407_c0_clk_out[] = {
-	{ .name = "clk-icn-gpu", },
-	{ .name = "clk-fdma", },
-	{ .name = "clk-nand", },
-	{ .name = "clk-hva", },
-	{ .name = "clk-proc-stfe", },
-	{ .name = "clk-proc-tp", },
-	{ .name = "clk-rx-icn-dmu", },
-	{ .name = "clk-rx-icn-hva", },
-	/* This clk needs to be on to keep bus interconnect alive */
-	{ .name = "clk-icn-cpu", .flags = CLK_IS_CRITICAL },
-	/* This clk needs to be on to keep bus interconnect alive */
-	{ .name = "clk-tx-icn-dmu", .flags = CLK_IS_CRITICAL },
-	{ .name = "clk-mmc-0", },
-	{ .name = "clk-mmc-1", },
-	{ .name = "clk-jpegdec", },
-	/* This clk needs to be on to keep A9 running */
-	{ .name = "clk-ext2fa9", .flags = CLK_IS_CRITICAL },
-	{ .name = "clk-ic-bdisp-0", },
-	{ .name = "clk-ic-bdisp-1", },
-	{ .name = "clk-pp-dmu", },
-	{ .name = "clk-vid-dmu", },
-	{ .name = "clk-dss-lpc", },
-	{ .name = "clk-st231-aud-0", },
-	{ .name = "clk-st231-gp-1", },
-	{ .name = "clk-st231-dmu", },
-	/* This clk needs to be on to keep bus interconnect alive */
-	{ .name = "clk-icn-lmi", .flags = CLK_IS_CRITICAL },
-	{ .name = "clk-tx-icn-disp-1", },
-	/* This clk needs to be on to keep bus interconnect alive */
-	{ .name = "clk-icn-sbc", .flags = CLK_IS_CRITICAL },
-	{ .name = "clk-stfe-frc2", },
-	{ .name = "clk-eth-phy", },
-	{ .name = "clk-eth-ref-phyclk", },
-	{ .name = "clk-flash-promip", },
-	{ .name = "clk-main-disp", },
-	{ .name = "clk-aux-disp", },
-	{ .name = "clk-compo-dvp", },
-};
-
-static const struct clkgen_data clkgen_stih407_c0 = {
-	.outputs = clkgen_stih407_c0_clk_out,
-	.outputs_nb = ARRAY_SIZE(clkgen_stih407_c0_clk_out),
-};
-
 static const struct clkgen_clk_out clkgen_stih410_c0_clk_out[] = {
 	{ .name = "clk-icn-gpu", },
 	{ .name = "clk-fdma", },
@@ -482,19 +427,6 @@ static const struct clkgen_data clkgen_stih418_c0 = {
 	.outputs_nb = ARRAY_SIZE(clkgen_stih418_c0_clk_out),
 };
 
-static const struct clkgen_clk_out clkgen_stih407_d0_clk_out[] = {
-	{ .name = "clk-pcm-0", },
-	{ .name = "clk-pcm-1", },
-	{ .name = "clk-pcm-2", },
-	{ .name = "clk-spdiff", },
-};
-
-static const struct clkgen_data clkgen_stih407_d0 = {
-	.flags = CLK_SET_RATE_PARENT,
-	.outputs = clkgen_stih407_d0_clk_out,
-	.outputs_nb = ARRAY_SIZE(clkgen_stih407_d0_clk_out),
-};
-
 static const struct clkgen_clk_out clkgen_stih410_d0_clk_out[] = {
 	{ .name = "clk-pcm-0", },
 	{ .name = "clk-pcm-1", },
@@ -596,18 +528,10 @@ static const struct of_device_id flexgen_of_match[] = {
 		.compatible = "st,flexgen-video",
 		.data = &clkgen_video,
 	},
-	{
-		.compatible = "st,flexgen-stih407-a0",
-		.data = &clkgen_stih407_a0,
-	},
 	{
 		.compatible = "st,flexgen-stih410-a0",
 		.data = &clkgen_stih410_a0,
 	},
-	{
-		.compatible = "st,flexgen-stih407-c0",
-		.data = &clkgen_stih407_c0,
-	},
 	{
 		.compatible = "st,flexgen-stih410-c0",
 		.data = &clkgen_stih410_c0,
@@ -616,10 +540,6 @@ static const struct of_device_id flexgen_of_match[] = {
 		.compatible = "st,flexgen-stih418-c0",
 		.data = &clkgen_stih418_c0,
 	},
-	{
-		.compatible = "st,flexgen-stih407-d0",
-		.data = &clkgen_stih407_d0,
-	},
 	{
 		.compatible = "st,flexgen-stih410-d0",
 		.data = &clkgen_stih410_d0,

-- 
2.51.0


