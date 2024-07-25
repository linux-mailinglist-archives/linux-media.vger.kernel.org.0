Return-Path: <linux-media+bounces-15333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDB193BFEE
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 12:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4372E283B2C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 10:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F2B198E77;
	Thu, 25 Jul 2024 10:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihfQW398"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ED513A3E6;
	Thu, 25 Jul 2024 10:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721903505; cv=none; b=Er2ZJJP4lQIVDZkwVXR2CsuTUPMUWfkApWetdYSKy2QBhfEoSfed2lUgh6M/ye5AdoRB65IUPrtCSkYRsbDTjb/FbEE7kWERR6u8NErEkSFHWIyWA8hlgdyqUlWYR9ZN8QcpjWUDCa1a/SLNdrIOLsrkY18GjOSXEBgtp3cuOX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721903505; c=relaxed/simple;
	bh=htIX0gNZEQ2pwJvqGxD+l3IATOPpwVwt2PCD5KSSKn4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NdCgfpHKlsf/UWn1aKbxnMCKRHt21JWueA0AZu+eH2Da6UioVJOnT7KhpjP6b/EorLKghbNqiTXmlUQjDK/2tjkx8D81pQ5vkdXFDvQEaapRr9HJaN0VT8RfSl2fZS6PSSTHWrGb+VmrznCEochPQRMjXmKS9ZkYpp0aLUALcSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihfQW398; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5a2ffc34677so972145a12.2;
        Thu, 25 Jul 2024 03:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721903502; x=1722508302; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W+agGw5RSx4JruLXCZ7PbUeM/c19vYS06rQLvWj4eOM=;
        b=ihfQW398BG+dr5OH3F29rzyx+Hp5E07DSu9TtZ/8Q0simVwalmC+saJdcNwZBzl1NW
         bWuWw6nx15me2GkrZGSXeGW05wZs00NVIt7eUrhIYP+h1BfxIh+0jMKyqh8x8ULiQlce
         75ru41p60lyVpontnTrEbK5LqHIRDu/H0URu4VzNecAE++NyFNUh1N4q229+p0+hWopD
         NPW2QDLNVXgAxj4M3VejViqoz7yWyvhzPoQRbMeX91Xy8m4bIE6lfdupWK/3QT0t7vNs
         FlSUdRiyW/2d2my8hpk/VamhEPLxtl+aJ5BmLHeOAhEXgQA1whKPTKAn9Bk30R0EEXlU
         T/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721903502; x=1722508302;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+agGw5RSx4JruLXCZ7PbUeM/c19vYS06rQLvWj4eOM=;
        b=jzAa+6+SlkyCjYRa7hpOBKZ+Z7WCyOEj5y7MHQSQcxWxcwQbERaxyE7tSgxxY+GkFg
         CmuTabo4E19AsCA990lBMknMPi1soJ7Ah9knUbSv8bApPt2MXy49GYGhWvpkE90pZIgG
         BCky3m2QfE1PnYZoygb5Xf7h4cOzZOEcuV5AZZU3zeGRwhbe0eOGnYV375VvLFv+kY8w
         PghlYpA2ZXTY9QBZcnjYlgVw6y0Oi8Hh6PrzA5yMnOOH2h3R/BVQjUOAdd1d43Hb7blc
         rY3f24C+qJfif5bqXDU/E1mPajgSw3tYe/2f3tpZZHdSVGUjzdHraLf8IdKZWGMW13Z8
         xwhg==
X-Forwarded-Encrypted: i=1; AJvYcCXze995gvqLVzNN7uBnmcYMewGkWPWkKYCv9ijTtbHJLjIKsBftLpO6QL94bngX7gTuHEOAUUGpqB9s2BTlyqSoSD6kP3MdC6cxkOKRbDN5jtj2uDJs1wNgvOr49E/ybYudade6OfU1Meo=
X-Gm-Message-State: AOJu0YweBSu2VSHWnePg7j22k54QexcutZ6q6b2w38DMloivh39dHcyq
	+dp5tRP6T+dgW+ToQgqSI/sFdmxPevEDHtee6eu7oqkUk0emLnUK
X-Google-Smtp-Source: AGHT+IGAu3zvUQHfsTC/UTH4WJiceuCvU2xMUjNKMn2kBRL9RuFZai32Qp0okX0mkrFdHSC/S11Q/A==
X-Received: by 2002:a17:907:97d0:b0:a7a:ab1a:2d64 with SMTP id a640c23a62f3a-a7ac506f3a4mr176339666b.58.1721903501593;
        Thu, 25 Jul 2024 03:31:41 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad903f1sm57280766b.152.2024.07.25.03.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:31:41 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] {ASoC,media}: constify snd_soc_component_driver struct
Date: Thu, 25 Jul 2024 12:31:38 +0200
Message-Id: <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIopomYC/x3NwQqDMAyA4VeRnC24os7uVUSKttmWg4kkIgPx3
 Vc8fpf/P8FQCQ1e1QmKBxkJFzzqCtJ35g86ysXgG982T9+5JGx7NM7RJMUk6yaMvMesdKC6JfQ
 +zKFbQjtAiWyKb/rdg3G6rj8V+brQcAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721903500; l=1490;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=htIX0gNZEQ2pwJvqGxD+l3IATOPpwVwt2PCD5KSSKn4=;
 b=vBDKmvKNwCIRMMTYycPXUCa0VMk1znrRDaTVxp1ewj0Yo659ha2gfmiErmmqJzC2lEeS99wV6
 S0Y8WTWXCEJB+QZG9JPwzy0tFzzO75Pecq8vABwhbjWvw6sKrkIMHfw
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The `snd_soc_component_driver` struct is never modified after its
declaration, and its only direct user
`devm_snd_soc_register_component()` expects a constant value anyway.

Declare `snd_soc_component_driver` as const to move their declarations
to read-only sections.

Apart from a single case under media/, the affected drivers are members
of the ASoC subsystem.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      media: i2c: tda1997x: constify snd_soc_component_driver struct
      ASoC: constify snd_soc_component_driver struct

 drivers/media/i2c/tda1997x.c         | 2 +-
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
 14 files changed, 15 insertions(+), 15 deletions(-)
---
base-commit: 864b1099d16fc7e332c3ad7823058c65f890486c
change-id: 20240725-const_snd_soc_component_driver-b9629a95b948

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


