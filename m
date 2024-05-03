Return-Path: <linux-media+bounces-10754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5AF8BB862
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 01:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69D9C1F25570
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 23:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDB584E16;
	Fri,  3 May 2024 23:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TBq5xg1s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294C384A4F
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 23:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714779700; cv=none; b=f56RLFzD67OTIiayEn7WmviTJN3lbLHb2QEpuPsocEv5cUJ0XiLEHts9NSfA7PoiVc72hF3RWURbPiEubXoyMACJRy95Hmw38vSZVP7P9XqmdMzg0bVIj77axdzqVsfTmZskcBJ+mMHI32+kPM9mZ4FYghNOcoUJ5UrPcoSFnao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714779700; c=relaxed/simple;
	bh=MSsbpnKLBIIDiyb/Z/B6yI6NHQlm2qNPMZwpsoocZ+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXwQGvQ2Up30ZfZVirWWoxpAmLD95lXX8GAmqerch0/nlQnVmozUps5teFjMklZmwFCdtVf7SQ+IzoBWX/wnPiU0ERLbrIlwrugE2h4jcangbwM9j88/dtEem9vY6q/tobjenChbdQkOcMgvJUKPdg0Rdsi0slCXhHZq9spZsvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TBq5xg1s; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51f1bf83f06so189767e87.1
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 16:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714779697; x=1715384497; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ap01jwoCR0DRWLobuG8Czpgd5Vwn2tKoOeVWkObJWkg=;
        b=TBq5xg1sBA8zV/mvmOtoPryVJZTi1gB6j+vWmIwg2mEE/pSua3tBUv1us7XB29RnWw
         tO3hPqZl9jXu58oSPTQz5waCBbsxXHKxVPXBISdIW55YhIZRm4XspJxonoxzkfJh/U2y
         jk39reGIDIaKeKhO7uFyt9Wk7pkjLAnOWM51c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714779697; x=1715384497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ap01jwoCR0DRWLobuG8Czpgd5Vwn2tKoOeVWkObJWkg=;
        b=lwGdL9NOHW753FpUo+lv+b36POK/W1AG/QiEE44wc+i8tBBtR68xYgc3oqWZqrSGSO
         pwzG2DXN9QIX1739efP8KKksKS4GjfDaJay52LYrFUCyDQcgshUE/C6wX1A+cgYoAL1H
         q6vFr2dpaeU3cJq73Sx4044rTQjC5Cq3xlvylNeUQUY8BxsGtD7IY1IyHnM0YHbnmRkw
         uIDqDHCWmnVMSYNjfY6/ZrpbvCjWMM5kdR5ZijS6gHJeMuR/eVb0VqSyPk08IlDeLn+L
         Lp9L549OSGQkBrvzcuLmpn12/MU0fhopzgY6+bm7fIm/SMNQxFKOoX3NKWjlhGyIU0PW
         cE/g==
X-Forwarded-Encrypted: i=1; AJvYcCXg6RoXK+EusWnRaohrd0VrEHR3aYyK5xrboVSRYWGJmEEwq+wf2Y/+YI2veDSlUPVfhH7fo0Vt7P4jxK577w//po9VVmvXBWUdEHs=
X-Gm-Message-State: AOJu0Ywvk49meyIeBREQneF2wY00NUNCV/gUaC7OIdNrYMQYgOBmcl8B
	4SMnehw9VXZpJ1liuyp4c8tzvyRuubp3DHPZ0QR3XZ04oPv6Dz0iptLJPvfUydnQeASlcHewv42
	yL10Sew==
X-Google-Smtp-Source: AGHT+IHW0OTvlG70ZzucXm40A1WuLlna7aAEeOEMm5tETt0AQI2DkB2A0pLFIniaNmkHpb26zMfJJg==
X-Received: by 2002:a05:6512:368d:b0:51e:fa8c:47cc with SMTP id d13-20020a056512368d00b0051efa8c47ccmr2877376lfs.30.1714779697097;
        Fri, 03 May 2024 16:41:37 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id x19-20020a056512079300b00518da444121sm693981lfr.123.2024.05.03.16.41.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 16:41:36 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51ff65b1e14so84431e87.2
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 16:41:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdWk8egPlbHcS3J5k21jsA9iPuGW+GkM470MvT/+fVJn5IMvprlmigD8Zp9eFCQwvM/6VwOA7vXEh7bM36iArJqj88y6eV7798078=
X-Received: by 2002:ac2:488d:0:b0:51b:fc6c:cbf6 with SMTP id
 x13-20020ac2488d000000b0051bfc6ccbf6mr2434386lfc.16.1714779695990; Fri, 03
 May 2024 16:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook> <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV> <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV> <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
 <202405031529.2CD1BFED37@keescook> <20240503230318.GF2118490@ZenIV> <202405031616.793DF7EEE@keescook>
In-Reply-To: <202405031616.793DF7EEE@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 16:41:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjoXgm=j=vt9S2dcMk3Ws6Z8ukibrEncFZcxh5n77F6Dg@mail.gmail.com>
Message-ID: <CAHk-=wjoXgm=j=vt9S2dcMk3Ws6Z8ukibrEncFZcxh5n77F6Dg@mail.gmail.com>
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
To: Kees Cook <keescook@chromium.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, axboe@kernel.dk, brauner@kernel.org, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
	linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
	syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 May 2024 at 16:23, Kees Cook <keescook@chromium.org> wrote:
>
> static bool __must_check get_dma_buf_unless_doomed(struct dma_buf *dmabuf)
> {
>         return atomic_long_inc_not_zero(&dmabuf->file->f_count) != 0L;
> }
>
> If we end up adding epi_fget(), we'll have 2 cases of using
> "atomic_long_inc_not_zero" for f_count. Do we need some kind of blessed
> helper to live in file.h or something, with appropriate comments?

I wonder if we could try to abstract this out a bit more.

These games with non-ref-counted file structures *feel* a bit like the
games we play with non-ref-counted (aka "stashed") 'struct dentry'
that got fairly recently cleaned up with path_from_stashed() when both
nsfs and pidfs started doing the same thing.

I'm not loving the TTM use of this thing, but at least the locking and
logic feels a lot more straightforward (ie the
atomic_long_inc_not_zero() here is clealy under the 'prime->mutex'
lock

IOW, the tty use looks correct to me, and it has fairly simple locking
and is just catching the the race between 'fput()' decrementing the
refcount and and 'file->f_op->release()' doing the actual release.

You are right that it's similar to the epoll thing in that sense, it
just looks a _lot_ more straightforward to me (and, unlike epoll,
doesn't look actively buggy right now).

Could we abstract out this kind of "stashed file pointer" so that we'd
have a *common* form for this? Not just the inc_not_zero part, but the
locking rule too?

              Linus

