Return-Path: <linux-media+bounces-11219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 682718C124E
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 17:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 225C728355B
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 15:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D0D16F825;
	Thu,  9 May 2024 15:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ss1I03+E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70553F8E2
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715270025; cv=none; b=l5V8NWiRoXzuo+vFUKUnG2SyNy3JZ/44IUD3eKA5y0QW9q8+FcfDqaD2cOUDuZQ9jBnjcKIEbSPjYDnXoStWDR2pFO00si66GODLmQ+YDxHK9HQrtq9ryeXhSf5BuepoZSmhC3+3AHsfwX3Vy2oClO551jHFZwgB9/TPgweXpHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715270025; c=relaxed/simple;
	bh=mA/fCF0Hyf2s0C0NAXcut1RdJ0/A1Vl70kRKZc0yNVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATIodpqDzm5+wov6cVBFU/hINqU0bviAKVv5nGZ4AEy49MUgt9UFQoqgRjmMl63F52jv/JfT9a/WdJDc3KyPuA2PSQn47vqrBjEWsaVbEoBd+CwN3TPbh5epjYVQ2bWHKUDsBQ5dPxC9uC9hHDfJW1iK1fPswStqxPyE6sssYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ss1I03+E; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a59cdd185b9so385507666b.1
        for <linux-media@vger.kernel.org>; Thu, 09 May 2024 08:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715270022; x=1715874822; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=38BuvpIpkB3oaxq+zw4VsWBKcS3P81IEjFcYuWVYCpU=;
        b=Ss1I03+E85fSICh41UgaRHWiCIFBuab0IG22+6BqtsNzkDH7hfj+xrGms8xQnl9NjR
         RwoK05e4RC5BSu2aHk+pfInGklpIDkHr/GdjBbdmYjmptx1TJ5pnx1RKtAnRLbjnnGRT
         5fwELF1z9fgo7R/M1eYot4fqNt1ZcU3M4ouM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715270022; x=1715874822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38BuvpIpkB3oaxq+zw4VsWBKcS3P81IEjFcYuWVYCpU=;
        b=gk4aa8a9P2W0iW6IVyIemYVeyYzWJLYlK9fd/n1eS8bXv0K3bt83u880mEplpb485f
         ly1E/jGB04s/Yy2j5OFv/BhqGxENjKYzsQhFrjiuyKYJm/pewRNt6b7I2pXOxch2KPMQ
         Q9qqTgOXnJzCbgpA1qaG7oeZJ0jA9QVSGj2xA5bR+2mUz8RCsIqdVK51OydtgDeIPssN
         AEaBlgn7dexoxEz6BA7vOQpipfsGJi3IEqFHdqx9G2rleAIKYOSt5tpkeKb0/2KQguoy
         L2DaWbJre1VAyBaKS2KLfVKDnVZu0Y0VNTErz8A87Mi7gtYVQ9wKfI7IFRJ4Wl4w9BcF
         3lAg==
X-Forwarded-Encrypted: i=1; AJvYcCXbP7wXLeIZ8vof7qYplIlxCRwuJJNoLGaQ7ca7h9odxsYdDWbzHBZitH83f/GuUzyotBPn2ga/IDXPaR5DQJjFLKC74yHJT4uGmOw=
X-Gm-Message-State: AOJu0Yx7lrs5v5yhyhn9YsJmzkZ6wODWeys5EHHDGzUa7xG3L7Bwg2ns
	c9+9gm6NgePs0IituLJsemjCvbtxUIFAI7nBq5vJkPhYlsxx/KH01mbOeaQ5rSEiYzImlDH80Li
	5OujJ+A==
X-Google-Smtp-Source: AGHT+IGg7Pw0dXnWuo29E1WqivAuQEWbLcC+m1eZiuPd2s7lNpcDWZsOGtvrAYG4C0Kzoigx6+9ouw==
X-Received: by 2002:a17:906:d8a7:b0:a5a:f0f:e385 with SMTP id a640c23a62f3a-a5a2d292aa0mr6494866b.24.1715270021858;
        Thu, 09 May 2024 08:53:41 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7fc4sm87150766b.135.2024.05.09.08.53.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 08:53:41 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-572c65cea55so1890786a12.0
        for <linux-media@vger.kernel.org>; Thu, 09 May 2024 08:53:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8RDzyjCuMExCWtwqLjwmGOP7GsSnEETESO8P4gqcqHSqDQ7P3I0lv942+4dgvISMMHOq+GXu+ar+oByhtMHv2HbSzV8fFrsCPXHs=
X-Received: by 2002:a17:906:19d0:b0:a59:fb06:5d35 with SMTP id
 a640c23a62f3a-a5a1156665fmr240732966b.8.1715269716628; Thu, 09 May 2024
 08:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com> <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
 <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
 <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
 <CAHk-=wixO-fmQYgbGic-BQVUd9RQhwGsF4bGk8ufWDKnRS1v_A@mail.gmail.com>
 <CAHk-=wjmC+coFdA_k6_JODD8_bvad=H4pn4yGREqOTm+eMB+rg@mail.gmail.com> <20240509-kutschieren-tacker-c3968b8d3853@brauner>
In-Reply-To: <20240509-kutschieren-tacker-c3968b8d3853@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 May 2024 08:48:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgKdWwdVUvjSNLL-ne9ezQN=BrwN34Kq38_=9yF8c03uA@mail.gmail.com>
Message-ID: <CAHk-=wgKdWwdVUvjSNLL-ne9ezQN=BrwN34Kq38_=9yF8c03uA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better about
 file lifetimes
To: Christian Brauner <brauner@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>, 
	Pekka Paalanen <pekka.paalanen@collabora.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, axboe@kernel.dk, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
	linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
	syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 May 2024 at 04:39, Christian Brauner <brauner@kernel.org> wrote:
>
> Not worth it without someone explaining in detail why imho. First pass
> should be to try and replace kcmp() in scenarios where it's obviously
> not needed or overkill.

Ack.

> I've added a CLASS(fd_raw) in a preliminary patch since we'll need that
> anyway which means that your comparison patch becomes even simpler imho.
> I've also added a selftest patch:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs.misc

LGTM.

Maybe worth adding an explicit test for "open same file, but two
separate opens, F_DUPFD_QUERY returns 0? Just to clarify the "it's not
testing the file on the filesystem for equality, but the file pointer
itself".

             Linus

