Return-Path: <linux-media+bounces-11190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 185E58C0D90
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 11:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3CEE283761
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 09:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A4E14B073;
	Thu,  9 May 2024 09:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MT9cEtew"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5712814AD33;
	Thu,  9 May 2024 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715247411; cv=none; b=c0mGJlaQKI5D0JiAMhTD0WuqeXwi42LyBXtuMjWMHP4YN2pQFRL3FqKCGinsJj7qhbAuUO18/uCdXlpwrB+ikkhMK3AkQV84UyVAR1qHeD1zQe7u3osicTI9yXUlXOQTgIBxRwm5JzUUxnp8TtFS4n4jX+RQE43SLICoEqEpvx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715247411; c=relaxed/simple;
	bh=cy7CWmqg8JaRX86mPUU3bC3ulyypV5pK2pkW2V9kha8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZM8hNPEysbzejFH4cfW5nx7HV06JG+jmGIzCt2P/UY24wquFbVahtFRr+hGqRYqEtCXS9Od59q69RU7Lv/qq3+zIrd0kLsN8ySq9DwArWEhm3ZYVeOIAjsCGsDHBtUn1NQwS/avVllrqBelMfR2yYGRP5eDetP3COR7ZLZC10s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MT9cEtew; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-36c947ff642so2955895ab.2;
        Thu, 09 May 2024 02:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715247409; x=1715852209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icJF1CnJVBJloJSGMiGDeLLdcHlpsMMYY04rY+Lcxgw=;
        b=MT9cEtewURBApcPQ6S9pcYmWLbMv2bMDcoLQ+RiM0ybXQqi/nKvu+3fv6IQ/oK872q
         91mcPUFu2JTQBf1Ch19FzBSABCO4ywu96SRATyRdzPkjppA4NPR8CLex6D92qjqVycsY
         g49f+Dd8BWa4bQwyfh3NtadYNxI1y5WZ3ma8NlIgJ4oUDSXV/tzUSEQ39rDVu/WW0blN
         OFa+NqCyG7ICqGWBz+1/+J1Oqh0ARjHdBn7FOIau+YM0AmtZU/jjhsZJz5YQ8scOMGvS
         WBip9JwS2vICR5xrtr8HzQisFZ0Pe9FPDEV3sGZiy8j+b9QGznSgiLR3szxjGV+Ygi9k
         vNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715247409; x=1715852209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icJF1CnJVBJloJSGMiGDeLLdcHlpsMMYY04rY+Lcxgw=;
        b=ulbLy46E9eP7GyS1/3ky4UDMUcpRzvDy+Rp8spstQUoiRO6wUGw3A/JaL+1spjDDec
         J4CAwbp9mpU2jE8MefKFXXtw0lahQdDAQqU8KQEme97Djh0g1lueOUYx5xHnHrL4VFXH
         ewOxUJy4+XX2LnBJw9ziz+6w41j7Wn4XnwCFdvI8iVI2GY34VoF2gk1U7cs2PkuydiYV
         Irev0H4nH6ETQaLX/Ozr+44Lf+yTMBVb/FVlrtt52Cd967n6ZIGf8+BorRkfa47i9y/9
         CRyIuZ6qOZzK5Xs3GzRpx9CIilMVns0lIwaQndjeXtte64P7O16Aa8h9HLmeXp2kuad/
         /IZg==
X-Forwarded-Encrypted: i=1; AJvYcCVrIuL1fjvcpL3seGTzAeSUtK7YFiF8pv/UxopcFOE6h7EwnfNkYNpESInyS5yt0uoz3LucdeyMvds4e8tqMCWSqsC48KbxHShzWzFJCru92lPSs7q7xHZAef9nj+4AzQIkOmGjoe8iMG0=
X-Gm-Message-State: AOJu0YyCDp2RL2aui3OJ9tA54pPMd6+YwJokVxhwLG5hsqTnUOYq/vYU
	mYfzq8cJwUdIzWywL67cESTosE3TdwjfFhqIv+e8T54tBzqVUiS3zEaBTmvMOQbghHjcEzMhGJR
	KaJfaQ1zf8Cc2oZnIOPN5C1tDSmk=
X-Google-Smtp-Source: AGHT+IHMQfSBHy/1AVL9IbmZYx6H7dVJ/ppx2qIzgSdZP+YkzczNvUqE8dIc975+bA41fUNr1I7kZKh8WGTA7uTz8Mg=
X-Received: by 2002:a05:6e02:168a:b0:36a:3c07:9caf with SMTP id
 e9e14a558f8ab-36caed59232mr53903665ab.30.1715247409368; Thu, 09 May 2024
 02:36:49 -0700 (PDT)
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
In-Reply-To: <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 9 May 2024 17:36:38 +0800
Message-ID: <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
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

On Wed, May 8, 2024 at 4:14=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 5/8/2024 10:00 AM, Hans Verkuil wrote:
> > On 06/05/2024 10:49, Shengjiu Wang wrote:
> >> On Fri, May 3, 2024 at 4:42=E2=80=AFPM Mauro Carvalho Chehab <mchehab@=
kernel.org> wrote:
> >>>
> >>> Em Fri, 3 May 2024 10:47:19 +0900
> >>> Mark Brown <broonie@kernel.org> escreveu:
> >>>
> >>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrot=
e:
> >>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >>>>
> >>>>>> There are still time control associated with it, as audio and vide=
o
> >>>>>> needs to be in sync. This is done by controlling the buffers size
> >>>>>> and could be fine-tuned by checking when the buffer transfer is do=
ne.
> >>>>
> >>>> ...
> >>>>
> >>>>> Just complementing: on media, we do this per video buffer (or
> >>>>> per half video buffer). A typical use case on cameras is to have
> >>>>> buffers transferred 30 times per second, if the video was streamed
> >>>>> at 30 frames per second.
> >>>>
> >>>> IIRC some big use case for this hardware was transcoding so there wa=
s a
> >>>> desire to just go at whatever rate the hardware could support as the=
re
> >>>> is no interactive user consuming the output as it is generated.
> >>>
> >>> Indeed, codecs could be used to just do transcoding, but I would
> >>> expect it to be a border use case. See, as the chipsets implementing
> >>> codecs are typically the ones used on mobiles, I would expect that
> >>> the major use cases to be to watch audio and video and to participate
> >>> on audio/video conferences.
> >>>
> >>> Going further, the codec API may end supporting not only transcoding
> >>> (which is something that CPU can usually handle without too much
> >>> processing) but also audio processing that may require more
> >>> complex algorithms - even deep learning ones - like background noise
> >>> removal, echo detection/removal, volume auto-gain, audio enhancement
> >>> and such.
> >>>
> >>> On other words, the typical use cases will either have input
> >>> or output being a physical hardware (microphone or speaker).
> >>>
> >>
> >> All, thanks for spending time to discuss, it seems we go back to
> >> the start point of this topic again.
> >>
> >> Our main request is that there is a hardware sample rate converter
> >> on the chip, so users can use it in user space as a component like
> >> software sample rate converter. It mostly may run as a gstreamer plugi=
n.
> >> so it is a memory to memory component.
> >>
> >> I didn't find such API in ALSA for such purpose, the best option for t=
his
> >> in the kernel is the V4L2 memory to memory framework I found.
> >> As Hans said it is well designed for memory to memory.
> >>
> >> And I think audio is one of 'media'.  As I can see that part of Radio
> >> function is in ALSA, part of Radio function is in V4L2. part of HDMI
> >> function is in DRM, part of HDMI function is in ALSA...
> >> So using V4L2 for audio is not new from this point of view.
> >>
> >> Even now I still think V4L2 is the best option, but it looks like ther=
e
> >> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
> >> a duplication of code (bigger duplication that just add audio support
> >> in V4L2 I think).
> >
> > After reading this thread I still believe that the mem2mem framework is
> > a reasonable option, unless someone can come up with a method that is
> > easy to implement in the alsa subsystem. From what I can tell from this
> > discussion no such method exists.
> >
>
> Hi,
>
> my main question would be how is mem2mem use case different from
> loopback exposing playback and capture frontends in user space with DSP
> (or other piece of HW) in the middle?
>
I think loopback has a timing control,  user need to feed data to playback =
at a
fixed time and get data from capture at a fixed time.  Otherwise there
is xrun in
playback and capture.

mem2mem case: there is no such timing control,  user feeds data to it
then it generates output,  if user doesn't feed data, there is no xrun.
but mem2mem is just one of the components in the playback or capture
pipeline, overall there is time control for whole pipeline,

Best regards
Shengjiu Wang

> Amadeusz
>

