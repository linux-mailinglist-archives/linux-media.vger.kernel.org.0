Return-Path: <linux-media+bounces-42380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5FFB53985
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 18:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A14AB624B5
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 16:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E26535FC18;
	Thu, 11 Sep 2025 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAP+/3aI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC04335AACD
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757608856; cv=none; b=Pt1a03ciF0rkFQR4BrRW2is2wSbWCdyrNz214lVW0oZW9SIV6sJf9UkWlRY3N00KfmjUkC0DAyWczbGpXmjrQCWJgtfNpyvTFK1xB2jRWHEb08vypJ+hG98ylkoLb0dvZyPBnXRLLemrZriv9HCwLOzNfhoQghBRAiGoAXCCqAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757608856; c=relaxed/simple;
	bh=hTnvvxl+lyL52rYp9D+lJFkBieFPMCtFihiRlKLamkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lQVHZcBF1uYm10yKmqTmR0r0zG8hduhcVcMx+bthdPJDMwf6EQbxgCp126ONSh6mcHpmHSavrU5/FbAOAB8n+PpCLexD2DOW5GPA4osLPdBk5gaBdAk/T5s6pBf9BOwcQlpT69Jx8KjtktYcARy+Q9HxSn9rtdTiul3O8EuEzog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAP+/3aI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3e5190bca95so744223f8f.0
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 09:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757608851; x=1758213651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJ9s0RW4TlNtw5bKE6LaaAXASB0Bfcws+yTXIrMiB70=;
        b=VAP+/3aIuDYC/oz2sITHnDr+D9kFO9OCv3prXN3cT7PeLp8RpUPwQyYa4DhiWsg4wq
         rvMSqi+hO/HObWJ2Oq8U8Yg2ZgAhBzzWBzJ2j4OENeZDr+1R4fiXhyb/rqX0H41RwLK6
         mt2SvyjSmDLS2DfNLfnK8TuUGENJngZO5GA3HlLnY8aOqRPfGjZcVVu1Lit/b57YFmpQ
         VA4d2v+h5SJfL2b2JXXZWyDmanqecdRQWQcSkSR9a2mlEw0lsK0Po5zxSVXiGEnnj9AP
         Qj1G3WIc+/fwDrtkWDslCelYvKegEvVEF21zB+ZqNrWUzqKSBOTh3FyeKF0Ox5HW1PoV
         D/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757608851; x=1758213651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJ9s0RW4TlNtw5bKE6LaaAXASB0Bfcws+yTXIrMiB70=;
        b=kVgRaYpXgPycMTSw6o3XN0PkaXb41BlIWlE/Am6fDtXtrIyjeR1hgJVA3mKscCENsE
         kxgxGf1DWOboWntXEuLlQ4HIGHgZaKa/EohpwO5R6D5SJkIaeuqThT4ilZKWnV5QPJs3
         1waxJhDeoJegcgxapjDUD/xNMxR965Jqs+f3qQDlu/EVF8COhCZA6kGki3GM0g7i4MNu
         OAmNrP/SMGk3inS+69Mx8spX7fY3pE88jzNVjPvSA4N4Yi5AqJsd6eCoSjWvkAiAN+lz
         zDEG2Jwy7xwMhrDLANZLw2YO9nHutVfTJf4bbpweOfjfKAtqrBFrswdmpmIUrnD+R8ua
         kQuA==
X-Forwarded-Encrypted: i=1; AJvYcCWn/9cD3DwYDEpVo0/Adk3JmjYSg3DlGGGdeo6MKQqseoLZ0Cq92mZ+/5VAClctjctVVfjwd+IgJqOQVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA+JaJcERtgut0lGleJDteE5hkMyT+clZ/1UrNecTLr2Qugb6R
	fcfCbl/ZstEz7waJ0skha35EZXnrJz5/iOM8p86o6HpAN4IGU3QlK+6Y
X-Gm-Gg: ASbGncvEyiP3o2U3dkNBY8oBBUUrvG8jKqGLJgKO4WX4rr0lZVWlLEBtJ3nqkm4vsZl
	Akiwpv+2vmRe2n49iBHXbuvSA8wKmsh4fAwp4NFCYD5sDAD7zfy60gC3HsB6taC4HUpHa2NEJ/v
	rppBIZmVcp10maeTCRdjaYXA5Tld2ogoNVB3Lg1piuWPz+fZQeOMaz4R66CUePHc5ywt1nhIVX9
	sl71fKikYGBF6c71JWYI2lXitNW1IRr/dJMcUXmP/8LpTlo49b4oklURQn08LG+Qn9xPh6Cj1uR
	Zdnk6A4y0qfaZR6QBFtu08pv9y6/cpCUGyA9LpdqA7Y5ZuGdPv1C3RF+nZkhkz3tHRnM4cRJ0Y0
	fbi6dEHn5lCixgQL4PAiuzhOou9PeJYggAg==
X-Google-Smtp-Source: AGHT+IFZzKABY43DwcNpn0sIkbPkCHkfh0kQ0czrR2B5ofp4usmiPOKFnkWKHqqX0qUfZ2kpalXOwg==
X-Received: by 2002:a5d:5d0a:0:b0:3e0:37f3:7778 with SMTP id ffacd0b85a97d-3e7657ae107mr16246f8f.26.1757608850960;
        Thu, 11 Sep 2025 09:40:50 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e01519f67sm16926915e9.1.2025.09.11.09.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:40:50 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Thu, 11 Sep 2025 18:39:59 +0200
Subject: [PATCH 3/4] clk: st: flexgen: remove unused compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-master-v1-3-5d5d5ea9af22@gmail.com>
References: <20250911-master-v1-0-5d5d5ea9af22@gmail.com>
In-Reply-To: <20250911-master-v1-0-5d5d5ea9af22@gmail.com>
To: Patrice Chotard <partice.chotard@foss.st.com>, 
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
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBowvuMbY1OQnXPxpMBncePehdQ10L+g/H6JEtbv
 Llk2v7/cUOJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaML7jAAKCRDnIYpo1BLC
 tYd6D/9CeOdaET0JgwgX5keygapOzB//kV385w0P358vyQ7CnF1H+k4iUSrwV7zb2vA+j7t9Qyt
 9DNzrNmJA6JyBx26lu14UFwHl8muLg6QGp58YPd6hrU1+49CrQLwX5b9P86dAJ/gJvYJzhdJCkM
 LPy87Iy4LI2TUpaerZIccGhQYG4MtKb9t49GTHptLwcBY7MC5ZCooeoifzhPlUXXmVXlqNGdQLK
 rK/z4UCUHXtr3zU0GkOmgpDxV6zwIU98mUpv927D1C0n9LVUabX5v09fj1tAGTEedfo3RCfUftR
 FnsBGg4Uop/ay2M3HWnT+Gjih+Mg74t/emauYRKQhxMUoyTxhrL1zWccuwISxjti2775niY/mro
 X4helvzgrfuqBv0oCJpzgAIyYaTrE3af/9HZi9Sn9slkSSx/jRPi7efKoCQGAt9Jm3vjnVkn3Tp
 GjA68iEz7cs3brDE7bb/QYt6xLpFF4qyyjujDiwlUX1GK6qZ+Kyr0UxisxsP8D3iIJNUQuQmbJl
 RC/knn3+z1oBonq6eDiJZGQrnw484UByKsOmWVDE+MUS/1hNDucQSJ6Hv7kSYQ7vS7zaVBUGB2g
 fIbrxcsoZRUEYF+ZwEkPC10uhCL131HE694p/5tNRRR47iQot/b/c1UQ40gQ8s2gMFzLeDBvSci
 GsnhcVm0C+5Kjsg==
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


