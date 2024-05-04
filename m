Return-Path: <linux-media+bounces-10773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB468BBD98
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 20:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAE16B21304
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 18:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BB774BE4;
	Sat,  4 May 2024 18:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Wc0pulwu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0547E6CDC1
	for <linux-media@vger.kernel.org>; Sat,  4 May 2024 18:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714846843; cv=none; b=H92/gkVM5d7W4FEpyNxBZlE3Niun2h0rRBMas2ZyjuxCtC+gS0RyaSZHMDW7Mw725OIoVm4P17ay0Mi+nKF1FT+ESH3bxTSBCcXLweg0fplf0f5NOTlbT/FrtNfCPuXK6R8E2f12IcWpGuuuqeTK+RVX9Djpgp84hVUPw2tBGP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714846843; c=relaxed/simple;
	bh=rAIZu+79Hh8VYj6yqYqrrAzdBZ74FGbLE5oKNi+7r5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WEqU6e0ts46yKpKEYGCRfYOCuHNDdz1L7IBYLa0Qws8NdBTpa3/hXuVicmjdhDDFAEloM3sC9ZEI8Vi+wlQdMJ2CNMPifA+4RIwm+c6GgD+UtvbVRd2AL6b67ypbQPawRAffuC2qEgkETi3prPyuUaRV1SK/F1xdHliODFNnqqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Wc0pulwu; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59a0e4b773so145008666b.2
        for <linux-media@vger.kernel.org>; Sat, 04 May 2024 11:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714846840; x=1715451640; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TbTAb0O3vIVxVEVAX+Kz3ISBhu7sYKvIouph0u6S16I=;
        b=Wc0pulwuFuYqLkVN8EBjCsAzlb5rNkEWGbvBUzAJWJqiykGiFmiuBI/b9qCCtky7iz
         xyMvgD+XcTH+QOBjnki3IFxFQC3BZCBJemate6AvSmkzpbSgfjRE32oeX3Jnv4VYW8Wh
         CF3x2DTn1BiDi3TWNl4FGqLhh16aMlDRLKD0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714846840; x=1715451640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbTAb0O3vIVxVEVAX+Kz3ISBhu7sYKvIouph0u6S16I=;
        b=XhcM+GofYG6sd0qRpQRokk3/EDF/Md3cSzgsdsVvC8j/41psNvT5+VZ2CHxogg+PDX
         PGM7KsG6iGsZ+UNjMiNDo61o6OxPUobeWkn7qmeo3Q993oKoX5ncbr94nwf/5Ct5Ks1d
         CDQCnjqffXmN2TUbWunMatZhPYGSfPF48akUzkfKO/PjQA/rbd4XJ3d7JIJEy7vj082q
         ARlerjXVf4Kg0ZU6t8Sb8uvC1DOE58Wm8s51N47vHIru9aju5o+eTpDY5M08JyrL0Pe0
         lYlMkGih5ewQ0wYuXlmiJlxR/oaqiKDCYn5ns9L9xw7WJRTdbUYgTqL9A/h4kVFK6BQo
         mFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzmIkeUvrualvWs66EC+EwK16rR1KsUplmyxDUo4XdG6mh9GkL6OOOfa0R3RmOA1di6P+1tREy0repmdNA3QppB67AFDo3AvRrrFg=
X-Gm-Message-State: AOJu0YzFoj2cBs9TCyERFY9i4Wx5B10ZHnEaJLuBzfRlzRuYh/Rzs3Xf
	2B+ET1gqTvvOwrUsG2/Vfiw2RxuRvAn7tcWcF4o+ZjTHVus37EGcQJL0b4foIfBHgDRP/FC8ZHu
	d7g0wlw==
X-Google-Smtp-Source: AGHT+IH2g1iHuy9mZkeZGgjOTklC7iMhkH3mZ2EDWlx/ICxhwPXxUjmI9tzaDoEZ0kZCGybo8eszUw==
X-Received: by 2002:a17:906:1359:b0:a59:9f7b:68d4 with SMTP id x25-20020a170906135900b00a599f7b68d4mr1812222ejb.28.1714846840064;
        Sat, 04 May 2024 11:20:40 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id le13-20020a170906ae0d00b00a59b8d8a9d0sm251845ejb.90.2024.05.04.11.20.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 May 2024 11:20:39 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59a17fcc6bso139020866b.1
        for <linux-media@vger.kernel.org>; Sat, 04 May 2024 11:20:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzBd5PB/Vg84LLL0E9VKUsjI3WSFoXWpNEsiJsWvCxCogfjovNWhOa2SFYUpflwqq1CKZxKY4isv5fPjeWv3B+FgxQqhfrpOH+9To=
X-Received: by 2002:a17:906:e90:b0:a52:1e53:febf with SMTP id
 p16-20020a1709060e9000b00a521e53febfmr3945377ejf.69.1714846838331; Sat, 04
 May 2024 11:20:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook> <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV> <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner> <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
In-Reply-To: <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 4 May 2024 11:20:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
Message-ID: <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
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

On Sat, 4 May 2024 at 08:32, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Lookie here, the fundamental issue is that epoll can call '->poll()'
> on a file descriptor that is being closed concurrently.

Thinking some more about this, and replying to myself...

Actually, I wonder if we could *really* fix this by simply moving the
eventpoll_release() to where it really belongs.

If we did it in file_close_fd_locked(),  it would actually make a
*lot* more sense. Particularly since eventpoll actually uses this:

    struct epoll_filefd {
        struct file *file;
        int fd;
    } __packed;

ie it doesn't just use the 'struct file *', it uses the 'fd' itself
(for ep_find()).

(Strictly speaking, it should also have a pointer to the 'struct
files_struct' to make the 'int fd' be meaningful).

IOW, eventpoll already considers the file _descriptor_ relevant, not
just the file pointer, and that's destroyed at *close* time, not at
'fput()' time.

Yeah, yeah, the locking situation in file_close_fd_locked() is a bit
inconvenient, but if we can solve that, it would solve the problem in
a fundamentally different way: remove the ep iterm before the
file->f_count has actually been decremented, so the whole "race with
fput()" would just go away entirely.

I dunno. I think that would be the right thing to do, but I wouldn't
be surprised if some disgusting eventpoll user then might depend on
the current situation where the eventpoll thing stays around even
after the close() if you have another copy of the file open.

             Linus

