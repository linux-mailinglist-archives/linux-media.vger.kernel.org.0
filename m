Return-Path: <linux-media+bounces-4824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4134684CCCF
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 15:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6488A1C249BB
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 14:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACC37E580;
	Wed,  7 Feb 2024 14:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M62Mrf0H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BB67764E
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 14:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707316431; cv=none; b=Ak1/hup8nVsg6F/xaMPD1U9LAwDJQyxO3JyoLqGcSKSEpzpVDG9CvVa5hBjDS5sJIna9Qb9OQNCW3htqqR3g9g4BSKK7rW5Ln2t/WzLC+Chr5uCNzWZVZx2JEtV7ezAooHz19DDXAszXJyNmfeLsGwtOYoU1IYAac8nhgoC7rNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707316431; c=relaxed/simple;
	bh=GAKFbL7RiMDvfG9DwzBWl1oVfg3VfHs2H5lEz5l+kI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOYpuldb2xNqwyHiH9lmRi+on0tlRTXN63b7ngWi2sh9qnsnDNJV6XTNI7kQhqCZ0NBg/903yGVsnCK2bThFQp62LHsZQgaIsquYLFOIPxnG31cM7LbcYt0YGlWBqK4FsYhCYKaXYHPCzMNxk+EtNEeL0vy3CTxFGcsYnaINtN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M62Mrf0H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 177C1975;
	Wed,  7 Feb 2024 15:32:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707316344;
	bh=GAKFbL7RiMDvfG9DwzBWl1oVfg3VfHs2H5lEz5l+kI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M62Mrf0HUlYOrVmz58VfSKf2RvA5NNqeBqjAZfyFHpq2Oq0P7xotby2rOwck83hs7
	 2AVKWF1eICEnC+5oCnBvjfyWQs3h46jW04mvl7ND+UY4jHh398Cggvk07wdaIgJqBP
	 /mS4R3nGj4rQzJiAPi/TQ5kZ36GOgITioozDapOE=
Date: Wed, 7 Feb 2024 16:33:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 22/29] media: ipu3-cio2: Release the cio2 device
 context by media device callback
Message-ID: <20240207143350.GJ2827@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-23-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-23-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:37:06PM +0200, Sakari Ailus wrote:
> Use the media device release callback to release the cio2 device's data
> structure. This approach has the benefit of not releasing memory which may
> still be accessed through open file handles whilst the ipu3-cio2 driver is
> being unbound.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 58 ++++++++++++++++--------
>  1 file changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 3222ec5b8345..bff66e6d3b1e 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -238,9 +238,15 @@ static int cio2_fbpt_init(struct cio2_device *cio2, struct cio2_queue *q)
>  	return 0;
>  }
>  
> -static void cio2_fbpt_exit(struct cio2_queue *q, struct device *dev)
> +static int cio2_fbpt_exit(struct cio2_queue *q, struct device *dev)
>  {
> +	if (!q->fbpt)
> +		return -ENOENT;
> +
>  	dma_free_coherent(dev, CIO2_FBPT_SIZE, q->fbpt, q->fbpt_bus_addr);
> +	q->fbpt = NULL;
> +
> +	return 0;
>  }
>  
>  /**************** CSI2 hardware setup ****************/
> @@ -1643,13 +1649,13 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
>  
>  static void cio2_queue_exit(struct cio2_device *cio2, struct cio2_queue *q)
>  {
> -	vb2_video_unregister_device(&q->vdev);
>  	media_entity_cleanup(&q->vdev.entity);
>  	v4l2_device_unregister_subdev(&q->subdev);

Is the release callback the right time for this ?

>  	media_entity_cleanup(&q->subdev.entity);
> -	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
> -	mutex_destroy(&q->subdev_lock);
> -	mutex_destroy(&q->lock);
> +	if (!cio2_fbpt_exit(q, &cio2->pci_dev->dev)) {

This doesn't look very nice, but I suppose there are many other things
to clean up in this driver, so I'll close my eyes.

> +		mutex_destroy(&q->subdev_lock);
> +		mutex_destroy(&q->lock);
> +	}
>  }
>  
>  static int cio2_queues_init(struct cio2_device *cio2)
> @@ -1695,6 +1701,23 @@ static int cio2_check_fwnode_graph(struct fwnode_handle *fwnode)
>  	return cio2_check_fwnode_graph(fwnode->secondary);
>  }
>  
> +static void cio2_media_release(struct media_device *mdev)
> +{
> +	struct cio2_device *cio2 =
> +		container_of(mdev, struct cio2_device, media_dev);
> +
> +	v4l2_async_nf_cleanup(&cio2->notifier);
> +	cio2_queues_exit(cio2);
> +	cio2_fbpt_exit_dummy(cio2);
> +	mutex_destroy(&cio2->lock);
> +
> +	kfree(cio2);
> +}
> +
> +static const struct media_device_ops cio2_mdev_ops = {
> +	.release = cio2_media_release,
> +};
> +
>  /**************** PCI interface ****************/
>  
>  static int cio2_pci_probe(struct pci_dev *pci_dev,
> @@ -1722,7 +1745,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  			return r;
>  	}
>  
> -	cio2 = devm_kzalloc(dev, sizeof(*cio2), GFP_KERNEL);
> +	cio2 = kzalloc(sizeof(*cio2), GFP_KERNEL);
>  	if (!cio2)
>  		return -ENOMEM;
>  	cio2->pci_dev = pci_dev;
> @@ -1767,6 +1790,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  	mutex_init(&cio2->lock);
>  
>  	cio2->media_dev.dev = dev;
> +	cio2->media_dev.ops = &cio2_mdev_ops;
>  	strscpy(cio2->media_dev.model, CIO2_DEVICE_NAME,
>  		sizeof(cio2->media_dev.model));
>  	cio2->media_dev.hw_revision = 0;
> @@ -1774,7 +1798,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  	media_device_init(&cio2->media_dev);
>  	r = media_device_register(&cio2->media_dev);
>  	if (r < 0)
> -		goto fail_mutex_destroy;
> +		goto fail_media_device_put;
>  
>  	cio2->v4l2_dev.mdev = &cio2->media_dev;
>  	r = v4l2_device_register(dev, &cio2->v4l2_dev);
> @@ -1808,35 +1832,33 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  
>  fail_clean_notifier:
>  	v4l2_async_nf_unregister(&cio2->notifier);
> -	v4l2_async_nf_cleanup(&cio2->notifier);
> -	cio2_queues_exit(cio2);
> +
>  fail_v4l2_device_unregister:
>  	v4l2_device_unregister(&cio2->v4l2_dev);
> +
>  fail_media_device_unregister:
>  	media_device_unregister(&cio2->media_dev);
> -	media_device_cleanup(&cio2->media_dev);
> -fail_mutex_destroy:
> -	mutex_destroy(&cio2->lock);
> -	cio2_fbpt_exit_dummy(cio2);
>  
> +fail_media_device_put:
> +	media_device_put(&cio2->media_dev);
>  	return r;
>  }
>  
>  static void cio2_pci_remove(struct pci_dev *pci_dev)
>  {
>  	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
> +	unsigned int i;
>  
>  	media_device_unregister(&cio2->media_dev);
> +	for (i = 0; i < CIO2_QUEUES; i++)
> +		vb2_video_unregister_device(&cio2->queue[i].vdev);
>  	v4l2_device_unregister(&cio2->v4l2_dev);
>  	v4l2_async_nf_unregister(&cio2->notifier);
> -	v4l2_async_nf_cleanup(&cio2->notifier);
> -	cio2_queues_exit(cio2);
> -	cio2_fbpt_exit_dummy(cio2);
> -	media_device_cleanup(&cio2->media_dev);
> -	mutex_destroy(&cio2->lock);
>  
>  	pm_runtime_forbid(&pci_dev->dev);
>  	pm_runtime_get_noresume(&pci_dev->dev);
> +
> +	media_device_put(&cio2->media_dev);
>  }
>  
>  static int __maybe_unused cio2_runtime_suspend(struct device *dev)

-- 
Regards,

Laurent Pinchart

