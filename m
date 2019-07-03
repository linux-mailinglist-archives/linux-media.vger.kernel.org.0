Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9FC95E021
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 10:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbfGCIqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 04:46:45 -0400
Received: from mail-ed1-f41.google.com ([209.85.208.41]:43163 "EHLO
        mail-ed1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfGCIqp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 04:46:45 -0400
Received: by mail-ed1-f41.google.com with SMTP id e3so1234114edr.10
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xBMaGP5NU59l3pJ9Sp1wal6+8J+WZ6rQ2kYjrt9pVpg=;
        b=hM7ZWNJnzxqwwkuQOw0enmu0VkB0+AzbbkP3e41HPphSGT+UeZhT9XICPnqQHcfv4/
         MBJu76DL7Mv/KQ0MxUNtNmdtd59ciRJmJCkfqmv8cpi7nqOqFWk8oTzlb3mSYBIJO9FD
         xQwPmq6amxG/WYyt4ecQ0x5QFAetiNoYIHDO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xBMaGP5NU59l3pJ9Sp1wal6+8J+WZ6rQ2kYjrt9pVpg=;
        b=qNgzsmbXCUC1NrHP/GAK1USdV4yCUWAYER/HORrVf6lNrDEYFmkxZFiwQndZPx3NlZ
         vgCUijfilLMHeAPeRYdft8fW9idHiwOe73euYGVIesVA5u3V8MQN0pS+6eACvc8unUOF
         t5iiDQzVxh24YHmJGGtVnnvziiYXx2b2tSpPsyh3Dwfde+2bAUrN1AmyKs6ADqhvs+cP
         wQVpZ5PYAqvKV20BbVK7PJ+/F4OLkMkNrgtem/p6Ug4ANzjNp+ByCK05MwOJDKWGvKMn
         ucPszKm/wr3+eWrgOkXyZ/fQIzvgcqNAosEaqDo/7YC+bF9TIqg6Zsg46xXx63aIEmc1
         JTOA==
X-Gm-Message-State: APjAAAXlspt5ZUOh4lCS8J1EwZySPI933vtrFLS39y/QpWoK1XOZRbQA
        Sx/GThXXySCW/u5aOL1/eM3gPCsS0//RbA==
X-Google-Smtp-Source: APXvYqyr9/aycQ7yicgEGdV+sDwIBAWAPd07AWM6NpzWnThUFfq4/pGscbQWPIRDvubSZ70Iut2y4Q==
X-Received: by 2002:a50:92c4:: with SMTP id l4mr40960233eda.34.1562143603304;
        Wed, 03 Jul 2019 01:46:43 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id b19sm316887eje.80.2019.07.03.01.46.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 01:46:42 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id u18so1802062wru.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 01:46:42 -0700 (PDT)
X-Received: by 2002:a5d:6089:: with SMTP id w9mr18392676wrt.166.1562143601948;
 Wed, 03 Jul 2019 01:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl> <5b1362779132c1a47c26cd5080d5eb9920e72db3.camel@ndufresne.ca>
In-Reply-To: <5b1362779132c1a47c26cd5080d5eb9920e72db3.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 3 Jul 2019 17:46:30 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CW5=WUkGdv+=TiAM-x5zRFNrDFYVDfzf+En6xh6XUiMA@mail.gmail.com>
Message-ID: <CAAFQd5CW5=WUkGdv+=TiAM-x5zRFNrDFYVDfzf+En6xh6XUiMA@mail.gmail.com>
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jun 29, 2019 at 3:09 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le vendredi 28 juin 2019 =C3=A0 16:34 +0200, Hans Verkuil a =C3=A9crit :
> > Hi all,
> >
> > I hope I Cc-ed everyone with a stake in this issue.
> >
> > One recurring question is how a stateful encoder fills buffers and how =
a stateful
> > decoder consumes buffers.
> >
> > The most generic case is that an encoder produces a bitstream and just =
fills each
> > CAPTURE buffer to the brim before continuing with the next buffer.
> >
> > I don't think there are drivers that do this, I believe that all driver=
s just
> > output a single compressed frame. For interlaced formats I understand i=
t is either
> > one compressed field per buffer, or two compressed fields per buffer (t=
his is
> > what I heard, I don't know if this is true).
> >
> > In any case, I don't think this is specified anywhere. Please correct m=
e if I am
> > wrong.
> >
> > The latest stateful codec spec is here:
> >
> > https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html
> >
> > Assuming what I described above is indeed the case, then I think this s=
hould
> > be documented. I don't know enough if a flag is needed somewhere to des=
cribe
> > the behavior for interlaced formats, or can we leave this open and have=
 userspace
> > detect this?
> >
> >
> > For decoders it is more complicated. The stateful decoder spec is writt=
en with
> > the assumption that userspace can just fill each OUTPUT buffer to the b=
rim with
> > the compressed bitstream. I.e., no need to split at frame or other boun=
daries.
> >
> > See section 4.5.1.7 in the spec.
> >
> > But I understand that various HW decoders *do* have limitations. I woul=
d really
> > like to know about those, since that needs to be exposed to userspace s=
omehow.
> >
> > Specifically, the venus decoder needs to know the resolution of the cod=
ed video
> > beforehand and it expects a single frame per buffer (how does that work=
 for
> > interlaced formats?).
> >
> > Such requirements mean that some userspace parsing is still required, s=
o these
> > decoders are not completely stateful.
> >
> > Can every codec author give information about their decoder/encoder?
> >
> > I'll start off with my virtual codec driver:
> >
> > vicodec: the decoder fully parses the bitstream. The encoder produces a=
 single
> > compressed frame per buffer. This driver doesn't yet support interlaced=
 formats,
> > but when that is added it will encode one field per buffer.
> >
> > Let's see what the results are.
>
> Hans though a summary of what existing userspace expects / assumes
> would be nice.
>
> GStreamer:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Encodes:
>   fwht, h263, h264, hevc, jpeg, mpeg4, vp8, vp9
> Decodes:
>   fwht, h263, h264, hevc, jpeg, mpeg2, mpeg4, vc1, vp8, vp9
>
> It assumes that each encoded v4l2_buffer contains exactly one frame
> (any format, two fields for interlaced content). It may still work
> otherwise, but some issues will appear, timestamp shift, lost of
> metadata (e.g. timecode, cc, etc.).
>
> FFMpeg:
> =3D=3D=3D=3D=3D=3D=3D
> Encodes:
>   h263, h264, hevc, mpeg4, vp8
> Decodes:
>   h263, h264, hevc, mpeg2, mpeg4, vc1, vp8, vp9
>
> Similarly to GStreamer, it assumes that one AVPacket will fit one
> v4l2_buffer. On the encoding side, it seems less of a problem, but they
> don't fully implement the FFMPEG CODEC API for frame matching, which I
> suspect would create some ambiguity if it was.
>
> Chromium:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> Decodes:
>   H264, VP8, VP9
> Encodes:
>   H264

VP8 too.

It can in theory handle any format V4L2 could expose, but these 2 seem
to be the only commonly used codecs used in practice and supported by
hardware.

>
> That is the code I know the less, but the encoder does not seem
> affected by the nal alignment. The keyframe flag and timestamps seems
> to be used and are likely expected to correlate with the input, so I
> suspect that there exist some possible ambiguity if the output is not
> full frame. For the decoder, I'll have to ask someone else to comment,
> the code is hard to follow and I could not get to the place where
> output buffers are filled. I thought the GStreamer code was tough, but
> this is quite similarly a mess.

Not sure what's so complicated there. There is a clearly isolated
function that does the parsing:
https://cs.chromium.org/chromium/src/media/gpu/v4l2/v4l2_video_decode_accel=
erator.cc?rcl=3D2880fe4f6b246809f1be72c5a5698dced4cd85d1&l=3D984

It puts special NALUs like SPS and PPS in separate buffers and for
frames it's 1 frame (all slices of the frame) : 1 buffer.

Best regards,
Tomasz
