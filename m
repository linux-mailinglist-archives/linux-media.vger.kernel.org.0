Return-Path: <linux-media+bounces-38734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F55B18B0D
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9D3B17AAFF
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 07:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2D81F1517;
	Sat,  2 Aug 2025 07:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpHOlXZy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B73D19F464
	for <linux-media@vger.kernel.org>; Sat,  2 Aug 2025 07:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754119928; cv=none; b=WRMBzmB9R+SgILGL7AHdY70iBbdmwB4qxkg6HknQVlVIl4ukppt9hAbwe81U1KUXKZQyPfRwVTY4Y5y1sxY2tUwH/+zBxfmRnxAnOJCQuUw3Hr7pH1w95rSPTogO7HJqDshaPaWHM09KNE3k4b6vfNrue0AZMWH2hIt276lLWPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754119928; c=relaxed/simple;
	bh=X8HRyQFPoOlzxmLgSDnwmZXBUKycsDjwrurq5e80avE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOAf6MY3tnWXYB9XcB1cNfC0N008aOhdTngGfoq8kAat5+xRKh2v6F0uYp/Px0sz/ReNFwUYQECQVP9Pq3wxCJ247QqShJoegGr7rLy0B+M6Aejvt7hKiC8U4gQT4z21TLVjqKQL95k3/9Oyy8SFYU8j1zIvAeAELnaj7zkEEOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpHOlXZy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b7892609a5so1948877f8f.1
        for <linux-media@vger.kernel.org>; Sat, 02 Aug 2025 00:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754119925; x=1754724725; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Pft35+3lXQVnWPsUsq5tpsncZSpCehFTU7fpA7XTkY=;
        b=TpHOlXZyl9li11KqxDewgxvlH9mchzRQW2GbTWz/j5xg/4kBizJ1C9JQp8u78bFwSi
         rWSxvFlO5FAlMeLN4V2oDcpaun2L7o6ARP/eUGucA9kDD70I1UofgEtvpnVpWScPQA7/
         xgR4pJagtxI2x/UloEh6VvdUHnjAeIlXmSUzNBySbWPkM3wEfBjHok/FhmegN8atKF99
         GIjLM+2rMibyZKF4kdzkP6yzJpxiNCMY5wZ/GveygM3SI+pwzRP53+tYAxxrH7Er7HKw
         XS3WCaytqx+Fb2gvZg2HkYGutNBjrvJ1cilwEFMs0m47vDZlmLsmTnYuFNH5Mt/BsNza
         X3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754119925; x=1754724725;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Pft35+3lXQVnWPsUsq5tpsncZSpCehFTU7fpA7XTkY=;
        b=C1JqlQdYnvnEaxrc+JRLka4GL9jyr/OT78gn40nroVk/ggFCyvKZdQ9I31hr+Txyi4
         pUtHmjq/hyFyZBB3FPsC/FTAyDZhS1j9fCQI+pjcoQMzE6Ww2F8ifAU2APWCW2baRSFG
         JyDtv8PAMDsUyCjVV19DGi41xy+TNn1rBVkkiiQIfE0KGJnUuxvOZWQmjhRTrQehm2lW
         sP7u/xX7/HTgHJ1TkNivZsvN737foaWe89pB5pnfi52ZM4O6bCu3hCwQRu3TI2h3SFbj
         +8e5RWKPTLGEIyvisO+cAyD0uNgngfuEnqX80z2GcG5/uXJauuBza9y7vWo8+sEdNf8z
         OMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNqUzZ4gYfSQSHmWLwMyQOpWhVtJASbqrhPDBme5MO1ES4340Ago4QEaIH9aIhI89XoyNo65pKcOO2Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj58HuB1sxWvJgYGZOBrxlZ999HzHBvuskI5ACBDtm56m1rMLG
	eu2CKEdiVnsKSXdAr3Q6IaF/R9t4M81oDl8GopIXP1r3EbBlRa7f4/dD1r8hJX+p18k=
X-Gm-Gg: ASbGncsUY/TEJ7Lq9ZXviBSQS9c03gI+yc1Mzbv+vJXchjgHNsfK/ecZksiq79Ah2g4
	IS1gS1pvCEGF1QBjAHqk46fR7KwRXzZ6bAPVncWWyBxp2/KQrZmm7NkmbW2586/T+4KobQHLOhI
	l5tYbRA0VaLM7os4nlwMtgV7e3Or89JXUsx8YhZI9huwuQodWgXRqwIBEIIm1g5P2S7x+L5itYq
	mOaFaVVnTAmyuW93Q1J5N2rYrFAhED3mDe+GK3Go/2FlxaaMLdrllnglPQB9C+j3CHk6v3hfHok
	iwDdKcQFaIf8i03erZfk5GfOTJ2fsBIZ59Eh2B2WRCZBpptaobYnXzL4eU4/pZcUSBJwmnxDrzi
	Y6YCcxzaCh+31Delwh0oJeMvVJiU=
X-Google-Smtp-Source: AGHT+IEncAhoLdtPekt1mG/QjBbcpjITQUAV/Ke+Zpd3fYn54X7RELoK7NrhYvkBeCEbn5j1iK8FgA==
X-Received: by 2002:a05:6000:2481:b0:3b5:f93a:bcc with SMTP id ffacd0b85a97d-3b8d94c1ceamr2065362f8f.35.1754119924640;
        Sat, 02 Aug 2025 00:32:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589536acc9sm133848185e9.6.2025.08.02.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 00:32:04 -0700 (PDT)
Date: Sat, 2 Aug 2025 10:32:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: atomisp: Fix incorrect snprintf format
 specifiers for signed integers
Message-ID: <10626b28-9619-47ea-abad-db823c01bb96@suswa.mountain>
References: <20250801160023.2434130-1-colin.i.king@gmail.com>
 <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com>

On Fri, Aug 01, 2025 at 11:57:43PM +0200, Andy Shevchenko wrote:
> On Fri, Aug 1, 2025 at 6:01 PM Colin Ian King <colin.i.king@gmail.com> wrote:
> >
> > There are incorrect %u format specifiers being used to for signed integers,
> > fix this by using %d instead.
> 
> Both of them sound to me like the fix of the symptom and not the
> cause. Can we simply make types of the iterators to be unsigned
> instead?

Making iterator unsigned by default only increases the rate of bugs.

(Although, my stats might be biased because I'm only looking at bugs I
can detect through static analysis).

regards,
dan carpenter


