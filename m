Return-Path: <linux-media+bounces-8889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9424789D697
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 12:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B71001C216E3
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 10:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C9012EBD4;
	Tue,  9 Apr 2024 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HM565O75"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D24012A142
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 10:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712657637; cv=none; b=ZTXkw6DKIuIzM0cB84GQQY7tvRPFNB8Q+saIaU/pA35RufK8L83jeqOdnlbxMXGpqBGb+xxWp4oRpJ7aYUJmMBIB0+aNafj0cxiH6SY3Ho7v7e4FdVh/DO2SP4R93vGYAh1JuqUF02fI6624JAckJLCqdw0wRnRdYk9oh4ABjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712657637; c=relaxed/simple;
	bh=rupMHCo4ov9trVUAGySMN2xWWd+DYicdRaX3eev6dnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EWUqsiub25DdqpQ2PqxOC7ok8JHV+s4cD6J8a11XSmY5eWR/x/DwcRdTrsr0lbebgsA+FHT9eq4OQQdCk9LyVcVPZbwV62Sf8G0C94iVtLvbpHsWrTHPJkHWWFFu4K2AhbC72RTiykfbHscpVHR+b/PfiRFUDnTYzooK8Ww8Ur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HM565O75; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-415515178ceso35237965e9.0
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 03:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657633; x=1713262433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTSY1ko++/wb2lPvySWoKOwaimob916R/fGD0IssuIQ=;
        b=HM565O75lb7Mu+o61MUdXSjWOJJwBR57VUo4Dw785xdwVUbxVHS0EL3MdkO8WnzMle
         2QJVg7MjaGastocRjsPQx/k1HZjmQlrfVfusHGR5dnGERd7tyiZGpnSUc5H5mzogMr9f
         BZMTzt0QmJSfOTXkRgVHnGniISFhcvrZ0aW+b5DGTJ7yDB1TwopULSXlUFy5/IhJJQWK
         fXg5iisvUdxyR6aj4wq0yqF2+SsfFGB57dmznNST46Erm/n3nAWXtDGvS+eZJZg4JNC5
         rGHydgSlHeJKs8zjXI6wpMLOGbTJM0j/NGgjarDEKoPtW4ahwWX/ZitOCvRtggmYhjUq
         L7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657633; x=1713262433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTSY1ko++/wb2lPvySWoKOwaimob916R/fGD0IssuIQ=;
        b=sgBfz6Rhvlr80c8f2FmSkwasyIWfC1/jNb9RvAd1LjcK8TDj3ilrIuz3AYe+Nw7kNE
         5BD+AW6IUnIQxWulMyFT3A5m/dbW9EEaV4mAVQezQNZzS+9tgpDiBsrJvUan2TGLXRfu
         9VEy39Q2FX0/7CEIH0nASndRMQzSCAr5OGPh81+TuYTyF5U8VRKQz6A3//Dp5bRe5L26
         xF0vwGFIc41SwndlztKuqn6hx+tuycRrZ9vxqRVaEo5z2RtgCbH9WvO0+jAyrto0iCIy
         Ae7Uaj7XtZmCrVEgtNrk3oPq1x/mDmCJCUiPG69APCHS5nVsAASEAAKMNthvuu/UQc4w
         XYXA==
X-Forwarded-Encrypted: i=1; AJvYcCXshxvUhQuzb+r6neDQf7qYhTre3Zxp9rMu8MlTLVwRy7FpKa/WKhe2OzVeI4ZJRbT0H27GIoybLyi0ZzDVhUd2NG1Vk8UVSbt77ZY=
X-Gm-Message-State: AOJu0Yx2Lf655nwf6JYLqqk1bNnDoHCyYJI6Uxto7c831JdMe6AXTVGC
	PiHWtsw0XGZTlmbWiXsBo70d8zDFXoV1iqj5x1tYjoHZzQ8p1vcQYUMHxBxy4Hs=
X-Google-Smtp-Source: AGHT+IGVHnFlNmZ+NQuKM5GrvlSOGax7ZhuhXdIUfYw5WJYn6gn76YeEZkijgXoCoPEE000e1cUbdg==
X-Received: by 2002:a05:600c:1ca1:b0:416:a8a7:9503 with SMTP id k33-20020a05600c1ca100b00416a8a79503mr955108wms.3.1712657633524;
        Tue, 09 Apr 2024 03:13:53 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:13:53 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:29 +0200
Subject: [PATCH v2 08/18] ASoC: mediatek: mt8365: Add ADDA DAI support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-8-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
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
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10092;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=rupMHCo4ov9trVUAGySMN2xWWd+DYicdRaX3eev6dnk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTeioKrZqF2rfIiDT5cxCbWCmC6FRs46yakKR8
 zK4ZA+yJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURQqKD/
 9kJ5/RIPI5Q+4oxd53QSDIjxvhsdtjYujZhG4jNAWrTbgwLuBJejnUs8JKPew/cJUg5G8idPJY1D1u
 wrDLhDBjWbQH5Io1nF+FA+0dD1jiju4Vr1xzpAlcJtGKCIE9oiXAtrRnEXC3dT5nLCGwnZhLdW8xGP
 Ve1Nj6QnpST6QwAkPw9ejbdigr1xSOM95T/rJnqKVcsdTYFeLC1G93RBGk16UB6czC0AkpCzHW51YS
 /oTMeG+TQVp4Aclb6iBMf2XjC1XLBfFCgaZyDuTF+CR5x8ZDh9cRVY6eGkx3a3DeevHim2VMVR8rmy
 kuBBhdUKspodUa5ruELA1Uf8MO4mKe9e6MZFeyZ4S57xb2zDk3hNdVun9dWr3fjiYkPsylp9xCtr+K
 7BjfmTZZMzZnnqHQ9frfp9Url2a79+nqYL3jcVcHZ8C39sRIbJAHt+JP5N+v19b/cbn7QvE8GnTry5
 jK/9AtctPQi25ja4JHc+dMcBUPww0+iFJokIW9eoQowKjHvL4/QrQJMntS3FX02Jy6PJgdILjIs0i7
 JS3CvM0W1fj0wq3/zBFIN0e8f81oYELc/UT7JSJJckXcyleZ1tMkkeMNwbhQ9yo/7/bdPiwGqsPIt7
 twjZAqM4krRJ69uXSyHWE+Z42wbgU1SojKPWjdxb9cDv6SI+dkt9VYHeD2Bg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add ADDA Device Audio Interface support for MT8365 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c | 315 ++++++++++++++++++++++++++++
 1 file changed, 315 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-adda.c b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
new file mode 100644
index 000000000000..65d45010ac90
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek 8365 ALSA SoC Audio DAI ADDA Control
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Jia Zeng <jia.zeng@mediatek.com>
+ *          Alexandre Mergnat <amergnat@baylibre.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include "mt8365-afe-clk.h"
+#include "mt8365-afe-common.h"
+#include "../common/mtk-dai-adda-common.h"
+
+static int adda_afe_on_ref_cnt;
+
+/* DAI Drivers */
+
+static int mt8365_dai_set_adda_out(struct mtk_base_afe *afe, unsigned int rate)
+{
+	unsigned int val;
+
+	switch (rate) {
+	case 8000:
+		val = AFE_ADDA_DL_VOICE_DATA;
+		break;
+	case 16000:
+		val = AFE_ADDA_DL_VOICE_DATA;
+		break;
+	default:
+		val = 0;
+	}
+
+	val |= FIELD_PREP(AFE_ADDA_DL_SAMPLING_RATE,
+		mtk_adda_dl_rate_transform(afe, rate));
+	val |= AFE_ADDA_DL_8X_UPSAMPLE |
+	       AFE_ADDA_DL_MUTE_OFF_CH1 |
+	       AFE_ADDA_DL_MUTE_OFF_CH2 |
+	       AFE_ADDA_DL_DEGRADE_GAIN;
+
+	regmap_update_bits(afe->regmap, AFE_ADDA_PREDIS_CON0, 0xffffffff, 0);
+	regmap_update_bits(afe->regmap, AFE_ADDA_PREDIS_CON1, 0xffffffff, 0);
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SRC2_CON0, 0xffffffff, val);
+	/* SA suggest apply -0.3db to audio/speech path */
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SRC2_CON1,
+			   0xffffffff, 0xf74f0000);
+	/* SA suggest use default value for sdm */
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SDM_DCCOMP_CON,
+			   0xffffffff, 0x0700701e);
+
+	return 0;
+}
+
+static int mt8365_dai_set_adda_in(struct mtk_base_afe *afe, unsigned int rate)
+{
+	unsigned int val;
+
+	val = FIELD_PREP(AFE_ADDA_UL_SAMPLING_RATE,
+			 mtk_adda_ul_rate_transform(afe, rate));
+	regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0,
+			   AFE_ADDA_UL_SAMPLING_RATE, val);
+	/* Using Internal ADC */
+	regmap_update_bits(afe->regmap, AFE_ADDA_TOP_CON0, 0x1, 0x0);
+
+	return 0;
+}
+
+int mt8365_dai_enable_adda_on(struct mtk_base_afe *afe)
+{
+	unsigned long flags;
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	adda_afe_on_ref_cnt++;
+	if (adda_afe_on_ref_cnt == 1)
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
+				   AFE_ADDA_UL_DL_ADDA_AFE_ON,
+				   AFE_ADDA_UL_DL_ADDA_AFE_ON);
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe)
+{
+	unsigned long flags;
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	adda_afe_on_ref_cnt--;
+	if (adda_afe_on_ref_cnt == 0)
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
+				   AFE_ADDA_UL_DL_ADDA_AFE_ON,
+				   ~AFE_ADDA_UL_DL_ADDA_AFE_ON);
+	else if (adda_afe_on_ref_cnt < 0)
+		adda_afe_on_ref_cnt = 0;
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+static void mt8365_dai_set_adda_out_enable(struct mtk_base_afe *afe,
+					   bool enable)
+{
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SRC2_CON0, 0x1, enable);
+
+	if (enable)
+		mt8365_dai_enable_adda_on(afe);
+	else
+		mt8365_dai_disable_adda_on(afe);
+}
+
+static void mt8365_dai_set_adda_in_enable(struct mtk_base_afe *afe, bool enable)
+{
+	if (enable) {
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0, 0x1, 0x1);
+		mt8365_dai_enable_adda_on(afe);
+		/* enable aud_pad_top fifo */
+		regmap_update_bits(afe->regmap, AFE_AUD_PAD_TOP,
+				   0xffffffff, 0x31);
+	} else {
+		/* disable aud_pad_top fifo */
+		regmap_update_bits(afe->regmap, AFE_AUD_PAD_TOP,
+				   0xffffffff, 0x30);
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0, 0x1, 0x0);
+		/* de suggest disable ADDA_UL_SRC at least wait 125us */
+		usleep_range(150, 300);
+		mt8365_dai_disable_adda_on(afe);
+	}
+}
+
+static int mt8365_dai_int_adda_startup(struct snd_pcm_substream *substream,
+				       struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	unsigned int stream = substream->stream;
+
+	mt8365_afe_enable_main_clk(afe);
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DAC);
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DAC_PREDIS);
+	} else if (stream == SNDRV_PCM_STREAM_CAPTURE) {
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_ADC);
+	}
+
+	return 0;
+}
+
+static void mt8365_dai_int_adda_shutdown(struct snd_pcm_substream *substream,
+					 struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_be_dai_data *be =
+		&afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
+	unsigned int stream = substream->stream;
+
+	if (be->prepared[stream]) {
+		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			mt8365_dai_set_adda_out_enable(afe, false);
+			mt8365_afe_set_i2s_out_enable(afe, false);
+		} else {
+			mt8365_dai_set_adda_in_enable(afe, false);
+		}
+		be->prepared[stream] = false;
+	}
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DAC_PREDIS);
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DAC);
+	} else if (stream == SNDRV_PCM_STREAM_CAPTURE) {
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_ADC);
+	}
+
+	mt8365_afe_disable_main_clk(afe);
+}
+
+static int mt8365_dai_int_adda_prepare(struct snd_pcm_substream *substream,
+				       struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_be_dai_data *be =
+		&afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
+	unsigned int rate = substream->runtime->rate;
+	int bit_width = snd_pcm_format_width(substream->runtime->format);
+	int ret;
+
+	dev_info(afe->dev, "%s '%s' rate = %u\n", __func__,
+		 snd_pcm_stream_str(substream), rate);
+
+	if (be->prepared[substream->stream]) {
+		dev_info(afe->dev, "%s '%s' prepared already\n",
+			 __func__, snd_pcm_stream_str(substream));
+		return 0;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = mt8365_dai_set_adda_out(afe, rate);
+		if (ret)
+			return ret;
+
+		ret = mt8365_afe_set_i2s_out(afe, rate, bit_width);
+		if (ret)
+			return ret;
+
+		mt8365_dai_set_adda_out_enable(afe, true);
+		mt8365_afe_set_i2s_out_enable(afe, true);
+	} else {
+		ret = mt8365_dai_set_adda_in(afe, rate);
+		if (ret)
+			return ret;
+
+		mt8365_dai_set_adda_in_enable(afe, true);
+	}
+	be->prepared[substream->stream] = true;
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mt8365_afe_int_adda_ops = {
+	.startup	= mt8365_dai_int_adda_startup,
+	.shutdown	= mt8365_dai_int_adda_shutdown,
+	.prepare	= mt8365_dai_int_adda_prepare,
+};
+
+static struct snd_soc_dai_driver mtk_dai_adda_driver[] = {
+	{
+		.name = "INT ADDA",
+		.id = MT8365_AFE_IO_INT_ADDA,
+		.playback = {
+			.stream_name = "INT ADDA Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.capture = {
+			.stream_name = "INT ADDA Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_32000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.ops = &mt8365_afe_int_adda_ops,
+	}
+};
+
+/* DAI Controls */
+
+static const struct snd_kcontrol_new mtk_adda_dl_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH1 Switch", AFE_CONN3,
+				    10, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_adda_dl_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH2 Switch", AFE_CONN4,
+				    11, 1, 0),
+};
+
+static const struct snd_kcontrol_new int_adda_o03_o04_enable_ctl =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+
+/* DAI widget */
+
+static const struct snd_soc_dapm_widget mtk_dai_adda_widgets[] = {
+	SND_SOC_DAPM_SWITCH("INT ADDA O03_O04", SND_SOC_NOPM, 0, 0,
+			    &int_adda_o03_o04_enable_ctl),
+	/* inter-connections */
+	SND_SOC_DAPM_MIXER("ADDA_DL_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_adda_dl_ch1_mix,
+			   ARRAY_SIZE(mtk_adda_dl_ch1_mix)),
+	SND_SOC_DAPM_MIXER("ADDA_DL_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_adda_dl_ch2_mix,
+			   ARRAY_SIZE(mtk_adda_dl_ch2_mix)),
+};
+
+/* DAI route */
+
+static const struct snd_soc_dapm_route mtk_dai_adda_routes[] = {
+	{"INT ADDA O03_O04", "Switch", "O03"},
+	{"INT ADDA O03_O04", "Switch", "O04"},
+	{"INT ADDA Playback", NULL, "INT ADDA O03_O04"},
+	{"INT ADDA Playback", NULL, "ADDA_DL_CH1"},
+	{"INT ADDA Playback", NULL, "ADDA_DL_CH2"},
+	{"AIN Mux", "INT ADC", "INT ADDA Capture"},
+	{"ADDA_DL_CH1", "GAIN1_OUT_CH1", "Hostless FM DL"},
+	{"ADDA_DL_CH2", "GAIN1_OUT_CH2", "Hostless FM DL"},
+};
+
+int mt8365_dai_adda_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+	list_add(&dai->list, &afe->sub_dais);
+	dai->dai_drivers = mtk_dai_adda_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_adda_driver);
+	dai->dapm_widgets = mtk_dai_adda_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_adda_widgets);
+	dai->dapm_routes = mtk_dai_adda_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_adda_routes);
+	return 0;
+}

-- 
2.25.1


