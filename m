Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496EC1E0DCC
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 13:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390270AbgEYLwc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 07:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390208AbgEYLwb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 07:52:31 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07118C061A0E
        for <linux-media@vger.kernel.org>; Mon, 25 May 2020 04:52:29 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id bs4so14795474edb.6
        for <linux-media@vger.kernel.org>; Mon, 25 May 2020 04:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/cWAJl3Z7M7phJWdZ1viutRbSoAqLOTBAKufEZLlQs=;
        b=J7zkISA9IACBaVZfIy7JcdxpE2ftuH3PzvgPxwCPTVvWLm94b33+EPTzq46DDaYm2H
         tCRXLAp5upCjONBGcvqexKg7AU8Ka8ylT2X4YZPrLOUyQsXkiPls4zRxhVigqskhJ8Qc
         R2JRs8LOj+hBFPv1FWpfNKziFvgfyUK87dOXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P/cWAJl3Z7M7phJWdZ1viutRbSoAqLOTBAKufEZLlQs=;
        b=eWGPWKRX6cMGGhDInJYzB208D3JOn8/vSENANVAluhA8FsXKV6Z8jqQHSyi6iMgVPq
         I0N0Cl/2vXjQVjn5OjlS84IVZhm6r5YGpergx3DMh4MD9nMnxVm4ZlUqvlEXigeIacsN
         2Oxto8w8hPSiEz5+AgGPA7gZGCoeZj1j/2LLBXBkxxcB1FhNQwW0dnR1K+TQejgph1jt
         fX0YCzit14zxxrgVgNEV5zHPowEKX9hPFHYOPj/ceVyj3yl78FX0eR1IHrGaMfoz9GjM
         YZDX9Xr+xKI0vmlmrSZJllP4SMlcIX+Wfza2mpcNy9jLU8SEFTxvAIOh1BPK7EYW4xKr
         sawA==
X-Gm-Message-State: AOAM531BZNFGqWdZmwOFKg8mS4Xpb5UdGnAt1cOVAp7We7IN4AvcXKM+
        N689jwncB+pFelrFxuUeCakTnHc4997BDQ==
X-Google-Smtp-Source: ABdhPJwqMfFiSytTInTziIW2InU3iQdNG/oiD33rTvTL94s8ITE76NmbWdgrZRQbC5E5cNrRjkw62w==
X-Received: by 2002:aa7:d999:: with SMTP id u25mr15156266eds.339.1590407547170;
        Mon, 25 May 2020 04:52:27 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id 93sm16056929edy.49.2020.05.25.04.52.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 04:52:26 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id i15so16780133wrx.10
        for <linux-media@vger.kernel.org>; Mon, 25 May 2020 04:52:26 -0700 (PDT)
X-Received: by 2002:adf:e543:: with SMTP id z3mr14316481wrm.385.1590407120295;
 Mon, 25 May 2020 04:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
 <20200518132731.20855-3-dongchun.zhu@mediatek.com> <20200521195113.GC14214@chromium.org>
 <1590139561.8804.390.camel@mhfsdcap03>
In-Reply-To: <1590139561.8804.390.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 25 May 2020 13:45:07 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
Message-ID: <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
Subject: Re: [V6, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
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

On Fri, May 22, 2020 at 11:27 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> Thanks for the review. My replies are as below.
>
> On Thu, 2020-05-21 at 19:51 +0000, Tomasz Figa wrote:
> > Hi Dongchun, Sakari,
> >
> > On Mon, May 18, 2020 at 09:27:31PM +0800, Dongchun Zhu wrote:
[snip]
> > > +   pm_runtime_enable(dev);
> > > +   if (!pm_runtime_enabled(dev)) {
> > > +           ret = dw9768_runtime_resume(dev);
> > > +           if (ret < 0) {
> > > +                   dev_err(dev, "failed to power on: %d\n", ret);
> > > +                   goto entity_cleanup;
> > > +           }
> > > +   }
> > > +
> > > +   ret = v4l2_async_register_subdev(&dw9768->sd);
> > > +   if (ret < 0)
> > > +           goto entity_cleanup;
> > > +
> > > +   return 0;
> > > +
> > > +entity_cleanup:
> >
> > Need to power off if the code above powered on.
> >
>
> Thanks for the reminder.
> If there is something wrong with runtime PM, actuator is to be powered
> on via dw9768_runtime_resume() API.
> When actuator sub-device is powered on completely and async registered
> successfully, we shall power off it afterwards.
>

The code above calls dw9768_runtime_resume() if
!pm_runtime_enabled(dev), but the clean-up code below the
entity_cleanup label doesn't have the corresponding
dw9768_runtime_suspend() call.

Best regards,
Tomasz
