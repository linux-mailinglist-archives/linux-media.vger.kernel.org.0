Return-Path: <linux-media+bounces-11095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D18BEAFE
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 20:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A14F31F21773
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C4016C87D;
	Tue,  7 May 2024 18:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GXDI3QbS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3915ECC6
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 18:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715104850; cv=none; b=ohr0ZAohb6f/W59tEkKRa7+oYNxR4S/2M78IEBISPR2wx1bERFWJ7RynNS/DePpNOw3IVCSDzDZEeQJNr+dFRYf8n9TSdDCzQI4IpkfFaiRdEucHAkTIWO/7vjzDyR/QVDxk4q3w3TshAhh0yW/Np7Drc8SQM8yMAuuitcI19l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715104850; c=relaxed/simple;
	bh=SrBJtaDxX4rLGSaJtZXCxh87ShbEo2DG2RkklX3dRTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6ddNw3PW5pDuOm0k7FHIf3ah/kL/bZ/RFmVMmPmVxHp8y1FkCQBChqk3yw1uFmgWA8IOrECwHwHyjGR1TMcJlNXqYcZhhfp0b/vA/C0fDGZpjMdaUpnXVYrvAHtMECBYqonfmPKCBeQ/TtRs4jm/im5InmMLtbJtF2kRMz6TTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GXDI3QbS; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-deb99fa47c3so1921756276.2
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 11:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715104847; x=1715709647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HL+ln2vLAazbLqwL47bYmOmnDjxG1bXnX9QaBIaL77Y=;
        b=GXDI3QbSYwRk8FIum8s2zKXXVIWecjGyLuvqA01wpk2fSUTgfAvlt000rReq3Z+fyC
         xMquVe9bnNoDKCAMgBy1n9OKFrop8oI3u9TDPCpCCJJQceJFTgjkpcSqAX5a+MXYmXPv
         4Wb3zTyg64xXJtBoTMHtmcFX204kj+2SWPGD2FjcQi25kvkRWRuxoYV2IyvHOzaxh2U8
         IBzwJVM75XJv6t7mdYQD+tnH0d23bdOHC+K0EDMLQvo2A0eTBFFZM9TONfzuXjfVTEKo
         juuX1eWXVxuhy+erZUuFnbbxlhF5aaw5GD/ehlyF4kbHylkAZ89j8hzSDyAI5Lsmigcl
         PvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715104847; x=1715709647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HL+ln2vLAazbLqwL47bYmOmnDjxG1bXnX9QaBIaL77Y=;
        b=XFVzIi4rpmOrsOZf4oJxBoWz+BSqTPTwzkhWnsHBcVPsjdIexfJmRJ3espOEuEva97
         m/Tlb8xYDOTMkx0CGK0jS4Wn3gEg18OQ2T2OmNFlAx77/Y3sRlBmjMCPEFPDwFf21pT4
         jNaUm3s5vGd/cWdiV+V+CAYE1ainEiolPaKgzWvGlK+vixJzXnu8WruTamSifBFXMv7y
         FnHikhSHif3MlAQL0WDIU4QjWDzQXdywPAlOP22sKV+4x6WrmksSBIu3tBhTQwgjoW0n
         2rIOIydXhQ5WiGlW+HANbBCGCzgNoPIXVYqnjG4/PXUAbNSC/Fpce0/xMncLNJc/CUzl
         0j5A==
X-Forwarded-Encrypted: i=1; AJvYcCW/py5wZ6l8DxwFR4zqdrv9sWK4HQ73gNmrbM1SMJTLUOEveGFY7YKyMmX4owvS8D2dwqeUuo0/GTm2eccDtYziJxp35DVhntTYAyw=
X-Gm-Message-State: AOJu0YyHdoZqZCxJcLrKdFISlQMTbXYS7dBWK+gX/hawYamYuOUmeHmq
	ZLGG9zqHfh+IGy1Ieq2NfhyMwN5H1QauOwIM//g0V9brVpgeGZ8u7+cvo23CinqLSpMOXnokdjA
	ShhehyPJPYCPhiXZU3CgRXsvPvnaoywjWXuF7
X-Google-Smtp-Source: AGHT+IGIGFru+LOx4cY9EsrZp/X/+zrxiy5UoCJnZGTW/H4TVQQOuIByLlX2TxCmmFQ9x8W3Bkc7Lsm3wP/ljInKJtk=
X-Received: by 2002:a25:e303:0:b0:de6:327:fa2 with SMTP id 3f1490d57ef6-debb9d6cdbcmr404346276.8.1715104847273;
 Tue, 07 May 2024 11:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com> <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
 <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com> <289b9ad6-58a3-aa39-48ae-a244fe108354@quicinc.com>
 <CABdmKX3Zu8LihAFjMuUHx4xzZoqgmY7OKdyVz-D26gM-LECn6A@mail.gmail.com>
 <8ca45837-cbed-28da-4a6f-0dcec8294f51@quicinc.com> <83605228-92ee-b666-d894-1c145af2e5ab@quicinc.com>
 <CABdmKX2MWU9-9YN46PXx-Jy-O9CHMv8hCkvArd7BbWUBs=GPnw@mail.gmail.com>
 <8915fcc1-d8f1-48c2-9e51-65159aaa5a3b@amd.com> <ZjovD5WaWjknd-qv@phenom.ffwll.local>
 <44b08793-cf44-4cbd-a3bb-583af351ab9e@amd.com>
In-Reply-To: <44b08793-cf44-4cbd-a3bb-583af351ab9e@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 7 May 2024 11:00:35 -0700
Message-ID: <CABdmKX3SpOk4BQU6i31r8jHc1f-o8sz7rXgtRyhTQZ4GJYHH=Q@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Charan Teja Kalla <quic_charante@quicinc.com>, zhiguojiang <justinjiang@vivo.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 7:04=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 07.05.24 um 15:39 schrieb Daniel Vetter:
> > On Tue, May 07, 2024 at 12:10:07PM +0200, Christian K=C3=B6nig wrote:
> >> Am 06.05.24 um 21:04 schrieb T.J. Mercier:
> >>> On Mon, May 6, 2024 at 2:30=E2=80=AFAM Charan Teja Kalla
> >>> <quic_charante@quicinc.com> wrote:
> >>>> Hi TJ,
> >>>>
> >>>> Seems I have got answers from [1], where it is agreed upon epoll() i=
s
> >>>> the source of issue.
> >>>>
> >>>> Thanks a lot for the discussion.
> >>>>
> >>>> [1] https://lore.kernel.org/lkml/0000000000002d631f0615918f1e@google=
.com/
> >>>>
> >>>> Thanks
> >>>> Charan
> >>> Oh man, quite a set of threads on this over the weekend. Thanks for t=
he link.
> >> Yeah and it also has some interesting side conclusion: We should proba=
bly
> >> tell people to stop using DMA-buf with epoll.
> >>
> >> The background is that the mutex approach epoll uses to make files dis=
appear
> >> from the interest list on close results in the fact that each file can=
 only
> >> be part of a single epoll at a time.
> >>
> >> Now since DMA-buf is build around the idea that we share the buffer
> >> representation as file between processes it means that only one proces=
s at a
> >> time can use epoll with each DMA-buf.
> >>
> >> So for example if a window manager uses epoll everything is fine. If a
> >> client is using epoll everything is fine as well. But if *both* use ep=
oll at
> >> the same time it won't work.
> >>
> >> This can lead to rather funny and hard to debug combinations of failur=
es and
> >> I think we need to document this limitation and explicitly point it ou=
t.
> > Ok, I tested this with a small C program, and you're mixing things up.
> > Here's what I got
> >
> > - You cannot add a file twice to the same epoll file/fd. So that part i=
s
> >    correct, and also my understanding from reading the kernel code.
> >
> > - You can add the same file to two different epoll file instaces. Which
> >    means it's totally fine to use epoll on a dma_buf in different proce=
sses
> >    like both in the compositor and in clients.
>
> Ah! Than I misunderstood that comment in the discussion. Thanks for
> clarifying that.
>
> >
> > - Substantially more entertaining, you can nest epoll instances, and e.=
g.
> >    add a 2nd epoll file as an event to the first one. That way you can =
add
> >    the same file to both epoll fds, and so end up with the same file
> >    essentially being added twice to the top-level epoll file. So even
> >    within one application there's no real issue when e.g. different
> >    userspace drivers all want to use epoll on the same fd, because you =
can
> >    just throw in another level of epoll and it's fine again and you won=
't
> >    get an EEXISTS on EPOLL_CTL_ADD.
> >
> >    But I also don't think we have this issue right now anywhere, since =
it's
> >    kinda a general epoll issue that happens with any duplicated file.
>
> I actually have been telling people to (ab)use the epoll behavior to
> check if two file descriptors point to the same underlying file when
> KCMP isn't available.
>
> Some environments (Android?) disable KCMP because they see it as
> security problem.
>
Didn't know about this so I checked. Our kernel has CONFIG_KCMP, but
seccomp does look like it's blocking kcmp for apps.
https://cs.android.com/android/platform/superproject/main/+/main:bionic/lib=
c/SYSCALLS.TXT

