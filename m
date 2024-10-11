Return-Path: <linux-media+bounces-19418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F55B99A29A
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 13:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 271461F249C0
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 11:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDE9215F75;
	Fri, 11 Oct 2024 11:21:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0EC2141C5;
	Fri, 11 Oct 2024 11:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728645699; cv=none; b=BmTCPNIUFV2nnKLNFw0mI57zqduZF2w9pyJOuSsXOiBDdMoiB9+lcb2icmegsoq46Itbie8BROZA4dJ9MWPhPOFo3d1fVPNZ6g5ojlHm8C08vYJotskyBaAJPvlib8xg90rjp4loBfKWfcIWS+ZT0U+DSReArmSM2EMbmPUq2sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728645699; c=relaxed/simple;
	bh=vKGwbz9Bno83M1Il4z/LGsCjRoFE2MwdHl7PnUu4kWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWsZ/UhhfQJzKOtZ72UCXQXQw6vo+KnSTYMXPNDZ6PJ2jr0T67p3FdZ1p8h4knA0esec6LPcwYs907a1qwMmnlqWhw930KhPBiI/UzsHckoFZVu5wzdOcQQBS89e6NdPZj83S+gTHfw6CXZgjBC45RKjwH637Ypy1kHaHD3Z9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4B5C4CEC3;
	Fri, 11 Oct 2024 11:21:37 +0000 (UTC)
Message-ID: <b4bb440e-3998-41df-93dd-d69012ca8a08@xs4all.nl>
Date: Fri, 11 Oct 2024 13:21:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v3 1/2] media: cec: remove redundant null pointer
 checks in cec_devnode_init()
To: Li Zetao <lizetao1@huawei.com>, mchehab@kernel.org,
 gregkh@linuxfoundation.org, ricardo@marliere.net, ruanjinjie@huawei.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240910154803.736951-1-lizetao1@huawei.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240910154803.736951-1-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/09/2024 17:48, Li Zetao wrote:
> Since the debugfs_create_dir() never returns a null pointer, checking
> the return value for a null pointer is redundant. Remove this check
> since debugfs_create_file can handle IS_ERR pointers. At the same time,
> debugfs_create_dir returns ERR_PTR (-ENODEV) by default when
> CONFIG_DEBUG_FS=N, so there is no need for CONFIG_DEBUG_FS macro
> isolation.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
> v2 -> v3: Drop the null pointer check for top_cec_dir
> v2: https://lore.kernel.org/all/20240907034400.3693797-1-lizetao1@huawei.com/
> v1 -> v2: Remove this check since debugfs_create_file can handle IS_ERR
> pointers. And drop the ifdef CONFIG_DEBUG_FS statement.
> v1: https://lore.kernel.org/all/20240903143607.2004802-1-lizetao1@huawei.com/
> 
>  drivers/media/cec/core/cec-core.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
> index e0756826d629..2897283ebe72 100644
> --- a/drivers/media/cec/core/cec-core.c
> +++ b/drivers/media/cec/core/cec-core.c
> @@ -374,10 +374,6 @@ int cec_register_adapter(struct cec_adapter *adap,
>  	}
>  
>  	dev_set_drvdata(&adap->devnode.dev, adap);
> -#ifdef CONFIG_DEBUG_FS
> -	if (!top_cec_dir)
> -		return 0;
> -
>  	adap->cec_dir = debugfs_create_dir(dev_name(&adap->devnode.dev),
>  					   top_cec_dir);
>  
> @@ -388,7 +384,6 @@ int cec_register_adapter(struct cec_adapter *adap,
>  		return 0;
>  	debugfs_create_file("error-inj", 0644, adap->cec_dir, adap,
>  			    &cec_error_inj_fops);

This still has to remain under #ifdef CONFIG_DEBUG_FS, otherwise cec_error_inj_fops
is not defined. You can probably move the #ifdef to just before the debugfs_create_file
call above.

Regards,

	Hans

> -#endif
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(cec_register_adapter);
> @@ -439,13 +434,7 @@ static int __init cec_devnode_init(void)
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


