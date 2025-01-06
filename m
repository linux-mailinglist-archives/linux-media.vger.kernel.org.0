Return-Path: <linux-media+bounces-24271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DBDA023D2
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 12:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F45B18819D3
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 11:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDDF635;
	Mon,  6 Jan 2025 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="ZDBxQKNq"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485A61DB37B;
	Mon,  6 Jan 2025 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736161485; cv=none; b=mzs5H9CF2TgBHFix/CQuZQag+irBXsm3TmVaORhiM7b8hdg1MgUM/bi0ZM0jT9as7M3zueN+DWlo1qJgSAA25bAzaezrpgtEWfypRmg7YnO4YGmBmkdnz8oNpfz2Oq3JLg1HtrvpD9HrsUJ36PgXq1kAsOHSubpVDt743x9TiAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736161485; c=relaxed/simple;
	bh=267DDSQ5NuLN4Q41BfeZlM2g9PXuZD1KJm9DIAIAa5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqi2RfmKnsKLU8FrnW0iCOzZ2N1KkcjktUrGIo46E9233vpYvpqnUbfFWZLJxoKKL4jYZHo7kSQzTijXjFipiSLZvULBF+Xc3xus0JfYXQ1BH28275iWx/px3GzlwbXJuzs2J9l3Yoz1K+yUjpHyJYuVCJ6X3+MYjDbEAj9oX6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=ZDBxQKNq; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1736160973; bh=267DDSQ5NuLN4Q41BfeZlM2g9PXuZD1KJm9DIAIAa5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZDBxQKNqoD7016XwzkP1jYxuEKBsCkWg9nkx3IWuptub4OsALc56hLzcIQoakMiDf
	 X7cUTf/qg80fpIyPZ2X5Pj6jHS9TU/XXwO8TD8Ph3wvmDk0YCHAmNCB62lsi0uHPtu
	 fhywXJg1gG61A3lRFcIe60XRM41rJLwk5XHTgwzhhVvIpiHaHYGMklECvLh8Po22jX
	 zf0CLzxJhS+KVAqf/y1QpJMpBxOHc7QoS2kZZ8kfjDujg8hU2pod6ZCUEU51xI1mK5
	 oSCOFmdUj0E9iMW2Vjr1OABKgziL5Opw4J2V2cM/iPc5XitnuXi5Bx6imhl+SGQ9Ib
	 wpbql7KIBa0Xg==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 865D91002BF; Mon,  6 Jan 2025 10:56:13 +0000 (GMT)
Date: Mon, 6 Jan 2025 10:56:13 +0000
From: Sean Young <sean@mess.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: lirc: Fix error handling in lirc_register()
Message-ID: <Z3u2zVQyammNo_o3@gofer.mess.org>
References: <20250105100101.275309-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105100101.275309-1-make24@iscas.ac.cn>

Hi,

On Sun, Jan 05, 2025 at 06:01:01PM +0800, Ma Ke wrote:
> When cdev_device_add() failed, calling put_device() to explicitly
> release dev->lirc_dev. Otherwise, it could cause the fault of the
> reference count.
> 
> Found by code review.

Interesting find, thanks for finding and reporting.

So I think the idea is right, but there is a problem. lirc_release_device()
will do a put_device() on the rcdev, but no corresponding get_device() is
done in this code path.


Sean

> 
> Cc: stable@vger.kernel.org
> Fixes: a6ddd4fecbb0 ("media: lirc: remove last remnants of lirc kapi")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/media/rc/lirc_dev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
> index a2257dc2f25d..ed839e15fa16 100644
> --- a/drivers/media/rc/lirc_dev.c
> +++ b/drivers/media/rc/lirc_dev.c
> @@ -765,6 +765,7 @@ int lirc_register(struct rc_dev *dev)
>  	return 0;
>  
>  out_ida:
> +	put_device(&dev->lirc_dev);
>  	ida_free(&lirc_ida, minor);
>  	return err;
>  }
> -- 
> 2.25.1

