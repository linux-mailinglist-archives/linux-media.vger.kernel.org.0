Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98CAA5FC430
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 13:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiJLLMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 07:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbiJLLMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 07:12:20 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93849C14A5
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 04:12:18 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id k2so37284571ejr.2
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 04:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XSGNIw4JwauqUqZHYP2dVWF2UYuBSzPKhVhsIvrNb7k=;
        b=dCgTV7i+qBiWnD0TV/2jj6kv46EO5pPWHwOtFqslR6YVV7fKpdQKCrFC+4f1imTCM9
         FmVEk1tL627rxK2Pb5IxYyDYhXdXugG4FOfryOp0hnMVPUaDsz3/aSO7hAX1oPfbVH3d
         p11KebXO+FPFt52Pp0K28TOlqDh6xUxPqO//9ZfhFnD4iv5IH5m6bJRyXCjk3JXHHnjO
         95kQEhGDmD9bH1MjFkjzTMctw+pnhjP0gGZHkg+kpwR3Ox8sY5Ky/QeJKApo9WERBAds
         FcoC5wEuyzlYQI7cRH4MHTm4vfLMxFdDh2/9/N7TjjXCD8v12EVgLVa/P5Zv9B7pOK5b
         Nk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XSGNIw4JwauqUqZHYP2dVWF2UYuBSzPKhVhsIvrNb7k=;
        b=ePwCn6tS3dwheFWnwW00HwxaaZDO82yBk4/qzFDUX05RJ1g9nyYcV7lEyt1lZEQ94V
         HhriwgJZcDcWxWWmN9GHQsusHtprjMX4b87gJOhW5GpeEmLw34JRiCAipL+kjArLwPuF
         da+4PxVAmA+HuPREGwafpSctgfc46j9DvFYqe1XJm/Hz08m2eEfo8Qo0ApRxpXJ8klAJ
         iQ5ofxKPrJ+VU9hyqZoa1sfp6g9BjbdSQFTJFRssAC7dpXUbXRH8GOzJKsuj5eMyv8Hz
         Q2TwrMjM4kRwVTpWk1sHhXks61sUtKaBmcW7uyU/ep83SJhWEvn8U1GRliI3LtHJe/Yx
         o3aw==
X-Gm-Message-State: ACrzQf3ya8FstDg1SHs9QCwcmLzsLJhH5b8VNPGjQZehf1tBCwKT6y79
        kZYBP16wPZcE9fWlthIOEFMhTNr46zTLma3y5YK4Pg==
X-Google-Smtp-Source: AMsMyM4g3pnyS4I2dvwUhK/z4nLATNT+NjUt95sT3ZJvBelLm6ngYrhjO9Jx9DnIN+Zh55LZirLzjASdPAzH1dYldog=
X-Received: by 2002:a17:907:2cf1:b0:78d:cafc:caba with SMTP id
 hz17-20020a1709072cf100b0078dcafccabamr9310584ejc.154.1665573137103; Wed, 12
 Oct 2022 04:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220922104225.1375331-1-bryan.odonoghue@linaro.org>
 <20220922104225.1375331-4-bryan.odonoghue@linaro.org> <CAPY8ntAAcbv0myL3F-OOOH_rUUF7q==DQFq1sCaYAY=+JapgcA@mail.gmail.com>
 <cc24035d-9a32-ff9e-bffa-a21a0f79f138@linaro.org> <1679970e-a1db-3b6b-7170-2296c32fdff1@linaro.org>
 <Y0aDq3qQb9y9IcOA@valkosipuli.retiisi.eu>
In-Reply-To: <Y0aDq3qQb9y9IcOA@valkosipuli.retiisi.eu>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 12 Oct 2022 12:12:01 +0100
Message-ID: <CAPY8ntAgKYS2-A3mpMTPV4S5BKn_vawrRrW052U8LhbfnTTC4Q@mail.gmail.com>
Subject: Re: [PATCH v4 RESEND 3/3] media: i2c: imx412: Add new compatible strings
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, jacopo@jmondi.org,
        paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan

On Wed, 12 Oct 2022 at 10:06, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Bryan,
>
> On Wed, Oct 12, 2022 at 01:56:19AM +0100, Bryan O'Donoghue wrote:
> > On 22/09/2022 12:19, Bryan O'Donoghue wrote:
> > > On 22/09/2022 12:16, Dave Stevenson wrote:
> > > > It may*eventually*  work for all three parts, but isn't the time to
> > > > add the compatible string at the point where it is actually compatible
> > > > with the driver?
> > >
> > > Yes. I forgot about the 0x477 chip id on your part.
> > >
> > > I'm happy enough to drop 477 from the compat string or indeed to allow
> > > 0x0477 as a valid chip identifier in imx412.
> > >
> > > Sakari, what would you like to do ?
> > >
> > > ---
> > > bod
> >
> > Right.
> >
> > So I got myself the official rpi imx477 sensor and ran the imx412/imx577
> > driver on the rpi 5.19.y tree
> >
> > It looks like the rpi driver configures imx477 for two MIPI data-lanes,
> > whereas upstream imx412 wants four MIPI data-lanes.
> >
> > So already that means the imx412 config as-is won't work.

It won't work on the Pi IMX477 camera module as-is due to only
exposing 2 data lanes, but there are 4 lane IMX477 modules around
(Arducam sell a couple).
Adding support for 2 lanes isn't a huge deal as long as you understand
the clock tree in the sensor.

> > But, we do know these sensors are very very close.

I have a conversation open with Sony about how common these sensors
are. The initial response from their Japanese team was that "common
form between sensors of different families is not a requirement
considered".

> > I think the right medium term thing to do is try take in the majority of the
> > imx477 code - including the various test modes, and resolutions and support
> > for different MIPI data-lane configurations.
> >
> > Its not clear to me that the imx412/imx577 and imx378/imx477 can genuinely
> > live in the same codebase though.

The way Sony tends to work is to give you a spreadsheet of the exact
register set required for the mode you ask them for, and they will
generally have validated the settings for image quality issues. They
tend not to go for generic configuration.

Presumably Intel as the original authors of imx412.c were given such a
spreadsheet for their particular use case.
We have such spreadsheets from Sony for our modes. As well as only
using 2 data lanes, they also drive the PLLs in a different mode (dual
vs single), so how many of those changes need to be preserved to
ensure we don't introduce image quality issues? How many of the
differences are valid for all the other supposedly common sensors? How
do we test it? How big is the can of worms?

The engineer in me loves to note where we have similarities between
sensors, but I'm also cautious in drawing too many conclusions as it
is far too easy to mess up image quality.

> > Anyway I think adding imx477 to the imx412 driver should be considered out
> > of scope pending answering most of those questions and getting the code to
> > work.
> >
> > Anyway that merging of rpi imx477 and upstream imx412/imx577 code feels like
> > an entirely different series.
> >
> > So I'll resend this series minus the imx477 bits.

Ideas On Board do have a contract to upstream our imx477 driver.
I will have a look at whether we can easily integrate it into the
existing imx412 driver, but it remains to be seen how much common
stuff remains between the sensors.

> I wonder if you saw my earlier reply... but this is certainly fine, too.

I guess that if we get there and find imx378/477 aren't common enough
with imx412, then we split off into a second compatible binding. I can
live with that.

  Dave
