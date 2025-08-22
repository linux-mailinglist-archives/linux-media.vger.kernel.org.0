Return-Path: <linux-media+bounces-40724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D68DFB31149
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 10:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54E671C80146
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 08:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01442EAB62;
	Fri, 22 Aug 2025 08:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwoAaERU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4EB2C327C
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755849930; cv=none; b=TjE+fxIhzVgH0geMJ4O9aepnuFFPmMDaP2hzOf+9BB7dYTTfgij+4sg3tNk50FZIIJHq9nm+owb1wD/D0i7CozpwiwGPaOlfqjHfLftF8nx8/8GwHDCTg4E0va4BxW9n4fKd5v75vRbSi3qIFMfvmqn46PsYnpJYT+LXVL4JAxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755849930; c=relaxed/simple;
	bh=gG9SydZPSioTOQTL8skuN8i7hizpmOfohFsh6bC4rWY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZZPdGl79cyPKaPhLMdfNXNaWvSQUuNjm6c9KbMF+DXskeyyT0Nf6VFeQgJC0O9tkLQMKJb9JOe/11Qaga1RLs7FTS/yM6s6ruomalSkEDh47oSgFgDHb+k+WM0j7NISzDC1bTVoPxnNbDB/0dMtye7I70VYmbb5dpyRD4axUO8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwoAaERU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CF9C4CEF1;
	Fri, 22 Aug 2025 08:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755849929;
	bh=gG9SydZPSioTOQTL8skuN8i7hizpmOfohFsh6bC4rWY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=dwoAaERUX18kVbKuxVAg3GTHuApIfVA5YANdI1NsDOyXDM0K2syU46HU+g9GnTvFN
	 WJlBen9TGRC6G8cQvHVrfQakTtOI0mB228GGHeOi/c9ZPIcrOSd7DQLFmYngLUlftL
	 r/48nX3wI2RW/2EAwYvFSaA88lcFfeg8OF99ljpU/mVGMztKJLFBq5YIL50mHZ3JCM
	 XVBXhfbhGYtYhUGV9hM32gMY7vKA6rTakJhFTW/C5zWu+w6av2FGc5JNGw99PgnLP/
	 Z6kcrriEiCrnAHrI4Venry1yvY+m1FsYLQInQLyUXJ+JEbViyjvxCT7Yob5lIMmkXz
	 00fy8itshCVqA==
Message-ID: <c8a2db97-b56b-4128-bc61-0243de8d4a96@kernel.org>
Date: Fri, 22 Aug 2025 10:05:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 10/26] media: mc: Clear minor number reservation at
 unregistration time
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-11-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20240610100530.1107771-11-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/06/2024 12:05, Sakari Ailus wrote:
> Clear the media device's minor number reservation at unregister time as
> there's no need to keep it reserved for longer. This makes it possible to
> reserve the same minor right after unregistration.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/media/mc/mc-devnode.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 38c472498f9e..f7ecabe469a4 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -49,13 +49,6 @@ static void media_devnode_release(struct device *cd)
>  {
>  	struct media_devnode *devnode = to_media_devnode(cd);
>  
> -	mutex_lock(&media_devnode_lock);
> -
> -	/* Mark device node number as free */
> -	clear_bit(devnode->minor, media_devnode_nums);
> -
> -	mutex_unlock(&media_devnode_lock);
> -
>  	/* Release media_devnode and perform other cleanups as needed. */
>  	if (devnode->release)
>  		devnode->release(devnode);
> @@ -268,6 +261,10 @@ void media_devnode_unregister(struct media_devnode *devnode)
>  
>  	cdev_del(&devnode->cdev);
>  	device_unregister(&devnode->dev);
> +
> +	mutex_lock(&media_devnode_lock);
> +	clear_bit(devnode->minor, media_devnode_nums);
> +	mutex_unlock(&media_devnode_lock);
>  }
>  
>  /*


