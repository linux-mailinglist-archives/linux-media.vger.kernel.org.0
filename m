Return-Path: <linux-media+bounces-47161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 329EAC602E0
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 10:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0146D4E1378
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 09:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08F4283129;
	Sat, 15 Nov 2025 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caf2ADpr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF0423D7C4
	for <linux-media@vger.kernel.org>; Sat, 15 Nov 2025 09:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763200464; cv=none; b=uQiKf6/L2tpaYpS181rJNEHYpv16jdjAbnb/89cI7oyjSweDMvRqW4JrCQIsUReN5QkWfcGKh/31i2fzrn7mDH4m99JN4TxzO/g+nw2rNo1E5krxVDymNdN3NC/immB4kBepvacYW0sIpSz8fgc5T7mLJptTloZOBTle0h9srSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763200464; c=relaxed/simple;
	bh=r2bSFw61WdCTEV2xaDuuulDGVxOUzrPQIk3OqXed+2U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ayXLo287G3fpdQwKgfu8bfVR4C3/74gWuPZw58tojS97d0n3TCBePoti2fnwLKoA/dw7JorKah+qz90mS5m2zmZd+50UNbnKsVDA2zPDg4SS/J9qlSTDeegNRd32QLYCu6D6Msk6+1Imsdp4sinLdREv0T1KG9R1xJiu31AgC6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=caf2ADpr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB5FC113D0;
	Sat, 15 Nov 2025 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763200463;
	bh=r2bSFw61WdCTEV2xaDuuulDGVxOUzrPQIk3OqXed+2U=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=caf2ADprjdg3PIMvAE3OszQ0ccqyzSHJt6xEQB1JpOUUA2kOD9G2gZ9AVnMUxK4YF
	 52/k92/1XMUjgOtTQ/jLFu3/hKnGixnZ1VJ42UQqumww5f7NKONwVy2GOZK4K/prYW
	 AYM78vGQXeomxQdshDdxUj7uDbyYNrRyXX38Z6tRBc9HX7hzQBwgTB3r/nD45eBFC2
	 y2TSuJRQ/NmQIRb+V8uPYEDe1BCsuztOLjLWk2Ts2ABs8h4MncvXCrErLMaK8JsEJS
	 Z6KGhnNUASd7Dap3yklO3BiyQGUmU1FXZSyiFhsSHt1reFsAkttv4PgL3jyeJjE7rh
	 YI9dz6zeWCFeQ==
Message-ID: <60754b1c-7f4d-4a7f-abe2-5b23c0f40aba@kernel.org>
Date: Sat, 15 Nov 2025 10:54:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: mali-c55: Mark pm handlers as __maybe_unused
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org
References: <20251114201921.562337-1-jacopo.mondi@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20251114201921.562337-1-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2025 21:19, Jacopo Mondi wrote:
> As the Mali-C55 driver is instrumented to work without depending on
> CONFIG_PM, mark the two pm_runtime handlers as __maybe_unused to
> suppress the compiler warning when compiling without CONFIG_PM.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Late fix for Mali C55 PR
> 
> fixes:
> https://gitlab.freedesktop.org/linux-media/media-committers/-/jobs/87903226
> 
> it's great to have CI, Thanks!

I wondered why I didn't see this issue until CI started on the merge request.
It turned out that I used to have the FULL_CI variable set to 1 in gitlab, but
at some point it was removed. Either by me or perhaps by a gitlab update, possibly
when we moved to a different server. In any case, I now set it again and I now
see the same issue.

You can do the same: setting FULL_CI to 1 will enable additional tests, which
is useful when prepping a PR.

Regards,

	Hans

> 
> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index b23d543cf496..43b834459ccf 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -707,7 +707,7 @@ static void __mali_c55_power_off(struct mali_c55 *mali_c55)
>  	clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
>  }
> 
> -static int mali_c55_runtime_suspend(struct device *dev)
> +static int __maybe_unused mali_c55_runtime_suspend(struct device *dev)
>  {
>  	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
> 
> @@ -770,7 +770,7 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
>  	return 0;
>  }
> 
> -static int mali_c55_runtime_resume(struct device *dev)
> +static int __maybe_unused mali_c55_runtime_resume(struct device *dev)
>  {
>  	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
>  	int ret;
> --
> 2.51.1
> 


