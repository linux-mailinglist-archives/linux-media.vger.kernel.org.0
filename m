Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E019223DF1
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 16:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgGQOVX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 10:21:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:36754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726071AbgGQOVX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 10:21:23 -0400
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F015620775;
        Fri, 17 Jul 2020 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594995682;
        bh=RcpLy8J4bl07xVJ0zXLtCtRK/EhczDNe0K167CZPt/A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fpdB3sBbuxusN53ZpvVUK5KmvMcsg8UeiIj1wp7lsEPwkY7FO/tkWGZL0bceyRW79
         rJFOiifOeJzI2gomMYnvi/zoAyObDzjDAVIXwM+2d2lFc76dkAREocxu0Nqdu7tL0i
         TevBH41qbsn/OXnevMfdU/rUZt+/UA1JzICWNz74=
Received: by mail-ed1-f45.google.com with SMTP id a8so7874797edy.1;
        Fri, 17 Jul 2020 07:21:21 -0700 (PDT)
X-Gm-Message-State: AOAM532ccCVwcduhl5RoSEhzgKvmgwktuStLpdafufpRSS9L9vOJQhuA
        g/FVB4E9mOzBZJ5Ek0K1boad448MMzN12/PuYw==
X-Google-Smtp-Source: ABdhPJypK8/gj81SObcfYbHcv/2/xqPlnz6c4kxhoX/3Ss5+cqqNsG1o7oRzbu6X5rt88zAlmjh/AdI6PIrQ+RDZURI=
X-Received: by 2002:a05:6402:1766:: with SMTP id da6mr9274173edb.48.1594995680480;
 Fri, 17 Jul 2020 07:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200708104023.3225-1-louis.kuo@mediatek.com> <20200708104023.3225-2-louis.kuo@mediatek.com>
 <CAAOTY_-+v_t3Vv-Ms7k9jCxJ+0B9qb93tBkL=3OmpMLeyAdV-g@mail.gmail.com> <b7b77606aa3e476aa68b2fa116329f84@mtkmbs02n2.mediatek.inc>
In-Reply-To: <b7b77606aa3e476aa68b2fa116329f84@mtkmbs02n2.mediatek.inc>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Fri, 17 Jul 2020 22:21:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Jeu67-jajV5jysoTTXPoKXuXpvbGzHFYsUKG=j44sQg@mail.gmail.com>
Message-ID: <CAAOTY__Jeu67-jajV5jysoTTXPoKXuXpvbGzHFYsUKG=j44sQg@mail.gmail.com>
Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To:     =?UTF-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>
Cc:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        "keiichiw@chromium.org" <keiichiw@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        =?UTF-8?B?SmVycnktY2ggQ2hlbiAo6Zmz5pWs5oayKQ==?= 
        <Jerry-ch.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <Frederic.Chen@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Louis:

Louis Kuo (=E9=83=AD=E5=BE=B7=E5=AF=A7) <louis.kuo@mediatek.com> =E6=96=BC =
2020=E5=B9=B47=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:=
56=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Chun-Kuang,
>
> Since phy driver is not belong to V4L2 scope
>
> Should I need to upsteam 8183 mipi phy driver with new a patch other than=
 this one ?

Yes, I think so. Maybe different series would be better.

Regards,
Chun-Kuang.

>
> BRs
> Louis
>
> -----Original Message-----
> From: Chun-Kuang Hu [mailto:chunkuang.hu@kernel.org]
> Sent: Thursday, July 9, 2020 9:13 PM
> To: Louis Kuo (=E9=83=AD=E5=BE=B7=E5=AF=A7)
> Cc: hans.verkuil@cisco.com; laurent.pinchart+renesas@ideasonboard.com; To=
masz Figa; keiichiw@chromium.org; Matthias Brugger; Mauro Carvalho Chehab; =
devicetree@vger.kernel.org; Sean Cheng (=E9=84=AD=E6=98=87=E5=BC=98); srv_h=
eupstream; Jerry-ch Chen (=E9=99=B3=E6=95=AC=E6=86=B2); Jungo Lin (=E6=9E=
=97=E6=98=8E=E4=BF=8A); Sj Huang (=E9=BB=83=E4=BF=A1=E7=92=8B); yuzhao@chro=
mium.org; moderated list:ARM/Mediatek SoC support; zwisler@chromium.org; Ch=
ristie Yu (=E6=B8=B8=E9=9B=85=E6=83=A0); Frederic Chen (=E9=99=B3=E4=BF=8A=
=E5=85=83); Linux ARM; linux-media@vger.kernel.org
> Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek se=
nsor interface driver
>
> Hi, Louis:
>
> Louis Kuo <louis.kuo@mediatek.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=888=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:41=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > This patch adds Mediatek's sensor interface driver. Sensor interface
> > driver is a MIPI-CSI2 host driver, namely, a HW camera interface contro=
ller.
> > It support a widely adopted, simple, high-speed protocol primarily
> > intended for point-to-point image and video transmission between
> > cameras and host devices. The mtk-isp directory will contain drivers
> > for multiple IP blocks found in Mediatek ISP system. It will include
> > ISP Pass 1 driver, sensor interface driver, DIP driver and face detecti=
on driver.
> >
> > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > ---
> >  drivers/media/platform/Makefile               |    1 +
> >  drivers/media/platform/mtk-isp/Kconfig        |   18 +
> >  drivers/media/platform/mtk-isp/Makefile       |    3 +
> >  .../media/platform/mtk-isp/seninf/Makefile    |    7 +
> >  .../platform/mtk-isp/seninf/mtk_seninf.c      |  974 +++++++++++
> >  .../platform/mtk-isp/seninf/mtk_seninf_dphy.c |  353 ++++
>
> I think phy driver should be placed in drivers/phy/mediatek and separate =
phy driver to an independent patch.
>
> >  .../platform/mtk-isp/seninf/mtk_seninf_reg.h  | 1491 +++++++++++++++++
> >  .../mtk-isp/seninf/mtk_seninf_rx_reg.h        |  515 ++++++
> >  8 files changed, 3362 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
> >  create mode 100644 drivers/media/platform/mtk-isp/Makefile
> >  create mode 100644 drivers/media/platform/mtk-isp/seninf/Makefile
> >  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf.c
> >  create mode 100644
> > drivers/media/platform/mtk-isp/seninf/mtk_seninf_dphy.c
> >  create mode 100644
> > drivers/media/platform/mtk-isp/seninf/mtk_seninf_reg.h
> >  create mode 100644
> > drivers/media/platform/mtk-isp/seninf/mtk_seninf_rx_reg.h
> >
>
> [snip]
>
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/of_irq.h>
>
> No irq handler, so remove this.
>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/slab.h>
> > +#include <linux/videodev2.h>
> > +#include <media/v4l2-async.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-subdev.h>
> > +#include <linux/phy/phy.h>
> > +#include "mtk_seninf_reg.h"
> > +
>
> [snip]
>
> > +
> > +static int seninf_set_ctrl(struct v4l2_ctrl *ctrl) {
> > +       struct mtk_seninf *priv =3D container_of(ctrl->handler,
> > +                                            struct mtk_seninf,
> > +ctrl_handler);
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_TEST_PATTERN:
> > +               if (ctrl->val =3D=3D TEST_GEN_PATTERN)
> > +                       return seninf_enable_test_pattern(priv);
>
> Without this, this driver still works, so move this to an independent pat=
ch.
>
> > +               else if (ctrl->val =3D=3D TEST_DUMP_DEBUG_INFO)
> > +                       return seninf_dump_debug_info(priv);
>
> Ditto.
>
> > +               else
> > +                       return -EINVAL;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
>
> [snip]
>
> > +
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id mtk_mipi_dphy_of_match[] =3D {
> > +       {.compatible =3D "mediatek,mt8183-mipi_dphy"},
>
> Where is the definition of "mediatek,mt8183-mipi_dphy"?
>
> Regards,
> Chun-Kuang.
>
> > +       {},
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_mipi_dphy_of_match); #endif
> > +
> > +static struct platform_driver mipi_dphy_pdrv =3D {
> > +       .probe  =3D mipi_dphy_probe,
> > +       .driver =3D {
> > +               .name   =3D "mipi_dphy",
> > +               .of_match_table =3D of_match_ptr(mtk_mipi_dphy_of_match=
),
> > +       },
> > +};
> > +
> > +module_platform_driver(mipi_dphy_pdrv);
> > +
