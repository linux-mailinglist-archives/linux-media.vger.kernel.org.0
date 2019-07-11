Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3BEC653F2
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 11:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbfGKJjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 05:39:53 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:34525 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfGKJjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 05:39:52 -0400
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0C59A240013;
        Thu, 11 Jul 2019 09:38:42 +0000 (UTC)
Date:   Thu, 11 Jul 2019 11:38:42 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     wens Tsai <wens213@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: Single- vs Multi-planar APIs for mem2mem devices
Message-ID: <20190711093842.GB15882@aptenodytes>
References: <CAGb2v65AHjF4oNBixiEb=yqHF_gZyz91K_65U7kUAPGd6_cOkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGb2v65AHjF4oNBixiEb=yqHF_gZyz91K_65U7kUAPGd6_cOkg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu 11 Jul 19, 17:21, wens Tsai wrote:
> I noticed that recent codec driver additions, such as hantro, meson/vdec,
> mtk, used the multi-planar API (mplane) instead of the single-planar API.
> 
> Is there a preference for moving towards mplane?

Well, there is strict technical requirement for using the single-planar API
instead of the multi-planar one in cedrus.

Historically, we started with mplane because we can definitely pass
different addresses for luma and chroma to our decoder. However, we found
out that there are some internal limitations of the decoder block and the
addresses cannot be "too far apart". This means that if we allocate luma
at the begging of our pool and chroma at the end, the gap was too big
and the resulting decoded frame was not stored at the right address.

We found out about this purely by accident, where one particular sequence of
events lead to such a gap and showed the issue. One possible explanation
would be that the decoder uses an offset from the luma address for chroma
internally, on a limited number of bits.

So unfortunately, this means we're stuck with having our multi-planar
(in the YUV sense) buffers allocated in a single chunk (the single-plane
V4L2 API). I don't have any better answer than "userspace should cope with both
APIs as it reflects a hardware constraint", which is indeed what ffmpeg is
already doing.

Cheers,

Paul

> Also I noticed that v4l-utils has a plugin that seamlessly adapts mplane
> devices to work with single-planar API calls, but there isn't one the
> other way around. Would that be something worthwhile working on? To me
> it seems having one central adapter is better than having applications
> try to use both APIs, though some such as FFmpeg already do so.
> 
> My interest in this is trying to get Chromium's v4l2 video decode
> accelerator to work on the Raspberry Pi 3 with their downstream kernel,
> which has the bcm2835-v4l2 driver. It would also benefit other platforms
> that have a stateful VPU, such as Amlogic (meson) or Mediatek SoCs.
> Chromium's code uses MPLANE exclusively, and it's geared towards ChromeOS,
> not standard Linux, but still it might be interesting to get it to work.
> 
> There's also the v4l2 slice video decode accelerator which uses the
> request API which has the same issue, but lets not get ahead of ourselves.
> 
> Regards
> ChenYu

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
