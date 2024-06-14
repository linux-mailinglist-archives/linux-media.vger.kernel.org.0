Return-Path: <linux-media+bounces-13238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF79F908501
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78BD92864EF
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 07:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E70187540;
	Fri, 14 Jun 2024 07:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="U/vnt+10"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FCC187349
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350100; cv=none; b=KJbB5EloGxUcJXR1xu33780FXmHjxYTF2cJtiaD1ioy40Jv883iX1QQ3m9K84NCGkbVKRHqBO9y+v5cc9NTwl9qRL6+ATjRQXa2Hzq5MPb7NXxMaM+2azbA6vsvEFXaY6m1Wut1pLKK9zt1i4t5Oi3gLEGv8WB4nP2IxMUBcQFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350100; c=relaxed/simple;
	bh=uQg7YbeE4b9qOdC4cl9gIC8ILiTIRXYuoiwfcvQhKng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LU2b6QV3I2sCegx60bC5YOKvxsAPNkYTcD565UUAWN3nHK6CHdjHmFWr3MoHp2fbljNkoSMNAsqldwr83+4BRA68RbkjNK6cf/QMZdjYZ/szGoyf3+kjOb6ZdHBUEMG22Y7RrbvN3IgQiYue5f12QKAzR0hpdP3k/ozlP6rtHtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=U/vnt+10; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4210aa012e5so18045065e9.0
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 00:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350096; x=1718954896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pA72Oy5vt3bPJlBtW/a0yLmz5+d+BB+/wZI6xgFjHFo=;
        b=U/vnt+10h/oi4scWKMTrglhYtrhEy6DrkYxZHH+zWMVXArqjMSwgiWMLpPwqwrK3Io
         zoSbqLpG78WAapPD9PvYwpcA8bmu6FtOw9V/P2d7B0hfGtcK0TT+J1GzUVZ7AORXpFr7
         0yrFrr9fN4qpvdUDk/1EplvFtYmJWI/TKaSZ3dEwvYNqA7M94OEN9XEwjhoBG4Cb3rrO
         2XjvMD/ugvNi3UyE1Dg6lVN/AGunPDkuKY/dAM8NVrStavbqMTdK1wtrAux2l60MIOfL
         NCFDw6iY2ZmPJcH7eHiwSbiPbjVADU7KXJru4LllPg7POVk6eaQbcdGhxHQqfm8iky0J
         54Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350096; x=1718954896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pA72Oy5vt3bPJlBtW/a0yLmz5+d+BB+/wZI6xgFjHFo=;
        b=S4IEjBt2VXgk3Z6WaEMs6I0fcsiaRlyEnF5Ja7InrY4Tqz0153gwrWTJdAL29kWxIY
         LF6C/Lg+OyBo7AMuYzTG2E96+9mH+DvflvtcpEacIw66et0G50j5/UlfEZmDxQ9ZMRhe
         NWFJ7PnrFQEnUehlpxCFklgxkNFtv+fc+PKVU0YV0dlupKf165rqsiGParl9LMNDkwhM
         mCs86flUef/khi05Fj4+7wR5KRtJKaBu0VopEBu1n6DPGQnfnpe+WgfPgRL7rzRiRlFz
         +W5duHUw+ygfW5PFiBQi4oDQ13v42Y6VYwFObd//wH2YAspe2momdvlf1mX3+YXIQDlK
         0p0g==
X-Forwarded-Encrypted: i=1; AJvYcCUdCCzPZ9Sy7CW5/mksUOpHVleqRdGMh87itgYXKeD+5tObQ231ihqTYYClMJlFtCDwAtuD/mf6Ec3z4U1RFj8MRExwVh23wtLcmck=
X-Gm-Message-State: AOJu0YwK+/JwBYkgfp7LDjGMUJvZ0cjm0d5jd5juToQOG4uAbNvodgHB
	zFipT3gDqoiCSS9a9XLeMHSccj39qLV2ADOn/if+/wUGHS1kkCvgs/6wnZ+AiQc=
X-Google-Smtp-Source: AGHT+IHSjQHWYYRxHGdBDdDe6uIe+wfzFBy54Oh33O7bSizWDeY1+vr00mBHr4bMrG1YTGDQ9s4Fdw==
X-Received: by 2002:a05:600c:1f90:b0:421:9502:3f24 with SMTP id 5b1f17b1804b1-423048264cdmr15884085e9.14.1718350096099;
        Fri, 14 Jun 2024 00:28:16 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:15 -0700 (PDT)
From: amergnat@baylibre.com
Date: Fri, 14 Jun 2024 09:27:53 +0200
Subject: [PATCH RESEND v5 10/16] ASoc: mediatek: mt8365: Add a specific
 soundcard for EVK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-10-54827318b453@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10498;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=Ax6GfCavYgrKiAIbNXdGwFigUIWnuWTg5FCmGpLSH0s=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D/BgGU3kPwIBe1iBZqZy+RuEBr8Z/p5xn3mmeX
 nU+FpMuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/wAKCRArRkmdfjHURU28D/
 9IMsn6Qfz9sL8s6BUHNuyY2jvyF19JGNAIZQmoFe1H4OAAO1JuNiTTbp01960le8uOFl5SLZGf2sY/
 Y4wAYuMAFAxcQytzDipc92sicY5yYw6+6gSVFZr7jzG6AG6Oc7uBFR0AwVkXD3HXaF1r3FDeSmKssW
 mWA+yKQ6cAD+pap2gLQeodK8AxU72KULnjgK5eBW7ZsNnkiNX2fnvSHc3810VOj2dF+WDXeRxY39fB
 ECrAZJpZsmQhvlKymAwfeQcVKVbzk0y/wyyZDlYSZNY7TLud7y8k35qQZrnPU8P5jc3fB7LJUx2qVE
 X+dW2BQHO1tGz9P9pa5Nz41/enMjufNFvCeCBcX5ZDSKEnTMHOzivNSgiPhjzf/g8wqYqXEhtgRJvk
 QVtDk1iEv5rVvZnpCtZqqJ1kM73+RH5QD34eNY7g+TOI/k0QB6aOQpjhhL+wvtZHoH4kN8nBPkMgU/
 Kqel1by2B2kYF/tAqYlPqfZdtFo8xeQiuZ272mpP+RjkF5TvLFBmthbkdVmPUHJLdTPU6Io/5pVPuY
 L9kWKbfzma/00YIUaAr4WOZpTgFNYYf7m/nmPKQAPMDGZ3TgSb3rgoPL76dIeVOADtcYSk7KTglp2R
 TTpxDGUPu6vRl0pPbeHc0/+Wiu+CFYB0YOmBvdT0C67ANkyRY5EOb2OsoHxA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

From: Nicolas Belin <nbelin@baylibre.com>

Add a specific soundcard for mt8365-evk. It supports audio jack
in/out, dmics, the amic and lineout.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-mt6357.c | 345 ++++++++++++++++++++++++++++++
 1 file changed, 345 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
new file mode 100644
index 000000000000..38f3392435b7
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek MT8365 Sound Card driver
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Nicolas Belin <nbelin@baylibre.com>
+ */
+
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <sound/soc.h>
+#include <sound/pcm_params.h>
+#include "mt8365-afe-common.h"
+#include <linux/pinctrl/consumer.h>
+#include "../common/mtk-soc-card.h"
+#include "../common/mtk-soundcard-driver.h"
+
+enum pinctrl_pin_state {
+	PIN_STATE_DEFAULT,
+	PIN_STATE_DMIC,
+	PIN_STATE_MISO_OFF,
+	PIN_STATE_MISO_ON,
+	PIN_STATE_MOSI_OFF,
+	PIN_STATE_MOSI_ON,
+	PIN_STATE_MAX
+};
+
+static const char * const mt8365_mt6357_pin_str[PIN_STATE_MAX] = {
+	"default",
+	"dmic",
+	"miso_off",
+	"miso_on",
+	"mosi_off",
+	"mosi_on",
+};
+
+struct mt8365_mt6357_priv {
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pin_states[PIN_STATE_MAX];
+};
+
+enum {
+	/* FE */
+	DAI_LINK_DL1_PLAYBACK = 0,
+	DAI_LINK_DL2_PLAYBACK,
+	DAI_LINK_AWB_CAPTURE,
+	DAI_LINK_VUL_CAPTURE,
+	/* BE */
+	DAI_LINK_2ND_I2S_INTF,
+	DAI_LINK_DMIC,
+	DAI_LINK_INT_ADDA,
+	DAI_LINK_NUM
+};
+
+static const struct snd_soc_dapm_widget mt8365_mt6357_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("HDMI Out"),
+};
+
+static const struct snd_soc_dapm_route mt8365_mt6357_routes[] = {
+	{"HDMI Out", NULL, "2ND I2S Playback"},
+	{"DMIC In", NULL, "MICBIAS0"},
+};
+
+static int mt8365_mt6357_int_adda_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	int ret = 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MOSI_ON]))
+			return ret;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_MOSI_ON]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MISO_ON]))
+			return ret;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_MISO_ON]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+
+	return 0;
+}
+
+static void mt8365_mt6357_int_adda_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	int ret = 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MOSI_OFF]))
+			return;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_MOSI_OFF]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MISO_OFF]))
+			return;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_MISO_OFF]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+}
+
+static const struct snd_soc_ops mt8365_mt6357_int_adda_ops = {
+	.startup = mt8365_mt6357_int_adda_startup,
+	.shutdown = mt8365_mt6357_int_adda_shutdown,
+};
+
+SND_SOC_DAILINK_DEFS(playback1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(playback2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(awb_capture,
+		     DAILINK_COMP_ARRAY(COMP_CPU("AWB")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(vul,
+		     DAILINK_COMP_ARRAY(COMP_CPU("VUL")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("2ND I2S")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(dmic,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DMIC")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(primary_codec,
+		     DAILINK_COMP_ARRAY(COMP_CPU("INT ADDA")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6357-sound", "mt6357-snd-codec-aif1")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+/* Digital audio interface glue - connects codec <---> CPU */
+static struct snd_soc_dai_link mt8365_mt6357_dais[] = {
+	/* Front End DAI links */
+	[DAI_LINK_DL1_PLAYBACK] = {
+		.name = "DL1_FE",
+		.stream_name = "MultiMedia1_PLayback",
+		.id = DAI_LINK_DL1_PLAYBACK,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(playback1),
+	},
+	[DAI_LINK_DL2_PLAYBACK] = {
+		.name = "DL2_FE",
+		.stream_name = "MultiMedia2_PLayback",
+		.id = DAI_LINK_DL2_PLAYBACK,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(playback2),
+	},
+	[DAI_LINK_AWB_CAPTURE] = {
+		.name = "AWB_FE",
+		.stream_name = "DL1_AWB_Record",
+		.id = DAI_LINK_AWB_CAPTURE,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(awb_capture),
+	},
+	[DAI_LINK_VUL_CAPTURE] = {
+		.name = "VUL_FE",
+		.stream_name = "MultiMedia1_Capture",
+		.id = DAI_LINK_VUL_CAPTURE,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(vul),
+	},
+	/* Back End DAI links */
+	[DAI_LINK_2ND_I2S_INTF] = {
+		.name = "I2S_OUT_BE",
+		.no_pcm = 1,
+		.id = DAI_LINK_2ND_I2S_INTF,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+				SND_SOC_DAIFMT_NB_NF |
+				SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(i2s3),
+	},
+	[DAI_LINK_DMIC] = {
+		.name = "DMIC_BE",
+		.no_pcm = 1,
+		.id = DAI_LINK_DMIC,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(dmic),
+	},
+	[DAI_LINK_INT_ADDA] = {
+		.name = "MTK_Codec",
+		.no_pcm = 1,
+		.id = DAI_LINK_INT_ADDA,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8365_mt6357_int_adda_ops,
+		SND_SOC_DAILINK_REG(primary_codec),
+	},
+};
+
+static int mt8365_mt6357_gpio_probe(struct snd_soc_card *card)
+{
+	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(card);
+	int ret, i;
+
+	priv->pinctrl = devm_pinctrl_get(card->dev);
+	if (IS_ERR(priv->pinctrl)) {
+		ret = PTR_ERR(priv->pinctrl);
+		return dev_err_probe(card->dev, ret,
+				     "Failed to get pinctrl\n");
+	}
+
+	for (i = PIN_STATE_DEFAULT ; i < PIN_STATE_MAX ; i++) {
+		priv->pin_states[i] = pinctrl_lookup_state(priv->pinctrl,
+							   mt8365_mt6357_pin_str[i]);
+		if (IS_ERR(priv->pin_states[i])) {
+			ret = PTR_ERR(priv->pin_states[i]);
+			dev_warn(card->dev, "No pin state for %s\n",
+				 mt8365_mt6357_pin_str[i]);
+		} else {
+			ret = pinctrl_select_state(priv->pinctrl,
+						   priv->pin_states[i]);
+			if (ret) {
+				dev_err_probe(card->dev, ret,
+					      "Failed to select pin state %s\n",
+					      mt8365_mt6357_pin_str[i]);
+				return ret;
+			}
+		}
+	}
+	return 0;
+}
+
+static struct snd_soc_card mt8365_mt6357_soc_card = {
+	.name = "mt8365-evk",
+	.owner = THIS_MODULE,
+	.dai_link = mt8365_mt6357_dais,
+	.num_links = ARRAY_SIZE(mt8365_mt6357_dais),
+	.dapm_widgets = mt8365_mt6357_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8365_mt6357_widgets),
+	.dapm_routes = mt8365_mt6357_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8365_mt6357_routes),
+};
+
+static int mt8365_mt6357_dev_probe(struct mtk_soc_card_data *soc_card_data, bool legacy)
+{
+	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
+	struct snd_soc_card *card = card_data->card;
+	struct device *dev = card->dev;
+	struct device_node *platform_node;
+	struct mt8365_mt6357_priv *mach_priv;
+	int i, ret;
+
+	card->dev = dev;
+	ret = parse_dai_link_info(card);
+	if (ret)
+		goto err;
+
+	mach_priv = devm_kzalloc(dev, sizeof(*mach_priv),
+				 GFP_KERNEL);
+	if (!mach_priv)
+		return -ENOMEM;
+	soc_card_data->mach_priv = mach_priv;
+	snd_soc_card_set_drvdata(card, soc_card_data);
+	mt8365_mt6357_gpio_probe(card);
+	return 0;
+
+err:
+	clean_card_reference(card);
+	return ret;
+}
+
+static const struct mtk_soundcard_pdata mt8365_mt6357_card = {
+	.card_name = "mt8365-mt6357",
+	.card_data = &(struct mtk_platform_card_data) {
+		.card = &mt8365_mt6357_soc_card,
+	},
+	.soc_probe = mt8365_mt6357_dev_probe
+};
+
+static const struct of_device_id mt8365_mt6357_dt_match[] = {
+	{ .compatible = "mediatek,mt8365-mt6357", .data = &mt8365_mt6357_card },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mt8365_mt6357_dt_match);
+
+static struct platform_driver mt8365_mt6357_driver = {
+	.driver = {
+		   .name = "mt8365_mt6357",
+		   .of_match_table = mt8365_mt6357_dt_match,
+		   .pm = &snd_soc_pm_ops,
+	},
+	.probe = mtk_soundcard_common_probe,
+};
+
+module_platform_driver(mt8365_mt6357_driver);
+
+/* Module information */
+MODULE_DESCRIPTION("MT8365 EVK SoC machine driver");
+MODULE_AUTHOR("Nicolas Belin <nbelin@baylibre.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform: mt8365_mt6357");

-- 
2.25.1


