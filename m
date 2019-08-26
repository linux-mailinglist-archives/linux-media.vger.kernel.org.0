Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA749C9C0
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 09:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbfHZHAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 03:00:25 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33680 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729437AbfHZHAZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 03:00:25 -0400
Received: by mail-ed1-f68.google.com with SMTP id s15so25026676edx.0
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 00:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nTkNb4qhu4LWrFg09llWi3oBh88pK95w54xsWrsdjT0=;
        b=WRcwatvAI0WEvdFUv/sT0oyCxKW9JAWDmzw43+hawcVPvkP4MC+sOxq613oe7+u4MD
         bjj8wG02Jk6cwVwZCt36tlQmALBdiNQObpjmpl0NVmcWhLPGKFfJioYsChUsQ2SvXU+Z
         +1RwYI0ZvOyR/CpVy0n1vVMkrI8RqOW2IPN3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nTkNb4qhu4LWrFg09llWi3oBh88pK95w54xsWrsdjT0=;
        b=fHDex3u1dFNtcSifPoEUqR5uMRuQzM1PGOa7lwpos1nrJEmIeFQALVAPyc1j+ykcQC
         KGZ2zSRihq4HCvpqB+vZPrQRNtczUbJ3OQuIo/jdOyoWbxI6WWeE+VnWFxHu0H3Op619
         pg8ZrZ96Riwy2xJ3NcdRPi7u0no3bRJiF1I6o0Z4U2OSDHu1XFN75AFWA84uU7ixbm8h
         yKLMMR0D/pYzontsszo6p9cIcPZMQ0Q/QexbvSVfNHZhFLY0JmQsBxVV76HFRG8pNoUa
         QcvkxrKv3CQhPTjdZBjKE4PKBU4VBytKVQni8Od0/r5X60YfRpFAdsGCW/gCEd6IxY9M
         TZoA==
X-Gm-Message-State: APjAAAUvyo4TSDGFFR5vYfarDcyAb+a+BTrlrdOg9s9Ak/TkAT4pRku2
        wJUxdCta3QLL2G9aiIuKh1P1sTTX7Rjb8g==
X-Google-Smtp-Source: APXvYqz3TNS37+1cl+fXdnaoMAOwxFxemQQpQC5HGPGhkHDM1VJ1RJbt2/gGoSb1/9VW2Y8adYKoog==
X-Received: by 2002:a05:6402:170f:: with SMTP id y15mr17651378edu.55.1566802824037;
        Mon, 26 Aug 2019 00:00:24 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id c1sm1097105edn.62.2019.08.26.00.00.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2019 00:00:23 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id g17so14197948wrr.5
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 00:00:23 -0700 (PDT)
X-Received: by 2002:adf:fc03:: with SMTP id i3mr19059644wrr.48.1566802476916;
 Sun, 25 Aug 2019 23:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190819034331.13098-1-dongchun.zhu@mediatek.com>
 <20190819034331.13098-3-dongchun.zhu@mediatek.com> <20190821103038.GA148543@chromium.org>
 <20190821110542.GD31967@paasikivi.fi.intel.com>
In-Reply-To: <20190821110542.GD31967@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 26 Aug 2019 15:54:25 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A-ze9FgDqNpPgyu7gA3nQPUW_G0zEG8ThNGjVEb=_jjA@mail.gmail.com>
Message-ID: <CAAFQd5A-ze9FgDqNpPgyu7gA3nQPUW_G0zEG8ThNGjVEb=_jjA@mail.gmail.com>
Subject: Re: [V3, 2/2] media: i2c: Add Omnivision OV02A10 camera sensor driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     dongchun.zhu@mediatek.com,
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
        devicetree@vger.kernel.org, Louis Kuo <louis.kuo@mediatek.com>,
        shengnan.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 21, 2019 at 8:05 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Tomasz,
>
> On Wed, Aug 21, 2019 at 07:30:38PM +0900, Tomasz Figa wrote:
[snip]
> > Is it really correct to enable the clock before the regulators?
> >
> > According to the datasheet, it should be:
> >  - PD pin HIGH,
> >  - nRST pin LOW,
> >  - DVDDIO and AVDD28 power up and stabilize,
> >  - clock enabled,
> >  - min 5 ms delay,
> >  - PD pin LOW,
> >  - min 4 ms delay,
> >  - nRST pin HIGH,
> >  - min 5 ms delay,
> >  - I2C interface ready.
> >
> > > +
> > > +   /* Note: set 0 is high, set 1 is low */
> >
> > Why is that? If there is some inverter on the way that should be handled
> > outside of this driver. (GPIO DT bindings have flags for this purpose.
> >
> > If the pins are nRESET and nPOWERDOWN in the hardware datasheet, we should
> > call them like this in the driver too (+/- the lowercase and underscore
> > convention).
> >
> > According to the datasheet, the reset pin is called RST and inverted, so we should
> > call it n_rst, but the powerdown signal, called PD, is not inverted, so pd
> > would be the right name.
>
> For what it's worth sensors generally have xshutdown (or reset) pin that is
> active high. Looking at the code, it is not the case here. It's a bit odd
> since the usual arrangement saves power when the camera is not in use; it's
> not a lot but still. Oh well.
>

I guess we could drive powerdown low after disabling the regulators
and clocks, but that wouldn't work for the cases where the regulators
are actually shared with something else, especially if that is not
related to the same camera module.

> ...
>
> > > +static struct i2c_driver ov02a10_i2c_driver = {
> > > +   .driver = {
> > > +           .name = "ov02a10",
> > > +           .pm = &ov02a10_pm_ops,
> > > +           .of_match_table = ov02a10_of_match,
> >
> > Please use of_match_ptr() wrapper.
>
> Not really needed; the driver does expect regulators, GPIOs etc., but by
> leaving out of_match_ptr(), the driver will also probe on ACPI based
> systems.

Good point, I always keep forgetting about the ability to probe OF
drivers from ACPI. Then we also need to remove the #if
IS_ENABLED(CONFIG_OF) from ov02a10_of_match.

Best regards,
Tomasz
