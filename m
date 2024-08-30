Return-Path: <linux-media+bounces-17230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 653E89663B4
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 16:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06F521F23807
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 14:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113D21B1D60;
	Fri, 30 Aug 2024 14:07:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B6B7DA94;
	Fri, 30 Aug 2024 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725026859; cv=none; b=pgc85ec05GFXg3IPQfrb+vfaiDSO0qFpEvl5dGdnbS6QKE4xvUXm6MvYmFIoohR4EBDVpRnqeMVcFRQdvuxnIjKW5Ef01vUBPyjCoWrezohGi93zF/bxi3SLeTpzLwog18tFLaBMcBfv194PT195Cw9hVGqyHUt0Or0kdE2mDkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725026859; c=relaxed/simple;
	bh=MLWtch4IWQAQcQW3bTv1wHYLiseBLb1dclBx804apWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/EGSgC8pgmMb5j/NtzELe+Qx69CquKHJkEmu8PUncq3ijABfsfi72b9WGbyUDnAdHVcltMOP+OVnEnCKnLO6OmMKqyUpb/S6leZx6Gb7u3gJNpPLoJ0p42cWe1X/5Ayc8TsUrxYoHvKsAi5Ra06rXqjvXnzrL3wmo+l7wPMOkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2B571063;
	Fri, 30 Aug 2024 07:08:03 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B65B03F762;
	Fri, 30 Aug 2024 07:07:33 -0700 (PDT)
Date: Fri, 30 Aug 2024 15:07:31 +0100
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
Subject: Re: [PATCH v2 5/6] lib: math_kunit: Add tests for new macros related
 to rounding to nearest value
Message-ID: <ZtHSIyDbljwrkWBE@e133380.arm.com>
References: <20240826150822.4057164-1-devarsht@ti.com>
 <20240826150822.4057164-6-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826150822.4057164-6-devarsht@ti.com>

On Mon, Aug 26, 2024 at 08:38:21PM +0530, Devarsh Thakkar wrote:
> Add tests for round_closest_up/down and roundclosest macros which round
> to nearest multiple of specified argument. These are tested with kunit
> tool as shared here [1] :

The tests here don't seem to be well targeted at the actual edge cases
where incrementing or decremting the dividend by 1 is expected to
change the result, or when round_closest_up() and round_closest_down()
are expected to differ.

There's also no coverage of:

	* negative inputs

	* types other than int

	* inputs close to type limits

(I've highlighted a few specific issues below, though there seems to be
a more general lack of coverage here.)

> 
> Link: https://gist.github.com/devarsht/3f9042825be3da4e133b8f4eda067876 [1]
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> V2: No change
> ---
>  lib/math/math_kunit.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/lib/math/math_kunit.c b/lib/math/math_kunit.c
> index be27f2afb8e4..05022f010be6 100644
> --- a/lib/math/math_kunit.c
> +++ b/lib/math/math_kunit.c
> @@ -70,6 +70,26 @@ static void round_down_test(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, round_down((1 << 30) - 1, 1 << 29), 1 << 29);
>  }
>  
> +static void round_closest_up_test(struct kunit *test)
> +{
> +	KUNIT_EXPECT_EQ(test, round_closest_up(17, 4), 16);
> +	KUNIT_EXPECT_EQ(test, round_closest_up(15, 4), 16);
> +	KUNIT_EXPECT_EQ(test, round_closest_up(14, 4), 16);
> +	KUNIT_EXPECT_EQ(test, round_closest_up((1 << 30) - 1, 1 << 30), 1 << 30);
> +	KUNIT_EXPECT_EQ(test, round_closest_up((1 << 30) + 1, 1 << 30), 1 << 30);

These miss the edge case where the result is expected to change; could
we also check:

	round_closest_up(1 << 29, 1 << 30)


> +	KUNIT_EXPECT_EQ(test, round_closest_up((1 << 30) - 1, 2), 1 << 30);
> +}
> +
> +static void round_closest_down_test(struct kunit *test)
> +{
> +	KUNIT_EXPECT_EQ(test, round_closest_down(17, 4), 16);
> +	KUNIT_EXPECT_EQ(test, round_closest_down(15, 4), 16);
> +	KUNIT_EXPECT_EQ(test, round_closest_down(14, 4), 12);
> +	KUNIT_EXPECT_EQ(test, round_closest_down((1 << 30) - 1, 1 << 30), 1 << 30);
> +	KUNIT_EXPECT_EQ(test, round_closest_down((1 << 30) + 1, 1 << 30), 1 << 30);
> +	KUNIT_EXPECT_EQ(test, round_closest_down((1 << 30) - 1, 2), (1 << 30) - 2);
> +}
> +
>  /* These versions can round to numbers that aren't a power of two */
>  static void roundup_test(struct kunit *test)
>  {
> @@ -95,6 +115,18 @@ static void rounddown_test(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, rounddown(4, 3), 3);
>  }
>  
> +static void roundclosest_test(struct kunit *test)
> +{
> +	KUNIT_EXPECT_EQ(test, roundclosest(21, 5), 20);
> +	KUNIT_EXPECT_EQ(test, roundclosest(19, 5), 20);

This seems to miss the edge cases (e.g., roundclosest(20 * N + 10, 20),
roundclosest(20 * N +/- 9, 20) for some N.

> +	KUNIT_EXPECT_EQ(test, roundclosest(17, 5), 15);
> +	KUNIT_EXPECT_EQ(test, roundclosest((1 << 30), 3), (1 << 30) - 1);
> +	KUNIT_EXPECT_EQ(test, roundclosest((1 << 30) - 1, 1 << 29), 1 << 30);
> +
> +	KUNIT_EXPECT_EQ(test, roundclosest(4, 3), 3);
> +	KUNIT_EXPECT_EQ(test, roundclosest(5, 3), 6);
> +}
> +

[...]

Cheers
---Dave

