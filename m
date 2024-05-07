Return-Path: <linux-media+bounces-11096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A30E98BEB10
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 20:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D15951C243A7
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD1C16D320;
	Tue,  7 May 2024 18:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="eo+YnCWO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A3116C864
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715105067; cv=none; b=G68R6f4UIotwVjGXl/Xh+VZfuuwCjKieBeVyOyToTTVK5Ch7gATOjIME2FP8BpojAj22ethp4+KNc6hDQDLp2aRxslUER9iXS2Qil9CTIbuoAuAwY4YhVkHPWwr9/69V4z5cfAYC0yrp+i67DLS64J2YHOS/A46WPlqUzUBj4Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715105067; c=relaxed/simple;
	bh=bAeC75xvNb+JauaCbjaxHSxSCPq7tnqY5BqL0SZHYRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Id/ecTtLnkDdg46VDhv1Lo/LSKQeHEeT97kFV5aty8G0kvSfmQRe1m1/8XYWJI8zTuu4UiX9QQAb7EGdxkRIf5M2vjhhFwVHGST1nBlFKE44UgAteCOv9m3cRrpAqHB0ONy5sOh7h8LF2zvlVcd5aher6SpqUn7L1OWsLERhzpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=eo+YnCWO; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5af609de0d2so314667eaf.2
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 11:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1715105065; x=1715709865; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YmWheXdPpQuPLWl1RiMEbt0Eg1z181/dlD8IMNrkg1o=;
        b=eo+YnCWOylpYuKvM7GG0ZejU8v4QEDQ1r73vBdA99OHLl2GcaygX80XSd9UDYeJfvk
         3sDUd7+rkuhuYRoyrZ7S9Gw/e7g3GEgmha28eVvySJRUQiF3GIXqcuEPD2tknRAKTjIV
         YAuGOVeB9P/q7P5b3e00HC/xqHRlFGb2HMO08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715105065; x=1715709865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmWheXdPpQuPLWl1RiMEbt0Eg1z181/dlD8IMNrkg1o=;
        b=tZO3e59/3bbIe+sDgLzvjV554eA8Y08kjaQO59+M2fgQ9apokE/BKVhtQ6beMWvKgI
         idnInIikSo/OxfALofz9Y0nlRHfSKZUDseCA9w95L0OT25SVqPJ/FbirbFrLJeVd7PVT
         oo9qZWotrdpJ371Ew4QNR+exHtT5bhcIc3SQhZT7kUPSVi8pzyhkl0WJDjy/mv2L88eg
         arzsSlVaifnC4jyfXkYIsdXTS+iSUQ49tWeCztGXj8yzycX8RF9AWE3/Yt0XgN4LEI7r
         zGUqd0ojTGMd+ZfuNymrMEMK1rpbFzPIXfDb5EVEW6vSCMSehTDqTzRiiJn8pyWqGsrM
         /2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCU8DWSh9yc8dvAh7XmlMmNYK/zaR8EGtLy4JPSxFdQhcGHc2NHt5Hbq+rn4DGkvggmGAbYWmzof/gsdflZYxP2I6LyYeHg0lVyH6Og=
X-Gm-Message-State: AOJu0YwGHiuK73wMP42J4Fs+oxz7RHkaVtNuwTqYq6MYMlxsqnYvWL2z
	JaGRHjT+uJqv3OJ+MM56WvTorBrGS35m3as+gb4SChNE31BimX/pnVuRHsiZF5ajm92qNbtmxBv
	Vici7/jHDcwf+OlbeByzEl0QoN9uJrhQxJ0ZFYA==
X-Google-Smtp-Source: AGHT+IHmrwrHAXCxOJC+DssE4b3IrYE7fedfWDlb1+phM010DsU5X6/lJatnzj106ycVmmtXnenEsbtAWj3Yy2ck3IU=
X-Received: by 2002:a05:6870:239a:b0:22e:dfbc:4aae with SMTP id
 586e51a60fabf-240980ba70cmr376610fac.2.1715105064951; Tue, 07 May 2024
 11:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook> <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV> <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner> <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com> <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
In-Reply-To: <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 7 May 2024 20:04:13 +0200
Message-ID: <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better about
 file lifetimes
To: Linus Torvalds <torvalds@linux-foundation.org>, Simon Ser <contact@emersion.fr>, 
	Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, 
	axboe@kernel.dk, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
	linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
	syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Tue, May 07, 2024 at 09:46:31AM -0700, Linus Torvalds wrote:
> On Tue, 7 May 2024 at 04:03, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > It's really annoying that on some distros/builds we don't have that, and
> > for gpu driver stack reasons we _really_ need to know whether a fd is the
> > same as another, due to some messy uniqueness requirements on buffer
> > objects various drivers have.
>
> It's sad that such a simple thing would require two other horrid
> models (EPOLL or KCMP).
>
> There'[s a reason that KCMP is a config option - *some* of that is
> horrible code - but the "compare file descriptors for equality" is not
> that reason.
>
> Note that KCMP really is a broken mess. It's also a potential security
> hole, even for the simple things, because of how it ends up comparing
> kernel pointers (ie it doesn't just say "same file descriptor", it
> gives an ordering of them, so you can use KCMP to sort things in
> kernel space).
>
> And yes, it orders them after obfuscating the pointer, but it's still
> not something I would consider sane as a baseline interface. It was
> designed for checkpoint-restore, it's the wrong thing to use for some
> "are these file descriptors the same".
>
> The same argument goes for using EPOLL for that. Disgusting hack.
>
> Just what are the requirements for the GPU stack? Is one of the file
> descriptors "trusted", IOW, you know what kind it is?
>
> Because dammit, it's *so* easy to do. You could just add a core DRM
> ioctl for it. Literally just
>
>         struct fd f1 = fdget(fd1);
>         struct fd f2 = fdget(fd2);
>         int same;
>
>         same = f1.file && f1.file == f2.file;
>         fdput(fd1);
>         fdput(fd2);
>         return same;
>
> where the only question is if you also woudl want to deal with O_PATH
> fd's, in which case the "fdget()" would be "fdget_raw()".
>
> Honestly, adding some DRM ioctl for this sounds hacky, but it sounds
> less hacky than relying on EPOLL or KCMP.

Well, in slightly more code (because it's part of the "import this
dma-buf/dma-fence/whatever fd into a driver object" ioctl) this is what we
do.

The issue is that there's generic userspace (like compositors) that sees
these things fly by and would also like to know whether the other side
they receive them from is doing nasty stuff/buggy/evil. And they don't
have access to the device drm fd (since those are a handful of layers away
behind the opengl/vulkan userspace drivers even if the compositor could get
at them, and in some cases not even that).

So if we do this in drm we'd essentially have to create a special
drm_compare_files chardev, put the ioctl there and then tell everyone to
make that thing world-accessible.

Which is just too close to a real syscall that it's offensive, and hey
kcmp does what we want already (but unfortunately also way more). So we
rejected adding that to drm. But we did think about it.

> I'd be perfectly ok with adding a generic "FISAME" VFS level ioctl
> too, if this is possibly a more common thing. and not just DRM wants
> it.
>
> Would something like that work for you?

Yes.

Adding Simon and Pekka as two of the usual suspects for this kind of
stuff. Also example code (the int return value is just so that callers know
when kcmp isn't available, they all only care about equality):

https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/util/os_file.c#L239
-Sima

--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

