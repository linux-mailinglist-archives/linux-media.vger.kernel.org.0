Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4BE20F781
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 16:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730997AbgF3OrX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 10:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbgF3OrW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 10:47:22 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243D1C061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 07:47:22 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id d18so10844356edv.6
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5dm/rjfkAYeOKvGlUu0DpeagoQTdzbRa2RO8YsK1yDA=;
        b=kHiITqAEixH3gwtr3H907V2DiU+kxfWWD2Qw8bDRxPeYz3lrIuItsoM9Pv99DTsoWC
         UhqasAV1O8djAZGDZ+JytGCbb0A+zV9G/V20uuQDQ4QvgsDLx2aviX735++seHJYVbqa
         DPKky1AG/J1s7hSlUY6Y/XOMx5rtU0odTX47Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5dm/rjfkAYeOKvGlUu0DpeagoQTdzbRa2RO8YsK1yDA=;
        b=VnsYTt8LpAusVemmIHCDf6/Ia6qJpuJjHlqz9K5RkXtfarltyyJPDey0Tb2uF59aLf
         qnzWkjAqfv/PQHIgbitrIVG9aotoftunh0dF42ZHK8PT4lRcgfLO0xp1vNWDeBz8AfPi
         AGnGctKayHKfdsSTwHkATKAYBl7tAUKPaomBHERXxAZUDWQ0jwL6z2b23cs6eUXRBcVl
         XoqNTbmuAP39C6mLRls+OPol7eEXbTpRXfCSgofGBX8oyCOHV5vrMD8D1bgd+9vKHqum
         bDZ4DzUmbFf7dlJjGRG3zOBgXoxA1QJ44T1xT2aJgo1Uxw1EqTEsXigTewBzjlFhJ1Lu
         Be2Q==
X-Gm-Message-State: AOAM5307TuBHgJKWZ+taVDxT/rLBU6phQFyx5iyxXwfnC+fIDJtTyh0q
        W6iAmGr56u6j0hjTyGU806gSCFI5q60/tQ==
X-Google-Smtp-Source: ABdhPJwOhxjUyQ6tE28ibv+yMMzA5H3emoEssGqW1ELnYt7aFjRRhtTBjY8KRkLrZzEAqI1FR70R2g==
X-Received: by 2002:a05:6402:1d35:: with SMTP id dh21mr17266463edb.186.1593528440637;
        Tue, 30 Jun 2020 07:47:20 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id q21sm2198525ejd.30.2020.06.30.07.47.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:47:20 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id p20so20893390ejd.13
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 07:47:20 -0700 (PDT)
X-Received: by 2002:adf:80e6:: with SMTP id 93mr21491180wrl.17.1593528023050;
 Tue, 30 Jun 2020 07:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com> <20200630095430.GF16711@paasikivi.fi.intel.com>
 <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
 <CAAFQd5B0GxPpGm750rVKfPJi-gtn7w9KouFhXZc4k5OEtiKqBg@mail.gmail.com> <20200630143705.GW3703480@smile.fi.intel.com>
In-Reply-To: <20200630143705.GW3703480@smile.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 30 Jun 2020 16:40:12 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CwwLzGKiCPdd_EzipmXPA2aYBrk0QRPv6Bacy++tXrHA@mail.gmail.com>
Message-ID: <CAAFQd5CwwLzGKiCPdd_EzipmXPA2aYBrk0QRPv6Bacy++tXrHA@mail.gmail.com>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Tue, Jun 30, 2020 at 4:37 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jun 30, 2020 at 04:21:31PM +0200, Tomasz Figa wrote:
> > On Tue, Jun 30, 2020 at 4:19 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > > On Tue, Jun 30, 2020 at 11:54 AM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
>
> ...
>
> > > > > +     ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > >
> > > >
> > > > Shouldn't this be GPIOD_OUT_HIGH? That's the state it'll be after powering
> > > > the sensor off the first time. Alternatively make reset signal high in
> > > > runtime suspend callback.
> > >
> > > We might want to keep the signals low when the regulators are powered
> > > down, to reduce the leakage.
> >
> > Ah, I actually recall that the reset pin was physically active low, so
> > we would indeed better keep it at HIGH. Sorry for the noise.
>
> Here HIGH means "asserted", so in the code above it's LOW, means "deasserted",
> i.o.w. non-reset state. I dunno what is better, it depends to the firmware /
> driver expectations of the device configuration (from the power point of view,
> HIGH makes sense here, and not LOW, i.o.w. asserted reset line).
>
> And nice of the logical state that it doesn't depend to the active low / high
> (the latter just transparent to the user).

Yeah, after reading through the GPIO subsystem documentation and
discussing with a bunch of people on how to interpret it, we concluded
that the driver needs to deal only with the logical state of the
signal.

Actually, I later realized that the problem of leakage should likely
be solved by pinctrl suspend settings, based on given hardware
conditions, rather than the driver explicitly.

Best regards,
Tomasz
