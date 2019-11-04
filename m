Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F38DEEE88
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 23:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390038AbfKDWP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 17:15:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:48160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389445AbfKDWPZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 17:15:25 -0500
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 029B9204EC
        for <linux-media@vger.kernel.org>; Mon,  4 Nov 2019 22:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572905724;
        bh=8pf0g2DWOn3hzCjs08NUGAGsQohZAJVYVSek6ZuEZQE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FhIaHxh9QgnCQPLo6SXkos47TBiQT8zWV1BM1GSFoytqamBxPEjzJ542q8Yhm9Nhb
         OYWIu5MkVYM8TEbQGRcy1jzk2Jaf5BsY1MxQUsw1KGWqLY9qQpC/ESWw8/SgqVE4so
         ZkCq3/ksO7l/n0yvNc7C5QPsPgQnZyw/PgqXhBjQ=
Received: by mail-qk1-f169.google.com with SMTP id 205so17927955qkk.1
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2019 14:15:23 -0800 (PST)
X-Gm-Message-State: APjAAAUsKRqpOQXYNqn5YjIunIklzaiGFo5Dgetfd3J5BJxtz+OKWuhv
        BeQjljqQnNFBrxf+CF+J69EKSxL6OAP5jVYh6w==
X-Google-Smtp-Source: APXvYqzMmCtPGGrjdUjrExYalFkeKOvISEUVYLH+nNf7g/h+18nFw2arWNA+djD9rGzeYMIm9sUa9eFZ5lgaUDxo0Wc=
X-Received: by 2002:a37:f703:: with SMTP id q3mr25141323qkj.254.1572905723126;
 Mon, 04 Nov 2019 14:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20191031132309.10965-1-laurent.pinchart@ideasonboard.com>
 <20191101145246.GA13101@Mani-XPS-13-9360> <20191104134206.GC4913@pendragon.ideasonboard.com>
 <CAL_Jsq+R-ndA5s93uXam1F8Bjm=SPV6z1BQvdMGzfHkyYPd2Hw@mail.gmail.com> <20191104220323.GH4913@pendragon.ideasonboard.com>
In-Reply-To: <20191104220323.GH4913@pendragon.ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 4 Nov 2019 16:15:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL9XVFrFHeLLn=3hNh7VnQQCQzkcJVbTb+e7X20cJWNpg@mail.gmail.com>
Message-ID: <CAL_JsqL9XVFrFHeLLn=3hNh7VnQQCQzkcJVbTb+e7X20cJWNpg@mail.gmail.com>
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

On Mon, Nov 4, 2019 at 4:03 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> On Mon, Nov 04, 2019 at 03:08:57PM -0600, Rob Herring wrote:
> > On Mon, Nov 4, 2019 at 7:42 AM Laurent Pinchart wrote:
> > > On Fri, Nov 01, 2019 at 08:22:46PM +0530, Manivannan Sadhasivam wrote:
> > > > Hi Laurent,
> > > >
> > > > Thanks for the improved version of the driver. I haven't tested it on
> > > > my setup yet. Once I do, I'll add a Tested-by tag.
> > > >
> > > > I just have few minor commments on top of Sakari's review. Overall it
> > > > looks good.
> > > >
> > > > On Thu, Oct 31, 2019 at 03:23:09PM +0200, Laurent Pinchart wrote:
> > > > > The IMX296LLR is a monochrome 1.60MP CMOS sensor from Sony. The driver
> > > > > supports cropping and binning (but not both at the same time due to
> > > > > hardware limitations) and exposure, gain, vertical blanking and test
> > > > > pattern controls.
> > > > >
> > > > > Preliminary support is also included for the color IMX296LQR sensor.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > ---
> >
> > > > > +   imx->reset = devm_gpiod_get_optional(&client->dev, "reset",
> > > > > +                                        GPIOD_OUT_HIGH);
> > > > > +   if (IS_ERR(imx->reset)) {
> > > > > +           if (PTR_ERR(imx->reset) != -EPROBE_DEFER)
> > > > > +                   dev_err(&client->dev, "failed to get xclr gpio (%ld)\n",
> > > >
> > > > If you want to keep device specific naming for resources, I'd suggest using
> > > > `xclr` instead of `reset` in DT itself.
> > >
> > > For GPIOs I think there's an overall consensus that standard names are
> > > preferred, while I don't think this applies to clocks. It's a bit of a
> > > grey area though, so I'm open to change on or the other.
> > >
> > > Rob, any preference ?
> >
> > If in fact that's a reset, then yes, use 'reset-gpios'. 'xclr' is an
> > unusual name though.
>
> Vendors are always inventive :-)
>
> How about clock names ? Do you think they should be standardized too,

No, because I don't see any benefit of doing that in general. Using
'reset-gpios' could enable some common reset handling. I don't see
that with clocks. The only chance for common clock handling is really
turn on/off all clocks and names don't matter for that.

> should we decide on a name for the main functional clock, or should we
> use the pin name ?

I don't really care because that's not something we could ever
enforce. I'd pick the pin name if I had to.

Rob
