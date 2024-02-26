Return-Path: <linux-media+bounces-5962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B160C8677B6
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 15:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E05B1F2B846
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 14:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AE612F373;
	Mon, 26 Feb 2024 14:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aEvTaVKI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F6412DDB6
	for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708956153; cv=none; b=quu1fWIKtxPxOGx2QZj78RysjOeM4YHfwf0TRNsP75IrSe8Bx4MXcghJSr/ZmykC9XGs30Nhi7KJi18sf/ouvqrqmNd+v0/qFWEVjg1Ort8z/CRh02u3oVFP7hRATsIgL8FFb6CkO44cCiZ0Jt2LrI1im6oJPDlZJKd734MGZ8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708956153; c=relaxed/simple;
	bh=35n2GsRcpTZr3lOxOrHagpbcqAgi2905jIabSC1TVuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/keF8AV21VMA35SqbdUTfakhkd7w3E/iThk7tjy7BJLMy5FKB0/EvUntBgNMMxeWJ/FnGc5AyLy3DnTBev0v97ZFrzM5OmjjRWYHE1jPkTbb0qufwDsORWYoVCf2ct0c67Ih0SZzBVuBHhaY9+s0dqvj3B089ep3rwQicWlWi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=aEvTaVKI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412a588c8b4so5417265e9.0
        for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 06:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956148; x=1709560948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDWI7WdWN/xqchY8MpbLI2Q/P6BoSTpm5HQ84jq3qfg=;
        b=aEvTaVKI7vrDKHvivq1ji/5t5kE81R28krvt+u/0cytD7Zn8Tue+YAe1Mnsc/A3vNI
         0Fy9a8pdUm7SNwvTvvgxhcqqVxrXAeJ66uLQ5oxa3m/lfWaocwXIX4UCXUoL7FRY6jWt
         A7HxKS0MyXhvuO2CLlAI3H2R4jv9vtGfIkMuX+1B4YNxLO1Pvux9GV9BGbEV51n8zatw
         rFbYL+F1T5HPCQnyR7v3TyWC7H76ahX5wF3afLKCydHh0MTb9J0Y0EhxJ6Bc48I9CLUR
         Vl5M9eST2BRWjcXDztnn1FTSi1AI+/iO/rHpF9EKIR8elVOjiDY214pea/33sxYEOIIR
         kwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956148; x=1709560948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDWI7WdWN/xqchY8MpbLI2Q/P6BoSTpm5HQ84jq3qfg=;
        b=qmY7sy+mSZ+r2L30G01qoKKc6IVpCKiXU/TOVomKwI4a2nXiexix7teEZWRm7xDQ8o
         3t6lUERkeFxXo19qobiavdzzTqAQDQSDzm033k7Lva7RY2l7Rm30P9nRtvLy3T+I8aTU
         91Jwckcjuf4s/n2GkZALFehS7gl3CC5aUNa7ukbGg3jXlWBuSXXOFAJNDRsn1RyKdqb9
         Y3s15gE49zNdBKrigor1HGEhr9X4LcMVXulAv4AXFvO7vSpGmZrnBOM2YOnkl+dzlqVV
         uHAdXZvj//1AoO6pdTILQPAK36GUPWsIT4tABq43wVtWUACHHCbqnju65pcBqzrqAKY0
         TbKg==
X-Forwarded-Encrypted: i=1; AJvYcCUe7O5XeKuCjnkskI0QyBM3RFYKf9SaUoYYSeFA0MGcrAO8Wpn9ODpoAmB7/jM5PisXjRoTF1bBxcmvbdppEN69DfjuBs++/4KQTTo=
X-Gm-Message-State: AOJu0Yxl+Lhiy0p91cTnzH7fvq4qjqMEXtxzQnDhCfzPKYsmw0CZy64D
	yOM32N7tOfOrp9u73CJ7IH1WoZURLsNkLQkcF/KhorGljB6nigX1/Mb5KlN+vAc=
X-Google-Smtp-Source: AGHT+IHWP/qkYWdxWpHEOS8rjToyu4G798DZv6YBQMjIkLWJWPFpz5/qUpxUbGtrV03PZ5K0SplPJA==
X-Received: by 2002:a05:600c:5489:b0:412:a1c4:66d5 with SMTP id iv9-20020a05600c548900b00412a1c466d5mr2993620wmb.6.1708956147845;
        Mon, 26 Feb 2024 06:02:27 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:27 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:53 +0100
Subject: [PATCH 15/18] arm64: defconfig: enable mt8365 sound
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-15-4fa1cea1667f@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=35n2GsRcpTZr3lOxOrHagpbcqAgi2905jIabSC1TVuI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JndJ19aagvtDXuZQ0/9DdusYhsa8CdGoAfiK+Wc
 Gt6z2s6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3QAKCRArRkmdfjHURTqHD/
 934l6M/jGn2yIyXJ+H7MJY3XE3WHJZZH2XV18t06deIoLU2VYNVI9icYiXE3kWlTsugcaBrHFVdLfw
 LXDiTpZeqxap6v7hy3e5BcB+1kBBm0b242bXkAN/yLqPLoa8J+eGpLA0DZ0GuiNZTC0B3qCQi7TPNp
 ZJP2h+BTawbIPutN1ZogugnUa7s7abKX25cXLAfRn+3rFhcDy9hTi4cgLA5b6Y2ozG1nuvVvRsFO27
 9c0fgNdWilfdZbn5EWoPRVFtscYocxq1w1lqCTprO7YNT+I+4c4+8GvaVuuDgaQP33qROKicyT3IsI
 AyAC9o4NYiaUjIX19hIvq0pEopkv22VPMXOShzFztdCon+CTTW56zvJw58DBl8ajyBG/ZEL4i9IwMX
 e2fHAQXvwuMpNj6HVRiWWh1wqstY/tcck7h5HSGoMVnhSBqAKQANmmwyavlPir/cfla8c3Yfr68Eg2
 MpiJbP3Pw/IACIwg/vJ1fH/IB9zbSek9i6bti0FE52dIluxg7MsCM5/ThLq7AA3ac5Lk5U9ay2q80f
 HtfYo59N2TqCcD/MAMTArwQP4w8uyTj+N9U9bSfZ3cmHRAFnYp2Aqt8380CM1TBNqYTo5k3/uu1OqP
 IRbvhiPyZA/odmosICzKALd0F0QjU81jby46zspKro4iZcoEuCxQ6rXSu7ug==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Enable the MediaTek MT8365-EVK sound support.

The audio feature is handled by the MT8365 SoC and
the MT6357 PMIC codec audio.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e6cf3e5d63c3..83aaefb1c866 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -929,6 +929,8 @@ CONFIG_SND_SOC_MT8192=m
 CONFIG_SND_SOC_MT8192_MT6359_RT1015_RT5682=m
 CONFIG_SND_SOC_MT8195=m
 CONFIG_SND_SOC_MT8195_MT6359=m
+CONFIG_SND_SOC_MT8365=m
+CONFIG_SND_SOC_MT8365_MT6357=m
 CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_MESON_GX_SOUND_CARD=m
 CONFIG_SND_SOC_QCOM=m

-- 
2.25.1


