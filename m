Return-Path: <linux-media+bounces-5965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D548677BD
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 15:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5753E1C29BDA
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 14:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F9412F5BE;
	Mon, 26 Feb 2024 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e9qVpzvj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4293612EBE9
	for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 14:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708956155; cv=none; b=AXiiRuyDFhj99NglTDoCOCiTPG/6nsYmHaZdeX3pfk4nj3+gPOtrT4Q/51+koRBfZh3ps1NG6f46MAs+9L3Ho4O0Z4/YAT+tpFaGeccMUid9RrAPi8zx9YJRR6pS+HVqbbk/QokVjRFLmn8d+/475jRz+JHiNjC20ZiDTFgrLtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708956155; c=relaxed/simple;
	bh=wXzcoZ01ca5dM7JiP+jpbdH0FdMDFiDQ13DjfVwqVVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WBgLgD1P8B6z8l7ZdaygYgCtWvW6TKvZJ5tLx/bnG2LmGc4vPj8upzCBNrPV3ahAesFDK3NGi6ZSyxoLXiVEC9qJlkeVEYfEFqt3yvqMzf6CwxbeNL2V6I8LJB8DCGu7P+4YZOMse++bOJ6WxDZMiMTvVYuUTtVv81QLaeYZyKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=e9qVpzvj; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d28464c554so20105631fa.3
        for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 06:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956149; x=1709560949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRzHz2xswbllHIIRa+KrVi40UoddaC27mYKCsGC8B5M=;
        b=e9qVpzvjVEa3SBl3hZRkdwoVdMJZXVn5I/x6LF7WCQ6F2fg1n7iU5cWUwkMuQewu65
         eN/4yU1CAluoB8ijpm+pjZJ4ATsVuVHzgqcxgQJGUZwYZrM9sOAgh1OcDRj5wIbJNQ/4
         iY5SYSPvJdRlXXktV8p7BL2GXQ2fWYLR1i/DCpGHJ3cq8Ah3RZRKyGUuDrP7rBRSaGL1
         ymR7DnukeGPeji36Bxjbq1N/G5CoitqFlGUbsTQCzCXCiApE2zOH6RzAdv61va4DJ7G1
         5mAGk8tylW/tIUnhjJaIQ6Err2l2zpEsWQiXHy2ER386fCkDd019yumV1Het7qjLY2x7
         8H5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956149; x=1709560949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRzHz2xswbllHIIRa+KrVi40UoddaC27mYKCsGC8B5M=;
        b=QkYfFPvc6T1z0a6LsBeW12Str6GZBoBW9TUurTakfRAguvw28X3QvhLVzUUtx55ZRR
         p8dXhpfsBeQWkoWqS0csuI5nPXtbAmssX7ZYxrnDmGm+h6e/InmLmkqvz6FiORT0h9Ch
         VJxo/zDen8MgfBlg03R2JlgSZp7t5Ax3Ll/32iIPzawO0gxyR95oiOveY5OEharBflYl
         2Q3iVCpsWGvyvBKk+E/18XjhqUl4j5tYIbj2Sb2gBaWRneHEZgHCqYvFYxvBn+jETzAC
         j2g8HHZ43FLr1p8TtDLjv+yifWhTeTVYTjMKQo7+QApemqOQYtb5GTaOC8ytLd0U4LsU
         qDkA==
X-Forwarded-Encrypted: i=1; AJvYcCUqRbVitYaP7QbrkXmVwT0JwahkIf6YUTDNzG4yG1gKF5etKUXgFrH7bOHEeap3cQbAG2gJ8nfcpkCpnV2tYsaGbWjH9kogTNwa2A8=
X-Gm-Message-State: AOJu0YyRh8r83isN9NerTZ5jsSeakGZfRf9R+AnchOJGx/KHkPNgBJ6E
	yUrTwTZUsgCPPqfCUQ3JBOzBm4W2oa5ZCaEYmC9rsvGPPrPTtqPOHDotehKofOA=
X-Google-Smtp-Source: AGHT+IF3qwR9Gc+h1O6WyIDdP7kIsfb8il8xKzj6tOQtu9QhZUg+J5sdQ8PPlj87e4Oz8wu+C95RXg==
X-Received: by 2002:a2e:9247:0:b0:2d2:9185:2017 with SMTP id v7-20020a2e9247000000b002d291852017mr550055ljg.17.1708956149131;
        Mon, 26 Feb 2024 06:02:29 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:28 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:54 +0100
Subject: [PATCH 16/18] arm64: dts: mediatek: add mt6357 audio codec support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-16-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=958; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=wXzcoZ01ca5dM7JiP+jpbdH0FdMDFiDQ13DjfVwqVVs=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JndPcSE5JSY3z1YtT9jmziw95lzTv7FpKPgFmzb
 WqBD0pyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3QAKCRArRkmdfjHURQ4gD/
 45DtjX8QtQ9BlpoeQoUHYlLB65IVbXtkjFBMq1f3miUNgR/FSQpZ71R4jQLQ9TUUy/X6lsq1+5i0+m
 xbD5HeTgN/G7posNpd1nPboTHB/+/7edI6JQwqTfaOOh1ihqQUOk0e+FSQHEb00SBIubf/1gPzKWJ8
 pGBTnVMV55xcvqL0QuVarAxPho9t9JKKGENCNytIoPk+Ufd21qFJ4H/w6sbta/F5XQyrj2UmQcPUhH
 wyP/DFzz0c8/f0Xx/BLOpuO+/9HjIpv2bxvLLEfgaXD6ap8ZqhuAUP1VgXHWdoPY/k/WE/zutLBILv
 k0R59zI+yJZA9JTJuHF2RJ33LtLQn6YaiKoHjD7PCO0PvdrvnRRzBB+udbHUAj9sIPLjb1JovChRhM
 SFGQIhRV76UfeL7wiVwUdh/jgsW57n78DhFBsc4ckarEvb6C9u5fgiHCCxc+Hg2q3XxZTvRKy9M4ox
 3VMUdtp8ownC1VrR/sQxlHByUgvK8TzwKMwQ0SKRBqhduIs4nF23/tVX7Jo/tRge/28AhdBSHFOe1p
 ALtfws/Gzp0JaH1zGHdJGLwb2JvAf5ugK56diBaEvIMfQsWGFazGdJBtfzKNT6D3UhbTeofnTuSn62
 3boyWxQP16ra4yZJ6OJxzL65SIXw1oLRwvNl57L7wmG/3u/EIp3AdGKmD+iQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add audio codec support of MT6357 PMIC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
index 3330a03c2f74..64b693049930 100644
--- a/arch/arm64/boot/dts/mediatek/mt6357.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (c) 2020 MediaTek Inc.
- * Copyright (c) 2023 BayLibre Inc.
+ * Copyright (c) 2024 BayLibre Inc.
  */
 
 #include <dt-bindings/input/input.h>
@@ -10,6 +10,10 @@ &pwrap {
 	mt6357_pmic: pmic {
 		compatible = "mediatek,mt6357";
 
+		codec {
+			compatible = "mediatek,mt6357-sound";
+		};
+
 		regulators {
 			mt6357_vproc_reg: buck-vproc {
 				regulator-name = "vproc";

-- 
2.25.1


