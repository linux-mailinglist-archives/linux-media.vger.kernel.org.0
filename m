Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3CF422431B
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 20:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgGQS0n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 14:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgGQS0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 14:26:43 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09173C0619D2
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2020 11:26:43 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id n2so8429215edr.5
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2020 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aGUvFH+sODfGIbVPA5R44eiPHp7FCQwvL8xoNLjysts=;
        b=DnZo+JEqaDbavlZz8p8DiPCRVZHjOz56yKaUpS3worr5AQqymgVVTL6a3jenXTKBNH
         xX2VFpaebECIhF3ezCKrv45//Jh6LxuWJjQsA7us8IZBD+S78eB8zojD8gJrVGcT+DD3
         n5eb6TIrtzwVBziA4eEs09PZmZA7BDAQtv9gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aGUvFH+sODfGIbVPA5R44eiPHp7FCQwvL8xoNLjysts=;
        b=gIbtu7JtVxYng4Dts5QyBipEXWzMI72701d0+CqOLG22dOi0BUkzEoREArMojfZ8NV
         v6qvZI0bYV4BSs3FhY74EFtqXzTtj07hizOLz4g97yZalVqeedOquv0n6QGShcRMNyDo
         uLVqFa3QfF9JSCnaRHPeGSQ1a1DUC1u7wGN7O6FEPIvTjmvxMspVlgaz8ZP5a5znBRLb
         e4EI1l7dwhyY3n2/zSMaqIRm/9j2oKDBejfVRLOpJXz5JIKztLccu9BlPjRqMmlLBVpl
         FVpQTX8NRZa5tDg7dYpNDXwRJqfZuE5AzTnjz0zzSMS6wYtNJLjkAExkEkvPoSo8ldy3
         UUdw==
X-Gm-Message-State: AOAM5322r+GQ59Pputmdy8aavmwMHnqiv/nZ1zyQD6/7A5yKG8DkFnCh
        IN38Ytbhbc6cLKqKbMA9RUdaU4pfCyo=
X-Google-Smtp-Source: ABdhPJy2NOwt3kWagZpM7fhJ3Zrb2R+FyyDVsFEQLd1UA9z588bJ7Ll6+W8y23qO5yQRwyplD8Vz9w==
X-Received: by 2002:aa7:d8cf:: with SMTP id k15mr10156823eds.250.1595010401426;
        Fri, 17 Jul 2020 11:26:41 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id u13sm8844178eds.10.2020.07.17.11.26.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 11:26:41 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id r12so12019598wrj.13
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2020 11:26:41 -0700 (PDT)
X-Received: by 2002:adf:80e6:: with SMTP id 93mr11251489wrl.17.1595010004058;
 Fri, 17 Jul 2020 11:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200708104023.3225-1-louis.kuo@mediatek.com> <20200708104023.3225-2-louis.kuo@mediatek.com>
 <CAAOTY_-+v_t3Vv-Ms7k9jCxJ+0B9qb93tBkL=3OmpMLeyAdV-g@mail.gmail.com>
 <b7b77606aa3e476aa68b2fa116329f84@mtkmbs02n2.mediatek.inc>
 <CAAOTY__Jeu67-jajV5jysoTTXPoKXuXpvbGzHFYsUKG=j44sQg@mail.gmail.com>
 <CAAFQd5B=e6bcmeO5LBd7eqOWaVvbzPKEv2nJHUfpUVJ3ruFqRg@mail.gmail.com> <CAAOTY_9S9Jq=+Na7JRmhEaJyFaVnvuVn2HSRa8mChuxtqGiGKg@mail.gmail.com>
In-Reply-To: <CAAOTY_9S9Jq=+Na7JRmhEaJyFaVnvuVn2HSRa8mChuxtqGiGKg@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 17 Jul 2020 20:19:51 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AzXGnFxkNCS4cUZXDHFN0Ha8fRAet9wqWdo9b8NNFb3A@mail.gmail.com>
Message-ID: <CAAFQd5AzXGnFxkNCS4cUZXDHFN0Ha8fRAet9wqWdo9b8NNFb3A@mail.gmail.com>
Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To:     =?UTF-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc:     "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
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

On Fri, Jul 17, 2020 at 5:47 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wro=
te:
>
> Tomasz Figa <tfiga@chromium.org> =E6=96=BC 2020=E5=B9=B47=E6=9C=8817=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:33=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > On Fri, Jul 17, 2020 at 4:21 PM Chun-Kuang Hu <chunkuang.hu@kernel.org>=
 wrote:
> > >
> > > Hi, Louis:
> > >
> > > Louis Kuo (=E9=83=AD=E5=BE=B7=E5=AF=A7) <louis.kuo@mediatek.com> =E6=
=96=BC 2020=E5=B9=B47=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=
=8D=8810:56=E5=AF=AB=E9=81=93=EF=BC=9A
> > > >
> > > > Hi Chun-Kuang,
> > > >
> > > > Since phy driver is not belong to V4L2 scope
> > > >
> > > > Should I need to upsteam 8183 mipi phy driver with new a patch othe=
r than this one ?
> > >
> > > Yes, I think so. Maybe different series would be better.
> >
> > Since both would not be usable without each other, I believe they
> > should be handled by the same series, although care should be taken to
> > have the patches in the series clearly separated between the two
> > subsystems.
>
> One series is ok for me. For each maintainer, they could pick what
> they want from this series, or get ack by another maintainer and pick
> all patches into one tree.

Sounds good to me.

However, I'm currently reviewing the series, so would appreciate
holding on with the resend.

Best regards,
Tomasz

>
> Regards,
> Chun-Kuang.
>
> >
> > Best regards,
> > Tomasz
> >
> > >
> > > Regards,
> > > Chun-Kuang.
> > >
> > > >
> > > > BRs
> > > > Louis
> > > >
> > > > -----Original Message-----
> > > > From: Chun-Kuang Hu [mailto:chunkuang.hu@kernel.org]
> > > > Sent: Thursday, July 9, 2020 9:13 PM
> > > > To: Louis Kuo (=E9=83=AD=E5=BE=B7=E5=AF=A7)
> > > > Cc: hans.verkuil@cisco.com; laurent.pinchart+renesas@ideasonboard.c=
om; Tomasz Figa; keiichiw@chromium.org; Matthias Brugger; Mauro Carvalho Ch=
ehab; devicetree@vger.kernel.org; Sean Cheng (=E9=84=AD=E6=98=87=E5=BC=98);=
 srv_heupstream; Jerry-ch Chen (=E9=99=B3=E6=95=AC=E6=86=B2); Jungo Lin (=
=E6=9E=97=E6=98=8E=E4=BF=8A); Sj Huang (=E9=BB=83=E4=BF=A1=E7=92=8B); yuzha=
o@chromium.org; moderated list:ARM/Mediatek SoC support; zwisler@chromium.o=
rg; Christie Yu (=E6=B8=B8=E9=9B=85=E6=83=A0); Frederic Chen (=E9=99=B3=E4=
=BF=8A=E5=85=83); Linux ARM; linux-media@vger.kernel.org
> > > > Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Media=
tek sensor interface driver
> > > >
> > > > Hi, Louis:
> > > >
> > > > Louis Kuo <louis.kuo@mediatek.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=
=888=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:41=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > > > >
> > > > > This patch adds Mediatek's sensor interface driver. Sensor interf=
ace
> > > > > driver is a MIPI-CSI2 host driver, namely, a HW camera interface =
controller.
> > > > > It support a widely adopted, simple, high-speed protocol primaril=
y
> > > > > intended for point-to-point image and video transmission between
> > > > > cameras and host devices. The mtk-isp directory will contain driv=
ers
> > > > > for multiple IP blocks found in Mediatek ISP system. It will incl=
ude
> > > > > ISP Pass 1 driver, sensor interface driver, DIP driver and face d=
etection driver.
> > > > >
> > > > > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > > > > ---
> > > > >  drivers/media/platform/Makefile               |    1 +
> > > > >  drivers/media/platform/mtk-isp/Kconfig        |   18 +
> > > > >  drivers/media/platform/mtk-isp/Makefile       |    3 +
> > > > >  .../media/platform/mtk-isp/seninf/Makefile    |    7 +
> > > > >  .../platform/mtk-isp/seninf/mtk_seninf.c      |  974 +++++++++++
> > > > >  .../platform/mtk-isp/seninf/mtk_seninf_dphy.c |  353 ++++
> > > >
> > > > I think phy driver should be placed in drivers/phy/mediatek and sep=
arate phy driver to an independent patch.
> > > >
> > > > >  .../platform/mtk-isp/seninf/mtk_seninf_reg.h  | 1491 +++++++++++=
++++++
> > > > >  .../mtk-isp/seninf/mtk_seninf_rx_reg.h        |  515 ++++++
> > > > >  8 files changed, 3362 insertions(+)
> > > > >  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
> > > > >  create mode 100644 drivers/media/platform/mtk-isp/Makefile
> > > > >  create mode 100644 drivers/media/platform/mtk-isp/seninf/Makefil=
e
> > > > >  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_sen=
inf.c
> > > > >  create mode 100644
> > > > > drivers/media/platform/mtk-isp/seninf/mtk_seninf_dphy.c
> > > > >  create mode 100644
> > > > > drivers/media/platform/mtk-isp/seninf/mtk_seninf_reg.h
> > > > >  create mode 100644
> > > > > drivers/media/platform/mtk-isp/seninf/mtk_seninf_rx_reg.h
> > > > >
> > > >
> > > > [snip]
> > > >
> > > > > +
> > > > > +#include <linux/clk.h>
> > > > > +#include <linux/delay.h>
> > > > > +#include <linux/interrupt.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/of_graph.h>
> > > > > +#include <linux/of_irq.h>
> > > >
> > > > No irq handler, so remove this.
> > > >
> > > > > +#include <linux/platform_device.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > > +#include <linux/slab.h>
> > > > > +#include <linux/videodev2.h>
> > > > > +#include <media/v4l2-async.h>
> > > > > +#include <media/v4l2-ctrls.h>
> > > > > +#include <media/v4l2-event.h>
> > > > > +#include <media/v4l2-fwnode.h>
> > > > > +#include <media/v4l2-subdev.h>
> > > > > +#include <linux/phy/phy.h>
> > > > > +#include "mtk_seninf_reg.h"
> > > > > +
> > > >
> > > > [snip]
> > > >
> > > > > +
> > > > > +static int seninf_set_ctrl(struct v4l2_ctrl *ctrl) {
> > > > > +       struct mtk_seninf *priv =3D container_of(ctrl->handler,
> > > > > +                                            struct mtk_seninf,
> > > > > +ctrl_handler);
> > > > > +
> > > > > +       switch (ctrl->id) {
> > > > > +       case V4L2_CID_TEST_PATTERN:
> > > > > +               if (ctrl->val =3D=3D TEST_GEN_PATTERN)
> > > > > +                       return seninf_enable_test_pattern(priv);
> > > >
> > > > Without this, this driver still works, so move this to an independe=
nt patch.
> > > >
> > > > > +               else if (ctrl->val =3D=3D TEST_DUMP_DEBUG_INFO)
> > > > > +                       return seninf_dump_debug_info(priv);
> > > >
> > > > Ditto.
> > > >
> > > > > +               else
> > > > > +                       return -EINVAL;
> > > > > +       }
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > >
> > > > [snip]
> > > >
> > > > > +
> > > > > +#ifdef CONFIG_OF
> > > > > +static const struct of_device_id mtk_mipi_dphy_of_match[] =3D {
> > > > > +       {.compatible =3D "mediatek,mt8183-mipi_dphy"},
> > > >
> > > > Where is the definition of "mediatek,mt8183-mipi_dphy"?
> > > >
> > > > Regards,
> > > > Chun-Kuang.
> > > >
> > > > > +       {},
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(of, mtk_mipi_dphy_of_match); #endif
> > > > > +
> > > > > +static struct platform_driver mipi_dphy_pdrv =3D {
> > > > > +       .probe  =3D mipi_dphy_probe,
> > > > > +       .driver =3D {
> > > > > +               .name   =3D "mipi_dphy",
> > > > > +               .of_match_table =3D of_match_ptr(mtk_mipi_dphy_of=
_match),
> > > > > +       },
> > > > > +};
> > > > > +
> > > > > +module_platform_driver(mipi_dphy_pdrv);
> > > > > +
