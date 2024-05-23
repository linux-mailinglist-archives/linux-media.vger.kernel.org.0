Return-Path: <linux-media+bounces-11758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8A38CCE44
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A0E71F21DFD
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 08:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D9D13D242;
	Thu, 23 May 2024 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qsSt3q9j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519CC13C68E
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716453765; cv=none; b=h8uV2ZonqiNo6Q1KYvDxAx/6aaBTz/LfYwV1oDVSwF3Sr+J8gJc08pildPYcrc+ogaiFLiDbIEsJB3AULAp/6rdf8c+iYwpevIPxfXUie0XU57ZZOwL31zvOS5d0hSRk1K6VdMvRfYtser/8w4sl/84ML3QNOmU8WylFvVjFZJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716453765; c=relaxed/simple;
	bh=6mA9w0EQq5o6RRMrcQA5mF6HTvpiguhhgrxdASPo2e0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XzBcHRy5bpcLQMkbbwEWXx3ygGYpbvV01nonbs3c+WsQr15P92rKKOf42vOjdB1KXHwpjgbP5YzPs1qcKl37WmV2TVyZBhH9IrKwIPQ7T5EJd5MMR3L4kyJjXzGqT9/J0uNYivg6h8YCdozyQ4Ve3PITDynz5pJDkZsmo2iC5qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qsSt3q9j; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42011507a4eso14999485e9.0
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 01:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453762; x=1717058562; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s9IoM7ubfwjCRGp2OqRR9/s+nq5WA6taakqxn5di/mM=;
        b=qsSt3q9j03jpKc8aOerRwRDBAu5lNPxfTmfSaOiW3g0KIfWBFfpOvTla5xy9+p5ijg
         dnbqz2JMRe4czUzuEoCcpdFnyuAf9IqjDyLIOm2zYRYwLGAKHw2lOigRC4RNpElUMR2D
         wDpRynuqX5MGPG5cTc7uKB0ZAKMO8QIyN2AgmfVuUv5PVzPqyqd0ltnWnVyBbqXyAH/q
         ltI4iY+WxxETJJNbFPI1olnbdKWeYi3YThBVHEkBdCqkEaHPwe4HsSelLgPMNXJxj9Dj
         vL182Zw2o6tWvRrA5IpDsYazI7DmCMAmrqtzrHSfs+ulkHITSHSIfYekJZY0TznaC5WY
         O6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453762; x=1717058562;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9IoM7ubfwjCRGp2OqRR9/s+nq5WA6taakqxn5di/mM=;
        b=m9CDqsWWTzue2M6wJycF0q2z8ELLNc5gZaIKWtcWXEbsbXIFNIZCgPyVUXho0uBLz/
         HEHCTyOnanHJOZnB79UmfUADFtizeDEhHAqtSAt2O7EXU6Ld1PezyyL1dz5RQut0o7Rj
         /06bY5UphwD49bZ86NUy1BYc1T/QfBayer1mpSVFo6yItnJrIi/5Uf+kWnIa4nKs6sRT
         gvkIXfQ5LyZl5oklc0xVXB045IQD1aw6SY/bxia4NPK5LPyB/IwUihKwzd+A7sU2lYLM
         SDGZaKhawdgHNcLwrspDmfaNxSZtW479OEJGNkpP8p5k5IOf3BR/RiBd+yz36trUaikT
         P23A==
X-Forwarded-Encrypted: i=1; AJvYcCUtNJMb8zJ07L2mURDiDWOMMrUc8qMp5RQuJDvXN1dS6+2VV+5w1+gppry4AmTyQ7+UVMdWEMFnB7/5Mqew1L80iiAwAl3hcOIZW3A=
X-Gm-Message-State: AOJu0YyhzYMXEJS3DJUMPsutnu+tlC9NURnnOqm7jSAy/vs0v4kF5XAS
	tmUyD6jeIV+JP7Ypu8ganXd/eIN04Melz+OfI9t/TmY4KNLCMHJ8nFEhampVaHY=
X-Google-Smtp-Source: AGHT+IEeSF0n+GzArx73nwYO6lnriXZ6tJ0DRv8D6jLr9WeIudFedWUiTESJQl7Eo1V0D4QbkiLZMg==
X-Received: by 2002:a05:600c:584c:b0:418:f760:abfb with SMTP id 5b1f17b1804b1-420fd2d7071mr29842315e9.5.1716453761573;
        Thu, 23 May 2024 01:42:41 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:42:41 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v5 00/16] Add audio support for the MediaTek Genio 350-evk
 board
Date: Thu, 23 May 2024 10:42:29 +0200
Message-Id: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHYBT2YC/3XOTW7CMBAF4Ksgr2uwxz+4XfUeFarG9oRYAgfZE
 IFQ7l4nyypZvpG+9+bNKpVElX3t3qzQmGoacgvmY8dCj/lMPMWWGQjQAsByfMQ08KSM4JqkjCi
 cI2NYAx4rcV8wh34meKVyzng/jHbveAnysNjfcCHMj9ssboW69Fzmf04t96neh/JavhnlfF0dH
 iVv6x3KQCitPXbfHl+X5Avtw3Blc9MI2xqaVkKrqJ2KJOKKVttaNS2t9xA+jzoYs6L1ttZNCwc
 eQDobdfinp2n6AyV0kEyTAQAA
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
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5809; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=6mA9w0EQq5o6RRMrcQA5mF6HTvpiguhhgrxdASPo2e0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwF/BUH/8IbYUnAckzLUkGmhFoeLd1jg/OI0wnsK
 bUZ4x6OJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BfwAKCRArRkmdfjHURWW7D/
 sHp0Ao+lZD/Vn6BLG/eCP+OxIy594sYU8PBH193MniLgdvURvi1RArpum6PqVbLKrZul1xG/g2YvdR
 sqt8QK7fF/ZwjabEs+53x3DXhvmOv3uBthAH8gWXLthhC5R1PETsMvli9L8lp7O3XyKVcizHJfYhWi
 zlZUdLFCQe5exrBmd7q9pWtJnkPXZjZvgIHcrMUBhX2b/kBZUrg4cQ/qKKjqlfwRV4srqQpj98Sm9J
 cl3u+A8Go5Ig1OaFacv+7WsuJPJTcg97R+YFsbuLvbtQqv9DmdbJ8FT8DDhOYRXdTabUhpWbQwRdCy
 VHmoCtr7dfNpnosf4di42MTHBaoHw/INpDi3OTRcU58gqfQYhIJFMoWbwCxkaaOH6PQ4mzW9OD5BHO
 tweyZQFWxQBcANsCIrIrExjdD6gQszvZI3bnjG1wBNcH/jRZkisd07vTZM5C8rxDWDtNddnTH608FN
 GXKeKIBk9JZFzM1VohHg9KGcsAt1msPFBlLYyQxJHuSMHSf3NCmsXU2TSE9eEAMOHvuIL/ZHL4Cr2k
 HIFWhrUbNS3fVp+xNn3x+Qsw/ztOqzrMvtLDTSXkkwChA2EQFaAgqh2Zcen92jvz2Lv++j7pkEzx/F
 h637DaBirZmda/kkMfDm+aoGBVZ3GYhYwgsMubHgGSj2MNvqW2rLWR4YNaLg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

This serie aim to add the following audio support for the Genio 350-evk:
- Playback
  - 2ch Headset Jack (Earphone)
  - 1ch Line-out Jack (Speaker)
  - 8ch HDMI Tx
- Capture
  - 1ch DMIC (On-board Digital Microphone)
  - 1ch AMIC (On-board Analogic Microphone)
  - 1ch Headset Jack (External Analogic Microphone)

Of course, HDMI playback need the MT8365 display patches [1] and a DTS
change documented in "mediatek,mt8365-mt6357.yaml".

Applied patch:
- mfd: mt6397-core: register mt6357 sound codec

Test passed:
- mixer-test log: [3]
- pcm-test log: [4]

[1]: https://lore.kernel.org/all/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com/
[2]: https://lore.kernel.org/all/20240313110147.1267793-1-angelogioacchino.delregno@collabora.com/
[3]: https://pastebin.com/pc43AVrT
[4]: https://pastebin.com/cCtGhDpg
[5]: https://gitlab.baylibre.com/baylibre/mediatek/bsp/linux/-/commits/sound/for-next/add-i350-audio-support

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v5:
- Rebase to "next-20240523" branch.
- bindings: power supply property moved to the parent node
- Replace "SoC" by "ASoC" in the patch title (5/16)
- Move and rename DAI I2S's defines
- Improve code readability and cleanup
- Link to v4: https://lore.kernel.org/r/20240226-audio-i350-v4-0-082b22186d4c@baylibre.com

Changes in v4:
- Rebase to "next-20240422" branch.
- Re-pass dt_binding_check, functionnal tests, mixer test and pcm test.
- Remove copyright changes.
- Move mt6357 audio codec documention from mt6357.yaml
  to mediatek,mt6357.yaml
- Fix broken indentation in mt8365-evk.dts
- Remove empty node.
- Add more dai link name according to the HW capability.
- Remove spurious property (mediatek,topckgen)
  from mediatek,mt8365-afe.yaml
- Rename "afe" to "audio-controller" in the documentation.
- Link to v3: https://lore.kernel.org/r/20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com

Changes in v3:
- Re-order documentation commit to fix dt_binding_check error.
- Remove $ref and add "mediatek," prefix to vaud28-supply property.
- Link to v2: https://lore.kernel.org/r/20240226-audio-i350-v2-0-3043d483de0d@baylibre.com

Changes in v2:
- Documentation fixed:
  - Remove spurious description.
  - Change property order to fit with dts coding style rules.
  - micbias property: use microvolt value instead of index.
  - mediatek,i2s-shared-clock property removed.
  - mediatek,dmic-iir-on property removed.
  - mediatek,dmic-irr-mode property removed.
  - Change dmic-two-wire-mode => dmic-mode to be aligned with another SoC
  - Remove the spurious 2nd reg of the afe.
- Manage IIR filter feature using audio controls.
- Fix audio controls to pass mixer-test and pcm-test.
- Refactor some const name according to feedbacks.
- Rework the codec to remove spurious driver data.
- Use the new common MTK probe functions for AFE PCM and sound card.
- Rework pinctrl probe in the soundcard driver.
- Remove spurious "const" variables in all files.
- Link to v1: https://lore.kernel.org/r/20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com

---
Alexandre Mergnat (14):
      ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
      ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
      dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
      ASoC: mediatek: mt8365: Add common header
      ASoC: mediatek: mt8365: Add audio clock control support
      ASoC: mediatek: mt8365: Add I2S DAI support
      ASoC: mediatek: mt8365: Add ADDA DAI support
      ASoC: mediatek: mt8365: Add DMIC DAI support
      ASoC: mediatek: mt8365: Add PCM DAI support
      ASoC: mediatek: mt8365: Add the AFE driver support
      ASoC: mediatek: Add MT8365 support
      arm64: defconfig: enable mt8365 sound
      arm64: dts: mediatek: add afe support for mt8365 SoC
      arm64: dts: mediatek: add audio support for mt8365-evk

Nicolas Belin (2):
      ASoc: mediatek: mt8365: Add a specific soundcard for EVK
      ASoC: codecs: add MT6357 support

 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   |   33 +
 .../bindings/sound/mediatek,mt8365-afe.yaml        |  130 ++
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     |  107 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |   89 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |   43 +-
 arch/arm64/configs/defconfig                       |    2 +
 sound/soc/codecs/Kconfig                           |    7 +
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/mt6357.c                          | 1898 ++++++++++++++++
 sound/soc/codecs/mt6357.h                          |  662 ++++++
 sound/soc/mediatek/Kconfig                         |   20 +
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/mt8365/Makefile                 |   15 +
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c         |  429 ++++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.h         |   32 +
 sound/soc/mediatek/mt8365/mt8365-afe-common.h      |  491 +++++
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         | 2275 ++++++++++++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c        |  311 +++
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c        |  340 +++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c         |  850 ++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c         |  293 +++
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |  345 +++
 sound/soc/mediatek/mt8365/mt8365-reg.h             |  991 +++++++++
 23 files changed, 9364 insertions(+), 2 deletions(-)
---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240226-audio-i350-4e11da088e55

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


