Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36DD3158920
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2020 05:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgBKEQI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 23:16:08 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:35020 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgBKEQI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 23:16:08 -0500
Received: by mail-qt1-f194.google.com with SMTP id n17so7016913qtv.2
        for <linux-media@vger.kernel.org>; Mon, 10 Feb 2020 20:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=g4UVj/3nD2GCgjBJx7udq7R9Zkro+Ee2Fk3ZRlrxre8=;
        b=l8gxy+0JA+Xx2/R031Bg2Xr2vnVqWMmud62gvKIfCNjIX0JLF8fUCRK4N2L9kvaph+
         GqtW26faddXhkJZPzSQgLiFSXDhPcIFfWPOGVp18yHSqJN6kM+tuot7i1BNHrtz4/OH3
         +ACu+Rf9OtWiTZ9TbSPGkI2iw915DRF8RykbIsZJncFnGL9mLESkWDU1mRJ8/r8xiSY9
         TRejrsuhm7OqNuJFEqHkT1Et3PF46N7f8n5CYM7dm87qiesBvdBHC82MCjyL0D3IqgvT
         /0VKrDtrCNOyi8d2XazeUHqWVymN4NCJSZwE23g6AOcvUMI553vCYy4Y34/h8PzI7U/X
         t3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=g4UVj/3nD2GCgjBJx7udq7R9Zkro+Ee2Fk3ZRlrxre8=;
        b=KsjEDDoYZ5xtyz2yaphN5S/Xbz+sE5sNFfA5z3vXXGq46zYuFutVbB6VNzXrT4p2gS
         jZybBomD0oOwysIcLK3IX0HZTOuqzm6/jz749GCMgQ/DND5W9rzc7mO5Y2496/p28EvT
         wnyFLzyQ1Art+UQdjOUTFgQp3KCJCHtYmqZq9dHJDffnw5jSCF32qR1HUEs8egrqqcei
         d5GZmEA6U0879NldgvBd5WiUZ/aBBsYUSIMv2EsOhxYgHFtmcAmtfr0Mh4tKs/cIE0wZ
         pESZWHnJe2/zuIlsE7JU/CA6dV4qNt9bagirsVkrZEzF9XYvtm2RUASUE+UM/6CJSTId
         F+YQ==
X-Gm-Message-State: APjAAAXll7idoAgos1vat5hIW/LFF5azeY0e/z4DQhUE7nv77rFG7Mg/
        2YnryO/iVtrXuzaTLXYe+KPIog==
X-Google-Smtp-Source: APXvYqzSJD0QeVzM2toPT/R0emZr7QFOvMD5d26xgde3TYvFx+VuGCFgzV0tXAzgQH1m/0XzzcUN5g==
X-Received: by 2002:ac8:2bf9:: with SMTP id n54mr12959664qtn.280.1581394567220;
        Mon, 10 Feb 2020 20:16:07 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id r5sm1358287qtn.25.2020.02.10.20.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 20:16:06 -0800 (PST)
Message-ID: <f3b8c40fa84f9819959bf60cc9a1f4951bcda36a.camel@ndufresne.ca>
Subject: Re: [PATCH v3 0/3] Enable Hantro G1 post-processor
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 10 Feb 2020 23:16:05 -0500
In-Reply-To: <CAAFQd5A8Y3C64NozqXjMDV0CQ5==dW9Y-6KtFigYFmO3EDd3+A@mail.gmail.com>
References: <20191113175603.24742-1-ezequiel@collabora.com>
         <74fea061a52ee3f8e25793bf9e47eba90a52c3e3.camel@ndufresne.ca>
         <CAAFQd5A8Y3C64NozqXjMDV0CQ5==dW9Y-6KtFigYFmO3EDd3+A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 10 février 2020 à 11:45 +0900, Tomasz Figa a écrit :
> On Mon, Feb 10, 2020 at 4:52 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > Le mercredi 13 novembre 2019 à 14:56 -0300, Ezequiel Garcia a écrit :
> > > Hi all,
> > > 
> > > The Hantro G1 VPU post-processor block can be pipelined with
> > > the decoder hardware, allowing to perform operations such as
> > > color conversion, scaling, rotation, cropping, among others.
> > > 
> > > When the post-processor is enabled, the decoder hardware
> > > needs its own set of NV12 buffers (the native decoder format),
> > > and the post-processor is the owner of the CAPTURE buffers,
> > > allocated for the post-processed format.
> > > 
> > > This way, applications obtain post-processed
> > > (scaled, converted, etc) buffers transparently.
> > > 
> > > This feature is implemented by exposing the post-processed pixel
> > > formats on ENUM_FMT, ordered as "preferred pixelformat first":
> > > 
> > > v4l2-ctl -d 1 --list-formats
> > > ioctl: VIDIOC_ENUM_FMT
> > >       Type: Video Capture Multiplanar
> > > 
> > >       [0]: 'NV12' (Y/CbCr 4:2:0)
> > >       [1]: 'YUYV' (YUYV 4:2:2)
> > > 
> > > The order of preference in ENUM_FMT can be used as a hint
> > > by applications. This series updates the uAPI specification
> > > accordingly.
> > 
> > As I'm implementing this, I realize that there may me a gap in being
> > able to implement both IPP and non-IPP support in a generic framework.
> > Unlike the above comment, we for non-IPP decoder we cannot naively pick
> > the first format. In fact we parse the chroma and depth information
> > from the headers (like pps from H264), and we pick a matching pixel
> > format. This way, if we have a 10bit stream, and our IP supports 10bit,
> > we will pick a 10bit pixel formats, otherwise decoding will just fail.
> > 
> > None of this information is passed to the driver prior to the first
> > Request being made, so there is no way (as of current spec) that the
> > driver can validate this in try_fmt ahead of time. Unless I set picture
> > parameters without a request_fd for that purpose. If this is the way,
> > then we should document this.
> 
> +Alexandre Courbot
> 
> It was suggested in the very early RFC stage, but it looks like it
> didn't make it to the final spec.
> https://patchwork.kernel.org/patch/10583233/#22209555

Ok, maybe we should revive it, it would fill that gap. Again, only an
issue if you have a post processor. I'm still surprised we didn't
expose the IPP functions through the topology, it would make so much
sense to me, and I can make better code with that knowledge.

I found while coding this, that even if it's more difficult,
classification of device by looking at the topology and the entity
functions is much nicer, less of a guess.

Though, we lack some documentation (or clarification) for how to
properly handle formats, size and selection in order to configure the
IPP. Ezequiel was saying that we don't implement selection in Hanto, so
I guess the scaling is a bit ambiguous then in regard to coded/display
sizes. Though we pass a size to the OUTPUT side, so the driver can
always control a little bit.

> 
> > Is this the intended way to negotiation IPP functions with the driver ?
> > 
> 
> In theory, if the userspace knows whether the stream is 4:2:0 or 4:2:2
> and 8-bit or 10-bit, it can still select the first format from the top
> that matches these properties.

That's exactly what I do, I have a map of the formats and their
chroma/depth, and take the first one that match. If that fails, I just
fallback to the first one. It's something you need to do anyway, as we
prefer the native format first (even if there is an IPP).

> 
> That's not how format handling in V4L2 works, though. ENUM_FMT is
> expected to return a list of valid formats and if we forget about the
> image processor for a moment, a stateless decoder would always return
> any possible format, including ones invalid for the stream.
> 
> Now back to the image processor, if it handles conversions from any to
> any format listed by ENUM_FMT, we kind of regain the V4L2 compliance,
> but if the conversions are limited, the above requirement still
> doesn't hold and we're not implementing V4L2 correctly.
> 
> Perhaps we can still amend the spec and require controls that
> determine the stream properties to be set before starting the
> streaming? I can imagine it could also help the driver filter out some
> unsupported streams early, before allocating buffers and attempting to
> decode.

I think it would make sense, so just to make sure, for H264 we could
set the V4L2_CID_MPEG_VIDEO_H264_SPS along with the OUTPUT format,
prior to CAPTURE enumeration.

> 
> Best regards,
> Tomasz
> 
> > > When the application sets a pixel format other than NV12,
> > > the post-processor is transparently enabled.
> > > 
> > > Patch 1 is a cleanups needed to easier integrate the post-processor.
> > > Patch 2 introduces the post-processing support.
> > > Patch 3 updates the uAPI specification.
> > > 
> > > This is tested on RK3288 platforms with MPEG-2, VP8 and
> > > H264 streams, decoding to YUY2 surfaces. For now, this series
> > > is only adding support for NV12-to-YUY2 conversion.
> > > 
> > > Applies to media/master.
> > > 
> > > Future plans
> > > ------------
> > > 
> > > It seems to me that we should start moving this driver to use
> > > regmap-based access to registers. However, such move is out of scope
> > > and not entirely related to this post-processor enablement.
> > > 
> > > We'll work on that as follow-up patches.
> > > 
> > > Changelog
> > > ---------
> > > 
> > > Changes v3:
> > > 
> > > * After discussing with Hans and Tomasz during the media summit
> > > in ELCE, we decided to go back on the MC changes. The MC topology
> > > is now untouched. This means the series is now similar to v1,
> > > except we explicitly use the ENUM_FMT to hint about the post-processed
> > > formats.
> > > 
> > > Changes v2:
> > > 
> > > * The decoder->post-processor topology is now exposed
> > >   explicitly and applications need to configure the pipeline.
> > >   By default, the decoder is enabled and the post-processor
> > >   is disabled.
> > > 
> > > * RGB post-processing output has been dropped. We might
> > >   add this in the future, but for now, it seems it would
> > >   make the code more complex without a use-case in mind.
> > >   RGB is much more memory-consuming so less attractive
> > >   than YUV, and modern GPUs and display controllers support YUV.
> > > 
> > > * The post-processor implementation still supports RK3288
> > >   only. However, a generic register infrastructure is introduced
> > >   to make addition of other variants such as RK3399 really easy.
> > > 
> > > Ezequiel Garcia (3):
> > >   media: hantro: Cleanup format negotiation helpers
> > >   media: hantro: Support color conversion via post-processing
> > >   media: vidioc-enum-fmt.rst: clarify format preference
> > > 
> > >  .../media/uapi/v4l/vidioc-enum-fmt.rst        |   4 +-
> > >  drivers/staging/media/hantro/Makefile         |   1 +
> > >  drivers/staging/media/hantro/hantro.h         |  64 +++++++-
> > >  drivers/staging/media/hantro/hantro_drv.c     |   8 +-
> > >  .../staging/media/hantro/hantro_g1_h264_dec.c |   2 +-
> > >  .../media/hantro/hantro_g1_mpeg2_dec.c        |   2 +-
> > >  drivers/staging/media/hantro/hantro_g1_regs.h |  53 +++++++
> > >  .../staging/media/hantro/hantro_g1_vp8_dec.c  |   2 +-
> > >  drivers/staging/media/hantro/hantro_h264.c    |   6 +-
> > >  drivers/staging/media/hantro/hantro_hw.h      |  13 ++
> > >  .../staging/media/hantro/hantro_postproc.c    | 141 ++++++++++++++++++
> > >  drivers/staging/media/hantro/hantro_v4l2.c    | 105 ++++++++-----
> > >  drivers/staging/media/hantro/rk3288_vpu_hw.c  |  10 ++
> > >  13 files changed, 366 insertions(+), 45 deletions(-)
> > >  create mode 100644 drivers/staging/media/hantro/hantro_postproc.c
> > > 

