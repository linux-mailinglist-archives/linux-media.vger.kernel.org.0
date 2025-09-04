Return-Path: <linux-media+bounces-41768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBE3B43A95
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 13:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 021131C2642C
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 11:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362112FD1C2;
	Thu,  4 Sep 2025 11:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pVjP882H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEC12FC86F
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 11:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986209; cv=none; b=k3w6SEFchsV7ObA0b4hQcOYyYaROW8e5zaBkQOaLKo2clEqAzuRGcqBxQG0b6tJAfQOQBYyTd8yOuGdjt6gTeY5qT6ZHU7Pe1P/y7e++QcDvEebbym/hcxKfaULWsHM7O6dgtG1JjD0/DFqMRn8pGHw3gG0P6tT9hGtnTR3n4Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986209; c=relaxed/simple;
	bh=muiz7naDGEkZ3ifHiHEdACkPE3MonaLd2fMm6LWbdcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=KCyiTB4bMH3ulHWwT/83aKNaVwoHCrqS0sLDH2RnEWFZviHQTljCNSdC1qMHrVN3OhzLN47Shjb9B2zOAFiEGj/BkzCXl5MXkBYV5rBxntu1Oo+wXzxE6oYIED1lLFDNUcRdhYcDEU01hZIp5zefn7kcT2r21VCji9Y6GzD1ST4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pVjP882H; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24c9a399346so8243775ad.0
        for <linux-media@vger.kernel.org>; Thu, 04 Sep 2025 04:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756986207; x=1757591007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muiz7naDGEkZ3ifHiHEdACkPE3MonaLd2fMm6LWbdcg=;
        b=pVjP882Hf8ZlGsgSpArkl7Bq9IGsIq0IAQePi89hK8du9kVG12bxJUBMKevDrxIHVV
         DUolbDorqRwooUfrYao8NlwCNW0e3IpDUO25yEwFQ9oaQvy+SNbpkEEso2YTWtX3MdAZ
         tMgWcSkZ6t9EYwGMguehljHSYEgcFBaKIAWZwkFCZ8i+WqQsJiiHNLYlKb5dzFiVwLae
         OUcEkJkd72oVRu6PMY/1gst4Pz3A9HMch6eyNuY4G9rvgh3JOlHDrTokj7ECoW0eaaic
         5uQpU8rlbIkoSnH+EC7DjWtNIHk5pxZsMcs7BYsfBpkZk44YYiR+phNwIxGQQLC/ehDv
         cJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986207; x=1757591007;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muiz7naDGEkZ3ifHiHEdACkPE3MonaLd2fMm6LWbdcg=;
        b=uQsKKln9cLy4F4c4SsmYfFwFAXt424Wyo9DbW43NGyCA6FZ8b5fP+oPMo7bZBfCn8h
         WBELHrNF6G49kMmi8p0J9xTGlR2ZOtPdyEHeEJy/Y59Des5taCJzOxqnQCv+nAtTKeD+
         yonFSDZNWvY1SpMiiUNI2uZlVFkqrHgzdFSyD5lDJJT55SaLGsGLhYKo+JEAYOAJW0hy
         atsZSDqyPOX+nvLKzO/xYvP+ZnFfA+EaC2C6rdeWhCUNZVravHPezNW0bAFGcfRDleEk
         HYh4q7/1ch3axqXbE2klyLnY5DyRZVJbqIB32gB04hOejar5W3FM5ls7LoHmGw9fhe3T
         Qqvw==
X-Forwarded-Encrypted: i=1; AJvYcCUf7ulnRuVR3GEhC/FqKscGnP0UU29LPMW/2hDCucksLviVBk+YjSNkaPj8AhfUSgjDnSbmrFSXgzMJxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpSCapEIw4Q5GM7LgGZgrYdJhBKk7wNe24//8YGGWN9LjVYNsw
	odYHcLpdLD4TTW6tYvputtdEZMXR4bzcMizasJChs5WeouGezPNxJ+hvUYW6RCW/BSTW5/bPONT
	6JgT8vAgdyRbBkz4kHsFCgDJwTR0r0ftX2kubkYZL
X-Gm-Gg: ASbGncsHSnobvCJgaKaD5wSaD6dMY0wcxO4YTK9+sQ0N49Dc8qY4DNh1K2fpoJ9w06d
	NiODZHthYoMIv2p0t2gBjz6apywXYUBV97zp9a35Uo3q0+etAJIeQMZWSl72ypVCVRk+ANy4nYq
	APL3UOp47iHS6lSAJ6GjbkJjsUiON4nNQr3CgK8cyVU7aGEotDIxb/WEdLUDKbRZ8WEroAyFcmB
	/AV7qbe3ZJggRK5bcKdewYcp7//v3GTMUV6wzlKLLlLulpb/mO7
X-Received: by 2002:a17:903:2a8b:b0:248:fc2d:3a25 with SMTP id
 d9443c01a7336-24944b0da8fmt258366915ad.38.1756986207111; Thu, 04 Sep 2025
 04:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903092754.2751556-1-abarnas@google.com> <20250903092754.2751556-2-abarnas@google.com>
 <aLlEOYZqT07r6G_V@smile.fi.intel.com>
In-Reply-To: <aLlEOYZqT07r6G_V@smile.fi.intel.com>
From: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Date: Thu, 4 Sep 2025 13:43:15 +0200
X-Gm-Features: Ac12FXxEQX8Crqr8PV1pxbSjW9Mcxxq96iJ-CqMFMybLuuhBwuzyFNki_Fu1js8
Message-ID: <CAATBrPEMuoVQwCqycrZ14PsNH4u+Di+eycAofObb=8kS9dpvfQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] staging: media: atomisp: Change name to better
 follow its behavior
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy

Regardless commit message, is the change OK and can post it as a
patch, or similarly to second patch it is not worth the effort as it
will be refactored at some point?

> Change name to clearly states what function does.
Proposed description:

staging: media: atomisp: Rename `inv_subword()` to `clear_subword()`

Function `inv_subword()` does not inverse bits or subword and neither is
inverse operation for `subword()` function. It is used to clear target bits=
 of
move_subword operation (specified by start and end-1 indexes). Name
`clear_subword()` explains the function behavior better.

Best Regards
Adrian Barna=C5=9B

On Thu, Sep 4, 2025 at 9:48=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Sep 03, 2025 at 09:27:53AM +0000, Adrian Barna=C5=9B wrote:
> > Change name to clearly states what function does.
>
> The Subject and the body of the commit message should be more specific.
>
> Missing blank line.
>
> > Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

