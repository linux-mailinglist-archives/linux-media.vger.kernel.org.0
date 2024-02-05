Return-Path: <linux-media+bounces-4707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7BA849D55
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 15:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BB791F24ACB
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 14:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12602C1A4;
	Mon,  5 Feb 2024 14:46:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF312C1B8
	for <linux-media@vger.kernel.org>; Mon,  5 Feb 2024 14:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707144398; cv=none; b=XNJrNGHogv1p31C7acePqEM97S/QyPLHuZOPVCPmwF4XfVhXFGCAdebbzJd40sr9+nz6jNn/VJFgdIoRdyp8ym4YUOdmIBmtavHCUrhYWKU/9N5cfZEssjoouOqrqs3oPvYbotxpRjlB6PcdEfAExWLAZldbsGJUtCE9f72t8NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707144398; c=relaxed/simple;
	bh=/Ok05JxefW1dPpJtjpI7X3xJCx6i992+cRIMbQQ6QWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COdp52BBXlMV8KiqXI8U71j/L5y1Rt311npM1n+LYUFci0hHlD9YqrhGbfz8CccUEWN1ELbgukqDoyZfdNFS3vgvdzKl3J4To0IaGvnaGWztPs/mdbwdfmIBrOSoHkcj/l7oJgWiPGR0Gk1QL4mpB5tk16+W5m+OdBH1SG9y1E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55188C433F1;
	Mon,  5 Feb 2024 14:46:37 +0000 (UTC)
Message-ID: <61f84b97-6919-44b3-8de8-043ea8ccd889@xs4all.nl>
Date: Mon, 5 Feb 2024 15:46:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/29] media: mc: Refactor media devnode minor clearing
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-15-sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231220103713.113386-15-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/2023 11:36, Sakari Ailus wrote:
> Refactor clearing media devnode minor bit in media devnode bitmap. Note
> that number is used instead of struct media_devnode as argument since the
> minor number will also be stored in a different structure soon.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/mc/mc-devnode.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 7b17419050fb..717408791a7c 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -44,17 +44,22 @@ static dev_t media_dev_t;
>  static DEFINE_MUTEX(media_devnode_lock);
>  static DECLARE_BITMAP(media_devnode_nums, MEDIA_NUM_DEVICES);
>  
> -/* Called when the last user of the media device exits. */
> -static void media_devnode_release(struct device *cd)
> +static void media_devnode_free_minor(unsigned int minor)
>  {
> -	struct media_devnode *devnode = to_media_devnode(cd);
> -
>  	mutex_lock(&media_devnode_lock);
>  
>  	/* Mark device node number as free */
> -	clear_bit(devnode->minor, media_devnode_nums);
> +	clear_bit(minor, media_devnode_nums);
>  
>  	mutex_unlock(&media_devnode_lock);
> +}
> +
> +/* Called when the last user of the media device exits. */
> +static void media_devnode_release(struct device *cd)
> +{
> +	struct media_devnode *devnode = to_media_devnode(cd);
> +
> +	media_devnode_free_minor(devnode->minor);
>  
>  	/* Release media_devnode and perform other cleanups as needed. */
>  	if (devnode->release)
> @@ -254,9 +259,7 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
>  	return 0;
>  
>  cdev_add_error:
> -	mutex_lock(&media_devnode_lock);
> -	clear_bit(devnode->minor, media_devnode_nums);
> -	mutex_unlock(&media_devnode_lock);
> +	media_devnode_free_minor(devnode->minor);
>  
>  	return ret;
>  }


