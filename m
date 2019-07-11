Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 099E965622
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 13:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728637AbfGKLv6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 07:51:58 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45655 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728467AbfGKLv6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 07:51:58 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so5923417wre.12
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2019 04:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zaPZMljsy0yHOYNSxl8b1F0ape91l7kBJLjuwmKXgmI=;
        b=Aiif3cHsIQa82TNkM6+QmA2sT/UV0vXJB3VpZ3SiLYILAUgMCE6vup2v+cQkbBrW4X
         +7OVHQrygLKcfbYD4fUbtkpqgjoDovY148WNymAAM9eFWkAv1ONTlh7eqkPKGRUksjR0
         yz99iql203lSG2L3GjZOZmKPc8WmZIVaREC3C4njbDvQ2+d742C1qb1QkUb3Kdxry3zh
         gEwMsypISvtbtOtvS2HUsan8yS8nt88FaCuE3JaZCdUNLaNGepZSVd0cgTPf5zgXIeOc
         IkLBpdIHozignBoKlXkrVtDFIHdqNJgR8OQZT2fnh7ON6+Bq2ag8RIy8bOOFMJZh0Cy5
         QYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zaPZMljsy0yHOYNSxl8b1F0ape91l7kBJLjuwmKXgmI=;
        b=pSsuo/7Z/uTmBDbzeFAsXvb5jY9VVbGOvKxwhQeRoSD+dSKUvVYnsF7DRPWjWUB1ud
         MEUH3QyVAgNM9lHBtZQUfP6302pK4E29Ky1cK5m0mcIlMEf1sEjwnT1anRFILsgvm4OQ
         FabdMXMQfw2daxGrMz7Z9/bGg4cz9TdB+0EoX335pOcDQT6JQYFVwAdwzstNFIOSkZN6
         i3mzXDH0hQuczTAYIDWnyVuQTeYD/mWh8bXMp/MqekFIIi6Idjpc3/ixKXy1xHS8lDsW
         IKiTmiuHejI/2yQMkFhtNlCIWvVi46K6HNsZMngWOmTsF8FiT0Mp2sivUSfYbjZAAUO8
         pxAA==
X-Gm-Message-State: APjAAAX6a/jcJrVPJRn9heZ8fwovyrt6D8jI99O1nHu5S/CWavy6gihY
        ypLhR+M5jpPriym4+5nqxahtMgcSybpk3bbLb9Y=
X-Google-Smtp-Source: APXvYqzHp1XIhXFwrZpWMZYWiDsRoYpJyEkt62oR5QgGqWOqw+oHaeq2KL0tMyV+KumP8bmwMGJjYa0aM9KL2js9BjM=
X-Received: by 2002:a5d:5152:: with SMTP id u18mr4985650wrt.9.1562845917142;
 Thu, 11 Jul 2019 04:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAGb2v65AHjF4oNBixiEb=yqHF_gZyz91K_65U7kUAPGd6_cOkg@mail.gmail.com>
 <20190711093842.GB15882@aptenodytes>
In-Reply-To: <20190711093842.GB15882@aptenodytes>
From:   wens Tsai <wens213@gmail.com>
Date:   Thu, 11 Jul 2019 19:51:45 +0800
Message-ID: <CAGb2v67sq16Btmk_bFFUjV7tuish+Q3uOVvcOiqOtT6TwrV+WA@mail.gmail.com>
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

On Thu, Jul 11, 2019 at 5:39 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi,
>
> On Thu 11 Jul 19, 17:21, wens Tsai wrote:
> > I noticed that recent codec driver additions, such as hantro, meson/vdec,
> > mtk, used the multi-planar API (mplane) instead of the single-planar API.
> >
> > Is there a preference for moving towards mplane?
>
> Well, there is strict technical requirement for using the single-planar API
> instead of the multi-planar one in cedrus.
>
> Historically, we started with mplane because we can definitely pass
> different addresses for luma and chroma to our decoder. However, we found
> out that there are some internal limitations of the decoder block and the
> addresses cannot be "too far apart". This means that if we allocate luma
> at the begging of our pool and chroma at the end, the gap was too big
> and the resulting decoded frame was not stored at the right address.
>
> We found out about this purely by accident, where one particular sequence of
> events lead to such a gap and showed the issue. One possible explanation
> would be that the decoder uses an offset from the luma address for chroma
> internally, on a limited number of bits.
>
> So unfortunately, this means we're stuck with having our multi-planar
> (in the YUV sense) buffers allocated in a single chunk (the single-plane
> V4L2 API). I don't have any better answer than "userspace should cope with both
> APIs as it reflects a hardware constraint", which is indeed what ffmpeg is
> already doing.

If I understand the API correctly, using the multi-planar API doesn't mean
you have to actually support multi-planar formats such as NVxyM and YUVxyzM.
AFAICT these are the only two families that have non contiguous planes.

So for all the other existing formats, the buffers will still be contiguous,
which means cedrus can actually support the multi-planar API, right?

ChenYu

> Cheers,
>
> Paul
>
> > Also I noticed that v4l-utils has a plugin that seamlessly adapts mplane
> > devices to work with single-planar API calls, but there isn't one the
> > other way around. Would that be something worthwhile working on? To me
> > it seems having one central adapter is better than having applications
> > try to use both APIs, though some such as FFmpeg already do so.
> >
> > My interest in this is trying to get Chromium's v4l2 video decode
> > accelerator to work on the Raspberry Pi 3 with their downstream kernel,
> > which has the bcm2835-v4l2 driver. It would also benefit other platforms
> > that have a stateful VPU, such as Amlogic (meson) or Mediatek SoCs.
> > Chromium's code uses MPLANE exclusively, and it's geared towards ChromeOS,
> > not standard Linux, but still it might be interesting to get it to work.
> >
> > There's also the v4l2 slice video decode accelerator which uses the
> > request API which has the same issue, but lets not get ahead of ourselves.
> >
> > Regards
> > ChenYu
>
> --
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
