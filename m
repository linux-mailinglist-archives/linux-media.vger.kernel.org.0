Return-Path: <linux-media+bounces-15435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7393F155
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 11:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C763528291E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 09:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81CD9140363;
	Mon, 29 Jul 2024 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dr5YyqSA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10336801;
	Mon, 29 Jul 2024 09:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722245871; cv=none; b=DVRgxRfrT2ESvIBH0ce73GUsVc6BfPQM9G3RpHu2C4RSEu4mMHpxKxiD10RzMyIv/D0PQNnfR5SAMpTtuFL3l/PSiuQUBwtFnrM8ZIw8vNYu0IpvXagjNW7veTz/OYMdQWLDCKfa+ar4fEoVMA+W3fnZmDO5jxgxf91+S/7QD1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722245871; c=relaxed/simple;
	bh=dUb6XFAWURF5fTzbw/+1MFJZCob3+hK/YpTTVucusdc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HAAv6Ti8Qbo8aZ/ZELzb5O4E0waZ80IMvIhwfaj0NVQytVMsJOm6/i/vQ1fF/G7OkOVA/991SIjdE8nQKIxXpO6nR3LAwHE4snxAvWWCaZVYFYZwDF7/h5ErcctVHFM0qXMnHgdB9ST2GCjvZ8/jzRy844gqIySl6H3sMIWzbV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dr5YyqSA; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a15692b6f6so5404917a12.0;
        Mon, 29 Jul 2024 02:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722245868; x=1722850668; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NR8EYDbZcj20ngdxq0iIEW20+Ft9Qj88x8IgpUrOrXQ=;
        b=dr5YyqSAcubG8CeYTN9kYwm7zWd5uBsn+5BJX9nXBFEqUu418iZReomUg6lLOSaRak
         agfHW6VpSZ3aqQ3di2AjKCiCMJWIHrwVXATX/TvMAY8ib2YCCHv0S4X0EOYsYkTfOXdh
         yMRYOOc8qxmmQteiUlivyJJt79snq7a+nGt/GqQ4teZWheVo8TQVkLqdm9P2IcjcdKjJ
         5Vdi+T5BpHZusNB2vNne1pSYQINUjaW8a5Pj7A0ADfcMaHoiD/yqHlz75krk6f81OeCV
         aIk8ljht1JFNXQSBP7vQGU2dI0q6iIX3sr7lVFNgObZuzE8xLRd2uVw5pLvhGjahZ75j
         wmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722245868; x=1722850668;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NR8EYDbZcj20ngdxq0iIEW20+Ft9Qj88x8IgpUrOrXQ=;
        b=DShrrn3wpCfeqVGtXWNVmiE1p9X/RuW/jjssMvf4oB3MTQzioX6EFeuY5zwOBzfWy3
         gc8SriR/3fTuyjEoETfWsODIb0mrSpYiUrXG7fG7WfVJBjfqQtU/2CpMjv+Ob38k9GG+
         GrJ6Zfhtz9oZkgiu4Mb1UB3dQD/2oJc4w9izoSO6eUfsnrIJo2+zPgjHmLkaHEXuIrRS
         NFL/KJcRitcw5pu+htGGi3jIpUuBlvLFubFjkdDorv6/m40PBu/ti0rVarJrPj4BpxA7
         AwFgZuoP1KixgRaOkezDk9+rvxvCC5TDNqchOOhLfYDDShk4msQXb4iSxbqZ+tWdIVs2
         RZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxgAqxeMCiTCTDBvxmVry0Zmlp51paC/X9gilCKKVzLUWyO/R1CMLjQLjj211V/OpwcHOEnQ4Q0JnKMRCZD9NKUkGCSEyBmqW/vPbfmbV3PcEpSKNPbUduvy3QuCUzI9U0uukYn96bqxM=
X-Gm-Message-State: AOJu0YyF2IR4d8N0J+s4HoiPyL+sezC0a2V1srtfRtdmp2r3RdzVBTH0
	QJJkQuYy3B9sDN9vAQTWXLBSSU2iYheFlHh60LyX/69In6aE3N9UqnI21S6g
X-Google-Smtp-Source: AGHT+IGB+vRrdX/B/2dg/ESisrGwMj2AyPaJblfTpT4noAFpKg4KyVyg7wAt53T8pHgMroSEYzYs/Q==
X-Received: by 2002:a17:907:96a0:b0:a7a:a0c9:124e with SMTP id a640c23a62f3a-a7d3ffadf1amr581593566b.4.1722245867939;
        Mon, 29 Jul 2024 02:37:47 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad41b24sm481617966b.116.2024.07.29.02.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 02:37:47 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v2 0/2] {ASoC,media}: constify snd_soc_component_driver
 when used as read-only
Date: Mon, 29 Jul 2024 11:37:36 +0200
Message-Id: <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOBip2YC/42NQQ6CMBBFr0JmbU2pINSV9zCkgXaESaQlHdJoC
 He3cgKX7+fnvQ0YIyHDrdggYiKm4DOoUwF26v2IglxmUFJVslG1sMHzatg7w8EaG+YlePSrcZE
 SRjHoq9K9rgddtZAlS8QnvY/Ao8s8Ea8hfo5eKn/r3+pUCikurkGULZZKD/dx7ul1zkfo9n3/A
 ucOmcHMAAAA
To: Tim Harvey <tharvey@gateworks.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722245866; l=2529;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=dUb6XFAWURF5fTzbw/+1MFJZCob3+hK/YpTTVucusdc=;
 b=RPp7DAhUclessfFNFbcWgORq5LFwt1sEuXGSZwmnwQyt6PJKpGQSAD09Ku+TP7WOneIIyaxWv
 s/TEiuxzbZNCW6/irPcZOG1uLKlqLQvxJpgMvBhbXL3qIH7lZwJQGEF
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Declare `snd_soc_component_driver` as const to move their declarations
to read-only sections for the drivers that do not modify the struct
after its declaration.

Apart from a single case under media/, the affected drivers are members
of the ASoC subsystem.

To: Tim Harvey <tharvey@gateworks.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Ray Jui <rjui@broadcom.com>
To: Scott Branden <sbranden@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: alsa-devel@alsa-project.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Changes in v2:
- drop cs43130 and sti-sas, as they modifiy the struct in the probe
  function.
- Link to v1: https://lore.kernel.org/r/20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com

---
Javier Carrasco (2):
      media: i2c: tda1997x: constify snd_soc_component_driver struct
      ASoC: constify snd_soc_component_driver struct

 drivers/media/i2c/tda1997x.c         | 2 +-
 sound/soc/au1x/dbdma2.c              | 2 +-
 sound/soc/au1x/dma.c                 | 2 +-
 sound/soc/bcm/cygnus-pcm.c           | 2 +-
 sound/soc/codecs/cpcap.c             | 2 +-
 sound/soc/codecs/pcm186x.c           | 4 ++--
 sound/soc/codecs/pcm5102a.c          | 2 +-
 sound/soc/codecs/spdif_receiver.c    | 2 +-
 sound/soc/codecs/spdif_transmitter.c | 2 +-
 sound/soc/codecs/tas6424.c           | 2 +-
 sound/soc/stm/stm32_adfsdm.c         | 2 +-
 sound/soc/uniphier/evea.c            | 2 +-
 12 files changed, 13 insertions(+), 13 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240725-const_snd_soc_component_driver-b9629a95b948

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


