Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7951F96E6
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 14:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729996AbgFOMpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 08:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729884AbgFOMpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 08:45:02 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778A0C061A0E
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 05:45:01 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id k11so17260291ejr.9
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 05:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EAByj1ACF3eG5h2YQoy4Zv57kLAIJMEzK1yr/nWTV5c=;
        b=FiCQlYLTKWwhipqP9kqvJWv/A/Z+VNCbpv6u711mWSu7hINN75IBeaYV8OZikqRIEQ
         qS8wSh4Lo0ISen5u8EMoDK0Eplz1KkC3+tJaNOJKXYp2Xr39qDBp85rBkvC5EhiiCv72
         ZNgtiPOQgUSXebknUjgkXJbDKSR9U86BnGZkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EAByj1ACF3eG5h2YQoy4Zv57kLAIJMEzK1yr/nWTV5c=;
        b=FovrNslZi13ZytkG7W1GErb/fvWqJlNR4wJ+RV2Qlp0R1cyXjxRN+STVPg6FVVET0I
         VmmfMfSQUz8PSpXOp7vh4XveoshY3P8JWRQMlgg/Nwkt8vEpNV+c2xBNzdt1Y5iYuUE/
         1AiknH48yMuKnGtwJqTbKCUJ/CxLVq5DQrfbdfJrZErNQFC2Bsejc345/FJf6R0OhVlg
         z06hQHW2ZtyMN5g0cAD+wjum+Fe/F7awWh47X8bCYSGRQvRUx41tSirt5Y3yLM4sl83K
         nuE51fkstHdt+CKo2KyhPj6sJsu6RCifJC7flKuf86DslgZ0fglTVLlKmKC+RgPWLkNt
         sxqA==
X-Gm-Message-State: AOAM533WaYOa7fpRfSLOgSJ1NnkvxbZfhgHvXVOgDqsR5Y3wZtXF0lYi
        bQn47QSzB2MOMSVTeMvDGLCV7wnefOw=
X-Google-Smtp-Source: ABdhPJxgy3ChB9HHh8yBhX7oGLRmiQVp4lyNgUojKMA/PrPosu7P2JyMncel1uCHM8hvi2PEunRGIg==
X-Received: by 2002:a17:906:6094:: with SMTP id t20mr13633676ejj.359.1592225099627;
        Mon, 15 Jun 2020 05:44:59 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id z26sm8453846edm.1.2020.06.15.05.44.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 05:44:58 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id l17so14511547wmj.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 05:44:57 -0700 (PDT)
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr13160873wmk.11.1592225097322;
 Mon, 15 Jun 2020 05:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-3-dongchun.zhu@mediatek.com> <20200610194455.GK201868@chromium.org>
 <1591958798.8804.660.camel@mhfsdcap03> <CAAFQd5Bcb4A+HAivA-jrczK+OMxwZk3w0GYoh-DU=6gmTZBWnQ@mail.gmail.com>
 <1592200471.8804.681.camel@mhfsdcap03>
In-Reply-To: <1592200471.8804.681.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 15 Jun 2020 14:44:46 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DvPcH-1jeeXaQ=qfxVHr82F8FBberF=QzLW4p49PZ2PA@mail.gmail.com>
Message-ID: <CAAFQd5DvPcH-1jeeXaQ=qfxVHr82F8FBberF=QzLW4p49PZ2PA@mail.gmail.com>
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Mon, Jun 15, 2020 at 7:57 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Fri, 2020-06-12 at 20:39 +0200, Tomasz Figa wrote:
> > On Fri, Jun 12, 2020 at 12:49 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Wed, 2020-06-10 at 19:44 +0000, Tomasz Figa wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Sat, May 23, 2020 at 04:41:03PM +0800, Dongchun Zhu wrote:
> > > > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > ---
> > > > >  MAINTAINERS                 |    1 +
> > > > >  drivers/media/i2c/Kconfig   |   13 +
> > > > >  drivers/media/i2c/Makefile  |    1 +
> > > > >  drivers/media/i2c/ov02a10.c | 1025 +++++++++++++++++++++++++++++++++++++++++++
> > > > >  4 files changed, 1040 insertions(+)
> > > > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > > > >
> > > >
> > > > Thank you for the patch. Please see my comments inline.
> > > >
> > > > [snip]
> > > > > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > > > > new file mode 100644
> > > > > index 0000000..160a0b5
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/i2c/ov02a10.c
> > > > [snip]
> > > > > +static const char * const ov02a10_test_pattern_menu[] = {
> > > > > +   "Disabled",
> > > > > +   "Color Bar",
> > > >
> > > > nit: We should normalize this to one of the standard names. What is the
> > > > pattern on this sensor? Is it perhaps "Eight Vertical Colour Bars"?
> > > >
> > >
> > > Yes. It is one kind of 'Eight Vertical Colour Bars'.
> > > This pattern is called as 'MIPI color bar' per the datasheet.
> > > Can we here use 'Vertical Color Bar' or 'MIPI Color Bar'?
> > >
> >
> > We should try to stick to the names as exposed by existing drivers.
> > There was an attempt to unify the naming of some Sony sensors some
> > time ago [1]. Perhaps one of the names there matches the pattern of
> > this sensor?
> >
> > [1] https://patchwork.kernel.org/patch/10711777/
> >
>
> Sounds great.
> It is one good idea to summarize test patterns from various sensors.
> But one question plaguing me is that it seems even for the same "Eight
> Vertical Colour Bars", different sensors may have different RGB color
> map.
>
> Moreover, definition standards of color bar style may differ among
> different sensor chip vendors.
> For instance, Sony often uses "Solid Color", "Color Bars With Fade to
> Grey", "PN9" to abstract test pattern output type; while OmniVision
> adopts color bar type 1, 2, 3, 4 or "MIPI Color Bar", "ISP Color Bar"
> instead.

The test patterns are commonly very similar, just different vendors
call them with different names. There is actually a specification
called MIPI CCS [1], which standardizes many aspects of sensor
programming, including test patterns. Most of the sensors don't really
follow the entire specification yet, but often some aspects happen to
match.

In the copy of the specification that I have, the test patterns are
described in section 10 (Test modes), page 203, with pictures on
following pages. Perhaps we could standardize the names based on that,
when the pattern matches?

Sakari, what do you think?

[1] http://resources.mipi.org/camera-command-set-v1-1-download

Best regards,
Tomasz
