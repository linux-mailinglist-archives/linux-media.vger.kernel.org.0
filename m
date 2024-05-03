Return-Path: <linux-media+bounces-10740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BE78BB65A
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 23:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8BF71C23382
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 21:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31B086257;
	Fri,  3 May 2024 21:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BWAXnd37"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1C082D68
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 21:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714772564; cv=none; b=dXDJudwhEJGPwKFSkKAet2UVDy0NqKJMrnhKmbMrBtAZBpjQDLdFicEZq2y5YzwN9phcYMzDBPXEsOVzFsHJAyHIE2B4ZLwwncZiTeZOnhn7rwjLemtmsfCMO1Eoqpo1xuOXD0aiu8jtsqApVlaTpabYaGigPGGOGqkAxZ+Cyx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714772564; c=relaxed/simple;
	bh=5kw/vQ2Z4GIERA/PZJO8R5H1So5ym6+6uJIhwrtRtXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUInTgFWYIf0JxRt6+FRpbP3Sa3ttjHO94PQa1BPl03rMzAjES2x+wS51eaNMc0Y40GfMTwHwq3Q29N7nGq7yGrjSvMsNzPncoDXk3nTVYS1mehcmQsy9iH+nTSWrsAbrAICweJpL6GjwMP4y5uSh8Hc37hQoQp4Lzgdj8YCXn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BWAXnd37; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2dd6c14d000so1770891fa.0
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1714772560; x=1715377360; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gwyBdWufoxKVrcKcsHh2OBVbUooApVD3S23GDedqB7U=;
        b=BWAXnd37oXbnZsHze4We8ZkQ2HKVHWZsPh/SWnlt/VZHjV0RmWa4S4DKTQ+NL27DM0
         nMyoXBjC0O29EriEDpUE8WaETB0t4T89h9M+RrAoO/8hwJ2k/lrg9hT4ucl70xcNtSYA
         XZNEbxPjWWleEcwSiTWkepTDqZISPhB2T2YFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714772560; x=1715377360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwyBdWufoxKVrcKcsHh2OBVbUooApVD3S23GDedqB7U=;
        b=F2i23yvTE9a8EB/DUw5fXjYA8Lqnd7vmaNkoy2/LaLU8/bREbfyp2PFmrt1Nj22nsa
         gvZckgZ/s7Bjcqr8Os4kDMPJL+rHxmiUInmnU3fq1GFsHFi9eBJNpJ+UPo123Lqqd/X4
         hqNVBS+5376xt7kV1CEl9Bz8odS5Y82mpPCGg0h1lu2B07TZfE+fb2gwZTWzUrmKsjVK
         5nXCJCwaZkdu7iiuIMwqzgkqMDrAMEIxsuuzeU/2gKsNmBXeUFvusN0/B0by+Q8o7Id/
         f3YgME6vHYJ/f+aaeTbgKBhumrOZz1iRpGhd7ldWLY5jZtcOnIIJ7Vh3yUIs1ZfLaw9l
         2goQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+ZAJPndREAbPXf3yRr+JfLgk5ID0+7lsP1Hh0+KHO207Dn1G6j9PvkvU+yjTLwQJMMGWR/H8DKLf9XQs6dLDGCcuif76l0tiQVxw=
X-Gm-Message-State: AOJu0Yz1aHeUeDRSheiOC2AtafSjSWXUb3WsI8be9P/BAybI/4YWHVLe
	wjK5fK5n1JNVTZIOtuKdBg96PR8nxb1pcm5OZSC/SxaNcc9sqRTWalFSB68Gm+oVeM3p5RCY2MR
	mrDkrBQ==
X-Google-Smtp-Source: AGHT+IFjHJj3bJReRN8bOvlimFIdX9FmVolK1jeGjAb5OTc3TKEe0zWDUchlz/Sm+pxYmXRmw2yjQw==
X-Received: by 2002:a2e:9f0b:0:b0:2e0:a39b:2b25 with SMTP id u11-20020a2e9f0b000000b002e0a39b2b25mr2488230ljk.48.1714772560574;
        Fri, 03 May 2024 14:42:40 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id df13-20020a05640230ad00b00572300f0768sm2161785edb.79.2024.05.03.14.42.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 14:42:39 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso15730966b.2
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 14:42:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNEDKpKGSZcufn5ijDBTUTOgu6aU61Wv38zDHrga2N5rvnrzgAEsc0uGBzybaLLEd1LQL9G3bLymwQNRkMYGl+OR2OM5gA76NU9w4=
X-Received: by 2002:a17:906:29d4:b0:a59:8786:3852 with SMTP id
 y20-20020a17090629d400b00a5987863852mr2658677eje.55.1714772559064; Fri, 03
 May 2024 14:42:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0000000000002d631f0615918f1e@google.com> <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook> <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
 <202405031207.9D62DA4973@keescook> <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
 <202405031237.B6B8379@keescook> <202405031325.B8979870B@keescook>
 <20240503211109.GX2118490@ZenIV> <20240503213625.GA2118490@ZenIV>
In-Reply-To: <20240503213625.GA2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 14:42:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgRphONC5NBagypZpgriCUtztU7LCC9BzGZDEjWQbSVWQ@mail.gmail.com>
Message-ID: <CAHk-=wgRphONC5NBagypZpgriCUtztU7LCC9BzGZDEjWQbSVWQ@mail.gmail.com>
Subject: Re: get_file() unsafe under epoll (was Re: [syzbot] [fs?] [io-uring?]
 general protection fault in __ep_remove)
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Kees Cook <keescook@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
	Bui Quang Minh <minhquangbui99@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	syzbot <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>, 
	io-uring@vger.kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, Laura Abbott <laura@labbott.name>
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 May 2024 at 14:36, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> ... the last part is no-go - poll_wait() must be able to grab a reference
> (well, the callback in it must)

Yeah. I really think that *poll* itself is doing everything right. It
knows that it's called with a file pointer with a reference, and it
adds its own references as needed.

And I think that's all fine - both for dmabuf in particular, but for
poll in general. That's how things are *supposed* to work. You can
keep references to other things in your 'struct file *', knowing that
files are properly refcounted, and won't go away while you are dealing
with them.

The problem, of course, is that then epoll violates that "called with
reference" part.  epoll very much by design does *not* take references
to the files it keeps track of, and then tears them down at close()
time.

Now, epoll has its reasons for doing that. They are even good reasons.
But that does mean that when epoll needs to deal with that hackery.

I wish we could remove epoll entirely, but that isn't an option, so we
need to just make sure that when it accesses the ffd.file pointer, it
does so more carefully.

              Linus

