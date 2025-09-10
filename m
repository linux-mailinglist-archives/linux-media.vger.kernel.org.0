Return-Path: <linux-media+bounces-42147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEF4B50DDE
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 08:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CEF51C229D0
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 06:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10EF2DF12E;
	Wed, 10 Sep 2025 06:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L6uVEeVn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1EA30596B
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 06:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757484626; cv=none; b=hIZNp2q38SbqnllxjMrRpd8ljk+PFokwP70WzAijpWtex6qUldsJzMkgKA2rHPVaYT9jGEsK8wgYX/cGvOTQBswGCBt4L12wwPx4X0uzcjsllLqhZLHL0GvaQ30RzYEqviJDjIFoDOo34NeySUj1TpXnAVqVbFJw2qKyhkVtTUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757484626; c=relaxed/simple;
	bh=ClXCxvGsspMwKeL/EeY4IxZz+ng+hp4sPrRZlaFOJ64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syqnyH2rdw+GeKWImXYhJDgNSACzB1gkv8rdpq0I5LdlqYgABwWWXwKTHosffS20fMwoPR9MwSjLL+k6H34I7IbLysH8OUdxY7SXOfTrbbf7P7fj4nbwYSRyqfKQ4j7n/1U+87BAt0lxO6CCXbxVF/eYrXm9y1gBBuuoHhsoTkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L6uVEeVn; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b04ba58a84fso566862066b.2
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 23:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757484622; x=1758089422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIIpzdS8c9OeYQKLWQsdxP00kZekR6xE06hcgvXgJZ8=;
        b=L6uVEeVnuV+TRFhwoR4k0+pRn9tsFgofMY8hn9LdRQzZQ6QvF/JBI2nlbDqbexrJMm
         Ey4GeXGAffOYHkx6v1qp2aIe3DT1V2ID8DUl5tFQJwqRo9ewg0WQR1BjVrG3r3JmtZo5
         IyNmeb/d22n0E0t0F/OQPJWow7nCY2jNTfd21E0FAhC3XOjIeWztQ0lk9X30g2MoD4+L
         QN1rdOfOwe3Oq1u5EOwJCZ3Clpmx67mxqFgWUlJPOsfOc1/Ogy2muLgQXMsQOkdTWo46
         uUGedxgxPOwT6qk6wAZ3Ow1NKnu6n45H5bG2gIhOyZEN5GNK/HWrRIRi8bQUU3F4DH2F
         lE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757484622; x=1758089422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIIpzdS8c9OeYQKLWQsdxP00kZekR6xE06hcgvXgJZ8=;
        b=AmAKId3V6nkAIX8OQd52HVp6T9ZohDv4m270hx7LE78+Jg/kw+96H+7tZTRyxWOzFL
         nDAIC3ZTRCHA0m5wmX5+koQzPczvBkK2fNJnu3wgiTqyX7pqMg6i9vqs+/G840pk3gV8
         9hy8AewWvJGiL+HbX7shF8IIf25eZB+e9BmH3IllF4H+zSnOEusGcMPeACNi24I/mjnS
         s5LCF9QqrS16sxvriujV2MIRYgBMNsR6jff8MTCfcIZvzIHaFXkZSY1k2EOhnj0TncyD
         Kxti7yGBJRuATQiVyTYEByB8SzG+9DJj5uG7jtKmqFI53XgAsy7FQTmM9w7dFBdVZQAM
         xmlg==
X-Forwarded-Encrypted: i=1; AJvYcCWkhZfwxwvo1fyKYJ7E8A+XuEt1Umipb/ttiBWPZ8fEUZ6V/R5VtupsiRObQpl7CuCO0N3EhJ5rE016iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlwtUzGIyq+G6s2TKKA1haT9Y5JCwhKj9XMJWjVJjNH4SmFett
	uK6N428BnqDM+esLV/3MnYeaQy8Ltik9uWoSFqutLXeNWohY58FMSXfx0STR7pg+UigSTT5mi0v
	WEDfj5P5J8eHKrq4Tu4Qz3J6T8eSsoHrPCjzKae6YUQ==
X-Gm-Gg: ASbGncuJJWD0h34xluXHQoGE+kcWvVl02RTZz4dXkG+DZC562AXgjehOPB4odipqA89
	GKFu3D6kHbgMHcuCwkTjUp/p7uKe3dCPw7Loj3PjNnbiWPAI5yTrwM+nGolQRBQ2PVW+iHMyV93
	Ap03Yy5jVqrUdoxi168jIuv6Ip0TERsGUeP68FGWbzS5mFIkcAUK2XKHFxVOVlIC9VfA2i46mUU
	+cJJMcqgZXqXxS+G6KUWrkCA3OhTuLTn/OXgfg=
X-Google-Smtp-Source: AGHT+IHtltdBE6OyCGOjnTcRy/1zlqJJiS3bBRZ6Sp6xQiGD2+sybE8i8kqhky52N8PljETBXEHJPYT64WU/zafZwdY=
X-Received: by 2002:a17:907:6093:b0:b04:5e57:6d0d with SMTP id
 a640c23a62f3a-b04b1714547mr1454575766b.50.1757484622475; Tue, 09 Sep 2025
 23:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728-dma-buf-heap-names-doc-v4-1-f73f71cf0dfd@kernel.org>
In-Reply-To: <20250728-dma-buf-heap-names-doc-v4-1-f73f71cf0dfd@kernel.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 10 Sep 2025 11:40:11 +0530
X-Gm-Features: AS18NWC9G3fMk0QfS66tLk1WOnGvCPe7TBSPm8NPx9Lx1FMibITf2FeEIh1wODI
Message-ID: <CAO_48GHsteXa9vu5n8FyuWYGOK7yMBhz3ppQeO=CtxTdcM+K8g@mail.gmail.com>
Subject: Re: [PATCH v4] Documentation: dma-buf: heaps: Add naming guidelines
To: Maxime Ripard <mripard@kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
	Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Maxime,


On Mon, 28 Jul 2025 at 13:51, Maxime Ripard <mripard@kernel.org> wrote:
>
> We've discussed a number of times of how some heap names are bad, but
> not really what makes a good heap name.
>
> Let's document what we expect the heap names to look like.
Thank you for the patch. In principle, I'm ok to take this patch, with
the obvious understanding that if there are future heap name
requirements that can't be satisfied with these rules, we will discuss
and adapt the rules accordingly.

I hope this sounds reasonable to all.

If I don't hear any objections, I'll merge this by this weekend.
>
> Reviewed-by: Andrew Davis <afd@ti.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Best.
Sumit.

> ---
> Changes in v4:
> - Dropped *all* the cacheable mentions
> - Link to v3: https://lore.kernel.org/r/20250717-dma-buf-heap-names-doc-v=
3-1-d2dbb4b95ef6@kernel.org
>
> Changes in v3:
> - Grammar, spelling fixes
> - Remove the cacheable / uncacheable name suggestion
> - Link to v2: https://lore.kernel.org/r/20250616-dma-buf-heap-names-doc-v=
2-1-8ae43174cdbf@kernel.org
>
> Changes in v2:
> - Added justifications for each requirement / suggestions
> - Added a mention and example of buffer attributes
> - Link to v1: https://lore.kernel.org/r/20250520-dma-buf-heap-names-doc-v=
1-1-ab31f74809ee@kernel.org
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 35 +++++++++++++++++++++=
++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index 535f49047ce6450796bf4380c989e109355efc05..1ced2720f929432661182f1a3=
a88aa1ff80bd6af 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -21,5 +21,40 @@ following heaps:
>     usually created either through the kernel commandline through the
>     `cma` parameter, a memory region Device-Tree node with the
>     `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
>     `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
>     might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> +
> +Naming Convention
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +``dma-buf`` heaps name should meet a number of constraints:
> +
> +- The name must be stable, and must not change from one version to the o=
ther.
> +  Userspace identifies heaps by their name, so if the names ever change,=
 we
> +  would be likely to introduce regressions.
> +
> +- The name must describe the memory region the heap will allocate from, =
and
> +  must uniquely identify it in a given platform. Since userspace applica=
tions
> +  use the heap name as the discriminant, it must be able to tell which h=
eap it
> +  wants to use reliably if there's multiple heaps.
> +
> +- The name must not mention implementation details, such as the allocato=
r. The
> +  heap driver will change over time, and implementation details when it =
was
> +  introduced might not be relevant in the future.
> +
> +- The name should describe properties of the buffers that would be alloc=
ated.
> +  Doing so will make heap identification easier for userspace. Such prop=
erties
> +  are:
> +
> +  - ``contiguous`` for physically contiguous buffers;
> +
> +  - ``protected`` for encrypted buffers not accessible the OS;
> +
> +- The name may describe intended usage. Doing so will make heap identifi=
cation
> +  easier for userspace applications and users.
> +
> +For example, assuming a platform with a reserved memory region located
> +at the RAM address 0x42000000, intended to allocate video framebuffers,
> +physically contiguous, and backed by the CMA kernel allocator, good
> +names would be ``memory@42000000-contiguous`` or ``video@42000000``, but
> +``cma-video`` wouldn't.
>
> ---
> base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> change-id: 20250520-dma-buf-heap-names-doc-31261aa0cfe6
>
> Best regards,
> --
> Maxime Ripard <mripard@kernel.org>
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Senior Tech Lead - Android, Platforms and Virtualisation
Linaro.org =E2=94=82 Arm Solutions at Light Speed

