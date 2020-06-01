Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2690F1EADBE
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 20:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730795AbgFASsM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 14:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730310AbgFASsK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jun 2020 14:48:10 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE871C061A0E
        for <linux-media@vger.kernel.org>; Mon,  1 Jun 2020 11:48:09 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id n24so10219044ejd.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2020 11:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ll0Hxtpd9kUjoZ6368PBnHFjk1t/KP9A5doX0NsjS8Y=;
        b=HHXQoRKkRwnj5wx8VXlsES6HymXOV8W2MTPYDHm4YaFpj9bCVwM2Nxf2BlFpKZp3XB
         2Qh/o6KxlEKLbqinUeFXafMKslx9YzDJAaZs+8Unv53j5DBKoqiPBjGvg/IYBC7Q3JA/
         Ieg4HsYz/NKf3SaU/zciPOSrIIBePr/Z58XAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ll0Hxtpd9kUjoZ6368PBnHFjk1t/KP9A5doX0NsjS8Y=;
        b=elw5JRcbMtEoPDnyqbNq8CdjjJi+wq8Bd22hjSuaQfq09UXIjddyF9HiZqXhijV2H1
         u2X4PI1ZLw/E0BPKl3Q5NVwNWrAsAemnfBbz3JzBIkrX+DemGkQIX0Sdaw5xWnRc6Nrl
         6NRRc6V2jg3/vMmuL7Pg8ncS9X6ykcxnrj37QfSpt/YWqHOACiWNeOmzontNT64IUyjc
         Zw/5hisITZePz2my4O4b1E0eNu5rB4puCRb0FX0Ng92rTe+FJmwm64aJFTiuDAmGb35D
         tNG5JMltHvAryay7bCLL4bdibHowzZluhCESxYigHlx4puQZ4D0unvWbLlyhboYtuZZQ
         e6xQ==
X-Gm-Message-State: AOAM533V/uduzb2L+UB+E1fXx5kkdTqfQEpiqc6ZCgMR2XWOdPUNGhdB
        Ym00SR1QAqlOtm47/qLuVMWhgorlmmJxjA==
X-Google-Smtp-Source: ABdhPJx47QQ6cEuoy6uipSHWtWB6TyKM1E4XXwhu6BmJawg7mqyGvX1tu/Oxk+d+QNShM7Ey3MN6Jw==
X-Received: by 2002:a17:906:4406:: with SMTP id x6mr20336405ejo.160.1591037288348;
        Mon, 01 Jun 2020 11:48:08 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id c17sm354566eja.42.2020.06.01.11.48.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 11:48:07 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id r15so554178wmh.5
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2020 11:48:06 -0700 (PDT)
X-Received: by 2002:a7b:c622:: with SMTP id p2mr590231wmk.55.1591037285905;
 Mon, 01 Jun 2020 11:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
 <20200518132731.20855-3-dongchun.zhu@mediatek.com> <20200521195113.GC14214@chromium.org>
 <1590139561.8804.390.camel@mhfsdcap03> <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
 <1590570089.8804.453.camel@mhfsdcap03>
In-Reply-To: <1590570089.8804.453.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 1 Jun 2020 20:47:54 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Dgboh8om68546ADELX3g-0y40rdBxY+H3WsX5xAD1_FQ@mail.gmail.com>
Message-ID: <CAAFQd5Dgboh8om68546ADELX3g-0y40rdBxY+H3WsX5xAD1_FQ@mail.gmail.com>
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

On Wed, May 27, 2020 at 11:03 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Mon, 2020-05-25 at 13:45 +0200, Tomasz Figa wrote:
> > On Fri, May 22, 2020 at 11:27 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > Thanks for the review. My replies are as below.
> > >
> > > On Thu, 2020-05-21 at 19:51 +0000, Tomasz Figa wrote:
> > > > Hi Dongchun, Sakari,
> > > >
> > > > On Mon, May 18, 2020 at 09:27:31PM +0800, Dongchun Zhu wrote:
> > [snip]
> > > > > +   pm_runtime_enable(dev);
> > > > > +   if (!pm_runtime_enabled(dev)) {
> > > > > +           ret = dw9768_runtime_resume(dev);
> > > > > +           if (ret < 0) {
> > > > > +                   dev_err(dev, "failed to power on: %d\n", ret);
> > > > > +                   goto entity_cleanup;
> > > > > +           }
> > > > > +   }
> > > > > +
> > > > > +   ret = v4l2_async_register_subdev(&dw9768->sd);
> > > > > +   if (ret < 0)
> > > > > +           goto entity_cleanup;
> > > > > +
> > > > > +   return 0;
> > > > > +
> > > > > +entity_cleanup:
> > > >
> > > > Need to power off if the code above powered on.
> > > >
> > >
> > > Thanks for the reminder.
> > > If there is something wrong with runtime PM, actuator is to be powered
> > > on via dw9768_runtime_resume() API.
> > > When actuator sub-device is powered on completely and async registered
> > > successfully, we shall power off it afterwards.
> > >
> >
> > The code above calls dw9768_runtime_resume() if
> > !pm_runtime_enabled(dev), but the clean-up code below the
> > entity_cleanup label doesn't have the corresponding
> > dw9768_runtime_suspend() call.
> >
>
> Did you mean the 'entity_cleanup' after v4l2_async_register_subdev()?

Yes.

> Actually I made some changes for OV02A V9, according to this comment.
> Could you help review that change? Thanks.

Sure, I will take a look.

Best regards,
Tomasz
