Return-Path: <linux-media+bounces-15224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A6D938962
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 08:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22FAD2828A3
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 06:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE6181726;
	Mon, 22 Jul 2024 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aVot7Q7c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0335D200CD
	for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 06:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721631253; cv=none; b=WhIpizf4CZ8wXtmqvqivyagjckorLWVIJZ3zXM+ie/tR3x/UIvn//Z26EQ3YDUq6IC7aRMSBPnDYFJzgUbmIZNuwpf7iNQveI0mhbYy7EiJ4LiJE4tGszQ/O5hzMh0GpAb1UQmtMAi4yGuI2rCk19pxGcmE45/JxWUgvln+gfKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721631253; c=relaxed/simple;
	bh=Bna7lGeZ34+vVkeOzBYfhldONP25svJS8tOELxKnAgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNaB29Uv+oohUX8affW3d6FF08SlazvMKm0SuqhD6Leu0lS/wdnr7fscNafcrgY58BigLnrn5OF1DddQ7KGxvOel3h2B/sgy1K0gqm6WjNTcxd4yc1N0um7Is7jfAShrhLoagR0QPrIm6mHbSnYRo0axwffcfVHMk+pHF5UuN7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=aVot7Q7c; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a2ffc346ceso2542454a12.1
        for <linux-media@vger.kernel.org>; Sun, 21 Jul 2024 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631249; x=1722236049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+u7W92havYZUIlpwYblhqqwSvlNhEzQdYNsq1VBwl0=;
        b=aVot7Q7c6NBEa4bAhXmi9tyj3DX/rdcvxh2IISWwX9l0xsr+mkclXgAJewKB2JM/1P
         u70qHjAB1eA322lcHu1C+fxPOcyuuA+sIO7tNO2/UtGSAQ7M/qQl+3gjlA8E0Yew6ikK
         yDp03ZgSZMvNXq6jdk8CIijMOGDR8btlZATcH0luWjXvkODpL5OF0ver8rrLxaVhGoRN
         We4kPhVjECUGNJPed89RVHD3qpH4dE8M+ottQe8z/oW+IBjr+O5s/NDiO7HfJeBVhc8L
         D0+gloyOhjK1svVdvEEvACpPxgvNdBHJ4ZPkdjCoQccT/OZjGitRYdZ1kjgeHqdAAo3c
         wTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721631249; x=1722236049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+u7W92havYZUIlpwYblhqqwSvlNhEzQdYNsq1VBwl0=;
        b=YKHBwMHZNi+i78uOkgkopBT+5RS1VkwT/VZUf0GEHeLCSrInAKo5uEx+Fu9j7i90qS
         P3faXCCDDOLm/CcQ9MDu+hkc/QbUjTkCkc49gjM3V3x8pXbNEIs7C0dxhrUys6lg20UT
         PsSWNYzkNRDPXeTsZ0SgFLqRT5STdJsreyzrPlVyV+W1sWozSc6RL9zg0K6+Up7G2Uet
         wuNYFAhhoveAsQ42AKSlBhgKcbuPWYU9aTInPziKkOVCAA0Ja3smDMA9nlxP1nfegcrL
         SWg774o0Bg3QCetTLVdseQpLgyHfMxxn8QASlC1A485Ajqf+lH+KXXhJsGSCaWFAGj9H
         XtQg==
X-Forwarded-Encrypted: i=1; AJvYcCXVU8xlk4pZ5TN7i0kLzyLgV0t02clqtop7eRv3AJTeFPRu4Npp8zMimFZ2N7iWVCd7qllM7XKQIkUTfboaWBYzWxMB3K0PHemnPLo=
X-Gm-Message-State: AOJu0Yy68Euej+CjSjOxykj5UZSvZsKTk0HvfJ4mCZ2dTRamYSrX95Cp
	/Zei7Sg79pODcktz0ZgbjC60bkFJSBQD5TJ3Rw++93S7aIRuOa6HxO1bRXGhPsPRFbdTQJW04Ko
	U4fc=
X-Google-Smtp-Source: AGHT+IFujFs1sGJ63tkG3t7eMu1L5vDcioENHIjwLFIzn8k7Yeds1uPgGTvzxdZX7AvLMdrnfahf2Q==
X-Received: by 2002:a05:6402:11cb:b0:5a1:225b:4233 with SMTP id 4fb4d7f45d1cf-5a47ab11d7cmr4605872a12.23.1721631249220;
        Sun, 21 Jul 2024 23:54:09 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:54:08 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:43 +0200
Subject: [PATCH v7 14/16] arm64: defconfig: enable mt8365 sound
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v7-14-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Bna7lGeZ34+vVkeOzBYfhldONP25svJS8tOELxKnAgI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHxfVG6iGXjQ3z31grSqs43cXnJ8FDoaVpwi344
 ojLOAjiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8QAKCRArRkmdfjHURb7yD/
 wLghhgERwAWzgSENdpf8qwjr9EiINrnkjpHshQg2NvDsSIy1UW/NMQy6Myi//74u8oHK5pJO+TaH4c
 Ed2SXiuRRDhe7S3zuA21M76Jr4Iv4f0UuDj80IzZJBTGlRYOLfNqTVHae/d1gh9im520TqF7TP0aXZ
 wukLxf3ne058bpAR6fEbjyur714glk8JJCjTruN7K8RctI2aPazvPLGS66ANsZ/dF2zR1dGCUiGRaQ
 XXLxBDpMtK9fZvAbk+QP2oH182xD1cZGK5KlwqbjNk3yf5YOBANZgXeJyrANpV1Dyym69dHJfaxzzy
 czFDKbl35fJqiehFpoPmTZN8O+S5A3a9WIJf8KAleXeralPjD0/EkyVg8HPr0U2PxlY/TYQX2ikeHw
 M1pXop4pqlmZTXGBcAiJW+CzmVmDASqyVkg/eBvs7503s/NxC0qWBbVgYu64nTmAeafjD4R8PKGV4R
 GohN9mo7c6ZUDz4uI6LkA6qr8IcaGawsEPiuPdnXzUWYPS0NRQYmZzogAoXz4af0U4fVf5u1ECsxPc
 r1ERZ8jJ7bkO+Wsrx0+sRsdf0RDr8IdCOqQ+Y1QJfiirrIwq4ue8xqTl+Usbw3+gN6erRmvhftYUng
 /DTVMBN6rV4SgL6SEwU7MLGsshxHkqWfqNooLzCys81e6/o112VdofNKAnew==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Enable the MediaTek MT8365-EVK sound support.

The audio feature is handled by the MT8365 SoC and
the MT6357 PMIC codec audio.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a6c9688fee0e..f16ac6a0fd46 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -949,6 +949,8 @@ CONFIG_SND_SOC_MT8192=m
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


