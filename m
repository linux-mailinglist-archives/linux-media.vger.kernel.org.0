Return-Path: <linux-media+bounces-36159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C39F2AECC08
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 11:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 971A91897129
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 09:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27948218EA1;
	Sun, 29 Jun 2025 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3DaGGZl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5051FBE8A;
	Sun, 29 Jun 2025 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751190710; cv=none; b=habb2mb05YeK3x+W7/NETdDf/Vb+/dziG4MML3hdr3071H2zKEnH7ORVNK6FSDuPFJxMuHDw+inodLooZlVfgHVY4QYYzv0nG+oKtDoR9CvKGFQfvwDXjNLdBnm1QhRTOSTM1A0vwWJSXxVgukJddLQjyasmRTN2DLNjAw/FgCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751190710; c=relaxed/simple;
	bh=k8RPXE4zYKCqoyIqctDMrCRF2OjLbCuVKkOR4TUcHPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6FrDHzPU79VXStHw0q93EbB9+M4UHwD6bjYOb/lsjVOGB7hvWSSGmk0i01DjK8NUVQmFUkGKiFjtB6Wt/Jx2RcoxzqiBV6xTs67hONvHQrWT1V9woa7h67aAcqP6Ho1Du+pVOYokFIjmlsC1HtzvUbYhkPNO3uIWqDPJLh7tyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3DaGGZl; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e7ebc21d2so2820767b3.0;
        Sun, 29 Jun 2025 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751190708; x=1751795508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8RPXE4zYKCqoyIqctDMrCRF2OjLbCuVKkOR4TUcHPE=;
        b=V3DaGGZlIYRVje/IMf+uFkgTHikSnJs7bLwoZjBwpKjH9sR38se0q9kjz7786RQGeF
         Y9t30rwOy/OmFeK4UFAy61cgUuR28L0yoL7iiEJc64Pl8SK1f8Vsm0+kW/YVDLwZEzk3
         osK4emVVJ1xk+XQ5cVptoMV873r3JLKDOF0tRnqXK04kFhO5+0O7u9AvYGoDAD9DVsOu
         /I8rW9wEy3JqaK+s+UwRbv4bQlpnN1AZfvkaPhex2mhElszGgudd7Hgff2PeP+87111C
         DTjhzK5fIQYXIXCzQw5dwdr+L3Sx6/N+iaBITl2crrU16SQ8NX7tn7dg7Wyr2VeY22NB
         mjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751190708; x=1751795508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8RPXE4zYKCqoyIqctDMrCRF2OjLbCuVKkOR4TUcHPE=;
        b=QHDon4uX/S9d1vZRjeLuX7rqZhTg2AqvNqpsO+6X4X2ce38YyPuOSUpwCjgKfVLBEa
         vfbmU+EtJPQ+PJGAedltYnF9xAu+Hqx+s1Zh0omR/WISXnLPBK0N2iyD6hHhlwsefmdd
         9NrbFDnaVDbkEwM+HsKGGhFT2nStc+ASUV9PXHyRQtBvNFAzJVP6PtwqIZW9pCNqQOQx
         2VpI2xNjcbgnNKDDFM9aK1bMyUjQWAq67YFAHe8W8SIHr2uGyZUyWjpaZ/pjYd3uMxP/
         INuMTwogrh77Q3wNBTFATfvT3PFxvusbqAGPsBXcMKptivQDFEzBktzP1uCapA0/KaGn
         1cHA==
X-Forwarded-Encrypted: i=1; AJvYcCUXVNak80sy0bBTVHtagFg/R7xRLYt71k4R2IbeZcBZm9ZUCTKRv60i1cqWEhjckMvXEDcCW1och8IuaO0=@vger.kernel.org, AJvYcCWbBxkTfA4U2g8ndI+bK4PPaAZPLn1JJUoUBaidAK5BDK/T9Tx7BG/9ujfucZNYe52BYGICDDDhgVF/pes=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLgpiXas5sx1uoSOusauvr6ynPSKA+n+8Nju3i8XUAQ+3+itGN
	TE7LuuCaHLfAogAU/7gYgpeki/UR31eOhBUKKI+d6odRnfzGNxESOBnPM/Ul/Dastp//mTaF7M9
	753KAoQlsg1SYbTs8w3HL6V4Mf556Bus=
X-Gm-Gg: ASbGncvwkWGqynv7FySzE9Mo6M4UFABf1s9fi/sgAin2SIJIqhFOS9wspwzuIYnwXjx
	rlWK+evBDS+RCIBx9c72vBCPatAAlWdTuNOdHXamdkE/Kci3Nr7iGD3TAa9pgPTEJXrW3WHs4eS
	8IM929vLsjhZb7YOE03VJwAxPom4FeHFMg8k2Uo456A4Zn99XTZa73XA==
X-Google-Smtp-Source: AGHT+IE1zCQGDrVAgfIsk+i6BRDZoB+gNhbxwwsjvBlz713nxeVKOW/UIDMxAwvWu/w30oxW2qIZHjo1E27CyJ/LJ34=
X-Received: by 2002:a05:690c:6611:b0:712:b566:bf7c with SMTP id
 00721157ae682-71522e96c9amr32474327b3.1.1751190707806; Sun, 29 Jun 2025
 02:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com> <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
In-Reply-To: <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Sun, 29 Jun 2025 12:51:36 +0300
X-Gm-Features: Ac12FXwklc5VGuRrRt-QHyYEj08pYOpE8P7ygtuAwSEBQrfXn-83tECCPbBZaBw
Message-ID: <CAGn2d8P-uYEULKs+90cr1AZcJW+mtaaZv8oixpePD6ttYR-0dQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 10:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jun 28, 2025 at 8:26=E2=80=AFAM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> >
> > The HMM_BO_DEVICE_INITED flag was being set in hmm_bo_device_init()
> > before key initialization steps like kmem_cache_create(),
> > kmem_cache_alloc(), and __bo_init().
> >
> > This means that if any of these steps fail, the flag remains set,
> > misleading other parts of the driver (e.g. hmm_bo_alloc())
> > into thinking the device is initialized. This could lead
> > to undefined behavior or invalid memory use.
>
> Nice. Can you make some fault injection (temporary by modifying the
> code to always fail, for example) and actually prove this in practice?
> If so, the few (important) lines from the given Oops would be nice to
> have here.

I will look out how this can be done. Thanks for the feedback

> --
> With Best Regards,
> Andy Shevchenko

