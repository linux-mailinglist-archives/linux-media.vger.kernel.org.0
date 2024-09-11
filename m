Return-Path: <linux-media+bounces-18157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B59197529B
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 14:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B23B28AE32
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 12:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8593D19259F;
	Wed, 11 Sep 2024 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JYsiu2g5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8FE18FDBD;
	Wed, 11 Sep 2024 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726058246; cv=none; b=FiqGy4b722K5v7pAzojFzKNPTIyPnGaI8M9vuUQIqkVLJDHyM59Il8tIupBqziSVemK0iSCsDHzPVOmHcrAJt9i4evCgbJ15p7MVtPs3O8HzZEwAiaYuGxyodtvvcXw1g+y301GJUHkpeh1QxiVeQ728ptZqp7kyFcvm4blep2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726058246; c=relaxed/simple;
	bh=rOhh9TtkfWnKgA0fJDkoKegIl8tjt+2vZETiZOM0N3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tr7RiXLVwg6Jd0pEJlK9Ds0AdF5UEOOJO3/dPfE79SXA9rStrAcb7lsX4tHlBuocYD4eAvcuem4foMNiwvkI2gp3jc1BFpgMtvtDu0iAWri/azySOPZN0xoX+NMzUGvupbt6rCMgkOG97cQ9A4akAZFPe6BVbymQfUi3b4386rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JYsiu2g5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09466C4CEC5;
	Wed, 11 Sep 2024 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726058245;
	bh=rOhh9TtkfWnKgA0fJDkoKegIl8tjt+2vZETiZOM0N3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYsiu2g5kYk932I072qKlhbG0DbYRUWPKriXbv36QEFZNDaFRLO8ftpOENClFKN+o
	 goiS0ELDGq2dCP9AZLZmpJBT/ofjtBqBOTevsBDMTdIFbVtpW6ANzAXtkEcbJbyF+c
	 6CBD3dQi92NjP9WpJfwpsMsNZ7i52P1C6uX1paZ4=
Date: Wed, 11 Sep 2024 07:30:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, ricardo@marliere.net,
	ruanjinjie@huawei.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v3 1/2] media: cec: remove redundant null pointer
 checks in cec_devnode_init()
Message-ID: <2024091142-flattery-graveyard-cfea@gregkh>
References: <20240910154803.736951-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910154803.736951-1-lizetao1@huawei.com>

On Tue, Sep 10, 2024 at 11:48:02PM +0800, Li Zetao wrote:
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

I'm going to be a pain here, and say "why do you need top_cec_dir at
all?"

Why not just look it up every time you want it after creating it with a
call to debugfs_lookup() or debugfs_lookup_and_remove()?

anyway, not a big deal, it's up to the maintainers here to want this as
well, just a thought for further calls cleanup work.

thanks,

greg k-h

