Return-Path: <linux-media+bounces-31045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC21A9C41E
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 11:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2C083ACA10
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CA5238C19;
	Fri, 25 Apr 2025 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyVJ9EWZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB817AE1D
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 09:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574585; cv=none; b=oyw/poXRUhtn6tmPSd3uRIRnl0wQczBv8JTVimzIpqBldW7knUksLZWcoAA+iHNqm/cbq8jI8O4qXMbOExGjQYhmoLF6P88ky4W2/JJIvLdln2/o56LZozLeSCngq38W0yM0uoFuvTPAmnthcD3axpMz10ALS9C1/uluMXPG2fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574585; c=relaxed/simple;
	bh=6jMvEFzz+EHkTvpkKhpa06WUQGQd+irJhI2wXqWd4Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbpOINpiFpJMPgcQBQ2Gn55/7JwoBFx8kHnhQ08lmAfgRrIBnM/305AuKB+bnykb37vUeb18K14k/Us22bQEJiyBvvRXDsjZDahP7DOJ0pLrsEdu6GiaiVC5P54a2rSxUknfKgdNm1hwWrZ9hGV/Hk0qshbfItRhXL7UeFDRdto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyVJ9EWZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c14016868so1899384f8f.1
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 02:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745574582; x=1746179382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEWB9kwZuPxsBxVAF/IvC4wesJAoCjW9FAr9YJ0cOLE=;
        b=iyVJ9EWZ66Pt7XThGT8MdGr38p/2ruk7d1VYKviBwaf6HHe0Sfz+av1lEKKoQIWI3J
         YOWsfKkjYHt5kjkHlgLghu/+RBo1xshSucvZ2ZhpX7KnWa92mrtmPvJ6LX/zILHAMMjV
         ctRd2X71sMf3vvv2PRrXyinFB2+EojSu3NYIKyxcPZJlLQMf7/V/kpm2eQmkjSrae3HB
         1qxhECRkOeI9pYqKtKSbG8UbQmTyEXDXjc6fXaGXDyORWDvazskuvIYIR+jXmiuHGOWr
         Ml0D+NxNZAhaBZun/SBwTDey+okIfh72ImtMUO93UcL/uETYerca6Kluc6/enoPkAOyc
         LP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574582; x=1746179382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEWB9kwZuPxsBxVAF/IvC4wesJAoCjW9FAr9YJ0cOLE=;
        b=dL/wIVKzflgN/sQgEs/yRiLGhjGQ8st+m6JE+Krff4EQqveA25EQFRoEBPxchy6Kf9
         K3l1MkcgmIZRcCYAU4aCzMhM7bIRUV8dZHDDQjGxGMD0zE8EnFDUoyeQ7SuynsTHlS1B
         +8AXY1pVMxUGBWFD/kqTRDe1NWLd+hNj0/JPjg/lLC1JRfoi5XaQwXBMTEpwFUTs0zTT
         5R+B6NtYs4K6gdsMPcGX5IHxS3VZ+XrxvQgsjX0YOdPyWYlGhk9iZuzchDAEnM4wAsr6
         ncDoPhj+pwvqpNCd8yCc3cLEh3OHPEynjPYqz3axCFkHrDYdoEu+K+ejdVhuEak/7+UG
         KB2w==
X-Forwarded-Encrypted: i=1; AJvYcCXZiAfvZxREjbbWt7JQAmGhaEA1vou5MPMeN1wgoBhVObcqVxtL0Ol1AIlwGOK+wx6gdecl/ePRw6PzUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI0B8xxk2IKWU7NnRwyCLv4f8u/3Zze9kdFVAEuNStNSBZyG8X
	XVEtN//pYnj5ZffirXBU8CJbT+wQNubSOUZjQThW+zD0k6U6tlLkpXQEuTI+4enKMiw5+Jumr8Z
	0md8JNEbqVV6AOi3J0W8mwtMKvhs=
X-Gm-Gg: ASbGncstVT8jZArwcEN/U0kRZVBcN9MJI5wcH0djQJBJk9Sll9mIAfxPnYlUejiFcP6
	8qEkV6ssm9RIBkotMs0CMmad3VuXfq6ktpFRDN/178rV2CXImCXPwJY7SQEI20nMo/uetODq5Jf
	xHqQBWutxAW5LsfvkMhqoO7dmItVLAI3/i
X-Google-Smtp-Source: AGHT+IFd1A2A9VAaRsgRaRPoskzm7FGvRKEeVj5tlotwsJ5iMqo871EJ4Pt0/oq/daXr7UsNKDgVTyyKcJO4zMoNWXo=
X-Received: by 2002:adf:e28e:0:b0:39a:c9fe:f069 with SMTP id
 ffacd0b85a97d-3a074e4261amr876480f8f.30.1745574581648; Fri, 25 Apr 2025
 02:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aAtQThCibZCROETx@stanley.mountain>
In-Reply-To: <aAtQThCibZCROETx@stanley.mountain>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Apr 2025 10:49:15 +0100
X-Gm-Features: ATxdqUHJ8oq3-5nuJyib-WHY91pFpuFx2si4fru5jXkDRcopVgowulif9SFm6NE
Message-ID: <CA+V-a8tYX9ZPZoA5TjTNGKSbd0abTSdKjC6_JLxPqARNYWB-xQ@mail.gmail.com>
Subject: Re: [bug report] media: rzg2l-cru: Add function pointer to check if
 FIFO is empty
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thank you for the report.

On Fri, Apr 25, 2025 at 10:08=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Hello Lad Prabhakar,
>
> Commit 446c645f7fe4 ("media: rzg2l-cru: Add function pointer to check
> if FIFO is empty") from Apr 11, 2025 (linux-next), leads to the
> following Smatch static checker warning:
>
>         drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:351 rzg2l_=
fifo_empty()
>         warn: duplicate check 'amnfifopntr_w =3D=3D amnfifopntr_r_y' (pre=
vious on line 348)
>
> drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
>     339 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
>     340 {
>     341         u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
>     342
>     343         amnfifopntr =3D rzg2l_cru_read(cru, AMnFIFOPNTR);
>     344
>     345         amnfifopntr_w =3D amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
>     346         amnfifopntr_r_y =3D
>     347                 (amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
>     348         if (amnfifopntr_w =3D=3D amnfifopntr_r_y)
>     349                 return true;
>
> We should either delete this check
>
>     350
> --> 351         return amnfifopntr_w =3D=3D amnfifopntr_r_y;
>
> or change this to "return false;".  (I prefer the second option).
>
Agreed, I will go with this.

Cheers,
Prabhakar

>     352 }
>
> regards,
> dan carpenter
>

