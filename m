Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 462B112E5C2
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2020 12:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgABLgj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jan 2020 06:36:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:45586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726647AbgABLgj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Jan 2020 06:36:39 -0500
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DCCA21734;
        Thu,  2 Jan 2020 11:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577964998;
        bh=zM9MCsx/9OGUfNFPKxz5tp5JZ14pedfFKc7NWY5Lrt0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GYG18pHqDyqJXhISbE4hOqZb0+R8U9CLEgpVRTc9n7jH7NQ8oB3ao3D0JPXclOdXF
         jhtOaHFb+t3vRXgelzKJYyZPBaXXsps3xoG3u41Jj6qt0NUqBBPPqOzFxK/WvEizw7
         zYDqlB+oyYJoDm1RUpd5n8msDS72mhUE0ehGlPpM=
Received: by mail-wr1-f45.google.com with SMTP id b6so38992704wrq.0;
        Thu, 02 Jan 2020 03:36:38 -0800 (PST)
X-Gm-Message-State: APjAAAVEINsvCcmWaGx0w44CsJtXrzmks1x972y5u2r46QMtVwkEX4kL
        D+obtqqO+cmwYRRw0ovJr+M18r+gYIJErLh/SJA=
X-Google-Smtp-Source: APXvYqxfTCU4CionKBFMX77BDzhVbicdSu++uerfKitSljA+/XSf4LgB4wuOzctngS/MZNKN3Jot1JoIjWX6fRJDrHE=
X-Received: by 2002:a5d:6b88:: with SMTP id n8mr63096150wrx.288.1577964997031;
 Thu, 02 Jan 2020 03:36:37 -0800 (PST)
MIME-Version: 1.0
References: <20191215165924.28314-1-wens@kernel.org> <20191215165924.28314-7-wens@kernel.org>
 <20200102113319.GJ19828@paasikivi.fi.intel.com>
In-Reply-To: <20200102113319.GJ19828@paasikivi.fi.intel.com>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Thu, 2 Jan 2020 19:36:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v642Ky6ztuwBs9cOxr4RLKS2q9Do+ZCUzc399z+ppCMqmg@mail.gmail.com>
Message-ID: <CAGb2v642Ky6ztuwBs9cOxr4RLKS2q9Do+ZCUzc399z+ppCMqmg@mail.gmail.com>
Subject: Re: [PATCH 06/14] media: sun4i-csi: Add support for A10 CSI1 camera
 sensor interface
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 2, 2020 at 7:33 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Chen-Yu,
>
> Thanks for the patchset.
>
> On Mon, Dec 16, 2019 at 12:59:16AM +0800, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > The A10/A20 Allwinner SoCs have two camera sensor interface blocks,
> > named CSI0 and CSI1. The two have the same register layouts with
> > slightly different features:
> >
> >   - CSI0 has an image signal processor (ISP); CSI1 doesn't
> >
> >   - CSI0 can support up to four separate channels under CCIR656;
> >     CSI1 can only support one
> >
> >   - CSI0 can support up to 16-bit wide bus with YUV422;
> >     CSI1 can support up to 24-bit wide bus with YUV444
> >
> > For now the driver doesn't support wide busses, nor CCIR656. So the
> > only relevant difference is whether a clock needs to be taken and
> > enabled for the ISP.
> >
> > Add structs to record the differences, tie them to the compatible
> > strings, and deal with the ISP clock. Support for the new CSI1
> > hardware block is added as well.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 35 ++++++++++++++++---
> >  .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  2 ++
> >  2 files changed, 32 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > index b8b07c1de2a8..be2466930a49 100644
> > --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > @@ -29,6 +29,12 @@
> >
> >  #include "sun4i_csi.h"
> >
> > +struct sun4i_csi_traits {
> > +     unsigned int channels;
> > +     unsigned int max_width;
> > +     bool has_isp;
> > +};
> > +
> >  static const struct media_entity_operations sun4i_csi_video_entity_ops = {
> >       .link_validate = v4l2_subdev_link_validate,
> >  };
> > @@ -156,6 +162,10 @@ static int sun4i_csi_probe(struct platform_device *pdev)
> >       subdev = &csi->subdev;
> >       vdev = &csi->vdev;
> >
> > +     csi->traits = of_device_get_match_data(&pdev->dev);
> > +     if (!csi->traits)
> > +             return -EINVAL;
> > +
> >       /*
> >        * On Allwinner SoCs, some high memory bandwidth devices do DMA
> >        * directly over the memory bus (called MBUS), instead of the
> > @@ -199,10 +209,12 @@ static int sun4i_csi_probe(struct platform_device *pdev)
> >               return PTR_ERR(csi->bus_clk);
> >       }
> >
> > -     csi->isp_clk = devm_clk_get(&pdev->dev, "isp");
> > -     if (IS_ERR(csi->isp_clk)) {
> > -             dev_err(&pdev->dev, "Couldn't get our ISP clock\n");
> > -             return PTR_ERR(csi->isp_clk);
> > +     if (csi->traits->has_isp) {
> > +             csi->isp_clk = devm_clk_get(&pdev->dev, "isp");
> > +             if (IS_ERR(csi->isp_clk)) {
> > +                     dev_err(&pdev->dev, "Couldn't get our ISP clock\n");
> > +                     return PTR_ERR(csi->isp_clk);
> > +             }
> >       }
> >
> >       csi->ram_clk = devm_clk_get(&pdev->dev, "ram");
> > @@ -280,8 +292,21 @@ static int sun4i_csi_remove(struct platform_device *pdev)
> >       return 0;
> >  }
> >
> > +struct sun4i_csi_traits sun4i_a10_csi1_traits = {
> > +     .channels = 1,
> > +     .max_width = 24,
> > +     .has_isp = false,
> > +};
> > +
> > +struct sun4i_csi_traits sun7i_a20_csi0_traits = {
>
> These two should be static const, right?

You're right. I'll wait for the remaining reviews before sending v2.

ChenYu

> > +     .channels = 4,
> > +     .max_width = 16,
> > +     .has_isp = true,
> > +};
> > +
> >  static const struct of_device_id sun4i_csi_of_match[] = {
> > -     { .compatible = "allwinner,sun7i-a20-csi0" },
> > +     { .compatible = "allwinner,sun4i-a10-csi1", .data = &sun4i_a10_csi1_traits },
> > +     { .compatible = "allwinner,sun7i-a20-csi0", .data = &sun7i_a20_csi0_traits },
> >       { /* Sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, sun4i_csi_of_match);
> > diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
> > index 88d39b3554c4..0f67ff652c2e 100644
> > --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
> > +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
> > @@ -108,6 +108,8 @@ struct sun4i_csi {
> >       /* Device resources */
> >       struct device                   *dev;
> >
> > +     const struct sun4i_csi_traits   *traits;
> > +
> >       void __iomem                    *regs;
> >       struct clk                      *bus_clk;
> >       struct clk                      *isp_clk;
>
> --
> Kind regards,
>
> Sakari Ailus
