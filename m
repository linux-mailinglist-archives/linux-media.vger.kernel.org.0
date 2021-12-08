Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD0146C8B8
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 01:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242303AbhLHAgp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 19:36:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhLHAgo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 19:36:44 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE6DC061574;
        Tue,  7 Dec 2021 16:33:13 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id f186so2055280ybg.2;
        Tue, 07 Dec 2021 16:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mRyLaaEMkh+c7WgjsesMEEAkX/tdjLp2JCvfiMgZuuE=;
        b=ZM30Z4rJONWQOafvn8ob/MBzHzyYvLvW/UZmKvFcXX4s01Sf8chyKwuXdE6gCwiodk
         jhpIgPzgj7rQAhrAqhUiuuCvloQYX+xGWQMpb68MOqONUBsJFl0wVYuhXYxCF0enxWu0
         AhfP8hRGiI8YrLRLwCbz+SCh3ZL0GF7WnfRcR4+tz8suSgV5+QLfVBvzHaIFrE4PEua9
         sqSNkH2PdKl5d7l3zrF9b8Up1HmMMAzA/AL4ta64rRf4Sj6XN6eo2LmuPtVaiZM2x9cJ
         HgIGHH43mR2bIHZd1SEaiClxQpoGR5/8/VDGD3SAJy6fmjL3A4AWKxaHga/aBDBF+L27
         BGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mRyLaaEMkh+c7WgjsesMEEAkX/tdjLp2JCvfiMgZuuE=;
        b=mwCmhhSZkJ3Ro6vuDV/KvKMj2JrwEGhTdlz4MO9FTdO0H6mRaxV4dg5DoMgaCitC8k
         JUyUxu2EFxUK0xxkah1Iv0OYfIXsUjKi8zIBpuPox8LrXxRsgM7fvCEMBWz3XF6Styns
         WuVi/ugGKthV1ioW0BdEaWB7lV5mROoPdmo8/RWPZs0+6JtiVApaRpN/QrjHDFVx99RP
         vvKYuev6CMAf/eA/aoMSpbBseRvElgyv+N0ZceCIDDbaW5aLG4dIbAYxLiNI5WpFdZ8I
         DFU7fRq9yDRlZCkebdMH3Z91GR0ZdF3Y+IwpK1LkHd68x/9jao/8JwTYKzS+YB+Ksbsr
         hNPA==
X-Gm-Message-State: AOAM532ZE9AqMxNP1njJROTgT3xCo8+jmPa+aBt8mhHJ53MdS3iA9pyy
        L+ZLR6Mut2mC8xhocM/EDZFzR7NKqHgSxiMKSClOqhIuiAe6Zw==
X-Google-Smtp-Source: ABdhPJzMJsdgV2VMpaAgy0qwxC/paDPGUa6H6Uf5Hsj/PutKJXJU8/HH+mXQ7gqEHEcWFJIUgFFu/IVVjLEmSTBQt1Y=
X-Received: by 2002:a25:dc4d:: with SMTP id y74mr51554948ybe.422.1638923592873;
 Tue, 07 Dec 2021 16:33:12 -0800 (PST)
MIME-Version: 1.0
References: <20211207012351.15754-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211207012351.15754-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <6251f4b5a886bc3276d72c5c33118cfb6ac2bf5b.camel@pengutronix.de>
In-Reply-To: <6251f4b5a886bc3276d72c5c33118cfb6ac2bf5b.camel@pengutronix.de>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 8 Dec 2021 00:32:46 +0000
Message-ID: <CA+V-a8tUkm3wDHrsGvD_L3zuV6WzuoEDoO3+Mv9emLN=CaejCQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] media: platform: Add CRU driver for RZ/G2L SoC
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

Thank you for the review.

On Tue, Dec 7, 2021 at 8:16 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Tue, 2021-12-07 at 01:23 +0000, Lad Prabhakar wrote:
> [...]
> > +static int rzg2l_cru_probe(struct platform_device *pdev)
> > +{
> > +     struct rzg2l_cru_dev *cru;
> > +     struct v4l2_ctrl *ctrl;
> > +     int irq, ret;
> > +
> > +     cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
> > +     if (!cru)
> > +             return -ENOMEM;
> > +
> > +     cru->dev = &pdev->dev;
> > +     cru->info = of_device_get_match_data(&pdev->dev);
> > +
> > +     cru->base = devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(cru->base))
> > +             return PTR_ERR(cru->base);
> > +
> > +     irq = platform_get_irq(pdev, 1);
> > +     if (irq < 0)
> > +             return irq;
> > +
> > +     cru->vclk = clk_get(&pdev->dev, "vclk");
> > +     if (IS_ERR(cru->vclk))
> > +             return PTR_ERR(cru->vclk);
>
> devm_clk_get()?
> Don't mix devm and non-devm functions like this, all devm functions
> should be placed first.
>
Agreed, I will use devm_clk_get().

> > +     cru->cmn_restb = devm_reset_control_get_by_index(&pdev->dev, 0);
>
> Your binding has reset-names defined, please request reset controls by
> name. Use devm_reset_control_get_explicit() instead, same below.
>
> > +     if (IS_ERR(cru->cmn_restb)) {
> > +             dev_err(&pdev->dev, "failed to get cpg cmn_restb\n");
> > +             return PTR_ERR(cru->cmn_restb);
>
> These could return -EPROBE_DEFER, I suggest to
>
>                 return dev_err_probe(&pdev->dev, PTR_ERR(cru->cmn_restb),
>                                      "failed to get cpg cmn_restb\n");
>
OK will do.
> instead, same below.
>
ditto.

Cheers,
Prabhakar

> > +     }
> > +     cru->presetn = devm_reset_control_get_by_index(&pdev->dev, 1);
> > +     if (IS_ERR(cru->presetn)) {
> > +             dev_err(&pdev->dev, "failed to get cpg presetn\n");
> > +             return PTR_ERR(cru->presetn);
> > +     }
> > +     cru->aresetn = devm_reset_control_get_by_index(&pdev->dev, 2);
> > +     if (IS_ERR(cru->aresetn)) {
> > +             dev_err(&pdev->dev, "failed to get cpg aresetn\n");
> > +             return PTR_ERR(cru->aresetn);
> > +     }
>
> regards
> Philipp
