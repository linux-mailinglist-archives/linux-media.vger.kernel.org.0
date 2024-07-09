Return-Path: <linux-media+bounces-14795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4792C23C
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 19:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BEACB24A9C
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 17:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5829E15B116;
	Tue,  9 Jul 2024 17:18:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5685F1B86CA;
	Tue,  9 Jul 2024 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720545504; cv=none; b=Co9KcPkD9Csx+jcrVY+zErm1RcGKWHmYxqMiF77np1rvIgq1cD9E9jZd64moCYsi/lRp0uk4tB16Y3cLPW9GlnDJWp0K0nLF58ItMC57zkjOsB75ccYYgXXiPs3lx3XuA6OtZL4dXrvmw/BQeX3/tOY0DcViTdk+bQO95LWOAfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720545504; c=relaxed/simple;
	bh=dDYjlvdOukoB51Fv46MKa71KJ52MdbQvPCavAdr9N+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiXLLwBCoDyKmfxt3m/jiKYLCPBqgN5BWceoJZLrnrlYiF97O7bfO14doa2Il3z+UU2PnyI85j9JMKE86ElL3K8snltLD5T+R4d+kR7ZSOkXx4C3Q2Yi+9bJLW38xU6hDPLSwfC8T2Pd+6doq/xH4bkHLmx3RvUcsXsppaRxaX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 921F01063;
	Tue,  9 Jul 2024 10:18:45 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E37CF3F766;
	Tue,  9 Jul 2024 10:18:15 -0700 (PDT)
Date: Tue, 9 Jul 2024 18:18:09 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sebastian.fricke@collabora.com, andriy.shevchenko@linux.intel.com,
	jani.nikula@intel.com, jirislaby@kernel.org, corbet@lwn.net,
	broonie@kernel.org, rdunlap@infradead.org,
	linux-doc@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andi.shyti@linux.intel.com,
	nicolas@ndufresne.ca, davidgow@google.com, dlatypov@google.com
Subject: Re: [PATCH 1/6] math.h: Add macros for rounding to closest value
Message-ID: <Zo1w0Z57Y0NlcK6m@e133380.arm.com>
References: <20240708155943.2314427-1-devarsht@ti.com>
 <20240708155943.2314427-2-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708155943.2314427-2-devarsht@ti.com>

On Mon, Jul 08, 2024 at 09:29:38PM +0530, Devarsh Thakkar wrote:
> Add below rounding related macros:
> 
> round_closest_up(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round up in case two nearest values are
> possible.
> 
> round_closest_down(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round down in case two nearest values are
> possible.
> 
> roundclosest(x, y) : Rounds x to closest multiple of y, this macro should
> generally be used only when y is not multiple of 2 as otherwise
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
> ---
>  include/linux/math.h | 63 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/include/linux/math.h b/include/linux/math.h
> index dd4152711de7..79e3dfda77fc 100644
> --- a/include/linux/math.h
> +++ b/include/linux/math.h
> @@ -34,6 +34,52 @@
>   */
>  #define round_down(x, y) ((x) & ~__round_mask(x, y))
>  
> +/**
> + * round_closest_up - round closest to be multiple of specified value (which is
> + *                    power of 2) with preference to rounding up
> + * @x: the value to round
> + * @y: multiple to round closest to (must be a power of 2)
> + *
> + * Rounds @x to closest multiple of @y (which must be a power of 2).
> + * The value can be either rounded up or rounded down depending upon rounded
> + * value's closeness to the specified value. If there are two closest possible
> + * values, i.e. the difference between the specified value and it's rounded up
> + * and rounded down values is same then preference is given to rounded up
> + * value.
> + *
> + * To perform arbitrary rounding to closest value (not multiple of 2), use
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
> + * round_closest_down - round closest to be multiple of specified value (which
> + *			is power of 2) with preference to rounding down
> + * @x: the value to round
> + * @y: multiple to round closest to (must be a power of 2)
> + *
> + * Rounds @x to closest multiple of @y (which must be a power of 2).
> + * The value can be either rounded up or rounded down depending upon rounded
> + * value's closeness to the specified value. If there are two closest possible
> + * values, i.e. the difference between the specified value and it's rounded up
> + * and rounded down values is same then preference is given to rounded up
> + * value.
> + *
> + * To perform arbitrary rounding to closest value (not multiple of 2), use
> + * roundclosest().
> + *
> + * Examples:
> + * * round_closest_down(17, 4) = 16
> + * * round_closest_down(15, 4) = 16
> + * * round_closest_down(14, 4) = 12
> + */
> +#define round_closest_down(x, y) round_up((x) - (y) / 2, (y))
> +

Naming aside, is there an actual use case for having both roundclosest()
and round_closest_up() today?

(i.e., is there any potential caller that would actually care about the
rounding direction for borderline cases?)

>  #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
>  
>  #define DIV_ROUND_DOWN_ULL(ll, d) \
> @@ -77,6 +123,23 @@
>  }							\
>  )
>  
> +/**
> + * roundclosest - round to nearest multiple
> + * @x: the value to round
> + * @y: multiple to round nearest to
> + *
> + * Rounds @x to nearest multiple of @y.
> + * The rounded value can be greater than or less than @x depending
> + * upon it's nearness to @x. If @y will always be a power of 2, consider
> + * using the faster round_closest_up() or round_closest_down().
> + *
> + * Examples:
> + * * roundclosest(21, 5) = 20
> + * * roundclosest(19, 5) = 20
> + * * roundclosest(17, 5) = 15
> + */
> +#define roundclosest(x, y) rounddown((x) + (y) / 2, (y))

Won't this go wrong if (x) + (y) / 2 overflows?  This may happen even in
some cases where the correctly rounded value would be in range.

The existing rounddown() already leaves something to be desired IIUC: if
given a negative dividend, it looks like it actually rounds up, at least
on some arches.  But maybe people don't use it that way very often.
Perhaps I'm missing something.

[...]

Cheers
---Dave

