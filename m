Return-Path: <linux-media+bounces-37925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A29B08277
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 03:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 775C94A169C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 01:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91A81E98E3;
	Thu, 17 Jul 2025 01:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6lieXeh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E936A1A288;
	Thu, 17 Jul 2025 01:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752716162; cv=none; b=l6NINaVSLZC9qHSfERNhJNT5PwisnueQN3vPfK0L1hpsH3CgxKQw1d0VruMBiPnTQYzFwWPHvz877DEX5+CdpPgBeg5CNRUw7gGEjdnjqDNB4rEr0Oy/V6RYQx/YvcJkHnvT4fz/LJUaZEKnEITZTSvSAWQCz5t9Xwzz1hhf4qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752716162; c=relaxed/simple;
	bh=o1Fwf6j0ISsue9f3wIBUFF15vSnmrMxAjknVIWB6IA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N71mzP0Y7toY83HWkZEW501nd5a/C7+WFmiFK//2qYRzinqoCiyfUofInf1ukp/KHLetA9hWUgY1RgR9IU3lpVBQ8Rikx6qRaKOtJ7U2J3cj/Zzstilre8G+AoAiEFeIVygoD8Jidgq4DI1FGYHIWGN4SDVM7S6AqwNWUz0f04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6lieXeh; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e8bd443c9c9so62205276.1;
        Wed, 16 Jul 2025 18:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752716160; x=1753320960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1Fwf6j0ISsue9f3wIBUFF15vSnmrMxAjknVIWB6IA0=;
        b=m6lieXehDUGMplaTEpyZAXeteGc1bDOItf8qOKaTJ86jwyPP1sM4a+A9yo870KtBx/
         pnlGyq8rYPdHU4CuaPa/e8lFecTMg3hy5B/kxHxt+Qyw7DkRI4Xccd3tIzTyfgoJI8+K
         M9JjAzp7y52A4MpOBcu+c+GQUkgGu2ULX03loRPHBWntpP37qkd0+pI4NCRhmcv34q+f
         H2GNh312z+GjDPjZ5EO4JsbxYR87TCul2VJA8mS4J+Hz5GTzqgOI7XJ6+gqX856MIWJU
         aPuJqu2YGhdlkJvYJ3wKyR9x8gtA6+WYKuUWHV2O3Ge8WNGrdd3uyZKpQ/Rfo0CZCoym
         aPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752716160; x=1753320960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1Fwf6j0ISsue9f3wIBUFF15vSnmrMxAjknVIWB6IA0=;
        b=kuJXuUVkeqYrKle77uIkZqRLI0ZyFJmoEIPMt9z6qkhqPkbCPEs6PGevrd/fRvvePr
         wqvxvATlylOj7mEGOqz5qJixa4L2/55hjk1n7Y4NHitpfIBFHEKwJZOVrxA/xdCFMv1m
         vQVL2vilpP3IVpIcJ0pIxo3jbahvRsRKW7kLb8w6/gjb/+fwJapOCVM+hbNQheTvckRc
         SxlL0IicRmYP9IM7zWIRXGTgY6RejFNYbR+cqeWvfuyrBtWeKQWqPQi7pUGvF7O+U4X8
         MV/WDVc7zSepq8ILBmN6CzhTxx1+h4FNBkqMOu37bMMQvON3/DVVtaoc0V3oR012CgsO
         Ti8A==
X-Forwarded-Encrypted: i=1; AJvYcCWNJkK9UVRZMoXs4IflxOvskd/RdbryULSNf36ENywFqE+YM9PPRBVEOtG83a5DDD4+U3Gsb0eNsRl5tlw=@vger.kernel.org, AJvYcCXnXhxr5WYuoO1OtW9HCh70Yh8c5XmJnI0tCbnG18+qyHThUKAd/mEfbnzbUNq8mrqXKLuMklf8xG9iJAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZetgKtAfAlaML8ejr0c/XQw5n+6BvbuIIyan2xt0vZQjJAGp5
	oFZoR4UVsG8CEo/qfejkq6OQNvjf3otVgW/iHZJ0wSWU1DmU2Ac4t9R1jgBP3hPU7POrvs4n8OP
	WLYAmVu3QlKoDI7Rdvp0bMqqRSr5jVlI=
X-Gm-Gg: ASbGncs4PosdrCjNlKo/Kc1VhJdqx4EnsvEW8UvrRXc6LipXLuuNVvQ8KlsWJSk2KXe
	1gOW8v6IBMt6I1TaWannGCYobgvXT418AJHfXg2x3Joz6UbyWhTdYjkqA3BQoUoOctXk3MmKnhv
	aNBoyX0r32fQUk6GgOLkLdd9UqSrdtyfuQofU44TORmxWM6X1PWef8Ii/4S5Ch5cKW81PNVjh0J
	/eIGmCC8g==
X-Google-Smtp-Source: AGHT+IH/lQdFasnZ/62xy2rm8W8eVyEAu66p8hWMQS2ruZDTPQ4cnqhJNz+LLsT9MNxR7g7j30hd5GKkZuTm9PifFRU=
X-Received: by 2002:a05:6902:490d:b0:e8b:ca74:622e with SMTP id
 3f1490d57ef6-e8bca7464f5mr2429870276.1.1752716159856; Wed, 16 Jul 2025
 18:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com> <eb7fd8f3-1d6e-421f-b5d9-f9e2d2992da5@suswa.mountain>
In-Reply-To: <eb7fd8f3-1d6e-421f-b5d9-f9e2d2992da5@suswa.mountain>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Thu, 17 Jul 2025 04:35:47 +0300
X-Gm-Features: Ac12FXxNSZIFdZuBHmzo8FplFaJtPqK8r6zWUmZ798tWJAaeeE-AzyDD9PmzLmE
Message-ID: <CAGn2d8Mkfdmd3Td3aKQwaa539nMfL0rmJ5d6tLr9A12HSkCUzg@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: media: atomisp: More Cleanup on driver AtomIsp
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,
Thanks for your feedback

On Wed, Jul 16, 2025 at 9:21=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Sat, Jul 12, 2025 at 10:13:22PM +0300, Abdelrahman Fekry wrote:
> > Continuing the cleanup work that is being done on the AtomIsp driver,
> > This series:
> >
> > - Process the error inside hmm_init().
> > - Unifies the HMM init tracking method.
> > - move hmm related function to hmm.c.
> >
> > Previously, These patches were sent individualy but they build on
> > each other so i resent them as one patch series
> >
> > Suggested-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
>
> These seem reasonable enough to me.
>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> But it would be better if someone could test them as well.
I tested this by building the driver and i really don't think further
testing is needed
since this series doesn't introduce any behavioral or functional change.
>
> regards,
> dan carpenter

Best Regards,
Abdelrahman Fekry

