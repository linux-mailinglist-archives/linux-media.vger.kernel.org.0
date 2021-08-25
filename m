Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823883F79FB
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 18:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234233AbhHYQRV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 12:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbhHYQRV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 12:17:21 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB82C061757;
        Wed, 25 Aug 2021 09:16:35 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id c10so25621653qko.11;
        Wed, 25 Aug 2021 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TEQBsqRyBKrTFBEPEYSxWovzrDerhiDO3jnvE5gA0hc=;
        b=dkEhirQbFi+P4MfCY/vhSeQNGFw50cEEsSmOJDF1L1KmnoJS/HcJpHqk3gEZCdNms7
         yOcrsQP7UO7X/HFlX3p/E4kSlWX/99FwcYRiSfKR9kThTgvyk/l+5pwPxTnQqBaRtLsj
         vSS6XNcevFHbW/GZ4PIED7ZwMSvri8am8nUNo+wgUvxJGDJWMcNrJ/Fnv2DHHKp4Dzp8
         B0u4kvA7VfQNxoEY3+R3HkITKYdAHQr5z+GkRe5/FqiOsS9z89IG9u6x1yhIfsAY03w6
         XfJoRE/u2u7gr3DSn2q12bkSJs45v6pXmZioiQFe2GVPFzxmMqPojUXEfZZFd+BgwcR4
         W2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TEQBsqRyBKrTFBEPEYSxWovzrDerhiDO3jnvE5gA0hc=;
        b=eJ/V5THA9vvF2PFsRdZ+n+2p1j1q/3qAIMahZj9trqU94xJoeuX/nexd1QFDbPJQni
         EKF9a9J98SRTdeCK/y+moqDLNPAjeHDeev+OS33LV3jbc935qeMvcVGwMkG7wSWoE1yz
         4GWi/dtv6PlJc4TNsdO6WZg51El3yhGAWCffydu+t9mgXavwvi9cgV5DjNTE4RY9yCWG
         qf8MZlEsY5AZoLM5b+0b1a0lSTCT8Rz4889qZXuNlBJ2SAaSafGNq6BQyVhg/NiDvwbo
         LtVfWq8eCsPBNm84+AdvzyFF9U0XxrArAPftfSj8ZRK8kgE2QggyUWttk1SV4Mwp3RkD
         3g8A==
X-Gm-Message-State: AOAM532061GXPjy9RHId4FNVniVFZ96wnzwbZmxea3gYGIT8VGJ8YlXf
        1P3yZrVSJZiXLt8bzXOuxmc2at9m9mBMDsg8QnA=
X-Google-Smtp-Source: ABdhPJzcBtYuOj4wv/5r0j9cBksb+FtL2rzRrdG1mqv1SQ5fr+oEej31lJJkd/ne4JcPCp6372WLNDBDi0MMnGBcI7E=
X-Received: by 2002:a25:f20a:: with SMTP id i10mr57500863ybe.236.1629908194363;
 Wed, 25 Aug 2021 09:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de> <20210819133128.45ef4353@coco.lan>
 <c56ec571-2278-95e9-2028-990e03159c3f@web.de> <20210822194709.4b9d33d4@coco.lan>
 <be6ac929-2443-ff55-3e11-6a86d6472e0e@web.de> <CAHk-=wjSadWPfzQ_hOqbjq6c_xwJs8GLHTyznhXRvDF5Yrs4FA@mail.gmail.com>
 <CAHFNz9L29LK+L8LjqyTyqq3LsvzeA6iYFHwP9n3uNBbqbbm1bg@mail.gmail.com> <20210825083305.562eba48@coco.lan>
In-Reply-To: <20210825083305.562eba48@coco.lan>
From:   Manu Abraham <abraham.manu@gmail.com>
Date:   Wed, 25 Aug 2021 21:46:23 +0530
Message-ID: <CAHFNz9L6W=zMjMZJRgtmiAwY9xHiM06Cp52GS0swy5awUoxpOQ@mail.gmail.com>
Subject: Re: [Regression 5.14] media: dvb userspace api
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Soeren Moch <smoch@web.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 25, 2021 at 12:03 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Wed, 25 Aug 2021 08:25:57 +0530
> Manu Abraham <abraham.manu@gmail.com> escreveu:
>
> > On Mon, Aug 23, 2021 at 10:30 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > I have reverted the header file move. But I would also heartily
> > > recommend that whatever user program includes those headers (VDR -
> > > anything else?) should take snapshots of these specific kernel
> > > headers.
> > >
> > > I'm not convinced that it makes sense to move the av7110 driver back
> > > from staging - it may continue to work, but it _is_ old and there is
> > > no maintenance - and I would certainly suggest that any other
> > > out-of-tree driver that uses these old interfaces that nothing else
> > > implements shouldn't do so, considering that nothing else implements
> > > them.
> >
> > Sorry for barging in between your discussion, but it seemed like you really
> > missed some perspective and hence.
> >
> > My 2 cents worth:
> > * Revert the header changes.
> >
> > * Let someone else with knowledge of it take over the maintenance
> > of the av7110 driver.
> >
> >   - This would allow other hardware also to be easily accommodated
> > in a similar manner.
> >
> > * Pull the out of tree drivers and allocate maintenance of those, to
> > someone who understands them. Don't you want more hardware to be
> > supported out of the box ?
> >
> > Should there be no driver for those DVB output hardware, but only for
> > V4L2 output devices ?
> >
> > There exists other hardware which As a person who worked on another
> > av7110 like driver (saa716x based s2 6400), which I can confirm.
> > The API is supposed to simplify life, not make it even more complex.
> > These devices would need lot of workarounds to work with the API that
> > which Mauro advocates, which might even break those drivers given
> > their complexity and size.
> >
> > It would make life a lot easier for the users, Mauro himself and
> > this long never ending discussion can be put to rest.
>
> The "full-featured" API that it is implemented on av7110 always had
> troubles. This is not only my view, but also the view of the
> original API authors,as can be seen at the DVBv4 WIP documentation:
>
>         https://www.linuxtv.org/downloads/legacy/linux-dvb-api-v4/linux-dvb-api-v4-0-3.pdf
>
> It clearly says that, on chapter 2.2:
>
>         "2.2 Linux DVB API Version 3 problems


That's very misleading ! In fact, the legacy V3 API was upgraded to 3.1 and 3.2
and those issues were ironed out. You are talking about V3 while V3.2
fixed those
issues. The V4 API documentation is legacy and was there even before the
V3.2 API existed. It was even upgraded to V5, skipping V4 !


>
>          The Linux DVB API Version 3 has very limited support for
>          modern hardware."
>
> The "modern" there refers to hardware back in 2005!


This is exactly what I wrote just above.


> I worked on a project back 8 years ago that tried to use it for TV
> sets. It didn't work, because the API assumed a 1:1 mapping between
> tuners and A/V codecs, which works for simpler embedded hardware,
> but didn't cover smart TV hardware, where the number of frontends,
> demods and A/V codecs were different. You may even have multiple
> channels being displayed at the same time (Picture in Picture).
>
> On today's embedded hardware, you need something like the media
> controller, in order to dynamically re-configure the hardware
> pipelines between:
>
>         - multiple tuners (DVB-C, DVB-T/T2, DVB-S/S2);
>         - multiple demods[1];
>         - multiple A/V decoders;
>         - display compositor;
>         - audio I/O;
>         - CA modules;
>         - encrypt/decrypt hardware (required on some Countries in order
>           to allow recording programs on storage);
>         - storage.


Multiple frontends, tuners/demods, CAM's were already supported
There is no encrypt/decrypt hardware, either you have hardware
CAM's or SoftCAM's, which do the decryption for DVB streams.
These already exist with the old API itself.
The S2 6400, KNC S2 Twin and most others do have multiple first
and second generation frontends.

The DVB demux provides multiple PID's, you can have multiple PiP's
whatever you want.

For some SoC's with A/V codecs what you are saying is true.
It does not make sense for PCTV hardware to use the pipelines
you apparently describe. Such SoC's make use the extended API that
you advocate, but the standard PCTV, or standard STB hardware
we all are used to need not use the convoluted API being advocated.
For those SoC's one may use the V4L2 output. But for DVB output
devices, it makes no sense but going many steps backwards to use
the V4L2 output.


> From driver's perspective, it makes no sense to keep support for av7110,
> as TI stopped production of TMS320AV7110 a very long time ago. They
> don't even mention this product number anymore on their website.
>

What I meant: If there are some users for some hardware, it is impolite
to rip them out, especially when someone is volunteering to maintain them.
Rather than impolite, that's quite rude and arrogant.

I believe that is the de facto Linux kernel principle still, unless
there is some
real reason to rip it out.

FWIW, my 2c worth:
a) leave the headers where they belong, already done by Linus.

b) av7110: hand over the maintenance to someone who is happy and has
time to fiddle around with

c) Pull in the saa716x driver. I wrote the saa716x driver with NXP support
and with additional help from the community. It would be good to maintain
the credits to the original developers though.

You can pull the saa716x driver from Soeren, if he needs some help,
I can chip in whatever possible way. Let him have some fun with the driver.

Mauro: Look, it's not good to convolute and pollute the discussion with stuff
that are not relevant. Please! Have a heart; Don't do this drama..
People will just hate you for eons, for no good reason !

Friendly Regards,
MA
