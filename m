Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5891E15A180
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2020 08:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbgBLHG5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Feb 2020 02:06:57 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38795 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728150AbgBLHG4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Feb 2020 02:06:56 -0500
Received: by mail-ed1-f66.google.com with SMTP id p23so1221464edr.5
        for <linux-media@vger.kernel.org>; Tue, 11 Feb 2020 23:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Jyp5J6Yi8UkViAkO3zi7FOXW2Dgfq+v82uuZR77CqB4=;
        b=CRcKsycznaUhIDbgGpRvD2s72Dcl8L9XbifFyHhaOgR7b1NppGDuVeZOY5q3PO5A0g
         sAU6ptGuxzGsEiGDwLJQP+Ie/ZNjEP7t6NUd8nS5hLbpAGb6tLOimB/5VPV9xGG+OGV6
         CpMJmv87OqR3Teg98MWgg+KL05UJeC549zdRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Jyp5J6Yi8UkViAkO3zi7FOXW2Dgfq+v82uuZR77CqB4=;
        b=GzMfrLbE/PzCEIUiGp5rkZuiVSOU9+nYCB74rA4PmoMwKGvEKS1Hp6Ne/g/0Q1ShXh
         C7USNfvOCTsh4dhaLkdgS8FAlEYjgsnbycG4T61o/jtbgXzRF7StuO2/2NiwE1nqRdEI
         wSRlHyb8F83sGmQ7x8EiGBgFC94ELDDPVLjSZczJMrSha4Sq5zSWppydQvjsEaxkHEtq
         q3rxYgbnvJRXxzzFK4PETrmIcffGx9hdRfFsjBdvudTTeigOEWaFlzI934fNUX62lXeT
         QMf4t4g+Z4JWsEVIFnzkXbbS/bHyYoZ5P5qqILVoUFG7a+3c4NsAJt+fDuyNpaWFA9va
         M0RA==
X-Gm-Message-State: APjAAAVzBgh4UZkBGdItw1LeuArY45gyf66pGCStrYDQvbmJEwPwBubg
        8i3CNRIq4XyyQ2iCmDkyUiWSKIPMzGnsrA==
X-Google-Smtp-Source: APXvYqyrXarxe0P7V9NoaneANg65jHWi8iaqsdkDs7JCGNj5+jjPuq94tEsv9ziXUqFxzmJIoNSYkg==
X-Received: by 2002:a17:906:1157:: with SMTP id i23mr9655621eja.3.1581491213549;
        Tue, 11 Feb 2020 23:06:53 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id yh21sm556232ejb.62.2020.02.11.23.06.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2020 23:06:52 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id c9so811173wrw.8
        for <linux-media@vger.kernel.org>; Tue, 11 Feb 2020 23:06:51 -0800 (PST)
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr13131267wrp.17.1581491211115;
 Tue, 11 Feb 2020 23:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20191113175603.24742-1-ezequiel@collabora.com>
 <74fea061a52ee3f8e25793bf9e47eba90a52c3e3.camel@ndufresne.ca>
 <CAAFQd5A8Y3C64NozqXjMDV0CQ5==dW9Y-6KtFigYFmO3EDd3+A@mail.gmail.com>
 <f3b8c40fa84f9819959bf60cc9a1f4951bcda36a.camel@ndufresne.ca> <9655c8b0cf58c93e26159503120f37890731f313.camel@ndufresne.ca>
In-Reply-To: <9655c8b0cf58c93e26159503120f37890731f313.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 12 Feb 2020 16:06:39 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dh0SxrXjF2co16OYR_u_EekQ+0cad=waXOzWVFsv91mQ@mail.gmail.com>
Message-ID: <CAAFQd5Dh0SxrXjF2co16OYR_u_EekQ+0cad=waXOzWVFsv91mQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Enable Hantro G1 post-processor
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 12, 2020 at 1:22 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> On lun, 2020-02-10 at 23:16 -0500, Nicolas Dufresne wrote:
> > Le lundi 10 f=C3=A9vrier 2020 =C3=A0 11:45 +0900, Tomasz Figa a =C3=A9c=
rit :
> > > On Mon, Feb 10, 2020 at 4:52 AM Nicolas Dufresne <nicolas@ndufresne.c=
a>
> > > wrote:
> > > > Le mercredi 13 novembre 2019 =C3=A0 14:56 -0300, Ezequiel Garcia a =
=C3=A9crit :
> > > > > Hi all,
> > > > >
> > > > > The Hantro G1 VPU post-processor block can be pipelined with
> > > > > the decoder hardware, allowing to perform operations such as
> > > > > color conversion, scaling, rotation, cropping, among others.
> > > > >
> > > > > When the post-processor is enabled, the decoder hardware
> > > > > needs its own set of NV12 buffers (the native decoder format),
> > > > > and the post-processor is the owner of the CAPTURE buffers,
> > > > > allocated for the post-processed format.
> > > > >
> > > > > This way, applications obtain post-processed
> > > > > (scaled, converted, etc) buffers transparently.
> > > > >
> > > > > This feature is implemented by exposing the post-processed pixel
> > > > > formats on ENUM_FMT, ordered as "preferred pixelformat first":
> > > > >
> > > > > v4l2-ctl -d 1 --list-formats
> > > > > ioctl: VIDIOC_ENUM_FMT
> > > > >       Type: Video Capture Multiplanar
> > > > >
> > > > >       [0]: 'NV12' (Y/CbCr 4:2:0)
> > > > >       [1]: 'YUYV' (YUYV 4:2:2)
> > > > >
> > > > > The order of preference in ENUM_FMT can be used as a hint
> > > > > by applications. This series updates the uAPI specification
> > > > > accordingly.
> > > >
> > > > As I'm implementing this, I realize that there may me a gap in bein=
g
> > > > able to implement both IPP and non-IPP support in a generic framewo=
rk.
> > > > Unlike the above comment, we for non-IPP decoder we cannot naively =
pick
> > > > the first format. In fact we parse the chroma and depth information
> > > > from the headers (like pps from H264), and we pick a matching pixel
> > > > format. This way, if we have a 10bit stream, and our IP supports 10=
bit,
> > > > we will pick a 10bit pixel formats, otherwise decoding will just fa=
il.
> > > >
> > > > None of this information is passed to the driver prior to the first
> > > > Request being made, so there is no way (as of current spec) that th=
e
> > > > driver can validate this in try_fmt ahead of time. Unless I set pic=
ture
> > > > parameters without a request_fd for that purpose. If this is the wa=
y,
> > > > then we should document this.
> > >
> > > +Alexandre Courbot
> > >
> > > It was suggested in the very early RFC stage, but it looks like it
> > > didn't make it to the final spec.
> > > https://patchwork.kernel.org/patch/10583233/#22209555
> >
> > Ok, maybe we should revive it, it would fill that gap. Again, only an
> > issue if you have a post processor. I'm still surprised we didn't
> > expose the IPP functions through the topology, it would make so much
> > sense to me, and I can make better code with that knowledge.
> >
> > I found while coding this, that even if it's more difficult,
> > classification of device by looking at the topology and the entity
> > functions is much nicer, less of a guess.
> >
> > Though, we lack some documentation (or clarification) for how to
> > properly handle formats, size and selection in order to configure the
> > IPP. Ezequiel was saying that we don't implement selection in Hanto, so
> > I guess the scaling is a bit ambiguous then in regard to coded/display
> > sizes. Though we pass a size to the OUTPUT side, so the driver can
> > always control a little bit.
>
> Re-reading the "initialization process", it's actually still there:
>
> "Call VIDIOC_S_EXT_CTRLS() to set all the controls (parsed headers, etc.)
> required by the OUTPUT format to enumerate the CAPTURE formats."
>

Oh, so it did make it to the final spec. Sorry, my bad. Should have
checked better.

> And then it suggest to use G_FMT to retreive the optimal format as select=
ed by
> the driver. So I guess this is a false alarm. And we probably don't need =
to play
> with the subsampling to filter the formats, as the driver is expected to =
do so.
>

The question that this raises then is whether the merged drivers do
so. Hantro G1 supports only 8-bit YUV 4:2:0, so there is no problem,
although the driver doesn't seem to validate that in the headers. I'd
also say the CAPTURE resolution should be determined by the headers,
rather than the OUTPUT queue, consistently to the stateful decoders.
Resolution changes should be also signaled if controls are set to
headers that contain different resolutions than previously set.

> So what could be improve, is have in the per-codec documentation the list=
 of
> controls that are "required by the OUTPUT format to enumerate the CAPTURE
> formats.". Could just be a comment in the control doc so say, "this contr=
ol is
> needed to allow enumerationg of the CAPTURE formats".
>

I wouldn't limit this to the format enumeration. The drivers may also
need to check for things like profile, some stream features or even
just whether the resolution doesn't exceed the maximum supported by
the decoder.

Best regards,
Tomasz

> >
> > > > Is this the intended way to negotiation IPP functions with the driv=
er ?
> > > >
> > >
> > > In theory, if the userspace knows whether the stream is 4:2:0 or 4:2:=
2
> > > and 8-bit or 10-bit, it can still select the first format from the to=
p
> > > that matches these properties.
> >
> > That's exactly what I do, I have a map of the formats and their
> > chroma/depth, and take the first one that match. If that fails, I just
> > fallback to the first one. It's something you need to do anyway, as we
> > prefer the native format first (even if there is an IPP).
> >
> > > That's not how format handling in V4L2 works, though. ENUM_FMT is
> > > expected to return a list of valid formats and if we forget about the
> > > image processor for a moment, a stateless decoder would always return
> > > any possible format, including ones invalid for the stream.
> > >
> > > Now back to the image processor, if it handles conversions from any t=
o
> > > any format listed by ENUM_FMT, we kind of regain the V4L2 compliance,
> > > but if the conversions are limited, the above requirement still
> > > doesn't hold and we're not implementing V4L2 correctly.
> > >
> > > Perhaps we can still amend the spec and require controls that
> > > determine the stream properties to be set before starting the
> > > streaming? I can imagine it could also help the driver filter out som=
e
> > > unsupported streams early, before allocating buffers and attempting t=
o
> > > decode.
> >
> > I think it would make sense, so just to make sure, for H264 we could
> > set the V4L2_CID_MPEG_VIDEO_H264_SPS along with the OUTPUT format,
> > prior to CAPTURE enumeration.
> >
> > > Best regards,
> > > Tomasz
> > >
> > > > > When the application sets a pixel format other than NV12,
> > > > > the post-processor is transparently enabled.
> > > > >
> > > > > Patch 1 is a cleanups needed to easier integrate the post-process=
or.
> > > > > Patch 2 introduces the post-processing support.
> > > > > Patch 3 updates the uAPI specification.
> > > > >
> > > > > This is tested on RK3288 platforms with MPEG-2, VP8 and
> > > > > H264 streams, decoding to YUY2 surfaces. For now, this series
> > > > > is only adding support for NV12-to-YUY2 conversion.
> > > > >
> > > > > Applies to media/master.
> > > > >
> > > > > Future plans
> > > > > ------------
> > > > >
> > > > > It seems to me that we should start moving this driver to use
> > > > > regmap-based access to registers. However, such move is out of sc=
ope
> > > > > and not entirely related to this post-processor enablement.
> > > > >
> > > > > We'll work on that as follow-up patches.
> > > > >
> > > > > Changelog
> > > > > ---------
> > > > >
> > > > > Changes v3:
> > > > >
> > > > > * After discussing with Hans and Tomasz during the media summit
> > > > > in ELCE, we decided to go back on the MC changes. The MC topology
> > > > > is now untouched. This means the series is now similar to v1,
> > > > > except we explicitly use the ENUM_FMT to hint about the post-proc=
essed
> > > > > formats.
> > > > >
> > > > > Changes v2:
> > > > >
> > > > > * The decoder->post-processor topology is now exposed
> > > > >   explicitly and applications need to configure the pipeline.
> > > > >   By default, the decoder is enabled and the post-processor
> > > > >   is disabled.
> > > > >
> > > > > * RGB post-processing output has been dropped. We might
> > > > >   add this in the future, but for now, it seems it would
> > > > >   make the code more complex without a use-case in mind.
> > > > >   RGB is much more memory-consuming so less attractive
> > > > >   than YUV, and modern GPUs and display controllers support YUV.
> > > > >
> > > > > * The post-processor implementation still supports RK3288
> > > > >   only. However, a generic register infrastructure is introduced
> > > > >   to make addition of other variants such as RK3399 really easy.
> > > > >
> > > > > Ezequiel Garcia (3):
> > > > >   media: hantro: Cleanup format negotiation helpers
> > > > >   media: hantro: Support color conversion via post-processing
> > > > >   media: vidioc-enum-fmt.rst: clarify format preference
> > > > >
> > > > >  .../media/uapi/v4l/vidioc-enum-fmt.rst        |   4 +-
> > > > >  drivers/staging/media/hantro/Makefile         |   1 +
> > > > >  drivers/staging/media/hantro/hantro.h         |  64 +++++++-
> > > > >  drivers/staging/media/hantro/hantro_drv.c     |   8 +-
> > > > >  .../staging/media/hantro/hantro_g1_h264_dec.c |   2 +-
> > > > >  .../media/hantro/hantro_g1_mpeg2_dec.c        |   2 +-
> > > > >  drivers/staging/media/hantro/hantro_g1_regs.h |  53 +++++++
> > > > >  .../staging/media/hantro/hantro_g1_vp8_dec.c  |   2 +-
> > > > >  drivers/staging/media/hantro/hantro_h264.c    |   6 +-
> > > > >  drivers/staging/media/hantro/hantro_hw.h      |  13 ++
> > > > >  .../staging/media/hantro/hantro_postproc.c    | 141 ++++++++++++=
++++++
> > > > >  drivers/staging/media/hantro/hantro_v4l2.c    | 105 ++++++++----=
-
> > > > >  drivers/staging/media/hantro/rk3288_vpu_hw.c  |  10 ++
> > > > >  13 files changed, 366 insertions(+), 45 deletions(-)
> > > > >  create mode 100644 drivers/staging/media/hantro/hantro_postproc.=
c
> > > > >
>
