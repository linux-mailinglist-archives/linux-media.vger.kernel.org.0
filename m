Return-Path: <linux-media+bounces-5518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A709A85CF47
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 05:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 112951F25478
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 04:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4E339879;
	Wed, 21 Feb 2024 04:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Eclbx+rb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AF12AEFB
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 04:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708489851; cv=none; b=UQuXXeFm5t7Vqu2jLjN7P4Uh9x2GzbvUXos+xHdpzGzBjCsxRc9O3gpYkK6laa9m9vx1gpBCh154xQ1S3+1BXh++dxRp2BFyNpYBERPLgdpa9myFEqKoib0dBapGHGgrljwJh/8YIOJ9BOn9hTzhi9q9W2cU6v6YiRjVgCKPIpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708489851; c=relaxed/simple;
	bh=bWzhYtox2bpUREEb2FwOBY7Yv6HvM9YvDi85zi8WYRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vjbf2rf6FX37d+HD22LjjpYBIxLs3rpnoleXCt0yuXwfL2qZnKVTRVvndtIMVkp5hj1tuNnWUqr9McXsaOqGVYYtt2pQ5KgJREcLSy+/Vi6N4L5r4HlP2K/rPVUrtJE0FizLjlClKzN8UgKjczre3aorraLFBbrF6r8850wkPtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Eclbx+rb; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-512a65cd2c7so4513708e87.0
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 20:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708489848; x=1709094648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTLF+9/86+3ZrNqwWCAt6rY4IvAqp7zzJB3AKM6ztK4=;
        b=Eclbx+rbCvRSej7MS7bLfHBisTI5B79t0eu+/SBLXv4CiX7pe2Bh7awXb1Pd/BWqLY
         YhlSOqlkxIUuv5DrgRt/ralvzw3uskKhjNxZNfbG9eBM8MBlP/pYijZqyXy9k/ELQ/YW
         s61mGqQlvgjjMVAt0uOF7cyOJ4gTAe9EWVFGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708489848; x=1709094648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTLF+9/86+3ZrNqwWCAt6rY4IvAqp7zzJB3AKM6ztK4=;
        b=OJTb/d3kxOGx6+/SrHjYepiAu+SO6wF/u8zcvkAKWqp2wOEMzfAvKGgHBuFGRRHKh/
         x7oVlO1h5vVcTHktNclfCA/EqeQPKB6Cb+hIvTxyZ555LXs328yLQWw4C3W0P4STH8Tp
         spGxNee9xV7rw1+mow/g2H7uIJLLKKQmaphPipbeC4N9BQC/YLQJxTVVkF7e0kDqZp/N
         D5p4mRQzWq30hmHjQF7YhI4lRSNZold2vCe/mbIZUz/l7PUB6VG3RCZ96Jm6KpJW4rqM
         YPHgs6z4YYnJwJ6AoGJJolKFTcfIEVxCbBEborjPd0htla61x32nlBBoMZ7WaM/Jncdp
         ZaXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEEOecXNkdvMoSwblLHYvpMLFQTNonQJpt8w47iZLAX5A2Uf/N7mEgFvxIPPuLIpuUhrOGuCCTS6ae1wr0WcjE6Z81SHxeGpIqa5I=
X-Gm-Message-State: AOJu0YzBPsB125xxzwOLfQdp42vScve0iurfH9Nj/OE0I3Rz9BrbuSba
	zJpQb8w6Zn4fQ/nPuLI/IV4AyrGUgJA7TKX47HucK9o76BW/Y8rXBXWVOhLcX2Psrc2eQr9rCs0
	XNw==
X-Google-Smtp-Source: AGHT+IGK2FssQCzebhO9HMiFhALAy1UbM7AF/1inxJKTJtxQ2KfWnuLM17sEYAWD9451V1XPAaDMkA==
X-Received: by 2002:ac2:5589:0:b0:512:ab9e:3525 with SMTP id v9-20020ac25589000000b00512ab9e3525mr5448244lfg.40.1708489847938;
        Tue, 20 Feb 2024 20:30:47 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id x16-20020a056402415000b005644e4fdf36sm3239563eda.6.2024.02.20.20.30.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 20:30:47 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33d7b04f7e9so173717f8f.1
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 20:30:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8TKOUnr6sormZAn2Aj9xs0yuw6SLnaC0/0o7/hcqtiqXiDrOYWxYsS/IgHtUUif1Nz+EmL9RibnZtsmkQaNNGQp/Z9tOMF7WcYvo=
X-Received: by 2002:adf:ef8f:0:b0:33d:2775:1e63 with SMTP id
 d15-20020adfef8f000000b0033d27751e63mr9141684wro.41.1708489847044; Tue, 20
 Feb 2024 20:30:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
 <1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com> <20240217104212.32f07e3a@coco.lan>
In-Reply-To: <20240217104212.32f07e3a@coco.lan>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 21 Feb 2024 13:30:29 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CY731HRhFHpmwzGxAZ-BFV_pT7NNGwNGy4ZOA=qz8ntg@mail.gmail.com>
Message-ID: <CAAFQd5CY731HRhFHpmwzGxAZ-BFV_pT7NNGwNGy4ZOA=qz8ntg@mail.gmail.com>
Subject: Re: [PATCH v12 07/15] media: v4l2: Add audio capture and output support
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl, sakari.ailus@iki.fi, 
	m.szyprowski@samsung.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
	festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com, 
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 6:42=E2=80=AFPM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Em Thu, 18 Jan 2024 20:32:00 +0800
> Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
>
> > Audio signal processing has the requirement for memory to
> > memory similar as Video.
> >
> > This patch is to add this support in v4l2 framework, defined
> > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > for audio case usage.
> >
> > The created audio device is named "/dev/v4l-audioX".
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../userspace-api/media/v4l/buffer.rst        |  6 ++
> >  .../media/v4l/dev-audio-mem2mem.rst           | 71 +++++++++++++++++++
> >  .../userspace-api/media/v4l/devices.rst       |  1 +
> >  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
> >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
> >  .../media/videodev2.h.rst.exceptions          |  2 +
> >  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
> >  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 +++
> >  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++
> >  include/media/v4l2-dev.h                      |  2 +
> >  include/media/v4l2-ioctl.h                    | 34 +++++++++
> >  include/uapi/linux/videodev2.h                | 17 +++++
> >  13 files changed, 222 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem=
2mem.rst
> >
> > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documen=
tation/userspace-api/media/v4l/buffer.rst
> > index 52bbee81c080..a3754ca6f0d6 100644
> > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > @@ -438,6 +438,12 @@ enum v4l2_buf_type
> >      * - ``V4L2_BUF_TYPE_META_OUTPUT``
> >        - 14
>
> >        - Buffer for metadata output, see :ref:`metadata`.
> > +    * - ``V4L2_BUF_TYPE_AUDIO_CAPTURE``
> > +      - 15
> > +      - Buffer for audio capture, see :ref:`audio`.
> > +    * - ``V4L2_BUF_TYPE_AUDIO_OUTPUT``
> > +      - 16
>
> Hmm... alsa APi define input/output as:
>         enum {
>                 SNDRV_PCM_STREAM_PLAYBACK =3D 0,
>                 SNDRV_PCM_STREAM_CAPTURE,
>                 SNDRV_PCM_STREAM_LAST =3D SNDRV_PCM_STREAM_CAPTURE,
>         };
>
>
> I would use a namespace as close as possible to the
> ALSA API. Also, we're not talking about V4L2, but, instead
> audio. so, not sure if I like the prefix to start with
> V4L2_. Maybe ALSA_?
>
> So, a better namespace would be:
>
>         ${prefix}_BUF_TYPE_PCM_STREAM_PLAYBACK
> and
>         ${prefix}_BUF_TYPE_PCM_STREAM_CAPTURE
>

The API is still V4L2, and all the other non-video buf types also use
the V4L2_ prefix, so perhaps that's good here as well?

Whether AUDIO or PCM_STREAM makes more sense goes outside of my
expertise. Subjectively, a PCM stream sounds more specific than an
audio stream. Do those buf types also support non-PCM audio streams?

> > +      - Buffer for audio output, see :ref:`audio`.
> >
> >
> >  .. _buffer-flags:
> > diff --git a/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rs=
t b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> > new file mode 100644
> > index 000000000000..68faecfe3a02
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> > @@ -0,0 +1,71 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _audiomem2mem:
> > +
> > +********************************
> > +Audio Memory-To-Memory Interface
> > +********************************
> > +
> > +An audio memory-to-memory device can compress, decompress, transform, =
or
> > +otherwise convert audio data from one format into another format, in m=
emory.
> > +Such memory-to-memory devices set the ``V4L2_CAP_AUDIO_M2M`` capabilit=
y.
> > +Examples of memory-to-memory devices are audio codecs, audio preproces=
sing,
> > +audio postprocessing.
> > +
> > +A memory-to-memory audio node supports both output (sending audio fram=
es from
> > +memory to the hardware) and capture (receiving the processed audio fra=
mes
> > +from the hardware into memory) stream I/O. An application will have to
> > +setup the stream I/O for both sides and finally call
> > +:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>` for both capture and output t=
o
> > +start the hardware.
> > +
> > +Memory-to-memory devices function as a shared resource: you can
> > +open the audio node multiple times, each application setting up their
> > +own properties that are local to the file handle, and each can use
> > +it independently from the others. The driver will arbitrate access to
> > +the hardware and reprogram it whenever another file handler gets acces=
s.
> > +
> > +Audio memory-to-memory devices are accessed through character device
> > +special files named ``/dev/v4l-audio``
> > +
> > +Querying Capabilities
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Device nodes supporting the audio memory-to-memory interface set the
> > +``V4L2_CAP_AUDIO_M2M`` flag in the ``device_caps`` field of the
> > +:c:type:`v4l2_capability` structure returned by the :c:func:`VIDIOC_QU=
ERYCAP`
> > +ioctl.
> > +
> > +Data Format Negotiation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The audio device uses the :ref:`format` ioctls to select the capture f=
ormat.
> > +The audio buffer content format is bound to that selected format. In a=
ddition
> > +to the basic :ref:`format` ioctls, the :c:func:`VIDIOC_ENUM_FMT` ioctl=
 must be
> > +supported as well.
> > +
> > +To use the :ref:`format` ioctls applications set the ``type`` field of=
 the
> > +:c:type:`v4l2_format` structure to ``V4L2_BUF_TYPE_AUDIO_CAPTURE`` or =
to
> > +``V4L2_BUF_TYPE_AUDIO_OUTPUT``. Both drivers and applications must set=
 the
> > +remainder of the :c:type:`v4l2_format` structure to 0.
> > +
> > +.. c:type:: v4l2_audio_format
> > +
> > +.. tabularcolumns:: |p{1.4cm}|p{2.4cm}|p{13.5cm}|
> > +
> > +.. flat-table:: struct v4l2_audio_format
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - __u32
> > +      - ``pixelformat``
> > +      - The sample format, set by the application. see :ref:`pixfmt-au=
dio`
>
> pixelformat doesn't make any sense for audio: there are no pixels on a
> PCM stream. Please use call it, instead: `snd_pcm_format`, making it matc=
h
> the values for snd_pcm_format_t.
>

+1

FWIW v4l2_meta_format uses the name "dataformat".

Actually, I just realized that the C code actually uses the name
"audioformat". Tbh., after reading the kerneldoc comment, my
subjective preference would be on "sample_format", since that's
exactly what it is.

> Yet, I would keep defining it as u32 (or u64?) instead of using a
> typedef int field there (snd_pcm_format_t), as the size of integer
> is different on 32 and 64 bit kernels.

+1

Best regards,
Tomasz

