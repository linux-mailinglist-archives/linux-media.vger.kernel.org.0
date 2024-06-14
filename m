Return-Path: <linux-media+bounces-13241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99991908515
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4487B27385
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 07:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C410E18FC85;
	Fri, 14 Jun 2024 07:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WIBimMuq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0C518F2C1
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350107; cv=none; b=a8PupszPD/ydNK7qPOKuiaoGuD1IyT0E5dhHV3EX9cb1jAa2HhzEqFXy2btsXWV18IrFp+Kkne4M1eV5wVEyBJk+1VJXafll7CXzZfLWrCzV/PE3BlKze2+vB8uKa3qsvvh9pfUAb0dJGIytyg816Bdm3ndEl/UHcjkORV99Mvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350107; c=relaxed/simple;
	bh=cO45G3J6A2HCrNyifwgmbquTtW1hXtTIuXDjiQ9kiyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jHVp90zic6ydoY/1okKhWHrAsrXAtkxc4a1p8r8uE9sXn8dwOQhRsfih6xwuqrG2vQ5aSudNQiI9Xo7p8p1MuknraXdzKMGQdjZZ/ya8mf1mefwDsyd4twX0Te19Ka3izEwFS84Bq06/DgJdZsO+f+y08nd6jFmVxXvEEJbsCZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WIBimMuq; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57c76497cefso2051547a12.1
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 00:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350103; x=1718954903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
        b=WIBimMuqwI4IXWfKpTbntSQIyjGZyQe5bpuAzLDYuX9E0+bSEKZKJHI0A15VDlcoge
         s/WkEF527TxJmb+BZhyQcjynCPw7AXJIbn2Q4SJ4QxDRTmS0JVhId8YPuARnm+2ZWZgW
         zixYc/SOZ6AfwZ9ZWWYXXrQE7H29N7YmcLSEWxjLSydE32CEFOWnwRiH5Ebt4FO57EYX
         wC83nqothsA64aMAi+Lqjf1IeNt53MBwyxhSNtJmeOUf8OWL7sckl0BrxE3yJNZXsU4V
         Af+htFRDY2H/Gyg04MZFnfrRB1ICbrtuDpIwlNseVbqnBQs8TBZ9inuULteQ2+L/RyE7
         GbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350103; x=1718954903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
        b=FFOcTuoSYL7CoR5n3CkYqb67fjiZ9L29AiqFWhCbekRARPMHRr8BbkcNV0Romje8EZ
         /MnjwG/szOxjA3ezoUL6/AnBiazlglyimk/f1/m+Ryz4Y+0V0J5mpgj4PxwYeH69u7g2
         54TzGPid1HY8WYCVlgH3fUFFDgYom2naUb7BVR5MSb1Wz76Z46ZHS+8xVTtZAv22/I+O
         aa/8ycaFSM/buvMHNgXodUwP5c3oUh/2ZmWhUA8AWOok7fVdTrg2TQ2Nayqvbm+cirmW
         MGV/RNBXY09FFzN4TOjB0lflMnpj6WU9aTpe5uyuZu+Qznwh6+11LSORMgr2vwSnrr4A
         yQLw==
X-Forwarded-Encrypted: i=1; AJvYcCWkBrnLLrd3bv0KWaUK0y3MK8bt30/QcVsqxywFWKvFl7AeW5UoDeGeZZ3Tjehw9J7cLcgPOUygakUwIspyHbUH4Mto5jpVC3SHOPA=
X-Gm-Message-State: AOJu0YzkrGwIGbU5uoUPtsT0tEZUQ2iujTRJ2T3gSdwTxWvzLwX1370j
	ngii/IZEwgWakWo645rtumSaqDS1XubtdL8+w1rT7Xz+/29G6wd47+21n3vrnKw=
X-Google-Smtp-Source: AGHT+IFF7UZbnKl3+wQb9W5FOXo2sWA/u52xRAvSHAyIN/89/MqgXnj2NWjofDEb78+kItH4lzx7Tw==
X-Received: by 2002:a17:906:3187:b0:a6f:1c81:e220 with SMTP id a640c23a62f3a-a6f60cf1dd6mr133571366b.13.1718350102791;
        Fri, 14 Jun 2024 00:28:22 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:22 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:57 +0200
Subject: [PATCH RESEND v5 14/16] arm64: defconfig: enable mt8365 sound
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-14-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
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
 h=from:subject:message-id; bh=cO45G3J6A2HCrNyifwgmbquTtW1hXtTIuXDjiQ9kiyk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D/bQ5cx0nOIhVEbANGr3El/UNuim3DeFvhVPKb
 JFG8LC6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/wAKCRArRkmdfjHURa3yEA
 CDE32G0UGXLh/zCKtDKPzFr8/qWc7jvkSuEWfcIKQwkkbJuN5PINlE3ttay+6s/8WyuhQ7yLjgYE+w
 ka/1r5I9VojODP5FQbafq/d2z1PgmEwlVM/DPZgJISbx95T2LXz70P1OAXy3qn1OFCURZz08Pc130t
 EZ0EUVTVD25KKj9sFO4yqZQkkCxontUtvWjKKT8IUqMvWVx2zcWiZBtPN0uDeuih+Klja88jWdyM9E
 ZEAAQdzwymlsVepAAeZCRAQlpq2DAqkKspALDJ82T/MEto3A/QEe7saTsVrIIVJHxT6kGx3xjOeiyQ
 Ez4T8CSIdgH7aWYe+Ae/PUq8VTHPBObS97Lc1wojdo6hkdRu4zMhAzu9gw6L2mbCkJXRwsOk8Rx2xK
 YiHPG7qzGlRsa+9p0J99BwttZkWUeIMPcQnl49bQKiucIPiaFo78hGeQe0DhXjYJiHwzBAqRshnL2T
 P/oJ1hck6i8j/oCoAdC6VM5yANe/18HHCq31zxuzKKk6IsMBHx5tG5wcOXpZR5pJZgCA6k8czo08oi
 QbY0Cu+y9bTgfKS5TVc5XgVi5VdsKwfb9VN35EIsw8TBvRicZmAWiWzEDN71DhjrWcPFoeEW3eMNyl
 vum3H/uX6pWwfl3EHe18p2uY0M2kYQcAkdAXOx8Dr5rD1dnDwb3/u87UCiDQ==
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
index 57a9abe78ee4..24b4d1a4992f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -950,6 +950,8 @@ CONFIG_SND_SOC_MT8192=m
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


