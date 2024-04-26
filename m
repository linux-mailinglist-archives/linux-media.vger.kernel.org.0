Return-Path: <linux-media+bounces-10216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9FE8B3535
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 12:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBBCA1F22728
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D46143C4E;
	Fri, 26 Apr 2024 10:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A8/o7vi+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D032142621
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 10:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714126859; cv=none; b=MaZL/iuMyl8X0pq5s11/rBKG6C3DDe1RfqUQleIJnAO0Uxa3lcTVkzfV1U72xXhe7I035n3N6MgSdCvQQkQzOMQG3Ij54boCJkBfH1ZfMRpW7jc7S3H5GYJoaduKrPwzh7AMwGY+SaK1/3ceR8CN5+2aZe4ri75O/2x682U9RzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714126859; c=relaxed/simple;
	bh=IjXJYA5Q88JBRncKCAE8ZYdsQF4jhAftI0NHQOw9IJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFUHr96RIh2kFcOckeVDabTXY0i4CyrpGMQ7ll/2az7kVPqgRYHmEBq9jrwKTKONB0yceKPQ41g42Aurvtz1uyzq6TjV6FW/5DMCurh6VicDlk7dSgE1DTWzOcEKItA19PDffvaiVNTieor0FgGypqF2d2KOXH2sYD1QOiQ7NIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A8/o7vi+; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcc71031680so2016301276.2
        for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714126856; x=1714731656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjXJYA5Q88JBRncKCAE8ZYdsQF4jhAftI0NHQOw9IJE=;
        b=A8/o7vi+E4VKhGkL92v2BIyXvDJ/ltKG+TZGs0bVVt4iLMyP5wXH+jyt8N2HMF+Fps
         9x2kxAiaayPyyQ2dj/18JYq/besN2QlFMz7hz+lxAmhLjKeOW9Zi/0Vudqs7gTV2P5Mo
         GT560I9/cSyv6z5pNyeDbESEz3otbXSbvA4Ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714126856; x=1714731656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjXJYA5Q88JBRncKCAE8ZYdsQF4jhAftI0NHQOw9IJE=;
        b=HbjUtbrgBdMQBnmJS81vrl5gB6XfnUZxLKoKx35EAoHn8oBrh5R0GLNcEePIyO3z1K
         4CMjFmYO72Gt6KFZ1cJwKrXvLygshSdbySokH+7VA4c2xcYMB5eotIpbtYmOFkveDGAq
         SqX0sLaKEebgf1P62fXU79G/2CGS23kuC6Q4sO0qggG+IlZp+XV5GW6xiu7ptdQXSwrb
         OMbvSl99ypwKK51bmrUv3aaxZ+GG5Cey+S4HPyjIqK1aGgb6HsoKDNJprozC6N1UOFvW
         3rC3YVjWOZg7mpXIiRPkQVjeaGq08rSVA443BY81WStcxpqD6p+u0FcBSYGqNI1dKWQw
         /Q1g==
X-Forwarded-Encrypted: i=1; AJvYcCUbVqaBhZKVDa5gM9AE9Cm/3zdi/UVaHT2poJfRA9brfGKz1qXJ0hgVedLaWO4Tm8zTgCxkt/dI0jE7zhO5yqlxqsaGN2ByPFck8mw=
X-Gm-Message-State: AOJu0YxDAUq5q6b6xvwXefF32zZDwqFu2a1GOJa1A9flTeCzSpt1cbcd
	ssDS5hZcwbPqYBxsYgSEyMOTyDlStvcyvk9I76Eha4RereZOQ0FBS3upE+MUUNGw8sMLILFwJ5w
	bBvW+wctIIv3PC5/2OmP8xIWjTKDYs2LY7wbp
X-Google-Smtp-Source: AGHT+IHWnmyJ6qY0q7iyDyA3XOCFfbMc89g4bmjlOa0MiZ8jfng1uljxIs6yB4rlgqQh0CKOxXSCfqT44NRv/pXIOtM=
X-Received: by 2002:a25:800f:0:b0:dcb:e0dc:67ee with SMTP id
 m15-20020a25800f000000b00dcbe0dc67eemr2211823ybk.45.1714126856342; Fri, 26
 Apr 2024 03:20:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240422100354.1.I58b4456c014a4d678455a4ec09b908b1c71c3017@changeid>
 <022936a6704d08fbed22e7f241810d857eecaeda.camel@collabora.com> <CAD=FV=XSyLJiTCHYF7UaLersix0zP-q-MybW+nOR3A2WfccQcg@mail.gmail.com>
In-Reply-To: <CAD=FV=XSyLJiTCHYF7UaLersix0zP-q-MybW+nOR3A2WfccQcg@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 26 Apr 2024 18:20:20 +0800
Message-ID: <CAJ66y9FrpyzEwa1J=5L1OwRkrSBm308g8OZKnasYQcJYJpRbRA@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Alloc DMA memory with DMA_ATTR_ALLOC_SINGLE_PAGES
To: Doug Anderson <dianders@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei-Shun Chang <weishunc@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Tue, Apr 23, 2024 at 2:52=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Apr 22, 2024 at 11:27=E2=80=AFAM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> >
> > Hi,
> >
> > Le lundi 22 avril 2024 =C3=A0 10:03 -0700, Douglas Anderson a =C3=A9cri=
t :
> > > As talked about in commit 14d3ae2efeed ("ARM: 8507/1: dma-mapping: Us=
e
> > > DMA_ATTR_ALLOC_SINGLE_PAGES hint to optimize alloc"), it doesn't
> > > really make sense to try to allocate contiguous chunks of memory for
> > > video encoding/decoding. Let's switch the Mediatek vcodec driver to
> > > pass DMA_ATTR_ALLOC_SINGLE_PAGES and take some of the stress off the
> > > memory subsystem.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > NOTE: I haven't personally done massive amounts of testing with this
> > > change, but I originally added the DMA_ATTR_ALLOC_SINGLE_PAGES flag
> > > specifically for the video encoding / decoding cases and I know it
> > > helped avoid memory problems in the past on other systems. Colleagues
> > > of mine have told me that with this change memory problems are harder
> > > to reproduce, so it seems like we should consider doing it.
> >
> > One thing to improve in your patch submission is to avoid abstracting t=
he
> > problems. Patch review and pulling is based on a technical rational and=
 very
> > rarely on the trust that it helps someone somewhere in some unknown con=
text.
> > What kind of memory issues are you facing ? What is the technical advan=
tage of
> > using DMA_ATTR_ALLOC_SINGLE_PAGES over the current approach that helps =
fixing
> > the issue? I do expect this to be documented in the commit message itse=
lf=C3=A9.
>
> Right. The problem here is that I'm not _directly_ facing any problems
> here and I also haven't done massive amounts of analysis of the
> Mediatek video codec. I know that some of my colleagues have run into
> issues on Mediatek devices where the system starts getting
> unresponsive when lots of videos are decoded in parallel. That
> reminded me of the old problem I debugged in 2015 on Rockchip
> platforms and is talked about a bunch in the referenced commit
> 14d3ae2efeed ("ARM: 8507/1: dma-mapping: Use
> DMA_ATTR_ALLOC_SINGLE_PAGES hint to optimize alloc") so I wrote up
> this patch. The referenced commit contains quite a bit of details
> about the problems faced back in 2015.
>
> When I asked, my colleagues said that my patch seemed to help, though
> it was more of a qualitative statement than a quantitative one.

The story behind this is that I'm looking into an issue on the MediaTek
MT8188 Chromebook, where in some scenarios the system may emit 30+
video decoders concurrently (e.g. generating thumbnails for excess
amount of video files etc.), and such behavior can easily hang the
system if it has a smaller amount of memory (<4GB).

In addition to seeking mitigation in the user space software side,
we're also looking for ways to optimize how the video decoders use
memory, so Doug suggested this improvement.
My preliminary experiment showed that it has some positive impact -
the system doesn't freeze up completely with it and is still
responsive in the UART serial console. However, just like mentioned, I
didn=E2=80=99t have any rigorous numbers to support it.

To test the patch better, today I set up a local WebRTC demo to
simulate a video conference with 49 people where the mocked input
stream is captured from the device's own front camera.
With that, the original system easily hung in less than one minute
with less than 40MB available memory at the time; but with the change,
the system ran for several minutes and had an average of over 100MB
memory. It's not a huge improvement, but it's something.

I know this isn't the most scientific experiment, but I hope it=E2=80=99s a
good enough representation of one of the multi video decoder use
cases, and gives you some confidence that the patch is worth merging.

With the test above I think I can give this:
Tested-by: Fei Shao <fshao@chromium.org>

And, since this patch LGTM and I support it, here's my humble
Reviewed-by: Fei Shao <fshao@chromium.org>

Regards,
Fei

>
> I wasn't 100% sure if it was worth sending the patch up at this point,
> but logically, I think it makes sense. There aren't great reasons to
> hog all the large chunks of memory for video decoding.
>
> -Doug

