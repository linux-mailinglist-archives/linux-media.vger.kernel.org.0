Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAED9424886
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 23:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239601AbhJFVLS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 17:11:18 -0400
Received: from mga05.intel.com ([192.55.52.43]:34574 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239454AbhJFVLH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 17:11:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="312311556"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="312311556"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 14:09:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="440035623"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 14:09:06 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 784B820375;
        Thu,  7 Oct 2021 00:08:33 +0300 (EEST)
Date:   Thu, 7 Oct 2021 00:08:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 08/11] media: ti: Add CSI2RX support for J721E
Message-ID: <YV4QUU1NxcgEN81V@paasikivi.fi.intel.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-9-p.yadav@ti.com>
 <YV4G6kjCLREpbam2@paasikivi.fi.intel.com>
 <20211006210141.3mi2popzfsalskm3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006210141.3mi2popzfsalskm3@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 07, 2021 at 02:31:43AM +0530, Pratyush Yadav wrote:
> On 06/10/21 11:28PM, Sakari Ailus wrote:
> > Hi Pratyush,
> > 
> > On Wed, Sep 15, 2021 at 05:32:37PM +0530, Pratyush Yadav wrote:
> > ...
> > > +/*
> > > + * Find the input format. This is done by finding the first device in the
> > > + * pipeline which can tell us the current format. This could be the sensor, or
> > > + * this could be another device in the middle which is capable of format
> > > + * conversions.
> > > + */
> > > +static int ti_csi2rx_validate_pipeline(struct ti_csi2rx_dev *csi)
> > > +{
> > > +	struct media_pipeline *pipe = &csi->pipe;
> > > +	struct media_entity *entity;
> > > +	struct v4l2_subdev *sd;
> > > +	struct v4l2_subdev_format fmt;
> > > +	struct v4l2_pix_format *pix = &csi->v_fmt.fmt.pix;
> > > +	struct media_device *mdev = &csi->mdev;
> > > +	const struct ti_csi2rx_fmt *ti_fmt;
> > > +	int ret;
> > > +
> > > +	mutex_lock(&mdev->graph_mutex);
> > > +	ret = media_graph_walk_init(&pipe->graph, mdev);
> > > +	if (ret) {
> > > +		mutex_unlock(&mdev->graph_mutex);
> > > +		return ret;
> > > +	}
> > > +
> > > +	media_graph_walk_start(&pipe->graph, &csi->vdev.entity);
> > > +
> > > +	while ((entity = media_graph_walk_next(&pipe->graph))) {
> > > +		if (!is_media_entity_v4l2_subdev(entity))
> > > +			continue;
> > 
> > You shouldn't rely on media_graph_walk_next() to return entities in a
> > particular order.
> 
> Ah, right. Need to drop this.
> 
> > 
> > I'd suggest approach taken in isp_video_check_external_subdevs() (in
> > drivers/media/platform/omap3isp/ispvideo.c).
> > 
> > > +
> > > +		sd = media_entity_to_v4l2_subdev(entity);
> > > +
> > > +		fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> > > +		fmt.pad = media_get_pad_index(entity, 0, PAD_SIGNAL_DEFAULT);
> > > +
> > > +		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
> > > +		if (ret && ret != -ENOIOCTLCMD) {
> > > +			media_graph_walk_cleanup(&pipe->graph);
> > > +			mutex_unlock(&mdev->graph_mutex);
> > > +			return ret;
> > > +		}
> > > +
> > > +		if (!ret)
> > > +			break;
> > > +	}
> > > +
> > > +	media_graph_walk_cleanup(&pipe->graph);
> > > +	mutex_unlock(&mdev->graph_mutex);
> > > +
> > > +	/* Could not find input format. */
> > > +	if (!entity)
> > > +		return -EPIPE;
> > > +
> > > +	if (fmt.format.width != pix->width)
> > > +		return -EPIPE;
> > > +	if (fmt.format.height != pix->height)
> > > +		return -EPIPE;
> > 
> > Pipeline validation should take place during media_pipeline_start(). Why
> > are you doing it here?
> 
> How would be do that? Via the link_validate callback?

Yes, please. See other drivers for examples --- such as omap3isp.

-- 
Sakari Ailus
