Return-Path: <linux-media+bounces-8921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D040689DB0F
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 15:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 857F2285C24
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 13:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138A013A884;
	Tue,  9 Apr 2024 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PCWFbI6r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5345413A24D
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 13:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712670154; cv=none; b=LnEsMasLxvgGhRDVY2CxKTsxmR1GxtFmDKnHzK2qNpNkSlRpq71awmMuGPbPKPMTg8wGuc//dZME9g7ctfoW/Gng9RlXkAzvOplkcGzfxUVZYNhlWdjagXGcr0sufWYHWhi571Kp9RDhEMAKAZEy7tOTSrVQR0AFd5+5zzcOgvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712670154; c=relaxed/simple;
	bh=Lr5R5c2GWQBqz7SCUnEVa3ivVYsrBqYFYNhsN9ZUZk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXUWDTmwnk+apO28lw9qyVue4/UnqHYVj7suULjZgJ17IZiKMwLXDpD1w1uBegMb2U39LdOGheNWwf+PmiRl2YsuXsSnpUNKslyQOUpe7jQ3tPFVVZeU18VtOVzgqvO3y92xqGAYbpbPoU/ST0huyxGZkju29UoFtzokt9p6kLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PCWFbI6r; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3455ff1339dso1960084f8f.0
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 06:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670150; x=1713274950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaOPptAkDAr7UZe0kfx5Sw+wAFzpeWgd0I8ED1nhO2M=;
        b=PCWFbI6r+uZdhNubyhQKNUQbfKSzQCBHBpl3ANKsAOTpfUN1KnROCPHTd/LTI2gCN9
         JwlOt0Ok9KNlsG1KZUAjw9K0yt5XQLPLshb9WQ//ybNM0kUEBiIMoicrtensGCYH7lUB
         oHZ21BNyuSeEv8vtLt3dP27hFUgZhy5az75Ealq3XGMlfEHWroyHdYtsRhTPBU5kwwEy
         Jk+Zd6bGZfJz7YXcI4FVGSdPl+P/vP2ue9KM09cOm4Rc+VDrZ84XmMmnf76fvP0XC7de
         be5MeyQtHgv1SXZZ5AVQRo+vgfUIuJWcPz8QVMI7gZyYscWKSOfAQMLCzdSmdFShclxV
         rbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670150; x=1713274950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaOPptAkDAr7UZe0kfx5Sw+wAFzpeWgd0I8ED1nhO2M=;
        b=ZiejIYnrL5Bh+GL/iqzSVAxi/mb4TAE5MGswiKQDfWbrQPl8Cvjnb9Nfkppyq1qH9P
         7a067mGs8tk3530j38hcGG/mvVIBMweKDyn8SYYZ7gOQhlS3Gvcd8Lrqo/glJf+f8WdI
         o+v3vFjeYspHJ+RzTJ6S5PiX+ZqUu66qN+K+a5oaRVg0COTL7vxUZLw23rYXeXNMsdVg
         qH4ke5oqcU6KQ9TTa9ByudfRkc36HjlH81GxVrqvf9OFyVOuPzCOls4KcHIv38dyN0pj
         Vk9hvlq8ayWAvaGJQbwJXFoJfQIqpdqhpfORRyEh/ZwE5kB2NoejGTIBaFoJyn4Pv3Ta
         Arag==
X-Forwarded-Encrypted: i=1; AJvYcCVFvUI0jZgTmX4Rd2pUbAw7K2RPV6QqVNGGHjmO2EnZWo28LC6mh5FkVnT8EhKAvcOqntn105UcTEQqrCEOfyNqVYlfsROosSqklo4=
X-Gm-Message-State: AOJu0Yx5zdkWqheXkyZrQrQ1G7BES9SIjr1+kS00IvFLQb93jdG6v696
	38ZdZFGAOMRcW7fhRHx/skrPHCscr8j6/SFkkusyiGoAMa8M9RvLnIIskLCQ+lQ=
X-Google-Smtp-Source: AGHT+IG1UinWwyCmZgHJ/Vc0k+gt3jtbv981K8oyrdY1dX5a/Ah/5TLTczdPwNeWy9tfDj3t3AnqQA==
X-Received: by 2002:a05:6000:104a:b0:33e:6ac9:f5b0 with SMTP id c10-20020a056000104a00b0033e6ac9f5b0mr9127301wrx.20.1712670149819;
        Tue, 09 Apr 2024 06:42:29 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:29 -0700 (PDT)
From: amergnat@baylibre.com
Date: Tue, 09 Apr 2024 15:42:09 +0200
Subject: [PATCH v3 11/18] ASoc: mediatek: mt8365: Add a specific soundcard
 for EVK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-11-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10412;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=StbcbcNjCboJVA2ZtaKY54PzLiOMhLbRuvUI8afProg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWsJ3Dxv/pDnhWZbpFHQ90U6AaL6GZGpBe0/so+
 INTtB72JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURbacD/
 40oVE5jnrIrRQSBR7Ud3qAm1HhRysjMHsxSzeL4Ifpbuz6yzrXptTpF/wRHc0bCXZKituseUOEA4qQ
 fAjmWvncvwzYhKJX26SMa+nHtcrFCki41IrW80NIK7TYjmLvCCsrb8v2TXWtQ67ChMCmlJbEaz/+1r
 PD9g7E7AEYNpxAOCODvGarQbwhQALf6PuPacZ9QAzv79FVTItiLCB7ysfm411X1fKFXaMrAvGau3iu
 dVzkKu0WLGaGflHUnKI4Sgdi6XqlyLS68DXALGcl4hdAiUfbubvdoErwUl4Rv9I37UWRsXLb8GBQgK
 HQjBuKuitfqCeH6aoqLTSPSJreVh8LpLn1Z+EN1s/qLLsbOknm889dYLUgJk0TDAizOThao1izB2fB
 dSNvNQj9ZRjrB6nMa4bpjFcE/vbaw/ztOU/Qt9MUjlBsNorxp0yBDNiwvhmGw7iNWatcwFfj1fuxqC
 J3rlpO3k9DIudy8yqyudfjpCmGJ7pp3Ff6OR0KePfVnDAmb8mX6oKZQUZcdfZCh5VWIn9G84hrmIQB
 BjVApl2/QVl5jD445bYLLK8TLyeRhX6DgHoqxKG5sR+oKfThdZSMeNuyLtRP4clBApw3OH0QPhOl96
 UW28GZSGQGRVe7gcW0u8NnMe66Hdo+/z3s6yT/MTMuE4z6h5kL30N68dKXHg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

From: Nicolas Belin <nbelin@baylibre.com>

Add a specific soundcard for mt8365-evk. It supports audio jack
in/out, dmics, the amic and lineout.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-mt6357.c | 348 ++++++++++++++++++++++++++++++
 1 file changed, 348 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
new file mode 100644
index 000000000000..9f1be194fe34
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -0,0 +1,348 @@
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
+		.name = "2ND_I2S_BE",
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
+	{
+		.compatible = "mediatek,mt8365-mt6357",
+		.data = &mt8365_mt6357_card,
+	},
+	{ }
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


