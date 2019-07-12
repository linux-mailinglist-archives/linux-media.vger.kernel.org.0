Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9977B665C0
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 06:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729418AbfGLE0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 00:26:50 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53143 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbfGLE0u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 00:26:50 -0400
Received: by mail-wm1-f66.google.com with SMTP id s3so7551332wms.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2019 21:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DTB2LX1XBzZAeFTixgHALe4R5+d00X2SsWL0x3WblzA=;
        b=Aihpq+40Hdl050BhtvPbandfe0rz9w6XxQxqAQlNpsi9j1EMxr6WQXWn9AK27kLMTT
         o67Sj7+ndTROVsRjr/UtNq7VJiiPRlcw/Lg/5bhVvWzKRzduApPwNw3nx0yMY3eZ8w2T
         ilSqyI80b4xgARaqHG/jn9g0FpgunuURJTqB7kNvZpyUPxJiEdWrLrSNt8h4NJeyPDMk
         qNq90x4tRNLOewriORjYF045h9h76QldnINkBLImqTiRbioyDeigVsNmGGO+TjuJ0YQX
         Gfv6XKfftuzqiI0BZy7lyD+JCl4cstryE/Qnve9OVC0z/SG6zO+/yd7JwajH5ZBPwuh9
         sM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DTB2LX1XBzZAeFTixgHALe4R5+d00X2SsWL0x3WblzA=;
        b=RaliemSIIUomOUjuTjtIegU+8nYoOsY2BXnwnI8ZA899MRlPGbguzKn0SY86melNNI
         5e47fX2trZjH7MqNRIXP/rdrI/rhZpbniwTkgVtgop6Zc2rPsli774fQ8M02VF9rMSnS
         Bj/co4vdOGZDQYwHiQi5j6L2rviY2AghVQ7Uwl8u0zf1KgwBXYB/AzWMHscdzLQ3k/GZ
         Ob6PwxgfgjleU3dM0RYvTn+OjJ7TyuBH2t/Ux4B7Op+nm//51E51NwpAzoO0LButZId8
         Ox77i9NABXLi4H8wpzIVuXisx6NqFNIZUMiJWYZiXuFE80EpKxYI3Xi4svKNLmk7dwaI
         FW/Q==
X-Gm-Message-State: APjAAAUDVKRPTZNZ+oPIrEE4fNSEvd1QTKQTV4qN4fn11xI9hhWfhR0G
        zuJRvk++10cN1/sUp37ZSyTqSXqQQ1rKWD7r8tQ=
X-Google-Smtp-Source: APXvYqyQ+kBQvq7o+L2E34QoAx5cpbhF5oq9GVt1AmQ1QULGtXtd5m+qOUfJz6wBBIOJY644CJ4IBWIBvGq7mPrmYJ4=
X-Received: by 2002:a7b:c051:: with SMTP id u17mr6975792wmc.25.1562905607453;
 Thu, 11 Jul 2019 21:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAGb2v65AHjF4oNBixiEb=yqHF_gZyz91K_65U7kUAPGd6_cOkg@mail.gmail.com>
 <20190711093842.GB15882@aptenodytes> <CAGb2v67sq16Btmk_bFFUjV7tuish+Q3uOVvcOiqOtT6TwrV+WA@mail.gmail.com>
 <20190711121909.GD15882@aptenodytes>
In-Reply-To: <20190711121909.GD15882@aptenodytes>
From:   wens Tsai <wens213@gmail.com>
Date:   Fri, 12 Jul 2019 12:26:34 +0800
Message-ID: <CAGb2v65GqitdW82MKN-U-Gr_YNYj99zbJLZMwFrvMQ2t8hTPvQ@mail.gmail.com>
Subject: Re: Single- vs Multi-planar APIs for mem2mem devices
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 11, 2019 at 8:19 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> On Thu 11 Jul 19, 19:51, wens Tsai wrote:
> > On Thu, Jul 11, 2019 at 5:39 PM Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> > >
> > > Hi,
> > >
> > > On Thu 11 Jul 19, 17:21, wens Tsai wrote:
> > > > I noticed that recent codec driver additions, such as hantro, meson/vdec,
> > > > mtk, used the multi-planar API (mplane) instead of the single-planar API.
> > > >
> > > > Is there a preference for moving towards mplane?
> > >
> > > Well, there is strict technical requirement for using the single-planar API
> > > instead of the multi-planar one in cedrus.
> > >
> > > Historically, we started with mplane because we can definitely pass
> > > different addresses for luma and chroma to our decoder. However, we found
> > > out that there are some internal limitations of the decoder block and the
> > > addresses cannot be "too far apart". This means that if we allocate luma
> > > at the begging of our pool and chroma at the end, the gap was too big
> > > and the resulting decoded frame was not stored at the right address.
> > >
> > > We found out about this purely by accident, where one particular sequence of
> > > events lead to such a gap and showed the issue. One possible explanation
> > > would be that the decoder uses an offset from the luma address for chroma
> > > internally, on a limited number of bits.
> > >
> > > So unfortunately, this means we're stuck with having our multi-planar
> > > (in the YUV sense) buffers allocated in a single chunk (the single-plane
> > > V4L2 API). I don't have any better answer than "userspace should cope with both
> > > APIs as it reflects a hardware constraint", which is indeed what ffmpeg is
> > > already doing.
> >
> > If I understand the API correctly, using the multi-planar API doesn't mean
> > you have to actually support multi-planar formats such as NVxyM and YUVxyzM.
> > AFAICT these are the only two families that have non contiguous planes.
>
> That is indeed quite right and maybe switching away from mplane was unnecessary.
> In practice, we can only use single-planar (non-M formats) but we could totally
> support the mplane semantics for these formats as well.
>
> What I was thinking probably boiled down to the idea that without mplane
> supported, userspace wouldn't be able to allocate multiple planes and then
> try to use them with a single-planar format. I think this is what I had
> implemented before and something that "worked" although being totally wrong
> regarding the API. It looks like the core doesn't check that single-planar
> formats are only given one plane by userspace and, as long as the driver goes
> with it, it can still operate like this. Could be nice to have this kind of
> checking around.
>
> So in the end, it looks like we can safely bring back mplane support :)

This brings me to another question: is there anything (policy or technical)
preventing us from supporting both APIs? I haven't seen any drivers do this,
and with the compatibility plugin in libv4l2, I suppose it isn't necessary.

ChenYu

> > So for all the other existing formats, the buffers will still be contiguous,
> > which means cedrus can actually support the multi-planar API, right?
>
> Thinking twice about it, I think you're right yes.
>
> Cheers,
>
> Paul
>
> > ChenYu
> >
> > > Cheers,
> > >
> > > Paul
> > >
> > > > Also I noticed that v4l-utils has a plugin that seamlessly adapts mplane
> > > > devices to work with single-planar API calls, but there isn't one the
> > > > other way around. Would that be something worthwhile working on? To me
> > > > it seems having one central adapter is better than having applications
> > > > try to use both APIs, though some such as FFmpeg already do so.
> > > >
> > > > My interest in this is trying to get Chromium's v4l2 video decode
> > > > accelerator to work on the Raspberry Pi 3 with their downstream kernel,
> > > > which has the bcm2835-v4l2 driver. It would also benefit other platforms
> > > > that have a stateful VPU, such as Amlogic (meson) or Mediatek SoCs.
> > > > Chromium's code uses MPLANE exclusively, and it's geared towards ChromeOS,
> > > > not standard Linux, but still it might be interesting to get it to work.
> > > >
> > > > There's also the v4l2 slice video decode accelerator which uses the
> > > > request API which has the same issue, but lets not get ahead of ourselves.
> > > >
> > > > Regards
> > > > ChenYu
> > >
> > > --
> > > Paul Kocialkowski, Bootlin
> > > Embedded Linux and kernel engineering
> > > https://bootlin.com
>
> --
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
