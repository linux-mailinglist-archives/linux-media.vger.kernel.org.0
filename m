Return-Path: <linux-media+bounces-10768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EC38BBCE9
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 17:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C80A6281B1F
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 15:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE7F4122C;
	Sat,  4 May 2024 15:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W1qCv1iK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EDD3FE2A
	for <linux-media@vger.kernel.org>; Sat,  4 May 2024 15:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714838048; cv=none; b=oq/5QwqiFMjDqKU0y8LQjV+1AoZbgbYDfvUz3OrZGfIdHx+22HEe4wnXDOoPrVJPXvDdnXhbde4gzxe0mlSv7r9BW/la7wOu0PCItfjUJvcOF3atKFjSDQVSOItCTTDuZA4VOzW1Dpo+cICD2cw0obk/+XdRuU8BoeUl/KMz24s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714838048; c=relaxed/simple;
	bh=/aq2jAO4DmSNrNoBrUEE3/qpOKGIfIhWERou7A/I/9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zba09Yfk7aIv86kot/eHguyiJzBbBW8zpe48XfLC636jXkwsgSoM/GdZA1hbBKc+2d48dmc07GbnYRpqR7pUkqUeVU/oi+BEebryIrN6qK6pZlSH2Qfu5YDW+dhy+JV8PQicWAmQ50aOmurLwTKiYTFGZsKE+olLRm4Kdhy3Xzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W1qCv1iK; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f8211c588so618155e87.0
        for <linux-media@vger.kernel.org>; Sat, 04 May 2024 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714838044; x=1715442844; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kZo6ArVOf5NVi3NAdVYQGqHRs84wzKq7YB5CfjfJdNw=;
        b=W1qCv1iK4D5rv6qfvJNHUlTcCzPfQu9ig1Ns3K6JzG1tm4P3Sww43b+o5WEkGlIqhG
         GvCiBIfWqW6CaiBkXf3ioUD209kz7+/oWK1D+8kuRy+trp+BVOuy/nycTQYlyCTqJfNq
         DqvV1G8przttRIjyNUEA2VgkmtTUVHC4VBaAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714838044; x=1715442844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZo6ArVOf5NVi3NAdVYQGqHRs84wzKq7YB5CfjfJdNw=;
        b=WfMImeuYzRDbRhRDmRfBlVhmYxJOfsC62FbPIbPADexsUPgQwJhyWVEjZCLcDwEpet
         t9uTCdLyKwLcm1Rugj62W94sF/GMRIfKGhfYpnROnz8HDaxIEs7P6j4/uAmYjGiQi81w
         xYd7U9lvfUmxuxXQahuHwiBub/S0UdLqqa8ssRW0HV/gn84AA6/vP4VmKSCtmNtGpN31
         ogTZlv2pzRdu6T1CgtdCbhEE6rgkG9Ftd/R+evk9Y0yI7UbgFrMipbJ8M6E8iMVl9ctb
         z/pfJibHRgjwMvVSgipnyczge02YMhaegB6PnWILr0ssnBa4kPIH7aeSeDeLzhGtoQzO
         HGEg==
X-Forwarded-Encrypted: i=1; AJvYcCU0JSVzwRSe0cwo2xQB18o99p1VbUOwH0//OnLCrqyra6p0C7lE1asMZ/TqhiqmSmviQjMUZvJ5ZbDXSyXMvT5dMEBA404o5K4z/oI=
X-Gm-Message-State: AOJu0YxxOmEGn2Ws3TbqW+FU4u9E8GlvisYDkwYRso1yVPx17cIjP/6s
	qHckC8LPXxXLrwb8mpam+NcZIdHg2YRV1MrofGs83RN4ZwTjVU/vH0dh9yRFn3rv6HbD/HQynOx
	5rUtasA==
X-Google-Smtp-Source: AGHT+IGYZOcjoR24jj07JwLnXyz+sf0P+4EPYfy8mEdXPci5vU6xmEffnGN9UVp4TfKvUzJyftRgAA==
X-Received: by 2002:ac2:4257:0:b0:51a:db50:ab84 with SMTP id m23-20020ac24257000000b0051adb50ab84mr3771272lfl.42.1714838044566;
        Sat, 04 May 2024 08:54:04 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id v10-20020a1709060b4a00b00a58767c1120sm3082048ejg.10.2024.05.04.08.54.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 May 2024 08:54:04 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a59a17fcc6bso124460066b.1
        for <linux-media@vger.kernel.org>; Sat, 04 May 2024 08:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHDNEaJPkD94PTpZSOvihTUKkrSAoHwLpliWvvWLIBGET2+gW6FRZsfSo+riZ80+ru2CW930s1xk7k+1/yjTe6Xe812V2QI32YCfk=
X-Received: by 2002:a17:906:a842:b0:a58:5ee1:db43 with SMTP id
 dx2-20020a170906a84200b00a585ee1db43mr3389515ejb.23.1714838043724; Sat, 04
 May 2024 08:54:03 -0700 (PDT)
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
In-Reply-To: <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 4 May 2024 08:53:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=whrSSNYVzTHNFDNGag_xcKuv=RaQUX8+n29kkic39DRuQ@mail.gmail.com>
Message-ID: <CAHk-=whrSSNYVzTHNFDNGag_xcKuv=RaQUX8+n29kkic39DRuQ@mail.gmail.com>
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, axboe@kernel.dk, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
	linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
	syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 May 2024 at 08:40, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And maybe it's even *only* dma-buf that does that fget() in its
> ->poll() function. Even *then* it's not a dma-buf.c bug.

They all do in the sense that they do

  poll_wait
    -> __pollwait
     -> get_file (*boom*)

but the boom is very small because the poll_wait() will be undone by
poll_freewait(), and normally poll/select has held the file count
elevated.

Except for epoll. Which leaves those pollwait entries around until
it's done - but again will be held up on the ep->mtx before it does
so.

So everybody does some f_count games, but possibly dma-buf is the only
one that ends up expecting to hold on to the f_count for longer
periods.

             Linus

