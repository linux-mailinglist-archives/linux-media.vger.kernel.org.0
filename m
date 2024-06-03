Return-Path: <linux-media+bounces-12481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6015B8D86DB
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 18:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8E0DB21FED
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 16:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B9C135A69;
	Mon,  3 Jun 2024 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p5eETr/E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723AB133993
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717430528; cv=none; b=jauN9YlUbU8Y/ffNX0dv1YRIOJ2jngj4JBF2SCkHnmmM6mc9x3SPgw0GIg/9TORbntZToaXd6JNMDz6Ih5cqWtKcFGUNNkzZ4uiQ39wNzd1yBeyVKAlRJVcp8RtE0TNRczVYQ5GGDBhGODzdMahmXEuZMYsOMRDb0WEU9nb3hGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717430528; c=relaxed/simple;
	bh=3pPvxS6gC0j0wLGI+tY2V3qvQ3+8OtijuhMmjKJ6yQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RabJ3kDAqyjVNugjMnIWuM9VzAKNM1ASyOCpkte+Tbt63HCN6yuRiINNAKEMsBBs4Kk9aR6Fwao7VRB7UmkrjgGmt1g29idjgs++Dlg75Sl8z7XaXBmcfGKCBZCwIuyHLR3jgaecJBfKh1OBF+W9RjoTR4+felf6zNxsxsgX7gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p5eETr/E; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57a16f4b8bfso23963a12.0
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2024 09:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717430525; x=1718035325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pPvxS6gC0j0wLGI+tY2V3qvQ3+8OtijuhMmjKJ6yQo=;
        b=p5eETr/E07844d7vd35bqJhYdG0vUZVgUqAIwededZOWY6Vmm9gOs7PsYdk8hFYphP
         6r8I+BNvRqo1Y7tMPa+PTld0bupt1nkxTh/Gi+eLh01ZeFgbh8bLw3c0WDcBLW8NB+EQ
         J68I0YieIvQRUw5T7GjO2CEz0D3kGAKGaIYhIjRdQo0R8V6JSX59XZjT5ORD3XvOk4D2
         ZKvsLrnzcvssY8mC/Gh6h9p7K7gfogOzIXPbr1Ed8WI7RYjMoVFnyKpKhSqc0vUjUgBV
         AzI/21WCYBkGKUN43lmug5QJXB949K3WNDxyxybU0keTgs/zVW8JTofEV23cZyLvpmFG
         z/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717430525; x=1718035325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pPvxS6gC0j0wLGI+tY2V3qvQ3+8OtijuhMmjKJ6yQo=;
        b=ryTnGG9nxW1pUUFo29otho4BLo2V4NCdy58yPRKjsTiM7ZfXXKKp77J3RbGLfW2YmT
         Iew+SWHX0a5ZePQ3jADz6H65kRXS5BiV9l4IsxCW9Dni+DcFH8RE5kMZ9R26CD17z8tE
         XWXQzuOZRZsQBn1Xx9jAhLvHy06q1w+vntrycEpP/vrk3523Uy/q6goqeqMhWl6rYtDU
         rOyJJ47h65K5hAklzfkf1y56dgCWkb3bWgvWWYa2TkT8scVXdIb1hvSrWzjFqsiNPwej
         p/lf8XTB5zRCiAd8lKjwkNQJqiBMjBhoyekSDk5gPHut9Bg3SDCrzhZQOCFpIJbdMrHR
         zryQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOqwBKtDyM/sH4sPsNvb2yBJGckZjmZmJuSoHwnKPnjsRxdiRfMJnCfqw066wvq3F4OYe32mewaIcRsAazj2D88S8/cxYcLSoZCd0=
X-Gm-Message-State: AOJu0YwCAmal2P3HkdMXEpKwL0YKZge9iGE3BTJ5q94YEqE6dxnBLSVY
	8fWX0lPlJlhpjFsztVwjIaoHffuW4k5GOo5VStyF+1pDAhqmlqD+z7EEwUFK5bhKx8FPEyLF8yz
	Jo3enGQtLbVYdpHZwrK8jliRNc3XBgMTFZg8=
X-Google-Smtp-Source: AGHT+IE2ygUL2gxko1zx9nZ3F9o7d4GPZHrXPzUVa/BVxhglHJFXHF4Y/LFsOuSgzTNV+PzRLjHurcbX0Q3lsDSwxtg=
X-Received: by 2002:a05:6402:1803:b0:572:e6fb:ab07 with SMTP id
 4fb4d7f45d1cf-57a49645b32mr266898a12.7.1717430524539; Mon, 03 Jun 2024
 09:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240603114008.16235-1-hailong.liu@oppo.com>
In-Reply-To: <20240603114008.16235-1-hailong.liu@oppo.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 3 Jun 2024 09:01:52 -0700
Message-ID: <CANDhNCq50zPB+TS+_Oo0HY0aUuBAdik2KrC8eJRTygbis293sw@mail.gmail.com>
Subject: Re: [RFC PATCH v1] dma-buf: heaps: move the verification of
 heap_flags to the corresponding heap
To: hailong.liu@oppo.com
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	21cnbao@gmail.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 4:40=E2=80=AFAM <hailong.liu@oppo.com> wrote:
>
> From: "Hailong.Liu" <hailong.liu@oppo.com>
>
> This help module use heap_flags to determine the type of dma-buf,
> so that some mechanisms can be used to speed up allocation, such as
> memory_pool, to optimize the allocation time of dma-buf.

This feels like it's trying to introduce heap specific flags, but
doesn't introduce any details about what those flags might be?

This seems like it would re-allow the old opaque vendor specific heap
flags that we saw in the ION days, which was problematic as different
userspaces would use the same interface with potentially colliding
heap flags with different meanings. Resulting in no way to properly
move to an upstream solution.

With the dma-heaps interface, we're trying to make sure it is well
defined. One can register a number of heaps with different behaviors,
and the heap name is used to differentiate the behavior. Any flags
introduced will need to be well defined and behaviorally consistent
between heaps. That way when an upstream solution lands, if necessary
we can provide backwards compatibility via symlinks.

So I don't think this is a good direction to go for dma-heaps.

It would be better if you were able to clarify what flag requirements
you need, so we can better understand how they might apply to other
heaps, and see if it was something we would want to define as a flag
(see the discussion here for similar thoughts:
https://lore.kernel.org/lkml/CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyci=
VXMXQ@mail.gmail.com/
)

But if your vendor heap really needs some sort of flags argument that
you can't generalize, you can always implement your own dmabuf
exporter driver with whatever ioctl interface you'd prefer.

thanks
-john

