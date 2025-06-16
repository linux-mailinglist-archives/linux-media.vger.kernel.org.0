Return-Path: <linux-media+bounces-34920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32066ADB1BD
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D08B23AB9AA
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7098D2DBF41;
	Mon, 16 Jun 2025 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q/6P2ggl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B5E156228
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080187; cv=none; b=GYuVWtorkYgQhBcd46CfdbOejFta9Ptky0lQSZ0/DDvdLr1n4ykT+e+LCzcxy/zkP/ASFbRdQ7HrM5NnK51aPgXW9fRwGzQZtG+7zBztREAjJgsq9RtrUVCCqzxWUaWrRXTg/vIbdv3c70+eI1L7Chv0tRS8Q7jH/YYeLwYtdJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080187; c=relaxed/simple;
	bh=KCD5428E2V4OWj4bxH6DMumzOTk0rgOlJJTO5eLsA3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OsTwt5Z3LROrocbBTZk/ievExoX/sVrlEm1lgks8ov2ewanVXzQoApdlMwKrJ39LskQ9L56mm2fAU1ysfl1kwTAc/9WYDFora1Cl0yR5LNesL69xFnir/lcVlerzfX7NXOm4mVT4MzXpqqn3LbGzZaW80wHhEgIsUU6OyCxGwSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q/6P2ggl; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553c31542b1so910395e87.2
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080184; x=1750684984; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QPiIwXPnB/QPRp9lTZSU0TIMgfDz8msjPC5y3Zu6Zog=;
        b=Q/6P2gglNhFX5JSn/TNYE4WC/y4jwf+pWVN1Lu4HiwbgF5ULtY009pZEG/m1pgfsr5
         j7XuoFzua6NKkNS+QmxHGrFBKXCI5QPYt5xzT5retPkHNd03RUtN+vCzD2y/zee5xkyc
         /jxu0YcIh6GustVWC5FflYDCJCqyeLquzdyJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080184; x=1750684984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPiIwXPnB/QPRp9lTZSU0TIMgfDz8msjPC5y3Zu6Zog=;
        b=Y8eyGScPQ9ME0HW3r2ESLKktkJPZvIyiNpVaCXwshPbe91/QdEndSmLrarqbmAZ+R2
         V+K8/UpW5eiY4cmSYO9vZVMHkX1J8ca9aPLf9ti23kkHJUPcOZtOPwNRBfw6emKy0qMU
         LokDvUoTM8fYxJA85pXK4wOwjhkQdb5Ilm4NpozrxyX2uIjJBNf5yECp7qvepSf3WJox
         5ZpTjl3vmFUbIT8tjCQZrt7lfduD8X3cBSwC4DG3RrN+hlA5NQdiO4VhWTQ2hV7EiMt3
         g1FWpWFXZnuqpksDK3Odqtxmr9k+xvmwILLMXFTHVW4AmGL8M2KmMbFLZDB8nGPOiZJj
         wurQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8aI9Qm6nc9jLRYeBdAvnGqRYJyNhOfLQ/dwm1yqYJ8/nz6ctM5mcCKcJHoLS7AwStFFArRqvA2Q2klw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5fMi4Hi59DhZZkDP8MgzCFwvnh8/halehXeD1+xZoA9n2u3ot
	SxRf9wtSht7A00uxIepEwRI6Ce0pAK2xgrR9QfZfoDkKoQFphvxW6L+oLqbbUgLYq8ss2550CoP
	Yesg=
X-Gm-Gg: ASbGncvXXPiH8nG0b9TD93Nd24q/pgJC9DVi1pVQX7rOXgOQm2xcEuDFaDWr21Lwi+g
	DKk7+rEHiXJP4a/fC/rBXPPXs2CGQGmaPhGXpcEkmiwquPxdsBAz8+oVoolQHFnnoNc+U+l4CCD
	aJ3dic0KT8Yv+1Pi+zEuznnEKsXbz/oTnWcDIZczFaXmGmB4nWw43XoA8GCQif8S4NL9ZDQO3FT
	isY6yuUYK9q69rbSRVmQwLeq59aM3XvfAmFvOT6XRGIcgSGYfX2gJhlyxRSs4N0t3Xej599E6WY
	np3C0K237EgKHu71zD82c63CWqQ+YCkQZvxSeH0qdnOG+MZTpJXG9gJ7IVPsDXxKL1j3CEAapo/
	m30EjaucZv2Y9i7qdfAb3zYuY
X-Google-Smtp-Source: AGHT+IEHRjq/eBje0M1DExFKvBvnv2J+bEwtiX5pQtG/HviZq/w/Wlm5a2VGz3XGaGVWSAeZ4bwbGA==
X-Received: by 2002:a05:6512:b0b:b0:553:2ce7:a1f3 with SMTP id 2adb3069b0e04-553b6f1df86mr2476401e87.43.1750080184313;
        Mon, 16 Jun 2025 06:23:04 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1360ddsm1546818e87.81.2025.06.16.06.23.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:23:03 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b10594812so4524123e87.1
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 06:23:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsDX4tCQpKSeuvre/rbMU3nu+p2G+zMRQXS7rdpYGoz9o0NWwHOJdaqDHhkswV5342TiPz85twoYp1Pw==@vger.kernel.org
X-Received: by 2002:a05:6512:1150:b0:553:2a0f:d3d4 with SMTP id
 2adb3069b0e04-553b6f4268dmr1908878e87.49.1750080183070; Mon, 16 Jun 2025
 06:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org> <f9275079-842a-406e-8bb7-b22a22b7c7e6@kernel.org>
In-Reply-To: <f9275079-842a-406e-8bb7-b22a22b7c7e6@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:22:49 +0200
X-Gmail-Original-Message-ID: <CANiDSCt18PUWo2Z-9T2nBMMJfpRcdAGhO5S0jE85-1ZPO1qD7g@mail.gmail.com>
X-Gm-Features: AX0GCFuqWLgUehzKJAibYIjgFF6eDhR6nU8vRFEBGE8EDAHBKBOg2zBL7WW-dyc
Message-ID: <CANiDSCt18PUWo2Z-9T2nBMMJfpRcdAGhO5S0jE85-1ZPO1qD7g@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: uvcvideo: Enable keep-sorted
To: Hans de Goede <hansg@kernel.org>, Hans Verkuil <hans@jjverkuil.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 16 Jun 2025 at 15:05, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 29-Apr-25 15:47, Ricardo Ribalda wrote:
> > When committers contribute quirks to the uvc driver, they usually add
> > them out of order.
> >
> > We can automatically validate that their follow our guidelines with the
> > use of keep-sorted.
> >
> > This patchset adds support for keep-sorted in the uvc driver. The two
> > patches can be squashed if needed.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I've no objections against these 2 patches, but these need to be
> rebased on top of the latest uvc/for-next. Can you send out a new
> version please ?

I was waiting for HansV to say that keep-sorted was useful and then
add it to the CI.

Right now it is probably just useful for the Makefiles and uvc.

>
> Also for patch 2/2 can we not just add the 2 keep-sorted headers
> and then actually run keep-sorted to auto-fix things ?

Do you mean removing the annotation after running keep-sorted?

We can do that, but we will be unsorted again in the future after N
patches unless we add it to CI.

If we do not handle this automatically I do not think that there is
much point on this series.


Thanks for looking into it anyway :)

>
> Or can it not auto-fix ?
>
> Regards,
>
> Hans
>
>
>
> > ---
> > Ricardo Ribalda (2):
> >       media: uvcvideo: Rewrite uvc_ids for keep-sorted.
> >       media: uvcvideo: Add keep-sorted statement and sort uvc_ids
> >
> >  drivers/media/usb/uvc/uvc_driver.c | 660 +++++++++++++++++++++++--------------
> >  1 file changed, 409 insertions(+), 251 deletions(-)
> > ---
> > base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
> > change-id: 20250429-keep-sorted-2ac6f4796726
> >
> > Best regards,
>


-- 
Ricardo Ribalda

