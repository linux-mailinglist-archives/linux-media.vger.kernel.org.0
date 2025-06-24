Return-Path: <linux-media+bounces-35795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 313FFAE68EE
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 16:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E4013B2248
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A9F2D23A3;
	Tue, 24 Jun 2025 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak9JmzRB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0429C23741;
	Tue, 24 Jun 2025 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775461; cv=none; b=Ex4S80bG6i7tr/r2PsB//8vVzYgqR+uLBezVoWcA5VLJWHNBsXwP4Zh6KPptFgvVDKgJ7EUCM5+L1NYR9bxN2T/BWkUamQ3jTZTvTjwHKXmlC8SaiaJVTCGUKYDURLGfE8g4+4oKtThaio2Mqps1itpN0yzZWsmE3ZjWGpx5OfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775461; c=relaxed/simple;
	bh=rUHKFAGtpoHh7qi7QoaP8poZE35x55yLFNHotiaZsC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcZ7G7gWclt3Ie8eBdplI4woi2ARg/fuanHcXhEMMoa4++yaxT9oDgcxuOuhADYPZEuQ9fMbhonqM18Pa0tqcqWgvAhdFR6vtAFYDvTzOQ3O7fgTmhFGUviBtTG68+y3S0dMn+eRSjXVfQsi6aNz2DI5VV6tenG04PK+RIh9JiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak9JmzRB; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-706e7babc4eso2315337b3.2;
        Tue, 24 Jun 2025 07:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750775459; x=1751380259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47JKdWTsMsATiMIUqYdzfJGuvO9OstUGqC+AM2ehj08=;
        b=Ak9JmzRBPrhPFgaA+GhA7RG7G+sUyYU97vazntNjb4fEYGl3oKRvB9/LRIzmvbN2Vu
         GwDnbNfAisms+v7sa5QDUyOdB5LDEAzswZbtteepnX8fgdtD679bWN2D8kQRRGyYvUa6
         g9Dk9JHPZbQSVH/7YSeuzjecvtsMzSsMGBKricUYPzJpq8KpiTunI7MeWbYZbUMyTYSf
         LySqTMvg2HzLH9YsLo8Oy2Uubu3xiCo0dbOPtYPrQbPjc/jtnTWcy2SuPpYttXvK72T+
         FpCRB3mUDX97PDeiIh/1LzIAerxAeTeGKQFg73NukccN4TNP5SYb5ANyypoHaWVQ0kvr
         gbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775459; x=1751380259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47JKdWTsMsATiMIUqYdzfJGuvO9OstUGqC+AM2ehj08=;
        b=NrwLxd4y7RCyejwcxtB1iOyWc/c7+PSxXVE9oXO1rQ4+ESTDlCWa2GKCVVDUxGloAS
         YyQNB02tMZMFGTuPyvdT0YL1LYBTgIWT6V1JR0f1XPzTHGn+OP1N6qAOmi7oAnBQw7FM
         DLAbkJ6/1Xm0A0HD2ck0urETM6KNS1mGLhzFzW170IJcYTvEjkHj7N8jVCg5kbL26gY7
         bHhBF/wZVJnpBeyiZZu/VmwaDZpHA79M7ugAQEfBMIbKLwJblv1DGpErYTE/mBzQBs9I
         6bQCwwLYebMbyiDZCosg/AzAPQfQk8cxwMoH72A3QABO05DkmwFnSzwRVOFmipkqZetQ
         qtAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3jNIe3p/mIuUQ0JDr04C670ewqrVzaUzbWILUQqzUW9aF9NqYmzQDVJCvDn87T53+7W7/qg/D2YlKSP4=@vger.kernel.org, AJvYcCVAA4Iiv1lZlWxwaDuPTSIcj2tHa+A/ipT1NYOxIOkUkC+Afbb/3HdQ36teFXwlWYyySspu/GcaRf01JFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS08B1QH5YbiDy3+F6ZPImV+rBPLN1u3T9gWzwFavKdHNMSbp/
	PlwXz9ztK7alrTQ0RNxUcL5BcZMVX+9Fx+Lc4/iT01lj6H8L496p56kpZ6eiUV9KzAG5VOkyWtb
	0XAdyqyKPOhIMNc4zu9pKLavBfpCyevw=
X-Gm-Gg: ASbGncsf7kriSAft0o9YdOV0y2t4ByesB5oj1n6YH7pjT6JXjrOtnBw5ZOYhtka4d6L
	4nh+vtKwfovW0OV8j6nSvPtmGIPSsB1S9uhEGF8LSooOqWcp+SgdVoXxERoP58ofnaLCBVjtt2N
	mQoqHrJ+lX4du87EwyGx+w5RWroJ7phBitxNBq6nVUxOFX
X-Google-Smtp-Source: AGHT+IGkc9lDh/qTdWnQdUPKLcAIyMi8ZYUXwuqjFHaD94kvXRNBk8ZVu21FRKUl2y6HHg+AtAc3aGAkJb/C+PSHZWc=
X-Received: by 2002:a05:690c:4b10:b0:712:a286:2ca2 with SMTP id
 00721157ae682-712c654cc21mr112798577b3.7.1750775458572; Tue, 24 Jun 2025
 07:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624130841.34693-1-abdelrahmanfekry375@gmail.com> <aFqnK5nIHilUSxPq@smile.fi.intel.com>
In-Reply-To: <aFqnK5nIHilUSxPq@smile.fi.intel.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 24 Jun 2025 17:30:46 +0300
X-Gm-Features: Ac12FXwbJgmBpV-jBM_-Wd0HLMnK31Enz6FwQ4_mWR8PFGdVY_7Dq_TVpSDZ6qc
Message-ID: <CAGn2d8NMApie5Ba8HuzzLtmhixkPpyXh3_goHbrMCzY0DE0wfw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, shuah@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 4:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jun 24, 2025 at 04:08:41PM +0300, Abdelrahman Fekry wrote:
> > The sysfs attributes active_bo and free_bo expose internal buffer
> > state used only for debugging purposes. These are not part of
> > any standard kernel ABI and needs to be removed before this
> > driver can be moved out of drivers/staging.
> >
> > - Remove active_bo and free_bo attributes
> > - Remove group registration calls form hmm_init() and hmm_cleanup()
>
> Suggested-by: ?
>
> ...
>
> > +     /* Removed sysfs group registration for active_bo and free_bo att=
ributes */
>
> > +
> > +     /* Removed sysfs group remove for active_bo and free_bo attribute=
s */
>
> These comments do not bring a value, no need to have them.
>
noted , thank you will send v2
> With the above fixed,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

