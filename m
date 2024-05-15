Return-Path: <linux-media+bounces-11481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED398C676D
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 15:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC8FCB21AC4
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 13:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1200A85C6F;
	Wed, 15 May 2024 13:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QH1iQLTf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E444585C4E;
	Wed, 15 May 2024 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715780097; cv=none; b=t6lgLZGirKoV6pe1Axc1F/pby+czFZ8CDgYQRBGchF5pZskT86Ox+eMBQ6PDugtrLzdPSFB2QxkkrFBeP2pcm9j1nXakX7QHnjKpjH2XGH0SGk8vc4/LGzVJ3Q5OLiwXNIrzPq6yD+USsY45kU6+pVBYe8sAnxVKcC95ZupJOFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715780097; c=relaxed/simple;
	bh=I+RNBBkXNRun6dwlq79VjFtLu9GasAAvP0Ewzfa3yQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NxQcnTWyPbTbZrSXPPI+EG5ujjZciN+WA+GzYxGqwhHDZ9CoHuraStfJIqKPA7uiUQLRwgdy6p+bDDrrJ2B/8Xi30r3YAXi+1h/7XM6v8tAc5rbfimdxii7FrWadNYUm3a+5g7I9mvoZe0/BA1+s55lIKMxHEDKiVJrlYuatHr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QH1iQLTf; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-36c5d26045bso776215ab.0;
        Wed, 15 May 2024 06:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715780095; x=1716384895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKaNiR2tHzqJJTEKvrwnceIlUex2fFxFPfEzvQnl9LY=;
        b=QH1iQLTflmCophRmBFBBl4ukDwEbt/Ts73+w6sU2TexKo4VBBECHaBt2Ic0L8JMD44
         p+zMQZaRqBdLfvcz1MkMB053v/DRG4BoMFsZRMmQ8lzJgWmMeQrQNA+6NY4PFNs+dGf6
         pEbyVR4SJy6QvosK5RX1rfjXHCkzlkgC06/EhIqZguIlgY16ly/g2beiOKVseo7QBz8a
         vQQ+JP5U5PW0N4C2LAwPPgTxZ+Cz4pb1EjXuXsUOVpa2Rhkat1wRTQ0Iv71kO41BUwGc
         pI+ef2gsJ4Zpkc4zOIB1xeegM1n8NQu0ywRAytS6kZnDisnVyzH7kq5S+1EhX+FlkyFv
         CDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715780095; x=1716384895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKaNiR2tHzqJJTEKvrwnceIlUex2fFxFPfEzvQnl9LY=;
        b=EV/+EeDX/kaK1LYCmw65TsCC5C26odakQcPZBWVterPMTE9gp/9OAsP30EbZROk4xc
         Tg2aEGXy46UDDqusYWd15pI8VEPA1CUDGC2MD4mohjspdS6Mog21wsO+sdcjHP/1ZoL+
         uMBAeGyLawzJyfpkFgG2VQXljBClRIc1+HeOxH4PyaRyCChF6qk44cdwdVfSexKfdX+w
         ku15KOMDUPA+gWcK2sIq0wEiJ24qxAYDaEl8lwSys9/8W1tpDtg6BO0EpsgyMROsLDrI
         Zky6vxhzLaIq4YINflWPso+4E86y02asde2I2zM6pMFmmGpng1Fxhcf7mJ6P8hSZJ6I/
         UxhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtOaxB5HJLtzv3TVxgdN13wJgU5KP/xEljUJA1cnHFfn+HmBLHL7HSjwjYWXmR8rRaLXk1PEPRybC86Dwf7DgsAhDYzKs8Q92ZlKechkrF9rThwF2BfcxcJ07SRihuWKRq5HEYn2Hvv3A=
X-Gm-Message-State: AOJu0YxTb+q1oLrQf5mAov9H4wxnZu6yhi96kyvqfBR9U5SDtGCUQGwD
	/ceDiaYvcf7SLICXBSLN7kNfWSkCHfDtHL7gJnReYmDtw1+hxRVN3nL7xdaM8TkbFsBwxxGzu5o
	6VB0F8E61FpaF2L6J4P0M81th3AE=
X-Google-Smtp-Source: AGHT+IHfRlOUxQoum9oYFbcfElme0a98PvIrTeymgurRG3pRPNQgq34N6O3Htci09zrMSFYrILhaT785x6RkUCQvVK8=
X-Received: by 2002:a05:6e02:12cd:b0:36c:c536:80dd with SMTP id
 e9e14a558f8ab-36cc536824dmr181987035ab.11.1715780095030; Wed, 15 May 2024
 06:34:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <87sez0k661.wl-tiwai@suse.de> <20240502095956.0a8c5b26@sal.lan>
 <20240502102643.4ee7f6c2@sal.lan> <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
 <20240503094225.47fe4836@sal.lan> <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl> <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
 <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com> <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
 <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com> <CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
 <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz> <850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
 <c5dbb765-8c93-4050-84e1-c0f63b43d6c2@xs4all.nl> <8a6f84ac-5813-4954-b852-84f5118e607c@perex.cz>
 <87o7975qcw.wl-tiwai@suse.de> <e63ec6c8-7da7-4b87-b7ff-a71ff12dcfc1@perex.cz>
In-Reply-To: <e63ec6c8-7da7-4b87-b7ff-a71ff12dcfc1@perex.cz>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 15 May 2024 21:34:43 +0800
Message-ID: <CAA+D8AOj2ZkiSg2sXfQypg-xc4f8dMykENu5GoGMx6REGu+WBQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 6:46=E2=80=AFPM Jaroslav Kysela <perex@perex.cz> wr=
ote:
>
> On 15. 05. 24 12:19, Takashi Iwai wrote:
> > On Wed, 15 May 2024 11:50:52 +0200,
> > Jaroslav Kysela wrote:
> >>
> >> On 15. 05. 24 11:17, Hans Verkuil wrote:
> >>> Hi Jaroslav,
> >>>
> >>> On 5/13/24 13:56, Jaroslav Kysela wrote:
> >>>> On 09. 05. 24 13:13, Jaroslav Kysela wrote:
> >>>>> On 09. 05. 24 12:44, Shengjiu Wang wrote:
> >>>>>>>> mem2mem is just like the decoder in the compress pipeline. which=
 is
> >>>>>>>> one of the components in the pipeline.
> >>>>>>>
> >>>>>>> I was thinking of loopback with endpoints using compress streams,
> >>>>>>> without physical endpoint, something like:
> >>>>>>>
> >>>>>>> compress playback (to feed data from userspace) -> DSP (processin=
g) ->
> >>>>>>> compress capture (send data back to userspace)
> >>>>>>>
> >>>>>>> Unless I'm missing something, you should be able to process data =
as fast
> >>>>>>> as you can feed it and consume it in such case.
> >>>>>>>
> >>>>>>
> >>>>>> Actually in the beginning I tried this,  but it did not work well.
> >>>>>> ALSA needs time control for playback and capture, playback and cap=
ture
> >>>>>> needs to synchronize.  Usually the playback and capture pipeline i=
s
> >>>>>> independent in ALSA design,  but in this case, the playback and ca=
pture
> >>>>>> should synchronize, they are not independent.
> >>>>>
> >>>>> The core compress API core no strict timing constraints. You can ev=
entually0
> >>>>> have two half-duplex compress devices, if you like to have really i=
ndependent
> >>>>> mechanism. If something is missing in API, you can extend this API =
(like to
> >>>>> inform the user space that it's a producer/consumer processing with=
out any
> >>>>> relation to the real time). I like this idea.
> >>>>
> >>>> I was thinking more about this. If I am right, the mentioned use in =
gstreamer
> >>>> is supposed to run the conversion (DSP) job in "one shot" (can be ha=
ndled
> >>>> using one system call like blocking ioctl).  The goal is just to off=
load the
> >>>> CPU work to the DSP (co-processor). If there are no requirements for=
 the
> >>>> queuing, we can implement this ioctl in the compress ALSA API easily=
 using the
> >>>> data management through the dma-buf API. We can eventually define a =
new
> >>>> direction (enum snd_compr_direction) like SND_COMPRESS_CONVERT or so=
 to allow
> >>>> handle this new data scheme. The API may be extended later on real d=
emand, of
> >>>> course.
> >>>>
> >>>> Otherwise all pieces are already in the current ALSA compress API
> >>>> (capabilities, params, enumeration). The realtime controls may be cr=
eated
> >>>> using ALSA control API.
> >>>
> >>> So does this mean that Shengjiu should attempt to use this ALSA appro=
ach first?
> >>
> >> I've not seen any argument to use v4l2 mem2mem buffer scheme for this
> >> data conversion forcefully. It looks like a simple job and ALSA APIs
> >> may be extended for this simple purpose.
> >>
> >> Shengjiu, what are your requirements for gstreamer support? Would be a
> >> new blocking ioctl enough for the initial support in the compress ALSA
> >> API?
> >
> > If it works with compress API, it'd be great, yeah.
> > So, your idea is to open compress-offload devices for read and write,
> > then and let them convert a la batch jobs without timing control?
> >
> > For full-duplex usages, we might need some more extensions, so that
> > both read and write parameters can be synchronized.  (So far the
> > compress stream is a unidirectional, and the runtime buffer for a
> > single stream.)
> >
> > And the buffer management is based on the fixed size fragments.  I
> > hope this doesn't matter much for the intended operation?
>
> It's a question, if the standard I/O is really required for this case. My
> quick idea was to just implement a new "direction" for this job supportin=
g
> only one ioctl for the data processing which will execute the job in "one
> shot" at the moment. The I/O may be handled through dma-buf API (which se=
ems
> to be standard nowadays for this purpose and allows future chaining).
>
> So something like:
>
> struct dsp_job {
>     int source_fd;     /* dma-buf FD with source data - for dma_buf_get()=
 */
>     int target_fd;     /* dma-buf FD for target data - for dma_buf_get() =
*/
>     ... maybe some extra data size members here ...
>     ... maybe some special parameters here ...
> };
>
> #define SNDRV_COMPRESS_DSPJOB _IOWR('C', 0x60, struct dsp_job)
>
> This ioctl will be blocking (thus synced). My question is, if it's feasib=
le
> for gstreamer or not. For this particular case, if the rate conversion is
> implemented in software, it will block the gstreamer data processing, too=
.
>

Thanks.

I have several questions:
1.  Compress API alway binds to a sound card.  Can we avoid that?
     For ASRC, it is just one component,

2.  Compress API doesn't seem to support mmap().  Is this a problem
     for sending and getting data to/from the driver?

3. How does the user get output data from ASRC after each conversion?
   it should happen every period.

best regards
Shengjiu Wang.

