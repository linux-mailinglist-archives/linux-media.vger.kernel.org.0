Return-Path: <linux-media+bounces-15335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651BC93BFF2
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 12:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B87DAB2246D
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 10:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB6C19755B;
	Thu, 25 Jul 2024 10:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9LYrSln"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FB91990AE;
	Thu, 25 Jul 2024 10:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721903511; cv=none; b=QgSF/X5XVPVrvziWSZ7GE31D2fdY+6x+/YAfhiqmDP0ggKHZV9wO9lU6UeDzMdYnjGR3ou+04t7zwPD3X6TRAvk1vcxh5wJIJEe6iQJwa/h+cKIonKGMwCVKsOSjo0ecuh0PKQzpft2/9UwRoA3H19zfigXQuxsMhD2h9KhfmIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721903511; c=relaxed/simple;
	bh=ySj53zVL2RP4hd9XKHlE95BaO61mIJrRrZo6GMbFlg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=inCZ1VjfvRoIkk/j/XuZTRtnXg9r0Ict6VplZScUMJThiERWQQfMLtGPkj0ae3fRmSfTO8kDytQhQ/EKuBEPFGKCNAWz+nWL9CodQ4ejnfN07OKTs8B73hbpzN07TtPyf+8UqR0SgECDdPlzQokPkjSG1hpWEhNStPuypn2s3Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9LYrSln; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7b2dbd81e3so38759366b.1;
        Thu, 25 Jul 2024 03:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721903508; x=1722508308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcFfHHMg/vpKPfjLUUikPwq0DiRK7mCRJuSC9q6OEfA=;
        b=V9LYrSlneOtU8fkzeUUe2AFGuYPoY6Lx4ws3fwoIQVn2L/W0fm8g+QjdGGuc3LHJTJ
         ryiuYeronaiii6wUhkIuLxmWbQ9jrU9UvqCkKZ97zMNjYrBPHhImQcTx0rH9dqJBQ/Bn
         Cqr0d4UHQYQ1gxwx+vzkk90JBN60KKhp7SSxbDkyBwahWn9RTXRXXIn6QZFFwzEKaCZi
         8k+EILyaDXxektmMSIN6B+8DIFCAIXW1O744dE0va1UxATAxMKfrxp+bWZbMDMUbzM5B
         NVtBY7eWhXyJxanmmfn2fJWSC1Fz3WxQUAZXMbj68Ef0DVTyNPJlGQSAQoUDcP/tLCh3
         mh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721903508; x=1722508308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcFfHHMg/vpKPfjLUUikPwq0DiRK7mCRJuSC9q6OEfA=;
        b=qqWWNtjKsFZKBZb7XG6XkOhAFRECbHeMSv95MgnwaKMjonaz488RuXX0ouO2eWE9O7
         yqvcGouSjzJ5YMlke/KCOWOdDTouPmRhk6bhHc7neJVyt9OrXFlLHwvX64aAvnu+X+xe
         7r7eXkG2r6dWE3gTrCynnTYXAsWY8m3VdMwKUM5ZUvT7WJMmUNsBKgmzHqTuOxO+PNqu
         SSGsWycRW0F9f+xcYU71+FnkcMEc9P3gL15VO3RmKMRke0xl21u3l+fCyAqz1NH9EzA0
         /K4OHoBqHNIXLviL0kssubUGwooqkg1zWE17IwpBzPaSh7iguqgRnjZu/F2ymku1S4Sl
         QBHg==
X-Forwarded-Encrypted: i=1; AJvYcCXiwLccFf4fkTfuyXips/CB5nmNLvqQonjwKgEvlkxkx8UfvQBO9H0DrhzyW2otRSrxHa527hAMcVt7hBRXRayQj7AqdL6BixEL6eZ1VKrzVGMq2MvjbfP1GsaGpO0HND0eVyz0IPbdQlQ=
X-Gm-Message-State: AOJu0Yx+SIY2+OlvENDGCTZ1m/X7s21ENOQAwZLuLSPCV40t4vo0nfjV
	kNtS5/+CCfbaFHCQj/QR1+G10R9LoEQ9O2Y0sRH1jvI5rFUOEoiL
X-Google-Smtp-Source: AGHT+IEaqiztPzxb1PzAMKNaHMQ+BRHsmjzlCQLP8D7b3wmw6IZllEQCoc1gR9hApLg4z7JQqimmSA==
X-Received: by 2002:a17:907:9694:b0:a6f:24fe:f2a7 with SMTP id a640c23a62f3a-a7ac4d9f4a7mr193283366b.10.1721903507280;
        Thu, 25 Jul 2024 03:31:47 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad903f1sm57280766b.152.2024.07.25.03.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:31:46 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 25 Jul 2024 12:31:40 +0200
Subject: [PATCH 2/2] ASoC: constify snd_soc_component_driver struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>
References: <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
In-Reply-To: <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721903500; l=8541;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ySj53zVL2RP4hd9XKHlE95BaO61mIJrRrZo6GMbFlg0=;
 b=JwSs8y19BMfB32bcO/WktQ/BA0jtJssRSuec63vGXGLwGnYUnDXzVtb/uT5vwNXNLja0d9sLR
 U0l0peToTlsBXRy508x93yavE47eCyDYnrAcbXwqnslVzdw1nt3sTT9
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The instances of the `snd_soc_component_driver` struct are not modified
after their declaration, and they are only passed to
`devm_snd_soc_register_component()`, which expects a constant
`snd_soc_component_driver`.

Move all instances of `snd_soc_component_driver` to read-only sections
by declaring them const.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/au1x/dbdma2.c              | 2 +-
 sound/soc/au1x/dma.c                 | 2 +-
 sound/soc/bcm/cygnus-pcm.c           | 2 +-
 sound/soc/codecs/cpcap.c             | 2 +-
 sound/soc/codecs/cs43130.c           | 2 +-
 sound/soc/codecs/pcm186x.c           | 4 ++--
 sound/soc/codecs/pcm5102a.c          | 2 +-
 sound/soc/codecs/spdif_receiver.c    | 2 +-
 sound/soc/codecs/spdif_transmitter.c | 2 +-
 sound/soc/codecs/sti-sas.c           | 2 +-
 sound/soc/codecs/tas6424.c           | 2 +-
 sound/soc/stm/stm32_adfsdm.c         | 2 +-
 sound/soc/uniphier/evea.c            | 2 +-
 13 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index ea01d6490cec..3392693faeb9 100644
--- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -311,7 +311,7 @@ static int au1xpsc_pcm_new(struct snd_soc_component *component,
 }
 
 /* au1xpsc audio platform */
-static struct snd_soc_component_driver au1xpsc_soc_component = {
+static const struct snd_soc_component_driver au1xpsc_soc_component = {
 	.name		= DRV_NAME,
 	.open		= au1xpsc_pcm_open,
 	.close		= au1xpsc_pcm_close,
diff --git a/sound/soc/au1x/dma.c b/sound/soc/au1x/dma.c
index d2fdebd8881b..c9c2b1e71d55 100644
--- a/sound/soc/au1x/dma.c
+++ b/sound/soc/au1x/dma.c
@@ -289,7 +289,7 @@ static int alchemy_pcm_new(struct snd_soc_component *component,
 	return 0;
 }
 
-static struct snd_soc_component_driver alchemy_pcm_soc_component = {
+static const struct snd_soc_component_driver alchemy_pcm_soc_component = {
 	.name		= DRV_NAME,
 	.open		= alchemy_pcm_open,
 	.close		= alchemy_pcm_close,
diff --git a/sound/soc/bcm/cygnus-pcm.c b/sound/soc/bcm/cygnus-pcm.c
index 2d1e241d8367..4cb2fe10bcdc 100644
--- a/sound/soc/bcm/cygnus-pcm.c
+++ b/sound/soc/bcm/cygnus-pcm.c
@@ -707,7 +707,7 @@ static int cygnus_dma_new(struct snd_soc_component *component,
 	return 0;
 }
 
-static struct snd_soc_component_driver cygnus_soc_platform = {
+static const struct snd_soc_component_driver cygnus_soc_platform = {
 	.open		= cygnus_pcm_open,
 	.close		= cygnus_pcm_close,
 	.prepare	= cygnus_pcm_prepare,
diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 4f9dabd9d78a..04304a7ad915 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1649,7 +1649,7 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 	return cpcap_audio_reset(component, false);
 }
 
-static struct snd_soc_component_driver soc_codec_dev_cpcap = {
+static const struct snd_soc_component_driver soc_codec_dev_cpcap = {
 	.probe			= cpcap_soc_probe,
 	.controls		= cpcap_snd_controls,
 	.num_controls		= ARRAY_SIZE(cpcap_snd_controls),
diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index be4037890fdb..90909f452ba5 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -2398,7 +2398,7 @@ static int cs43130_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-static struct snd_soc_component_driver soc_component_dev_cs43130 = {
+static const struct snd_soc_component_driver soc_component_dev_cs43130 = {
 	.probe			= cs43130_probe,
 	.controls		= cs43130_snd_controls,
 	.num_controls		= ARRAY_SIZE(cs43130_snd_controls),
diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
index 451a8fd8fac5..13443f569ddb 100644
--- a/sound/soc/codecs/pcm186x.c
+++ b/sound/soc/codecs/pcm186x.c
@@ -566,7 +566,7 @@ static int pcm186x_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
-static struct snd_soc_component_driver soc_codec_dev_pcm1863 = {
+static const struct snd_soc_component_driver soc_codec_dev_pcm1863 = {
 	.set_bias_level		= pcm186x_set_bias_level,
 	.controls		= pcm1863_snd_controls,
 	.num_controls		= ARRAY_SIZE(pcm1863_snd_controls),
@@ -579,7 +579,7 @@ static struct snd_soc_component_driver soc_codec_dev_pcm1863 = {
 	.endianness		= 1,
 };
 
-static struct snd_soc_component_driver soc_codec_dev_pcm1865 = {
+static const struct snd_soc_component_driver soc_codec_dev_pcm1865 = {
 	.set_bias_level		= pcm186x_set_bias_level,
 	.controls		= pcm1865_snd_controls,
 	.num_controls		= ARRAY_SIZE(pcm1865_snd_controls),
diff --git a/sound/soc/codecs/pcm5102a.c b/sound/soc/codecs/pcm5102a.c
index 3401a25341e6..9bca53de2475 100644
--- a/sound/soc/codecs/pcm5102a.c
+++ b/sound/soc/codecs/pcm5102a.c
@@ -24,7 +24,7 @@ static struct snd_soc_dai_driver pcm5102a_dai = {
 	},
 };
 
-static struct snd_soc_component_driver soc_component_dev_pcm5102a = {
+static const struct snd_soc_component_driver soc_component_dev_pcm5102a = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
diff --git a/sound/soc/codecs/spdif_receiver.c b/sound/soc/codecs/spdif_receiver.c
index 862e0b654a1c..7043aa9a206e 100644
--- a/sound/soc/codecs/spdif_receiver.c
+++ b/sound/soc/codecs/spdif_receiver.c
@@ -35,7 +35,7 @@ static const struct snd_soc_dapm_route dir_routes[] = {
 			SNDRV_PCM_FMTBIT_S32_LE | \
 			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
-static struct snd_soc_component_driver soc_codec_spdif_dir = {
+static const struct snd_soc_component_driver soc_codec_spdif_dir = {
 	.dapm_widgets		= dir_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(dir_widgets),
 	.dapm_routes		= dir_routes,
diff --git a/sound/soc/codecs/spdif_transmitter.c b/sound/soc/codecs/spdif_transmitter.c
index 736518921555..d997862767ec 100644
--- a/sound/soc/codecs/spdif_transmitter.c
+++ b/sound/soc/codecs/spdif_transmitter.c
@@ -35,7 +35,7 @@ static const struct snd_soc_dapm_route dit_routes[] = {
 	{ "spdif-out", NULL, "Playback" },
 };
 
-static struct snd_soc_component_driver soc_codec_spdif_dit = {
+static const struct snd_soc_component_driver soc_codec_spdif_dit = {
 	.dapm_widgets		= dit_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(dit_widgets),
 	.dapm_routes		= dit_routes,
diff --git a/sound/soc/codecs/sti-sas.c b/sound/soc/codecs/sti-sas.c
index c421906a0694..3a1cdb329f31 100644
--- a/sound/soc/codecs/sti-sas.c
+++ b/sound/soc/codecs/sti-sas.c
@@ -386,7 +386,7 @@ static int sti_sas_component_probe(struct snd_soc_component *component)
 	return sti_sas_init_sas_registers(component, drvdata);
 }
 
-static struct snd_soc_component_driver sti_sas_driver = {
+static const struct snd_soc_component_driver sti_sas_driver = {
 	.probe			= sti_sas_component_probe,
 	.resume			= sti_sas_resume,
 	.idle_bias_on		= 1,
diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index bb0500e9d3ea..9be054837f68 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -364,7 +364,7 @@ static int tas6424_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
-static struct snd_soc_component_driver soc_codec_dev_tas6424 = {
+static const struct snd_soc_component_driver soc_codec_dev_tas6424 = {
 	.set_bias_level		= tas6424_set_bias_level,
 	.controls		= tas6424_snd_controls,
 	.num_controls		= ARRAY_SIZE(tas6424_snd_controls),
diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index fb5dd9a68bea..b35c28b70265 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -309,7 +309,7 @@ static void stm32_adfsdm_cleanup(void *data)
 	iio_channel_release_all_cb(data);
 }
 
-static struct snd_soc_component_driver stm32_adfsdm_soc_platform = {
+static const struct snd_soc_component_driver stm32_adfsdm_soc_platform = {
 	.open		= stm32_adfsdm_pcm_open,
 	.close		= stm32_adfsdm_pcm_close,
 	.hw_params	= stm32_adfsdm_pcm_hw_params,
diff --git a/sound/soc/uniphier/evea.c b/sound/soc/uniphier/evea.c
index d90b3e4b0104..a4cf14462374 100644
--- a/sound/soc/uniphier/evea.c
+++ b/sound/soc/uniphier/evea.c
@@ -384,7 +384,7 @@ static int evea_codec_resume(struct snd_soc_component *component)
 	return ret;
 }
 
-static struct snd_soc_component_driver soc_codec_evea = {
+static const struct snd_soc_component_driver soc_codec_evea = {
 	.probe			= evea_codec_probe,
 	.suspend		= evea_codec_suspend,
 	.resume			= evea_codec_resume,

-- 
2.43.0


