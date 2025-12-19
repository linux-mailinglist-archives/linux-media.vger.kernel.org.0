Return-Path: <linux-media+bounces-49129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7677ECCE3B7
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 03:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A542830B244E
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 02:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496D428C5D9;
	Fri, 19 Dec 2025 02:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OK2f1pa4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CBD272E6D
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 02:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766109696; cv=none; b=SO1nlYSRjXzIP7WB5JwgMcQT9iVrKjATAa9SBvDG7O+Zvt1HPTH+WAJbGFwkTlz30kV9PR5Wv0YqJzXg2YDHZm3pHDF2sIYjSoy9pfsqLfKOnevAlNNsbmEi8Ov6NZTff28/MK/bwkPIo0BsSNLUw8mU9jLcIJH0LmXskYN6J1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766109696; c=relaxed/simple;
	bh=fZRudTgySxYe/CrjUD5EmylPwBD7opokZ8J25uQuhPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxoJDPOXyqTHJw8zr4LhhNBWh8QZG1TWBt9sGBwO4ckYIHfrn/pfAwUvmO3hvI5rSm5OlnMDM3a8LHLSz8HGbU/96m//HIVYKG4RV/Gb08WmwU7M++kT5UbqcbkwSEMiMqEvIXj73nh5WmmbKIiwl9eJROHKN3RT2Zyrz+XfNJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OK2f1pa4; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8888546d570so17133866d6.2
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 18:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766109694; x=1766714494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcLE5AK2L2L2p2oQxJjqlFsV51u8LwSkNncb+3YhS6E=;
        b=OK2f1pa4J3h44h8su5qWqjH14LjipuBZcXDLvuF0JLi0Thwy7n+zw0oAVraLLIOBgy
         YZcp3Rg1y8ozAXLqyF2IG3hP7IoF5i88bbjq3dTI3Eu3z9Wqz5phpG+iHGFbcah4xxwt
         0/+oFVUrk0aTGyDYRttnKDI7PDNVZ4hnHbNsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766109694; x=1766714494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LcLE5AK2L2L2p2oQxJjqlFsV51u8LwSkNncb+3YhS6E=;
        b=XYmv4Jj/IFpO/LG6Vd3S79EUE8cverXGnKBlOVbwhdn1+qtcwpxex05XT+wrtsEQZq
         yHgF3HdfzGQiCyhS3lGSigU3EKGAgwfSZ6vHyzpK0DXfETSvNXbRSJCxDugwcgoDOkZF
         lKq4/Zdl2vAq5TuOnuypP+UZQfXel5u0P77UDCsaE4RtuBMUxpfCr8soyJz/qnLHOjep
         DqKPHDMmzFW9uy30VFT0TjtEq0HTrxwIMEqIr9CUqIijCJIOoeoFCHpyrp8H6fgeeUu8
         VUS1k1mcF2RYsAc2eGWyUbGgZVFHOkzMKGtvlKKb+zY9mgLwNJ/Qm2jfvZz4BBFJa4ZJ
         Y3qA==
X-Forwarded-Encrypted: i=1; AJvYcCV/g+E1b9H61+qEJ6I029J7BhoqeP2M0TiQKz0bd2gFhABXmS4NP4Xnu1JrDCl20InRD6A66INRjUWjYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS3/dT+b5A9/6kcXbihVSBNVdphqKpl83evtP54j8kyP/0cM8V
	a44Z0/3Xozy59tVuNLJA4iwVf0m4LMeu2czM2QFdEyyKaFia3slMFvcZzIjTlS7K6H5mN5hhDa0
	X+JqY2NoC0Zf2ip+52nYTu73zD1esVZFiXfE3TCw9
X-Gm-Gg: AY/fxX6qstvQBB11zqAIsYNtgNsR8cLxvaNOwBskGGd1nxfNoPVPnH3PVJOSyvcT5Wq
	QzXGezKU6Nk5bSLUvNrvEBvAifYF2pTD/9nZnd/7y9GkqG634s7oipm4pZp18kmqDPKmab0iemK
	6eoE7e9XaHso3yTF9IPUm5w7U9gs2RSNV7crlWbjpDGUGdouFGSQ5HD2tj0iZZxG4Bnlzy/KUX9
	vMAcr3+h1G3B/3zz7Wi/jBHrgn+GGfbdhm5sQFDtTgYJAkNzx4SVKDA+y/uMGqYiaw4Ek+o8hnN
	dHjq0s9ShSAfprn+u86erEBQjA==
X-Google-Smtp-Source: AGHT+IEHZ5k+QVc9g3WAsyccts6kjss3L2S29IeeqQvgIkbtxlipWJKikq0gB9izmN9gLaHMDdnyvx8KyOoLT1/18Qc=
X-Received: by 2002:ac8:5cca:0:b0:4f1:b948:ccd8 with SMTP id
 d75a77b69052e-4f4abcd2a84mr18514611cf.18.1766109693703; Thu, 18 Dec 2025
 18:01:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220322132329.6527-1-dmitry.osipenko@collabora.com>
 <dd22c40e-1200-42f7-8c48-63534f759045@chromium.org> <5d367bbb-551f-4164-8473-a6c4b68793c0@kernel.org>
 <CAO5uPHPKLxySgwWUi6w0Nm-PbDSPkN=OySbLK8wNKwXdp3p1Rg@mail.gmail.com>
 <e265d412260226be67df3bfb0dd05bb74e36d551.camel@ndufresne.ca> <221d3f70-b418-4f89-b352-773c544ed428@kernel.org>
In-Reply-To: <221d3f70-b418-4f89-b352-773c544ed428@kernel.org>
From: Hirokazu Honda <hiroh@chromium.org>
Date: Thu, 18 Dec 2025 18:01:17 -0800
X-Gm-Features: AQt7F2qGwfln2-nPU2eg2MQhVO38vM_N6lQli2qwuGffodK8SuqgxVl99Eky59o
Message-ID: <CAO5uPHMX1NVh6sXhs_Ar8id2NwKCfAu3SDu2ABsQS0agWaObrw@mail.gmail.com>
Subject: Re: [PATCH v1] media: videobuf2: Allow applications customize data
 offsets of capture buffers
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Nicolas,

I am also looking forward to your RFC too!

Regards,
-Hiro

On Wed, Dec 17, 2025 at 2:02=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
>
> On 15/12/2025 21:56, Nicolas Dufresne wrote:
> > Hi Hirokazu, Hans,
> >
> > Le vendredi 12 d=C3=A9cembre 2025 =C3=A0 15:15 -0800, Hirokazu Honda a =
=C3=A9crit :
> >> Thanks Hans for your quick response.
> >> And I apologize for my late reply.
> >>
> >>> So that's were I am: I'm not opposed to supporting this feature, but =
I
> >>> feel that struct v4l2_buffer has reached end-of-life, and that it is
> >>> time for a modern replacement.
> >>
> >> I got it.
> >> I will discuss in my team if I can contribute to v4l2_buffer_ext work
> >> or sponsor that work next year or in 2027.
> >
> > I share Hans feeling in regard to trying to force partial support for
> > data_offset into some space left of v4l2_buffer. This brought me thinki=
ng that
> > doing that, or even v4l2_buffer_ext as last proposed was not the right =
solution
> > to modernize the old V4L2 framework. In fact, I believe that v4l2_buffe=
r_ext
> > would simply replicate the MPLANE disaster, leaving another permanent s=
car in
> > the API. Just to state simply, MPLANE have lead to duplication of every=
 multi-
> > plane pixel formats, solving some plane alignment issue in multi-alloca=
tion
> > cases, but leaving behind the common single allocation case.
> >
> > For me, the most central issue in V4L2 is that the memory allocation/im=
portation
> > is bound to the operation queues. That brings all sort of issues such
> >
> > - We can't queue twice the same frame
> > - We can't mix external buffer with device allocated buffer
> > - All buffers must have the exact same stride
>
> The three limitations above are all technically possible to implement wit=
h the
> current vb2 framework/streaming uAPI, it's just that nobody was ever moti=
vated
> enough to add support for it.
>
> > - Application is responsible for caching which memory goes to which v4l=
2_buffer
>
> True, but is this really a big deal?
>
> > - Attempting to import a buffer requires a free spot in the queue
>
> True.
>
> >
> > This adds on top of the v4l2_buffer structure limitation we have been t=
argeting
> > so far. With the growth of modern standard API (think Vulkan Video nota=
bly), it
> > becomes apparent that the model is too inflexible. This inability to se=
parate
> > memory allocation and importation from operations creates a lot of comp=
lexity in
> > user-space, leading to complicated bugs.
> >
> > I've been quite about it, since until now I didn't have a solution in m=
ind, but
> > I recently come with some ideas. I'll will try develop these ideas, at =
least in
> > prose for now and come up with an RFC, hopefully somewhere beginning of=
 January
> > 2026. That my proposal is accepted or not isn't quite relevant. But hop=
efully it
> > will be a starter to go go beyond just fixing what we see. In fact, thi=
s next
> > step is for me doing to be quite decisive if I continue doing codecs in=
 V4L2 or
> > not in the long run. But I'm sure this is not just about video codecs.
>
> I'm looking forward to your RFC!
>
> What is important for me is that whatever we come up with, it is somethin=
g that
> existing drivers can easily support. A new streaming/buffer allocation uA=
PI that
> can only be supported by new drivers will need very, very good reasons fo=
r it to
> be accepted.
>
> The nice thing about the v4l2_buffer_ext proposal was that it can easily =
be
> supported by all drivers.
>
> From a technical perspective both struct v4l2_buffer and struct v4l2_form=
at have
> reached end-of-life: they are full of historical cruft, they are ineffici=
ent, the
> 32-bit/time32 compatibility code is awful and hard to maintain.
>
> Regards,
>
>         Hans
>
> >
> > regards,
> > Nicolas
>

