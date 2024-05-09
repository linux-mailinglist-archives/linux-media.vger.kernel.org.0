Return-Path: <linux-media+bounces-11193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C33298C0E05
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 12:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3620CB22C7D
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 10:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F1914B08A;
	Thu,  9 May 2024 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nq9pvgLf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7C5149C65;
	Thu,  9 May 2024 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715249553; cv=none; b=qxZPgbsnDm4KThPRQqTfoRwAiTru4d06Y4lnJF2Dfacrd6Yk63gCc6qdEcmG385nBQkoL9eF3wfWF8mlgw7ZpsAlyBcO2StX+tYdMavcYmiLFPOeAllEl3p+6xmz9scIbFZVBQmrRyD7URhyXpK6mZD7APSBG1x08+e3GeTNhC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715249553; c=relaxed/simple;
	bh=UAeR5ZjiFr/EvIX6LWiLIWkIVSAHBYDxqVhnGR8afWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY/gQ/+c3GwBt/Go9vnCdbYaIjpTGzsPHmUd91n5lqQmSax1X8L3MNFBqEuxsdKjovfi692HWI/aZinUCB6lRw2F3O1xlf8weAx0pzVDibTmeAOEqFwCIS0ck72ytWZtrZR+AOC/I3lXXwkaDv7V/+UoEvyY9qsuatpcFxT3AOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nq9pvgLf; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-36ca529db61so1910375ab.2;
        Thu, 09 May 2024 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715249551; x=1715854351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeeOhJExMaeOPonFZLuLoibUPLJlD+uSiqsEeJXK218=;
        b=Nq9pvgLfkw+NsUtVv2D9H2ceTg/Oo3E8PdzY/NyorfQ59T43mkug5dCiKuEPSxwc5E
         WFL3YITbeW55FNj6XUj8AfoPQYrmA60rNYjpH5QwbZiGMVECB/mW+RerbOfJpL/PyLOt
         Z9Wbd7onMTSGs1oWQmy3LxTqANIJ4BtseY/k1Np/qjjDIVSNIJQUMdty3NBz4BmU2y3r
         YV6vL87T1NWP92bxP/NNbzxyHIjXNym0TFqx9Rr1PjwNgL75L39++EqwEJsEHNlZAZdX
         O62Mg1JnBuk5duMcvhciYIokGRPFIRbDcRYhNcwqBD5di3czM+7uU5iOHt87tv9m1Pqm
         LeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715249551; x=1715854351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeeOhJExMaeOPonFZLuLoibUPLJlD+uSiqsEeJXK218=;
        b=HFsTG0fhoAECWQox0O1UXAMpFKebo38OjMwyCqBmBRztTA/lo8qPorvEnkCIFGNGGc
         DdZZ2B6UspB9QG8B5bsOVGjwKbVRzqBIiNchA9XlGptCfiwb+bqKY5WoDAWPXnMzisq6
         sakyRcrmP8kOcUY78p6BQq2sTSrjjJ878AzlIszUZbLpwfW9QxvokjSC+NHRxwUKjo3a
         Ivt5K7IcBy96DF4RoFySqaneBjxnGiETtSfbbbjRB+YMqcNdAj5OKIPioKeefW563rkf
         l/edg+SFjR5tqsd37sGz3Ic+6KOwxikk1eILReVHRUtW8uN2PSay2ka7zl1IrnD3wW1W
         NLpg==
X-Forwarded-Encrypted: i=1; AJvYcCUY1iAjTtsWhRNnIQtLiFIh/pvLXzN9mh1puOL/2y9tQC50ahEacuZhyoQhlKNTsUvbnIJ7eGNFUPf8ji7Mu3a6StYkcAS1f7NhI4JNzm7ra+XgOHfMzpzKCifylr6XIhvshl+q6UPPF1M=
X-Gm-Message-State: AOJu0YzrkyFfSWDTCUUG2H8vzXqW1h+PSyPxMFKChvwy8R6mQh75ctAQ
	tIOzw73sgbiUVn9ccWenHHw1S8y6fkwQdzjv+Bs+//rO6dZ5f6XmKKrqdsgD8sJsMSM8c1T19Zr
	NUXw4n9WRwr3ZkV9SWWotma1GAY4=
X-Google-Smtp-Source: AGHT+IGACDILZuY3fjYmxVHjuj9EsLsw9yHssyl7QKQF1yUC0YZknYZxgh3CbiS3+eqeZ0s8vnluIDetD2EkdkJwwd8=
X-Received: by 2002:a92:cd8b:0:b0:36c:4b01:3063 with SMTP id
 e9e14a558f8ab-36caed04a13mr56384385ab.15.1715249550653; Thu, 09 May 2024
 03:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310> <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
 <20240430172752.20ffcd56@sal.lan> <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
 <87sez0k661.wl-tiwai@suse.de> <20240502095956.0a8c5b26@sal.lan>
 <20240502102643.4ee7f6c2@sal.lan> <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
 <20240503094225.47fe4836@sal.lan> <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl> <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com> <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
In-Reply-To: <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 9 May 2024 18:12:19 +0800
Message-ID: <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 5:50=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 5/9/2024 11:36 AM, Shengjiu Wang wrote:
> > On Wed, May 8, 2024 at 4:14=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
> > <amadeuszx.slawinski@linux.intel.com> wrote:
> >>
> >> On 5/8/2024 10:00 AM, Hans Verkuil wrote:
> >>> On 06/05/2024 10:49, Shengjiu Wang wrote:
> >>>> On Fri, May 3, 2024 at 4:42=E2=80=AFPM Mauro Carvalho Chehab <mcheha=
b@kernel.org> wrote:
> >>>>>
> >>>>> Em Fri, 3 May 2024 10:47:19 +0900
> >>>>> Mark Brown <broonie@kernel.org> escreveu:
> >>>>>
> >>>>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wr=
ote:
> >>>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >>>>>>
> >>>>>>>> There are still time control associated with it, as audio and vi=
deo
> >>>>>>>> needs to be in sync. This is done by controlling the buffers siz=
e
> >>>>>>>> and could be fine-tuned by checking when the buffer transfer is =
done.
> >>>>>>
> >>>>>> ...
> >>>>>>
> >>>>>>> Just complementing: on media, we do this per video buffer (or
> >>>>>>> per half video buffer). A typical use case on cameras is to have
> >>>>>>> buffers transferred 30 times per second, if the video was streame=
d
> >>>>>>> at 30 frames per second.
> >>>>>>
> >>>>>> IIRC some big use case for this hardware was transcoding so there =
was a
> >>>>>> desire to just go at whatever rate the hardware could support as t=
here
> >>>>>> is no interactive user consuming the output as it is generated.
> >>>>>
> >>>>> Indeed, codecs could be used to just do transcoding, but I would
> >>>>> expect it to be a border use case. See, as the chipsets implementin=
g
> >>>>> codecs are typically the ones used on mobiles, I would expect that
> >>>>> the major use cases to be to watch audio and video and to participa=
te
> >>>>> on audio/video conferences.
> >>>>>
> >>>>> Going further, the codec API may end supporting not only transcodin=
g
> >>>>> (which is something that CPU can usually handle without too much
> >>>>> processing) but also audio processing that may require more
> >>>>> complex algorithms - even deep learning ones - like background nois=
e
> >>>>> removal, echo detection/removal, volume auto-gain, audio enhancemen=
t
> >>>>> and such.
> >>>>>
> >>>>> On other words, the typical use cases will either have input
> >>>>> or output being a physical hardware (microphone or speaker).
> >>>>>
> >>>>
> >>>> All, thanks for spending time to discuss, it seems we go back to
> >>>> the start point of this topic again.
> >>>>
> >>>> Our main request is that there is a hardware sample rate converter
> >>>> on the chip, so users can use it in user space as a component like
> >>>> software sample rate converter. It mostly may run as a gstreamer plu=
gin.
> >>>> so it is a memory to memory component.
> >>>>
> >>>> I didn't find such API in ALSA for such purpose, the best option for=
 this
> >>>> in the kernel is the V4L2 memory to memory framework I found.
> >>>> As Hans said it is well designed for memory to memory.
> >>>>
> >>>> And I think audio is one of 'media'.  As I can see that part of Radi=
o
> >>>> function is in ALSA, part of Radio function is in V4L2. part of HDMI
> >>>> function is in DRM, part of HDMI function is in ALSA...
> >>>> So using V4L2 for audio is not new from this point of view.
> >>>>
> >>>> Even now I still think V4L2 is the best option, but it looks like th=
ere
> >>>> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
> >>>> a duplication of code (bigger duplication that just add audio suppor=
t
> >>>> in V4L2 I think).
> >>>
> >>> After reading this thread I still believe that the mem2mem framework =
is
> >>> a reasonable option, unless someone can come up with a method that is
> >>> easy to implement in the alsa subsystem. From what I can tell from th=
is
> >>> discussion no such method exists.
> >>>
> >>
> >> Hi,
> >>
> >> my main question would be how is mem2mem use case different from
> >> loopback exposing playback and capture frontends in user space with DS=
P
> >> (or other piece of HW) in the middle?
> >>
> > I think loopback has a timing control,  user need to feed data to playb=
ack at a
> > fixed time and get data from capture at a fixed time.  Otherwise there
> > is xrun in
> > playback and capture.
> >
> > mem2mem case: there is no such timing control,  user feeds data to it
> > then it generates output,  if user doesn't feed data, there is no xrun.
> > but mem2mem is just one of the components in the playback or capture
> > pipeline, overall there is time control for whole pipeline,
> >
>
> Have you looked at compress streams? If I remember correctly they are
> not tied to time due to the fact that they can pass data in arbitrary
> formats?
>
> From:
> https://docs.kernel.org/sound/designs/compress-offload.html
>
> "No notion of underrun/overrun. Since the bytes written are compressed
> in nature and data written/read doesn=E2=80=99t translate directly to ren=
dered
> output in time, this does not deal with underrun/overrun and maybe dealt
> in user-library"

I checked the compress stream. mem2mem case is different with
compress-offload case

compress-offload case is a full pipeline,  the user sends a compress
stream to it, then DSP decodes it and renders it to the speaker in real
time.

mem2mem is just like the decoder in the compress pipeline. which is
one of the components in the pipeline.

best regards
shengjiu wang
>
> Amadeusz

