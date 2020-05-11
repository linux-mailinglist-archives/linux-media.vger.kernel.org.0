Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DFD1CE294
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 20:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729830AbgEKS0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 14:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729673AbgEKS0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 14:26:49 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCECAC061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 11:26:47 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id s9so8374394lfp.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 11:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OlqMdCMv0t/jRFbvfx2oiVLxVGugmb8g6QsmrVI+x40=;
        b=hIfm5XW0NJEV60vNfF8m9alVsS2fZRz6bIMQxJc9+l0ft7pd3yuzq7Ggag4EvcoDjF
         uivi1BEPMuakJuVa1qTd6SM7jnMbr/A1mNEALhgep3z68K+eiXFsIbgL+g1SubhgV8LU
         jm7+kTa2GUdeE/H112fn0XfelirZ8uoNHW36A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OlqMdCMv0t/jRFbvfx2oiVLxVGugmb8g6QsmrVI+x40=;
        b=Am6sL86guPrcGPiPNsxSvJEaRcX51PS80XKLjeWubmHKdF/jWKRoMpIz1tXjllUTwq
         MhA40K9mv1wO6vnBWRnUs0wG2cRNpg/Q1f0eA5LlAU7s9Lkw+p0no2+KOkY+dP4cjVFa
         wFCRAKjkxwrPvlshYQ6YrsJH0vb/VTOySU3lsdfGNNyAoLRBVNevzlSj4l/OpBgJpBk4
         6UvDrNAHJ7lxN5qMeApF+b2FbfIXrYK3m1cclaRa6tqS6c7XDjdlxLiJmo0S/Dl/SiiP
         7HQGIHe5fPWFxtYQ3p21eZrCl/HVVlvP6DXA28U/FdCqszQYmPO+daUnVUH1c/YLZWGz
         oCIg==
X-Gm-Message-State: AOAM532A8xE8l6Xurp70D2A6wqF0br2sT+32Bp3rqV9632q06W3bOrdn
        UmEZjr8CU+A6iLxUxh7KmRx3Q+VFrnm8fw==
X-Google-Smtp-Source: ABdhPJySyccNp6hOG7T0NxxdcRkzxLeSqZnD61DJ+S0keVie7Q91Agqtt2EyfepfAQAHIfg61K/otA==
X-Received: by 2002:a05:6512:691:: with SMTP id t17mr11268134lfe.85.1589221605831;
        Mon, 11 May 2020 11:26:45 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id w15sm10604189ljd.35.2020.05.11.11.26.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 11:26:45 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id v5so4269645lfp.13
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 11:26:45 -0700 (PDT)
X-Received: by 2002:adf:e543:: with SMTP id z3mr18352165wrm.385.1589221272587;
 Mon, 11 May 2020 11:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
 <20200502161727.30463-3-dongchun.zhu@mediatek.com> <20200506151352.GZ9190@paasikivi.fi.intel.com>
 <1588855524.8804.168.camel@mhfsdcap03> <20200507131220.GC9190@paasikivi.fi.intel.com>
 <CAAFQd5DO9FGx9OF2RpcSprg0oLiVuS90w2qLAHCOSc3w6tKUWw@mail.gmail.com>
 <1588907288.8804.188.camel@mhfsdcap03> <20200508211319.GJ9190@paasikivi.fi.intel.com>
 <1588991026.8804.235.camel@mhfsdcap03>
In-Reply-To: <1588991026.8804.235.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 11 May 2020 20:20:59 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DZBEUJUq65WT7i_QjAtgxjhxmfdsjQoyG2UZy8zBih+A@mail.gmail.com>
Message-ID: <CAAFQd5DZBEUJUq65WT7i_QjAtgxjhxmfdsjQoyG2UZy8zBih+A@mail.gmail.com>
Subject: Re: [V5, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Sat, May 9, 2020 at 4:25 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Sakari,
>
> On Sat, 2020-05-09 at 00:13 +0300, Sakari Ailus wrote:
> > Hi Dongchun,
> >
> > On Fri, May 08, 2020 at 11:08:08AM +0800, Dongchun Zhu wrote:
> > > Hi Sakari, Tomasz,
> > >
> > > Thanks for the review.
> > >
> > > On Thu, 2020-05-07 at 15:46 +0200, Tomasz Figa wrote:
> > > > Hi Sakari, Dongchun,
> > > >
> > > > On Thu, May 7, 2020 at 3:12 PM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > HI Dongchun,
> > > > >
> > > > > On Thu, May 07, 2020 at 08:45:24PM +0800, Dongchun Zhu wrote:
> > > > > > Hi Sakari,
> > > > > >
> > > > > > Thanks for the review.
> > > > > >
> > > > > > On Wed, 2020-05-06 at 18:13 +0300, Sakari Ailus wrote:
> > > > > > > Hi Dongchun,
> > > > > > >
> > > > > > > On Sun, May 03, 2020 at 12:17:27AM +0800, Dongchun Zhu wrote:
> > > > > > > > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > > > > > > > control to set the desired focus via IIC serial interface.
> > > > > > > >
> > > > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > > ---
> > > > > > > >  MAINTAINERS                |   1 +
> > > > > > > >  drivers/media/i2c/Kconfig  |  11 ++
> > > > > > > >  drivers/media/i2c/Makefile |   1 +
> > > > > > > >  drivers/media/i2c/dw9768.c | 440 +++++++++++++++++++++++++++++++++++++++++++++
> > > > > > > >  4 files changed, 453 insertions(+)
> > > > > > > >  create mode 100644 drivers/media/i2c/dw9768.c
> > > > > > > >
> > > > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > > > index 8d72c41..c92dc99 100644
> > > > > > > > --- a/MAINTAINERS
> > > > > > > > +++ b/MAINTAINERS
> > > > > > > > @@ -5157,6 +5157,7 @@ L:  linux-media@vger.kernel.org
> > > > > > > >  S:       Maintained
> > > > > > > >  T:       git git://linuxtv.org/media_tree.git
> > > > > > > >  F:       Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > > > > > > > +F:       drivers/media/i2c/dw9768.c
> > > > > > > >
> > > > > > > >  DONGWOON DW9807 LENS VOICE COIL DRIVER
> > > > > > > >  M:       Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > > > > index 125d596..6a3f9da 100644
> > > > > > > > --- a/drivers/media/i2c/Kconfig
> > > > > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > > > > @@ -1040,6 +1040,17 @@ config VIDEO_DW9714
> > > > > > > >     capability. This is designed for linear control of
> > > > > > > >     voice coil motors, controlled via I2C serial interface.
> > > > > > > >
> > > > > > > > +config VIDEO_DW9768
> > > > > > > > + tristate "DW9768 lens voice coil support"
> > > > > > > > + depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > > > > > > + depends on VIDEO_V4L2_SUBDEV_API
> > > > > > >
> > > > > > > Please check how this works in the media tree master branch now --- it's
> > > > > > > largely select based.
> > > > > > >
> > > > > >
> > > > > > The actuator driver uses some structures that require the
> > > > > > VIDEO_V4L2_SUBDEV_API code, so here we add VIDEO_V4L2_SUBDEV_API
> > > > > > dependency to avoid possible build error when it's not enabled.
> > > > >
> > > > > Please make sure this works with current media tree master. Right now it
> > > > > does not.
> > > > >
> > > >
> > > > Dongchun, as Sakari said, please make sure to base the patches on the
> > > > master branch of the media tree.
> > > > (https://git.linuxtv.org/media_tree.git/). The approach for Kconfig
> > > > dependency selection there seems to have changed recently.
> > > >
> > >
> > > I searched the patches on the media tree master branch.
> > > It seems that we need to remove the VIDEO_V4L2_SUBDEV_API dependency in
> > > Kconfig, and add #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API to include
> > > v4l2-subdev code.
> > > The change mainly is to make build pass, and don't return ENOTTY if
> > > SUBDEV_API is not set.
> > > Am I right?
> >
> > Please see Kconfig entries for other similar drivers from Dongwoon.
> >
>
> Sorry for the mistake :-)
> Just found the current media tree master branch code...
> I would update Kconfig entries in next release by referring to:
> https://git.linuxtv.org/media_tree.git/tree/drivers/media/i2c/Kconfig

Sorry for last minute comments again. We had a short discussion
offline with Sakari and we think there are some changes needed to this
driver, namely:

1) The hardware being driven in our case is a gt9769, which could be
compatible with dw9768, but it's still a different implementation and
could have slightly different characteristics. Thus we think the
driver name and compatible strings should be renamed from
dongwoon,dw9768 to giantec,gt9769. In the future, if there is a device
with exactly a dw9768 chip, the same driver could be reused by adding
a dongwoon,dw9768 compatible string.

2) The chip has some default configuration, which is lost because the
driver overrides it with its own values. For use cases where one would
want to keep the default values, we should make it possible to prevent
the driver from overriding them. We could achieve this by adding
optional DT properties for the custom parameters and if they are not
present, defaults would be used.

Do you think that is doable? Thanks!

Best regards,
Tomasz
