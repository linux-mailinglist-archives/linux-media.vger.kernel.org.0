Return-Path: <linux-media+bounces-17990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE58971895
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 13:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8637F1C22363
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 11:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDD3172BCE;
	Mon,  9 Sep 2024 11:49:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356931B3B27
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882553; cv=none; b=mlitHx4FrhCP3OEL91OQb85rrvkbhJwdvQ6CqdROy3AN3MYEzxN4wkKp5+byzdktw3MedkK7vtGrSlAutsRV9tBU4NFv6JqIqxLbmW3l93vf/M/IVWb0NeHk7xsAp0q8IhcIIeWciVEXiO+4MF0KP3gbJpSN/n+Zs0O5/ycOerI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882553; c=relaxed/simple;
	bh=zULDMh6RjaioU7dOxO4C3ftlLULpgD0my1ozY3M5hQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dw5femYBrm81g5OY92uPMoWE7cCcD6F18bGDEsqLHNrgkjjIw+5J5pJSkukMJfSY01QcMMV5truUNDMXjxHqylBghEr58EBUivVAehxaMVG30P0pZV9Jy9X7s8mOKmxJD12kxPbkMcglIgvrPosWtmd3Uxe4Qv2yMMQBDnSutyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701C1C4CEC5;
	Mon,  9 Sep 2024 11:49:11 +0000 (UTC)
Message-ID: <02d74204-b7cb-4c9b-9bcf-6904fb17d5eb@xs4all.nl>
Date: Mon, 9 Sep 2024 13:49:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v2 1/2] media: cec: remove redundant null pointer
 checks in cec_devnode_init()
To: Li Zetao <lizetao1@huawei.com>, mchehab@kernel.org,
 gregkh@linuxfoundation.org, laurent.pinchart+renesas@ideasonboard.com,
 ricardo@marliere.net, ruanjinjie@huawei.com
Cc: linux-media@vger.kernel.org
References: <20240907034400.3693797-1-lizetao1@huawei.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240907034400.3693797-1-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/09/2024 05:43, Li Zetao wrote:
> Since the debugfs_create_dir() never returns a null pointer, checking
> the return value for a null pointer is redundant. Remove this check
> since debugfs_create_file can handle IS_ERR pointers. At the same time,
> debugfs_create_dir returns ERR_PTR (-ENODEV) by default when
> CONFIG_DEBUG_FS=N, so there is no need for CONFIG_DEBUG_FS macro
> isolation.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
> v1 -> v2: Remove this check since debugfs_create_file can handle IS_ERR
> pointers. And drop the ifdef CONFIG_DEBUG_FS statement.
> v1:
> https://lore.kernel.org/all/20240903143607.2004802-1-lizetao1@huawei.com/
> 
>  drivers/media/cec/core/cec-core.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
> index e0756826d629..77be6c11c63c 100644
> --- a/drivers/media/cec/core/cec-core.c
> +++ b/drivers/media/cec/core/cec-core.c
> @@ -439,13 +439,7 @@ static int __init cec_devnode_init(void)
>  		return ret;
>  	}
>  
> -#ifdef CONFIG_DEBUG_FS
>  	top_cec_dir = debugfs_create_dir("cec", NULL);
> -	if (IS_ERR_OR_NULL(top_cec_dir)) {
> -		pr_warn("cec: Failed to create debugfs cec dir\n");
> -		top_cec_dir = NULL;
> -	}
> -#endif
>  
>  	ret = bus_register(&cec_bus_type);
>  	if (ret < 0) {

Check all users of top_cec_dir, you'll need to make more changes in this source.

Regards,

	Hans

