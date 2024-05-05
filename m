Return-Path: <linux-media+bounces-10800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0D8BC365
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 22:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DA58B21695
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 20:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913D66EB55;
	Sun,  5 May 2024 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="O63G1E/+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EC46DCE8
	for <linux-media@vger.kernel.org>; Sun,  5 May 2024 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714939410; cv=none; b=KekLerGzb2h2I8fZQMEzhzajIdoFU/rLOU8x3EjmKRLotNkg6TlV7yjGPdTFIfWJMrDrJmqMrrB19DnbLDpurVuBVSaVEjCL909Lq0I62EYzZ0PbE/T/IiNdS5zvNpmigj8ndQIRZukRBYbNG877LPYbfuTY5jE9RheDsYQPf0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714939410; c=relaxed/simple;
	bh=wWs9rnVSNPVg9flRopfXNHpvrjJqY4eLW8+/eL6ffhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+hCxtH/UGvzdZH4kOCjIx8pH992n2u+lQ8xUz3HH2e/ghbwZLryeOxnt9ZurPR91sk1GgdZXlj8PKMMrzCM8Jhgt2TKEhl9A2LKQ/eNtGLssgraQuLq4cn2FJ1CiI9We5J0ZRyAmjfl28+XKkMtkWLu+q19vNyzqMsYY4khxYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=O63G1E/+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51f17ac14daso1420363e87.1
        for <linux-media@vger.kernel.org>; Sun, 05 May 2024 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714939406; x=1715544206; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EHEpVJVmF2eGrGo8U8tgs6RR34ElBujEmi1VC80nQxg=;
        b=O63G1E/+7eBWR310Zub5Uoveljh5Dxn3u+PhSS+4shS8AjLRiDj+ArjSaBHId88gZ+
         5edZ2Md2dopxrQc5rl6rHtWfSDNZTvjE6vwnyUfhMK18WSCAQJeHQocneLpvZHgtw59o
         afMD1e0prLch0Ci2wjiF+oVb2EP8ohEa50ykU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714939406; x=1715544206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHEpVJVmF2eGrGo8U8tgs6RR34ElBujEmi1VC80nQxg=;
        b=iwDF/kIgGfWMvgZwjRfinS9qZvhxfBUHPHZX2BZFWHy7vbRDNotjna66Yfq2Gp3e86
         UobylOmBB9nW2ReT//Y0Hb2OL8/Ldm1hytUs05+5kWZ2R4s5P6YvMZzkP0uhRp8MP4l+
         CxMUmeQM63zVcSuF4b59g2kZBKA/XYG8psacVSxRdie8xjPBsKIkiVePe3RZGSBM73vY
         uD7dPgtqpZsldehJQuxXe/JG1mOzUL0Za/Mg6Qo9LYv5a9EdQme3YQZoysWigRum+3uF
         lKPmRznOFETorXOrzEg+jRMi6PbU6bY6pBfIQM02DKJ/EM1/x2Au3AuRdb/In0BO7MGO
         evwg==
X-Forwarded-Encrypted: i=1; AJvYcCXGCgqA/C2sF1fRN9b2ACpfUjKpbEytXPnX7+p/kJQ9m7LyrWH3EA9sMuJLZ6DSFy4xPMGaNePVzpbPYoYQG6hdFVAz6x+SQAjRkzA=
X-Gm-Message-State: AOJu0YwouWxvEAQN+Qz+8c8Usfd8CK0vQz+BqG6bCcCgSPHcJuRhHn4g
	+1CFXMFWiTS/xmRR5zf1sz/XQTgj45tVPslF7PPnCmus5ntkKPXW+qn4D9dmuIbfGb01mFPEzXC
	P6LwRAA==
X-Google-Smtp-Source: AGHT+IHpHxEpKCm6PKBZL4Fe82FqpaGr5W2kUSDNRg6OcgKAzSwT0LV7wj1fxGyQpeBb2JkfSDLSaw==
X-Received: by 2002:a05:6512:3c98:b0:51a:f1bf:544c with SMTP id h24-20020a0565123c9800b0051af1bf544cmr6298460lfv.52.1714939406041;
        Sun, 05 May 2024 13:03:26 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id i5-20020ac25b45000000b00516d2c05b3dsm1323899lfp.299.2024.05.05.13.03.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 May 2024 13:03:24 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52006fbae67so1619826e87.0
        for <linux-media@vger.kernel.org>; Sun, 05 May 2024 13:03:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpOhy9U0P4RUnLjifZfFA7hf2jvRNDrTYur15ujmzYpCFFEuwsmUt1BW7ThdIYgcPZQIcZw6KDK+5Iwzmrdf9uUQlh8xuQvBnWkDg=
X-Received: by 2002:a05:6512:202c:b0:518:c057:6ab1 with SMTP id
 s12-20020a056512202c00b00518c0576ab1mr4629192lfs.66.1714939404009; Sun, 05
 May 2024 13:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook> <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV> <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner> <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
 <CAHk-=whrSSNYVzTHNFDNGag_xcKuv=RaQUX8+n29kkic39DRuQ@mail.gmail.com> <20240505194603.GH2118490@ZenIV>
In-Reply-To: <20240505194603.GH2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 May 2024 13:03:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wipanX2KYbWvO5=5Zv9O3r8kA-tqBid0g3mLTCt_wt8OA@mail.gmail.com>
Message-ID: <CAHk-=wipanX2KYbWvO5=5Zv9O3r8kA-tqBid0g3mLTCt_wt8OA@mail.gmail.com>
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, keescook@chromium.org, axboe@kernel.dk, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
	linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
	syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 May 2024 at 12:46, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> I've no problem with having epoll grab a reference, but if we make that
> a universal requirement ->poll() instances can rely upon,

Al, we're note "making that a requirement".

It always has been.

Otgherwise, the docs should have shouted out DAMN LOUDLY that you
can't rely on all the normal refcounting of 'struct file' THAT EVERY
SINGLE NORMAL VFS FUNCTION CAN.

Lookie herte: epoll is unimportant and irrelevant garbage compared to
something fundamental like "read()", and what does read() do?

It does this:

        struct fd f = fdget_pos(fd);

        if (f.file) {
                ...

which is being DAMN CAREFUL to make sure that the file has the proper
refcounts before it then calls "vfs_read()". There's a lot of very
careful and subtle code in fdget_pos() to make this all proper, and
that even if the file is closed by another thread concurrently, we
*always* have a refcount to it, and it's always live over the whole
'vfs_read()' sequence.

'vfs_poll()' is NOT DIFFERENT in this regard. Not at all.

Now, you have two choices that are intellectually honest:

 - admit that epoll() - which is a hell of a lot less important -
should spend a small fraction of that effort on making its vfs_poll()
use sane

 - say that all this fdget_pos() care is uncalled for in the read()
path, and we should make all the filesystem .read() functions be aware
that the file pointer they get may be garbage, and they should use
get_file_active() to make sure every 'struct file *' use they have is
safe?

because if your choice is that "epoll can do whatever the f*&k it
wants", then it's in clear violation of all the effort we go to in a
MUCH MORE IMPORTANT code path, and is clearly not consistent or
logical.

Neither you nor Christian have explained why you think it's ok for
that epoll() garbage to magically violate all our regular rules.

Your claim that those regular rules are some new conditional
requirement that we'd be imposing. NO. They are the rules that
*anybody* who gets a 'struct file *' pointer should always be able to
rely on by default: it's damn well a ref-counted thing, and the caller
holds the refcount.

The exceptional case is exactly the other way around: if you do random
crap with unrefcounted poitners, it's *your* problem, and *you* are
the one who has to be careful. Not some unrelated poor driver that
didn't know about your f*&k-up.

Dammit, epoll is CLEARLY BUGGY. It's passing off random kernel
pointers without holding a refcount to them. THAT'S A BUG.

And fixing that bug is *not* somehow changing existing rules as you
are trying to claim. No. It's just fixing a bug.

So stop claiming that this is some "new requirement". It is absolutely
nothing of the sort. epoll() actively MISUSED file pointer, because
file pointers are fundamentally refcounted (as are pretty much all
sane kernel interfaces).

                Linus

