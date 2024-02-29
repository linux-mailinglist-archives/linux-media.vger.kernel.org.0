Return-Path: <linux-media+bounces-6121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC74786BFCE
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 05:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C82D1F24A3E
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 04:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8FBE37714;
	Thu, 29 Feb 2024 04:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="drpwoRdX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20DD381DD
	for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 04:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709180292; cv=none; b=Q8w6vD7FNqwjrQ119nQOpv+s4cp+NvaAB9la7x3KyRUkmUlcHsqXdIOchiCaDMjaWmlE0GnIXqQzxfXnwMT3epcaC5ypOBTmWmECfbFZ3W5C6t3L8rNbVsDpTy5ow7M1XO3k8EjwK1zlPDJO9VpqsmVJiOX+HZ4QELXI2l5fSzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709180292; c=relaxed/simple;
	bh=v4ozWXPoFQXoeobYncwfhK82DtPvtUDMptlsltCcm+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PF8TR8vffyMxVf/C21kItQJjwxucBoMPrETUIslMC1ADxuJpY+lnPxzKNyDk83E0VWp8eTc4Z80QpVBbl+jNhpwB8xOBjEs8zgHORSAu48KC/XzSoeTg+s9k4nDYpmdwhcw0I3ZB6EJeF8XBKcNn4hyJANaq3cXCxq8ixhWoRus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=drpwoRdX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412a9f272f4so43025e9.0
        for <linux-media@vger.kernel.org>; Wed, 28 Feb 2024 20:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709180288; x=1709785088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZRYC3eQbqO5jHdABTpHXvMtzoXuiWeOf7cPhtqaeWU=;
        b=drpwoRdXkycryx8t1UesLLprTXQqaNTBg2QlP9nPTpf4rn10TQhy0XKmNFXtdU+f62
         DBz1e+BhSChhxJWAPl64k9fN09lq63Z+FYXgn724t8sFJ1MCo1TR7ODLR+/T65OLh9u9
         1Za4rBYcdpGPMd2ntTscOZ9BlQZf4wqWWqu9VXAP5f9MIbjMebMSC+scSPH/OdN8qQ0M
         ySDGr5qNzoCWjLUtW1oU8KsZOetoMvOSVzkNvYivMzqxub1Y00IHrAIvQhb6EFvd6/GH
         DLnerpz3zetpsHNFIeZDctyNnOlnbpTIaRjVsXWE9dR25qWhiNu+hsQ0Deus3el2Jmr6
         y10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709180288; x=1709785088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZRYC3eQbqO5jHdABTpHXvMtzoXuiWeOf7cPhtqaeWU=;
        b=GauD+EjhUz4usIf+AsvZYCyHVaZr5Vc/bP0kSQDAh1MCYTdws4tFriak6axe/fEOby
         8UbprpW3psQCgfScovY0Pj+E0G4lqrjlDOLYrIREkatFPG5u5ZW5mmGXurtBUuidCjA7
         1DLZU5s7G5zea5sr8WYhXZxjdKdeoahzY8Ju5aH7ENqwROtID+P8e639Vn2RfDSjvAZk
         Y9rj/t1WF7X5XynFizUCzk7wPQjFvskTPZTtyDxtROTA2wJs/2s2Id5+IyLxqC5/3aE/
         v1z3hnGTw1xsj2Mi4KTRg0fCDSuyaXDyiObeGeC8k+pF+smNkuVXQHvcc0Vscl+DoWqO
         FlDA==
X-Forwarded-Encrypted: i=1; AJvYcCU5cH3ir5veBnMQDYkdWCqlkKldleNmgFFu1XEngHl1L9mA7+mNb72EedZA+RTrN2kiX+f0E74GfV2geIaro1ZXJ/prF6UyTELsnW0=
X-Gm-Message-State: AOJu0YxKWW58hga5vnl6uwXLyNuDncOZhKE4+t4Us55rlgBS9j2O6RF0
	BKuGWjSoF6sRhRAsSdRaa6MK4ivkBopyojlTQsjjwhTnm7Say+W03eX9oxNjNjkSrWrl8EL7Z8V
	Xk6sZCR9v3cY3sQDAk4E8ATkD7HQi4uK5Mak=
X-Google-Smtp-Source: AGHT+IEdAISHJic0YRCY4eYW9TXIlfte7WHoViC9o9WO2SnJ+GucjOMncEU5Qlfu9EM/Y2Uqp6ddT+4i3av0jdD18Jk=
X-Received: by 2002:a05:600c:1f09:b0:412:a9ce:5f68 with SMTP id
 bd9-20020a05600c1f0900b00412a9ce5f68mr63100wmb.2.1709180288042; Wed, 28 Feb
 2024 20:18:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-nifty-flashy-shrew-905edc@houat>
In-Reply-To: <20240228-nifty-flashy-shrew-905edc@houat>
From: John Stultz <jstultz@google.com>
Date: Wed, 28 Feb 2024 20:17:55 -0800
Message-ID: <CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqyrroCMQ@mail.gmail.com>
Subject: Re: ECC memory semantics for heaps
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 7:24=E2=80=AFAM Maxime Ripard <mripard@redhat.com> =
wrote:
>
> I'm currently working on a platform that seems to have togglable RAM ECC
> support. Enabling ECC reduces the memory capacity and memory bandwidth,
> so while it's a good idea to protect most of the system, it's not worth
> it for things like framebuffers that won't really be affected by a
> bitflip.
>
> It's currently setup by enabling ECC on the entire memory, and then
> having a region of memory where ECC is disabled and where we're supposed
> to allocate from for allocations that don't need it.
>
> My first thought to support this was to create a reserved memory region
> for the !ECC memory, and to create a heap to allocate buffers from that
> region. That would leave the system protected by ECC, while enabling
> userspace to be nicer to the system by allocating buffers from the !ECC
> region if it doesn't need it.
>
> However, this creates basically a new combination compared to the one we
> already have (ie, physically contiguous vs virtually contiguous), and we
> probably would want to throw in cacheable vs non-cacheable too.
>
> If we had to provide new heaps for each variation, we would have 8 heaps
> (and 6 new ones), which could be fine I guess but would still increase
> quite a lot the number of heaps we have so far.
>
> Is it something that would be a problem? If it is, do you see another
> way to support those kind of allocations (like providing hints through
> the ioctl maybe?)?

So, the dma-buf heaps interface uses chardevs so that we can have a
lot of flexibility in the types of heaps (and don't have the risk of
bitmask exhaustion like ION had). So I don't see adding many
differently named heaps as particularly problematic.

That said, if there are truly generic properties (cacheable vs
non-cachable is maybe one of those) which apply to most heaps, I'm
open to making use of the flags. But I want to avoid having per-heap
flags, it really needs to be a generic attribute.

And I personally don't mind the idea of having things added as heaps
initially, and potentially upgrading them to flags if needed (allowing
heap drivers to optionally enumerate the old chardevs behind a config
option for backwards compatibility).

How common is the hardware that is going to provide this configurable
ECC option, and will you really want the option on all of the heap
types? Will there be any hardware constraint limitations caused by the
ECC/!ECC flags? (ie: Devices that can't use !ECC allocated buffers?)

If not, I wonder if it would make sense to have something more along
the lines using a fcntl()  like how F_SEAL_* is used with memfds?
With some of the discussion around "restricted"/"secure" heaps that
can change state, I've liked this idea of just allocating dmabufs from
normal heaps and then using fcntl or something similar to modify
properties of the buffer that are separate from the type of memory
that is needed to be allocated to satisfy device constraints.

thanks
-john

