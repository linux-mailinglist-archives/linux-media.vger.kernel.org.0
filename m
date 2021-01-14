Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7E92F625F
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 14:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728944AbhANNtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 08:49:01 -0500
Received: from mga05.intel.com ([192.55.52.43]:34534 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726891AbhANNtB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 08:49:01 -0500
IronPort-SDR: KtXNRvYAbMM3+UoNx1/djUKxC+r1K2fIOF3MqrJ7s5PU/9wPO2//NcEVDk+Dj4GvpyGkowDNOG
 MMNqgim48xcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="263155846"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="263155846"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 05:47:13 -0800
IronPort-SDR: 2IQrMvXx55dMYaojIWoAokbdWmYREuJZz/RoTjthZXZT1ZWXhQXhVWFnkG7IOJe9vL8xc18pRK
 qd8u6pei/UCA==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="345900964"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 05:47:11 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4514820356; Thu, 14 Jan 2021 15:47:09 +0200 (EET)
Date:   Thu, 14 Jan 2021 15:47:09 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com
Subject: Re: [PATCH 01/13] media: v4l2-async: Clean
 v4l2_async_notifier_add_fwnode_remote_subdev semantics
Message-ID: <20210114134709.GL11878@paasikivi.fi.intel.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
 <20210112132339.5621-2-ezequiel@collabora.com>
 <X/+lbrp7bLuAjl8e@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/+lbrp7bLuAjl8e@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Ezequiel,

On Thu, Jan 14, 2021 at 03:59:10AM +0200, Laurent Pinchart wrote:
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index 68da1eed753d..235dcf0c4122 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -252,6 +252,7 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> >  			.bus_type = V4L2_MBUS_CSI2_DPHY
> >  		};
> >  		struct rkisp1_sensor_async *rk_asd = NULL;
> > +		struct v4l2_async_subdev *asd;
> >  		struct fwnode_handle *ep;
> >  
> >  		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
> > @@ -264,21 +265,16 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> >  		if (ret)
> >  			goto err_parse;
> >  
> > -		rk_asd = kzalloc(sizeof(*rk_asd), GFP_KERNEL);
> > -		if (!rk_asd) {
> > -			ret = -ENOMEM;
> > +		asd = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
> > +							sizeof(*rk_asd));
> > +		if (IS_ERR(asd))

The problem with registering the sub-device already here is that the driver
can proceed to use the information in the async sub-device object which is
initialised below.

There might not be practical problems but there's also no guarantee it
would work. The same problem is actually present in the rest of the
functions registering the object after allocating it.

> >  			goto err_parse;
> > -		}
> >  
> > +		rk_asd = container_of(asd, struct rkisp1_sensor_async, asd);
> 
> It could be nice to turn v4l2_async_notifier_add_fwnode_remote_subdev()
> into a macro that would take the asd structure type, and cast the
> result, to avoid container_of() in the caller. That can be done on top
> of this series.
> 
> >  		rk_asd->mbus_type = vep.bus_type;
> >  		rk_asd->mbus_flags = vep.bus.mipi_csi2.flags;
> >  		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
> >  
> > -		ret = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
> > -								   &rk_asd->asd);
> > -		if (ret)
> > -			goto err_parse;
> > -
> >  		dev_dbg(rkisp1->dev, "registered ep id %d with %d lanes\n",
> >  			vep.base.id, rk_asd->lanes);
> >  

-- 
Kind regards,

Sakari Ailus
