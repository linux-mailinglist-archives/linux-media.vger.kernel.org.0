Return-Path: <linux-media+bounces-2884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B047E81BC7A
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 17:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BF87287845
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 16:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD435821C;
	Thu, 21 Dec 2023 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YnmhHidt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A574755E77
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B20727C;
	Thu, 21 Dec 2023 17:56:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1703177786;
	bh=AEBE2USF1R4CELwdVMtdTjU1dSnxS5QSt2Xpwpl9B40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YnmhHidtmffPcISPoeZ0rapCjR3ykkptEMmTaLg3SL6aiw4H1gsMeHn7MXXrESR0v
	 5CXIyOVMRHurUOad5HwwtyCDNXuGG/4xa7mYmA8BgwYv0DkcOATp9QZAxo72oWN6+o
	 7m4EKsqSTkUA7nlQ6W54D18S5fqswPudRNrmR8v8=
Date: Thu, 21 Dec 2023 18:57:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/3] media: ipu3-cio2: Further clean up async subdev link
 creation
Message-ID: <20231221165723.GB10901@pendragon.ideasonboard.com>
References: <20231221135822.152448-1-sakari.ailus@linux.intel.com>
 <20231221135822.152448-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231221135822.152448-2-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Dec 21, 2023 at 03:58:20PM +0200, Sakari Ailus wrote:
> Use v4l2_create_fwnode_links_to_pad() to create links from async
> sub-devices to the CSI-2 receiver subdevs.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC

This doesn't look right, I don't think this patch could have been
meaningfully tested on a Renesas platform :-) With the line dropped,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 22 +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index ed08bf4178f0..83e29c56fe33 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -28,6 +28,7 @@
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/videobuf2-dma-sg.h>
>  
> @@ -1407,7 +1408,6 @@ static void cio2_notifier_unbind(struct v4l2_async_notifier *notifier,
>  static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
>  {
>  	struct cio2_device *cio2 = to_cio2_device(notifier);
> -	struct device *dev = &cio2->pci_dev->dev;
>  	struct sensor_async_subdev *s_asd;
>  	struct v4l2_async_connection *asd;
>  	struct cio2_queue *q;
> @@ -1417,23 +1417,10 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
>  		s_asd = to_sensor_asd(asd);
>  		q = &cio2->queue[s_asd->csi2.port];
>  
> -		ret = media_entity_get_fwnode_pad(&q->sensor->entity,
> -						  s_asd->asd.match.fwnode,
> -						  MEDIA_PAD_FL_SOURCE);
> -		if (ret < 0) {
> -			dev_err(dev, "no pad for endpoint %pfw (%d)\n",
> -				s_asd->asd.match.fwnode, ret);
> -			return ret;
> -		}
> -
> -		ret = media_create_pad_link(&q->sensor->entity, ret,
> -					    &q->subdev.entity, CIO2_PAD_SINK,
> -					    0);
> -		if (ret) {
> -			dev_err(dev, "failed to create link for %s (endpoint %pfw, error %d)\n",
> -				q->sensor->name, s_asd->asd.match.fwnode, ret);
> +		ret = v4l2_create_fwnode_links_to_pad(asd->sd,
> +						      &q->subdev_pads[CIO2_PAD_SINK], 0);
> +		if (ret)
>  			return ret;
> -		}
>  	}
>  
>  	return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
> @@ -1572,6 +1559,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
>  	v4l2_subdev_init(subdev, &cio2_subdev_ops);
>  	subdev->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
>  	subdev->owner = THIS_MODULE;
> +	subdev->dev = dev;
>  	snprintf(subdev->name, sizeof(subdev->name),
>  		 CIO2_ENTITY_NAME " %td", q - cio2->queue);
>  	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;

-- 
Regards,

Laurent Pinchart

