Return-Path: <linux-media+bounces-47148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 367E1C5F3D1
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 21:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BDF014E2906
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 20:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C578345CBA;
	Fri, 14 Nov 2025 20:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uplSCwjo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990AD3148B3
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 20:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763152092; cv=none; b=a0hQRMGFliCheLT3aZUPTbl6JJ8B6htgTU1WXV/GDafLAJKxbuw24ILOhPziB7a5RGzhCEeXpgg1tTLrGjesKVOCCyZ0nMIgmb+kbRVcj7fRtVM3P9/u0s0VmTnV+Ee1GWsFSLF60x9hnCakJzPByhy2IVdnDjPhNjGRlJht/uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763152092; c=relaxed/simple;
	bh=YZ0MUeJT9e4OvU8ECWUH8flNUzgUlDQPTD1QSIyYrJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqKTomRd0T+OnIK3yf/277S+Dd9oiuMdviXjvh2vBqyoGIbKUfadJi4HYRb6oE1m38FLtrlFSV9lLP4MaPfZUL03t8v79l3ythUxcrKyYDs2QPdQHl7OJywvqy8Gbd1fEjzzEMM5DF+SsMaqa6Ius48YjJ2VYjB6rCP5sYgB4g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uplSCwjo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93E23169;
	Fri, 14 Nov 2025 21:26:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763151966;
	bh=YZ0MUeJT9e4OvU8ECWUH8flNUzgUlDQPTD1QSIyYrJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uplSCwjohVLeUindxQldjxf5ZgT0ny/PLM+sEcTaFI0sj9ayS1SrqvwQfsFcPAaRp
	 YkewNZgFnzT0GuDoppESKlA69dga2UKrBM575M+3hYu9x10Ehg7wD+8wcCLBeVg/BA
	 wjLtK3DWNNq4LnHWJGTSTaksQEgXCXJBFIkCQMwc=
Message-ID: <58ee02f3-a95a-4085-a8e5-fed5c14a892d@ideasonboard.com>
Date: Fri, 14 Nov 2025 20:28:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mali-c55: Mark pm handlers as __maybe_unused
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hans@jjverkuil.nl,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
References: <20251114201921.562337-1-jacopo.mondi@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20251114201921.562337-1-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 14/11/2025 20:19, Jacopo Mondi wrote:
> As the Mali-C55 driver is instrumented to work without depending on
> CONFIG_PM, mark the two pm_runtime handlers as __maybe_unused to
> suppress the compiler warning when compiling without CONFIG_PM.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---

Thanks for handling it:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> Late fix for Mali C55 PR
> 
> fixes:
> https://gitlab.freedesktop.org/linux-media/media-committers/-/jobs/87903226
> 
> it's great to have CI, Thanks!
> 
> ---
>   drivers/media/platform/arm/mali-c55/mali-c55-core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index b23d543cf496..43b834459ccf 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -707,7 +707,7 @@ static void __mali_c55_power_off(struct mali_c55 *mali_c55)
>   	clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
>   }
> 
> -static int mali_c55_runtime_suspend(struct device *dev)
> +static int __maybe_unused mali_c55_runtime_suspend(struct device *dev)
>   {
>   	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
> 
> @@ -770,7 +770,7 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
>   	return 0;
>   }
> 
> -static int mali_c55_runtime_resume(struct device *dev)
> +static int __maybe_unused mali_c55_runtime_resume(struct device *dev)
>   {
>   	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
>   	int ret;
> --
> 2.51.1
> 
T



