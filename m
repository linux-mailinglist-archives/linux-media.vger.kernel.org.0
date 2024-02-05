Return-Path: <linux-media+bounces-4708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4DA849D59
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 15:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B1BA1F23F60
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 14:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E752C1B6;
	Mon,  5 Feb 2024 14:48:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758A92C190
	for <linux-media@vger.kernel.org>; Mon,  5 Feb 2024 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707144515; cv=none; b=T4gRh75w3PgcSBOQP11ANBXkwaccdk4VNExfcdDT1mjaJ8BS0jDpvlT4O2Ce6TVxWxUsNR8Z+RmT11mZK6i5iMiLcw3uTVEKVBPiidLyHiNa6cxriKZ9eTkOXyNdWFGz4UhfB/zOohXGb3jLytME4V/cnfocXGidnDBSu8VoQ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707144515; c=relaxed/simple;
	bh=lBdUUueYgU8jJDqmI/l0iYUv9jTC67VD0y7CjHiVOAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCtCXq0jyrp5PwHoKobZg0c0Y5tdJDwE0p1m6yhnOfwEhY36v+medEg1YEBDSa6JH2xqgfMdf/PzdGN31u/W8fCBqj6Pgr1edOzxtjYttP1wBZ4RRAMZA0FhiC5F7j6PM/51Q87F0+mOH7UgVs/3Bu5W4OsqtQUTyvZgP+TkG4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28446C433F1;
	Mon,  5 Feb 2024 14:48:33 +0000 (UTC)
Message-ID: <7d645fab-ea23-4958-b815-346f9128b534@xs4all.nl>
Date: Mon, 5 Feb 2024 15:48:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/29] media: mc: Unassign minor only if it has been
 assigned
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-16-sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231220103713.113386-16-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/2023 11:36, Sakari Ailus wrote:
> Assign the media device minor to -1 if it has not been previously
> assigned. There's no dependence to this yes but it will be required by

yes -> yet

> patch "media: mc: Implement best effort media device removal safety sans
> refcount" soon.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

After fixing that somewhat confusing typo above:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/mc/mc-devnode.c | 9 ++++++++-
>  include/media/media-devnode.h | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 717408791a7c..5057c48f8870 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -59,7 +59,8 @@ static void media_devnode_release(struct device *cd)
>  {
>  	struct media_devnode *devnode = to_media_devnode(cd);
>  
> -	media_devnode_free_minor(devnode->minor);
> +	if (devnode->minor != -1)
> +		media_devnode_free_minor(devnode->minor);
>  
>  	/* Release media_devnode and perform other cleanups as needed. */
>  	if (devnode->release)
> @@ -212,6 +213,7 @@ static const struct file_operations media_devnode_fops = {
>  void media_devnode_init(struct media_devnode *devnode)
>  {
>  	device_initialize(&devnode->dev);
> +	devnode->minor = -1;
>  }
>  
>  int __must_check media_devnode_register(struct media_devnode *devnode,
> @@ -220,6 +222,9 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
>  	int minor;
>  	int ret;
>  
> +	if (devnode->minor != -1)
> +		return -EINVAL;
> +
>  	/* Part 1: Find a free minor number */
>  	mutex_lock(&media_devnode_lock);
>  	minor = find_first_zero_bit(media_devnode_nums, MEDIA_NUM_DEVICES);
> @@ -261,6 +266,8 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
>  cdev_add_error:
>  	media_devnode_free_minor(devnode->minor);
>  
> +	devnode->minor = -1;
> +
>  	return ret;
>  }
>  
> diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
> index 6d46c658be21..d050f54f252a 100644
> --- a/include/media/media-devnode.h
> +++ b/include/media/media-devnode.h
> @@ -60,7 +60,7 @@ struct media_file_operations {
>   * @dev:	pointer to struct &device containing the media controller device
>   * @cdev:	struct cdev pointer character device
>   * @parent:	parent device
> - * @minor:	device node minor number
> + * @minor:	device node minor number, -1 if unassigned
>   * @flags:	flags, combination of the ``MEDIA_FLAG_*`` constants
>   * @release:	release callback called at the end of ``media_devnode_release()``
>   *		routine at media-device.c.


