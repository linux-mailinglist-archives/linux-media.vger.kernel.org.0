Return-Path: <linux-media+bounces-10839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3A08BC9FC
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 10:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C366DB213BF
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 08:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8871420CC;
	Mon,  6 May 2024 08:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICGU1nvR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043AC433BC;
	Mon,  6 May 2024 08:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714985384; cv=none; b=QMXfLdh1CJln8L2MtkV/hJsGpkwHkIOrW6h7r18PqvxNx+6tVJtpelP1JUTA0nRX+2yznfkIra/15dfyU6r2qV2xxLVKyBC4SlwfQVINgCDRcTaDoZC+YMGNG05JHZFf0rys6iNiGWA8A6pYk4bC3//WBSQ3CjFgm4oz5cJUU7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714985384; c=relaxed/simple;
	bh=enOnhfQCgQ2RbMQ1kTNuTC4OOeXUIY658Bnehe2M/Xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWHzY/PGdMY3GlkqTeLQPoLZwS5BbI6PuWWBr/nwjqAztdmkWhixhBNp84uD1S0guGYbndjxYXX6CLq9QmY48yqvJf4PbZIXBx2Bzi105dyXyQMohJ3gmtyRCB9PGkNLnZnDIiiVVurU0sGKXlqU5Z7jQCvgYAYb+A7QrC6Fric=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICGU1nvR; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-36c7004daecso12228545ab.0;
        Mon, 06 May 2024 01:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714985382; x=1715590182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+P/KjeibrFZWEkv6+L8YPxuHh9mJNgbeY/rfKylmy8=;
        b=ICGU1nvRPCC+uBp095Ek2iRGMXSerDIUKPHnY1z7QUHrzoXO3cvPz1MEBanAvjflot
         moun/iwPbDE9ZFkbZRnRNcEhKyzUs7H+OLeBU1ZxLyR48Z9mSdCbriFszJb6HhBJBMmg
         EgpQc9wEO+UOtKT8YWj1b6Iz4VZnmquo9WyjrVlfK1ijkDqMmh1Dit3DcezVnGio3VJf
         EwaOZ8RcT5IwCJKw6akXCETytJneCIltGkhLAVezEXtJmCTG6NPWgjs+qDGJ68hN5GCe
         uwHttDr1Aa+nUhOvEYc5g7Uzl297Xqi1aBiFoMgjX0FXfjQl7N5IpgoDThAj2SGd3xRz
         FjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714985382; x=1715590182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+P/KjeibrFZWEkv6+L8YPxuHh9mJNgbeY/rfKylmy8=;
        b=FWKnDQbm75usYwg/8TMIhIPDAaacszDN8JPZ9AmkebEHhXU5ClohCH0sXqI0tqCYUx
         HWSwFLvFxgZMWSkNTcoijuXGys2RnBfx6ZGnlPamxjbDYtjgF7wL71nAPFv6F4sPV8Ev
         +PRjpHAF4nIGs1vkjO0YCAXIA+7lrDrbvIIZkdS9H5YF27JgIMFWmZvwG4bvMgfDALFb
         LTUGttONLwyI48UckotDICbDhdbUGHXKBCq0LVTMkbOgGFv9luADcCyqgYHwFhfYsL7D
         1O5ZZWuuCLfYSySVOkaaF3Bh7+gyAsHdHDkSHNdc1n7o70eJjFYdoEdIc64EmB1zlNc7
         Bn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuLprFj8JDib3503hAemXF57+OszXI7tGNsVpIqL7wX4KLpcd9GetJ4VEZ2L301IrTglq8bgTyrd0ssoDo+Zaqg/SWTjNrjMUujys9fza+8IUMvyCnJlAZijj/IwByEQkqaDM8Dv6ChkQ=
X-Gm-Message-State: AOJu0Yx7E6KqIKoEWU7gN1lANdyYO355o6LWIJu3Yit59BlMyf0LjRF1
	b6RVwFTVXZBNOM4wjIsR5lr85LoMw5GTArDg9wMVvXWIDz7AMgybVr2CMD2TyWGOEMNBO+UH/Wy
	bBpBZoctRMN2BMiLuNgJPcpj8cpI=
X-Google-Smtp-Source: AGHT+IGeec60Vp1v6lhrn7gTHN4m70j+7lgJkd7vr44lhHOV5xgWp2a2fsbD89DvpBkVDZJvLlaoq3wNcAZT4wuEZSs=
X-Received: by 2002:a05:6e02:1c0d:b0:36b:aae:613 with SMTP id
 l13-20020a056e021c0d00b0036b0aae0613mr10103474ilh.10.1714985382163; Mon, 06
 May 2024 01:49:42 -0700 (PDT)
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
 <20240502102643.4ee7f6c2@sal.lan> <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk> <20240503094225.47fe4836@sal.lan>
In-Reply-To: <20240503094225.47fe4836@sal.lan>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 May 2024 16:49:31 +0800
Message-ID: <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org, 
	m.szyprowski@samsung.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 4:42=E2=80=AFPM Mauro Carvalho Chehab <mchehab@kerne=
l.org> wrote:
>
> Em Fri, 3 May 2024 10:47:19 +0900
> Mark Brown <broonie@kernel.org> escreveu:
>
> > On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
> > > Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >
> > > > There are still time control associated with it, as audio and video
> > > > needs to be in sync. This is done by controlling the buffers size
> > > > and could be fine-tuned by checking when the buffer transfer is don=
e.
> >
> > ...
> >
> > > Just complementing: on media, we do this per video buffer (or
> > > per half video buffer). A typical use case on cameras is to have
> > > buffers transferred 30 times per second, if the video was streamed
> > > at 30 frames per second.
> >
> > IIRC some big use case for this hardware was transcoding so there was a
> > desire to just go at whatever rate the hardware could support as there
> > is no interactive user consuming the output as it is generated.
>
> Indeed, codecs could be used to just do transcoding, but I would
> expect it to be a border use case. See, as the chipsets implementing
> codecs are typically the ones used on mobiles, I would expect that
> the major use cases to be to watch audio and video and to participate
> on audio/video conferences.
>
> Going further, the codec API may end supporting not only transcoding
> (which is something that CPU can usually handle without too much
> processing) but also audio processing that may require more
> complex algorithms - even deep learning ones - like background noise
> removal, echo detection/removal, volume auto-gain, audio enhancement
> and such.
>
> On other words, the typical use cases will either have input
> or output being a physical hardware (microphone or speaker).
>

All, thanks for spending time to discuss, it seems we go back to
the start point of this topic again.

Our main request is that there is a hardware sample rate converter
on the chip, so users can use it in user space as a component like
software sample rate converter. It mostly may run as a gstreamer plugin.
so it is a memory to memory component.

I didn't find such API in ALSA for such purpose, the best option for this
in the kernel is the V4L2 memory to memory framework I found.
As Hans said it is well designed for memory to memory.

And I think audio is one of 'media'.  As I can see that part of Radio
function is in ALSA, part of Radio function is in V4L2. part of HDMI
function is in DRM, part of HDMI function is in ALSA...
So using V4L2 for audio is not new from this point of view.

Even now I still think V4L2 is the best option, but it looks like there
are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
a duplication of code (bigger duplication that just add audio support
in V4L2 I think).

Best regards
Shengjiu Wang.

> > > I would assume that, on an audio/video stream, the audio data
> > > transfer will be programmed to also happen on a regular interval.
> >
> > With audio the API is very much "wake userspace every Xms".

