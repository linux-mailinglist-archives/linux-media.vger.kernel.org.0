Return-Path: <linux-media+bounces-10742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3C08BB66D
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 23:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B1E21C2281F
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 21:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C327E58ABF;
	Fri,  3 May 2024 21:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AapHLxT3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3902E83C
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 21:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714773180; cv=none; b=DXv3t1x7m4egKohAdSyhexFeS2f9PsJTi+gJiTNxerCZ73hKSzpka7apT328PDmYGalrMnFQcu5byTRCJsZ3ukTtqqA+Y3EgFsXyTw9TL/J3Cb4oui2xhwOfWqZME2Vw3Yo3TG5qiIoLD1pqWKqt9/+5vEVj5bqmb7D2X+rAaz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714773180; c=relaxed/simple;
	bh=d5soG/vdOcHc+T4G2kOCRoZhsfh2zUDag1A1J17X/z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXuOvRknK92CITANTpzOrnVv8G3bExsfTuetZa1pqJ1dDPdzpamAbls737UX5OCHYX0DJGrxj+x8hFjkc7ini4PGu2i8n+UpcDnxhK29bkmbHks3LW+AqC4aLgDBZi4SPnKu80JktjkednDIxSEWvjBl+q0wQ1FknixiRTU/oLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AapHLxT3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso17144966b.2
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 14:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714773177; x=1715377977; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A7KwjGqB6cN3Dl955k2+YGPiXLoEdjHxOLmUV0m+ZBo=;
        b=AapHLxT3lnwb1tMaqco4jv36km1X5yWmWSbmyyTrvrT4S7kHW4LeCW/defI5AANPim
         T5q84VjL0rM3may+SChxZAhpiaBOJzc20UpIKNdJa7cePCJsLwr2ARuTGkWWEUZv80en
         IukOFOILN/4oE+W8/JwfsIl5RmSDqFd0teRjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714773177; x=1715377977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7KwjGqB6cN3Dl955k2+YGPiXLoEdjHxOLmUV0m+ZBo=;
        b=jtnuFnXXojXhxhGdgb3JF0VEx7sjD6V/eRdy+y0kalOMD/ZEV7wIYnFbeikuaDAH5R
         YevkvO/aK/loDxju6saWt1PdkcTPdL2suc5l1TypnwaWANK034djApQxl+uHGdhNFUDQ
         8aWv+diepN7pav0OJ9pQV3KtJ4//xeFsknxWeegkKTcfb4qpnlOKAppdMsW/aOHJ6wCX
         g6Feoyi1PTxC8K7JZ36Vi/DE1rP7afxlPxAniD/8kH99dkLut/BbLqFrfME1kJTJFrtD
         iwqvBWWtaWOEzIg2oN9OBPX+K02ktrYGlHvn4vYa8Pk8jmpJ30pJOHqWdouYk9KaiXcX
         gHVg==
X-Forwarded-Encrypted: i=1; AJvYcCUVBrGRePkGejizH0se5c+NaXgm2Kys7DnXoh4NKtbGLEzy1CxSbVDXJ3vB88dHYjTrBzXhrZjMDa9Ler2muD//NGUmHD1Yd0BC7Tk=
X-Gm-Message-State: AOJu0YwiIBKVoPsWX5NmcumV2z/oxUbo3kCR6EHkEs4ZhbOzXc90ekAS
	6EA2YRmJoqAVD2leLyBdmwJJcBWZdahGyroW7l+gNrcQnRwnzFNOaRef1ozWCSz97VQ4SUzAgol
	61j90dQ==
X-Google-Smtp-Source: AGHT+IFPZZzOW2j+DkN9Sy3KUyhPgylEOLrrl6kk5V2kELvCuME6q8zJZSLazyZafjR4iK9yT1j7zw==
X-Received: by 2002:a17:906:4aca:b0:a59:6856:cbcf with SMTP id u10-20020a1709064aca00b00a596856cbcfmr2352388ejt.73.1714773176965;
        Fri, 03 May 2024 14:52:56 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id dt14-20020a170907728e00b00a5974a4d662sm1754382ejc.151.2024.05.03.14.52.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 14:52:55 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a58a36008ceso16640566b.0
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 14:52:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqh+HStpTsdI+UpTHgsUtK+K7qqFEvYUo8fCqTOV15WD0VENVJI1Mryf64goFTePkYSbzTwa3E5SgyxHLkh6mYp1q+XvcWsbZ3BbI=
X-Received: by 2002:a17:906:eca8:b0:a58:c639:9518 with SMTP id
 qh8-20020a170906eca800b00a58c6399518mr2622517ejb.76.1714773175036; Fri, 03
 May 2024 14:52:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook> <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV> <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV>
In-Reply-To: <20240503214531.GB2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 14:52:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
Message-ID: <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
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

On Fri, 3 May 2024 at 14:45, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> How do you get through eventpoll_release_file() while someone
> has entered ep_item_poll()?

Doesn't matter.

Look, it's enough that the file count has gone down to zero. You may
not even have gotten to eventpoll_release_file() yet - the important
part is that you're on your *way* to it.

That means that the file will be released - and it means that you have
violated all the refcounting rules for poll().

So I think you're barking up the wrong tree.

                  Linus

