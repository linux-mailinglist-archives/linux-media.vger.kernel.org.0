Return-Path: <linux-media+bounces-4801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C3984C900
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 11:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5434E1C252BF
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 10:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865FB171B4;
	Wed,  7 Feb 2024 10:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bt3CZUnz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA6517BB5
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707303202; cv=none; b=Ua8nGdutARuPSZa5d1yZ+AEspoEFjbjSUR4K1SZoCm3CeJO7S0Bn9cqp08aNIYWptP8eKjbhzsiMpwcW/5LZjgEhKLw62uccSK/do2DIkOjaV9/OeUfSGu7dXnEvpzL/CEFD9O6eHbCglhkZ8d1dp4lK1MjaiKlGKw0twL/46rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707303202; c=relaxed/simple;
	bh=xO4exJIUs9BTxSU+IEvZpxCRxlCYlkoQsAumn64XIxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moaOv//WlVpbVl4W3TgmWkYtHvpTz+LjX+Ok+cikkAH51qJARSVT5CP/OSMXeAJ4W4+wSHaeddg0P31uotjyibJrxQdZSKbfiymNlrnfM5GGnkLS2A6qXr95gz4sg/WdUO2vM4jlpz8c9fx/8MFXSobQFFj2umfgAZ+Z644lCcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bt3CZUnz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD0F2975;
	Wed,  7 Feb 2024 11:51:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707303114;
	bh=xO4exJIUs9BTxSU+IEvZpxCRxlCYlkoQsAumn64XIxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bt3CZUnzXHC6B1KRNVtV3Iz0xW/PCDKUY1CV+qB5H+sEsPJUL9lF3YCnKjcooR/Bz
	 IHdINqnYxD03xjRRdHbxJF0XqTzaZXoQZROTVx/gp7/sTdWBBjSaC6/VS4Oj6BovZG
	 +wvk/XYFbzGxmmvg9zlFQZcEeH7SumV5C/EpAQrM=
Date: Wed, 7 Feb 2024 12:53:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 14/29] media: mc: Refactor media devnode minor clearing
Message-ID: <20240207105320.GK23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-15-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-15-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:36:58PM +0200, Sakari Ailus wrote:
> Refactor clearing media devnode minor bit in media devnode bitmap. Note
> that number is used instead of struct media_devnode as argument since the
> minor number will also be stored in a different structure soon.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart

