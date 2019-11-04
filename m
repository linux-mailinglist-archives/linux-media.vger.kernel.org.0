Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA0DEEABF
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 22:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729137AbfKDVJL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 16:09:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:52746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728409AbfKDVJL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 16:09:11 -0500
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B7BB20659
        for <linux-media@vger.kernel.org>; Mon,  4 Nov 2019 21:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572901750;
        bh=tlRm/+9Qves2FEW2noYzb+NDpU4EfJZEYFfKipY6Cz8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uDrqZAq8HuR/5IEl01F9Iv/R7FdxKRfJzHLf75lzfNjeLp/T/TIU91EN2+evz0Kt/
         GNCPQzEQvb4QWXlHE1Ktwg7kKqExOquyhkO3Gz3nBKPG+E3lQo1g9vj/NFeqf1NoIB
         YNsuESsAnZ1EUBLF3gTvT3Dbh2VcsiqSZSym7AJw=
Received: by mail-qt1-f175.google.com with SMTP id u22so26099170qtq.13
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2019 13:09:10 -0800 (PST)
X-Gm-Message-State: APjAAAUn3/TNACBxGECS5ck4JSEMyblgSEVcrDSRn/Gw0GlqfHVIftVx
        w3BlVkpaZvXXJJnxHl77y2zdu7p2FSvy3s8YaA==
X-Google-Smtp-Source: APXvYqz1YaNFTlIiSVckaskbkTdqJI0+BJXJEnsj0HmkOcoVQ9ZDsYtvJc48DLsTbT3agSjjip2tElNqlgWPdKigYMY=
X-Received: by 2002:ac8:48c5:: with SMTP id l5mr14517081qtr.110.1572901749580;
 Mon, 04 Nov 2019 13:09:09 -0800 (PST)
MIME-Version: 1.0
References: <20191031132309.10965-1-laurent.pinchart@ideasonboard.com>
 <20191101145246.GA13101@Mani-XPS-13-9360> <20191104134206.GC4913@pendragon.ideasonboard.com>
In-Reply-To: <20191104134206.GC4913@pendragon.ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 4 Nov 2019 15:08:57 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+R-ndA5s93uXam1F8Bjm=SPV6z1BQvdMGzfHkyYPd2Hw@mail.gmail.com>
Message-ID: <CAL_Jsq+R-ndA5s93uXam1F8Bjm=SPV6z1BQvdMGzfHkyYPd2Hw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: IMX296 camera sensor driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 4, 2019 at 7:42 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Mani,
>
> (CC'ing Rob for a DT question at the end)
>
> On Fri, Nov 01, 2019 at 08:22:46PM +0530, Manivannan Sadhasivam wrote:
> > Hi Laurent,
> >
> > Thanks for the improved version of the driver. I haven't tested it on
> > my setup yet. Once I do, I'll add a Tested-by tag.
> >
> > I just have few minor commments on top of Sakari's review. Overall it
> > looks good.
> >
> > On Thu, Oct 31, 2019 at 03:23:09PM +0200, Laurent Pinchart wrote:
> > > The IMX296LLR is a monochrome 1.60MP CMOS sensor from Sony. The driver
> > > supports cropping and binning (but not both at the same time due to
> > > hardware limitations) and exposure, gain, vertical blanking and test
> > > pattern controls.
> > >
> > > Preliminary support is also included for the color IMX296LQR sensor.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---

> > > +   imx->reset = devm_gpiod_get_optional(&client->dev, "reset",
> > > +                                        GPIOD_OUT_HIGH);
> > > +   if (IS_ERR(imx->reset)) {
> > > +           if (PTR_ERR(imx->reset) != -EPROBE_DEFER)
> > > +                   dev_err(&client->dev, "failed to get xclr gpio (%ld)\n",
> >
> > If you want to keep device specific naming for resources, I'd suggest using
> > `xclr` instead of `reset` in DT itself.
>
> For GPIOs I think there's an overall consensus that standard names are
> preferred, while I don't think this applies to clocks. It's a bit of a
> grey area though, so I'm open to change on or the other.
>
> Rob, any preference ?

If in fact that's a reset, then yes, use 'reset-gpios'. 'xclr' is an
unusual name though.

Rob
