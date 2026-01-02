Return-Path: <linux-media+bounces-49847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD8ACEEA06
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 14:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B2B1300D310
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 13:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7CB325708;
	Fri,  2 Jan 2026 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tNt5/pyZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101D23254B1
	for <linux-media@vger.kernel.org>; Fri,  2 Jan 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358294; cv=none; b=OxrbblAI6UKyHfYZi8xRaLuKFL22OOvZ/UvzDH3w5oMt0DFauuQ0uT6wc8EqK+AK5uoPlPupWjdEC8279xj5O9I2wNA9SLkQcShAdN6wvqfJzbRIdxVC6cPnkxKjGbBIOjTdl5uTOi5nAHIub5lM6EkDICZ+T1w2g8y/M3LX1hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358294; c=relaxed/simple;
	bh=3xheS4w2GEIWpVAWQeD490HJWB+f2Iut3gHL/V5aVUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2xqdJSFkLrsvVqifvRb6RKef1bjYYufmyAnbbVYdhlh/rkXlaVdQX6+PURL7C6kWqt0cSbyFiUPNfPE9RpNLgXQrzGxboJ1ysc09p/tBZ7QEooR8GivvjvPLIuoKPrFuNBzk+gosXzECziKVEQM14xKql5P0hiGFHvJOOtbi70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tNt5/pyZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3389D228;
	Fri,  2 Jan 2026 13:51:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767358264;
	bh=3xheS4w2GEIWpVAWQeD490HJWB+f2Iut3gHL/V5aVUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNt5/pyZii8bRPzPhrygkIBpRh+TA+qvJcqjI8xd8BA27hzYw/AR/wRL+rxH7Ws4v
	 EWPn5Ic6PLchrSsOyRuqYkRaddGFo344nZMo7cA+UYN4sTS7jUE+VOayec6+XHmJCp
	 pew1B/+bbF+RT/vcuAtO5IDa1kvg5wPnR6CQE1X0=
Date: Fri, 2 Jan 2026 14:51:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	syzbot+2bf29e42be0666f2df70@syzkaller.appspotmail.com,
	syzbot+37fd81fa4305a9eadfb0@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: media-request: fix race between
 media_request_alloc() and media_request_close()
Message-ID: <20260102125103.GC15048@pendragon.ideasonboard.com>
References: <20260102121410.710456-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260102121410.710456-1-dmantipov@yandex.ru>

Hi Dmitry,

Thank you for the patch.

On Fri, Jan 02, 2026 at 03:14:10PM +0300, Dmitry Antipov wrote:
> Syzbot has hit (seems twice at least) the following race condition between
> 'media_request_alloc()' and 'media_request_close()':
> 
> Thread 0:                                       Thread 1:
> ...
> media_request_alloc(...)
> ...
>   req = kzalloc(...)
>   ...
>   fd_prepare_file(fdf)->private_data = req; [1] ...
>   ...                                           media_request_close(...)
>   snprintf(req->debug_str, ...)                   media_request_put(req)
>   ...
> 
> After [1], an instance of 'struct media_request' is available for
> 'media_request_close()' via the filesystem interface, so 'snprintf()'
> in thread 0 may be issued for a free-in-progress request. Fix this
> by managing an extra reference for that request in 'media_request_alloc()'
> by using 'media_request_get()' and 'media_request_put()' in the former.

This has already been fixed by
https://lore.kernel.org/all/20251209210903.603958-1-minipli@grsecurity.net/
> 
> Reported-by: syzbot+2bf29e42be0666f2df70@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=2bf29e42be0666f2df70
> Reported-by: syzbot+37fd81fa4305a9eadfb0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=37fd81fa4305a9eadfb0
> Fixes: 10905d70d788 ("media: media-request: implement media requests")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  drivers/media/mc/mc-request.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
> index 2ac9ac0a740b..969051c1f07c 100644
> --- a/drivers/media/mc/mc-request.c
> +++ b/drivers/media/mc/mc-request.c
> @@ -282,7 +282,7 @@ EXPORT_SYMBOL_GPL(media_request_get_by_fd);
>  int media_request_alloc(struct media_device *mdev, int *alloc_fd)
>  {
>  	struct media_request *req;
> -	int ret;
> +	int ret = 0;
>  
>  	/* Either both are NULL or both are non-NULL */
>  	if (WARN_ON(!mdev->ops->req_alloc ^ !mdev->ops->req_free))
> @@ -305,12 +305,13 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
>  	req->updating_count = 0;
>  	req->access_count = 0;
>  
> +	media_request_get(req);
>  	FD_PREPARE(fdf, O_CLOEXEC,
>  		   anon_inode_getfile("request", &request_fops, NULL,
>  				      O_CLOEXEC));
>  	if (fdf.err) {
>  		ret = fdf.err;
> -		goto err_free_req;
> +		goto out;
>  	}
>  
>  	fd_prepare_file(fdf)->private_data = req;
> @@ -321,14 +322,8 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
>  		 atomic_inc_return(&mdev->request_id), *alloc_fd);
>  	dev_dbg(mdev->dev, "request: allocated %s\n", req->debug_str);
>  
> -	return 0;
> -
> -err_free_req:
> -	if (mdev->ops->req_free)
> -		mdev->ops->req_free(req);
> -	else
> -		kfree(req);
> -
> +out:
> +	media_request_put(req);
>  	return ret;
>  }
>  

-- 
Regards,

Laurent Pinchart

