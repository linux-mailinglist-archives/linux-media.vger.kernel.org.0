Return-Path: <linux-media+bounces-33293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AB0AC2AA8
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 21:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F234AA251BD
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 19:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FE81DE3AD;
	Fri, 23 May 2025 19:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="IcM/UzdO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBDE1B4241
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 19:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748030298; cv=none; b=Dp0YoXI7WEOQ3byhHIxByabt1/53rwPmFL3J1Vls8hDb+IWK7hhDakUkHP/JmPNwVv4USFaxhod+tCXWYq9lvP9MQNkWzyytt7NK9JW3Ex7f+lHqRMo9vmT3nUJWS0hluiH2MsuIl712OcZ5ZHrNbp0E/ERSeNONlGf2o50N8Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748030298; c=relaxed/simple;
	bh=uzx2zw6N5jBzKX7wPCKkYeJQ4RXkXNTCIGYiatvDKGM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X9q2OjoVKe8lh4jfQq5yIDqZZcPXFDvxHcGRQXJGWqwe2ooWa8a0Qc1v5S85SPnmfu5wFKTSR7q36ZQjxbwXqtUQ4gYz8bUqJdiPp7jQEXt8ZLghi5M5QGPekqMDpfJRTTCNBwFfahG68M+L0NNeu5vDl2lNBlgw7ghBWSAUiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=IcM/UzdO; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so2296386d6.1
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 12:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748030292; x=1748635092; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBXpgySCD9sYHbLJ4GK3munEh4rm4TlA9wlzkhkLp50=;
        b=IcM/UzdO1w/No5rYalSALMI5acCDpZwQhn6ppvjVanKAoHlApCHadcsnbV0SWXdU2k
         0th3tAFWbuchjKWzCNmmhtRhCv6Sdl3wysODR+lraeQ+lrT4YNfW5C7BJSz5MWeSkRVS
         5tPR2YDoLPu8Jgyla4qlHIotsVefv45C51XQdWnSNO1FJz+xe0ppE0malyKUxx4qq0Ls
         OG5BZ3F1VAx3XPShPUkI5sPtB+Iwi79AYXSM63+7DmgyRBZ6ev7rgxSuMG+s2RBrHw/C
         pG3IglzXwTt9lgcz6w/qZfQ1S9ULvuQjjBffH1VglE/LRrvllbyuF/zdsOD0t9hTCk6O
         zSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748030292; x=1748635092;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JBXpgySCD9sYHbLJ4GK3munEh4rm4TlA9wlzkhkLp50=;
        b=m7wWe2AVCaR6p8gguOta5mfOfE6rRW5dJr8wqpIQsAhI8v051RF6jpc33LolNLpLAs
         fu/0WB75ZgIv6ureT7HFE8K56IrDqMibrkPiJ4nXHL5kJfZDXybbRiK9fkLzZEFhgEiZ
         068D1cvsaBnHSIJuDNieq6Hu6Ls2C7Zr5TazNGEXoOBVeAA967g1iM7jwYn3HEDbosR/
         X3UR5/GE/LmuExEEy2c+HfvqvCSHajMnKk/lVo5n8rB+AdYCor+9LtyGnN3WHTN86Mo+
         7/InLtHMW/1GFCYrpaVdmOHTHZmF/meoS3Aok7ZIugtmNK8VzlximlCgMhF6dvlW2vzi
         1Lmg==
X-Forwarded-Encrypted: i=1; AJvYcCWGsPELw4CTTldCJA+q/9OAW4CFRWwEbWj8McaIFArY/INbB5DiVGh2FvkAUuaG+tL3qYm/QbiDZ9T7xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIP9w8lVg3k+9To5OwMsNwyoPOmMRPUIpESXvUYddNwKmxy50a
	cwqR9cSTMNpCL4t3KKr333K1QDR93M3CKv9Btmk03y4YmUWHfjbriy8TY3Bwenb0kjw=
X-Gm-Gg: ASbGncuL9qzjq3M1xCksN7jNRZkg36Rtsrx2bcEO8lrV4obdHTeXAGkNvZBJW5nnAKo
	adxj8PhF0PwSxuYtU7Bd2y5zDMQVNxblAFbFUAJ4BuMGn4/pdDkxFq8mDg/pwSapaS3iRt3Fjlv
	dHBdgocY/OlMWcdtPnTD0aj6KMGmWTdv7kxceP/9jsQmcNyNNXuQOkhtt6TEjJAszvMtKVY15Q8
	HzXXMl+UhPmAz3PhuFw72FYIDFvHoFBA2LJjCkmKINuqXSPYAwUUWUC397Ds+avFI1OOs1z9bS9
	3ERzdreHmO4DWRlS/T6glvzEv6tY+QI+ZEaT/AtDlAoVr4Vm97ppmidD
X-Google-Smtp-Source: AGHT+IH6CGW/my5lxXVGW+ukzXrIeUow35nyRxL4iycIcP0BpZPvlUD0A/KP8VqCscK87BGxk4B5bg==
X-Received: by 2002:a05:6214:124b:b0:6f5:3f0a:7d22 with SMTP id 6a1803df08f44-6fa9d2c2b33mr13254146d6.37.1748030291532;
        Fri, 23 May 2025 12:58:11 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096585dsm118676356d6.83.2025.05.23.12.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:58:10 -0700 (PDT)
Message-ID: <26843d9f3c998855d96d7bbbd715ec7037bea66c.camel@ndufresne.ca>
Subject: Re: [PATCH 5/5] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael Tretter	
 <m.tretter@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Michal Simek <michal.simek@amd.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner	 <heiko@sntech.de>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,  Junhao Xie
 <bigfoot@classfun.cn>, Kever Yang <kever.yang@rock-chips.com>, Manivannan
 Sadhasivam	 <manivannan.sadhasivam@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Sebastian Fricke <sebastian.fricke@collabora.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Joe Hattori	
 <joe@pf.is.s.u-tokyo.ac.jp>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  Gaosheng Cui
 <cuigaosheng1@huawei.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <u.kleine-koenig@baylibre.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 23 May 2025 15:58:09 -0400
In-Reply-To: <20250523134207.68481-6-yassine.ouaissa@allegrodvt.com>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
	 <20250523134207.68481-6-yassine.ouaissa@allegrodvt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Yassine,

not a complete review, just covering the common.

Le vendredi 23 mai 2025 =C3=A0 15:41 +0200, Yassine Ouaissa a =C3=A9crit=C2=
=A0:
> This commit introduces a new allegro-dvt V4L2 stateful decoder driverfor
> the Gen 3 IP with support for:
> - AVC (H.264), HEVC (H.265), and JPEG decoding
> - Output formats: NV12, NV16, I420, and P010 for capture
>=20
> MAINTAINERS: Add entry for the allegro-dvt Gen 3 driver.
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/media/platform/allegro-dvt/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/media/platform/allegro-dvt/Makefile=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 1 +
> =C2=A0.../media/platform/allegro-dvt/al300/Kconfig=C2=A0 |=C2=A0=C2=A0 23=
 +
> =C2=A0.../media/platform/allegro-dvt/al300/Makefile |=C2=A0=C2=A0=C2=A0 6=
 +
> =C2=A0.../allegro-dvt/al300/al_codec_common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 754 ++++++++
> =C2=A0.../allegro-dvt/al300/al_codec_common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 247 +++
> =C2=A0.../allegro-dvt/al300/al_codec_util.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 177 ++
> =C2=A0.../allegro-dvt/al300/al_codec_util.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 185 ++
> =C2=A0.../platform/allegro-dvt/al300/al_vdec_drv.c=C2=A0 | 1530 +++++++++=
++++++++
> =C2=A0.../platform/allegro-dvt/al300/al_vdec_drv.h=C2=A0 |=C2=A0=C2=A0 94=
 +
> =C2=A011 files changed, 3019 insertions(+)
> =C2=A0create mode 100644 drivers/media/platform/allegro-dvt/al300/Kconfig
> =C2=A0create mode 100644 drivers/media/platform/allegro-dvt/al300/Makefil=
e
> =C2=A0create mode 100644 drivers/media/platform/allegro-dvt/al300/al_code=
c_common.c
> =C2=A0create mode 100644 drivers/media/platform/allegro-dvt/al300/al_code=
c_common.h
> =C2=A0create mode 100644 drivers/media/platform/allegro-dvt/al300/al_code=
c_util.c
> =C2=A0create mode 100644 drivers/media/platform/allegro-dvt/al300/al_code=
c_util.h
> =C2=A0create mode 100644 drivers/media/platform/allegro-dvt/al300/al_vdec=
_drv.c
> =C2=A0create mode 100644 drivers/media/platform/allegro-dvt/al300/al_vdec=
_drv.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9285bb2f43d9..8912fabab6ed 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -808,6 +808,7 @@ L:	linux-media@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
> =C2=A0F:	Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.ya=
ml
> +F:	drivers/media/platform/allegro-dvt/al300
> =C2=A0F:	drivers/media/platform/allegro-dvt/zynqmp
> =C2=A0
> =C2=A0ALLIED VISION ALVIUM CAMERA DRIVER
> diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/p=
latform/allegro-dvt/Kconfig
> index e9008614c27b..0d01ed0ad08a 100644
> --- a/drivers/media/platform/allegro-dvt/Kconfig
> +++ b/drivers/media/platform/allegro-dvt/Kconfig
> @@ -2,4 +2,5 @@
> =C2=A0
> =C2=A0comment "Allegro DVT media platform drivers"
> =C2=A0
> +source "drivers/media/platform/allegro-dvt/al300/Kconfig"
> =C2=A0source "drivers/media/platform/allegro-dvt/zynqmp/Kconfig"
> diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/=
platform/allegro-dvt/Makefile
> index d2aa6875edcf..c70ca19a47fb 100644
> --- a/drivers/media/platform/allegro-dvt/Makefile
> +++ b/drivers/media/platform/allegro-dvt/Makefile
> @@ -1,3 +1,4 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0
> =C2=A0
> +obj-y +=3D al300/
> =C2=A0obj-y +=3D zynqmp/
> diff --git a/drivers/media/platform/allegro-dvt/al300/Kconfig b/drivers/m=
edia/platform/allegro-dvt/al300/Kconfig
> new file mode 100644
> index 000000000000..0bc3d7a79f14
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/al300/Kconfig
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_ALLEGRO_DVT_D300
> +	tristate "Allegro DVT Video IP Decode Gen 3"
> +	depends on V4L_MEM2MEM_DRIVERS
> +	depends on VIDEO_DEV && OF && HAS_DMA
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEOBUF2_DMA_CONTIG
> +	help
> +	=C2=A0 This is a video4linux2 driver for the Allegro DVT IP Decode Gen =
3,
> +	=C2=A0 that support codecs : AVC (H.264), HEVC (H.265), and JPEG.
> +
> +	=C2=A0 The driver provides hardware acceleration for video decoding ope=
rations,
> +	=C2=A0 enabling efficient processing of compressed video streams on pla=
tforms
> +	=C2=A0 featuring this IP block. It handles memory management, buffer al=
location,
> +	=C2=A0 and decoder command sequencing to deliver optimized performance.
> +
> +	=C2=A0 The driver integrates with the V4L2 framework and videobuf2 subs=
ystem
> +	=C2=A0 to provide a standard interface for applications requiring video
> +	=C2=A0 decoding capabilities.
> +
> +	=C2=A0 To compile this driver as a module, choose M here. The module
> +	=C2=A0 will be called al300-vdec.
> diff --git a/drivers/media/platform/allegro-dvt/al300/Makefile b/drivers/=
media/platform/allegro-dvt/al300/Makefile
> new file mode 100644
> index 000000000000..3c50caccb731
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/al300/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +al300-vdec-objs :=3D al_codec_common.o al_codec_util.o
> +al300-vdec-objs +=3D al_vdec_drv.o
> +
> +obj-$(CONFIG_VIDEO_ALLEGRO_DVT_D300) +=3D al300-vdec.o
> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_common.c b=
/drivers/media/platform/allegro-
> dvt/al300/al_codec_common.c
> new file mode 100644
> index 000000000000..0aee82b6335a
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_common.c
> @@ -0,0 +1,754 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Core MCU functionality including firmware loading,
> + * memory allocation, and general MCU interaction interfaces
> + *
> + * Copyright (c) 2025 Allegro DVT.
> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
> + */
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/firmware.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +#include "al_codec_common.h"
> +
> +#define AL_CODEC_UID 0x0000
> +#define AL_CODEC_RESET 0x0010
> +#define AL_CODEC_IRQ_MASK 0x0014
> +#define AL_CODEC_IRQ_STATUS_CLEAR 0x0018
> +#define AL_CODEC_MCU_CLK 0x0400
> +#define AL_CODEC_MCU_RST 0x0404
> +#define AL_CODEC_MCU_IRQ 0x040C
> +#define AL_CODEC_MCU_BOOT_ADDR_HI 0x0410
> +#define AL_CODEC_MCU_BOOT_ADDR_LO 0x0414
> +#define AL_CODEC_MCU_IP_START_ADDR_HI 0x0418
> +#define AL_CODEC_MCU_IP_START_ADDR_LO 0x041C
> +#define AL_CODEC_MCU_IP_END_ADDR_HI 0x0420
> +#define AL_CODEC_MCU_IP_END_ADDR_LO 0x0424
> +#define AL_CODEC_MCU_PERIPH_ADDR_HI 0x0428
> +#define AL_CODEC_MCU_PERIPH_ADDR_LO 0x042C
> +#define AL_CODEC_MCU_IRQ_MASK 0x0440
> +#define AL_CODEC_INST_OFFSET_HI 0x0450
> +#define AL_CODEC_INST_OFFSET_LO 0x0454
> +#define AL_CODEC_DATA_OFFSET_HI 0x0458
> +#define AL_CODEC_DATA_OFFSET_LO 0x045C
> +
> +#define AL_CODEC_UID_ID 0x30AB6E51
> +#define AL_CODEC_IRQ_MCU_2_CPU BIT(30)
> +#define AL_CODEC_IP_OFFSET GENMASK(26, 25)
> +#define AL_CODEC_APB_MASK GENMASK(26, 0)
> +#define AL_CODEC_MAX_ADDR GENMASK_ULL(38, 0)
> +
> +#define AL_CODEC_MCU_BOOT_RESET_WAIT 2 /* in ms */
> +#define AL_CODEC_REG_ENABLE BIT(0)
> +#define AL_CODEC_REG_DISABLE 0
> +
> +/*
> + * struct codec_dma_buf - Allocated dma buffer
> + *
> + * @list: list head for buffer queue
> + * @paddr: physical address of the allcated DMA buffer
> + * @vaddr: virtual address of the allocated DMA buffer
> + * @size: Size of allocated dma memory
> + */
> +struct codec_dma_buf {
> +	void *vaddr;
> +	dma_addr_t paddr;
> +	u32 size;
> +	struct list_head list;
> +};
> +
> +struct mb_header {
> +	u64 start;
> +	u64 end;
> +} __packed;
> +
> +struct boot_header {
> +	u32 bh_version;
> +	u32 fw_version;
> +	char model[16];
> +	u64 vaddr_start;
> +	u64 vaddr_end;
> +	u64 vaddr_boot;
> +	struct mb_header h2m;
> +	struct mb_header m2h;
> +	u64 machine_id;
> +	/* fill by driver before fw boot */
> +	u64 ip_start;
> +	u64 ip_end;
> +	u64 mcu_clk_rate;
> +} __packed;
> +
> +static u32 al_common_read(struct al_codec_dev *dev, u32 offset)
> +{
> +	return readl(dev->regs + offset);
> +}
> +
> +static void al_common_write(struct al_codec_dev *dev, u32 offset, u32 va=
l)
> +{
> +	writel(val, dev->regs + offset);
> +}
> +
> +static void al_common_trigger_mcu_irq(void *arg)
> +{
> +	struct al_codec_dev *dev =3D arg;
> +
> +	al_common_write(dev, AL_CODEC_MCU_IRQ, BIT(0));
> +}
> +
> +static inline void al_common_reset(struct al_codec_dev *dev)
> +{
> +	/* reset ip */
> +	al_common_write(dev, AL_CODEC_RESET, AL_CODEC_REG_ENABLE);
> +
> +	/* reset and stop mcu */
> +	al_common_write(dev, AL_CODEC_MCU_CLK, AL_CODEC_REG_ENABLE);
> +	al_common_write(dev, AL_CODEC_MCU_RST, AL_CODEC_REG_ENABLE);
> +	/* time to reset the mct */
> +	mdelay(AL_CODEC_MCU_BOOT_RESET_WAIT);
> +	al_common_write(dev, AL_CODEC_MCU_CLK, AL_CODEC_REG_DISABLE);
> +
> +	al_common_write(dev, AL_CODEC_MCU_IRQ, AL_CODEC_REG_DISABLE);
> +	al_common_write(dev, AL_CODEC_MCU_IRQ_MASK, AL_CODEC_REG_DISABLE);
> +
> +	mdelay(AL_CODEC_MCU_BOOT_RESET_WAIT * 5);
> +	al_common_write(dev, AL_CODEC_MCU_RST, AL_CODEC_REG_DISABLE);
> +}
> +
> +static int al_common_setup_hw_regs(struct al_codec_dev *dev)
> +{
> +	u64 reg_start, reg_end;
> +	dma_addr_t boot_addr;
> +	unsigned int id;
> +
> +	id =3D al_common_read(dev, AL_CODEC_UID);
> +
> +	if (id !=3D AL_CODEC_UID_ID) {
> +		al_codec_err(dev, "bad device id, expected 0x%08x, got 0x%08x",
> +			=C2=A0=C2=A0=C2=A0=C2=A0 AL_CODEC_UID_ID, id);
> +		return -ENODEV;
> +	}
> +
> +	boot_addr =3D dev->firmware.phys + dev->firmware.bin_data.offset;
> +
> +	/* Reset MCU step */
> +	al_common_reset(dev);
> +
> +	/* Configure the MCU*/
> +	al_common_write(dev, AL_CODEC_IRQ_MASK, AL_CODEC_IRQ_MCU_2_CPU);
> +	/* Set Instruction and data offset */
> +	al_common_write(dev, AL_CODEC_INST_OFFSET_HI, 0);
> +	al_common_write(dev, AL_CODEC_INST_OFFSET_LO, 0);
> +	al_common_write(dev, AL_CODEC_DATA_OFFSET_HI, 0);
> +	al_common_write(dev, AL_CODEC_DATA_OFFSET_LO, 0);
> +
> +	reg_start =3D dev->regs_info->start;
> +	reg_end =3D reg_start + resource_size(dev->regs_info);
> +	al_common_write(dev, AL_CODEC_MCU_IP_START_ADDR_HI,
> +			upper_32_bits(reg_start));
> +	al_common_write(dev, AL_CODEC_MCU_IP_START_ADDR_LO,
> +			lower_32_bits(reg_start));
> +	al_common_write(dev, AL_CODEC_MCU_IP_END_ADDR_HI,
> +			upper_32_bits(reg_end));
> +	al_common_write(dev, AL_CODEC_MCU_IP_END_ADDR_HI,
> +			lower_32_bits(reg_end));
> +
> +	al_common_write(dev, AL_CODEC_MCU_PERIPH_ADDR_HI,
> +			upper_32_bits(dev->apb));
> +	al_common_write(dev, AL_CODEC_MCU_PERIPH_ADDR_LO,
> +			lower_32_bits(dev->apb));
> +
> +	al_common_write(dev, AL_CODEC_MCU_BOOT_ADDR_HI,
> +			upper_32_bits(boot_addr));
> +	al_common_write(dev, AL_CODEC_MCU_BOOT_ADDR_LO,
> +			lower_32_bits(boot_addr));
> +
> +	return 0;
> +}
> +
> +static void al_common_dma_buf_insert(struct al_codec_dev *dev,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct codec_dma_buf *buf)
> +{
> +	mutex_lock(&dev->buf_lock);

For new drivers, I encourage using:

	guard(mutex)(&dev->buf_lock);

> +	list_add(&buf->list, &dev->alloc_buffers);
> +	mutex_unlock(&dev->buf_lock);

And you can drop this line, it will be unlock one you exist the scope. For =
more
complex function it simplify the error handling and reduce risk of forgetti=
ng to
unlock. Please apply over the entire driver if you agree to.

> +}
> +
> +static void al_common_dma_buf_remove(struct al_codec_dev *dev,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct codec_dma_buf *buf)
> +{
> +	mutex_lock(&dev->buf_lock);
> +	list_del(&buf->list);
> +	mutex_unlock(&dev->buf_lock);
> +}
> +
> +static struct codec_dma_buf *al_common_dma_buf_lookup(struct al_codec_de=
v *dev,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t buf_paddr)
> +{
> +	struct codec_dma_buf *buf =3D NULL;
> +
> +	mutex_lock(&dev->buf_lock);
> +	list_for_each_entry(buf, &dev->alloc_buffers, list)
> +		if (likely(buf->paddr =3D=3D buf_paddr))
> +			break;
> +
> +	mutex_unlock(&dev->buf_lock);
> +
> +	return list_entry_is_head(buf, &dev->alloc_buffers, list) ? NULL : buf;

This is currently not thread safe, the usage of guard will fix it without t=
he need
for an intermediate variable.

Note that while it can be made thread safe, this won't be memory safe, sinc=
e there
is no ref-count around buf to ensure its not freed in another thread. And i=
f this
case does not exists, then the entire locking seems to be pointless and sho=
uld be
reconsidered.

Please provide feedback, I would likely get a better idea once I'm passed t=
he
common helper, but then it will take more time.

> +}
> +
> +static void al_common_dma_buf_cleanup(struct al_codec_dev *dev)
> +{
> +	struct codec_dma_buf *buf, *tmp;
> +
> +	mutex_lock(&dev->buf_lock);
> +	list_for_each_entry_safe(buf, tmp, &dev->alloc_buffers, list) {
> +		dma_free_coherent(&dev->pdev->dev, buf->size, buf->vaddr,
> +				=C2=A0 buf->paddr);
> +		list_del(&buf->list);
> +		kfree(buf);
> +	}
> +	mutex_unlock(&dev->buf_lock);
> +}
> +
> +static int al_common_setup_dma(struct al_codec_dev *dev)
> +{
> +	int ret;
> +
> +	/* setup dma memory mask */
> +	ret =3D dma_set_mask_and_coherent(&dev->pdev->dev, DMA_BIT_MASK(64));

If you change this to DMA_BIT_MASK(39), prehaps your can drop the check bel=
ow ?

> +	if (ret) {
> +		al_codec_err(dev, "failed to set dma");
> +		return -EINVAL;
> +	}
> +
> +	/* Try to use reserved memory if we got one */
> +	ret =3D of_reserved_mem_device_init(&dev->pdev->dev);
> +	if (ret && ret !=3D ENODEV)
> +		dev_warn(&dev->pdev->dev,
> +			 "No reserved memory, use cma instead\n");
> +
> +	return 0;
> +}
> +
> +static void *al_common_dma_alloc(struct al_codec_dev *dev, size_t size,
> +				 dma_addr_t *paddr, gfp_t flag)
> +{
> +	void *vaddr;
> +
> +	vaddr =3D dma_alloc_coherent(&dev->pdev->dev, size, paddr, flag);
> +
> +	if (!vaddr)
> +		return NULL;
> +
> +	/* PADDR <=3D (2^39 - 1) (39-bit MCU PADDR) */
> +	if ((*paddr + size) > AL_CODEC_MAX_ADDR) {

This one.

> +		al_codec_err(dev, "mem check failed for 0x%16llx of size %zu",
> +			=C2=A0=C2=A0=C2=A0=C2=A0 *paddr, size);
> +		dma_free_coherent(&dev->pdev->dev, size, vaddr, *paddr);
> +		return NULL;
> +	}
> +
> +	return vaddr;
> +}
> +
> +void al_common_remove(struct al_codec_dev *dev)
> +{
> +	al_common_dma_buf_cleanup(dev);
> +
> +	/* reset device */
> +	al_common_reset(dev);
> +	clk_disable_unprepare(dev->clk);
> +	dma_free_coherent(&dev->pdev->dev, dev->firmware.size,
> +			=C2=A0 dev->firmware.virt, dev->firmware.phys);
> +
> +	if (dev->firmware.firmware)
> +		release_firmware(dev->firmware.firmware);
> +}
> +
> +static void handle_alloc_memory_req(struct al_codec_dev *dev,
> +				=C2=A0=C2=A0=C2=A0 struct msg_itf_header *hdr)
> +{
> +	struct msg_itf_alloc_mem_reply_full reply;
> +	struct msg_itf_alloc_mem_req req;
> +	struct codec_dma_buf *buf;
> +	int ret;
> +
> +	reply.reply.phyAddr =3D 0;
> +	reply.hdr.type =3D MSG_ITF_TYPE_ALLOC_MEM_REPLY;
> +	/* both fields embed info need to finish request */
> +	reply.hdr.drv_ctx_hdl =3D hdr->drv_ctx_hdl;
> +	reply.hdr.drv_cmd_hdl =3D hdr->drv_cmd_hdl;
> +	reply.hdr.payload_len =3D sizeof(reply.reply);

Its always nicer if things are fully initialize in myopinion, so
I encourage to use static initialiser:

	struct msg_itf_alloc_mem_reply_full reply =3D {
		.reply.phyAddr =3D 0,
		.reply.hdr.type =3D MSG_ITF_TYPE_ALLOC_MEM_REPLY,
		...
	 };

Or the old school memset to zero. Probably not a strict rule, but
clearly good practices.

> +
> +	ret =3D al_common_get_data(dev, (char *)&req, hdr->payload_len);
> +	if (ret) {
> +		al_codec_err(dev, "Unable to get cma req");
> +		return;
> +	}
> +
> +	buf =3D kmalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		goto send_reply;

Its not obvious to me why you'd still want to send the request in case
you ran out of memory. Since you didn't really do anything yet,
just return ? Consider adding a return value to your helper, so you can
propagate -ENONMEM.

> +
> +	buf->size =3D req.uSize;
> +	buf->vaddr =3D
> +		al_common_dma_alloc(dev, req.uSize, &buf->paddr, GFP_KERNEL);
> +	if (!buf->vaddr)
> +		goto send_reply;
> +
> +	reply.reply.phyAddr =3D (u64)buf->paddr;
> +	al_common_dma_buf_insert(dev, buf);
> +
> +send_reply:

I'd name this "send_request", you actually will receive a reply.

> +	ret =3D al_common_send(dev, &reply.hdr);
> +	if (ret) {
> +		al_codec_err(dev, "Unable to reply to cma alloc");
> +		al_common_dma_buf_remove(dev, buf);
> +	}

Try to propagate ret, silent failures are the worse.

> +}
> +
> +static void handle_free_memory_req(struct al_codec_dev *dev,
> +				=C2=A0=C2=A0 struct msg_itf_header *hdr)
> +{

Please apply previous comments to the rest.

> +	struct msg_itf_free_mem_reply_full reply;
> +	struct msg_itf_free_mem_req req;
> +	struct codec_dma_buf *buf;
> +	int ret;
> +
> +	reply.hdr.type =3D MSG_ITF_TYPE_FREE_MEM_REPLY;
> +	/* both fields embed info need to hinish request */
> +	reply.hdr.drv_ctx_hdl =3D hdr->drv_ctx_hdl;
> +	reply.hdr.drv_cmd_hdl =3D hdr->drv_cmd_hdl;
> +	reply.hdr.payload_len =3D sizeof(reply.reply);
> +	reply.reply.ret =3D -1;
> +
> +	ret =3D al_common_get_data(dev, (char *)&req, hdr->payload_len);
> +	if (ret) {
> +		al_codec_err(dev, "Unable to put cma req");
> +		return;
> +	}
> +
> +	buf =3D al_common_dma_buf_lookup(dev, req.phyAddr);
> +	al_codec_dbg(dev, "req.phyAddr =3D %p =3D> %p, Size %d",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 (void *)(long)req.phyAddr, buf, buf->size);
> +	if (!buf) {
> +		al_codec_err(dev, "Unable to get dma handle for %p",
> +			=C2=A0=C2=A0=C2=A0=C2=A0 (void *)(long)req.phyAddr);
> +		reply.reply.ret =3D -EINVAL;
> +		goto send_reply;
> +	}
> +
> +	dma_free_coherent(&dev->pdev->dev, buf->size, buf->vaddr, buf->paddr);
> +	al_common_dma_buf_remove(dev, buf);
> +	reply.reply.ret =3D 0;
> +
> +send_reply:
> +	ret =3D al_common_send(dev, &reply.hdr);
> +	if (ret)
> +		al_codec_err(dev, "Unable to reply to cma free");
> +}
> +
> +static void handle_mcu_console_print(struct al_codec_dev *dev,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct msg_itf_header *hdr)
> +{
> +#if defined(DEBUG)

I would use #ifdef DEBUG, just a preference. Quick grep, its 1099 time that
way, rather then using defined (99 times).

> +	struct msg_itf_write_req *req;
> +	int ret;
> +
> +	/* one more byte to be sure to have a zero terminated string */
> +	req =3D kzalloc(hdr->payload_len + 1, GFP_KERNEL);
> +	if (!req) {
> +		al_common_skip_data(dev, hdr->payload_len);
> +		al_codec_err(dev, "Unable to alloc memory");
> +		return;
> +	}
> +
> +	ret =3D al_codec_msg_get_data(&dev->mb_m2h, (char *)req,
> +				=C2=A0=C2=A0=C2=A0 hdr->payload_len);
> +	if (ret) {
> +		al_codec_err(dev, "Unable to get request");
> +		kfree(req);
> +		return;
> +	}
> +
> +	/* Print the mcu logs */
> +	dev_dbg(&dev->pdev->dev, "[ALG_MCU] %s(),%d: %s\n", __func__, __LINE__,
> +		(char *)(req + 1));
> +	kfree(req);
> +#else
> +	al_common_skip_data(dev, hdr->payload_len);
> +#endif
> +}
> +
> +static void process_one_message(struct al_codec_dev *dev,
> +				struct msg_itf_header *hdr)
> +{
> +	switch (hdr->type) {
> +	case MSG_ITF_TYPE_ALLOC_MEM_REQ:
> +		handle_alloc_memory_req(dev, hdr);
> +		break;
> +	case MSG_ITF_TYPE_FREE_MEM_REQ:
> +		handle_free_memory_req(dev, hdr);
> +		break;
> +	case MSG_ITF_TYPE_WRITE_REQ:
> +		handle_mcu_console_print(dev, hdr);
> +		break;
> +	case MSG_ITF_TYPE_MCU_ALIVE:
> +		complete(&dev->completion);
> +		break;
> +	default:
> +		dev->process_msg_cb(dev->cb_arg, hdr);
> +		break;
> +	}
> +}
> +
> +static irqreturn_t al_common_irq_handler(int irq, void *data)
> +{
> +	struct al_codec_dev *dev =3D data;
> +	struct msg_itf_header hdr;
> +	int ret;
> +
> +	/* poll all messages */
> +	while (1) {
> +		ret =3D al_codec_msg_get_header(&dev->mb_m2h, &hdr);
> +		if (ret)
> +			break;
> +
> +		process_one_message(dev, &hdr);
> +	}

Since ret is unused, perhaps ?

	while (al_codec_msg_get_header(&dev->mb_m2h, &hdr) =3D=3D 0)
		process_one_message(dev, &hdr);


> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t al_common_hardirq_handler(int irq, void *data)
> +{
> +	struct al_codec_dev *dev =3D data;
> +	u32 irq_status;
> +
> +	irq_status =3D al_common_read(dev, AL_CODEC_IRQ_STATUS_CLEAR);
> +	if (!irq_status)
> +		return IRQ_NONE;
> +
> +	al_common_write(dev, AL_CODEC_IRQ_STATUS_CLEAR, AL_CODEC_IRQ_MCU_2_CPU)=
;
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static int al_common_start_fw(struct al_codec_dev *dev)
> +{
> +	/* Enable the MCU clock */
> +	al_common_write(dev, AL_CODEC_MCU_CLK, AL_CODEC_REG_ENABLE);
> +
> +	return !wait_for_completion_timeout(&dev->completion, 2 * HZ);
> +}
> +
> +static void al_common_copy_firmware_image(struct al_codec_dev *dev)
> +{
> +	const struct firmware *firmware =3D dev->firmware.firmware;
> +	u32 *virt =3D dev->firmware.virt;
> +	size_t i;
> +
> +	/* copy the whole thing taking into account endianness */
> +	for (i =3D 0; i < firmware->size / sizeof(u32); i++)

These days you can declare in the for loop scope:

	for (size_t i =3D 0; i < firmware->size / sizeof(u32); i++)

> +		virt[i] =3D le32_to_cpu(((__le32 *)firmware->data)[i]);
> +}
> +
> +static int al_common_read_firmware(struct al_codec_dev *dev, const char =
*name)
> +{
> +	struct platform_device *pdev =3D dev->pdev;
> +	const struct boot_header *bh;
> +	int err;
> +
> +	/* request_firmware prints error if it fails */
> +	err =3D request_firmware(&dev->firmware.firmware, name, &pdev->dev);
> +	if (err < 0)
> +		return err;
> +
> +	bh =3D (struct boot_header *)dev->firmware.firmware->data;
> +	dev->firmware.size =3D bh->vaddr_end - bh->vaddr_start;
> +
> +	return 0;
> +}
> +
> +static int al_common_parse_firmware_image(struct al_codec_dev *dev)
> +{
> +	struct boot_header *bh =3D (void *)dev->firmware.virt;
> +
> +	if (bh->bh_version < AL_BOOT_VERSION(2, 0, 0) ||
> +	=C2=A0=C2=A0=C2=A0 bh->bh_version >=3D AL_BOOT_VERSION(3, 0, 0)) {

Good to know that firmware 2.X is used for Gen 3, I would have got
confused.

> +		al_codec_err(dev, "Unsupported firmware version");
> +		return -EINVAL;
> +	}
> +
> +	dev->firmware.bin_data.offset =3D bh->vaddr_boot - bh->vaddr_start;
> +	dev->firmware.bin_data.size =3D bh->vaddr_end - bh->vaddr_start;
> +
> +	dev->firmware.mb_h2m.offset =3D bh->h2m.start - bh->vaddr_start;
> +	dev->firmware.mb_h2m.size =3D bh->h2m.end - bh->h2m.start;
> +	dev->firmware.mb_m2h.offset =3D bh->m2h.start - bh->vaddr_start;
> +	dev->firmware.mb_m2h.size =3D bh->m2h.end - bh->m2h.start;
> +
> +	/* Override some data */
> +	bh->ip_start =3D dev->apb + AL_CODEC_IP_OFFSET;
> +	bh->ip_end =3D bh->ip_start + resource_size(dev->regs_info);
> +	bh->mcu_clk_rate =3D clk_get_rate(dev->clk);
> +
> +	al_codec_dbg(dev, "bh version=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x%08x", bh->=
bh_version);
> +	al_codec_dbg(dev, "fw version=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x%08x", bh->=
fw_version);
> +	al_codec_dbg(dev, "fw model=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D %s"=
, bh->model);
> +	al_codec_dbg(dev, "vaddress start =3D 0x%016llx", bh->vaddr_start);
> +	al_codec_dbg(dev, "vaddress end=C2=A0=C2=A0 =3D 0x%016llx", bh->vaddr_e=
nd);
> +	al_codec_dbg(dev, "boot address=C2=A0=C2=A0 =3D 0x%016llx", bh->vaddr_b=
oot);
> +	al_codec_dbg(dev, "machineid=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D %lld", b=
h->machine_id);
> +	al_codec_dbg(dev, "periph address =3D 0x%016llx", dev->apb);
> +	al_codec_dbg(dev, "ip start=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x%016llx", bh-=
>ip_start);
> +	al_codec_dbg(dev, "ip end=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x%01=
6llx", bh->ip_end);
> +	al_codec_dbg(dev, "mcu clk	=3D %llu", bh->mcu_clk_rate);
> +
> +	return 0;
> +}
> +
> +static int al_common_load_firmware_start(struct al_codec_dev *dev,
> +					 const char *name)
> +{
> +	struct platform_device *pdev =3D dev->pdev;
> +	dma_addr_t phys;
> +	size_t size;
> +	void *virt;
> +	int err;
> +
> +	if (dev->firmware.virt)
> +		return 0;
> +
> +	err =3D al_common_read_firmware(dev, name);
> +	if (err)
> +		return err;
> +
> +	size =3D dev->firmware.size;
> +
> +	virt =3D dma_alloc_coherent(&pdev->dev, size, &phys, GFP_KERNEL);
> +	err =3D dma_mapping_error(&pdev->dev, phys);
> +	if (err < 0)
> +		return err;
> +
> +	dev->firmware.virt =3D virt;
> +	dev->firmware.phys =3D phys;
> +
> +	al_common_copy_firmware_image(dev);
> +	err =3D al_common_parse_firmware_image(dev);
> +	if (err) {
> +		al_codec_err(dev, "failed to parse firmware image");
> +		goto cleanup;
> +	}
> +
> +	err =3D al_common_setup_hw_regs(dev);
> +	if (err) {
> +		al_codec_err(dev, "Unable to setup hw registers");
> +		goto cleanup;
> +	}
> +
> +	al_codec_mb_init(&dev->mb_h2m, virt + dev->firmware.mb_h2m.offset,
> +			 dev->firmware.mb_h2m.size, MB_IFT_MAGIC_H2M);
> +
> +	al_codec_mb_init(&dev->mb_m2h, virt + dev->firmware.mb_m2h.offset,
> +			 dev->firmware.mb_m2h.size, MB_IFT_MAGIC_M2H);
> +
> +	err =3D al_common_start_fw(dev);
> +	if (err) {
> +		al_codec_err(dev, "fw start has failed");
> +		goto cleanup;
> +	}
> +
> +	al_codec_dbg(dev, "mcu has boot successfully !");
> +	dev->fw_ready_cb(dev->cb_arg);
> +
> +	release_firmware(dev->firmware.firmware);
> +	dev->firmware.firmware =3D NULL;
> +
> +	return 0;
> +cleanup:
> +	dma_free_coherent(&pdev->dev, size, virt, phys);
> +
> +	return err;
> +}
> +
> +static u64 al_common_get_periph_addr(struct al_codec_dev *dev)
> +{
> +	struct resource *res;
> +
> +	res =3D platform_get_resource_byname(dev->pdev, IORESOURCE_MEM, "apb");
> +	if (!res) {
> +		al_codec_err(dev, "Unable to find APB start address");
> +		return 0;
> +	}
> +
> +	if (res->start & AL_CODEC_APB_MASK) {
> +		al_codec_err(dev, "APB start address is invalid");
> +		return 0;
> +	}
> +
> +	return res->start;
> +}
> +
> +int al_common_probe(struct al_codec_dev *dev, const char *name)
> +{
> +	struct platform_device *pdev =3D dev->pdev;
> +	int irq;
> +	int ret;
> +
> +	mutex_init(&dev->buf_lock);

Ad this stage, you driver is not yes active, can it really be concurrent ?

> +	INIT_LIST_HEAD(&dev->alloc_buffers);
> +	init_completion(&dev->completion);
> +
> +	/* setup dma memory */
> +	ret =3D al_common_setup_dma(dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Hw registers */
> +	dev->regs_info =3D
> +		platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
> +	if (!dev->regs_info) {
> +		al_codec_err(dev, "regs resource missing from device tree");
> +		return -EINVAL;
> +	}
> +
> +	dev->regs =3D devm_ioremap_resource(&pdev->dev, dev->regs_info);
> +	if (!dev->regs) {
> +		al_codec_err(dev, "failed to map registers");
> +		return -ENOMEM;
> +	}
> +
> +	dev->apb =3D al_common_get_periph_addr(dev);
> +	if (!dev->apb)
> +		return -EINVAL;
> +
> +	/* The MCU has already default clock value */
> +	dev->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(dev->clk)) {
> +		al_codec_err(dev, "failed to get MCU core clock");
> +		return PTR_ERR(dev->clk);
> +	}
> +
> +	ret =3D clk_prepare_enable(dev->clk);
> +	if (ret) {
> +		al_codec_err(dev, "Cannot enable MCU clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		al_codec_err(dev, "Failed to get IRQ");
> +		ret =3D -EINVAL;
> +		goto disable_clk;
> +	}
> +
> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq,
> +					al_common_hardirq_handler,
> +					al_common_irq_handler, IRQF_SHARED,
> +					dev_name(&pdev->dev), dev);
> +	if (ret) {
> +		al_codec_err(dev, "Unable to register irq handler");
> +		goto disable_clk;
> +	}
> +
> +	/* ok so request the fw */
> +	ret =3D al_common_load_firmware_start(dev, name);
> +	if (ret) {
> +		al_codec_err(dev, "failed to load firmware : %s", name);
> +		goto disable_clk;
> +	}
> +
> +	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(dev->clk);

Please double check if anything else need cleanup on failures.

> +
> +	return ret;
> +}
> +
> +int al_common_send(struct al_codec_dev *dev, struct msg_itf_header *hdr)
> +{
> +	return al_codec_msg_send(&dev->mb_h2m, hdr, al_common_trigger_mcu_irq,
> +				 dev);
> +}
> +
> +int al_common_send_req_reply(struct al_codec_dev *dev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head *cmd_list,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct msg_itf_header *hdr,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct al_common_mcu_req *req)
> +{
> +	struct al_codec_cmd *cmd =3D NULL;
> +	int ret;
> +
> +	hdr->drv_cmd_hdl =3D 0;
> +
> +	if (req->reply_size && req->reply) {
> +		cmd =3D al_codec_cmd_create(req->reply_size);
> +		if (!cmd)
> +			return -ENOMEM;
> +
> +		hdr->drv_cmd_hdl =3D al_virt_to_phys(cmd);
> +	}
> +
> +	hdr->drv_ctx_hdl =3D req->pCtx;
> +	hdr->type =3D req->req_type;
> +	hdr->payload_len =3D req->req_size;
> +
> +	/* Add the list to the cmd list */
> +	if (cmd)
> +		list_add(&cmd->list, cmd_list);
> +
> +	ret =3D al_common_send(dev, hdr);
> +	if (ret)
> +		goto remove_cmd;
> +
> +	al_codec_dbg(dev, "Send req to mcu %d : %ld ", req->req_type,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 req->req_size);
> +
> +	if (!cmd)
> +		return 0;
> +
> +	ret =3D wait_for_completion_timeout(&cmd->done, 5 * HZ);
> +	if (ret <=3D 0) {
> +		al_codec_err(dev, "cmd %p has %d (%s)", cmd, ret,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 (ret =3D=3D 0) ? "failed" : "timedout");
> +		ret =3D -ETIMEDOUT;
> +		goto remove_cmd;
> +	}
> +
> +	ret =3D 0;
> +	memcpy(req->reply, cmd->reply, req->reply_size);
> +
> +remove_cmd:
> +
> +	if (cmd) {
> +		list_del(&cmd->list);
> +		al_codec_cmd_put(cmd);
> +	}
> +	return ret;
> +}
> +
> +bool al_common_mcu_is_alive(struct al_codec_dev *dev)
> +{
> +	static const struct msg_itf_header hdr =3D {
> +		.type =3D MSG_ITF_TYPE_MCU_ALIVE,
> +		.payload_len =3D 0,
> +	};
> +	int ret;
> +
> +	ret =3D al_common_send(dev, (struct msg_itf_header *)&hdr);
> +	if (ret)
> +		return false;
> +
> +	ret =3D wait_for_completion_timeout(&dev->completion, 5 * HZ);
> +	if (ret <=3D 0)
> +		return false;
> +
> +	return true;
> +}

I've stopped here, but hopefully feedback is better then no feedback.

regards,
Nicolas

> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_common.h b=
/drivers/media/platform/allegro-
> dvt/al300/al_codec_common.h
> new file mode 100644
> index 000000000000..41373bbf3671
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_common.h
> @@ -0,0 +1,247 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2025 Allegro DVT.
> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
> + */
> +
> +#ifndef __AL_CODEC_COMMON__
> +#define __AL_CODEC_COMMON__
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <media/v4l2-device.h>
> +
> +#include "al_codec_util.h"
> +
> +#define fh_to_ctx(ptr, type) container_of(ptr, type, fh)
> +
> +enum {
> +	MSG_ITF_TYPE_CREATE_INST_REQ =3D MSG_ITF_TYPE_NEXT_REQ,
> +	MSG_ITF_TYPE_DESTROY_INST_REQ,
> +	MSG_ITF_TYPE_PUSH_BITSTREAM_BUFFER_REQ,
> +	MSG_ITF_TYPE_PUT_DISPLAY_PICTURE_REQ,
> +	MSG_ITF_TYPE_FLUSH_REQ,
> +	MSG_ITF_TYPE_INFO_REQ,
> +	MSG_ITF_TYPE_CREATE_INST_REPLY =3D MSG_ITF_TYPE_NEXT_REPLY,
> +	MSG_ITF_TYPE_DESTROY_INST_REPLY,
> +	MSG_ITF_TYPE_PUSH_BITSTREAM_BUFFER_REPLY,
> +	MSG_ITF_TYPE_PUT_DISPLAY_PICTURE_REPLY,
> +	MSG_ITF_TYPE_FLUSH_REPLY,
> +	MSG_ITF_TYPE_INFO_REPLY,
> +	MSG_ITF_TYPE_EVT_ERROR =3D MSG_ITF_TYPE_NEXT_EVT,
> +};
> +
> +struct msg_itf_write_req {
> +	u32 fd;
> +	u32 len;
> +	/* payload follow */
> +} __packed;
> +DECLARE_FULL_REQ(msg_itf_write_req);
> +
> +struct msg_itf_free_mem_req {
> +	phys_addr_t phyAddr;
> +} __packed;
> +DECLARE_FULL_REQ(msg_itf_free_mem_req);
> +
> +struct msg_itf_alloc_mem_req {
> +	u64 uSize;
> +} __packed;
> +DECLARE_FULL_REQ(msg_itf_alloc_mem_req);
> +
> +struct msg_itf_alloc_mem_reply {
> +	phys_addr_t phyAddr;
> +} __packed;
> +DECLARE_FULL_REPLY(msg_itf_alloc_mem_reply);
> +
> +struct msg_itf_free_mem_reply {
> +	s64 ret;
> +};
> +DECLARE_FULL_REPLY(msg_itf_free_mem_reply);
> +
> +struct msg_itf_create_codec_reply {
> +	phys_addr_t hCodec;
> +	s32 ret;
> +} __packed;
> +DECLARE_FULL_REPLY(msg_itf_create_codec_reply);
> +
> +struct msg_itf_destroy_codec_req {
> +	phys_addr_t hCodec;
> +} __packed;
> +DECLARE_FULL_REQ(msg_itf_destroy_codec_req);
> +
> +/*
> + * Note : no need to know the status of this request
> + * The codec should be destroyed, in case of the mcu
> + * hasn't received any request with the codec handler
> + */
> +struct msg_itf_destroy_codec_reply {
> +	u32 unused;
> +} __packed;
> +DECLARE_FULL_REPLY(msg_itf_destroy_codec_reply);
> +
> +struct al_buffer_meta {
> +	u64 timestamp;
> +	struct v4l2_timecode timecode;
> +	bool last;
> +};
> +
> +struct msg_itf_push_src_buf_req {
> +	phys_addr_t hCodec;
> +	phys_addr_t bufferHandle;
> +	phys_addr_t phyAddr;
> +	u64 size;
> +	struct al_buffer_meta meta;
> +} __packed;
> +DECLARE_FULL_REQ(msg_itf_push_src_buf_req);
> +
> +struct msg_itf_push_dst_buf_req {
> +	phys_addr_t hCodec;
> +	phys_addr_t bufferHandle;
> +	phys_addr_t phyAddr;
> +	u64 size;
> +} __packed;
> +DECLARE_FULL_REQ(msg_itf_push_dst_buf_req);
> +
> +struct msg_itf_push_buffer_req {
> +	phys_addr_t hCodec;
> +	phys_addr_t bufferHandle;
> +	phys_addr_t phyAddr;
> +	u64 size;
> +} __packed;
> +DECLARE_FULL_REQ(msg_itf_push_buffer_req);
> +
> +struct msg_itf_push_buffer_reply {
> +	s32 res;
> +} __packed;
> +DECLARE_FULL_REPLY(msg_itf_push_buffer_reply);
> +
> +struct msg_itf_info_req {
> +	u64 unused;
> +} __packed;
> +DECLARE_FULL_REQ(msg_itf_info_req);
> +
> +struct msg_itf_flush_req {
> +	phys_addr_t hCodec;
> +} __packed;
> +DECLARE_FULL_REQ(msg_itf_flush_req);
> +
> +struct msg_itf_flush_reply {
> +	int32_t unused;
> +} __packed;
> +DECLARE_FULL_REPLY(msg_itf_flush_reply);
> +
> +struct msg_itf_evt_error {
> +	uint32_t errno;
> +} __packed;
> +DECLARE_FULL_EVENT(msg_itf_evt_error);
> +
> +struct al_match_data {
> +	const char *fw_name;
> +};
> +
> +struct al_common_mcu_req {
> +	phys_addr_t pCtx;
> +	int req_type;
> +	size_t req_size;
> +	size_t reply_size;
> +	void *reply;
> +} __packed;
> +
> +struct al_firmware_section {
> +	u64 offset;
> +	size_t size;
> +};
> +
> +struct al_firmware {
> +	/* Firmware after it is read but not loaded */
> +	const struct firmware *firmware;
> +
> +	/* Raw firmware data */
> +	dma_addr_t phys;
> +	void *virt;
> +	size_t size;
> +
> +	/* Parsed firmware information */
> +	struct al_firmware_section bin_data;
> +	struct al_firmware_section mb_m2h;
> +	struct al_firmware_section mb_h2m;
> +};
> +
> +struct al_codec_dev {
> +	struct platform_device *pdev;
> +	struct v4l2_device v4l2_dev;
> +	struct v4l2_m2m_dev *m2m_dev;
> +	struct video_device video_dev;
> +
> +	/* Firmware */
> +	struct al_firmware firmware;
> +	dma_addr_t apb;
> +
> +	struct clk *clk;
> +	void __iomem *regs;
> +	struct resource *regs_info;
> +
> +	/* Mailbox structs */
> +	struct al_codec_mb mb_h2m;
> +	struct al_codec_mb mb_m2h;
> +
> +	/* list of buffers used by the MCU */
> +	struct list_head alloc_buffers;
> +	struct mutex buf_lock;
> +
> +	/* mutex protecting vb2_queue structure */
> +	struct mutex lock;
> +
> +	/* list of ctx (aka decoder) */
> +	struct mutex ctx_mlock;
> +	struct list_head ctx_q_list;
> +	int is_video_init_done;
> +
> +	/* list of cap/out supported formats */
> +	struct list_head codec_q_list;
> +	struct al_codec_cmd *codec_info_cmd;
> +
> +	/* Command completion */
> +	struct completion completion;
> +	/* Resolution found completion */
> +	struct completion res_done;
> +
> +	/* callbacks set by client before common_probe */
> +	void *cb_arg;
> +	void (*process_msg_cb)(void *cb_arg, struct msg_itf_header *hdr);
> +	void (*fw_ready_cb)(void *cb_arg);
> +};
> +
> +static inline int al_common_get_header(struct al_codec_dev *dev,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct msg_itf_header *hdr)
> +{
> +	return al_codec_msg_get_header(&dev->mb_m2h, hdr);
> +}
> +
> +static inline int al_common_get_data(struct al_codec_dev *dev, char *dat=
a,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 int len)
> +{
> +	return al_codec_msg_get_data(&dev->mb_m2h, data, len);
> +}
> +
> +static inline int al_common_skip_data(struct al_codec_dev *dev, int len)
> +{
> +	return al_common_get_data(dev, NULL, len);
> +}
> +
> +int al_common_send(struct al_codec_dev *dev, struct msg_itf_header *hdr)=
;
> +int al_common_send_req_reply(struct al_codec_dev *dev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head *cmd_list,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct msg_itf_header *hdr,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct al_common_mcu_req *req);
> +bool al_common_mcu_is_alive(struct al_codec_dev *dev);
> +
> +int al_common_probe(struct al_codec_dev *dev, const char *name);
> +void al_common_remove(struct al_codec_dev *dev);
> +
> +#endif /*__AL_CODEC_COMMON__*/
> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_util.c b/d=
rivers/media/platform/allegro-
> dvt/al300/al_codec_util.c
> new file mode 100644
> index 000000000000..6cc5b1322475
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_util.c
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Mailbox communication utilities for command creation
> + * and message exchange with the MCU
> + *
> + * Copyright (c) 2025 Allegro DVT.
> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
> + */
> +
> +#include <asm-generic/errno.h>
> +#include <linux/errno.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/string.h>
> +
> +#include "al_codec_util.h"
> +
> +static int al_get_used_space(struct al_codec_mb *mb)
> +{
> +	u32 head =3D mb->hdr->head;
> +	u32 tail =3D mb->hdr->tail;
> +
> +	return head >=3D tail ? head - tail : mb->size - (tail - head);
> +}
> +
> +static int al_get_free_space(struct al_codec_mb *mb)
> +{
> +	return mb->size - al_get_used_space(mb) - 1;
> +}
> +
> +static int al_has_enough_space(struct al_codec_mb *mb, int len)
> +{
> +	return al_get_free_space(mb) >=3D len;
> +}
> +
> +static inline void al_copy_to_mb(struct al_codec_mb *mb, char *data, int=
 len)
> +{
> +	u32 head =3D mb->hdr->head;
> +	int copy_len =3D min(mb->size - head, (unsigned int)len);
> +	int copied_len =3D len;
> +
> +	memcpy(&mb->data[head], data, copy_len);
> +	len -=3D copy_len;
> +	if (len)
> +		memcpy(&mb->data[0], &data[copy_len], len);
> +
> +	/* Make sure that all messages are written before updating the head */
> +	dma_wmb();
> +	mb->hdr->head =3D (head + copied_len) % mb->size;
> +	/* Make sure that the head is updated in DDR instead of cache */
> +	dma_wmb();
> +}
> +
> +static inline void al_copy_from_mb(struct al_codec_mb *mb, char *data, i=
nt len)
> +{
> +	u32 tail =3D mb->hdr->tail;
> +	int copy_len =3D min(mb->size - tail, (unsigned int)len);
> +	int copied_len =3D len;
> +
> +	if (!data)
> +		goto update_tail;
> +
> +	memcpy(data, &mb->data[tail], copy_len);
> +	len -=3D copy_len;
> +	if (len)
> +		memcpy(&data[copy_len], &mb->data[0], len);
> +
> +update_tail:
> +	mb->hdr->tail =3D (tail + copied_len) % mb->size;
> +	/* Make sure that the head is updated in DDR instead of cache */
> +	dma_wmb();
> +}
> +
> +static int al_codec_mb_send(struct al_codec_mb *mb, char *data, int len)
> +{
> +	if (!al_has_enough_space(mb, len))
> +		return -ENOMEM;
> +
> +	al_copy_to_mb(mb, data, len);
> +
> +	return 0;
> +}
> +
> +static int al_codec_mb_receive(struct al_codec_mb *mb, char *data, int l=
en)
> +{
> +	if (al_get_used_space(mb) < len)
> +		return -ENOMEM;
> +
> +	al_copy_from_mb(mb, data, len);
> +
> +	return 0;
> +}
> +
> +void al_codec_mb_init(struct al_codec_mb *mb, char *addr, int size, u32 =
magic)
> +{
> +	mb->hdr =3D (struct al_mb_itf *)addr;
> +	mb->hdr->magic =3D magic;
> +	mb->hdr->version =3D MB_IFT_VERSION;
> +	mb->hdr->head =3D 0;
> +	mb->hdr->tail =3D 0;
> +	mb->data =3D addr + sizeof(struct al_mb_itf);
> +	mb->size =3D size - sizeof(struct al_mb_itf);
> +	mutex_init(&mb->lock);
> +}
> +
> +int al_codec_msg_get_header(struct al_codec_mb *mb, struct msg_itf_heade=
r *hdr)
> +{
> +	return al_codec_mb_receive(mb, (char *)hdr, sizeof(*hdr));
> +}
> +
> +int al_codec_msg_get_data(struct al_codec_mb *mb, char *data, int len)
> +{
> +	return al_codec_mb_receive(mb, data, len);
> +}
> +
> +int al_codec_msg_send(struct al_codec_mb *mb, struct msg_itf_header *hdr=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*trigger)(void *), void *trigger_=
arg)
> +{
> +	unsigned long timeout;
> +	int ret;
> +
> +	timeout =3D jiffies + HZ;
> +	mutex_lock(&mb->lock);
> +	do {
> +		if (time_after(jiffies, timeout)) {
> +			mutex_unlock(&mb->lock);
> +			return -ETIMEDOUT;
> +		}
> +		ret =3D al_codec_mb_send(mb, (char *)hdr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdr->payload_len +
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(struct msg_itf_header))=
;
> +
> +	} while (ret);
> +	mutex_unlock(&mb->lock);
> +
> +	trigger(trigger_arg);
> +
> +	return 0;
> +}
> +
> +static void al_codec_cmd_cleanup(struct kref *ref)
> +{
> +	struct al_codec_cmd *cmd =3D container_of(ref, typeof(*cmd), refcount);
> +
> +	kfree(cmd->reply);
> +	kfree(cmd);
> +}
> +
> +void al_codec_cmd_put(struct al_codec_cmd *cmd)
> +{
> +	if (WARN_ON(!cmd))
> +		return;
> +
> +	kref_put(&cmd->refcount, al_codec_cmd_cleanup);
> +}
> +
> +struct al_codec_cmd *al_codec_cmd_create(int reply_size)
> +{
> +	struct al_codec_cmd *cmd;
> +
> +	cmd =3D kmalloc(sizeof(*cmd), GFP_KERNEL);
> +	if (!cmd)
> +		return NULL;
> +
> +	cmd->reply =3D kmalloc(reply_size, GFP_KERNEL);
> +	if (!cmd->reply) {
> +		kfree(cmd);
> +		return NULL;
> +	}
> +
> +	kref_init(&cmd->refcount);
> +	cmd->reply_size =3D reply_size;
> +	init_completion(&cmd->done);
> +
> +	return cmd;
> +}
> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_util.h b/d=
rivers/media/platform/allegro-
> dvt/al300/al_codec_util.h
> new file mode 100644
> index 000000000000..1743877e9ff6
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_util.h
> @@ -0,0 +1,185 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2025 Allegro DVT.
> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
> + */
> +
> +#ifndef __AL_CODEC_UTIL__
> +#define __AL_CODEC_UTIL__
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +#include <linux/v4l2-common.h>
> +
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#define MB_IFT_MAGIC_H2M 0xabcd1230
> +#define MB_IFT_MAGIC_M2H 0xabcd1231
> +#define MB_IFT_VERSION 0x00010000
> +
> +#define MAJOR_SHIFT 20
> +#define MAJOR_MASK 0xfff
> +#define MINOR_SHIFT 8
> +#define MINOR_MASK 0xfff
> +#define PATCH_SHIFT 0
> +#define PATCH_MASK 0xff
> +
> +/*
> + * AL_BOOT_VERSION() - Version format 32-bit, 12 bits for the major,
> + * the same for minor, 8bits for the patch
> + */
> +#define AL_BOOT_VERSION(major, minor, patch)=C2=A0=C2=A0=C2=A0 \
> +	((((major) & MAJOR_MASK) << MAJOR_SHIFT) |=C2=A0=C2=A0=C2=A0 \
> +	 (((minor) & MINOR_MASK) << MINOR_SHIFT) |=C2=A0=C2=A0=C2=A0 \
> +	 (((patch) & PATCH_MASK) << PATCH_SHIFT))
> +
> +#define al_phys_to_virt(x) ((void *)(uintptr_t)x)
> +#define al_virt_to_phys(x) ((phys_addr_t)(uintptr_t)x)
> +
> +#define DECLARE_FULL_REQ(s)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> +	struct s##_full {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +		struct msg_itf_header hdr;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +		struct s req;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +	} __packed
> +
> +#define DECLARE_FULL_REPLY(s)=C2=A0=C2=A0=C2=A0=C2=A0 \
> +	struct s##_full {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +		struct msg_itf_header hdr;=C2=A0=C2=A0=C2=A0 \
> +		struct s reply;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +	} __packed
> +
> +#define DECLARE_FULL_EVENT(s)=C2=A0=C2=A0=C2=A0=C2=A0 \
> +	struct s##_full {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +		struct msg_itf_header hdr;=C2=A0=C2=A0=C2=A0 \
> +		struct s event;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +	} __packed
> +
> +struct al_mb_itf {
> +	u32 magic;
> +	u32 version;
> +	u32 head;
> +	u32 tail;
> +} __packed;
> +
> +struct al_codec_mb {
> +	struct al_mb_itf *hdr;
> +	struct mutex lock;
> +	char *data;
> +	int size;
> +};
> +
> +struct al_codec_cmd {
> +	struct kref refcount;
> +	struct list_head list;
> +	struct completion done;
> +	int reply_size;
> +	void *reply;
> +};
> +
> +#define al_codec_err(al_dev, fmt, args...)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
> +	dev_err(&(al_dev)->pdev->dev, "[ALG_CODEC][ERROR] %s():%d: " fmt "\n",=
=C2=A0 \
> +		__func__, __LINE__, ##args)
> +
> +#define al_v4l2_err(al_dev, fmt, args...)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> +	dev_err(&(al_dev)->pdev->dev, "[ALG_V4L2][ERROR] %s():%d: " fmt "\n",=
=C2=A0=C2=A0 \
> +		__func__, __LINE__, ##args)
> +
> +#if defined(DEBUG)
> +
> +extern int debug;
> +
> +/* V4L2 logs */
> +#define al_v4l2_dbg(al_dev, level, fmt, args...)=C2=A0=C2=A0=C2=A0 \
> +	do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +		if (debug >=3D level)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +			dev_dbg(&(al_dev)->pdev->dev,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +				"[ALG_V4L2] level=3D%d %s(),%d: " fmt "\n",=C2=A0=C2=A0 \
> +				level, __func__, __LINE__, ##args);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> +	} while (0)
> +
> +/* Codec logs */
> +#define al_codec_dbg(al_dev, fmt, args...)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> +	do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +		if (debug)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> +			dev_dbg(&(al_dev)->pdev->dev,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +				"[ALG_CODEC] %s(),%d: " fmt "\n", __func__, \
> +				__LINE__, ##args);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +	} while (0)
> +
> +#else
> +
> +#define al_v4l2_dbg(al_dev, level, fmt, args...)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +	do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +		(void)level;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +		dev_dbg(&(al_dev)->pdev->dev, "[ALG_V4L2]: " fmt "\n",=C2=A0 \
> +			##args);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +	} while (0)
> +
> +#define al_codec_dbg(al_dev, fmt, args...) \
> +	dev_dbg(&(al_dev)->pdev->dev, "[ALG_CODEC]: " fmt "\n", ##args)
> +#endif
> +
> +#define MSG_ITF_TYPE_LIMIT BIT(10)
> +
> +/* Message types host <-> mcu */
> +enum {
> +	MSG_ITF_TYPE_MCU_ALIVE =3D 0,
> +	MSG_ITF_TYPE_WRITE_REQ =3D 2,
> +	MSG_ITF_TYPE_FIRST_REQ =3D 1024,
> +	MSG_ITF_TYPE_NEXT_REQ,
> +	MSG_ITF_TYPE_FIRST_REPLY =3D 2048,
> +	MSG_ITF_TYPE_NEXT_REPLY,
> +	MSG_ITF_TYPE_ALLOC_MEM_REQ =3D 3072,
> +	MSG_ITF_TYPE_FREE_MEM_REQ,
> +	MSG_ITF_TYPE_ALLOC_MEM_REPLY =3D 4096,
> +	MSG_ITF_TYPE_FREE_MEM_REPLY,
> +	MSG_ITF_TYPE_FIRST_EVT =3D 5120,
> +	MSG_ITF_TYPE_NEXT_EVT =3D MSG_ITF_TYPE_FIRST_EVT
> +};
> +
> +struct msg_itf_header {
> +	u64 drv_ctx_hdl;
> +	u64 drv_cmd_hdl;
> +	u16 type;
> +	u16 payload_len;
> +	u16 padding[2];
> +} __packed;
> +
> +void al_codec_mb_init(struct al_codec_mb *mb, char *addr, int size, u32 =
magic);
> +int al_codec_msg_get_header(struct al_codec_mb *mb, struct msg_itf_heade=
r *hdr);
> +int al_codec_msg_get_data(struct al_codec_mb *mb, char *data, int len);
> +int al_codec_msg_send(struct al_codec_mb *mb, struct msg_itf_header *hdr=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*trigger)(void *), void *trigger_=
arg);
> +
> +static inline bool is_type_reply(uint16_t type)
> +{
> +	return type >=3D MSG_ITF_TYPE_FIRST_REPLY &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type < MSG_ITF_TYPE_FIRST_REPLY + =
MSG_ITF_TYPE_LIMIT;
> +}
> +
> +static inline bool is_type_event(uint16_t type)
> +{
> +	return type >=3D MSG_ITF_TYPE_FIRST_EVT &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type < MSG_ITF_TYPE_FIRST_EVT + MS=
G_ITF_TYPE_LIMIT;
> +}
> +
> +void al_codec_cmd_put(struct al_codec_cmd *cmd);
> +
> +struct al_codec_cmd *al_codec_cmd_create(int reply_size);
> +
> +static inline struct al_codec_cmd *al_codec_cmd_get(struct list_head *cm=
d_list,
> +						=C2=A0=C2=A0=C2=A0 uint64_t hdl)
> +{
> +	struct al_codec_cmd *cmd =3D NULL;
> +
> +	list_for_each_entry(cmd, cmd_list, list) {
> +		if (likely(cmd =3D=3D al_phys_to_virt(hdl))) {
> +			kref_get(&cmd->refcount);
> +			break;
> +		}
> +	}
> +	return list_entry_is_head(cmd, cmd_list, list) ? NULL : cmd;
> +}
> +
> +#endif /* __AL_CODEC_UTIL__ */
> diff --git a/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c b/dri=
vers/media/platform/allegro-
> dvt/al300/al_vdec_drv.c
> new file mode 100644
> index 000000000000..3d80b47d7056
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c
> @@ -0,0 +1,1530 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2025 Allegro DVT.
> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
> + *
> + * Allegro DVT stateful video decoder driver for the IP Gen 3
> + */
> +
> +#include <asm-generic/errno-base.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/string.h>
> +#include <linux/v4l2-controls.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "al_codec_common.h"
> +#include "al_vdec_drv.h"
> +
> +#if defined(DEBUG)
> +/* Log level */
> +int debug;
> +module_param(debug, int, 0644);
> +MODULE_PARM_DESC(debug, "Debug level (0-3)");
> +#endif
> +
> +/* default decoder params */
> +#define DECODER_WIDTH_DEFAULT 640
> +#define DECODER_HEIGHT_DEFAULT 480
> +#define DECODER_WIDTH_MAX 3840
> +#define DECODER_HEIGHT_MAX 2160
> +#define DECODER_WIDTH_MIN 16
> +#define DECODER_HEIGHT_MIN 16
> +#define DEC_REQ_TIMEOUT msecs_to_jiffies(1000)
> +#define DEC_RES_EVT_TIMEOUT DEC_REQ_TIMEOUT
> +
> +/* Supported formats */
> +static const struct al_fmt al_src_formats[] =3D {
> +	{
> +		.pixelformat =3D V4L2_PIX_FMT_H264,
> +		.bpp =3D 20,
> +	},
> +	{
> +		.pixelformat =3D V4L2_PIX_FMT_HEVC,
> +		.bpp =3D 20,
> +	},
> +	{
> +		.pixelformat =3D V4L2_PIX_FMT_JPEG,
> +		.bpp =3D 8,
> +	}
> +};
> +
> +static const struct al_fmt al_dst_formats[] =3D {
> +	{
> +		.pixelformat =3D V4L2_PIX_FMT_NV12,
> +		.bpp =3D 12,
> +	},
> +	{
> +		.pixelformat =3D V4L2_PIX_FMT_P010,
> +		.bpp =3D 12,
> +	},
> +	{
> +		.pixelformat =3D V4L2_PIX_FMT_NV16,
> +		.bpp =3D 16,
> +	},
> +	{
> +		.pixelformat =3D V4L2_PIX_FMT_YUV420, /* YUV 4:2:0 */
> +		.bpp =3D 12,
> +	},
> +	{
> +		.pixelformat =3D V4L2_PIX_FMT_YVU420, /* YVU 4:2:0 */
> +		.bpp =3D 12,
> +	},
> +};
> +
> +/* Default format */
> +static const struct al_frame al_default_fmt =3D {
> +
> +	.width =3D DECODER_WIDTH_DEFAULT,
> +	.height =3D DECODER_HEIGHT_DEFAULT,
> +	.bytesperline =3D DECODER_WIDTH_MAX * 4,
> +	.sizeimage =3D DECODER_WIDTH_DEFAULT * DECODER_HEIGHT_DEFAULT * 4,
> +	.nbuffers =3D 1,
> +	.fmt =3D &al_dst_formats[0],
> +	.field =3D V4L2_FIELD_NONE,
> +	.colorspace =3D V4L2_COLORSPACE_REC709,
> +	.ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT,
> +	.quantization =3D V4L2_QUANTIZATION_DEFAULT,
> +	.xfer_func =3D V4L2_XFER_FUNC_DEFAULT
> +};
> +
> +static struct al_frame *al_get_frame(struct al_dec_ctx *ctx,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 enum v4l2_buf_type type)
> +{
> +	if (WARN_ON(!ctx))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +		return &ctx->src;
> +	else if (type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return &ctx->dst;
> +
> +	al_v4l2_err(ctx->dev, "Unsupported type (%d)", type);
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static const struct al_fmt *al_find_fmt(u32 pixelformat)
> +{
> +	const struct al_fmt *fmt;
> +	unsigned int i;
> +
> +	/* check if the pixelformat exist in the src formats list */
> +	for (i =3D 0; i < ARRAY_SIZE(al_src_formats); i++) {
> +		fmt =3D &al_src_formats[i];
> +		if (fmt->pixelformat =3D=3D pixelformat)
> +			return fmt;
> +	}
> +
> +	/* check if the pixelformat exist in the dst formats list */
> +	for (i =3D 0; i < ARRAY_SIZE(al_dst_formats); i++) {
> +		fmt =3D &al_dst_formats[i];
> +		if (fmt->pixelformat =3D=3D pixelformat)
> +			return fmt;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int dec_fw_create_decoder(struct al_dec_ctx *ctx)
> +{
> +	struct msg_itf_create_decoder_req_full req;
> +	struct msg_itf_create_codec_reply reply;
> +	struct al_common_mcu_req mreq;
> +	int ret;
> +
> +	if (ctx->hDec) {
> +		al_v4l2_dbg(ctx->dev, 3, "fw decoder already exist\n");
> +		return 0;
> +	}
> +
> +	req.req.codec =3D ctx->codec;
> +
> +	mreq.pCtx =3D al_virt_to_phys(ctx);
> +	mreq.req_type =3D MSG_ITF_TYPE_CREATE_INST_REQ;
> +	mreq.req_size =3D sizeof(req.req);
> +	mreq.reply_size =3D sizeof(reply);
> +	mreq.reply =3D &reply;
> +
> +	ret =3D al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &mreq);
> +
> +	if (!ret && !reply.ret)
> +		ctx->hDec =3D reply.hCodec;
> +	else if (reply.ret)
> +		ret =3D -ENODEV;
> +
> +	return ret;
> +}
> +
> +static void dec_fw_destroy_decoder(struct al_dec_ctx *ctx)
> +{
> +	struct msg_itf_destroy_codec_req_full req;
> +	struct msg_itf_destroy_codec_reply reply;
> +	struct al_common_mcu_req mreq;
> +	int ret;
> +
> +	if (WARN(!ctx->hDec, "NULL Decoder to destroy !"))
> +		return;
> +
> +	al_v4l2_dbg(ctx->dev, 3, "Destroy decoder %lld ", ctx->hDec);
> +
> +	req.req.hCodec =3D ctx->hDec;
> +
> +	mreq.pCtx =3D al_virt_to_phys(ctx);
> +	mreq.req_type =3D MSG_ITF_TYPE_DESTROY_INST_REQ;
> +	mreq.req_size =3D sizeof(req.req);
> +	mreq.reply_size =3D sizeof(reply);
> +	mreq.reply =3D &reply;
> +
> +	ret =3D al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &mreq);
> +
> +	if (!ret)
> +		ctx->hDec =3D 0;
> +}
> +
> +static int al_dec_fw_push_frame_buf(struct al_dec_ctx *ctx,
> +				=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer *vbuf)
> +{
> +	struct msg_itf_push_dst_buf_req_full req;
> +	struct v4l2_m2m_buffer *m2m_buf;
> +	struct al_common_mcu_req mreq =3D { 0 };
> +	int ret;
> +
> +	if (WARN(!vbuf, "NULL frame Buffer to push!!"))
> +		return -EINVAL;
> +
> +	req.req.hCodec =3D ctx->hDec;
> +	m2m_buf =3D container_of(vbuf, struct v4l2_m2m_buffer, vb);
> +	req.req.bufferHandle =3D al_virt_to_phys(m2m_buf);
> +	req.req.phyAddr =3D vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> +	req.req.size =3D vb2_plane_size(&vbuf->vb2_buf, 0);
> +
> +	mreq.pCtx =3D al_virt_to_phys(ctx);
> +	mreq.req_type =3D MSG_ITF_TYPE_PUT_DISPLAY_PICTURE_REQ;
> +	mreq.req_size =3D sizeof(req.req);
> +
> +	ret =3D al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &mreq);
> +	if (ret)
> +		al_v4l2_err(ctx->dev, "Failed to push frame buffer %p %d",
> +			=C2=A0=C2=A0=C2=A0 m2m_buf, ret);
> +
> +	return ret;
> +}
> +
> +static int al_dec_fw_push_bitstream_buf(struct al_dec_ctx *ctx,
> +					struct vb2_v4l2_buffer *vbuf)
> +{
> +	struct msg_itf_push_src_buf_req_full req;
> +	struct v4l2_m2m_buffer *m2m_buf;
> +	struct al_common_mcu_req mreq =3D { 0 };
> +	int ret;
> +
> +	if (WARN(!vbuf, "NULL Buffer to push!!"))
> +		return -EINVAL;
> +
> +	req.req.hCodec =3D ctx->hDec;
> +	m2m_buf =3D container_of(vbuf, struct v4l2_m2m_buffer, vb);
> +	req.req.bufferHandle =3D al_virt_to_phys(m2m_buf);
> +	req.req.phyAddr =3D vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> +	req.req.size =3D vb2_plane_size(&vbuf->vb2_buf, 0);
> +
> +	/* Fill the v4l2 metadata*/
> +	req.req.meta.timestamp =3D vbuf->vb2_buf.timestamp;
> +	req.req.meta.timecode =3D vbuf->timecode;
> +	req.req.meta.last =3D vbuf->flags & V4L2_BUF_FLAG_LAST;
> +
> +	mreq.pCtx =3D al_virt_to_phys(ctx);
> +	mreq.req_type =3D MSG_ITF_TYPE_PUSH_BITSTREAM_BUFFER_REQ;
> +	mreq.req_size =3D sizeof(req.req);
> +
> +	ret =3D al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &mreq);
> +	if (ret)
> +		al_v4l2_err(ctx->dev, "Failed to push bitstream buffer %p %d",
> +			=C2=A0=C2=A0=C2=A0 m2m_buf, ret);
> +
> +	return ret;
> +}
> +
> +static int dec_fw_flush_req(struct al_dec_ctx *ctx)
> +{
> +	struct msg_itf_flush_req_full req;
> +	struct msg_itf_flush_reply reply;
> +	struct al_common_mcu_req mreq;
> +	int ret;
> +
> +	req.req.hCodec =3D ctx->hDec;
> +
> +	mreq.pCtx =3D al_virt_to_phys(ctx);
> +	mreq.req_type =3D MSG_ITF_TYPE_FLUSH_REQ;
> +	mreq.req_size =3D sizeof(req.req);
> +	mreq.reply_size =3D sizeof(reply);
> +	mreq.reply =3D &reply;
> +
> +	ret =3D al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &mreq);
> +
> +	if (ret)
> +		al_v4l2_err(ctx->dev, "Failed to flush the decoder %d", ret);
> +
> +	return ret;
> +}
> +
> +static inline struct vb2_v4l2_buffer *
> +al_dec_dequeue_buf(struct al_dec_ctx *ctx, uint64_t hdl,
> +		=C2=A0=C2=A0 struct list_head *buffer_list)
> +{
> +	struct v4l2_m2m_buffer *buf, *tmp;
> +	struct vb2_v4l2_buffer *ret =3D NULL;
> +
> +	mutex_lock(&ctx->buf_q_mlock);
> +	list_for_each_entry_safe(buf, tmp, buffer_list, list) {
> +		if (buf =3D=3D al_phys_to_virt(hdl)) {
> +			list_del(&buf->list);
> +			ret =3D &buf->vb;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&ctx->buf_q_mlock);
> +
> +	return ret;
> +}
> +
> +static struct vb2_v4l2_buffer *al_dec_dequeue_src_buf(struct al_dec_ctx =
*ctx,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t hdl)
> +{
> +	return al_dec_dequeue_buf(ctx, hdl, &ctx->stream_q_list);
> +}
> +
> +static struct vb2_v4l2_buffer *al_dec_dequeue_dst_buf(struct al_dec_ctx =
*ctx,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t hdl)
> +{
> +	return al_dec_dequeue_buf(ctx, hdl, &ctx->frame_q_list);
> +}
> +
> +static void al_ctx_cleanup(struct kref *ref)
> +{
> +	struct al_dec_ctx *ctx =3D container_of(ref, struct al_dec_ctx, refcoun=
t);
> +
> +	kfree(ctx);
> +}
> +
> +static inline struct al_dec_ctx *al_ctx_get(struct al_codec_dev *dev,
> +					=C2=A0=C2=A0=C2=A0 uint64_t hdl)
> +{
> +	struct al_dec_ctx *ctx;
> +	struct al_dec_ctx *ret =3D NULL;
> +
> +	mutex_lock(&dev->ctx_mlock);
> +	list_for_each_entry(ctx, &dev->ctx_q_list, list) {
> +		if (ctx =3D=3D al_phys_to_virt(hdl)) {
> +			kref_get(&ctx->refcount);
> +			ret =3D ctx;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&dev->ctx_mlock);
> +
> +	return ret;
> +}
> +
> +static void al_ctx_put(struct al_dec_ctx *ctx)
> +{
> +	kref_put(&ctx->refcount, al_ctx_cleanup);
> +}
> +
> +static int al_dec_start_streaming(struct vb2_queue *q, unsigned int coun=
t)
> +{
> +	struct al_dec_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct al_codec_dev *dev =3D ctx->dev;
> +
> +	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		struct v4l2_m2m_buffer *buf;
> +		int ret;
> +
> +		if (list_empty(&ctx->stream_q_list)) {
> +			al_v4l2_err(dev, "Empty stream list.");
> +			return -EINVAL;
> +		}
> +
> +		if (!al_common_mcu_is_alive(dev)) {
> +			al_v4l2_err(dev, "Unable to ping the mcu");
> +			return -ENODEV;
> +		}
> +
> +		ret =3D dec_fw_create_decoder(ctx);
> +		if (ret) {
> +			al_v4l2_err(dev, "Unable to create the fw decoder %d",
> +				=C2=A0=C2=A0=C2=A0 ret);
> +			return ret;
> +		}
> +
> +		/* Get the first vid-out queued buffer */
> +		buf =3D list_first_entry(&ctx->stream_q_list,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_m2m_buffer, list);
> +
> +		if (al_dec_fw_push_bitstream_buf(ctx, &buf->vb)) {
> +			al_v4l2_err(ctx->dev,
> +				=C2=A0=C2=A0=C2=A0 "Unable to push the bitstream buffer");
> +			return -EINVAL;
> +		}
> +
> +		/* Wait until the mcu detect the resolution of the stream */
> +		ret =3D wait_for_completion_timeout(&ctx->res_done,
> +						=C2=A0 DEC_RES_EVT_TIMEOUT);
> +		if (!ret) {
> +			al_v4l2_err(ctx->dev, "unsupported stream");
> +			ctx->aborting =3D true;
> +		}
> +
> +		ctx->osequence =3D 0;
> +	} else
> +		ctx->csequence =3D 0;
> +
> +	return 0;
> +}
> +
> +static void al_dec_stop_streaming_cap(struct al_dec_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *vbuf;
> +	struct v4l2_m2m_buffer *entry, *tmp;
> +
> +	mutex_lock(&ctx->buf_q_mlock);
> +	if (!list_empty(&ctx->frame_q_list))
> +		list_for_each_entry_safe(entry, tmp, &ctx->frame_q_list, list) {
> +			list_del(&entry->list);
> +			vbuf =3D &entry->vb;
> +			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
> +			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +		}
> +	mutex_unlock(&ctx->buf_q_mlock);
> +
> +	while (v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx)) {
> +		vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +		if (vbuf) {
> +			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
> +			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +		}
> +	}
> +
> +	v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
> +}
> +
> +static void al_dec_stop_streaming_out(struct al_dec_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *vbuf;
> +	struct v4l2_m2m_buffer *entry, *tmp;
> +
> +	mutex_lock(&ctx->buf_q_mlock);
> +	if (!list_empty(&ctx->stream_q_list))
> +		list_for_each_entry_safe(entry, tmp, &ctx->stream_q_list,
> +					 list) {
> +			list_del(&entry->list);
> +			v4l2_m2m_buf_done(&entry->vb, VB2_BUF_STATE_ERROR);
> +		}
> +	mutex_unlock(&ctx->buf_q_mlock);
> +
> +	if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx)) {
> +		while ((vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
> +			if (vbuf->vb2_buf.state =3D=3D VB2_BUF_STATE_ACTIVE)
> +				v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +	}
> +
> +	dec_fw_destroy_decoder(ctx);
> +}
> +
> +static void al_dec_stop_streaming(struct vb2_queue *q)
> +{
> +	struct al_dec_ctx *ctx =3D vb2_get_drv_priv(q);
> +
> +	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, q);
> +
> +	/* Releasing the dst and src buffers */
> +	ctx->stopped =3D true;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(q->type))
> +		al_dec_stop_streaming_out(ctx);
> +	else
> +		al_dec_stop_streaming_cap(ctx);
> +}
> +
> +static int al_dec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffe=
rs,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *nplanes, unsigned int si=
zes[],
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *alloc_devs[])
> +{
> +	struct al_dec_ctx *ctx =3D vb2_get_drv_priv(vq);
> +	struct al_frame *format =3D al_get_frame(ctx, vq->type);
> +
> +	if (IS_ERR(format)) {
> +		al_v4l2_err(ctx->dev, "Invalid format %p", format);
> +		return PTR_ERR(format);
> +	}
> +
> +	if (*nplanes)
> +		return ((sizes[0] < format->sizeimage) ? -EINVAL : 0);
> +
> +	/* update queue num buffers */
> +	format->nbuffers =3D max(*nbuffers, format->nbuffers);
> +
> +	*nplanes =3D 1;
> +	sizes[0] =3D format->sizeimage;
> +	*nbuffers =3D format->nbuffers;
> +
> +	al_v4l2_dbg(ctx->dev, 2, "%s: Get %d buffers of size %d each ",
> +		=C2=A0=C2=A0=C2=A0 (vq->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT) ? "OUT=
" : "CAP",
> +		=C2=A0=C2=A0=C2=A0 *nbuffers, sizes[0]);
> +
> +	return 0;
> +}
> +
> +static int al_dec_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct al_dec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +	if (ctx->aborting)
> +		return -EINVAL;
> +
> +	if (V4L2_TYPE_IS_CAPTURE(vb->type)) {
> +		if (vbuf->field =3D=3D V4L2_FIELD_ANY)
> +			vbuf->field =3D V4L2_FIELD_NONE;
> +		if (vbuf->field !=3D V4L2_FIELD_NONE)
> +			return -EINVAL;
> +	}
> +
> +	al_v4l2_dbg(ctx->dev, 3, "%s : Buffer (%p) prepared ",
> +		=C2=A0=C2=A0=C2=A0 (V4L2_TYPE_IS_OUTPUT(vb->type) ? "OUT" : "CAP"), vb=
uf);
> +
> +	return 0;
> +}
> +
> +static inline void al_dec_fill_bitstream(struct al_dec_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *src_buf;
> +	struct v4l2_m2m_buffer *m2m_buf;
> +	struct vb2_queue *src_vq;
> +
> +	lockdep_assert_held(&ctx->buf_q_mlock);
> +
> +	if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx) > 0) {
> +		src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +		if (!src_buf)
> +			return;
> +
> +		/* Dump empty buffers */
> +		if (!vb2_get_plane_payload(&src_buf->vb2_buf, 0)) {
> +			src_buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
> +			return;
> +		}
> +
> +		src_vq =3D v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx);
> +		src_buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +
> +		if (src_buf) {
> +			src_buf->sequence =3D ctx->osequence++;
> +
> +			if (vb2_is_streaming(src_vq) &&
> +			=C2=A0=C2=A0=C2=A0 al_dec_fw_push_bitstream_buf(ctx, src_buf)) {
> +				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> +				return;
> +			}
> +
> +			m2m_buf =3D container_of(src_buf, struct v4l2_m2m_buffer,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb);
> +			list_add_tail(&m2m_buf->list, &ctx->stream_q_list);
> +		}
> +	}
> +}
> +
> +static void al_dec_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct al_dec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
> +		mutex_lock(&ctx->buf_q_mlock);
> +		al_dec_fill_bitstream(ctx);
> +		mutex_unlock(&ctx->buf_q_mlock);
> +	}
> +
> +	al_v4l2_dbg(ctx->dev, 3, "%s queued (%p) - (%d)",
> +		=C2=A0=C2=A0=C2=A0 V4L2_TYPE_IS_OUTPUT(vb->type) ? "OUT" : "CAP", vbuf=
,
> +		=C2=A0=C2=A0=C2=A0 vb->num_planes);
> +}
> +
> +static const struct vb2_ops dec_queue_ops =3D {
> +	.queue_setup =3D al_dec_queue_setup,
> +	.buf_prepare =3D al_dec_buf_prepare,
> +	.buf_queue =3D al_dec_buf_queue,
> +	.start_streaming =3D al_dec_start_streaming,
> +	.stop_streaming =3D al_dec_stop_streaming,
> +	.wait_prepare =3D vb2_ops_wait_prepare,
> +	.wait_finish =3D vb2_ops_wait_finish,
> +};
> +
> +static int al_dec_queue_init(void *priv, struct vb2_queue *src_vq,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_queue *dst_vq)
> +{
> +	struct al_dec_ctx *ctx =3D priv;
> +	struct al_codec_dev *al_dev =3D ctx->dev;
> +	int ret;
> +
> +	src_vq->dev =3D &al_dev->pdev->dev;
> +	src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +	src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +	src_vq->non_coherent_mem =3D false;
> +	src_vq->dma_attrs |=3D DMA_ATTR_FORCE_CONTIGUOUS;
> +	src_vq->mem_ops =3D &vb2_dma_contig_memops;
> +	src_vq->drv_priv =3D ctx;
> +	src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->ops =3D &dec_queue_ops;
> +	src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +	src_vq->lock =3D &ctx->dev->lock;
> +	ret =3D vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->dev =3D &al_dev->pdev->dev;
> +	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +	dst_vq->non_coherent_mem =3D false;
> +	dst_vq->dma_attrs |=3D DMA_ATTR_FORCE_CONTIGUOUS;
> +	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> +	dst_vq->drv_priv =3D ctx;
> +	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->ops =3D &dec_queue_ops;
> +	dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->lock =3D &ctx->dev->lock;
> +	ret =3D vb2_queue_init(dst_vq);
> +	if (ret) {
> +		vb2_queue_release(src_vq);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int al_dec_querycap(struct file *file, void *fh,
> +			=C2=A0=C2=A0 struct v4l2_capability *cap)
> +{
> +	struct al_codec_dev *dev =3D video_drvdata(file);
> +
> +	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
> +	strscpy(cap->card, "Allegro DVT Video Decoder", sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> +		 dev_name(&dev->pdev->dev));
> +
> +	return 0;
> +}
> +
> +static int al_dec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtd=
esc *f)
> +{
> +	const struct al_fmt *fmt;
> +
> +	if (f->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT &&
> +	=C2=A0=C2=A0=C2=A0 f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
> +		if (f->index >=3D ARRAY_SIZE(al_src_formats))
> +			return -EINVAL;
> +
> +		fmt =3D &al_src_formats[f->index];
> +	} else {
> +		if (f->index >=3D ARRAY_SIZE(al_dst_formats))
> +			return -EINVAL;
> +
> +		fmt =3D &al_dst_formats[f->index];
> +	}
> +
> +	f->pixelformat =3D fmt->pixelformat;
> +	return 0;
> +}
> +
> +static int al_dec_try_fmt(struct file *file, void *fh, struct v4l2_forma=
t *f)
> +{
> +	struct al_dec_ctx *ctx =3D fh_to_ctx(fh, struct al_dec_ctx);
> +	struct v4l2_pix_format *pix =3D &f->fmt.pix;
> +	struct al_frame *pix_fmt;
> +
> +	pix_fmt =3D al_get_frame(ctx, f->type);
> +	if (IS_ERR(pix_fmt)) {
> +		al_v4l2_err(ctx->dev, "Invalid frame (%p)", pix_fmt);
> +		return PTR_ERR(pix_fmt);
> +	}
> +
> +	pix_fmt->fmt =3D al_find_fmt(pix->pixelformat);
> +	if (!pix_fmt->fmt) {
> +		al_v4l2_err(ctx->dev, "Unknown format 0x%x", pix->pixelformat);
> +		return -EINVAL;
> +	}
> +	pix->field =3D V4L2_FIELD_NONE;
> +	pix->width =3D clamp_t(__u32, pix->width, DECODER_WIDTH_MIN,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 DECODER_WIDTH_MAX);
> +	pix->height =3D clamp_t(__u32, pix->height, DECODER_HEIGHT_MIN,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DECODER_HEIGHT_MAX);
> +
> +	pix->bytesperline =3D pix->width;
> +	pix->sizeimage =3D (pix->width * pix->height * pix_fmt->fmt->bpp) / 8;
> +
> +	if (V4L2_TYPE_IS_CAPTURE(f->type))
> +		if (pix->sizeimage < pix_fmt->sizeimage)
> +			pix->sizeimage =3D pix_fmt->sizeimage;
> +
> +	al_v4l2_dbg(
> +		ctx->dev, 3,
> +		"%s : width (%d) , height (%d), bytesperline (%d), sizeimage (%d) ",
> +		(f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) ? "CAP" : "OUT",
> +		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
> +
> +	return 0;
> +}
> +
> +static int al_dec_g_fmt(struct file *file, void *fh, struct v4l2_format =
*f)
> +{
> +	struct al_dec_ctx *ctx =3D fh_to_ctx(fh, struct al_dec_ctx);
> +	struct al_frame *pix_fmt =3D al_get_frame(ctx, f->type);
> +	struct v4l2_pix_format *pix;
> +
> +	if (IS_ERR(pix_fmt)) {
> +		al_v4l2_err(ctx->dev, "Invalid pixel format %p", pix_fmt);
> +		return PTR_ERR(pix_fmt);
> +	}
> +
> +	if (!pix_fmt->fmt) {
> +		al_v4l2_err(ctx->dev, "Unknown format for %d", f->type);
> +		return -EINVAL;
> +	}
> +
> +	pix =3D &f->fmt.pix;
> +	pix->width =3D pix_fmt->width;
> +	pix->height =3D pix_fmt->height;
> +	pix->bytesperline =3D pix_fmt->bytesperline;
> +	pix->sizeimage =3D pix_fmt->sizeimage;
> +	pix->pixelformat =3D pix_fmt->fmt->pixelformat;
> +	pix->field =3D V4L2_FIELD_NONE;
> +
> +	if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> +		pix->bytesperline =3D 0;
> +		pix->pixelformat =3D ctx->codec;
> +	}
> +
> +	pix->ycbcr_enc =3D pix_fmt->ycbcr_enc;
> +	pix->quantization =3D pix_fmt->quantization;
> +	pix->xfer_func =3D pix_fmt->xfer_func;
> +	pix->colorspace =3D pix_fmt->colorspace;
> +
> +	al_v4l2_dbg(
> +		ctx->dev, 3,
> +		"%s : width (%d) , height (%d), bytesperline (%d) , sizeimage (%d)",
> +		(f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) ? "CAP" : "OUT",
> +		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
> +
> +	return 0;
> +}
> +
> +static int al_dec_s_fmt(struct file *file, void *fh, struct v4l2_format =
*f)
> +{
> +	struct al_dec_ctx *ctx =3D fh_to_ctx(fh, struct al_dec_ctx);
> +	struct v4l2_pix_format *pix;
> +	struct al_frame *frame;
> +	struct vb2_queue *vq;
> +	int ret;
> +
> +	ret =3D al_dec_try_fmt(file, fh, f);
> +	if (ret) {
> +		al_v4l2_err(ctx->dev, "Cannot set format (%d)", f->type);
> +		return ret;
> +	}
> +
> +	frame =3D (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT) ? &ctx->src : &ct=
x->dst;
> +
> +	pix =3D &f->fmt.pix;
> +	frame->fmt =3D al_find_fmt(pix->pixelformat);
> +	if (!frame->fmt) {
> +		al_v4l2_err(ctx->dev, "Unknown format for %d",
> +			=C2=A0=C2=A0=C2=A0 pix->pixelformat);
> +		return -EINVAL;
> +	}
> +
> +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +	if (vb2_is_streaming(vq)) {
> +		al_v4l2_err(ctx->dev, "queue %d busy", f->type);
> +		return -EBUSY;
> +	}
> +
> +	frame->width =3D pix->width;
> +	frame->height =3D pix->height;
> +	frame->bytesperline =3D pix->bytesperline;
> +	frame->sizeimage =3D pix->sizeimage;
> +	frame->field =3D pix->field;
> +
> +	frame->ycbcr_enc =3D pix->ycbcr_enc;
> +	frame->quantization =3D pix->quantization;
> +	frame->xfer_func =3D pix->xfer_func;
> +	frame->colorspace =3D pix->colorspace;
> +
> +	/* Set decoder pixelformat */
> +	if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +		ctx->codec =3D pix->pixelformat;
> +
> +	al_v4l2_dbg(
> +		ctx->dev, 3,
> +		" %s : width (%d) , height (%d), bytesperline (%d), sizeimage (%d)",
> +		(f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) ? "CAP" : "OUT",
> +		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
> +
> +	return 0;
> +}
> +
> +static void al_queue_eos_event(struct al_dec_ctx *ctx)
> +{
> +	const struct v4l2_event eos_event =3D {
> +		.id =3D 0,
> +		.type =3D V4L2_EVENT_EOS,
> +	};
> +
> +	v4l2_event_queue_fh(&ctx->fh, &eos_event);
> +}
> +
> +static void al_queue_res_chg_event(struct al_dec_ctx *ctx)
> +{
> +	static const struct v4l2_event ev_src_ch =3D {
> +		.id =3D 0,
> +		.type =3D V4L2_EVENT_SOURCE_CHANGE,
> +		.u.src_change.changes =3D V4L2_EVENT_SRC_CH_RESOLUTION,
> +	};
> +
> +	v4l2_event_queue_fh(&ctx->fh, &ev_src_ch);
> +}
> +
> +static int al_dec_decoder_cmd(struct file *file, void *fh,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_decoder_cmd *dcmd)
> +{
> +	struct al_dec_ctx *ctx =3D fh_to_ctx(fh, struct al_dec_ctx);
> +	struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> +	struct vb2_v4l2_buffer *vbuf;
> +	struct vb2_queue *dst_vq;
> +	int ret;
> +
> +	ret =3D v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dcmd);
> +	if (ret)
> +		return ret;
> +
> +	/* Get the vb2 queue for the Capture */
> +	dst_vq =3D v4l2_m2m_get_dst_vq(m2m_ctx);
> +
> +	switch (dcmd->cmd) {
> +	case V4L2_DEC_CMD_START:
> +		vb2_clear_last_buffer_dequeued(dst_vq);
> +		break;
> +	case V4L2_DEC_CMD_STOP:
> +		vbuf =3D v4l2_m2m_last_src_buf(m2m_ctx);
> +		if (vbuf) {
> +			al_v4l2_dbg(ctx->dev, 1, "marking last pending buffer");
> +
> +			vbuf->flags |=3D V4L2_BUF_FLAG_LAST;
> +			if (v4l2_m2m_num_src_bufs_ready(m2m_ctx) =3D=3D 0) {
> +				al_v4l2_dbg(ctx->dev, 1,
> +					=C2=A0=C2=A0=C2=A0 "all remaining buffers queued");
> +				v4l2_m2m_try_schedule(m2m_ctx);
> +			}
> +		}
> +		dec_fw_flush_req(ctx);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int al_dec_enum_framesizes(struct file *file, void *fh,
> +				=C2=A0 struct v4l2_frmsizeenum *fsize)
> +{
> +	if (!al_find_fmt(fsize->pixel_format))
> +		return -EINVAL;
> +
> +	/* FIXME : check step size */
> +	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise.min_width =3D DECODER_WIDTH_MIN;
> +	fsize->stepwise.max_width =3D DECODER_WIDTH_MAX;
> +	fsize->stepwise.step_width =3D 8;
> +	fsize->stepwise.min_height =3D DECODER_HEIGHT_MIN;
> +	fsize->stepwise.max_height =3D DECODER_HEIGHT_MAX;
> +	fsize->stepwise.step_height =3D 8;
> +
> +	return 0;
> +}
> +
> +static int al_dec_subscribe_event(struct v4l2_fh *fh,
> +				=C2=A0 const struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_EOS:
> +		return v4l2_event_subscribe(fh, sub, 0, NULL);
> +	case V4L2_EVENT_SOURCE_CHANGE:
> +		return v4l2_src_change_event_subscribe(fh, sub);
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int al_dec_log_status(struct file *file, void *fh)
> +{
> +	struct al_codec_dev *al_dev =3D video_drvdata(file);
> +
> +	v4l2_device_call_all(&al_dev->v4l2_dev, 0, core, log_status);
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops al_dec_ioctl_ops =3D {
> +	.vidioc_querycap =3D al_dec_querycap,
> +	.vidioc_enum_fmt_vid_cap =3D al_dec_enum_fmt,
> +	.vidioc_enum_fmt_vid_out =3D al_dec_enum_fmt,
> +	.vidioc_g_fmt_vid_cap =3D al_dec_g_fmt,
> +	.vidioc_g_fmt_vid_out =3D al_dec_g_fmt,
> +	.vidioc_try_fmt_vid_cap =3D al_dec_try_fmt,
> +	.vidioc_try_fmt_vid_out =3D al_dec_try_fmt,
> +	.vidioc_s_fmt_vid_cap =3D al_dec_s_fmt,
> +	.vidioc_s_fmt_vid_out =3D al_dec_s_fmt,
> +
> +	.vidioc_create_bufs =3D v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_reqbufs =3D v4l2_m2m_ioctl_reqbufs,
> +
> +	.vidioc_expbuf =3D v4l2_m2m_ioctl_expbuf,
> +	.vidioc_querybuf =3D v4l2_m2m_ioctl_querybuf,
> +	.vidioc_qbuf =3D v4l2_m2m_ioctl_qbuf,
> +	.vidioc_dqbuf =3D v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_prepare_buf =3D v4l2_m2m_ioctl_prepare_buf,
> +
> +	.vidioc_streamon =3D v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff =3D v4l2_m2m_ioctl_streamoff,
> +	.vidioc_log_status =3D al_dec_log_status,
> +
> +	.vidioc_try_decoder_cmd =3D v4l2_m2m_ioctl_try_decoder_cmd,
> +	.vidioc_decoder_cmd =3D al_dec_decoder_cmd,
> +	.vidioc_enum_framesizes =3D al_dec_enum_framesizes,
> +
> +	.vidioc_subscribe_event =3D al_dec_subscribe_event,
> +	.vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
> +};
> +
> +static void al_device_run(void *priv)
> +{
> +	struct al_dec_ctx *ctx =3D priv;
> +	struct vb2_v4l2_buffer *dst_buf;
> +	struct v4l2_m2m_buffer *m2m_buf;
> +
> +	if (unlikely(!ctx))
> +		return;
> +
> +	if (ctx->aborting) {
> +		vb2_queue_error(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx));
> +		vb2_queue_error(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx));
> +		return;
> +	}
> +
> +	if (!v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx))
> +		goto job_finish;
> +
> +	dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	if (!dst_buf)
> +		goto job_finish;
> +
> +	if (!al_common_mcu_is_alive(ctx->dev) ||
> +	=C2=A0=C2=A0=C2=A0 al_dec_fw_push_frame_buf(ctx, dst_buf)) {
> +		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
> +		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
> +		goto job_finish;
> +	}
> +
> +	mutex_lock(&ctx->buf_q_mlock);
> +	m2m_buf =3D container_of(dst_buf, struct v4l2_m2m_buffer, vb);
> +	list_add_tail(&m2m_buf->list, &ctx->frame_q_list);
> +	mutex_unlock(&ctx->buf_q_mlock);
> +
> +job_finish:
> +	v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
> +}
> +
> +static const struct v4l2_m2m_ops al_dec_m2m_ops =3D {
> +	.device_run =3D al_device_run,
> +};
> +
> +static int al_dec_open(struct file *file)
> +{
> +	struct video_device *vdev =3D video_devdata(file);
> +	struct al_codec_dev *dev =3D video_get_drvdata(vdev);
> +	struct al_dec_ctx *ctx =3D NULL;
> +	int ret;
> +
> +	if (mutex_lock_interruptible(&dev->ctx_mlock))
> +		return -ERESTARTSYS;
> +
> +	/* Aloocate memory for the dec ctx */
> +	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx) {
> +		ret =3D -ENOMEM;
> +		goto unlock;
> +	}
> +
> +	ctx->dev =3D dev;
> +	/* Init ctx mutex */
> +	mutex_init(&ctx->buf_q_mlock);
> +	/* Init ctx LISTHEADs*/
> +	INIT_LIST_HEAD(&ctx->cmd_q_list);
> +	INIT_LIST_HEAD(&ctx->frame_q_list);
> +	INIT_LIST_HEAD(&ctx->stream_q_list);
> +
> +	/* Init the irq queue */
> +	init_completion(&ctx->res_done);
> +
> +	v4l2_fh_init(&ctx->fh, vdev);
> +
> +	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 0);
> +	if (ctx->ctrl_handler.error) {
> +		ret =3D ctx->ctrl_handler.error;
> +		al_v4l2_err(dev, "Failed to create control %d", ret);
> +		goto handler_error;
> +	}
> +
> +	ctx->fh.ctrl_handler =3D &ctx->ctrl_handler;
> +	v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
> +
> +	file->private_data =3D &ctx->fh;
> +	v4l2_fh_add(&ctx->fh);
> +
> +	/* Set default formats */
> +	ctx->src =3D ctx->dst =3D al_default_fmt;
> +
> +	ctx->codec =3D V4L2_PIX_FMT_H264;
> +	ctx->stopped =3D false;
> +	ctx->aborting =3D false;
> +
> +	/* Setup the ctx for m2m mode */
> +	ctx->fh.m2m_ctx =3D
> +		v4l2_m2m_ctx_init(dev->m2m_dev, ctx, al_dec_queue_init);
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		ret =3D PTR_ERR(ctx->fh.m2m_ctx);
> +		al_v4l2_err(dev, "Failed to initialize m2m mode %d", ret);
> +		goto error_ctrls;
> +	}
> +
> +	v4l2_m2m_set_src_buffered(ctx->fh.m2m_ctx, true);
> +	/* v4l2_m2m_set_dst_buffered(ctx->fh.m2m_ctx, true); */
> +
> +	/* Add ctx to the LIST */
> +	kref_init(&ctx->refcount);
> +	list_add(&ctx->list, &dev->ctx_q_list);
> +
> +	mutex_unlock(&dev->ctx_mlock);
> +
> +	return 0;
> +
> +error_ctrls:
> +	v4l2_fh_del(&ctx->fh);
> +handler_error:
> +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +
> +unlock:
> +	mutex_unlock(&dev->ctx_mlock);
> +	return ret;
> +}
> +
> +static int al_dec_release(struct file *file)
> +{
> +	struct al_dec_ctx *ctx =3D
> +		fh_to_ctx(file->private_data, struct al_dec_ctx);
> +	struct al_codec_dev *dev =3D ctx->dev;
> +
> +	mutex_lock(&dev->ctx_mlock);
> +
> +	/* It is important to do this before removing ctx from dev list.
> +	 * Those commands will trigger some traffic towards fw and so we
> +	 * need completion to avoid deadlock if cmds can't find ctx.
> +	 */
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +
> +	list_del(&ctx->list);
> +	al_ctx_put(ctx);
> +	mutex_unlock(&dev->ctx_mlock);
> +
> +	return 0;
> +}
> +
> +static inline bool al_mark_last_dst_buf(struct al_dec_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *buf;
> +	struct vb2_buffer *dst_vb;
> +	struct vb2_queue *dst_vq;
> +	unsigned long flags;
> +
> +	al_v4l2_dbg(ctx->dev, 1, "marking last capture buffer");
> +
> +	dst_vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE=
);
> +	spin_lock_irqsave(&dst_vq->done_lock, flags);
> +	if (list_empty(&dst_vq->done_list)) {
> +		spin_unlock_irqrestore(&dst_vq->done_lock, flags);
> +		return false;
> +	}
> +
> +	dst_vb =3D list_last_entry(&dst_vq->done_list, struct vb2_buffer,
> +				 done_entry);
> +	buf =3D to_vb2_v4l2_buffer(dst_vb);
> +	buf->flags |=3D V4L2_BUF_FLAG_LAST;
> +
> +	spin_unlock_irqrestore(&dst_vq->done_lock, flags);
> +	return true;
> +}
> +
> +static const struct v4l2_file_operations al_dec_file_ops =3D {
> +	.owner =3D THIS_MODULE,
> +	.open =3D al_dec_open,
> +	.release =3D al_dec_release,
> +	.poll =3D v4l2_m2m_fop_poll,
> +	.unlocked_ioctl =3D video_ioctl2,
> +	.mmap =3D v4l2_m2m_fop_mmap,
> +};
> +
> +static void handle_error_evt(struct al_dec_ctx *ctx, struct msg_itf_head=
er *hdr)
> +{
> +	struct al_codec_dev *dev =3D ctx->dev;
> +	struct msg_itf_evt_error evt;
> +	struct v4l2_m2m_buffer *vbuf;
> +
> +	if (al_common_get_data(dev, (char *)&evt, hdr->payload_len)) {
> +		al_v4l2_err(dev, "Unable to get resolution found event");
> +		return;
> +	}
> +
> +	al_v4l2_err(dev, "Decoding error=C2=A0 %d", evt.errno);
> +
> +	mutex_lock(&ctx->buf_q_mlock);
> +	if (!list_empty(&ctx->stream_q_list)) {
> +		vbuf =3D list_last_entry(&ctx->frame_q_list,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_m2m_buffer, list);
> +		list_del(&vbuf->list);
> +		v4l2_m2m_buf_done(&vbuf->vb, VB2_BUF_STATE_ERROR);
> +	}
> +	mutex_unlock(&ctx->buf_q_mlock);
> +}
> +
> +static void handle_resolution_found_evt(struct al_dec_ctx *ctx,
> +					struct msg_itf_header *hdr)
> +{
> +	struct msg_itf_evt_resolution_found evt;
> +	struct al_codec_dev *dev =3D ctx->dev;
> +	struct al_frame *frame;
> +	struct vb2_queue *dst_vq;
> +
> +	if (al_common_get_data(dev, (char *)&evt, hdr->payload_len)) {
> +		al_v4l2_err(dev, "Unable to get resolution found event");
> +		return;
> +	}
> +
> +	frame =3D &ctx->dst;
> +
> +	if (frame->width !=3D evt.width || frame->height !=3D evt.height ||
> +	=C2=A0=C2=A0=C2=A0 frame->nbuffers < evt.buffer_nb) {
> +		/* Update frame properties */
> +		frame->width =3D evt.width;
> +		frame->height =3D evt.height;
> +		frame->bytesperline =3D evt.bytesperline;
> +		frame->sizeimage =3D evt.sizeimage;
> +		frame->nbuffers =3D evt.buffer_nb;
> +		frame->fmt =3D al_find_fmt(evt.pixelformat);
> +
> +		/* This has to be changed */
> +		if (!frame->fmt)
> +			return;
> +
> +		al_queue_res_chg_event(ctx);
> +	}
> +
> +	dst_vq =3D v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
> +	if (!vb2_is_streaming(dst_vq))
> +		complete(&ctx->res_done);
> +
> +	al_v4l2_dbg(
> +		dev, 3,
> +		"width(%d) , height(%d), bytesperline(%d), sizeimage(%d), n_bufs(%d)",
> +		frame->width, frame->height, frame->bytesperline,
> +		frame->sizeimage, frame->nbuffers);
> +}
> +
> +static void handle_bitstream_buffer_release_evt(struct al_dec_ctx *ctx,
> +						struct msg_itf_header *hdr)
> +{
> +	struct msg_itf_evt_bitstream_buffer_release evt;
> +	struct al_codec_dev *dev =3D ctx->dev;
> +	struct vb2_v4l2_buffer *vbuf;
> +
> +	if (al_common_get_data(dev, (char *)&evt, hdr->payload_len)) {
> +		al_v4l2_err(dev, "Unable to get buffer release event");
> +		return;
> +	}
> +
> +	if (ctx->stopped)
> +		return;
> +
> +	vbuf =3D al_dec_dequeue_src_buf(ctx, evt.bufferHandle);
> +	if (!vbuf) {
> +		al_v4l2_err(dev, "Unable to find bitsream buffer 0x%llx",
> +			=C2=A0=C2=A0=C2=A0 evt.bufferHandle);
> +		return;
> +	}
> +
> +	al_v4l2_dbg(dev, 3, "Release bitstream buffer %p", vbuf);
> +	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
> +}
> +
> +static void handle_eos_evt(struct al_dec_ctx *ctx, struct msg_itf_header=
 *hdr)
> +{
> +	struct msg_itf_evt_frame_buffer_decode evt;
> +	struct al_codec_dev *dev =3D ctx->dev;
> +
> +	if (al_common_get_data(dev, (char *)&evt, hdr->payload_len)) {
> +		al_v4l2_err(dev, "Unable to get frame buffer event");
> +		return;
> +	}
> +
> +	/* set LAST_FLAG to the last done CAPTURE buffer*/
> +	al_mark_last_dst_buf(ctx);
> +	/* Set eos event */
> +	al_queue_eos_event(ctx);
> +}
> +
> +static void handle_frame_buffer_decode_evt(struct al_dec_ctx *ctx,
> +					=C2=A0=C2=A0 struct msg_itf_header *hdr)
> +{
> +	struct msg_itf_evt_frame_buffer_decode evt;
> +	struct al_codec_dev *dev =3D ctx->dev;
> +	struct vb2_v4l2_buffer *vbuf;
> +	struct al_buffer_meta *meta;
> +
> +	if (al_common_get_data(dev, (char *)&evt, hdr->payload_len)) {
> +		al_v4l2_err(dev, "Unable to get frame buffer event");
> +		return;
> +	}
> +
> +	vbuf =3D al_dec_dequeue_dst_buf(ctx, evt.bufferHandle);
> +	if (!vbuf) {
> +		al_v4l2_err(dev, "Unable to find frame buffer 0x%llx",
> +			=C2=A0=C2=A0=C2=A0 evt.bufferHandle);
> +		return;
> +	}
> +
> +	meta =3D &evt.meta;
> +	al_v4l2_dbg(dev, 3, "Decoded frame done for buffer %p (%d) (%lld)",
> +		=C2=A0=C2=A0=C2=A0 vbuf, meta->last, evt.size);
> +
> +	vb2_set_plane_payload(&vbuf->vb2_buf, 0, evt.size);
> +	vbuf->field =3D V4L2_FIELD_NONE;
> +	vbuf->sequence =3D ctx->csequence++;
> +	vbuf->timecode =3D meta->timecode;
> +	vbuf->vb2_buf.timestamp =3D meta->timestamp;
> +
> +	if (meta->last || (vbuf->flags & V4L2_BUF_FLAG_LAST)) {
> +		vbuf->flags |=3D V4L2_BUF_FLAG_LAST;
> +		v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
> +	}
> +
> +	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
> +}
> +
> +static int al_handle_cmd_reply(struct al_codec_dev *dev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct msg_itf_header *hdr)
> +{
> +	struct al_dec_ctx *ctx;
> +	struct al_codec_cmd *cmd =3D NULL;
> +	int ret =3D 0;
> +
> +	ctx =3D al_ctx_get(dev, hdr->drv_ctx_hdl);
> +	if (IS_ERR_OR_NULL(ctx)) {
> +		al_v4l2_err(dev, "Unable to find ctx %p for reply %d",
> +			=C2=A0=C2=A0=C2=A0 al_phys_to_virt(hdr->drv_ctx_hdl), hdr->type);
> +		return -EINVAL;
> +	}
> +
> +	cmd =3D al_codec_cmd_get(&ctx->cmd_q_list, hdr->drv_cmd_hdl);
> +	if (!cmd) {
> +		al_v4l2_err(dev, "Unable to find command %p for reply %d",
> +			=C2=A0=C2=A0=C2=A0 al_phys_to_virt(hdr->drv_cmd_hdl), hdr->type);
> +		ret =3D -EINVAL;
> +		goto ctx_put;
> +	}
> +
> +	if (cmd->reply_size !=3D hdr->payload_len) {
> +		al_v4l2_err(dev, "mismatch size %d %d", cmd->reply_size,
> +			=C2=A0=C2=A0=C2=A0 hdr->payload_len);
> +		ret =3D -EINVAL;
> +		goto cmd_put;
> +	}
> +
> +	ret =3D al_common_get_data(dev, cmd->reply, hdr->payload_len);
> +	if (ret)
> +		al_v4l2_err(dev, "Unable to copy reply");
> +
> +	complete(&cmd->done);
> +	ret =3D 0;
> +
> +cmd_put:
> +	al_codec_cmd_put(cmd);
> +ctx_put:
> +	al_ctx_put(ctx);
> +
> +	return ret;
> +}
> +
> +static int al_handle_cmd_evt(struct al_codec_dev *dev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct msg_itf_header *hdr, int type)
> +{
> +	static u32 evt_sizes[] =3D {
> +		sizeof(struct msg_itf_evt_error),
> +		sizeof(struct msg_itf_evt_resolution_found),
> +		sizeof(struct msg_itf_evt_bitstream_buffer_release),
> +		sizeof(struct msg_itf_evt_frame_buffer_decode),
> +		sizeof(struct msg_itf_evt_eos),
> +	};
> +
> +	u32 evt_size;
> +	struct al_dec_ctx *ctx =3D NULL;
> +	int ret =3D 0;
> +
> +	if (type < MSG_ITF_TYPE_NEXT_EVT || type > MSG_ITF_TYPE_END_EVT) {
> +		al_v4l2_err(dev, "Unsupporting event type %d", type);
> +		return -EINVAL;
> +	}
> +
> +	ctx =3D al_ctx_get(dev, hdr->drv_ctx_hdl);
> +	if (!ctx) {
> +		al_v4l2_err(dev, "Unable to find ctx %p for evt %d",
> +			=C2=A0=C2=A0=C2=A0 al_phys_to_virt(hdr->drv_ctx_hdl), type);
> +		return -EINVAL;
> +	}
> +
> +	// Check the received event size and the expected one
> +	evt_size =3D evt_sizes[type - MSG_ITF_TYPE_NEXT_EVT];
> +	if (hdr->payload_len !=3D evt_size) {
> +		al_v4l2_err(
> +			dev,
> +			"Invalid event size for client (%p) for evt (%d) : Got (%d), expected=
 (%d)",
> +			al_phys_to_virt(hdr->drv_ctx_hdl), type,
> +			hdr->payload_len, evt_size);
> +		ret =3D -EINVAL;
> +		goto clean_ctx;
> +	}
> +
> +	al_v4l2_dbg(dev, 3, "Event received from MCU (%d)", type);
> +
> +	switch (type) {
> +	case MSG_ITF_TYPE_EVT_ERROR:
> +		handle_error_evt(ctx, hdr);
> +		break;
> +	case MSG_ITF_TYPE_EVT_RESOLUTION_FOUND:
> +		handle_resolution_found_evt(ctx, hdr);
> +		break;
> +	case MSG_ITF_TYPE_EVT_BITSTREAM_BUFFER_RELEASE:
> +		handle_bitstream_buffer_release_evt(ctx, hdr);
> +		break;
> +	case MSG_ITF_TYPE_EVT_FRAME_BUFFER_DECODE:
> +		handle_frame_buffer_decode_evt(ctx, hdr);
> +		break;
> +	case MSG_ITF_TYPE_EVT_EOS:
> +		handle_eos_evt(ctx, hdr);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +clean_ctx:
> +	al_ctx_put(ctx);
> +	return ret;
> +}
> +
> +static void al_dec_process_msg(void *cb_arg, struct msg_itf_header *hdr)
> +{
> +	struct al_codec_dev *dev =3D cb_arg;
> +	int ret;
> +
> +	if (is_type_reply(hdr->type))
> +		ret =3D al_handle_cmd_reply(dev, hdr);
> +	else if (is_type_event(hdr->type))
> +		ret =3D al_handle_cmd_evt(dev, hdr, hdr->type);
> +	else {
> +		al_v4l2_err(dev, "Unsupported message type %d", hdr->type);
> +		ret =3D -EINVAL;
> +	}
> +
> +	if (ret) {
> +		al_v4l2_err(dev, "Skip received data");
> +		al_common_skip_data(dev, hdr->payload_len);
> +	}
> +}
> +
> +static const struct video_device al_videodev =3D {
> +	.name =3D "allegro-decoder",
> +	.fops =3D &al_dec_file_ops,
> +	.ioctl_ops =3D &al_dec_ioctl_ops,
> +	.minor =3D -1,
> +	.release =3D video_device_release_empty,
> +	.vfl_dir =3D VFL_DIR_M2M,
> +	.device_caps =3D V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING,
> +};
> +
> +static void al_dec_register_v4l2(void *cb_arg)
> +{
> +	struct al_codec_dev *dev =3D cb_arg;
> +	struct video_device *video_dev =3D NULL;
> +	int ret;
> +
> +	ret =3D v4l2_device_register(&dev->pdev->dev, &dev->v4l2_dev);
> +	if (ret) {
> +		al_v4l2_err(dev, "Unable to register v4l2 device %d", ret);
> +		return;
> +	}
> +
> +	dev->m2m_dev =3D v4l2_m2m_init(&al_dec_m2m_ops);
> +	if (IS_ERR(dev->m2m_dev)) {
> +		ret =3D PTR_ERR(dev->m2m_dev);
> +		al_v4l2_err(dev, "failed to init mem2mem device %d", ret);
> +		goto v4l2_m2m_init_error;
> +	}
> +
> +	video_dev =3D &dev->video_dev;
> +	*video_dev =3D al_videodev;
> +
> +	video_dev->lock =3D &dev->lock;
> +	video_dev->v4l2_dev =3D &dev->v4l2_dev;
> +
> +	video_set_drvdata(video_dev, dev);
> +	ret =3D video_register_device(video_dev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		al_v4l2_err(dev, "failed to register video device %d", ret);
> +		goto video_register_device_error;
> +	}
> +
> +	v4l2_info(&dev->v4l2_dev, "registered as /dev/video%d\n",
> +		=C2=A0 dev->video_dev.num);
> +
> +	dev->is_video_init_done =3D 1;
> +
> +	return;
> +
> +video_register_device_error:
> +	v4l2_m2m_release(dev->m2m_dev);
> +v4l2_m2m_init_error:
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +}
> +
> +static int al_dec_probe(struct platform_device *pdev)
> +{
> +	struct al_codec_dev *al_dev;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np =3D dev->of_node;
> +	const struct al_match_data *match_data;
> +	const char *firmware;
> +	int ret;
> +
> +	dev_info(dev, "Probing ...\n");
> +
> +	match_data =3D device_get_match_data(dev);
> +	if (!match_data) {
> +		dev_err(dev, "Missing device match data\n");
> +		return -EINVAL;
> +	}
> +
> +	al_dev =3D devm_kzalloc(dev, sizeof(*al_dev), GFP_KERNEL);
> +	if (!al_dev)
> +		return -ENOMEM;
> +
> +	al_dev->pdev =3D pdev;
> +	al_dev->is_video_init_done =3D 0;
> +	mutex_init(&al_dev->lock);
> +	mutex_init(&al_dev->ctx_mlock);
> +	INIT_LIST_HEAD(&al_dev->ctx_q_list);
> +
> +	al_dev->cb_arg =3D al_dev;
> +	al_dev->process_msg_cb =3D al_dec_process_msg;
> +	al_dev->fw_ready_cb =3D al_dec_register_v4l2;
> +
> +	/* firmware-name is optional in DT */
> +	of_property_read_string(np, "firmware-name", &firmware);
> +	if (!firmware)
> +		firmware =3D match_data->fw_name;
> +
> +	ret =3D al_common_probe(al_dev, firmware);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, al_dev);
> +	dev_info(dev, "Probing done successfully %p\n", al_dev);
> +
> +	return 0;
> +}
> +
> +static void al_dec_remove(struct platform_device *pdev)
> +{
> +	struct al_codec_dev *dev =3D platform_get_drvdata(pdev);
> +
> +	dev_info(&pdev->dev, "remove %p\n", dev);
> +
> +	if (dev->is_video_init_done) {
> +		video_unregister_device(&dev->video_dev);
> +		if (dev->m2m_dev)
> +			v4l2_m2m_release(dev->m2m_dev);
> +		v4l2_device_unregister(&dev->v4l2_dev);
> +	}
> +
> +	al_common_remove(dev);
> +}
> +
> +static const struct al_match_data ald300_data =3D {
> +	.fw_name =3D "al300-vdec.fw",
> +};
> +
> +static const struct of_device_id v4l2_al_dec_dt_match[] =3D {
> +	{ .compatible =3D "allegro,al300-vdec", .data =3D &ald300_data },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, v4l2_al_dec_dt_match);
> +
> +static struct platform_driver al300_vdec_drv =3D {
> +	.probe =3D al_dec_probe,
> +	.remove =3D al_dec_remove,
> +	.driver =3D {
> +		.name =3D "al300_vdec",
> +		.of_match_table =3D of_match_ptr(v4l2_al_dec_dt_match),
> +	},
> +};
> +
> +module_platform_driver(al300_vdec_drv);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:al300-vdec");
> +MODULE_AUTHOR("Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>");
> +MODULE_DESCRIPTION("Allegro DVT V4l2 decoder driver gen 3");
> diff --git a/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h b/dri=
vers/media/platform/allegro-
> dvt/al300/al_vdec_drv.h
> new file mode 100644
> index 000000000000..8d8f2b9e734a
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h
> @@ -0,0 +1,94 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2025 Allegro DVT.
> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
> + */
> +
> +#ifndef __AL_VDEC_DRV__
> +#define __AL_VDEC_DRV__
> +
> +#include "al_codec_util.h"
> +
> +enum {
> +	MSG_ITF_TYPE_EVT_RESOLUTION_FOUND =3D MSG_ITF_TYPE_NEXT_EVT + 1,
> +	MSG_ITF_TYPE_EVT_BITSTREAM_BUFFER_RELEASE,
> +	MSG_ITF_TYPE_EVT_FRAME_BUFFER_DECODE,
> +	MSG_ITF_TYPE_EVT_EOS,
> +	/* Mark the end of the events list.*/
> +	MSG_ITF_TYPE_END_EVT,
> +};
> +
> +struct msg_itf_create_decoder_req {
> +	unsigned int codec;
> +} __packed;
> +DECLARE_FULL_REQ(msg_itf_create_decoder_req);
> +
> +struct msg_itf_evt_resolution_found {
> +	u16 buffer_nb;
> +	u16 width;
> +	u16 height;
> +	u32 pixelformat;
> +	u32 sizeimage;
> +	u32 bytesperline;
> +} __packed;
> +DECLARE_FULL_EVENT(msg_itf_evt_resolution_found);
> +
> +struct msg_itf_evt_bitstream_buffer_release {
> +	u64 bufferHandle;
> +} __packed;
> +DECLARE_FULL_EVENT(msg_itf_evt_bitstream_buffer_release);
> +
> +struct msg_itf_evt_frame_buffer_decode {
> +	u64 bufferHandle;
> +	u64 size;
> +	struct al_buffer_meta meta;
> +} __packed;
> +DECLARE_FULL_EVENT(msg_itf_evt_frame_buffer_decode);
> +
> +struct msg_itf_evt_eos {
> +	u32 unused;
> +} __packed;
> +DECLARE_FULL_EVENT(msg_itf_evt_eos);
> +
> +struct al_fmt {
> +	u32 pixelformat;
> +	u8 bpp;
> +};
> +
> +struct al_frame {
> +	u32 width;
> +	u32 height;
> +	u32 bytesperline;
> +	u32 sizeimage;
> +	u32 nbuffers;
> +	const struct al_fmt *fmt;
> +	enum v4l2_field field;
> +	enum v4l2_colorspace colorspace;
> +	enum v4l2_ycbcr_encoding ycbcr_enc;
> +	enum v4l2_quantization quantization;
> +	enum v4l2_xfer_func xfer_func;
> +};
> +
> +struct al_dec_ctx {
> +	struct al_codec_dev *dev;
> +	struct v4l2_fh fh;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct kref refcount;
> +	struct list_head list;
> +	/* CAP and OUT frames */
> +	struct al_frame src;
> +	struct al_frame dst;
> +	struct completion res_done; /* Resolution found event */
> +	u32 codec;
> +	u64 hDec;
> +	struct list_head cmd_q_list; /* Store active commands */
> +	struct mutex buf_q_mlock;
> +	struct list_head frame_q_list;
> +	struct list_head stream_q_list;
> +	u32 csequence;
> +	u32 osequence;
> +	bool stopped;
> +	bool aborting;
> +};
> +
> +#endif /*__AL_VDEC_DRV__*/

