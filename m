Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 448A466A99
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 12:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbfGLKEY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 06:04:24 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34828 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfGLKEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 06:04:24 -0400
Received: by mail-wm1-f66.google.com with SMTP id l2so8384089wmg.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jul 2019 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aceP9kjyXm7x6EkIi94z9JjrrELig2Itw99t0CcBiFc=;
        b=siw08+NSiQ0rthjmqt/zmWdloCEliwl4BBDTkNRHhv9fxfAdLo2HN+wZcXHaSwdB9H
         8CXqLC5681o6tsfGAtP4zKvOjnVdZh9RtI7Vy5fJaiUSfhHy7RkRYr7dU+DbG9P0+UHa
         4yG3C10GFkKEDcf1cwPiRVpRcdMHoI0VpO0oewfBYnYQ2cvaATO5G+NHO30ykEVZrBuQ
         kYA6CzuLQOwSIN2+1Ft7t9TScxMkGmEChZllVZilLcupK1m2WRIqO3lCWgFYcKueATXJ
         Sj5TbXeVzSUvsNOfyhq4jOguOBOmu3ZAabcZY/s6DBuOQD124RHfpu5tgrkxvbjS9qWp
         xkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aceP9kjyXm7x6EkIi94z9JjrrELig2Itw99t0CcBiFc=;
        b=rfwuUm/6ALZQ018hq/0muMpijFUPkY6DYP3hL249QnLch6UDu74tXfGnHQKwepx4Hg
         TjygGf+Pby1U8RfW0ZQFZirH5Du9Hly0hV5zxNzSMlXQVw+o8QExGu5jzyVpszEh6dQk
         qIiESQS6YXV1pUDLBBMtx7LJAFiUpfsxUeFtXKEeVir6xT50EfcwICNn1YpbCdBympsd
         vwv3hRi72/vYtkkLYxrSlhhtKdFdnCyhinGbEXZ8LiG8kFJRPmmq6RmKpW9slzdtbOqH
         Io90nYen+i0MZnhsmCrhGePQG23B9hM7V7BzRali4w9WAVYLdfUcmMV+zuZEQmJN184d
         7O4g==
X-Gm-Message-State: APjAAAUDZ4r2TXk92TsNBwQUO//yFGLYOCZtL26DG/RXcEjWcFRJXfrM
        9cyQX/ApYeOX4pgALLUTM1bZcRWNPrfqGVAlPWI=
X-Google-Smtp-Source: APXvYqxv5ZK3q+Ho609Z7L6t2pdwTgmRAFZR7b0aXQkyr4OhuApd/oEVm5NDw8m32sjM2MghzD8sWt8yWb8WUeHxGrg=
X-Received: by 2002:a05:600c:21d4:: with SMTP id x20mr8285998wmj.61.1562925860938;
 Fri, 12 Jul 2019 03:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAGb2v65AHjF4oNBixiEb=yqHF_gZyz91K_65U7kUAPGd6_cOkg@mail.gmail.com>
 <20190711093842.GB15882@aptenodytes> <CAGb2v67sq16Btmk_bFFUjV7tuish+Q3uOVvcOiqOtT6TwrV+WA@mail.gmail.com>
 <20190711121909.GD15882@aptenodytes> <CAGb2v65GqitdW82MKN-U-Gr_YNYj99zbJLZMwFrvMQ2t8hTPvQ@mail.gmail.com>
 <20190712093705.GH15882@aptenodytes>
In-Reply-To: <20190712093705.GH15882@aptenodytes>
From:   wens Tsai <wens213@gmail.com>
Date:   Fri, 12 Jul 2019 18:04:06 +0800
Message-ID: <CAGb2v66qCGzzavNrLgvjzYh1fkkMFiFD1Cx9mTAV87eHyfX_JA@mail.gmail.com>
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

On Fri, Jul 12, 2019 at 5:37 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi,
>
> On Fri 12 Jul 19, 12:26, wens Tsai wrote:
> > On Thu, Jul 11, 2019 at 8:19 PM Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> > >
> > > On Thu 11 Jul 19, 19:51, wens Tsai wrote:
> > > > On Thu, Jul 11, 2019 at 5:39 PM Paul Kocialkowski
> > > > <paul.kocialkowski@bootlin.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Thu 11 Jul 19, 17:21, wens Tsai wrote:
> > > > > > I noticed that recent codec driver additions, such as hantro, meson/vdec,
> > > > > > mtk, used the multi-planar API (mplane) instead of the single-planar API.
> > > > > >
> > > > > > Is there a preference for moving towards mplane?
> > > > >
> > > > > Well, there is strict technical requirement for using the single-planar API
> > > > > instead of the multi-planar one in cedrus.
> > > > >
> > > > > Historically, we started with mplane because we can definitely pass
> > > > > different addresses for luma and chroma to our decoder. However, we found
> > > > > out that there are some internal limitations of the decoder block and the
> > > > > addresses cannot be "too far apart". This means that if we allocate luma
> > > > > at the begging of our pool and chroma at the end, the gap was too big
> > > > > and the resulting decoded frame was not stored at the right address.
> > > > >
> > > > > We found out about this purely by accident, where one particular sequence of
> > > > > events lead to such a gap and showed the issue. One possible explanation
> > > > > would be that the decoder uses an offset from the luma address for chroma
> > > > > internally, on a limited number of bits.
> > > > >
> > > > > So unfortunately, this means we're stuck with having our multi-planar
> > > > > (in the YUV sense) buffers allocated in a single chunk (the single-plane
> > > > > V4L2 API). I don't have any better answer than "userspace should cope with both
> > > > > APIs as it reflects a hardware constraint", which is indeed what ffmpeg is
> > > > > already doing.
> > > >
> > > > If I understand the API correctly, using the multi-planar API doesn't mean
> > > > you have to actually support multi-planar formats such as NVxyM and YUVxyzM.
> > > > AFAICT these are the only two families that have non contiguous planes.
> > >
> > > That is indeed quite right and maybe switching away from mplane was unnecessary.
> > > In practice, we can only use single-planar (non-M formats) but we could totally
> > > support the mplane semantics for these formats as well.
> > >
> > > What I was thinking probably boiled down to the idea that without mplane
> > > supported, userspace wouldn't be able to allocate multiple planes and then
> > > try to use them with a single-planar format. I think this is what I had
> > > implemented before and something that "worked" although being totally wrong
> > > regarding the API. It looks like the core doesn't check that single-planar
> > > formats are only given one plane by userspace and, as long as the driver goes
> > > with it, it can still operate like this. Could be nice to have this kind of
> > > checking around.
> > >
> > > So in the end, it looks like we can safely bring back mplane support :)
> >
> > This brings me to another question: is there anything (policy or technical)
> > preventing us from supporting both APIs? I haven't seen any drivers do this,
> > and with the compatibility plugin in libv4l2, I suppose it isn't necessary.
>
> So according to Hans, this makes drivers particuarly more complex to write,
> so we might want to fully switch over to mplane for the time being.

For cedrus it doesn't seem to be particularly hard, given the hardware can only
do single-planar style actions. The complexity is only in translating between
"struct v4l2_pix_format" and "struct v4l2_pix_format_mplane".

> I'm not sure there are common cases where that would really be beneficial, and
> as you said, it's probably not necessary.

I started adding some code to cedrus to cover both. When I'm done I'll remove
the old single-planar bits. That way I have some idea about what needs to be
done for other drivers, such as bcm2835_codec, which was my original goal.
We can also see if it's actually complicated or not.

ChenYu

> Paul
>
> > ChenYu
> >
> > > > So for all the other existing formats, the buffers will still be contiguous,
> > > > which means cedrus can actually support the multi-planar API, right?
> > >
> > > Thinking twice about it, I think you're right yes.
> > >
> > > Cheers,
> > >
> > > Paul
> > >
> > > > ChenYu
> > > >
> > > > > Cheers,
> > > > >
> > > > > Paul
> > > > >
> > > > > > Also I noticed that v4l-utils has a plugin that seamlessly adapts mplane
> > > > > > devices to work with single-planar API calls, but there isn't one the
> > > > > > other way around. Would that be something worthwhile working on? To me
> > > > > > it seems having one central adapter is better than having applications
> > > > > > try to use both APIs, though some such as FFmpeg already do so.
> > > > > >
> > > > > > My interest in this is trying to get Chromium's v4l2 video decode
> > > > > > accelerator to work on the Raspberry Pi 3 with their downstream kernel,
> > > > > > which has the bcm2835-v4l2 driver. It would also benefit other platforms
> > > > > > that have a stateful VPU, such as Amlogic (meson) or Mediatek SoCs.
> > > > > > Chromium's code uses MPLANE exclusively, and it's geared towards ChromeOS,
> > > > > > not standard Linux, but still it might be interesting to get it to work.
> > > > > >
> > > > > > There's also the v4l2 slice video decode accelerator which uses the
> > > > > > request API which has the same issue, but lets not get ahead of ourselves.
> > > > > >
> > > > > > Regards
> > > > > > ChenYu
> > > > >
> > > > > --
> > > > > Paul Kocialkowski, Bootlin
> > > > > Embedded Linux and kernel engineering
> > > > > https://bootlin.com
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
