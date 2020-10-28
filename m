Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 230ED29D9DF
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 00:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387530AbgJ1XFD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 19:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390048AbgJ1XE7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 19:04:59 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2ABC0613CF
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2020 16:04:59 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id a7so886897lfk.9
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2020 16:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6y4QOceXe8zRQKZs06ORTkquPOtHQn77ARvbGZP9r1M=;
        b=gFRUCQCFuTR8+JtdmcXcAlK5X7E61XmvvyAGA/K18mnTt93AI2o+wSqfYUI4n8Y0lU
         +48KACrQVO3Qw2aB5MwS/gPxeoLzJZw2XI2pEtuKlzoaB/ELqONtZsDRg2xOHXNYJiB6
         ur5YGrTWS0kXoutcPvKSjtwakbK/45cyXDu+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6y4QOceXe8zRQKZs06ORTkquPOtHQn77ARvbGZP9r1M=;
        b=mfHgDNfWxWbusafwhwMF6z53njJ2W3IdVu3JANX4d6fl7/TQZbxtESSQYwq3beMyHF
         NsXt9GmB1ndcnR9q3ns0pCrlBAezNtxLVDItEnAFbfWTVlnWQBmmbSH/nuhFNpf0ZwBk
         Zzc7aQavYcvRWN9l8jay05LFFckfBKtq/a4tpLBbzuCjjdUxj99y7w548XCnvacZJSaB
         6gXQu1BTthRzEfcmaZmqbH8eIRVnj9m3m3pPgqxNXdRhgJ90JWd9vuPQHTrNTUUHQTMN
         5Pt8nobF7I11Df3y3cyMCxqmhJkCsuBRmkwH1wJZTKBgTspKjFQoaNEc1iEAAMzl+27o
         W2jw==
X-Gm-Message-State: AOAM5312DCjKQHIGPa50mHVOSiqvwNaDwzliDsZrBo+xSWKAOTUHAGtY
        j5wcSruiBQ4SCq7KeqTlqnptsnNpPBqV1w==
X-Google-Smtp-Source: ABdhPJzPPkc9489U7NFWqV+uA8Og3GCnXRKnBTXmE8SkS20iK0uz9oZD+S/aSqbA0qwUPI/l/aJmwg==
X-Received: by 2002:a17:907:2084:: with SMTP id pv4mr7534108ejb.315.1603886921540;
        Wed, 28 Oct 2020 05:08:41 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id s12sm2796234edu.28.2020.10.28.05.08.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 05:08:40 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id t9so5380558wrq.11
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2020 05:08:40 -0700 (PDT)
X-Received: by 2002:adf:ab05:: with SMTP id q5mr8280571wrc.32.1603886919796;
 Wed, 28 Oct 2020 05:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201028091947.93097-1-krzk@kernel.org> <MWHPR11MB0046B799E9AD3648C6F67BFE87170@MWHPR11MB0046.namprd11.prod.outlook.com>
 <CAJKOXPePfsRNZkY+L1XM3_iz6dMYFNZAJgrcut9JriuwYkKWsw@mail.gmail.com>
 <CAJKOXPf6zhpu_3oQZ2bL_FnkBx7-NwH65N_OzVkH=Nh1bYkHxw@mail.gmail.com>
 <20201028100311.GF26150@paasikivi.fi.intel.com> <CAJKOXPcjtZidY1prH1ZCj+i-SM1mhABGbS_6_g1cH5WSGVhOAA@mail.gmail.com>
In-Reply-To: <CAJKOXPcjtZidY1prH1ZCj+i-SM1mhABGbS_6_g1cH5WSGVhOAA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 28 Oct 2020 13:08:28 +0100
X-Gmail-Original-Message-ID: <CAAFQd5AwvuuxekSdDnHNB7KiC7+mHFisEkCW71F3XQMWaFqamw@mail.gmail.com>
Message-ID: <CAAFQd5AwvuuxekSdDnHNB7KiC7+mHFisEkCW71F3XQMWaFqamw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx258: correct mode to GBGB/RGRG
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Yeh, Andy" <andy.yeh@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jason Chen <jasonx.z.chen@intel.com>,
        Alan Chiang <alanx.chiang@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 28, 2020 at 11:15 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, 28 Oct 2020 at 11:03, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > On Wed, Oct 28, 2020 at 10:56:55AM +0100, Krzysztof Kozlowski wrote:
> > > On Wed, 28 Oct 2020 at 10:45, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > >
> > > > On Wed, 28 Oct 2020 at 10:43, Yeh, Andy <andy.yeh@intel.com> wrote:
> > > > >
> > > > > But the sensor settings for the original submission is to output GRBG Bayer RAW.
> > > > >
> > > > > Regards, Andy
> > > >
> > > > No, not to my knowledge. There are no settings for color output
> > > > because it is fixed to GBGB/RGRG. I was looking a lot into this driver
> > > > (I have few other problems with it, already few other patches posted)
> > > > and I could not find a setting for this in datasheet. If you know the
> > > > setting for the other color - can you point me to it?
> > >
> > > And except the datasheet which mentions the specific format, the
> > > testing confirms it. With original color the pictures are pink/purple.
> > > With proper color, the pictures are correct (with more green color as
> > > expected for bayer).
> >
> > Quoting the driver's start_streaming function:
> >
> >         /* Set Orientation be 180 degree */
> >         ret = imx258_write_reg(imx258, REG_MIRROR_FLIP_CONTROL,
> >                                IMX258_REG_VALUE_08BIT, REG_CONFIG_MIRROR_FLIP);
>
> I understand that you think it will replace the lines and columns and
> the first line will be RG, instead of GB.... or actually BG because it
> flips horizontal and vertical? So why does it not work?

Any chance your SoC capture interface performs this flipping on its own as well?

>
> BTW, this nicely points that the comment around
> device_property_read_u32() for rotation is a little bit misleading :)
>

Are you referring to the comment below?

/*
* Check that the device is mounted upside down. The driver only
* supports a single pixel order right now.
*/
ret = device_property_read_u32(&client->dev, "rotation", &val);
if (ret || val != 180)
    return -EINVAL;

What's misleading about it?

> >         if (ret) {
> >                 dev_err(&client->dev, "%s failed to set orientation\n",
> >                         __func__);
> >                 return ret;
> >         }
> >
> > Could it be you're taking pictures of pink objects? ;-)
>
> I can send a few sample pictures taken with GStreamer (RAW8, not
> original RAW10)...
>
> Best regards,
> Krzysztof
