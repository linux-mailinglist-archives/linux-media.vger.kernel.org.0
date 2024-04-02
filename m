Return-Path: <linux-media+bounces-8434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 459FF895BA3
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 20:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26BD0B22946
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 18:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BBF15AD96;
	Tue,  2 Apr 2024 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="We4EQh4e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9633A15AD87
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 18:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712082143; cv=none; b=CP6H3ZEDMOeBtzrXUMOliXvb6/DbKn7Fzs1xyMtYe9P/LblvZwqyEeIwLIiJAE+5v8Ah/bo46afvUckDvh/O3NJSHK7zGkG+29ji3xZN68jBlFx3ekLVZJhtgTbEDc4NhCLoHPBgQjj+zhCfJ7NMd5hj6scifwTLWeuguhr6Bfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712082143; c=relaxed/simple;
	bh=ia/tbJPIdeMfQ6ZZ+vaPcpfh03Y3DgIKVILN8aSZC/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtyvCnq7muRrt0V9tU8z8Lx9SjlV7iH4zRzFp6a0TfofIATkIT10EhK515VatI8ayFX4fRQ3SJfPmdUb4KJkbpL+Dk6yMn5EuRoh3cdv1rCJ3sJprbk62jwjWvG7/SMkQ1zBOXmYJAOhP1fvW/qublAlj+/mnI+XIckNbuy7q0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=We4EQh4e; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so5157806276.1
        for <linux-media@vger.kernel.org>; Tue, 02 Apr 2024 11:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712082140; x=1712686940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ia/tbJPIdeMfQ6ZZ+vaPcpfh03Y3DgIKVILN8aSZC/Q=;
        b=We4EQh4eguiKpHCZWFtXm69RFK03D7ckY3/FL2PvAlfz9SQM8yMtZagu/KWJd1hJJ0
         de7ir0uW3loDfgerolQzzu6Djfz3NkOVtihoM1bQ0WspU2tsDSftrPcC0tTRvO+iLJqp
         XJw88vIfdWibCfLfONx4ACReTQsje12kjoNvZZCFhYSWhFxuFfkVrLITwPNK11drV3mU
         66eyPTvqk/Zv5F1yTvf2+FlmT7jmc3GUBDvxtj+t6dyre87ICit72iGelIbF3EV58xY4
         FAXGk5viKqEzWlKkfoFM1JAOJ3gtGGKqBYDadPqQXQRVFZU+Ay68AraJukHpNkW6/SGk
         4COg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712082140; x=1712686940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ia/tbJPIdeMfQ6ZZ+vaPcpfh03Y3DgIKVILN8aSZC/Q=;
        b=a/2BowNSfjJxJN4Bac0bIoiGLSvb0q/xA2nV2t2qgncUfvhMwXY7jnSYxxs3mj0n0a
         Q2TjDqLcXQYkDh1KYYxHNNyMJYoMkzl5WzYCKl+XvZvPKBlkbSRd1qfTkQZv0d+XxKt0
         dT/LKPTn/NmqtnDaDeBjHhvVBOYI6gxU+C1ozhBYQI3DNLZa8EehQXDs26fuLCTULMfX
         PlXkfWZpXOrIbr2iumgV2+qHU83zaXlyDrCshLxLOyqbFr/eXyvaOX3BhfcOv7La4TIj
         IYPpO9X3LwjA9QhfMzHYpU6GzTSk+RCRewMxPx4TD66P2ayiJ1uV75Q5WSX3NOeD4kPo
         vTeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2Xx28VZUpfIz+Se9OwAmNCGNAgVS7JyFEjloO6FvFvmZO7W0emnQUySZ/JbEfjJQsF7dCRk7xVWxFHB2dUTOfIukcZijVuyodxNQ=
X-Gm-Message-State: AOJu0YyQIbG8HuAzFwzmzkPO5c47TqM+R0H1p7/8rNQDJ5czo1kPHDYY
	nyNpU1foHKoCpcAnpNlJO7iJDgnEKJqwxI17aHyuSoV2LA3OmwxHnZgQeaDt6LQghzQccEY9Og0
	7BrijSWiGrIk2sqIa6CXKPzJn7HUj/MGHSrY4
X-Google-Smtp-Source: AGHT+IELVyAijo8pj3GcLmB3cCFiU9WkTzB0n0l7/6pGqPaQ1F3PpSSJA0zcslPbroERdF7pfvQPJq16K7fY/gzJvBE=
X-Received: by 2002:a25:ad12:0:b0:dc2:466a:23bd with SMTP id
 y18-20020a25ad12000000b00dc2466a23bdmr11110164ybi.54.1712082140449; Tue, 02
 Apr 2024 11:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327022903.776-1-justinjiang@vivo.com> <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
 <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com> <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
In-Reply-To: <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 2 Apr 2024 11:22:08 -0700
Message-ID: <CABdmKX2Kf4ZmVzv3LGTz2GyP-9+rAtFY9hSAxdkrwK8mG0gDvQ@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: zhiguojiang <justinjiang@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 1:08=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 02.04.24 um 08:49 schrieb zhiguojiang:
> >> As far as I can see that's not because of the DMA-buf code, but
> >> because you are somehow using this interface incorrectly.
> >>
> >> When dma_buf_poll() is called it is mandatory for the caller to hold
> >> a reference to the file descriptor on which the poll operation is
> >> executed.
> >>
> >> So adding code like "if (!file_count(file))" in the beginning of
> >> dma_buf_poll() is certainly broken.
> >>
> >> My best guess is that you have some unbalanced
> >> dma_buf_get()/dma_buf_put() somewhere instead.
> >>
> >>
> > Hi Christian,
> >
> > The kernel dma_buf_poll() code shound not cause system crashes due to
> > the user mode usage logical issues ?
>
> What user mode logical issues are you talking about? Closing a file
> while polling on it is perfectly valid.
>
> dma_buf_poll() is called by the filesystem layer and it's the filesystem
> layer which should make sure that a file can't be closed while polling
> for an event.
>
> If that doesn't work then you have stumbled over a massive bug in the fs
> layer. And I have some doubts that this is actually the case.
>
> What is more likely is that some driver messes up the reference count
> and because of this you see an UAF.
>
> Anyway as far as I can see the DMA-buf code is correct regarding this.
>
> Regards,
> Christian.

I tried to reproduce this problem but I couldn't. What I see is a ref
get taken when poll is first called. So subsequently closing the fd in
userspace while it's being polled doesn't take the refcount all the
way to 0. That happens when dma_buf_poll_cb fires, either due to an
event or when the fd is closed upon timeout.

I don't really see how this could be triggered from userspace so I am
also suspicious of dma_buf_get/put.

