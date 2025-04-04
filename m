Return-Path: <linux-media+bounces-29390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F65BA7BDAB
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 15:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 456683B0B08
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 13:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEE51EA7DD;
	Fri,  4 Apr 2025 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJfdyxkh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08128635C
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 13:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773074; cv=none; b=g0/dkgIvg0uqUjfD2rQCtzykaCOvTs0fES1bryKzAJUb6mSK0ykCP0ZpmvFQY3Rnj+e8iUXWUbjEL/vExvWjF4ecrvZ72Fv2rGVKUVj35EgwCfNw+QRcOOEQd7U+tanjmDT8E7utuJlaZjuBp/s9dVS9y5mVCr28ikO253DK7bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773074; c=relaxed/simple;
	bh=hQ41oWHGLCBhnT0ChI9QgBkv/4fBnV3Bb0twvEj4d08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EV85nL4L1A2OcVmKcoAURzYrI1XrBf/Ooif1WdTv+PKSGOuMbOaERwywIarkqYuJGypRVTcN03HCq+zQx9c5NtX3MCEwfv2kQqp2s2Sv2LabLzNKd9tqnwqcem3wS0Yr5pw28YJmMusZf+LfY36HLbrPOEeMIRbDyD7zH3Be6Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJfdyxkh; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e5dc299deb4so2065653276.1
        for <linux-media@vger.kernel.org>; Fri, 04 Apr 2025 06:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743773072; x=1744377872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ41oWHGLCBhnT0ChI9QgBkv/4fBnV3Bb0twvEj4d08=;
        b=cJfdyxkhn0fbGGUx/FajW30cv2X/tA3QUoT5TvTgpNJ7xRamOh5sd8uMyTNO0QeFRO
         nxwAU2T3kinMOqwGovUbkVRJqASxJibmN1S7NeydXGpMHoXds792U9caVQyaUQq5Crca
         AL1HEcjB2YtBkBT+V9ZQ7j6XTInwHJVmNjL9sr5/e7+YY/A2OY6vUp2MrNFunCzvuCuv
         hXypdhUbAI5cwPT3AZZA+flurm48zkGgSFRPMMvW5EuLrH8UJ3+F/U5BWvYEUJnzwAbc
         Ku7bduTeMeu1PCJTTdSMKj+g05B4TnKp6CQCSy3oNr8SCz86UmmR63aKh/siGrtbcQDs
         Yw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743773072; x=1744377872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQ41oWHGLCBhnT0ChI9QgBkv/4fBnV3Bb0twvEj4d08=;
        b=FZ3fUOLfcRgu6+yY4+x5tNl/oYlfNphsLhR0RvhAsZdAwwUJroHf1Ck8CxMCd+IyXu
         HDqtxEILOIQZmo1gdD1gTyXyDjTpx0XAeTmAeX0Z8bDSLYA0mLh0W6Pkdm4QmIs9eRdq
         QMniDa6XOK9qD14masRb3rWvbCP4cd8PtGdOAlVhQQ1LRFZVu6SD65B95uyzqSkGbbkO
         /18XSLGpTm+q8F2D+P3vx/HEx8V+Y//N1FdRGan6hvaF1hH1+2ePC9Y7wFbyKQP07+bQ
         igDhEYTJfV3JpQc8iWn/tae3kzhhWxlZ7JCn6HCMO09PW55A6ld05pS5c4H1AeZ21LyM
         uaBg==
X-Forwarded-Encrypted: i=1; AJvYcCUqI35GKDaR2Hh+avSpLIe1l8lWnnWoC0sV7p2FmxmDArC1oKj2gxHC8fZc2pr9oL/Q62SZJNeqUdyhUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrr0Y1HwF2JmeNOgXIxn8aW/0912ORh1U78UIcKXyS9VIILPCi
	qWca0kGpwsfBRq5QUjUqp8pwf1JDYW5nLGZcjG6+/WUH0C9kix8Rbf1w/BxW8dLPTg9Be/NWIxc
	zloNuH+3Iheaspm6XRjYGqThJNZk=
X-Gm-Gg: ASbGncukgAAqaEW4fT3RSGdS+W7XZLOphFUjCyCSrTHn0Z0c/2KhGZoWpqNzVenm/8C
	7pIpxMIggBjdG3nzE5iX3IgZg3Z04iSefNIKcIkIQ8MbzSnQSPYlAHNR2LPgmEQpOr/rSKJUgZu
	FEU8b71ojbGJBM5SOcAqicm3ks3EY=
X-Google-Smtp-Source: AGHT+IG7fCt3Tlfq6fIO2M2spKQNbvjM1FTAM6oUeqqQFOWxwQhqwbBNwpfrQBUs1FbHELM/M5BduWuTE8N0Kw3Qyek=
X-Received: by 2002:a05:6902:2209:b0:e5b:1c0a:6cb6 with SMTP id
 3f1490d57ef6-e6e1fa83e20mr3853917276.36.1743773071628; Fri, 04 Apr 2025
 06:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+rFky68eJtRkFeSx7MzZNzQteXi67fuy9V3g3G4H6oQERRqpA@mail.gmail.com>
 <Pine.LNX.4.33.2504040021000.32424-100000@nmr.nioch.nsc.ru>
 <CANnPPRrC5LHJACd3zVTzTZFjQSyNsHZd_A7BQR+uPfGPpE0ofg@mail.gmail.com> <CA+rFky6EEqMti7qwV6_E93gFOs1F6KyAfmCMF0B7zBy1kba9wQ@mail.gmail.com>
In-Reply-To: <CA+rFky6EEqMti7qwV6_E93gFOs1F6KyAfmCMF0B7zBy1kba9wQ@mail.gmail.com>
From: Andrea paz <gamberucci.andrea@gmail.com>
Date: Fri, 4 Apr 2025 13:24:20 +0000
X-Gm-Features: AQ5f1Jom_d4gU3yL_fuZYCjBgy3JmpT-rlPGwZT5TXhoT4qOevXAOb9MkIlJrM0
Message-ID: <CANnPPRrydXtJM+FGp6zg1-YHUiy30t8bvNBE6DzBQtMttZTDJg@mail.gmail.com>
Subject: Re: [Cin] "Unbounded" floating point image manipulation
To: Andrew Randrianasulu <randrianasulu@gmail.com>
Cc: FFmpeg development discussions and patches <ffmpeg-devel@ffmpeg.org>, linux-media@vger.kernel.org, 
	karolherbst@gmail.com, Ilia Mirkin <imirkin@alum.mit.edu>, 
	Georgy Salnikov <sge@nmr.nioch.nsc.ru>, 
	Andrew Randrianasulu via Cin <cin@lists.cinelerra-gg.org>
Content-Type: text/plain; charset="UTF-8"

Thank you for the detailed explanation. The sentence "So, unless one
deals with sequence of tiff/exrs there always will be at
least one step between what libavcodec outputs (bunch of integers) and
what cinelerra-gg can accept (32fp at best)" together with what Georgy
explained, indicate that not much can be done, not only because of
CinGG and its plugins, but especially because of ffmpeg.
Out of curiosity I tried using CinGG's internal engine instead of the
usual default ffmpeg. Tests with the two Blend Program give the same
results as with ffmpeg. I should try a pipeline with EXR sequences and
see if you can keep the color consistent.

Looking at the ffmpeg-devel mailing-list, I understand that it is
impossible to bring ffmpeg to work in float, they would probably have
to rewrite everything from scratch (I saw that you reported our thread
with no response...).

Arch:
startx requires you to install Xorg (I don't know about Wayland).
Maybe that is the problem? Why did you put Arch in anyway, isn't that
just a problem with Cmake?

