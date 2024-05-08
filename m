Return-Path: <linux-media+bounces-11167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D276F8C02D1
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 19:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83F77288EAB
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 17:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589F9128806;
	Wed,  8 May 2024 17:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Cv6UD24J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17F310A28
	for <linux-media@vger.kernel.org>; Wed,  8 May 2024 17:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715188505; cv=none; b=LO18sdWTfxkjgNKcjUu6Ph4XbVKqpdnvgJQisF6pYOw3q/E5qxvuuwg6Eqqnh+R8RJpepSmt7EzY+1Laeh9abRRmF2Trjcg8hkq+O2wikpgV8HqKgeYhwYns1+Qcm6AopVfmT4lZBw/Wu+IHjusoHKPpgFhKb8Cpu2YCw3B746M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715188505; c=relaxed/simple;
	bh=V0bpsJ67PmT0LSDQg/VjFC4vr5TTFXyb2cnSJu3RiIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQjNaHQMjvfN/T354xxE2oK6Xc8bXYtu5kUozaOQM0ddesfQ0do/0OKXF8dK8f5FLuNp4xG7JR/qLKw2H+ToRjtViQIFaRv04fPQz71mPLyoj1SkaXI10GVaNPzEnl0yMO3n7wQ4T9xamFSITUJZFuab/fm7yXyOEYQSCldZRso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Cv6UD24J; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59a0e4b773so1122134666b.2
        for <linux-media@vger.kernel.org>; Wed, 08 May 2024 10:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715188502; x=1715793302; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U/4yjhmm7i2TdW/kF2dab+x944KGHXX8XGDp8OQOwgM=;
        b=Cv6UD24J5wKIdhHmqRTF5/X9o9DqZMt24lEr/LCYzj505BVVu1eMgEjUDPfqss7qWh
         HfRtz5NHYZej8VEhNSEitQTr5MUKqCUCJ7KV2/6MLOpvYOhAeDo1yMDsGZ/ClQKnIW7d
         E0PASep9jgR9/1yOy8ob94tnVpaNqLEY55+mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715188502; x=1715793302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/4yjhmm7i2TdW/kF2dab+x944KGHXX8XGDp8OQOwgM=;
        b=EGJIm18aoUMXbygS2CWDYI4RFtw204DLxQ7llVtyM0isryqGSJKZCoovAZJfJENkwK
         S2ySVSvmbhaZoMujSRM5AnZtRGsx8JTI51CSoOmwyC0Fex0mPf/SlLiKSVWRx1oS6nKU
         xGe3hL3W+9EPVF3fSx+53wTq3ORc6R6JynHHTztPIbaE4iPmmhC6vhGGajTC/aaPZBb5
         XL7Ox1Ygj/AyyerO2qwXmaFjiFL9ZxvXFHS4IUUJ6f5RgolRx1srxSr4d9MfcGKmMvFR
         156spKxBBfW1Zz582ahkBJDYyFQ3aX74NpLsiDGYcY+MuA2WOnPWKnE+O4rqB1IgEIPS
         rjIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPFdfzbZ/WHHSSG1dFsCIILBAWibf7fzPYlx90Do2Q3Brvs6+8sib9pd/41ip2x/wkJNF0TLnIZaqvY0GnOz0Y6BGKYwnjNl2vd+U=
X-Gm-Message-State: AOJu0YxYudQ/fg8rHpX3YMdypyJ0tZ7LQGNIfYQbsnwjrSo/9j3l1E/w
	p2UxAXg7PgoV3FkGY/l4L1HYk13j243lp+Es/Djl2MjTkIFYyj2dCnLWcDi8g61pZL804C6oUSj
	7DjAmXg==
X-Google-Smtp-Source: AGHT+IGSUSxmjmOMbVQwKowjGG1JqQx1MPO9wvJKi+bZYsSmc3u96zWu09Lty0vOXgVxRMDTb2fAeQ==
X-Received: by 2002:a17:906:1c06:b0:a59:c7d7:8b0f with SMTP id a640c23a62f3a-a59fb9595f3mr173995566b.29.1715188501868;
        Wed, 08 May 2024 10:15:01 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id rs21-20020a170907037500b00a59b259e2ffsm5142105ejb.93.2024.05.08.10.15.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 10:15:01 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a59cc765c29so885956166b.3
        for <linux-media@vger.kernel.org>; Wed, 08 May 2024 10:15:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVciPCs91pPAeWjG7776//TdQPGYqIvtLpyW8+7sjSwKqW1w8o+cCDk7foFYdnupBCaST5MkZp4RL8bL2rLktFfJQR+8pdOaHN/ABg=
X-Received: by 2002:a17:906:a996:b0:a59:ca9c:4de9 with SMTP id
 a640c23a62f3a-a59fb9f5184mr235459866b.76.1715188500986; Wed, 08 May 2024
 10:15:00 -0700 (PDT)
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
 <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
 <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com> <CAHk-=wixO-fmQYgbGic-BQVUd9RQhwGsF4bGk8ufWDKnRS1v_A@mail.gmail.com>
In-Reply-To: <CAHk-=wixO-fmQYgbGic-BQVUd9RQhwGsF4bGk8ufWDKnRS1v_A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 May 2024 10:14:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjmC+coFdA_k6_JODD8_bvad=H4pn4yGREqOTm+eMB+rg@mail.gmail.com>
Message-ID: <CAHk-=wjmC+coFdA_k6_JODD8_bvad=H4pn4yGREqOTm+eMB+rg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better about
 file lifetimes
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Simon Ser <contact@emersion.fr>, Pekka Paalanen <pekka.paalanen@collabora.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, 
	axboe@kernel.dk, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
	linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
	syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 May 2024 at 09:19, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So since we already have two versions of F_DUPFD (the other being
> F_DUPFD_CLOEXEC) I decided that the best thing to do is to just extend
> on that existing naming pattern, and called it F_DUPFD_QUERY instead.
>
> I'm not married to the name, so if somebody hates it, feel free to
> argue otherwise.

Side note: with this patch, doing

   ret = fcntl(fd1, F_DUPFD_QUERY, fd2);

will result in:

 -1 (EBADF): 'fd1' is not a valid file descriptor
 -1 (EINVAL): old kernel that doesn't support F_DUPFD_QUERY
 0: fd2 does not refer to the same file as fd1
 1: fd2 is the same 'struct file' as fd1

and it might be worth noting a couple of things here:

 (a) fd2 being an invalid file descriptor does not cause EBADF, it
just causes "does not match".

 (b) we *could* use more bits for more equality

IOW, it would possibly make sense to extend the 0/1 result to be

- bit #0: same file pointer
- bit #1: same path
- bit #2: same dentry
- bit #3: same inode

which are all different levels of "sameness".

Does anybody care? Do we want to extend on this "sameness"? I'm not
convinced, but it might be a good idea to document this as a possibly
future extension, ie *if* what you care about is "same file pointer",
maybe you should make sure to only look at bit #0.

               Linus

