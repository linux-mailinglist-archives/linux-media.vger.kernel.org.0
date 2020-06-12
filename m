Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E071F7D15
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 20:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgFLSps (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 14:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLSps (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 14:45:48 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5405C03E96F
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:45:46 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id l27so11106268ejc.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P8sNBYcte/zk1gJm2YzOJRDjejnEUqN/A2ieuNyUweg=;
        b=bRJxS+Q2KQuM54a8erBJ8qt32TXVRsXhyMB8WWOq3eNmxwrN4tec98hY1I3dgRAadb
         ts7ymaPP/cxcISqUJMVR1rg0hvz0g6hLj31QBZ2Q4wp8U7XtRblQESknjGvBDfox0Z06
         uKeyun3azaUw4eFf03EUYyLAv5q0HMR3PsF8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P8sNBYcte/zk1gJm2YzOJRDjejnEUqN/A2ieuNyUweg=;
        b=SVte17IHSrvCHTLmZkHXdb4aDILzZlTpCxqup1S3MlPWecJ7dJ6iAhH07fko0pbgqi
         7rX59Gl4zvoub+hIpL4cTGHmtAhGwVhiBThjMWfM5ww/Y0OX1EccI31NcReuE86bBVDH
         b2GLQxNPZAfBs+9KMuhV52mo8rF2rgmCwYJPzQTB04EzshjuMMkQubyh4RSHNchtnBXJ
         2c+O4K+42a6MUmeDfE0TCqfWXqmtMJ0SYaiMwmzPFg5xv/pPfJoLl1+ThiZriVymqMab
         QVoPWImfIGKdf7gUl+cjtvtlZPduRy/56ztC4PgB9fmwt5NPiWO7FiWqLdJ7SxhwNoHG
         uSiQ==
X-Gm-Message-State: AOAM532PF7G5crDO1NG6SZ0qeZrnaB/Y2W1PxLXn9TW+ncQLlfUzzkzx
        G9l5Vcf1pquvbHZOU35P4jrqcaVYTAjppA==
X-Google-Smtp-Source: ABdhPJxYF+jTPS+A9voTh6m8SOIjNLEFgHSJcsH1aCm0Lb7M14FwaiKfCt2D6Y0pchc9Wwz5MpcvsA==
X-Received: by 2002:a17:906:4a8d:: with SMTP id x13mr13983161eju.26.1591987542946;
        Fri, 12 Jun 2020 11:45:42 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id rp21sm3996926ejb.97.2020.06.12.11.45.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 11:45:42 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id j10so10717887wrw.8
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:45:42 -0700 (PDT)
X-Received: by 2002:a1c:2e0e:: with SMTP id u14mr257126wmu.55.1591987183150;
 Fri, 12 Jun 2020 11:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-3-dongchun.zhu@mediatek.com> <20200610194455.GK201868@chromium.org>
 <1591958798.8804.660.camel@mhfsdcap03>
In-Reply-To: <1591958798.8804.660.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 12 Jun 2020 20:39:30 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Bcb4A+HAivA-jrczK+OMxwZk3w0GYoh-DU=6gmTZBWnQ@mail.gmail.com>
Message-ID: <CAAFQd5Bcb4A+HAivA-jrczK+OMxwZk3w0GYoh-DU=6gmTZBWnQ@mail.gmail.com>
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
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

On Fri, Jun 12, 2020 at 12:49 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Wed, 2020-06-10 at 19:44 +0000, Tomasz Figa wrote:
> > Hi Dongchun,
> >
> > On Sat, May 23, 2020 at 04:41:03PM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  MAINTAINERS                 |    1 +
> > >  drivers/media/i2c/Kconfig   |   13 +
> > >  drivers/media/i2c/Makefile  |    1 +
> > >  drivers/media/i2c/ov02a10.c | 1025 +++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1040 insertions(+)
> > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > >
> >
> > Thank you for the patch. Please see my comments inline.
> >
> > [snip]
> > > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > > new file mode 100644
> > > index 0000000..160a0b5
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/ov02a10.c
> > [snip]
> > > +static const char * const ov02a10_test_pattern_menu[] = {
> > > +   "Disabled",
> > > +   "Color Bar",
> >
> > nit: We should normalize this to one of the standard names. What is the
> > pattern on this sensor? Is it perhaps "Eight Vertical Colour Bars"?
> >
>
> Yes. It is one kind of 'Eight Vertical Colour Bars'.
> This pattern is called as 'MIPI color bar' per the datasheet.
> Can we here use 'Vertical Color Bar' or 'MIPI Color Bar'?
>

We should try to stick to the names as exposed by existing drivers.
There was an attempt to unify the naming of some Sony sensors some
time ago [1]. Perhaps one of the names there matches the pattern of
this sensor?

[1] https://patchwork.kernel.org/patch/10711777/

Best regards,
Tomasz
