Return-Path: <linux-media+bounces-15436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C777893F157
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 11:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78F002848C3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 09:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9331428FE;
	Mon, 29 Jul 2024 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aa9GaEFh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107884E0D;
	Mon, 29 Jul 2024 09:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722245873; cv=none; b=h5x28sikBi5cMNoAlWIyE0WEPSRRn/4jad4wzpjJ91G6PQKVRK6E89dyNSPQFRac1YuorfqTGjuwOon34XW0jzRbFV3ZoNIknWZBZVT1cJTliJh4w4lLZsl9Udp8JuCcS4ZEP5FfXjCBrZb0iZ4nK7lNJoJPZCKv8qOYxrwmWnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722245873; c=relaxed/simple;
	bh=wAda8xQPhY/5MLE9114YUL4s08mmQAnyb/WJmp3W3Q0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tz02zv5UoeJIBsKyoq/9IVNCyvAMPTeeXfL33j5Fn7HNiE0MkPzE5ZRzKjZnuZWWjNQjvO33miujqHrznf+xYkYPF+Kk5JJcrKZUW4xitR/aHm1jwypC2cxJXGDJeaV4Suq96CHP9x49LiO3sbqDhT/jvBmlEG3FRNTXPg3IIVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aa9GaEFh; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso55966341fa.1;
        Mon, 29 Jul 2024 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722245870; x=1722850670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOeiGXeuTWh9ihbymAzgAMoDAdspVLgp4kSjE/YSgxc=;
        b=aa9GaEFhAXmB2yUH53klw9lWSqXZspsIBp6y28wMVI9FHLI3iOuDbHTYDhGeaYYMLX
         jD+1TwNeEkkg3EBaMovZjstuCC9Sk/S4xDbqwmTgZ0dYusRkSdx82Qkw7m9liWHEMgSk
         w1509W2/WTQOHVCYfyI7jEI3AQiAySkusemyFcCMdJ311ocX5gCqi/BDqY7qdcMRxgjy
         DLG0UFWubbMAV1yl0ns4iHuKtPFgVKKMSQ6m6dOqeDDF/eNG45DS9wd5C4ucDr+HZ5F8
         eb99e7WWBo/RKp81E/v1kyVv2upq0Ezv6avZLeR6590LXibI2pk4h4HdvLjytst4EaqR
         viFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722245870; x=1722850670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOeiGXeuTWh9ihbymAzgAMoDAdspVLgp4kSjE/YSgxc=;
        b=tnYQg5cov76BablG/0JzC2G1eRO4muaDT8PzWEcmV9koVsV+oY2svHDQly0LiM+ga6
         q7p7abAFiskSLWk4AXHlxNiLGACe/kdV+tTurRUgzsAu/hsXaPAHqGSAnFGiVqlwE1Ib
         tb+qapPZfN36dCkkE48LC5rkePxy5FzEzjZST7SvzzfM3dbSrq/CEs6H0lsZp4TxSlZ3
         jArSPX9WXgc5ToaKF0Ca9AQQR//7mmHmpN4I4GkgRs5D1Vdshkxz8E1dw7bz1GUjqjw4
         zQF+jrnulLCjhjDoJWVYNJJcEOk4ZQcsVgbJDluYHXPdeVQr5cqtwaGFTnUhtffG39n/
         +FZg==
X-Forwarded-Encrypted: i=1; AJvYcCVPTphEG39f3FJQnW4P0jWFWMRvm2sR7W5ElbLjYzrHKjclwKGP4VcrzTSKNsWpUxsSpg85/KpVw3bvEJ1VHD5APzCZLZ5Ge0kYbPvytk5Fqz0YH5jrb+Rjob+5cRGPN6M2NWYKliLtS7I=
X-Gm-Message-State: AOJu0Yw7bagTSd946sMdKvaGukjrGXLAnwoFAzZbWVB/p2zwr7dof7SE
	FT1L1LgZx7Cim8jiJxWpZcIRkOsQ8yDzyEIZ9XjdXe9bLogRshhs
X-Google-Smtp-Source: AGHT+IGp8Xl1NyteK2cTJheiqkYuxoPksdVWbAT4rxFLqcdzbR1MWL/U0yFGfpkoM2CelSanXwxOeQ==
X-Received: by 2002:ac2:4bd2:0:b0:52e:9be7:91aa with SMTP id 2adb3069b0e04-5309b259b5dmr6037212e87.10.1722245869608;
        Mon, 29 Jul 2024 02:37:49 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad41b24sm481617966b.116.2024.07.29.02.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 02:37:49 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 29 Jul 2024 11:37:37 +0200
Subject: [PATCH v2 1/2] media: i2c: tda1997x: constify
 snd_soc_component_driver struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-const_snd_soc_component_driver-v2-1-1994f44f1ec2@gmail.com>
References: <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
In-Reply-To: <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722245866; l=964;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wAda8xQPhY/5MLE9114YUL4s08mmQAnyb/WJmp3W3Q0=;
 b=VMyTy/QXOHFk3SHVvDT19NltCELdp9XjDYOsQIhbx4wsTvUrAlC+4pd5dk7/VTqxZG3pTVCol
 Ay5w0EMq1AkB3kS+nWJsctwKtLCO2KA8PB5McC/Lm/vGTVmaaQFcDeo
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


