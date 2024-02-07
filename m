Return-Path: <linux-media+bounces-4822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAEF84CC8B
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 15:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D43BCB21502
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 14:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638FE7C0BB;
	Wed,  7 Feb 2024 14:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hXosQcOy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA2C7C090
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707315792; cv=none; b=tbsOVgzgGm6l/Z1qDrRwcEuC9l8AAS8kkosJP3H8rFe4lvwb0jlnlnPMYTZ3YTWDx6X5R3NvVMgsfYuYrL2f9W6gtD6EQWawKERqWqs8bnBPy0UnGOESSSsCY9h2xTwwbe1lBHgmImdLzWqPQIVvuWY+Wy2P5kbebAHxb16GqbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707315792; c=relaxed/simple;
	bh=Ty5pLc+evXt0cSQow/sVjn991/PkXNXt3JPGjXRSpXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIwYiaGZUuNd643Wi9jdn9sJJo9SwopEYWp1VB4MWApa0fo/jNsqo+zl2fvJUbliCHVp82B2VwrCiFwUoP2pcfIOYXpUd1r6l65JH6zIOo2pZWr9HWHKmsvCqI+StLnr2uT2AmdTBxIr05XJiPWRKb8A7QQhURBA7oouebj1dQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hXosQcOy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E14F5975;
	Wed,  7 Feb 2024 15:21:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707315706;
	bh=Ty5pLc+evXt0cSQow/sVjn991/PkXNXt3JPGjXRSpXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hXosQcOyqzfO0vtWnwd70E/NjtRdgTtHMYUvtEyIjEPc4J/gwfm6o4mmksfy5Y6ox
	 pQ7euuohwK3EHUhfvkglIEtV58I3p27Tf4RB1IUSCAtlsPVkwDs8iszXkwLYbntRVM
	 dbaW1UL0QDwuy5x3x2nmGV+5olGMgXN2vses02uY=
Date: Wed, 7 Feb 2024 16:23:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 19/29] media: omap3isp: Release the isp device struct
 by media device callback
Message-ID: <20240207142311.GQ23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-20-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-20-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:37:03PM +0200, Sakari Ailus wrote:
> Use the media device release callback to release the isp device's data
> structure. This approach has the benefit of not releasing memory which may
> still be accessed through open file handles whilst the isp driver is being
> unbound.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/platform/ti/omap3isp/isp.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> index 1cda23244c7b..ef6a781d6da1 100644
> --- a/drivers/media/platform/ti/omap3isp/isp.c
> +++ b/drivers/media/platform/ti/omap3isp/isp.c
> @@ -649,8 +649,11 @@ static irqreturn_t isp_isr(int irq, void *_isp)
>  	return IRQ_HANDLED;
>  }
>  
> +static void isp_release(struct media_device *mdev);
> +

Forward declarations are not nice :-( Any hope to reorder functions to
fix this ?

>  static const struct media_device_ops isp_media_ops = {
>  	.link_notify = v4l2_pipeline_link_notify,
> +	.release = isp_release,
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -1607,7 +1610,6 @@ static void isp_unregister_entities(struct isp_device *isp)
>  	omap3isp_stat_unregister_entities(&isp->isp_hist);
>  
>  	v4l2_device_unregister(&isp->v4l2_dev);
> -	media_device_cleanup(&isp->media_dev);
>  }
>  
>  static int isp_link_entity(
> @@ -1955,6 +1957,19 @@ static void isp_detach_iommu(struct isp_device *isp)
>  #endif
>  }
>  
> +static void isp_release(struct media_device *mdev)
> +{
> +	struct isp_device *isp =
> +		container_of(mdev, struct isp_device, media_dev);
> +
> +	isp_cleanup_modules(isp);
> +
> +	media_entity_enum_cleanup(&isp->crashed);
> +	v4l2_async_nf_cleanup(&isp->notifier);

This duplicates the call in isp_remove().

> +
> +	kfree(isp);
> +}
> +
>  static int isp_attach_iommu(struct isp_device *isp)
>  {
>  #ifdef CONFIG_ARM_DMA_USE_IOMMU
> @@ -2004,16 +2019,15 @@ static void isp_remove(struct platform_device *pdev)
>  	v4l2_async_nf_unregister(&isp->notifier);
>  	v4l2_async_nf_cleanup(&isp->notifier);
>  	isp_unregister_entities(isp);
> -	isp_cleanup_modules(isp);
> +
>  	isp_xclk_cleanup(isp);
>  
>  	__omap3isp_get(isp, false);
>  	isp_detach_iommu(isp);
>  	__omap3isp_put(isp, false);
>  
> -	media_entity_enum_cleanup(&isp->crashed);
> -
> -	kfree(isp);
> +	/* May release isp immediately */
> +	media_device_put(&isp->media_dev);
>  }
>  
>  enum isp_of_phy {

-- 
Regards,

Laurent Pinchart

