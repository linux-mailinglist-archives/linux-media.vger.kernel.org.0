Return-Path: <linux-media+bounces-49445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4603ACDB748
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 07:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27D54302B107
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 06:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895A330B50C;
	Wed, 24 Dec 2025 06:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="irvCp6vO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F5026C3A2
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766556568; cv=none; b=I83WeF1apQuCCXkma6OEcYx7B+Ipj9UA2KIo5l+sAzapzNEo6LA5bicBQYISgcQ81vZh2g26H3FFbgyVDCD1ISCXmsWvMaK31x5iSVdL0YxxZ6hrbsyoYFg9XR0QXuD/uczXH+o1yiLJRLaMbaShQmMqWjW+2OPkh8y1dQp4pi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766556568; c=relaxed/simple;
	bh=6tfiHpM9GIRNr5rkrlrI9oYtRLQfBOY4ysoXnCSFhAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIRrqIp801jZsn0qtW2drTW1fHH+UxY41Smq+nONqEx7QJ0c2ILc3bHcJlCqppxO7Byh5U6Pq/l3MbQtIf/IULFLJfiTOeQkAKkx1mkdhXIzmvNUhZBJAkrNU7hIxpviiLOBuZRCt5LYkYINNppxsiAkUX227wimlNEUaAycv7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=irvCp6vO; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88888d80590so87094496d6.3
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 22:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766556565; x=1767161365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tfiHpM9GIRNr5rkrlrI9oYtRLQfBOY4ysoXnCSFhAo=;
        b=irvCp6vOEXdtBOVrP0qFZk2S4YbY7JNvejqMCErcqX7WiwWIeW9zC7/e0YMTyREWUY
         gl/W4bAcVFhBr4AMpwadHs5m7GmNjsV7quF45MUQ4bRMwXJlcOQYIxjcgZsJeUBH/HCC
         XO6T/TQG7uBwNM2tlmnuR7apNN+QMt76/RJxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766556565; x=1767161365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6tfiHpM9GIRNr5rkrlrI9oYtRLQfBOY4ysoXnCSFhAo=;
        b=KecKbkfC8JCT/lXD0FG5qNLQP4Yv9lqA0akmfpIFwJNSxbyRKPBjbkZjCclatEMOC4
         jTtg0r1Oo5C26lIQzy6xqa9BEqiJAtr65rG4xICN8eeXrrQU2PfhAUC7dGY33ZzuG0HI
         6bovgs3cKr0zctR2oXgrYOVqBjZd0H5JJAsjQ3EpLHZmjBktGVGhz+Bi2fyaPFdvAJlN
         C8ULrGIRXXYzzHK0Zu2LY5566laJmcSLbhVwipZue+3RnbXhd2L9duK80N8Wb+XVE0JH
         yWvBZWtP48wAJOzDLb9/sSIZz5AFiPLmTjmHdRDv7UwrNgHmB26rrRy0x2766F29XENd
         4HPg==
X-Forwarded-Encrypted: i=1; AJvYcCXa3lJ/32YzmUlVsJNJb+GHrFJvl8hjVU0RpfvlNVmChachneK0iQQyaYeLbkaUU/32aYgVA4l2G3jH6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLlnh3zIaimago59xDFaXUq6OSLEfdv819F9saThsvJkHuKiqm
	O4mqGk7pZQMYWScINvqgsAuUAfurO+/eXWpoz+G0duZ2SuC1lsoS1zhWlCvSWhhbZusi/G6Fv42
	8oVBCgw==
X-Gm-Gg: AY/fxX4eJjowVhptORFk+xy89w6F+MevzfBeOHEilEjUzsQ9ECw3AfQ4Gil4nK8Dgzy
	bp28mOeGw2JZ/bBHO2D2lvdS5XxlGk0t96nEW+5l+EYx7YfHqYN4ZSYOe+YiY4Rfb/H1lDKS1xe
	u03RmF2HEQufQKCWm5aDTuY6daDCrlHU3m42510bSjwbBQX4JSnz5AT1aCstj8zErdLBgc+flpL
	jW/2Wy4D+ovpyWQ6fVil5eSuIg4SMkTHJwxRk+jwd9KCkcTkr8cfy4t8HYG+Sf8aAf+TVh0hZuQ
	ddUNgImRgoz+G11CZ5dsia+kmwV3TA5YYJbFaMDHomUJ0l0SJlDgGT34wchx5zjW6X1UKaxGgAi
	X++1PZKC4zdtMY2gVcYhyNYgVvH/+nC32BwVPIyiNk5FavaYM6MY0eiIiGb0kFqHZ/Lts5UarZm
	cNFKxzEGUc3lZC4uy0+ZUWkUzK/BXpgJDUn6Nj9VAJrbeS1/VrPw==
X-Google-Smtp-Source: AGHT+IHgdyoqKLCm4IsH8+230MgYKSeOe8mqL29z1AbQxiOzgIdGtQ0n5izFLFNbrHhYdgOlCyRMtA==
X-Received: by 2002:a05:6214:1247:b0:888:1f18:7a0a with SMTP id 6a1803df08f44-88d85ca2f01mr297501196d6.23.1766556564842;
        Tue, 23 Dec 2025 22:09:24 -0800 (PST)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623fe52sm118563816d6.11.2025.12.23.22.09.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 22:09:23 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ee147baf7bso1928841cf.1
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 22:09:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUW0vJqAhO6x+/sfGXaVphSWLFKeUJg8sbxsYyMlnQnLdM5ukJAFT3wZbE76g1KL5AVe7/OecRfcZnnKA==@vger.kernel.org
X-Received: by 2002:ac8:57c2:0:b0:4f0:2e33:81aa with SMTP id
 d75a77b69052e-4f4e5f62fc7mr3602951cf.11.1766556562522; Tue, 23 Dec 2025
 22:09:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220322132329.6527-1-dmitry.osipenko@collabora.com>
 <dd22c40e-1200-42f7-8c48-63534f759045@chromium.org> <5d367bbb-551f-4164-8473-a6c4b68793c0@kernel.org>
 <CAO5uPHPKLxySgwWUi6w0Nm-PbDSPkN=OySbLK8wNKwXdp3p1Rg@mail.gmail.com>
 <e265d412260226be67df3bfb0dd05bb74e36d551.camel@ndufresne.ca>
 <221d3f70-b418-4f89-b352-773c544ed428@kernel.org> <a25fd4e7aca4f49e0793698915dbb5fe99bbe8f2.camel@ndufresne.ca>
In-Reply-To: <a25fd4e7aca4f49e0793698915dbb5fe99bbe8f2.camel@ndufresne.ca>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 24 Dec 2025 15:09:04 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BaEt0d_Xury-taUbmzU++5La8y65+=Zie-QFNyEY9BEg@mail.gmail.com>
X-Gm-Features: AQt7F2pWOYi3RxhXxff2R_RUg1mq5JfxEPuAkyluvv_k08tZBx6ONoUWPR1pq4A
Message-ID: <CAAFQd5BaEt0d_Xury-taUbmzU++5La8y65+=Zie-QFNyEY9BEg@mail.gmail.com>
Subject: Re: [PATCH v1] media: videobuf2: Allow applications customize data
 offsets of capture buffers
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Hirokazu Honda <hiroh@chromium.org>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 20, 2025 at 12:18=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresn=
e.ca> wrote:
>
> Hi Hans,
>
> Le mercredi 17 d=C3=A9cembre 2025 =C3=A0 11:02 +0100, Hans Verkuil a =C3=
=A9crit :
> > > For me, the most central issue in V4L2 is that the memory allocation/=
importation
> > > is bound to the operation queues. That brings all sort of issues such
> > >
> > > - We can't queue twice the same frame

I think one could just call QBUF with the same buffer index twice (or more)=
.

> > > - We can't mix external buffer with device allocated buffer

VIDIOC_CREATE_BUFS accepts a memory type, so one could use it to
create ranges of indexes for different buffer types.

> > > - All buffers must have the exact same stride

This one is less straightforward because V4L2 currently specifies
stride as part of the format, not the buffer. In general, buffers in
vb2 are just memory planes; and only specific video operations
interpret them as a particular format.

So, this is where we might need a brand new UAPI. Although one could
also argue that VIDIOC_S_FMT should only apply to buffers that are
about to be queued, so one can just call it before queuing a buffer
that has a different stride than previous buffers (worst-case
scenario: before every VIDIOC_QBUF).

> >
> > The three limitations above are all technically possible to implement w=
ith the
> > current vb2 framework/streaming uAPI, it's just that nobody was ever mo=
tivated
> > enough to add support for it.
>
> I don't see how technically it is possible without new uAPI to support
> heterogeneous strides, nor queuing twice the same frame while running in =
MMAP,
> or mix device memory and externally imported memory. Please feel free to
> enlighten me if you have some spare time.
>
> Perhaps worth to mention that this is about doing this without creating g=
litches
> or jumps cause by expensive drain and streamoff/on sequences.

Some random ideas above ^ :)

>
> >
> > > - Application is responsible for caching which memory goes to which v=
4l2_buffer
> >
> > True, but is this really a big deal?
>
> Maybe a lesser deal, but its extra complexity for both sides. The current=
 bug
> being that if you use import mode only to workaround "queuing twice" issu=
e, you
> will endup with two mapping (which in some stateful codec firmware is not
> allowed by firmwares). So on top of the lookup userspace is doing to matc=
h
> buffer ids to their memory (have to cache pointers and fd and all), the d=
river
> (or vb2) should also implement caching. My proposal imply solving that du=
al
> mapping issue for both current and future stream mode.
>
> In userspace, there is also cases, where the video buffers comes from oth=
er
> process, and you don't really know if two FD values points to the same dm=
abuf.
> This is the kind of scenarios the DRM subsystem had to deal in compositor=
s, in
> our case that would be something such as pipewire. This caching is either=
 micro
> optimization or simply to support firmware limitation, but a guarantee to=
 have 1
> memory object for one chunk is in my opinion achievable and allow reducin=
g
> complexity.

This is actually a big deal because, with DMA-bufs, the video code
often only receives file descriptors and no unique buffer identifiers.
Consequently, the video code has no reliable way to determine which
physical buffer a received file descriptor maps to.

And of course if one doesn't match the buffers with the indexes, they
get thrashing of vb2 mappings and a bad performance penalty.

Comparing that to the DRM UAPI, the import (prime fd to handle)
operation always returns the same buffer handle if a buffer is
imported more than once, which uniquely identifies the physical buffer
and can be used for this kind of mapping optimization tricks.

Alternatively, we could fix this in the kernel by separating vb2
mappings from buffer indexes and associating them with DMA-buf
attachments instead, but last time I spent some time evaluating that
it led into some complex lifetime management issues, e.g. when to
destroy such a mapping.

Best regards,
Tomasz

