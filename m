Return-Path: <linux-media+bounces-11035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1E48BE481
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 427CE288BE3
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CA915F414;
	Tue,  7 May 2024 13:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="jdduwpQ+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139DD15E217
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715089174; cv=none; b=fj+nRIvmvNiCNjN4emqhO2/PfkVf52sLSC69aII+/ObdixnvMKmQHTn91KlRhSdEXPthgghm5etmkQdhgDiEpZ9vm+bDdDVjhV4YJGNfL0wjXAykd72BOUL293tpwtR8LI1CKT0TlvHJjyE7sNzkY1kDJI1A8D0SN2QoWw7l3lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715089174; c=relaxed/simple;
	bh=wtfbGydj7hoFOdn1oKPiMmXA1U1DIaBi6ccHNQcK9Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuhWXh1XkIZKArFU39SMyLWpFFTtUyaqHhgxsNDnaUi+Bryr+ekEVAJkiYPcujgOgnb3r6WSzRz99Gwq8GPPG2cYoavApBAvbhz0pT0R65D9SqUjto/1bHVeW5Dl3iODHrUt1iNWd4MuDsRPYBjd3g4Z9ZVLHA+iRqokM7U7grc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=jdduwpQ+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-34cba0d9a3eso240481f8f.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 06:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1715089170; x=1715693970; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M/ueNO6VgphQOXA5uS4/0Wfhc/WsOURk1MmZZT9vU18=;
        b=jdduwpQ+GlEAIKH6qKFRFaWkStoC37BzPkJjkOo8yrOKJgBlw+/vmuS+llpPPI+r5K
         IWh/Bi0AZqGvXC2dGcxJqCdME1VG2ffqaDHrZmBj2uzx7eGQkQHImo+l4IaNsVx/O5q+
         3+uwuZFuJXVbJK7nmLl8CsaAQeT/SZ97VP5j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715089170; x=1715693970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/ueNO6VgphQOXA5uS4/0Wfhc/WsOURk1MmZZT9vU18=;
        b=H1hSRKEgCmrs/2ZsLDEsMWx9BP/XqfqfCP7aQutyCpXzCAK7nQ3TcMpikxgSK/sp5n
         cq/62FxrveKNIk76eNnvaaVHNngG1lXE1Hzady9Nkl0YOHEhVJb5g7p3oUwMkeQ2pBeL
         tBT4BQWcjJxU4u2g8yhBCn2CUOB8BMDI8BCXqYnZsj+k5vnF51JnSuD7dnPdukW+nHY3
         /8AnQTwOWZp/XVQ/vQomK0k8UWEiAC/NW4eHvgB5C/vy9ldTF+2dTTBy8dXoww+Wk70v
         uwG6VFCWOr7GYnZacriCa379zJxIc1XuvcIO3A2CF68ISGxHYLIvYrXitqA1BPmnwYBX
         8A2w==
X-Forwarded-Encrypted: i=1; AJvYcCWOUZZbNwiWbgWsis/3cYv1oZqUH5723rdYDIWeUdOUIpiMNMViMg2b8JkQkpg+wpsi3gHXqfhJOZqhg2msp21/CdIuLgxtwRw/pjM=
X-Gm-Message-State: AOJu0YylTa8eDibV5XdhuLO6d1AfNWIymrxDHP56V/JWXusf+Bk4eDSC
	scbizigut5fPnHBMj0uXM/m0aWtS5xmTKVl09LaN7Sl+a36n/zlDrUND28vZBpY=
X-Google-Smtp-Source: AGHT+IFFkAJxLxOoCG8nFFCsSuXqv/YiZ7tcMHz5O7ctQR4tHzkmXOo+SmkFGR5DkNaIUKepBhk//Q==
X-Received: by 2002:a05:600c:5118:b0:418:9941:ca28 with SMTP id o24-20020a05600c511800b004189941ca28mr9213068wms.2.1715089170283;
        Tue, 07 May 2024 06:39:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h18-20020a056000001200b0034c78001f6asm12974839wrx.109.2024.05.07.06.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:39:29 -0700 (PDT)
Date: Tue, 7 May 2024 15:39:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>,
	Charan Teja Kalla <quic_charante@quicinc.com>,
	zhiguojiang <justinjiang@vivo.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
Message-ID: <ZjovD5WaWjknd-qv@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Charan Teja Kalla <quic_charante@quicinc.com>,
	zhiguojiang <justinjiang@vivo.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
 <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
 <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com>
 <289b9ad6-58a3-aa39-48ae-a244fe108354@quicinc.com>
 <CABdmKX3Zu8LihAFjMuUHx4xzZoqgmY7OKdyVz-D26gM-LECn6A@mail.gmail.com>
 <8ca45837-cbed-28da-4a6f-0dcec8294f51@quicinc.com>
 <83605228-92ee-b666-d894-1c145af2e5ab@quicinc.com>
 <CABdmKX2MWU9-9YN46PXx-Jy-O9CHMv8hCkvArd7BbWUBs=GPnw@mail.gmail.com>
 <8915fcc1-d8f1-48c2-9e51-65159aaa5a3b@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8915fcc1-d8f1-48c2-9e51-65159aaa5a3b@amd.com>
X-Operating-System: Linux phenom 6.6.15-amd64 

On Tue, May 07, 2024 at 12:10:07PM +0200, Christian König wrote:
> Am 06.05.24 um 21:04 schrieb T.J. Mercier:
> > On Mon, May 6, 2024 at 2:30 AM Charan Teja Kalla
> > <quic_charante@quicinc.com> wrote:
> > > Hi TJ,
> > > 
> > > Seems I have got answers from [1], where it is agreed upon epoll() is
> > > the source of issue.
> > > 
> > > Thanks a lot for the discussion.
> > > 
> > > [1] https://lore.kernel.org/lkml/0000000000002d631f0615918f1e@google.com/
> > > 
> > > Thanks
> > > Charan
> > Oh man, quite a set of threads on this over the weekend. Thanks for the link.
> 
> Yeah and it also has some interesting side conclusion: We should probably
> tell people to stop using DMA-buf with epoll.
> 
> The background is that the mutex approach epoll uses to make files disappear
> from the interest list on close results in the fact that each file can only
> be part of a single epoll at a time.
> 
> Now since DMA-buf is build around the idea that we share the buffer
> representation as file between processes it means that only one process at a
> time can use epoll with each DMA-buf.
> 
> So for example if a window manager uses epoll everything is fine. If a
> client is using epoll everything is fine as well. But if *both* use epoll at
> the same time it won't work.
> 
> This can lead to rather funny and hard to debug combinations of failures and
> I think we need to document this limitation and explicitly point it out.

Ok, I tested this with a small C program, and you're mixing things up.
Here's what I got

- You cannot add a file twice to the same epoll file/fd. So that part is
  correct, and also my understanding from reading the kernel code.

- You can add the same file to two different epoll file instaces. Which
  means it's totally fine to use epoll on a dma_buf in different processes
  like both in the compositor and in clients.

- Substantially more entertaining, you can nest epoll instances, and e.g.
  add a 2nd epoll file as an event to the first one. That way you can add
  the same file to both epoll fds, and so end up with the same file
  essentially being added twice to the top-level epoll file. So even
  within one application there's no real issue when e.g. different
  userspace drivers all want to use epoll on the same fd, because you can
  just throw in another level of epoll and it's fine again and you won't
  get an EEXISTS on EPOLL_CTL_ADD.

  But I also don't think we have this issue right now anywhere, since it's
  kinda a general epoll issue that happens with any duplicated file.

So I don't think there's any reasons to recommend against using epoll on
dma-buf fd (or sync_file or drm_syncobj or any of the sharing primitives
we have really).

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

