Return-Path: <linux-media+bounces-12864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 399FF902431
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 16:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE2EA2815B2
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 14:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B8612FB26;
	Mon, 10 Jun 2024 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LBIbSg6I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED82823DF
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718030374; cv=none; b=EAIjq20/JIIlLFC8eTfmLgyD417o4ssAJDazvktPyJt2pmNnvnZQC4K63+mzKI0arR8eAhN+xbVNuQS1gOPgnDuT3oWPWK3Zc1mN824XLZIvlBwg7g7gHwZXRT1F3pB8DEZ9Byr82FeDwLo0GTrHqrFAAfpPdAV30XaL5vRnjv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718030374; c=relaxed/simple;
	bh=+FmAZLcvrqXJMizFYFeK/r/mwT6iT3tD+VY7V/Gp4Js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWkMj89MnFhNUJ1buACvzvhx12s0cYwvYcIjjFIC6t6UwNqQKqZwxV/W8yQeqqQf0f6zC4qorL7GzJiqQnY0d8IIZ7K5MovmxA1rjL1o3vNXuzNiM46FbtGvlxECEoADsuSgBJdpIicZ8QddmfQNYiqhMMv3xb/ur+7xH3ZyZH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LBIbSg6I; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6f0dc80ab9so243666966b.2
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 07:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718030370; x=1718635170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=515hyHh2OePp2ZKplMHkbaw9OZZrL/aJNqHnqeEor+8=;
        b=LBIbSg6IxO1vu21KpB0gRf9hLaDgCNc7BZepCkhObdcpYa/ABRN5BBsNSpJWDe5zHq
         LWSNnbNCxe4uE7lLMhYfA0H19iJF21G5NFA6ZyM485KnkoDzB9X5xO45/bGoAScW+Ftv
         XUyrhM4phqTTw6IPoGFQU6M9fOgZNh3dXpVvRYZk85Yt3lge6hb7taWPRQi1bonXp/pi
         BLLWA6vt3++qKpRWYSoUcvs6SpauY1DiPlVWXtclimgtdGcWnI6S2USUrfhcyVfGaRCK
         9SZcUTY5oZbcubyEi9mzntb9xzD4xgVjCDPQzcPBiGMPDUsQy764AOvDtXCHtuAtCk3F
         9PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718030370; x=1718635170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=515hyHh2OePp2ZKplMHkbaw9OZZrL/aJNqHnqeEor+8=;
        b=lew9UsJP4OxQ7PmSJyi8QB1wVatFhUBMSHU+pPUlyg6b3+0uEzdFtA6QVH+9DrI76D
         h1X+6c4msRFuYW7Z5/kCVrGUcTJidLBAv/aNM25p7Gd36akmrBd4yyE0YzM4oULJtdYG
         jgtd6wbG/XCIw5dY3QA8aVJoTvAjJI+6krqQy6485cTIkkQyV1RtBlLWuOd9OhHODrCj
         65d5R0l38DICSe2Jlt8QAOvI7N/XGR7xMb34leCNqS0gyxx7sLd7Xhn97+lxeLQH6twu
         v2+vxnmlhr8O0h1y3ksPrhaEW2p616cnPpjjue9KVqddTZMi7FNKtHvSWTELijct933o
         /TaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhgZtLJOprq1XUodzu9jSoTZdSDs/sU7aWVFmbTzDPZdwaHQB9OK/y9/ZIbsHE/EV0pJ/1wbt+PnD7TKJQbVT1uPwIxKtyjYst/Cg=
X-Gm-Message-State: AOJu0YyjF3VG/8YuoA3JsYYs7idFNGyeCYjSd4Z3wbmYQEeloNaY3BwR
	ivdVIQnG73lMP2Lrk9I+zeyjA0LVSMhJVR5cwOb5A2d/uuAsHnGxvttDB10FIT2Hcg5YNicRvrr
	txGG6CtEr63IZyz7oXdLKpQIq9ze6qkjfeXjdAQ==
X-Google-Smtp-Source: AGHT+IHQVmGrcK6D3eaNaZZFbnnHYpSJpg8ZAhHtVGSoqK0rSGinggxD+JMKG0hwfE+5VDnQC1Ih2YPh2S/cM3zAjFM=
X-Received: by 2002:a17:906:130d:b0:a6f:15c9:9aa3 with SMTP id
 a640c23a62f3a-a6f15c9af69mr246142166b.67.1718030369870; Mon, 10 Jun 2024
 07:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-4-jstephan@baylibre.com> <3c2bee40-3792-409c-b42f-f8b013ff641c@collabora.com>
In-Reply-To: <3c2bee40-3792-409c-b42f-f8b013ff641c@collabora.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 10 Jun 2024 16:39:19 +0200
Message-ID: <CAEHHSvaT_U+HNzWQUoK9EuqGuqEd11+Lu0CLz_rL7uQf0Q5isw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>, 
	Florian Sylvestre <fsylvestre@baylibre.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Elder <paul.elder@ideasonboard.com>, 
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 11 janv. 2024 =C3=A0 13:04, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 10/01/24 15:14, Julien Stephan ha scritto:
> > From: Louis Kuo <louis.kuo@mediatek.com>
> >
> > This will add the mediatek ISP3.0 seninf (sensor interface) driver foun=
d
> > on several Mediatek SoCs such as the mt8365.
> >
> > Then seninf module has 4 physical CSI-2 inputs. Depending on the soc th=
ey
> > may not be all connected.
> >
> > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >   MAINTAINERS                                   |    1 +
> >   drivers/media/platform/mediatek/Kconfig       |    1 +
> >   drivers/media/platform/mediatek/Makefile      |    1 +
> >   drivers/media/platform/mediatek/isp/Kconfig   |    2 +
> >   drivers/media/platform/mediatek/isp/Makefile  |    3 +
> >   .../platform/mediatek/isp/isp_30/Kconfig      |   16 +
> >   .../platform/mediatek/isp/isp_30/Makefile     |    3 +
> >   .../mediatek/isp/isp_30/seninf/Makefile       |    5 +
> >   .../mediatek/isp/isp_30/seninf/mtk_seninf.c   | 1488 ++++++++++++++++=
+
> >   .../isp/isp_30/seninf/mtk_seninf_reg.h        |  112 ++
> >   10 files changed, 1632 insertions(+)
> >   create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
> >   create mode 100644 drivers/media/platform/mediatek/isp/Makefile
> >   create mode 100644 drivers/media/platform/mediatek/isp/isp_30/Kconfig
> >   create mode 100644 drivers/media/platform/mediatek/isp/isp_30/Makefil=
e
> >   create mode 100644 drivers/media/platform/mediatek/isp/isp_30/seninf/=
Makefile
> >   create mode 100644 drivers/media/platform/mediatek/isp/isp_30/seninf/=
mtk_seninf.c
> >   create mode 100644 drivers/media/platform/mediatek/isp/isp_30/seninf/=
mtk_seninf_reg.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3ea2158864e1..52d200d5e36c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13618,6 +13618,7 @@ M:    Andy Hsieh <andy.hsieh@mediatek.com>
> >   S:  Supported
> >   F:  Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yam=
l
> >   F:  Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.ya=
ml
> > +F:   drivers/media/platform/mediatek/isp/isp_30/seninf/*
> >
> >   MEDIATEK SMI DRIVER
> >   M:  Yong Wu <yong.wu@mediatek.com>
> > diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/pl=
atform/mediatek/Kconfig
> > index 84104e2cd024..4e0a5a43f35e 100644
> > --- a/drivers/media/platform/mediatek/Kconfig
> > +++ b/drivers/media/platform/mediatek/Kconfig
> > @@ -7,3 +7,4 @@ source "drivers/media/platform/mediatek/mdp/Kconfig"
> >   source "drivers/media/platform/mediatek/vcodec/Kconfig"
> >   source "drivers/media/platform/mediatek/vpu/Kconfig"
> >   source "drivers/media/platform/mediatek/mdp3/Kconfig"
> > +source "drivers/media/platform/mediatek/isp/Kconfig"
> > diff --git a/drivers/media/platform/mediatek/Makefile b/drivers/media/p=
latform/mediatek/Makefile
> > index 38e6ba917fe5..695f05f525a6 100644
> > --- a/drivers/media/platform/mediatek/Makefile
> > +++ b/drivers/media/platform/mediatek/Makefile
> > @@ -4,3 +4,4 @@ obj-y +=3D mdp/
> >   obj-y +=3D vcodec/
> >   obj-y +=3D vpu/
> >   obj-y +=3D mdp3/
> > +obj-y +=3D isp/
> > diff --git a/drivers/media/platform/mediatek/isp/Kconfig b/drivers/medi=
a/platform/mediatek/isp/Kconfig
> > new file mode 100644
> > index 000000000000..708b9a6660d2
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/isp/Kconfig
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +source "drivers/media/platform/mediatek/isp/isp_30/Kconfig"
> > diff --git a/drivers/media/platform/mediatek/isp/Makefile b/drivers/med=
ia/platform/mediatek/isp/Makefile
> > new file mode 100644
> > index 000000000000..a81ab33d0dd3
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/isp/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +obj-y +=3D isp_30/
> > diff --git a/drivers/media/platform/mediatek/isp/isp_30/Kconfig b/drive=
rs/media/platform/mediatek/isp/isp_30/Kconfig
> > new file mode 100644
> > index 000000000000..9791312589fb
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/isp/isp_30/Kconfig
> > @@ -0,0 +1,16 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config MTK_SENINF30
> > +     tristate "MediaTek ISP3.0 SENINF driver"
> > +     depends on VIDEO_V4L2_SUBDEV_API
> > +     depends on MEDIA_CAMERA_SUPPORT
> > +     depends on ARCH_MEDIATEK || COMPILE_TEST
> > +     depends on OF
> > +     select V4L2_FWNODE
> > +     default n
> > +     help
> > +       This driver provides a MIPI CSI-2 receiver interface to connect
> > +       an external camera module with MediaTek ISP3.0. It is able to h=
andle
> > +       multiple cameras at the same time.
> > +
> > +       To compile this driver as a module, choose M here: the
> > +       module will be called mtk-seninf.
> > diff --git a/drivers/media/platform/mediatek/isp/isp_30/Makefile b/driv=
ers/media/platform/mediatek/isp/isp_30/Makefile
> > new file mode 100644
> > index 000000000000..ac3142de4739
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/isp/isp_30/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +obj-$(CONFIG_MTK_SENINF30) +=3D seninf/
> > diff --git a/drivers/media/platform/mediatek/isp/isp_30/seninf/Makefile=
 b/drivers/media/platform/mediatek/isp/isp_30/seninf/Makefile
> > new file mode 100644
> > index 000000000000..f28480d6d6c3
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/isp/isp_30/seninf/Makefile
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +mtk-seninf-objs +=3D mtk_seninf.o
> > +
> > +obj-$(CONFIG_MTK_SENINF30) +=3D mtk-seninf.o
> > diff --git a/drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seni=
nf.c b/drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c
> > new file mode 100644
> > index 000000000000..67b2c697d9ca
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c
> > @@ -0,0 +1,1488 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2022 MediaTek Inc.
> > + */
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/videodev2.h>
> > +#include <media/media-device.h>
> > +#include <media/media-entity.h>
> > +#include <media/v4l2-async.h>
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-dev.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-mc.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +#include "mtk_seninf_reg.h"
> > +
> > +#define SENINF_TIMESTAMP_STEP                0x67
> > +#define SENINF_SETTLE_DELAY          0x15
> > +#define SENINF_HS_TRAIL_PARAMETER    0x8
> > +
> > +#define SENINF_MAX_NUM_INPUTS                4
> > +#define SENINF_MAX_NUM_OUTPUTS               6
> > +#define SENINF_MAX_NUM_MUXES         6
> > +#define SENINF_MAX_NUM_PADS          (SENINF_MAX_NUM_INPUTS + \
> > +                                      SENINF_MAX_NUM_OUTPUTS)
> > +
> > +#define SENINF_DEFAULT_BUS_FMT               MEDIA_BUS_FMT_SGRBG10_1X1=
0
> > +#define SENINF_DEFAULT_WIDTH         1920
> > +#define SENINF_DEFAULT_HEIGHT                1080
> > +
> > +#define SENINF_PAD_10BIT             0
> > +
> > +#define SENINF_TEST_MODEL            0
> > +#define SENINF_NORMAL_MODEL          1
> > +#define SENINF_ALL_ERR_IRQ_EN                0x7f
> > +#define SENINF_IRQ_CLR_SEL           0x80000000
> > +
> > +#define SENINF_MIPI_SENSOR           0x8
> > +
> > +#define MTK_CSI_MAX_LANES 4
> > +
> > +/* Port number in the device tree. */
> > +enum mtk_seninf_port {
> > +     CSI_PORT_0 =3D 0, /* 4D1C or 2D1C */
> > +     CSI_PORT_1,     /* 4D1C */
> > +     CSI_PORT_2,     /* 4D1C */
> > +     CSI_PORT_0B,    /* 2D1C */
> > +};
> > +
> > +enum mtk_seninf_id {
> > +     SENINF_1 =3D 0,
> > +     SENINF_2 =3D 1,
> > +     SENINF_3 =3D 2,
> > +     SENINF_5 =3D 4,
> > +};
> > +
> > +static const u32 port_to_seninf_id[] =3D {
> > +     [CSI_PORT_0] =3D SENINF_1,
> > +     [CSI_PORT_1] =3D SENINF_3,
> > +     [CSI_PORT_2] =3D SENINF_5,
> > +     [CSI_PORT_0B] =3D SENINF_2,
> > +};
> > +
> > +enum mtk_seninf_phy_mode {
> > +     SENINF_PHY_MODE_NONE,
> > +     SENINF_PHY_MODE_4D1C,
> > +     SENINF_PHY_MODE_2D1C,
> > +};
> > +
> > +enum mtk_seninf_format_flag {
> > +     MTK_SENINF_FORMAT_BAYER =3D BIT(0),
> > +     MTK_SENINF_FORMAT_DPCM =3D BIT(1),
> > +     MTK_SENINF_FORMAT_JPEG =3D BIT(2),
> > +     MTK_SENINF_FORMAT_INPUT_ONLY =3D BIT(3),
> > +};
> > +
> > +/**
> > + * struct mtk_seninf_conf - Model-specific SENINF parameters
> > + * @model: Model description
> > + * @nb_inputs: Number of SENINF inputs
> > + * @nb_muxes: Number of SENINF MUX (FIFO) instances
> > + * @nb_outputs: Number of outputs (to CAM and CAMSV instances)
> > + */
> > +struct mtk_seninf_conf {
> > +     const char *model;
> > +     u8 nb_inputs;
> > +     u8 nb_muxes;
> > +     u8 nb_outputs;
> > +};
> > +
> > +/**
> > + * struct mtk_seninf_format_info - Information about media bus formats
> > + * @code: V4L2 media bus code
> > + * @flags: Flags describing the format, as a combination of MTK_SENINF=
_FORMAT_*
> > + */
> > +struct mtk_seninf_format_info {
> > +     u32 code;
> > +     u32 flags;
> > +};
> > +
> > +/**
> > + * struct mtk_seninf_input - SENINF input block
> > + * @pad: DT port and media entity pad number
> > + * @seninf_id: SENINF hardware instance ID
> > + * @base: Memory mapped I/O based address
> > + * @seninf: Back pointer to the mtk_seninf
> > + * @phy: PHY connected to the input
> > + * @phy_mode: PHY operation mode (NONE when the input is not connected=
)
> > + * @bus: CSI-2 bus configuration from DT
> > + * @source_sd: Source subdev connected to the input
> > + */
> > +struct mtk_seninf_input {
> > +     enum mtk_seninf_port pad;
> > +     enum mtk_seninf_id seninf_id;
> > +     void __iomem *base;
> > +     struct mtk_seninf *seninf;
> > +
> > +     struct phy *phy;
> > +     enum mtk_seninf_phy_mode phy_mode;
> > +
> > +     struct v4l2_mbus_config_mipi_csi2 bus;
> > +
> > +     struct v4l2_subdev *source_sd;
> > +};
> > +
> > +/**
> > + * struct mtk_seninf_mux - SENINF MUX channel
> > + * @pad: DT port and media entity pad number
> > + * @mux_id: MUX hardware instance ID
> > + * @base: Memory mapped I/O based address
> > + * @seninf: Back pointer to the mtk_seninf
> > + */
> > +struct mtk_seninf_mux {
> > +     unsigned int pad;
> > +     unsigned int mux_id;
> > +     void __iomem *base;
> > +     struct mtk_seninf *seninf;
> > +};
> > +
> > +/**
> > + * struct mtk_seninf - Top-level SENINF device
> > + * @dev: The (platform) device
> > + * @phy: PHYs at the SENINF inputs
> > + * @num_clks: Number of clocks in the clks array
> > + * @clks: Clocks
> > + * @base: Memory mapped I/O base address
> > + * @media_dev: Media controller device
> > + * @v4l2_dev: V4L2 device
> > + * @subdev: V4L2 subdevice
> > + * @pads: Media entity pads
> > + * @notifier: V4L2 async notifier for source subdevs
> > + * @ctrl_handler: V4L2 controls handler
> > + * @source_format: Active format on the source pad
> > + * @inputs: Array of SENINF inputs
> > + * @muxes: Array of MUXes
> > + * @conf: Model-specific SENINF parameters
> > + * @is_testmode: Whether or not the test pattern generator is enabled
> > + */
> > +struct mtk_seninf {
> > +     struct device *dev;
> > +     struct phy *phy[5];
> > +     unsigned int num_clks;
> > +     struct clk_bulk_data *clks;
> > +     void __iomem *base;
> > +
> > +     struct media_device media_dev;
> > +     struct v4l2_device v4l2_dev;
> > +     struct v4l2_subdev subdev;
> > +     struct media_pad pads[SENINF_MAX_NUM_PADS];
> > +     struct v4l2_async_notifier notifier;
> > +     struct v4l2_ctrl_handler ctrl_handler;
> > +
> > +     struct mtk_seninf_input inputs[SENINF_MAX_NUM_INPUTS];
> > +     struct mtk_seninf_mux muxes[SENINF_MAX_NUM_MUXES];
> > +
> > +     const struct mtk_seninf_conf *conf;
> > +
> > +     bool is_testmode;
> > +};
> > +
> > +inline struct mtk_seninf *sd_to_mtk_seninf(struct v4l2_subdev *sd)
> > +{
> > +     return container_of(sd, struct mtk_seninf, subdev);
> > +}
> > +
> > +static inline bool mtk_seninf_pad_is_sink(struct mtk_seninf *priv,
> > +                                       unsigned int pad)
> > +{
> > +     return pad < priv->conf->nb_inputs;
> > +}
> > +
> > +static inline bool mtk_seninf_pad_is_source(struct mtk_seninf *priv,
> > +                                         unsigned int pad)
> > +{
> > +     return !mtk_seninf_pad_is_sink(priv, pad);
> > +}
> > +
> > +/* -------------------------------------------------------------------=
----------
> > + * Formats
> > + */
> > +
> > +static const struct mtk_seninf_format_info mtk_seninf_formats[] =3D {
> > +     {
> > +             .code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SBGGR14_1X14,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SGBRG14_1X14,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SGRBG14_1X14,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SRGGB14_1X14,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SBGGR16_1X16,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SGBRG16_1X16,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SGRBG16_1X16,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SRGGB16_1X16,
> > +             .flags =3D MTK_SENINF_FORMAT_BAYER,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_VYUY8_1X16,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_YUYV8_1X16,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_YVYU8_1X16,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_JPEG_1X8,
> > +             .flags =3D MTK_SENINF_FORMAT_JPEG,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8,
> > +             .flags =3D MTK_SENINF_FORMAT_JPEG,
> > +     },
> > +     /* Keep the input-only formats last. */
>
> Your comment doesn't make me understand why input-only formats shall be
> placed last - and makes me think that having two arrays (one for both
> and one for input only) would be easier and less error prone, other than
> making you able to drop the MTK_SENINF_FORMAT_INPUT_ONLY flag entirely.
>
> > +     {
> > +             .code =3D MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
> > +             .flags =3D MTK_SENINF_FORMAT_DPCM | MTK_SENINF_FORMAT_INP=
UT_ONLY,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
> > +             .flags =3D MTK_SENINF_FORMAT_DPCM | MTK_SENINF_FORMAT_INP=
UT_ONLY,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
> > +             .flags =3D MTK_SENINF_FORMAT_DPCM | MTK_SENINF_FORMAT_INP=
UT_ONLY,
> > +     }, {
> > +             .code =3D MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
> > +             .flags =3D MTK_SENINF_FORMAT_DPCM | MTK_SENINF_FORMAT_INP=
UT_ONLY,
> > +     }
> > +};
> > +
> > +static const struct mtk_seninf_format_info *mtk_seninf_format_info(u32=
 code)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(mtk_seninf_formats); ++i) {
> > +             if (mtk_seninf_formats[i].code =3D=3D code)
> > +                     return &mtk_seninf_formats[i];
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
>
> ..snip..
>
> > +
> > +static void mtk_seninf_input_setup_csi2(struct mtk_seninf_input *input=
,
> > +                                     struct v4l2_subdev_state *state)
> > +{
> > +     const struct mtk_seninf_format_info *fmtinfo;
> > +     const struct v4l2_mbus_framefmt *format;
> > +     unsigned int num_data_lanes =3D input->bus.num_data_lanes;
> > +     unsigned int val =3D 0;
> > +
> > +     format =3D v4l2_subdev_state_get_stream_format(state, input->pad,=
 0);
> > +     fmtinfo =3D mtk_seninf_format_info(format->code);
> > +
> > +     /* Configure timestamp */
> > +     writel(SENINF_TIMESTAMP_STEP, input->base + SENINF_TG1_TM_STP);
> > +
> > +     /* HQ */
> > +     writel(0x0, input->base + SENINF_TG1_PH_CNT);
>
> Zero means:
>   - Sensor master clock: ISP_CLK
>   - Sensor clock polarity: Rising edge
>   - Sensor reset deasserted
>   - Sensor powered up
>   - Pixel clock inversion disabled
>   - Sensor master clock polarity disabled
>   - Phase counter disabled
>
> > +     writel(0x10001, input->base + SENINF_TG1_SEN_CK);
>
> Unroll this one... this is the TG1 sensor clock divider.
>
> CLKFL GENMASK(5, 0)
> CLKRS GENMASK(13, 8)
> CLKCNT GENMASK(21,16)
>
> Like this, I don't get what you're trying to set, because you're using a =
fixed
> sensor clock rate, meaning that only a handful of camera sensors will be =
usable.
>
> Is this 8Mhz? 16? 24? what? :-)
>
> Two hints:
>   - sensor_clk =3D clk_get_rate(isp_clk) / (tg1_sen_ck_clkcnt + 1);
>   - int mtk_seninf_set_sensor_clk(u8 rate_mhz);
>
> Please :-)

Hi Angelo,

I think I get your point about not hardcoding the sensor rate, but I
am not sure how to use
a mtk_seninf_set_sensor_clk(u8 rate_mhz); function.

Where would it be called? How is it exposed to the user?

Cheers
Julien

>
> > +
> > +     /* First Enable Sensor interface and select pad (0x1a04_0200) */
> > +     mtk_seninf_input_update(input, SENINF_CTRL, SENINF_EN, 1);
> > +     mtk_seninf_input_update(input, SENINF_CTRL, PAD2CAM_DATA_SEL, SEN=
INF_PAD_10BIT);
> > +     mtk_seninf_input_update(input, SENINF_CTRL, SENINF_SRC_SEL, 0);
> > +     mtk_seninf_input_update(input, SENINF_CTRL_EXT, SENINF_CSI2_IP_EN=
, 1);
> > +     mtk_seninf_input_update(input, SENINF_CTRL_EXT, SENINF_NCSI2_IP_E=
N, 0);
> > +
> > +     /* DPCM Enable */
> > +     if (fmtinfo->flags & MTK_SENINF_FORMAT_DPCM)
> > +             val =3D SENINF_CSI2_DPCM_DI_2A_DPCM_EN;
> > +     else
> > +             val =3D SENINF_CSI2_DPCM_DI_30_DPCM_EN;
> > +     writel(val, input->base + SENINF_CSI2_DPCM);
> > +
> > +     /* Settle delay */
> > +     mtk_seninf_input_update(input, SENINF_CSI2_LNRD_TIMING,
> > +                             DATA_SETTLE_PARAMETER, SENINF_SETTLE_DELA=
Y);
> > +
> > +     /* HQ */
> > +     writel(0x10, input->base + SENINF_CSI2_LNRC_FSM);
>
> As far as I know, SENINF_CSI2_LNRC_FSM is a read-only register: this writ=
e will do
> exactly nothing...
>
> > +
> > +     /* CSI2 control */
> > +     val =3D readl(input->base + SENINF_CSI2_CTL)
> > +         | (FIELD_PREP(SENINF_CSI2_CTL_ED_SEL, DATA_HEADER_ORDER_DI_WC=
L_WCH)
> > +         | SENINF_CSI2_CTL_CLOCK_LANE_EN | (BIT(num_data_lanes) - 1));
> > +     writel(val, input->base + SENINF_CSI2_CTL);
> > +
> > +     mtk_seninf_input_update(input, SENINF_CSI2_RESYNC_MERGE_CTL,
> > +                             BYPASS_LANE_RESYNC, 0);
>
> 93 columns: fits in one line (not only this one!).
>
> > +     mtk_seninf_input_update(input, SENINF_CSI2_RESYNC_MERGE_CTL, CDPH=
Y_SEL, 0);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_RESYNC_MERGE_CTL,
> > +                             CPHY_LANE_RESYNC_CNT, 3);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_MODE, CSR_CSI2_MODE, 0=
);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_MODE, CSR_CSI2_HEADER_=
LEN, 0);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_DPHY_SYNC, SYNC_SEQ_MA=
SK_0, 0xff00);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_DPHY_SYNC, SYNC_SEQ_PA=
T_0, 0x001d);
> > +
> > +     mtk_seninf_input_update(input, SENINF_CSI2_CTL, CLOCK_HS_OPTION, =
0);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_CTL, HSRX_DET_EN, 0);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_CTL, HS_TRAIL_EN, 1);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_HS_TRAIL, HS_TRAIL_PAR=
AMETER,
> > +                             SENINF_HS_TRAIL_PARAMETER);
> > +
> > +     /* Set debug port to output packet number */
> > +     mtk_seninf_input_update(input, SENINF_CSI2_DGB_SEL, DEBUG_EN, 1);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_DGB_SEL, DEBUG_SEL, 0x=
1a);
> > +
> > +     /* HQ */
> > +     writel(0xfffffffe, input->base + SENINF_CSI2_SPARE0);
>
> I have no idea what this SPARE0 does, but I think that this is something =
that you
> want to get from platform_data, as I guess this would be different on var=
ious SoCs?
>
> > +
> > +     /* Enable CSI2 IRQ mask */
> > +     /* Turn on all interrupt */
> > +     writel(0xffffffff, input->base + SENINF_CSI2_INT_EN);
> > +     /* Write clear CSI2 IRQ */
> > +     writel(0xffffffff, input->base + SENINF_CSI2_INT_STATUS);
> > +     /* Enable CSI2 Extend IRQ mask */
>
> You missed:
>         writel(0xffffffff, input->base + SENINF_CSI2_INT_EN_EXT);
>
> P.S.: #define SENINF_CSI2_INT_EN_EXT 0x0b10
>
>
> > +     /* Turn on all interrupt */
>
> /* Reset the CSI2 to commit changes */ <-- makes more sense, doesn't it?
>
> > +     mtk_seninf_input_update(input, SENINF_CTRL, CSI2_SW_RST, 1);
> > +     udelay(1);
> > +     mtk_seninf_input_update(input, SENINF_CTRL, CSI2_SW_RST, 0);
> > +}
> > +
> > +static void mtk_seninf_mux_setup(struct mtk_seninf_mux *mux,
> > +                              struct mtk_seninf_input *input,
> > +                              struct v4l2_subdev_state *state)
> > +{
> > +     const struct mtk_seninf_format_info *fmtinfo;
> > +     const struct v4l2_mbus_framefmt *format;
> > +     unsigned int pix_sel_ext;
> > +     unsigned int pix_sel;
> > +     unsigned int hs_pol =3D 0;
> > +     unsigned int vs_pol =3D 0;
> > +     unsigned int val;
> > +     u32 rst_mask;
> > +
> > +     format =3D v4l2_subdev_state_get_stream_format(state, input->pad,=
 0);
> > +     fmtinfo =3D mtk_seninf_format_info(format->code);
> > +
> > +     /* Enable mux */
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_MUX_EN, 1);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_SRC_SEL, SENIN=
F_MIPI_SENSOR);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL_EXT, SENINF_SRC_SEL_EX=
T, SENINF_NORMAL_MODEL);
> > +
> > +     pix_sel_ext =3D 0;
> > +     pix_sel =3D 1;
>
>
>         pixels_per_cycle =3D 1;
>         bus_width =3D pixels_per_cycle >> 1;
>
> because:  0 =3D=3D 1pix/cyc, 1 =3D=3D 2pix/cyc, 2 =3D=3D 4pix/cyc, 3 =3D=
=3D 8pix... etc
> ...but the width of this register depends on the SoC, so you also want to=
 set
> constraints to the bus width on a per-soc basis (platform data again, or =
at
> least leave a comment here).
>
>         mtk_seninf_mux_update(....  PIX_SEL_EXT, bus_width);
>         mtk_seninf_mux_update(....  PIX_SEL, bus_width);
>
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL_EXT, SENINF_PIX_SEL_EX=
T, pix_sel_ext);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_PIX_SEL, pix_s=
el);
> > +
> > +     if (fmtinfo->flags & MTK_SENINF_FORMAT_JPEG) {
> > +             mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FULL_WR_=
EN, 0);
> > +             mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FLUSH_EN=
,
> > +                                   FIFO_FLUSH_EN_JPEG_2_PIXEL_MODE);
> > +             mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_PUSH_EN,
> > +                             FIFO_PUSH_EN_JPEG_2_PIXEL_MODE);
> > +     } else {
> > +             mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FULL_WR_=
EN, 2);
> > +             mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FLUSH_EN=
,
> > +                                  FIFO_FLUSH_EN_NORMAL_MODE);
> > +             mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_PUSH_EN,
> > +                             FIFO_PUSH_EN_NORMAL_MODE);
> > +     }
> > +
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_HSYNC_POL, hs_=
pol);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_VSYNC_POL, vs_=
pol);
> > +
> > +     val =3D mtk_seninf_mux_read(mux, SENINF_MUX_CTRL);
> > +     rst_mask =3D SENINF_MUX_CTRL_SENINF_IRQ_SW_RST | SENINF_MUX_CTRL_=
SENINF_MUX_SW_RST;
> > +
> > +     mtk_seninf_mux_write(mux, SENINF_MUX_CTRL, val | rst_mask);
>
> Are you sure that you don't need any wait between assertion and deasserti=
on of RST?
> Looks strange, but I don't really know then.
>
> > +     mtk_seninf_mux_write(mux, SENINF_MUX_CTRL, val & ~rst_mask);
> > +
> > +     /* HQ */
> > +     mtk_seninf_mux_write(mux, SENINF_MUX_SPARE, 0xc2000);
>
> val =3D SENINF_FIFO_FULL_SEL;
>
> /* SPARE field meaning is unknown */
> val |=3D 0xc0000;
>
>         mtk_seninf_mux_write(mux, SENINF_MUX_SPARE, val);
>
> > +}
> > +
> > +static void mtk_seninf_top_mux_setup(struct mtk_seninf *priv,
> > +                                  enum mtk_seninf_id seninf_id,
> > +                                  struct mtk_seninf_mux *mux)
> > +{
> > +     unsigned int val;
> > +
> > +     /*
> > +      * Use the top mux (from SENINF input to MUX) to configure routin=
g, and
> > +      * hardcode a 1:1 mapping from the MUX instances to the SENINF ou=
tputs.
> > +      */
> > +     val =3D readl(priv->base + SENINF_TOP_MUX_CTRL)
> > +             & ~(0xf << (mux->mux_id * 4));
> > +     val |=3D (seninf_id & 0xf) << (mux->mux_id * 4);
> > +     writel(val, priv->base + SENINF_TOP_MUX_CTRL);
> > +
> > +     writel(0x76541010, priv->base + SENINF_TOP_CAM_MUX_CTRL);
>
> Each four bits of TOP_CAM_MUX_CTRL selects between seninf1 to seninf8 mux=
es, and
> TOP_MUX_CTRL is laid out in the very same way.
>
> This means that if you're calculating a value for TOP_MUX_CTRL, you can d=
o exactly
> the same for TOP_CAM_MUX_CTRL.
>
> > +}
> > +
> > +static void seninf_enable_test_pattern(struct mtk_seninf *priv,
> > +                                    struct v4l2_subdev_state *state)
> > +{
> > +     struct mtk_seninf_input *input =3D &priv->inputs[CSI_PORT_0];
> > +     struct mtk_seninf_mux *mux =3D &priv->muxes[0];
> > +     const struct mtk_seninf_format_info *fmtinfo;
> > +     const struct v4l2_mbus_framefmt *format;
> > +     unsigned int val;
> > +     unsigned int pix_sel_ext;
> > +     unsigned int pix_sel;
> > +     unsigned int hs_pol =3D 0;
> > +     unsigned int vs_pol =3D 0;
> > +     unsigned int seninf =3D 0;
> > +     unsigned int tm_size =3D 0;
> > +     unsigned int mux_id =3D mux->mux_id;
> > +
> > +     format =3D v4l2_subdev_state_get_stream_format(state, priv->conf-=
>nb_inputs, 0);
> > +     fmtinfo =3D mtk_seninf_format_info(format->code);
> > +
> > +     mtk_seninf_update(priv, SENINF_TOP_CTRL, MUX_LP_MODE, 0);
> > +
> > +     mtk_seninf_update(priv, SENINF_TOP_CTRL, SENINF_PCLK_EN, 1);
> > +     mtk_seninf_update(priv, SENINF_TOP_CTRL, SENINF2_PCLK_EN, 1);
> > +
> > +     mtk_seninf_input_update(input, SENINF_CTRL, SENINF_EN, 1);
> > +     mtk_seninf_input_update(input, SENINF_CTRL, SENINF_SRC_SEL, 1);
> > +     mtk_seninf_input_update(input, SENINF_CTRL_EXT,
> > +                             SENINF_TESTMDL_IP_EN, 1);
> > +
> > +     mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_EN, 1);
> > +     mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_PAT, 0xc);
> > +     mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_VSYNC, 4);
> > +     mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_DUMMYPXL, 0x=
28);
> > +
> > +     if (fmtinfo->flags & MTK_SENINF_FORMAT_BAYER)
> > +             mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_FMT,=
 0x0);
> > +     else
> > +             mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_FMT,=
 0x1);
> > +
> > +     tm_size =3D FIELD_PREP(SENINF_TG1_TM_SIZE_TM_LINE, format->height=
 + 8);
> > +     switch (format->code) {
> > +     case MEDIA_BUS_FMT_UYVY8_1X16:
> > +     case MEDIA_BUS_FMT_VYUY8_1X16:
> > +     case MEDIA_BUS_FMT_YUYV8_1X16:
> > +     case MEDIA_BUS_FMT_YVYU8_1X16:
> > +             tm_size |=3D FIELD_PREP(SENINF_TG1_TM_SIZE_TM_PXL, format=
->width * 2);
> > +             break;
> > +     default:
> > +             tm_size |=3D FIELD_PREP(SENINF_TG1_TM_SIZE_TM_PXL, format=
->width);
> > +             break;
> > +     }
> > +     writel(tm_size, input->base + SENINF_TG1_TM_SIZE);
> > +
> > +     writel(TEST_MODEL_CLK_DIVIDED_CNT, input->base + SENINF_TG1_TM_CL=
K);
> > +     writel(TIME_STAMP_DIVIDER, input->base + SENINF_TG1_TM_STP);
> > +
> > +     /* Set top mux */
> > +     val =3D (readl(priv->base + SENINF_TOP_MUX_CTRL) & (~(0xf << (mux=
_id * 4)))) |
> > +             ((seninf & 0xf) << (mux_id * 4));
> > +     writel(val, priv->base + SENINF_TOP_MUX_CTRL);
>
> This is duplicated, and it is the same that you have in mtk_seninf_top_mu=
x_setup()
>
> > +
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_MUX_EN, 1);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL_EXT,
> > +                           SENINF_SRC_SEL_EXT, SENINF_TEST_MODEL);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_SRC_SEL, 1);
> > +
> > +     pix_sel_ext =3D 0;
> > +     pix_sel =3D 1;
> > +
>
> This is in mtk_seninf_mux_setup(), but if you apply my suggestion, it won=
't be in
> there anymore, so you'll call a function here to set the right value :-)
>
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL_EXT,
> > +                           SENINF_PIX_SEL_EXT, pix_sel_ext);
> > +
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_PIX_SEL, pix_s=
el);
> > +
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_PUSH_EN, 0x1f);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FLUSH_EN, 0x1b);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FULL_WR_EN, 2);
> > +
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_HSYNC_POL, hs_=
pol);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_VSYNC_POL, vs_=
pol);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_HSYNC_MASK, 1)=
;
> > +
> > +     mtk_seninf_mux_write(mux, SENINF_MUX_INTEN,
> > +                          SENINF_IRQ_CLR_SEL | SENINF_ALL_ERR_IRQ_EN);
> > +
> > +     mtk_seninf_mux_write(mux, SENINF_MUX_CTRL,
> > +                          mtk_seninf_mux_read(mux, SENINF_MUX_CTRL) |
> > +                          SENINF_MUX_CTRL_SENINF_IRQ_SW_RST |
> > +                          SENINF_MUX_CTRL_SENINF_MUX_SW_RST);
> > +     udelay(1);
> > +     mtk_seninf_mux_write(mux, SENINF_MUX_CTRL,
> > +                          mtk_seninf_mux_read(mux, SENINF_MUX_CTRL) &
> > +                          ~(SENINF_MUX_CTRL_SENINF_IRQ_SW_RST |
> > +                            SENINF_MUX_CTRL_SENINF_MUX_SW_RST));
> > +
> > +     //check this
> > +     writel(0x76540010, priv->base + SENINF_TOP_CAM_MUX_CTRL);
> > +
> > +     dev_dbg(priv->dev, "%s: OK\n", __func__);
> > +}
> > +
>
> Cheers,
> Angelo
>

