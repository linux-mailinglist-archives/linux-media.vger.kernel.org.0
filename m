Return-Path: <linux-media+bounces-36156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81211AECA1D
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 21:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBFD117C5D8
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 19:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6521D5147;
	Sat, 28 Jun 2025 19:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hznnc77i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B668612EBE7;
	Sat, 28 Jun 2025 19:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751140362; cv=none; b=sxHg85owRcxTv5kwPQaNlgY03RSqM1+sZi+UU9yAtamsshc+4a0twFatvvMALjfVxMCaXa/SHX4b9WO+j6TXG0/6BSUzNmEu7vIlkBAqAzK+IeV1s+k1btzfud0FU+fcsvLrdto/R6ZMDyTFj1QntqwRLVApRhLS4VRpF08OHlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751140362; c=relaxed/simple;
	bh=p5dDr/QmlkdAT4RE6psUgiwKICVbxaJ/GCmdG5WoHkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYtoDYRiUXeH77QkcKOEM+0QVL1iMdaW+/LuLdqYMIx1DlUsU9rhruAT7gb6mnXxLfawfPldm7aYK8tVIqusTrjrQf514+8STLMOSEgqLIWtWgxdWy8ZtgdHQU8YHwuy7SCIBYwBKIb8kD/g0jxIIsRXvcoNRNvLLBewEnD0M10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hznnc77i; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae360b6249fso274604066b.1;
        Sat, 28 Jun 2025 12:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751140359; x=1751745159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5dDr/QmlkdAT4RE6psUgiwKICVbxaJ/GCmdG5WoHkg=;
        b=hznnc77iNCgggBCTe5rDo7K/K/TfJzikNQ/adQD9H9wJj8atcmYPuTzMDSTEU116lX
         NTC5juxCVxURwnVRJ5WjZueDIgndQbHZMLGB4URs5ox64aP2J+Y9fZQEozj4vMina+ac
         vXJlvbVJZBGGCkf42Ev0Xy7fFbPgtf5mPwrmgoYkGsC+lv8UHebSPo47G/BZbw6dreuT
         Az8WkEewyV0u1TgG/DndKQUyQwKMUZg5FuWPr8TgfHqFpzbeQpchIbQN/vCCg5g/4i+x
         8K0Ja7oEJSl+EUXkhapswnODZokeYU1nZgNLakBZrPaNqcWSRMiU6nCpeJXiRRLK20bh
         7XDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751140359; x=1751745159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5dDr/QmlkdAT4RE6psUgiwKICVbxaJ/GCmdG5WoHkg=;
        b=c894m90/y8EfSJZajjEn4gWK0orheEaHN42iPtxgiwJbMvZ5GLnR/hW9ss33Dj3UAX
         gFNg999k8avazUwGHWTtNFa09u4o1xVyrXzmhUfwXgbhmCVRSZt7sJPA7YvVitkZqC29
         iD+8p4of6CWhLwQ+c7AV1g6MpIEkP4IGWiA01fzaXREL0woksoUWYWVQQhLWrlr+3KsE
         4J8Ey/8Q5tC6dbW4D3sMp2iOSh0agCjIBZDXUHbQa7/IK7kqYYa/YjOSpBcuuWqtksed
         mecwCYOF36lwzEEZ0/nYVGziPzw46WA81HOtHyGfVzkgvSZPbiQWn0McahH45Nz6HB9v
         Df1g==
X-Forwarded-Encrypted: i=1; AJvYcCW2ILHkj1ZZIH3OrUYwtSzLBIHYWaH1YvzpphrmXUpT9X1ZRs9CZ4c4FD0g445pnOUJ31fzeUSWqocaQQs=@vger.kernel.org, AJvYcCWgWDkylAKdAW78cfaQ60vYgs8Z9oXDJWLKn9cXUhVaKk3fxiXvPnQNnbEFFOPj45dTbAHrOT155Qb3dFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YypDTJ0orUjGsM5kvKApPOUllNFPWV/adr53lZSnZLrBtjFMjQj
	tbXjA8njZlAVSBM/VUTC5wQlZyE9KcGd8F+0ERmukpOS6gyLZflc8CDheBHN0pYxobkYrVdq4n4
	4RrymhBhNltl0ousJYIAQgr6jJO2kw/4=
X-Gm-Gg: ASbGnctgrysWFU/N0pR2YlXWjlbQ+jNepvQ91+TGwb8lAwGkHpeBme0n3V9+rspyRc+
	Lh1UC76Xgf69MknPyiZk75bOceq89ZPcsGCd0iJgPEPbfiT4OaQB5O9mFhd8CIcZSdyN0axs8G9
	XjvFHamqO5LM3LmXvmiPGdZlDBLUMu3v6HuUixSR6H6Bs=
X-Google-Smtp-Source: AGHT+IFBHBg3vA0AFVg02J52ULkzSBs1nSVBKO1AVzpVaER5V/vml4hMtzUii6kiTf6eFhi6SMgNg7P5g/X4e+kpJ/4=
X-Received: by 2002:a17:906:d554:b0:ae0:4820:2474 with SMTP id
 a640c23a62f3a-ae35015c079mr767127866b.43.1751140358759; Sat, 28 Jun 2025
 12:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 28 Jun 2025 22:52:02 +0300
X-Gm-Features: Ac12FXwisHFwiusykwimkGfvNJfdF3Mavaq2pBz6g46Qc34NpDDwkbGORGvQ7S8
Message-ID: <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 8:26=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> The HMM_BO_DEVICE_INITED flag was being set in hmm_bo_device_init()
> before key initialization steps like kmem_cache_create(),
> kmem_cache_alloc(), and __bo_init().
>
> This means that if any of these steps fail, the flag remains set,
> misleading other parts of the driver (e.g. hmm_bo_alloc())
> into thinking the device is initialized. This could lead
> to undefined behavior or invalid memory use.

Nice. Can you make some fault injection (temporary by modifying the
code to always fail, for example) and actually prove this in practice?
If so, the few (important) lines from the given Oops would be nice to
have here.

> Additionally, since __bo_init() is called from inside
> hmm_bo_device_init() after the flag was already set, its internal
> check for HMM_BO_DEVICE_INITED is redundant.
>
> - Move the flag assignment to the end after all allocations succeed.
> - Remove redundant check of the flag inside __bo_init()


--=20
With Best Regards,
Andy Shevchenko

