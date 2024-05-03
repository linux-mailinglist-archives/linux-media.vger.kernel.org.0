Return-Path: <linux-media+bounces-10738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B07E28BB5CD
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 23:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1A8B1C236B7
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 21:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762845BAC3;
	Fri,  3 May 2024 21:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I041ed7w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDA354F8D
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 21:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714772038; cv=none; b=Y/RRiG4fWARCHAEvEbx/OWW4e9LfOqxia4c8nqkBFDJP76v2Wn2UZMHFMqO2oZH+6Ufs0UVi7qMbwSyko0jKssZRzoQozyd6YHidm6fYQvPZigMtpN8ZjJjjdWVO/fOoBXqct4+UBpIjX4qQKKFuaGIQt6uOsaipxrWkhTPzUSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714772038; c=relaxed/simple;
	bh=9Qapmfzm6lSNA1KjLLEHmaWSypEB5MZ/Duccomf7UwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbVzQVh1SznxwWGKLm+C9srm60jsrAY6sEzt/M36TXGVwNej9QkmC2cbqoAP0RMb8b+Wu7jFmccXaaYKWQeg13mlzy5kSH7cW0rc3K1UTeaJsx+KeGTbCcFCsqBPxzha6xd7NiSVvyq3sHZRnoNaA/x+Hp//bhxMgsgJ0gPrzH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=I041ed7w; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51f25f87e58so115995e87.2
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 14:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714772035; x=1715376835; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H0cKj1/eeDlsag1nYyx5cuj3RktPC8YvvhuCxa/6SIc=;
        b=I041ed7wq74EqHv+lLpw/4OnY1kI3FzQ0ynGOUp7811sa7ORamvQCjH55bC3YnkSar
         Klx1rhzeK82r5sekSRH+Cic3Wo0satWx94LLNP051CXWwirSPCCliSE8FVQHfxNUSvej
         uk8KtcOJLyEkqe0pyZgWuEHuRw49MMa4Hn1p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714772035; x=1715376835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0cKj1/eeDlsag1nYyx5cuj3RktPC8YvvhuCxa/6SIc=;
        b=U9ycfyJ/sh7YvZiB1ENTmRQLH2nx6n88phBqWamguFBxQ8EYvgmkX3lBXw9+3meGOl
         G3Non/MjZ3Nfb8Gv3SpMQp5FuWvFzTAopwwHnl5H1RvUQ+jzqKRxNGmIPXMz8CbP+3pT
         l7hb0zlEM72nrh40oM8n5FAlXhLYnySFXdIApU7mpShNiI4CgvUD6RFfUNUCms3MGGCN
         /8nrN4jTTW3k+uKVVg7VF/9FfMbwt2LwvnHliFrnKFG75nOvNttOMX5BY2KzyosOpuos
         /ADCUo7zy/PDGWnZ3rV7RfSZ5aqLpM0T4K2CfwL87Ts4zsGlkJNBfRMDdfjIBcI4K3Rj
         R+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP652+zAEO6SehUfSF3WqjpTRIb2jaspktJTEQq3dxGEmr33fnKR4HyUIQJ/djivS7QNJEMqJsbynxf/84HD6K9+bx12fqz0Ln6YQ=
X-Gm-Message-State: AOJu0YzlO7uvq9pL589Xe4FtPXpDNsVzppjYD/ec+PeFBU6rXmV2ffzO
	00eWGCMleneBrcNNq/8JA7di8PIqCHIloPfLPE3J7tNmIFvgKSQ73RVSxVgdwVXVzTSSO9ZT6WN
	Nxhh75g==
X-Google-Smtp-Source: AGHT+IEvS4MKgbtzaNYTtVtrsndFOYxlge6dYb4FxNE1SyCj4YFDUdwVI9i2pPibRIb1kjTG2GHRJw==
X-Received: by 2002:ac2:4959:0:b0:51a:bebb:690c with SMTP id o25-20020ac24959000000b0051abebb690cmr2693988lfi.12.1714772035276;
        Fri, 03 May 2024 14:33:55 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id q6-20020a1709060e4600b00a5875dd74c2sm2161597eji.131.2024.05.03.14.33.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 14:33:54 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a595199cb9bso10734966b.3
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 14:33:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDCP3A7oTDu/PlxR99MfpJ8D45ZuzK9UK7ySO107yygTFnt6yaTp+VG1Z2T1t5RxqXxneu89UN0arRFITQ+yHoKJmi2rqOtSXm1SA=
X-Received: by 2002:a17:906:2c50:b0:a59:761d:8291 with SMTP id
 f16-20020a1709062c5000b00a59761d8291mr2183947ejh.9.1714772033952; Fri, 03 May
 2024 14:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook> <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
In-Reply-To: <20240503212428.GY2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 14:33:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
Message-ID: <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: keescook@chromium.org, axboe@kernel.dk, brauner@kernel.org, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
	linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
	syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 May 2024 at 14:24, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Can we get to ep_item_poll(epi, ...) after eventpoll_release_file()
> got past __ep_remove()?  Because if we can, we have a worse problem -
> epi freed under us.

Look at the hack in __ep_remove(): if it is concurrent with
eventpoll_release_file(), it will hit this code

        spin_lock(&file->f_lock);
        if (epi->dying && !force) {
                spin_unlock(&file->f_lock);
                return false;
        }

and not free the epi.

But as far as I can tell, almost nothing else cares about the f_lock
and dying logic.

And in fact, I don't think doing

        spin_lock(&file->f_lock);

is even valid in the places that look up file through "epi->ffd.file",
because the lock itself is inside the thing that you can't trust until
you've taken the lock...

So I agree with Kees about the use of "atomic_dec_not_zero()" kind of
logic - but it also needs to be in an RCU-readlocked region, I think.

I wish epoll() just took the damn file ref itself. But since it relies
on the file refcount to release the data structure, that obviously
can't work.

                Linus

