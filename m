Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3405E32D3AF
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 13:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238105AbhCDMxj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 07:53:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238066AbhCDMx0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 07:53:26 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB70AC061574;
        Thu,  4 Mar 2021 04:52:45 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id kx1so689853pjb.3;
        Thu, 04 Mar 2021 04:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mMs0KXBWR+YueGQlJbv/e4cedmjQSUXhVkUKXhpAdMI=;
        b=aWd1FTezvqGJ/6se8MkarAgtd/7/Sr1RRy8WXevNQsQfoQFm+BEiFudNJF/AEmsV3w
         /rVJiNqRZj8JTLsTMAZMZXmgsMlfZYSGZghGplJOMDRXka5ubbErHviBuy1TyZe+6uWX
         px4/bMDu5p1stqd73/GYapoIJHVpIIOJ61N1DGvgAmoCITK9kNnVvqUdYeCXyg8noo4T
         bjrXMhr89XlI5/l4yyjmit6TTymGjo4jFRr0pIBhXL6MozuRxnRzB2m6LFF0ITzqtt/s
         ugiaosaxSJxweuj3Mtux76Q7Wm4LKQTsHqpLJjgTZ9FYI/YJeoY8vBqfC+UQj3fcft/W
         gK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mMs0KXBWR+YueGQlJbv/e4cedmjQSUXhVkUKXhpAdMI=;
        b=NgXkwsJ9YO1oRteDByD22kGognNgwnTLgtxH5R2MAss91GSTt/d8kn81RGNJe0CIHe
         j28DIF3XktLt260PgndhyqgLeRsoNeLxgpeCcnyFmp5ekWd7ps41NHthUy6GG9AH/Ksx
         9wePgSRTP/zyPZS+OcOuv23SvND0lW5yOsgC0pBowxuR+mlzLiiE2G5TdE9bIH7P/eBF
         BJ/aW8ZrhyxPr5ZfHSpS6kmLU0FfHFbCuoGgKDLWJyW/AMmA04Y08P2MA2FdoeQweaK2
         DUZjhPqOzo2okg10epZRzxTfCO9FJGukEATOO4WuUxUY2ELVbFSPT31XUUVbCp/d6N50
         QXzQ==
X-Gm-Message-State: AOAM532r7MDt5bk5x8pTAZeyvqP1nGwkMsNuU5DY/bPH6WQF49/UQ6ck
        Nb92WRNzd4gQYKMymFCDyADGlt23sDO5NLTmDcU=
X-Google-Smtp-Source: ABdhPJyp4iaFUtNFKXjAtlVJECLk/aIzchITz/Yh9b1QeBFZu+N6Uza9NXnFye0XpLpVkacCMI77WdgZIPybjMJ1A5Q=
X-Received: by 2002:a17:90a:5601:: with SMTP id r1mr4325691pjf.236.1614862365193;
 Thu, 04 Mar 2021 04:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
 <e6f8537d2a1f34d0a424b68e056c0ae556c93efd.camel@pengutronix.de>
 <2d55ad69-9b93-ab0e-04af-cd775cc9248b@collabora.com> <c12d84b955b0265dbcf89f2d7fc4d5c28bc74756.camel@pengutronix.de>
In-Reply-To: <c12d84b955b0265dbcf89f2d7fc4d5c28bc74756.camel@pengutronix.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 4 Mar 2021 06:52:34 -0600
Message-ID: <CAHCN7xKs0FtVYu1hs1kAUeaer_uJgpaATDeB0-3mayXUuCrpDg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Reset driver for IMX8MQ VPU hardware block
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree <devicetree@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, Abel Vesa <abel.vesa@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 3, 2021 at 5:24 PM Philipp Zabel <p.zabel@pengutronix.de> wrote=
:
>
> On Wed, 2021-03-03 at 16:20 +0100, Benjamin Gaignard wrote:
> > Le 03/03/2021 =C3=A0 15:17, Philipp Zabel a =C3=A9crit :
> > > Hi Benjamin,
> > >
> > > On Mon, 2021-03-01 at 16:17 +0100, Benjamin Gaignard wrote:
> > > > The two VPUs inside IMX8MQ share the same control block which can b=
e see
> > > > as a reset hardware block.
> > > This isn't a reset controller though. The control block also contains
> > > clock gates of some sort and a filter register for the featureset fus=
es.
> > > Those shouldn't be manipulated via the reset API.

This driver is very similar to several other patches for clk_blk
control [1] which contain both resets and clock-enables on the
i.MX8MP, i.MX8MM and i.MX8MN.  In those cases, there are some specific
power domain controls that are needed, but I wonder if the approach to
creating resets and clock enables could be used in a similar way if
the IMX8MQ doesn't have the same quirks.  In the case of the i.MX8M
Mini, I think it has the same VPU.

[1] - https://patchwork.kernel.org/project/linux-clk/patch/1599560691-3763-=
12-git-send-email-abel.vesa@nxp.com/

adam
> >
> > They are all part of the control block and of the reset process for thi=
s
> > hardware that why I put them here. I guess it is border line :-)
>
> I'm pushing back to keep the reset control framework focused on
> controlling reset lines. Every side effect (such as the asymmetric clock
> ungating) in a random driver makes it harder to reason about behaviour
> at the API level, and to review patches for hardware I am not familiar
> with.
>
> > > > In order to be able to add the second VPU (for HECV decoding) it wi=
ll be
> > > > more handy if the both VPU drivers instance don't have to share the
> > > > control block registers. This lead to implement it as an independ r=
eset
> > > > driver and to change the VPU driver to use it.
> > > Why not switch to a syscon regmap for the control block? That should
> > > also allow to keep backwards compatibility with the old binding with
> > > minimal effort.
> >
> > I will give a try in this direction.
>
> Thank you.
>
> > > > Please note that this series break the compatibility between the DT=
B and
> > > > kernel. This break is limited to IMX8MQ SoC and is done when the dr=
iver
> > > > is still in staging directory.
> > > I know in this case we are pretty sure there are no users of this
> > > binding except for a staging driver, but it would still be nice to ke=
ep
> > > support for the deprecated binding, to avoid the requirement of updat=
ing
> > > kernel and DT in lock-step.
> >
> > If I want to use a syscon (or a reset) the driver must not ioremap the =
"ctrl"
> > registers. It means that "ctrl" has to be removed from the driver reque=
sted
> > reg-names (imx8mq_reg_names[]). Doing that break the kernel/DT compatib=
ility.
> > Somehow syscon and "ctrl" are exclusive.
>
> The way the driver is set up currently, yes. You could add a bit of
> platform specific probe code, though, that would set up the regmap
> either by calling
>         syscon_regmap_lookup_by_phandle();
> for the new binding, or, if the phandle is not available, fall back to
>         platform_get_resource_byname(..., "ctrl");
>         devm_ioremap_resource();
>         devm_regmap_init_mmio();
> for the old binding.
> The actual codec .reset and variant .runtime_resume ops could be
> identical then.
>
> regards
> Philipp
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
