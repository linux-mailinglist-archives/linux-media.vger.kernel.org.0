Return-Path: <linux-media+bounces-10802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5D58BC39C
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 22:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FE7E282417
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 20:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF2376049;
	Sun,  5 May 2024 20:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Yj/XVRsP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F111757E8
	for <linux-media@vger.kernel.org>; Sun,  5 May 2024 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714940233; cv=none; b=rqa9c7RbdRw0MhIgOdhWHP1UNpj8CtnkQOGC9U5PjF2+ZHhs2zS4lWRLrwbxs7eyzx5GLaBitj/YDV3BE78yvzi0Lk9BGbWqSse3V9m6fI+UQLGMvmTEqI7gurbFOS0rDRS7Zz36rTSEOxu1GJlfsyJWS1AG28IAqRW0fdHGPGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714940233; c=relaxed/simple;
	bh=YVUUiZWgMhQe0Pv8Ng+UCkY3LYOanihQ0/5fJzF5CqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjBmGU+r16icZU0LS9II7zZ82T0CzFpltVcy/wDtBIuZ3RcWLfi+dUcP3OXCs3NCjA+odIC5AtdqcHf6ZUyxqh6zj+w8RkFZNOiJNm67Of9dMIjU9MEfwaq9M7An8ywNf2y0F2VIOdToN4BiRRNbqAzL0WKRid6WOCcLWIY0UnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Yj/XVRsP; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51f4d2676d1so1334102e87.3
        for <linux-media@vger.kernel.org>; Sun, 05 May 2024 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714940229; x=1715545029; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=89jyKA3wApx9BQCfs5IiJWmwTiyjcjG5A1RQj5E06Fo=;
        b=Yj/XVRsPoHQclWkYlJeFEpSMLCXSn2G3AKzITQiSHuYkt5wE8L+bpo86Yi+TC+Cic/
         dGjxuafn+WX8tUEiXkr5n1mjF0G87gKQGUyqBzbOPUuICf6kwsPyJKQOjOe8xx11ackl
         wEWV8URjlBUgxyfOAdT7d73UhJK38a/kCP8Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714940229; x=1715545029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89jyKA3wApx9BQCfs5IiJWmwTiyjcjG5A1RQj5E06Fo=;
        b=KbZZxpQJjP5k4O2pUYnrNU1kajqbqK7+MbivsvVXLIJZcA69Iw3czRQKUzmkALr+ty
         7mUG0ZOB2gxFFKTRuk5Kswu5q+JNaglXzeaRbcxYrs3wXEkGYPvoJy07PKPZS5L5C5VN
         5Fkb07jpVCqurdke2Or+0A047PgdWQWtofyH/kotU+GUX35l7fEdI5DnH3tq19Fkrawo
         jWqmOSk1PQAmHWs3J5lw1+20Dg93OJODh4O6b93ctQMAl+Tax+8jTUyWBnk8A56F2EVv
         H7SIcfEn6hLnvUuScU9x5ob6fbeJv35vjVlLmXmPGPur4l4fiJTKApcvrbRevyCQHARC
         c8kA==
X-Forwarded-Encrypted: i=1; AJvYcCUO13hriPQeTdZpMrQRalm+j6R4TunYQYM6vSJzDDtFSZ/IWsZ7rCCokOGpvpH8G6Vu6ZX4Yvar2Vyq6vGG29mOeIlfMPuvv+wVaR8=
X-Gm-Message-State: AOJu0YzsvJgnh0TXndz8ze0qCjyOm/yG19rCmB09qBvlo8fH2hhJizWx
	chcdj2MiMy53IGzEmQjNNl9WBWxLGAau/BELOYFQ8kJgJFcNFZH9g7LvSzqv8+nmLzFTr+1pnBo
	ToFJgng==
X-Google-Smtp-Source: AGHT+IGKgU6bEookGSVp3f2aIUaHHc7syp2TO2TNByMvO1YCY7SLhPg613CvryHicuYV76Mwp3bPdQ==
X-Received: by 2002:ac2:4895:0:b0:51b:214c:5239 with SMTP id x21-20020ac24895000000b0051b214c5239mr5364928lfc.62.1714940229378;
        Sun, 05 May 2024 13:17:09 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id wg4-20020a17090705c400b00a59ad490b65sm1928038ejb.54.2024.05.05.13.17.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 May 2024 13:17:08 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a59c448b44aso115167166b.2
        for <linux-media@vger.kernel.org>; Sun, 05 May 2024 13:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRCD3DKZ1Lu2rGSoQNDRFpFgbzM0Ny/KJe60au0m4JxnP571J7gnAyXoIUKW1IUXkFzhIGI5uVJ6ZkRSFWxMVcnWVARZ8fSc4YzmA=
X-Received: by 2002:a17:906:7188:b0:a59:cd18:92f5 with SMTP id
 h8-20020a170906718800b00a59cd1892f5mr599989ejk.11.1714940227970; Sun, 05 May
 2024 13:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wgMzzfPwKc=8yBdXwSkxoZMZroTCiLZTYESYD3BC_7rhQ@mail.gmail.com>
 <20240505175556.1213266-2-torvalds@linux-foundation.org> <12120faf79614fc1b9df272394a71550@AcuMS.aculab.com>
In-Reply-To: <12120faf79614fc1b9df272394a71550@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 May 2024 13:16:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=whxLdB_P=nW1bmVKn1m2jdcZRgkMksfvA722toFpT554w@mail.gmail.com>
Message-ID: <CAHk-=whxLdB_P=nW1bmVKn1m2jdcZRgkMksfvA722toFpT554w@mail.gmail.com>
Subject: Re: [PATCH v2] epoll: be better about file lifetimes
To: David Laight <David.Laight@aculab.com>
Cc: "axboe@kernel.dk" <axboe@kernel.dk>, "brauner@kernel.org" <brauner@kernel.org>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"io-uring@vger.kernel.org" <io-uring@vger.kernel.org>, "jack@suse.cz" <jack@suse.cz>, 
	"keescook@chromium.org" <keescook@chromium.org>, "laura@labbott.name" <laura@labbott.name>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"minhquangbui99@gmail.com" <minhquangbui99@gmail.com>, 
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com" <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>, 
	"syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>, 
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 May 2024 at 13:02, David Laight <David.Laight@aculab.com> wrote:
>
> How much is the extra pair of atomics going to hurt performance?
> IIRC a lot of work was done to (try to) make epoll lockless.

If this makes people walk away from epoll, that would be absolutely
*lovely*. Maybe they'd start using io_uring instead, which has had its
problems, but is a lot more capable in the end.

Yes, doing things right is likely more expensive than doing things
wrong. Bugs are cheap. That doesn't make buggy code better.

Epoll really isn't important enough to screw over the VFS subsystem over.

I did point out elsewhere how this could be fixed by epoll() removing
the ep items at a different point:

  https://lore.kernel.org/all/CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com/

so if somebody actually wants to fix up epoll properly, that would
probably be great.

In fact, that model would allow epoll() to just keep a proper refcount
as an fd is added to the poll events, and would probably fix a lot of
nastiness. Right now those ep items stay around for basically random
amounts of time.

But maybe there are other ways to fix it. I don't think we have an
actual eventpoll maintainer any more, but what I'm *not* willing to
happen is eventpoll messing up other parts of the kernel. It was
always a ugly performance hack, and was only acceptable as such. "ugly
hack" is ok. "buggy ugly hack" is not.

              Linus

