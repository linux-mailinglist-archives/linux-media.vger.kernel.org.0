Return-Path: <linux-media+bounces-15334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8D93BFF0
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 12:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBED81C21677
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 10:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64951990C1;
	Thu, 25 Jul 2024 10:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxtWLczz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59B41990A2;
	Thu, 25 Jul 2024 10:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721903509; cv=none; b=kO/aJh0chxLt9s45q+3pCLvzVjzvtieFgVAhislq+GLehj1F4XY+2rSSc/MvrrBGEwbxuQCHj/GcGmIk/PFPJPb+2xf6diNi8NBdk9q1KWa7ETGm7GHjbTnu6SSooJwCjy5giLq+dHUgN9zB8GazO8jjBhLm8tbeD+/y4nS9kDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721903509; c=relaxed/simple;
	bh=wAda8xQPhY/5MLE9114YUL4s08mmQAnyb/WJmp3W3Q0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9Mb7mxAOoCl7TRV31A/7Gw7/G1CwgepUgyc5vlWrKi46cbptZs4EB6Q1cGUz+sm6he1/w7incmeACxeWL1mQTzf+jpnif6XKfw5t4z1Gn8FoTL1jvyBc8QvPLyDkp2M/e74glQeGRnlhU0ild+PfsjiIC+IArXsthjLDhw7OeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxtWLczz; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7aa212c1c9so43765566b.2;
        Thu, 25 Jul 2024 03:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721903506; x=1722508306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOeiGXeuTWh9ihbymAzgAMoDAdspVLgp4kSjE/YSgxc=;
        b=OxtWLczzu0yB5WEi3ZCDHwc/5M4H7BgNFOzu8woHIMoT0iQdX5ZTkdlgsVi0+kErwL
         o+kehALI2oVPvZE15fFSMVskuY4e6NAFGskOxWDFJa1oWPDMWTXu5GXSkMoEMY5Xiqbo
         TwGqvnKyTxfSIgh78HCorqAozGg6iykfgjGuUzO0EX48SY6F0SKcwRk0dqaxMht1q2iJ
         CChCaVNphUmmXijnR5QJnEZlk4cyuEx0YAixRBG/q3d2OAL0TO9X2w+jlzjXEjHWcFK5
         NPWMPcUx8QlrBOuXIbudf+/hu5l8x9DYSNexCs0LqoIBp8rgE1LMauXsUvkfg1KtkM5D
         Tnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721903506; x=1722508306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOeiGXeuTWh9ihbymAzgAMoDAdspVLgp4kSjE/YSgxc=;
        b=vHu3Yk7j9g9sR0E73IXLYTLFD9xn2NUGZByguXeo3zJZk+gxrhf3umb4TBeyjphopC
         lQrl4bAmExk6nv+z2ICQodgtBNXUO16+9bxt9OMs3M3j8PdQ4wPnkrr8xjaUlMEosv5L
         gEEv4XwI1l7oRH3NIFAAme4URmQ8QEibnB4OM1F8DIXsCItS+asu6yW+p8ySJe3DB4FS
         yIkSkqZcQKp6yBIa0fKv3QX3H+N3HT7O7xBeKBAUjLgGhSNtb+Vv7vVa9iuIUMoutPKd
         A06AEdXEhX6aaXIUPezbZ6aFGrR5PxFQ4+dkHdHWbuU1dMnpIOw4ejRjXTSWQTQQKaNf
         H5XA==
X-Forwarded-Encrypted: i=1; AJvYcCXnd82TWeGzids9Z5gEBYvhWUggwGlGb0H21dUS/7KCpICNatxs6r79i9eR5IcIAfeftkehgbgK8pRHqldmbT7XxDUxKF5CSqjZIScvGQJ946zjq/MP2p/s87fU2WMU7aPwxgm+BfsJAvI=
X-Gm-Message-State: AOJu0YzYStFEY/bR74DWgjDTvBvGLXIVWQRT9uOZnXuHriFON6RC2/na
	XrIbWIAES4ARsYBqo0/afQWe1Nst/K/PPI8vdf/NdGZnBcwzWstC
X-Google-Smtp-Source: AGHT+IE0/hpUdAcQx4dLRlMWzDI99oBJN7+P7fRlBEFw3PDOuVabqJfYozkGN3UY2efNKiho/QNr+Q==
X-Received: by 2002:a17:907:2d0a:b0:a7a:a212:be48 with SMTP id a640c23a62f3a-a7ac5087e56mr177990766b.56.1721903503189;
        Thu, 25 Jul 2024 03:31:43 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad903f1sm57280766b.152.2024.07.25.03.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:31:42 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 25 Jul 2024 12:31:39 +0200
Subject: [PATCH 1/2] media: i2c: tda1997x: constify
 snd_soc_component_driver struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-const_snd_soc_component_driver-v1-1-3d7ee08e129b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721903500; l=964;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wAda8xQPhY/5MLE9114YUL4s08mmQAnyb/WJmp3W3Q0=;
 b=g+GwinB2Om+/QI19eL/QDvSqsxnmXjF9gdTgw9VQo6YTUwrcAxKL/wFe4IHNNaaiUzHHdXQ29
 T8cWG+KHnUBDrYJ+zT75Qz2Wr485h9ieY+INwWbKf+ktYVDL378CLex
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tda1997x_codec_driver` is not modified after its declaration, and it
is only passed to `devm_snd_soc_register_component()`, which expects
a constant `snd_soc_component_driver`.

Move `tda1997x_codec_driver` to a read-only section by declaring it
const.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/media/i2c/tda1997x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 58ce8fec3041..3b7e5ff5b010 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2514,7 +2514,7 @@ static void tda1997x_codec_remove(struct snd_soc_component *component)
 {
 }
 
-static struct snd_soc_component_driver tda1997x_codec_driver = {
+static const struct snd_soc_component_driver tda1997x_codec_driver = {
 	.probe			= tda1997x_codec_probe,
 	.remove			= tda1997x_codec_remove,
 	.idle_bias_on		= 1,

-- 
2.43.0


