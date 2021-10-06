Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24CAA42486D
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 23:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239530AbhJFVDp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 17:03:45 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54988 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhJFVDo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 17:03:44 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 196L1ih1006161;
        Wed, 6 Oct 2021 16:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1633554104;
        bh=/JmJo+ErGdIoXouvVDXIbJXXugSqnxWgX9g+2MsqHWg=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=iA7Xflg/rRiOEg/WxnHChL/Dm7tuf5nwhz8EmjNjw7FBAczUubmW1VYEc0MMlN0KL
         8Ej6VFzK0+HYWfeHNI8uLo1oq70e0xo18O8TP8UZofA0X9jvqx0X5vxNh8ZNgeXSge
         1veZWO7xkvqr6ciwtPxQpZsvvDYALQxwLVAM6kg0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 196L1iBO127796
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Oct 2021 16:01:44 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 6
 Oct 2021 16:01:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 6 Oct 2021 16:01:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 196L1hAL070019;
        Wed, 6 Oct 2021 16:01:44 -0500
Date:   Thu, 7 Oct 2021 02:31:43 +0530
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 08/11] media: ti: Add CSI2RX support for J721E
Message-ID: <20211006210141.3mi2popzfsalskm3@ti.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-9-p.yadav@ti.com>
 <YV4G6kjCLREpbam2@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YV4G6kjCLREpbam2@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/10/21 11:28PM, Sakari Ailus wrote:
> Hi Pratyush,
> 
> On Wed, Sep 15, 2021 at 05:32:37PM +0530, Pratyush Yadav wrote:
> ...
> > +/*
> > + * Find the input format. This is done by finding the first device in the
> > + * pipeline which can tell us the current format. This could be the sensor, or
> > + * this could be another device in the middle which is capable of format
> > + * conversions.
> > + */
> > +static int ti_csi2rx_validate_pipeline(struct ti_csi2rx_dev *csi)
> > +{
> > +	struct media_pipeline *pipe = &csi->pipe;
> > +	struct media_entity *entity;
> > +	struct v4l2_subdev *sd;
> > +	struct v4l2_subdev_format fmt;
> > +	struct v4l2_pix_format *pix = &csi->v_fmt.fmt.pix;
> > +	struct media_device *mdev = &csi->mdev;
> > +	const struct ti_csi2rx_fmt *ti_fmt;
> > +	int ret;
> > +
> > +	mutex_lock(&mdev->graph_mutex);
> > +	ret = media_graph_walk_init(&pipe->graph, mdev);
> > +	if (ret) {
> > +		mutex_unlock(&mdev->graph_mutex);
> > +		return ret;
> > +	}
> > +
> > +	media_graph_walk_start(&pipe->graph, &csi->vdev.entity);
> > +
> > +	while ((entity = media_graph_walk_next(&pipe->graph))) {
> > +		if (!is_media_entity_v4l2_subdev(entity))
> > +			continue;
> 
> You shouldn't rely on media_graph_walk_next() to return entities in a
> particular order.

Ah, right. Need to drop this.

> 
> I'd suggest approach taken in isp_video_check_external_subdevs() (in
> drivers/media/platform/omap3isp/ispvideo.c).
> 
> > +
> > +		sd = media_entity_to_v4l2_subdev(entity);
> > +
> > +		fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> > +		fmt.pad = media_get_pad_index(entity, 0, PAD_SIGNAL_DEFAULT);
> > +
> > +		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
> > +		if (ret && ret != -ENOIOCTLCMD) {
> > +			media_graph_walk_cleanup(&pipe->graph);
> > +			mutex_unlock(&mdev->graph_mutex);
> > +			return ret;
> > +		}
> > +
> > +		if (!ret)
> > +			break;
> > +	}
> > +
> > +	media_graph_walk_cleanup(&pipe->graph);
> > +	mutex_unlock(&mdev->graph_mutex);
> > +
> > +	/* Could not find input format. */
> > +	if (!entity)
> > +		return -EPIPE;
> > +
> > +	if (fmt.format.width != pix->width)
> > +		return -EPIPE;
> > +	if (fmt.format.height != pix->height)
> > +		return -EPIPE;
> 
> Pipeline validation should take place during media_pipeline_start(). Why
> are you doing it here?

How would be do that? Via the link_validate callback?

> 
> > +
> > +	ti_fmt = find_format_by_pix(pix->pixelformat);
> > +	if (WARN_ON(!ti_fmt))
> > +		return -EINVAL;
> > +
> > +	if (fmt.format.code == MEDIA_BUS_FMT_YUYV8_2X8 ||
> > +	    fmt.format.code == MEDIA_BUS_FMT_VYUY8_2X8 ||
> > +	    fmt.format.code == MEDIA_BUS_FMT_YVYU8_2X8) {
> > +		dev_err(csi->dev,
> > +			"Only UYVY input allowed for YUV422 8-bit. Output format can be configured.\n");
> > +		return -EPIPE;
> > +	}
> > +
> > +	if (fmt.format.code == MEDIA_BUS_FMT_UYVY8_2X8) {
> > +		/* Format conversion between YUV422 formats can be done. */
> > +		if (ti_fmt->code != MEDIA_BUS_FMT_UYVY8_2X8 &&
> > +		    ti_fmt->code != MEDIA_BUS_FMT_YUYV8_2X8 &&
> > +		    ti_fmt->code != MEDIA_BUS_FMT_VYUY8_2X8 &&
> > +		    ti_fmt->code != MEDIA_BUS_FMT_YVYU8_2X8)
> > +			return -EPIPE;
> > +	} else if (fmt.format.code != ti_fmt->code) {
> > +		return -EPIPE;
> > +	}
> > +
> > +	if (fmt.format.field != V4L2_FIELD_NONE &&
> > +	    fmt.format.field != V4L2_FIELD_ANY)
> > +		return -EPIPE;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
> > +{
> > +	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vq);
> > +	struct ti_csi2rx_dma *dma = &csi->dma;
> > +	struct ti_csi2rx_buffer *buf, *tmp;
> > +	unsigned long flags = 0;
> 
> No need to assign flags here.

Ok.

> 
> > +	int ret = 0;
> > +
> 
> -- 
> Kind regards,
> 
> Sakari Ailus

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
