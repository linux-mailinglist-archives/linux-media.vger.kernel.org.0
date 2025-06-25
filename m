Return-Path: <linux-media+bounces-35869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B8AE84E3
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 15:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5402A1890E26
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 13:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54A82641EE;
	Wed, 25 Jun 2025 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="sHCgC1SH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48F7263F40;
	Wed, 25 Jun 2025 13:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858428; cv=none; b=vGorUgN0YO5W+HhoEGT9zJI1ImB+hYz5P5oELhsv2A5XA6rY31qmkmVWgWxqZkBG2QgmvPdnrDbzjn2Sx/XnDuywEWemX74iCjcDluzvJ7j76/5R/R9UJg0dHKLX6iXO9txRaIoKNBJCyJgABXF4/0Yr3O1swsC0534arIpypCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858428; c=relaxed/simple;
	bh=3J1JIo1jTPjeIOvEE8t5RI90gWubN0eok4h+IXepZqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKLW8ky5dFH50zrZll5wefmiNjxXPPCWQfs2vX0mYDEMUIXFjEhomZ12jkSodXVO6XDUhfIm/rNDZQVoqxLp3TIACHlWk85Nhdq76guVzt/nDOPt1y2AmsZOoM8vyoj0N4C8DNlSbqb7xN0DdOLyxWa1eFRx/qpHG2gF53uxXwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=sHCgC1SH; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=zHLBQp9c3phSjjriwnIQ9WfwFCetptzAuvhLYaTqXe8=; b=sHCgC1SHYFrvNaAX
	3tDKvk5kDABXF30APg7rYv3Ch/aSPPciahm4ZVhRci2RMvHMUei6C2dNviSHjacEyQhp5z+fYi8Ut
	emcZPFg8/+PFPjYlwjfEPmEPe2qe8EoNyzv/Tn/1TxcCxe5cDN9U5UDDnlxvF8mIYvE2q2Puu6ujS
	V6J8eBkVmT28KjZ+3N9ewEMUbfyVFoHw+/UsJJt1C99EdnUxF2e3N5LrhHc8GwDogD9l6lkoP+MlP
	kfjgNkQ8Yvl1TFmnSDumLTF+7UqQoFkeM+CyHfhGlo5oXmVb7WBziuZICTlQ095nBMUCEMJOiWI+H
	gt33AvmwngosozchCw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uUQFs-00Bvly-0J;
	Wed, 25 Jun 2025 13:33:36 +0000
From: linux@treblig.org
To: arnd@arndb.de,
	lee@kernel.org,
	mchehab@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/4] ASoC: wl1273: Remove
Date: Wed, 25 Jun 2025 14:32:56 +0100
Message-ID: <20250625133258.78133-3-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625133258.78133-1-linux@treblig.org>
References: <20250625133258.78133-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The wl1273 FM radio is on Arnd's unused driver list:
  https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
Remove the codec component.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/soc/codecs/Kconfig  |   4 -
 sound/soc/codecs/Makefile |   4 +-
 sound/soc/codecs/wl1273.c | 500 --------------------------------------
 sound/soc/codecs/wl1273.h |  16 --
 4 files changed, 1 insertion(+), 523 deletions(-)
 delete mode 100644 sound/soc/codecs/wl1273.c
 delete mode 100644 sound/soc/codecs/wl1273.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 126f897312d4..0dbcda013a9d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -302,7 +302,6 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_LPASS_MACRO_COMMON
 	imply SND_SOC_LPASS_RX_MACRO
 	imply SND_SOC_LPASS_TX_MACRO
-	imply SND_SOC_WL1273
 	imply SND_SOC_WM0010
 	imply SND_SOC_WM1250_EV1
 	imply SND_SOC_WM2000
@@ -2310,9 +2309,6 @@ config SND_SOC_WCD939X_SDW
 	  The WCD9390/9395 is a audio codec IC Integrated in
 	  Qualcomm SoCs like SM8650.
 
-config SND_SOC_WL1273
-	tristate
-
 config SND_SOC_WM0010
 	tristate
 	depends on SPI_MASTER
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 6d7aa109ede7..8ba43f224d47 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -347,7 +347,6 @@ snd-soc-wcd938x-y := wcd938x.o
 snd-soc-wcd938x-sdw-y := wcd938x-sdw.o
 snd-soc-wcd939x-y := wcd939x.o
 snd-soc-wcd939x-sdw-y := wcd939x-sdw.o
-snd-soc-wl1273-y := wl1273.o
 snd-soc-wm-adsp-y := wm_adsp.o
 snd-soc-wm0010-y := wm0010.o
 snd-soc-wm1250-ev1-y := wm1250-ev1.o
@@ -777,7 +776,6 @@ ifdef CONFIG_SND_SOC_WCD939X_SDW
 # avoid link failure by forcing sdw code built-in when needed
 obj-$(CONFIG_SND_SOC_WCD939X) += snd-soc-wcd939x-sdw.o
 endif
-obj-$(CONFIG_SND_SOC_WL1273)	+= snd-soc-wl1273.o
 obj-$(CONFIG_SND_SOC_WM0010)	+= snd-soc-wm0010.o
 obj-$(CONFIG_SND_SOC_WM1250_EV1) += snd-soc-wm1250-ev1.o
 obj-$(CONFIG_SND_SOC_WM2000)	+= snd-soc-wm2000.o
@@ -853,4 +851,4 @@ obj-$(CONFIG_SND_SOC_LPASS_RX_MACRO)	+= snd-soc-lpass-rx-macro.o
 obj-$(CONFIG_SND_SOC_LPASS_TX_MACRO)	+= snd-soc-lpass-tx-macro.o
 
 # Mux
-obj-$(CONFIG_SND_SOC_SIMPLE_MUX)	+= snd-soc-simple-mux.o
\ No newline at end of file
+obj-$(CONFIG_SND_SOC_SIMPLE_MUX)	+= snd-soc-simple-mux.o
diff --git a/sound/soc/codecs/wl1273.c b/sound/soc/codecs/wl1273.c
deleted file mode 100644
index 737ca82cf976..000000000000
--- a/sound/soc/codecs/wl1273.c
+++ /dev/null
@@ -1,500 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * ALSA SoC WL1273 codec driver
- *
- * Author:      Matti Aaltonen, <matti.j.aaltonen@nokia.com>
- *
- * Copyright:   (C) 2010, 2011 Nokia Corporation
- */
-
-#include <linux/mfd/wl1273-core.h>
-#include <linux/slab.h>
-#include <linux/module.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-#include <sound/initval.h>
-
-#include "wl1273.h"
-
-enum wl1273_mode { WL1273_MODE_BT, WL1273_MODE_FM_RX, WL1273_MODE_FM_TX };
-
-/* codec private data */
-struct wl1273_priv {
-	enum wl1273_mode mode;
-	struct wl1273_core *core;
-	unsigned int channels;
-};
-
-static int snd_wl1273_fm_set_i2s_mode(struct wl1273_core *core,
-				      int rate, int width)
-{
-	struct device *dev = &core->client->dev;
-	int r = 0;
-	u16 mode;
-
-	dev_dbg(dev, "rate: %d\n", rate);
-	dev_dbg(dev, "width: %d\n", width);
-
-	mutex_lock(&core->lock);
-
-	mode = core->i2s_mode & ~WL1273_IS2_WIDTH & ~WL1273_IS2_RATE;
-
-	switch (rate) {
-	case 48000:
-		mode |= WL1273_IS2_RATE_48K;
-		break;
-	case 44100:
-		mode |= WL1273_IS2_RATE_44_1K;
-		break;
-	case 32000:
-		mode |= WL1273_IS2_RATE_32K;
-		break;
-	case 22050:
-		mode |= WL1273_IS2_RATE_22_05K;
-		break;
-	case 16000:
-		mode |= WL1273_IS2_RATE_16K;
-		break;
-	case 12000:
-		mode |= WL1273_IS2_RATE_12K;
-		break;
-	case 11025:
-		mode |= WL1273_IS2_RATE_11_025;
-		break;
-	case 8000:
-		mode |= WL1273_IS2_RATE_8K;
-		break;
-	default:
-		dev_err(dev, "Sampling rate: %d not supported\n", rate);
-		r = -EINVAL;
-		goto out;
-	}
-
-	switch (width) {
-	case 16:
-		mode |= WL1273_IS2_WIDTH_32;
-		break;
-	case 20:
-		mode |= WL1273_IS2_WIDTH_40;
-		break;
-	case 24:
-		mode |= WL1273_IS2_WIDTH_48;
-		break;
-	case 25:
-		mode |= WL1273_IS2_WIDTH_50;
-		break;
-	case 30:
-		mode |= WL1273_IS2_WIDTH_60;
-		break;
-	case 32:
-		mode |= WL1273_IS2_WIDTH_64;
-		break;
-	case 40:
-		mode |= WL1273_IS2_WIDTH_80;
-		break;
-	case 48:
-		mode |= WL1273_IS2_WIDTH_96;
-		break;
-	case 64:
-		mode |= WL1273_IS2_WIDTH_128;
-		break;
-	default:
-		dev_err(dev, "Data width: %d not supported\n", width);
-		r = -EINVAL;
-		goto out;
-	}
-
-	dev_dbg(dev, "WL1273_I2S_DEF_MODE: 0x%04x\n",  WL1273_I2S_DEF_MODE);
-	dev_dbg(dev, "core->i2s_mode: 0x%04x\n", core->i2s_mode);
-	dev_dbg(dev, "mode: 0x%04x\n", mode);
-
-	if (core->i2s_mode != mode) {
-		r = core->write(core, WL1273_I2S_MODE_CONFIG_SET, mode);
-		if (r)
-			goto out;
-
-		core->i2s_mode = mode;
-		r = core->write(core, WL1273_AUDIO_ENABLE,
-				WL1273_AUDIO_ENABLE_I2S);
-		if (r)
-			goto out;
-	}
-out:
-	mutex_unlock(&core->lock);
-
-	return r;
-}
-
-static int snd_wl1273_fm_set_channel_number(struct wl1273_core *core,
-					    int channel_number)
-{
-	struct device *dev = &core->client->dev;
-	int r = 0;
-
-	dev_dbg(dev, "%s\n", __func__);
-
-	mutex_lock(&core->lock);
-
-	if (core->channel_number == channel_number)
-		goto out;
-
-	if (channel_number == 1 && core->mode == WL1273_MODE_RX)
-		r = core->write(core, WL1273_MOST_MODE_SET, WL1273_RX_MONO);
-	else if (channel_number == 1 && core->mode == WL1273_MODE_TX)
-		r = core->write(core, WL1273_MONO_SET, WL1273_TX_MONO);
-	else if (channel_number == 2 && core->mode == WL1273_MODE_RX)
-		r = core->write(core, WL1273_MOST_MODE_SET, WL1273_RX_STEREO);
-	else if (channel_number == 2 && core->mode == WL1273_MODE_TX)
-		r = core->write(core, WL1273_MONO_SET, WL1273_TX_STEREO);
-	else
-		r = -EINVAL;
-out:
-	mutex_unlock(&core->lock);
-
-	return r;
-}
-
-static int snd_wl1273_get_audio_route(struct snd_kcontrol *kcontrol,
-				      struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
-	struct wl1273_priv *wl1273 = snd_soc_component_get_drvdata(component);
-
-	ucontrol->value.enumerated.item[0] = wl1273->mode;
-
-	return 0;
-}
-
-/*
- * TODO: Implement the audio routing in the driver. Now this control
- * only indicates the setting that has been done elsewhere (in the user
- * space).
- */
-static const char * const wl1273_audio_route[] = { "Bt", "FmRx", "FmTx" };
-
-static int snd_wl1273_set_audio_route(struct snd_kcontrol *kcontrol,
-				      struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
-	struct wl1273_priv *wl1273 = snd_soc_component_get_drvdata(component);
-
-	if (wl1273->mode == ucontrol->value.enumerated.item[0])
-		return 0;
-
-	/* Do not allow changes while stream is running */
-	if (snd_soc_component_active(component))
-		return -EPERM;
-
-	if (ucontrol->value.enumerated.item[0] >=  ARRAY_SIZE(wl1273_audio_route))
-		return -EINVAL;
-
-	wl1273->mode = ucontrol->value.enumerated.item[0];
-
-	return 1;
-}
-
-static SOC_ENUM_SINGLE_EXT_DECL(wl1273_enum, wl1273_audio_route);
-
-static int snd_wl1273_fm_audio_get(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
-	struct wl1273_priv *wl1273 = snd_soc_component_get_drvdata(component);
-
-	dev_dbg(component->dev, "%s: enter.\n", __func__);
-
-	ucontrol->value.enumerated.item[0] = wl1273->core->audio_mode;
-
-	return 0;
-}
-
-static int snd_wl1273_fm_audio_put(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
-	struct wl1273_priv *wl1273 = snd_soc_component_get_drvdata(component);
-	int val, r = 0;
-
-	dev_dbg(component->dev, "%s: enter.\n", __func__);
-
-	val = ucontrol->value.enumerated.item[0];
-	if (wl1273->core->audio_mode == val)
-		return 0;
-
-	r = wl1273->core->set_audio(wl1273->core, val);
-	if (r < 0)
-		return r;
-
-	return 1;
-}
-
-static const char * const wl1273_audio_strings[] = { "Digital", "Analog" };
-
-static SOC_ENUM_SINGLE_EXT_DECL(wl1273_audio_enum, wl1273_audio_strings);
-
-static int snd_wl1273_fm_volume_get(struct snd_kcontrol *kcontrol,
-				    struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
-	struct wl1273_priv *wl1273 = snd_soc_component_get_drvdata(component);
-
-	dev_dbg(component->dev, "%s: enter.\n", __func__);
-
-	ucontrol->value.integer.value[0] = wl1273->core->volume;
-
-	return 0;
-}
-
-static int snd_wl1273_fm_volume_put(struct snd_kcontrol *kcontrol,
-				    struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
-	struct wl1273_priv *wl1273 = snd_soc_component_get_drvdata(component);
-	int r;
-
-	dev_dbg(component->dev, "%s: enter.\n", __func__);
-
-	r = wl1273->core->set_volume(wl1273->core,
-				     ucontrol->value.integer.value[0]);
-	if (r)
-		return r;
-
-	return 1;
-}
-
-static const struct snd_kcontrol_new wl1273_controls[] = {
-	SOC_ENUM_EXT("Codec Mode", wl1273_enum,
-		     snd_wl1273_get_audio_route, snd_wl1273_set_audio_route),
-	SOC_ENUM_EXT("Audio Switch", wl1273_audio_enum,
-		     snd_wl1273_fm_audio_get,  snd_wl1273_fm_audio_put),
-	SOC_SINGLE_EXT("Volume", 0, 0, WL1273_MAX_VOLUME, 0,
-		       snd_wl1273_fm_volume_get, snd_wl1273_fm_volume_put),
-};
-
-static const struct snd_soc_dapm_widget wl1273_dapm_widgets[] = {
-	SND_SOC_DAPM_INPUT("RX"),
-
-	SND_SOC_DAPM_OUTPUT("TX"),
-};
-
-static const struct snd_soc_dapm_route wl1273_dapm_routes[] = {
-	{ "Capture", NULL, "RX" },
-
-	{ "TX", NULL, "Playback" },
-};
-
-static int wl1273_startup(struct snd_pcm_substream *substream,
-			  struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-	struct wl1273_priv *wl1273 = snd_soc_component_get_drvdata(component);
-
-	switch (wl1273->mode) {
-	case WL1273_MODE_BT:
-		snd_pcm_hw_constraint_single(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_RATE, 8000);
-		snd_pcm_hw_constraint_single(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_CHANNELS, 1);
-		break;
-	case WL1273_MODE_FM_RX:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			pr_err("Cannot play in RX mode.\n");
-			return -EINVAL;
-		}
-		break;
-	case WL1273_MODE_FM_TX:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-			pr_err("Cannot capture in TX mode.\n");
-			return -EINVAL;
-		}
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int wl1273_hw_params(struct snd_pcm_substream *substream,
-			    struct snd_pcm_hw_params *params,
-			    struct snd_soc_dai *dai)
-{
-	struct wl1273_priv *wl1273 = snd_soc_component_get_drvdata(dai->component);
-	struct wl1273_core *core = wl1273->core;
-	unsigned int rate, width, r;
-
-	if (params_width(params) != 16) {
-		dev_err(dai->dev, "%d bits/sample not supported\n",
-			params_width(params));
-		return -EINVAL;
-	}
-
-	rate = params_rate(params);
-	width =  hw_param_interval(params, SNDRV_PCM_HW_PARAM_SAMPLE_BITS)->min;
-
-	if (wl1273->mode == WL1273_MODE_BT) {
-		if (rate != 8000) {
-			pr_err("Rate %d not supported.\n", params_rate(params));
-			return -EINVAL;
-		}
-
-		if (params_channels(params) != 1) {
-			pr_err("Only mono supported.\n");
-			return -EINVAL;
-		}
-
-		return 0;
-	}
-
-	if (wl1273->mode == WL1273_MODE_FM_TX &&
-	    substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		pr_err("Only playback supported with TX.\n");
-		return -EINVAL;
-	}
-
-	if (wl1273->mode == WL1273_MODE_FM_RX  &&
-	    substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		pr_err("Only capture supported with RX.\n");
-		return -EINVAL;
-	}
-
-	if (wl1273->mode != WL1273_MODE_FM_RX  &&
-	    wl1273->mode != WL1273_MODE_FM_TX) {
-		pr_err("Unexpected mode: %d.\n", wl1273->mode);
-		return -EINVAL;
-	}
-
-	r = snd_wl1273_fm_set_i2s_mode(core, rate, width);
-	if (r)
-		return r;
-
-	wl1273->channels = params_channels(params);
-	r = snd_wl1273_fm_set_channel_number(core, wl1273->channels);
-	if (r)
-		return r;
-
-	return 0;
-}
-
-static const struct snd_soc_dai_ops wl1273_dai_ops = {
-	.startup	= wl1273_startup,
-	.hw_params	= wl1273_hw_params,
-};
-
-static struct snd_soc_dai_driver wl1273_dai = {
-	.name = "wl1273-fm",
-	.playback = {
-		.stream_name = "Playback",
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE},
-	.capture = {
-		.stream_name = "Capture",
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE},
-	.ops = &wl1273_dai_ops,
-};
-
-/* Audio interface format for the soc_card driver */
-int wl1273_get_format(struct snd_soc_component *component, unsigned int *fmt)
-{
-	struct wl1273_priv *wl1273;
-
-	if (component == NULL || fmt == NULL)
-		return -EINVAL;
-
-	wl1273 = snd_soc_component_get_drvdata(component);
-
-	switch (wl1273->mode) {
-	case WL1273_MODE_FM_RX:
-	case WL1273_MODE_FM_TX:
-		*fmt =	SND_SOC_DAIFMT_I2S |
-			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBP_CFP;
-
-		break;
-	case WL1273_MODE_BT:
-		*fmt =	SND_SOC_DAIFMT_DSP_A |
-			SND_SOC_DAIFMT_IB_NF |
-			SND_SOC_DAIFMT_CBP_CFP;
-
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(wl1273_get_format);
-
-static int wl1273_probe(struct snd_soc_component *component)
-{
-	struct wl1273_core **core = component->dev->platform_data;
-	struct wl1273_priv *wl1273;
-
-	dev_dbg(component->dev, "%s.\n", __func__);
-
-	if (!core) {
-		dev_err(component->dev, "Platform data is missing.\n");
-		return -EINVAL;
-	}
-
-	wl1273 = kzalloc(sizeof(struct wl1273_priv), GFP_KERNEL);
-	if (!wl1273)
-		return -ENOMEM;
-
-	wl1273->mode = WL1273_MODE_BT;
-	wl1273->core = *core;
-
-	snd_soc_component_set_drvdata(component, wl1273);
-
-	return 0;
-}
-
-static void wl1273_remove(struct snd_soc_component *component)
-{
-	struct wl1273_priv *wl1273 = snd_soc_component_get_drvdata(component);
-
-	dev_dbg(component->dev, "%s\n", __func__);
-	kfree(wl1273);
-}
-
-static const struct snd_soc_component_driver soc_component_dev_wl1273 = {
-	.probe			= wl1273_probe,
-	.remove			= wl1273_remove,
-	.controls		= wl1273_controls,
-	.num_controls		= ARRAY_SIZE(wl1273_controls),
-	.dapm_widgets		= wl1273_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(wl1273_dapm_widgets),
-	.dapm_routes		= wl1273_dapm_routes,
-	.num_dapm_routes	= ARRAY_SIZE(wl1273_dapm_routes),
-	.idle_bias_on		= 1,
-	.use_pmdown_time	= 1,
-	.endianness		= 1,
-};
-
-static int wl1273_platform_probe(struct platform_device *pdev)
-{
-	return devm_snd_soc_register_component(&pdev->dev,
-				      &soc_component_dev_wl1273,
-				      &wl1273_dai, 1);
-}
-
-MODULE_ALIAS("platform:wl1273-codec");
-
-static struct platform_driver wl1273_platform_driver = {
-	.driver		= {
-		.name	= "wl1273-codec",
-	},
-	.probe		= wl1273_platform_probe,
-};
-
-module_platform_driver(wl1273_platform_driver);
-
-MODULE_AUTHOR("Matti Aaltonen <matti.j.aaltonen@nokia.com>");
-MODULE_DESCRIPTION("ASoC WL1273 codec driver");
-MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/wl1273.h b/sound/soc/codecs/wl1273.h
deleted file mode 100644
index 66c312fa7eee..000000000000
--- a/sound/soc/codecs/wl1273.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * sound/soc/codec/wl1273.h
- *
- * ALSA SoC WL1273 codec driver
- *
- * Copyright (C) Nokia Corporation
- * Author: Matti Aaltonen <matti.j.aaltonen@nokia.com>
- */
-
-#ifndef __WL1273_CODEC_H__
-#define __WL1273_CODEC_H__
-
-int wl1273_get_format(struct snd_soc_component *component, unsigned int *fmt);
-
-#endif	/* End of __WL1273_CODEC_H__ */
-- 
2.49.0


