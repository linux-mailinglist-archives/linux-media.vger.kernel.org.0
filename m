Return-Path: <linux-media+bounces-17228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95740966354
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 15:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BE8B2847AD
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 13:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B471AD5EB;
	Fri, 30 Aug 2024 13:46:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56E4288DB;
	Fri, 30 Aug 2024 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725025564; cv=none; b=lEd5IhBB58ygoHY9IHH5hdU3U99666t/kgkWYOySZ3a8W+9MsJkjK0iiT6jek+XnnFJrCFOmSjj93vky++q8ld8i9QUFlHx5o8znrKj3h7bsiWR51Dj4CwphQBDG7L1cBUoJpMr2zkwy7kD/PjiwuKEe6HXdCmd/U+S0d+glXCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725025564; c=relaxed/simple;
	bh=4rx5MJaU7mW3Sv3wIWFvKKmuNzdHoavdGmHau0vT6Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geh2y5LOvkqljzwPwrtGwP3gi5PYfnGCCGZukeZuVFKz5KOecGxJgeqUH7YDiyzmVYCJjT5uab0qyw2Xu5UFbyeoEQhLcay13VGwxgKj4RJs5vKWcrPLOc6C1vTZTxvpDcAUSp53tX3JAo9OLBf7MAmLdB/I+trhad4W+yPSnoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 209C71063;
	Fri, 30 Aug 2024 06:46:27 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1D713F66E;
	Fri, 30 Aug 2024 06:45:57 -0700 (PDT)
Date: Fri, 30 Aug 2024 14:45:11 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sebastian.fricke@collabora.com, linux-doc@vger.kernel.org,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, s-jain1@ti.com,
	r-donadkar@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andi.shyti@linux.intel.com,
	nicolas@ndufresne.ca, andriy.shevchenko@linux.intel.com,
	jirislaby@kernel.org, davidgow@google.com, dlatypov@google.com,
	corbet@lwn.net, broonie@kernel.org, jani.nikula@intel.com,
	rdunlap@infradead.org, nik.borisov@suse.com
Subject: Re: [PATCH v2 1/6] math.h: Add macros for rounding to the closest
 value
Message-ID: <ZtHM5+SJ15Db+P2z@e133380.arm.com>
References: <20240826150822.4057164-1-devarsht@ti.com>
 <20240826150822.4057164-2-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826150822.4057164-2-devarsht@ti.com>

On Mon, Aug 26, 2024 at 08:38:17PM +0530, Devarsh Thakkar wrote:
> Add below rounding related macros:
> 
> round_closest_up(x, y) : Rounds x to the closest multiple of y where y is a
> power of 2, with a preference to round up in case two nearest values are
> possible.
> 
> round_closest_down(x, y) : Rounds x to the closest multiple of y where y is
> a power of 2, with a preference to round down in case two nearest values
> are possible.
> 
> roundclosest(x, y) : Rounds x to the closest multiple of y, this macro
> should generally be used only when y is not multiple of 2 as otherwise
> round_closest* macros should be used which are much faster.
> 
> Examples:
>  * round_closest_up(17, 4) = 16
>  * round_closest_up(15, 4) = 16
>  * round_closest_up(14, 4) = 16
>  * round_closest_down(17, 4) = 16
>  * round_closest_down(15, 4) = 16
>  * round_closest_down(14, 4) = 12
>  * roundclosest(21, 5) = 20
>  * roundclosest(19, 5) = 20
>  * roundclosest(17, 5) = 15
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> NOTE: This patch is inspired from the Mentor Graphics IPU driver [1]
> which uses similar macro locally and which is updated in further patch
> in the series to use this generic macro instead along with other drivers
> having similar requirements.
> 
> Link: https://elixir.bootlin.com/linux/v6.8.9/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480 [1]
> 
> Past discussions and alignment on this:
> https://lore.kernel.org/all/7e3ad816-6a2a-4e02-9b41-03a8562812ad@ti.com/#r
> https://lore.kernel.org/all/ZkISG6p1tn9Do-xY@smile.fi.intel.com/#r
> https://lore.kernel.org/all/ZlTt-YWzyRyhmT9n@smile.fi.intel.com/
> https://lore.kernel.org/all/ZmHDWeuezCEgj20m@smile.fi.intel.com/
> https://lore.kernel.org/all/ZloMFfGKLry6EWNL@smile.fi.intel.com/
> 
> Changelog:
> V2:
> - Fix grammar in macro description
> - Update roundclosest macro to use roundup to avoid overflow scenario
> ---
>  include/linux/math.h | 63 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/include/linux/math.h b/include/linux/math.h
> index f5f18dc3616b..b59a02a007d7 100644
> --- a/include/linux/math.h
> +++ b/include/linux/math.h
> @@ -34,6 +34,52 @@
>   */
>  #define round_down(x, y) ((x) & ~__round_mask(x, y))
>  
> +/**
> + * round_closest_up - round closest to be multiple of the specified value
> + *                    (which is power of 2) with preference to rounding up
> + * @x: the value to round
> + * @y: multiple to round closest to (must be a power of 2)
> + *
> + * Rounds @x to the closest multiple of @y (which must be a power of 2).
> + * The value can be rounded up or rounded down depending on the rounded
> + * value's closeness to the specified value. Also, there can be two closest
> + * values, i.e. the difference between the specified value and its rounded-up
> + * and rounded-down values could be the same. In that case, the rounded-up
> + * value is preferred.
> + *
> + * To perform arbitrary rounding to the closest value (not multiple of 2), use
> + * roundclosest().
> + *
> + * Examples:
> + * * round_closest_up(17, 4) = 16
> + * * round_closest_up(15, 4) = 16
> + * * round_closest_up(14, 4) = 16
> + */
> +#define round_closest_up(x, y) round_down((x) + (y) / 2, (y))
> +
> +/**
> + * round_closest_down - round closest to be multiple of the specified value
> + *                      (which is power of 2) with preference to rounding down
> + * @x: the value to round
> + * @y: multiple to round closest to (must be a power of 2)
> + *
> + * Rounds @x to the closest multiple of @y (which must be a power of 2).
> + * The value can be rounded up or rounded down depending on the rounded
> + * value's closeness to the specified value. Also, there can be two closest
> + * values, i.e. the difference between the specified value and its rounded-up
> + * and rounded-down values could be the same. In that case, the rounded-down
> + * value is preferred.
> + *
> + * To perform arbitrary rounding to the closest value (not multiple of 2), use
> + * roundclosest().
> + *
> + * Examples:
> + * * round_closest_down(17, 4) = 16
> + * * round_closest_down(15, 4) = 16
> + * * round_closest_down(14, 4) = 12
> + */
> +#define round_closest_down(x, y) round_up((x) - (y) / 2, (y))
> +
>  #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
>  
>  #define DIV_ROUND_DOWN_ULL(ll, d) \
> @@ -77,6 +123,23 @@
>  }							\
>  )
>  
> +/**
> + * roundclosest - round to the nearest multiple
> + * @x: the value to round
> + * @y: multiple to round nearest to
> + *
> + * Rounds @x to the nearest multiple of @y.
> + * The rounded value can be greater or less than @x depending
> + * upon its nearness to @x. If @y is always a power of 2, consider
> + * using the faster round_closest_up() or round_closest_down().
> + *
> + * Examples:
> + * * roundclosest(21, 5) = 20
> + * * roundclosest(19, 5) = 20
> + * * roundclosest(17, 5) = 15
> + */
> +#define roundclosest(x, y) roundup((x) - (y) / 2, (y))

roundup() looks like it already does the wrong thing for negative
numbers:

	roundup(-10, 5)
	= (-10 + 4) / 5 * 5
	= -6 / 5 * 5
	= -1 * 5
	= -5

(DIV_ROUND_UP looks less broken in this regard, though it's complicated
and I haven't tried to understand it fully.)

Disregarding the issue of negative inputs, the proposed definition of
roundclosest() looks like it still doesn't always do the right thing
close to the upper limits of types, even when the expected result is
representable in the type.

For example, if I've understood this correctly, we can get:

	roundclosest(0xFFFFFFFFU, 0xFFFFU)
	= roundup(0xFFFFFFFF - 0x7FFFU, 0xFFFFU)
	= roundup(0xFFFF8000, 0xFFFFU)
	= ((0xFFFF8000 + (0xFFFFU - 1)) / 0xFFFFU) * 0xFFFFU
	= ((0xFFFF8000 + 0xFFFEU) / 0xFFFFU) * 0xFFFFU
	= (0x00007FFE / 0xFFFFU) * 0xFFFFU
	= 0

(Expected result: 0x00010001U * 0xFFFFU, = 0xFFFFFFFFU.)

I suppose this could be documented around, but it seems like a
potential trap and not something the caller would expect.

Cheers
---Dave

