Return-Path: <linux-media+bounces-53406-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KpRG+tEn2m5ZgQAu9opvQ
	(envelope-from <linux-media+bounces-53406-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 19:52:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E922319C765
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 19:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 489D2308A878
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 18:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C81E314D3C;
	Wed, 25 Feb 2026 18:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yvVuxuFu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09207318BB8
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 18:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772045508; cv=pass; b=Vz6sQlnIqFqrHFC+84XKzFRcfveUt6c3ZAKLSi8Na5G/t7B3Mfu0OCI/NAA8SqfwFCztlrYSOckXGmLzauTrAKeeJTp5gtVY5LaGJ091O+ru9fC3CgIjKmkT5XXP2bJEOdUj8zYiq+Tvx356s713Jc3ElI+BLmP2H16DypIudII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772045508; c=relaxed/simple;
	bh=I8u5wRsILbockgP7XslREN6a+2ulpwAACQLe++cFxRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ee1atwCIF05YL3JiP1GXCxKhmv8rIXVFkkOXfZVpHXEd7E8x3VZn1s7cK8HpG0yB/c+KNS3iLzBRz+wSfcACd9xB62epUOeU4VzFVIFIPCTAlPFkPCLvrUyXV1g6D/HH7gvCg4ZQjkfqkXpShawx/8htkpaUquqzx1t6Z2692As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yvVuxuFu; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so1486366b.2
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 10:51:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772045503; cv=none;
        d=google.com; s=arc-20240605;
        b=aaZ7sIxUPQN8pfSvQR1C0kMAovHBUzKJItafd7USTGVGF4NqDLIbRCndhGF9t2u2fv
         FGVyy/nFLb2SmbKoAlAqa2oa/WqbfNB5oxJ52PZoHXjV0qICnGxvbatMOfQ6FsTYKU8f
         qSopmWcGYdaN0mx0UL02n7IwGKuzdXEZ8b1GO4daJWmAF8mUdyLAxlil1rZigvZ9NaTS
         UocdrK4z+HgtjSzXDz3P6+HvMRvRE3JUGA4OQwhqz8RKxE1bEmn/NDWBL/sFvDhfhk4x
         Sae4zL1BvSdB6w9/7FZywzdNVvGa1f/N4Eq0x4wQ3s78hxZkIi83U5bbA1SZpknndQSM
         i0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4oh/ifwivL8l9J8VT3JA58Q6ouuCYd8eO2HrHQHPvGw=;
        fh=xwdEaYAnxMMrpQ92y2EBRTFjvRRGL25EI3r0j0XKXgM=;
        b=SBXOfg+SmEi+pFj4joRYXKPUVnWZr1pbRPK8sU1/vN0yd7lLvTUlJYHlQtpEiMfRLI
         WlkkmBeMJQiu+oFoJ/W8vWcZO85Q11RTI/gEMSKUMul0KG5CSBTYIoCntQS2/HKVPvEe
         KOb/P5cNIJxl4YPXScx/lw9LV73TxUR494unOSAg57s/YSRSpb+O8ZF7HVBGE4wdqtnB
         PktpSSDcA4E5geCXD3mg81Q3u2j5TSNXT3krP1usZYXVgwj0mEOu6VfNlQIlmtdUIb4k
         1OtS9lrE64HdoCjRABzgxIu2Mc5usXKtDfp720CTMN8vT0nzs4GQVZgeuOKGffSXWdlf
         DdbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772045503; x=1772650303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oh/ifwivL8l9J8VT3JA58Q6ouuCYd8eO2HrHQHPvGw=;
        b=yvVuxuFu8rEqKoXHNhrLUnO9veVlllKYPAscQPMiff4S2gYOpNoOCXfAb6icY2je8z
         Ck52vvz+m6dL7lEPmJDSf60sO1ZhW3gMinISo6270v4aQ3Fghjs5nJ0BlE1JD1cCQmSw
         AAqpwLxMYrgI5/6QtiQiAJ30dtQvQ+EDvHjzJTo5wp6MQp6a9jc5TZcL959PBYiXkQRm
         pxkUxPIvqn4u2EGU0j+qCsgeMyP1kUB4sni3Pd+VCnGAbkKFrGLZP5ap97D1uhz6KfaW
         jWcGgIHR0Ta2l5OBQvht7LLCKMAHmxVseOPH0YglVv4ATyCykcwgLyAHTAEdtSSegRnD
         tf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772045503; x=1772650303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4oh/ifwivL8l9J8VT3JA58Q6ouuCYd8eO2HrHQHPvGw=;
        b=oPbbZYxi+PlzEHUwNbJprZt6LYxbtXeP6uxFKf685e2Nryyc7t1UiQHbl7XkpGTfcA
         iBY4M6tTConvX6Q5bLIzSvNWtzS3p21cK/OkHWhiVQGRQnFToB+5fnyl/lrxJxIIYWQ+
         TzFtVvLDQyBvTTg9vGBvK47iFz5Lmbq/x/z0KgBkfPCOVY0knXMpDvNtu3UegjmSPLSw
         9x3HuUaEGKO9Ab4vklodioS7X+Vu/+rR+wa0b9fxsdEetstoEoRh9r/gL+zp+M+OSjT7
         91tJdmr7Bc1qsslmRYSbDEVs4BRjGho6V2QqzzdqpYNIlFsFnQ3Cw8oddhaicRG1NUw1
         WlYw==
X-Forwarded-Encrypted: i=1; AJvYcCUwcLktO4yOqmhDlqDT0hCEha712K5VmM532HM9WIWIPG7y4OYvQnexIqL8Ruv5PlXRwKEIysq55tlt0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN4y96kDl5wWYu5MM7/x7BGRfe75BQPnFEqAgVL1F+BqfjcxE/
	i1Hkc4VTddlWNW7xNCETiKa/KhWwCH2DMkqv7FJJcWT0zdUEQyzW5ri6UpZ+vOQQ9YJuL3yAtgY
	pIF5g0yMnJmBZ6nvJukU1nmPpK3gFKlxtm7hMAvY=
X-Gm-Gg: ATEYQzxHnE9OfalUTUgzxVlOELI0Vkgaa07Vx83+FrYHBompnF60Q1bdLCZEG0JkTHc
	K77LDK24FuBxs3A3UFyQDYZIR2wQSuIx1md0QqvI5w2ChHNZSnTIZyOEwWlxTtO6mufpl96Hkrx
	ZjwSty78dA2jO8lfF8J4UcOs2dxg8OhXbU795uXADIAf/lvqphrr77lWPzUc0F+6YyHyqMwPxgW
	KkdY63DdMvW9hWPUwXyay2YsXijKAQFDJVhHPBKKZs/IxF3jB1g5rTJ1qYoL0Z1ufohKRfV9JoL
	bsG6ta7JyP6+vZ4vXhVpwDy8wurnssY9S36c
X-Received: by 2002:a17:907:6094:b0:b93:3792:4b03 with SMTP id
 a640c23a62f3a-b933792588fmr385769366b.32.1772045502705; Wed, 25 Feb 2026
 10:51:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
From: John Stultz <jstultz@google.com>
Date: Wed, 25 Feb 2026 10:51:30 -0800
X-Gm-Features: AaiRm510JicR5yB6-6HzIZrjZoL6Jbi8o9bjBsqrkrZBCAWaavoCU9peMfkjjyM
Message-ID: <CANDhNCqk9Uk4aXHhUsL4hR1GHNmWZnH3C9Np-A02wdi+J3D7tA@mail.gmail.com>
Subject: Re: [PATCH 0/7] dma-buf: heaps: Turn heaps into modules
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53406-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jstultz@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E922319C765
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The recent introduction of heaps in the optee driver [1] made possible
> the creation of heaps as modules.
>
> It's generally a good idea if possible, including for the already
> existing system and CMA heaps.
>
> The system one is pretty trivial, the CMA one is a bit more involved,
> especially since we have a call from kernel/dma/contiguous.c to the CMA
> heap code. This was solved by turning the logic around and making the
> CMA heap call into the contiguous DMA code.
>

So heaps-as-modules is common in the Android kernels, and was
attempted to be upstreamed long ago:
  https://lore.kernel.org/lkml/20191025234834.28214-1-john.stultz@linaro.or=
g/

And it got a fairly chilly reception, but maybe having the additional
optee heap (as well as other proposed heaps) might sway folks on this
now.

There is also the kref bits you might need (which Android still carries):
  https://lore.kernel.org/lkml/20200725032633.125006-1-john.stultz@linaro.o=
rg/

thanks
-john

