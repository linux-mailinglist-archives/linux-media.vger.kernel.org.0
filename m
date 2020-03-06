Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9B3617C826
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 23:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgCFWKD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 17:10:03 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38366 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgCFWKD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 17:10:03 -0500
Received: by mail-qk1-f195.google.com with SMTP id j7so3843186qkd.5;
        Fri, 06 Mar 2020 14:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wFFrwgrTxStIND0BgNhiakGXgdI5azKMO9yWmsMkrG8=;
        b=NKCZnBbmVyGbhvFm7vnXR6PZ+BT1xmXP57NsWVgP873FYSY6aYf7NSha8tNdM2KmN5
         OoPbsfr8MaqqPr8lVY3qnqCAE8FSHZHXVYN0acumv4Z9ZxEP3ZdDMMLIBoJXfyVofw/o
         xNDLTBB0VPC/1RYmTXPeu5j9+H0bfoqUNW3qtxQk4ir1fyRjb2X6pnMJSK/yU1YnKguP
         fOrokkh/gXgKCrodR7CQR/IVMPMCgNqKTUH2burIeWcuUcQbdbs3XjM1N/MI5Gy8Pxp9
         GjrUWTlJwrxF+ed3CwGrDTc7HgrmcZeg9Bsonugv8uf93Mgs2X22Az8mhBZwk2+8xWo7
         p6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wFFrwgrTxStIND0BgNhiakGXgdI5azKMO9yWmsMkrG8=;
        b=Yj02WyOfCNCZmYUJ0hwownqpnXx+isN7uzd7M1EUj4NMgjL4xc+LcDv4acI93edSG4
         vgI9T+BIAPKLX+Qpw4pezctO6Obbcs7IjLWCoiTLv3/0YV+W4iWxxlVBMOZKCFcHx0Jr
         BVMAF9G/iRX/oJ4Ov1oOMbCsIN9zmNnCcvKGRyfeyooBacjgpaZBXxNT9J+XWvIobtiJ
         8LYdJfGRKOLCLrm12Yt7AGGBnJbKC+dhCUR2Js7FTXEVWWTOFaj86Ukfa06udm9YWVY0
         jPKwK6o2IdhcG7KkORVPsP+JP309E/7Va0RHPle4fPmlcGsdyFJc4rl7SJxUR7gjDJDe
         KrjQ==
X-Gm-Message-State: ANhLgQ2qxeWjOIXMTHqnv/S7q+BafEp+S8DV28c+j2NNaYU4JX90ty20
        u2LBXghaGoIenLXGm8WAvGJtk/Ilx503gT5FXwU=
X-Google-Smtp-Source: ADFU+vvcXU3XRqapQvaYZN7V2yeNnnl4nT5ZoW3I1T9V/N+yCxaa9tq5Y/hEoQ3l5n1pqdOzHig2VyLB92f6R+gT53I=
X-Received: by 2002:a37:9e8a:: with SMTP id h132mr4969237qke.314.1583532601568;
 Fri, 06 Mar 2020 14:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20200302110128.2664251-1-enric.balletbo@collabora.com>
 <20200302110128.2664251-4-enric.balletbo@collabora.com> <158344207340.7173.8369925839829696256@swboyd.mtv.corp.google.com>
 <8bfc4350-6e92-e657-18f2-3624a2558521@collabora.com> <158353062701.66766.10488072352849985568@swboyd.mtv.corp.google.com>
In-Reply-To: <158353062701.66766.10488072352849985568@swboyd.mtv.corp.google.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Fri, 6 Mar 2020 23:09:50 +0100
Message-ID: <CAFqH_51hL07c7z2mBSWMejKwZMkNHPVYiB7JpMPPgck0XycEug@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] soc: mediatek: Move mt8173 MMSYS to platform driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        David Airlie <airlied@linux.ie>, CK HU <ck.hu@mediatek.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        ulrich.hecht+renesas@gmail.com,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Richard Fontana <rfontana@redhat.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
        sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Matthias Brugger <mbrugger@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        fwll.ch@freedesktop.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stephen,

Missatge de Stephen Boyd <sboyd@kernel.org> del dia dv., 6 de mar=C3=A7
2020 a les 22:37:
>
> Quoting Enric Balletbo i Serra (2020-03-06 08:30:16)
> > Hi Stephen,
> >
> > On 5/3/20 22:01, Stephen Boyd wrote:
> > > Quoting Enric Balletbo i Serra (2020-03-02 03:01:26)
> > >> From: Matthias Brugger <mbrugger@suse.com>
> > >>
> > >> There is no strong reason for this to use CLK_OF_DECLARE instead of
> > >> being a platform driver.
> > >
> > > Cool.
> > >
> > >> Plus, this driver provides clocks but also
> > >> a shared register space for the mediatek-drm and the mediatek-mdp
> > >> driver. So move to drivers/soc/mediatek as a platform driver.
> > >>
> > >> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> > >> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > >> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > >> ---
> > >>
> > >> Changes in v11: None
> > >> Changes in v10:
> > >> - Renamed to be generic mtk-mmsys
> > >> - Add driver data support to be able to support diferent SoCs
> > >>
> > >> Changes in v9:
> > >> - Move mmsys to drivers/soc/mediatek (CK)
> > >>
> > >> Changes in v8:
> > >> - Be a builtin_platform_driver like other mediatek mmsys drivers.
> > >>
> > >> Changes in v7:
> > >> - Free clk_data->clks as well
> > >> - Get rid of private data structure
> > >>
> > >>  drivers/clk/mediatek/clk-mt8173.c | 104 --------------------
> > >>  drivers/soc/mediatek/Kconfig      |   7 ++
> > >>  drivers/soc/mediatek/Makefile     |   1 +
> > >>  drivers/soc/mediatek/mtk-mmsys.c  | 154 +++++++++++++++++++++++++++=
+++
> > >
> > > Can you generate with -M so that we can see what has actually changed=
?
> > >
> >
> > Sure, sorry about that.
> >
> > >>  4 files changed, 162 insertions(+), 104 deletions(-)
> > >>  create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
> > >>
> > >> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kco=
nfig
> > >> index 2114b563478c..7a156944d50e 100644
> > >> --- a/drivers/soc/mediatek/Kconfig
> > >> +++ b/drivers/soc/mediatek/Kconfig
> > >> @@ -44,4 +44,11 @@ config MTK_SCPSYS
> > >>           Say yes here to add support for the MediaTek SCPSYS power =
domain
> > >>           driver.
> > >>
> > >> +config MTK_MMSYS
> > >> +       bool "MediaTek MMSYS Support"
> > >> +       depends on COMMON_CLK_MT8173
> > >
> > > Does it need some default so that defconfig updates don't break thing=
s?
> > >
> >
> > Right.
> >
> > >> +       help
> > >> +         Say yes here to add support for the MediaTek Multimedia
> > >> +         Subsystem (MMSYS).
> > >> +
> > >>  endmenu
> > >> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Ma=
kefile
> > >> index b01733074ad6..01f9f873634a 100644
> > >> --- a/drivers/soc/mediatek/Makefile
> > >> +++ b/drivers/soc/mediatek/Makefile
> > >> @@ -3,3 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) +=3D mtk-cmdq-helper.o
> > >>  obj-$(CONFIG_MTK_INFRACFG) +=3D mtk-infracfg.o
> > >>  obj-$(CONFIG_MTK_PMIC_WRAP) +=3D mtk-pmic-wrap.o
> > >>  obj-$(CONFIG_MTK_SCPSYS) +=3D mtk-scpsys.o
> > >> +obj-$(CONFIG_MTK_MMSYS) +=3D mtk-mmsys.o
> > >> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek=
/mtk-mmsys.c
> > >> new file mode 100644
> > >> index 000000000000..473cdf732fb5
> > >> --- /dev/null
> > >> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > >> @@ -0,0 +1,154 @@
> > >> +// SPDX-License-Identifier: GPL-2.0-only
> > >> +/*
> > >> + * Copyright (c) 2014 MediaTek Inc.
> > >> + * Author: James Liao <jamesjj.liao@mediatek.com>
> > >> + */
> > >> +
> > >> +#include <linux/clk-provider.h>
> > >> +#include <linux/of_device.h>
> > >> +#include <linux/platform_device.h>
> > >> +
> > >> +#include "../../clk/mediatek/clk-gate.h"
> > >> +#include "../../clk/mediatek/clk-mtk.h"
> > >
> > > Why not use include/linux/clk/?
> > >
> >
> > I can move these files to include, this will impact a lot more of drive=
rs but,
> > yes, I think is the right way.
> >
> > > But I also don't understand why the clk driver is moved outside of
> > > drivers/clk/ into drivers/soc/. Commit text saying that it has shared
> > > registers doesn't mean it can't still keep the clk driver part in the
> > > drivers/clk/ area.
> > >
> >
> > Actually moving this to the soc directory has been requested by CK (med=
iatek) as
> > a change in v8. You can see the discussion in [1]
> >
>
> I can reply there in that thread if necessary, but we shouldn't need to
> force simple-mfd into DT bindings to support this. Match the compatible
> string in drivers/soc/ and register devices in software for the
> different pieces of this overall hardware block. If necessary, pass down
> the ioremapped addresss down through device data to each logical driver
> in the respective subsystem.
>
> So yes, it looks like an MFD, but that doesn't mean we have to change
> the DT binding or put it in drivers/mfd to support that. And we don't
> have to fix any problems with allowing two drivers to probe the same
> compatible string.
>

That thread maybe has too much information and things evolved since
then. Note that the final solution is not an MFD neither we change the
bindings. I pointed to that thread just because CK (CK please correct
me if I'm wrong) thought that the driver is not a pure clock driver
and he preferred to move to drivers/soc/mediatek (in that thread, he
exposes his opinion on that).  Sorry to introduce more confusion.

You seem to be fine with the approach (just minor changes), so it
looks to me that the only problem is if this should be in drivers/clk
or drivers/soc. Honestly, this is not something I can't decide and
I'll let you (the soc and clk maintainers) decide. I don't really have
a strong opinion here. I don't mind move again to drivers/clk if that
is what we want but let's come to an agreement.

Thanks,
 Enric

_______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
