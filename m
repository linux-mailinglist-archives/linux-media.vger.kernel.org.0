Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0C121A090
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 15:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgGINNE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 09:13:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:46932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726768AbgGINNC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Jul 2020 09:13:02 -0400
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D15B8207DA;
        Thu,  9 Jul 2020 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594300382;
        bh=WBbJU/KkFXQZfDG744P7nPPYpZA0DJCr2tyu1VZTvTA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0mv/pzeQI/VIqe/m3D1mkdxV2+NosLJryzznIod0FRcZUjdfL6KjoJOTpqw9hFq0S
         ClUfzGM/2GSP4XyiYW7fbv2+gCv4HwSKXyhchJZS1fmPpOS7poh7q4Pn2KlgPd0JwP
         v0RFSJ1EuKrFu99hrIFt2WOf6W3JlJFEH78CkQmM=
Received: by mail-ej1-f42.google.com with SMTP id o18so2202894eje.7;
        Thu, 09 Jul 2020 06:13:01 -0700 (PDT)
X-Gm-Message-State: AOAM532h6sXEpBPR6EQ3h5LsV8glocHkPaNHLxz/EFlE1q+vptM/o912
        n/++aw5ARBcwHQrnovv9o3vXeOf/X69cdj4V8Q==
X-Google-Smtp-Source: ABdhPJyUxRrhc1z4ZHhofevSZxzBYzCXYv8JpRTyGRhKckyUoVMmTH4L7nw7p3INYz0y0YJL3aK6Bg1WNoVpWz1+8Do=
X-Received: by 2002:a17:906:856:: with SMTP id f22mr53938906ejd.245.1594300380228;
 Thu, 09 Jul 2020 06:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200708104023.3225-1-louis.kuo@mediatek.com> <20200708104023.3225-2-louis.kuo@mediatek.com>
In-Reply-To: <20200708104023.3225-2-louis.kuo@mediatek.com>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Thu, 9 Jul 2020 21:12:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-+v_t3Vv-Ms7k9jCxJ+0B9qb93tBkL=3OmpMLeyAdV-g@mail.gmail.com>
Message-ID: <CAAOTY_-+v_t3Vv-Ms7k9jCxJ+0B9qb93tBkL=3OmpMLeyAdV-g@mail.gmail.com>
Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To:     Louis Kuo <louis.kuo@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        Tomasz Figa <tfiga@chromium.org>, keiichiw@chromium.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        =?UTF-8?B?SmVycnktY2ggQ2hlbiAo6Zmz5pWs5oayKQ==?= 
        <Jerry-ch.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        yuzhao@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, zwisler@chromium.org,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Louis:

Louis Kuo <louis.kuo@mediatek.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=888=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:41=E5=AF=AB=E9=81=93=EF=BC=9A
>
> This patch adds Mediatek's sensor interface driver. Sensor interface
> driver is a MIPI-CSI2 host driver, namely, a HW camera interface controll=
er.
> It support a widely adopted, simple, high-speed protocol primarily intend=
ed
> for point-to-point image and video transmission between cameras and host
> devices. The mtk-isp directory will contain drivers for multiple IP block=
s
> found in Mediatek ISP system. It will include ISP Pass 1 driver, sensor
> interface driver, DIP driver and face detection driver.
>
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/mtk-isp/Kconfig        |   18 +
>  drivers/media/platform/mtk-isp/Makefile       |    3 +
>  .../media/platform/mtk-isp/seninf/Makefile    |    7 +
>  .../platform/mtk-isp/seninf/mtk_seninf.c      |  974 +++++++++++
>  .../platform/mtk-isp/seninf/mtk_seninf_dphy.c |  353 ++++

I think phy driver should be placed in drivers/phy/mediatek and
separate phy driver to an independent patch.

>  .../platform/mtk-isp/seninf/mtk_seninf_reg.h  | 1491 +++++++++++++++++
>  .../mtk-isp/seninf/mtk_seninf_rx_reg.h        |  515 ++++++
>  8 files changed, 3362 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
>  create mode 100644 drivers/media/platform/mtk-isp/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf.c
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf_dphy=
.c
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf_reg.=
h
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf_rx_r=
eg.h
>

[snip]

> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_irq.h>

No irq handler, so remove this.

> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/videodev2.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +#include <linux/phy/phy.h>
> +#include "mtk_seninf_reg.h"
> +

[snip]

> +
> +static int seninf_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct mtk_seninf *priv =3D container_of(ctrl->handler,
> +                                            struct mtk_seninf, ctrl_hand=
ler);
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_TEST_PATTERN:
> +               if (ctrl->val =3D=3D TEST_GEN_PATTERN)
> +                       return seninf_enable_test_pattern(priv);

Without this, this driver still works, so move this to an independent patch=
.

> +               else if (ctrl->val =3D=3D TEST_DUMP_DEBUG_INFO)
> +                       return seninf_dump_debug_info(priv);

Ditto.

> +               else
> +                       return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +

[snip]

> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id mtk_mipi_dphy_of_match[] =3D {
> +       {.compatible =3D "mediatek,mt8183-mipi_dphy"},

Where is the definition of "mediatek,mt8183-mipi_dphy"?

Regards,
Chun-Kuang.

> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_mipi_dphy_of_match);
> +#endif
> +
> +static struct platform_driver mipi_dphy_pdrv =3D {
> +       .probe  =3D mipi_dphy_probe,
> +       .driver =3D {
> +               .name   =3D "mipi_dphy",
> +               .of_match_table =3D of_match_ptr(mtk_mipi_dphy_of_match),
> +       },
> +};
> +
> +module_platform_driver(mipi_dphy_pdrv);
> +
