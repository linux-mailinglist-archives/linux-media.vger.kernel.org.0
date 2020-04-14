Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42AB1A8F0A
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392116AbgDNXUr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:20:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:10316 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392108AbgDNXUn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:20:43 -0400
IronPort-SDR: 2wDFc5KhH5rSFHQlQ6M366HVep4MJvFPks30t9AyQdHOuc1L7P98Zr8Sa0JiusiudgVrphKAUo
 5i70LDZ8MdDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 16:20:40 -0700
IronPort-SDR: hqQRXADGhsMAtuXHElFoXh/CuBaZg4X9Mu4p2H9dVUXLro43Ha2lQ+1q4p9w+LT0ulotgH4nfm
 dDdRf4eE8aTw==
X-IronPort-AV: E=Sophos;i="5.72,384,1580803200"; 
   d="scan'208";a="253344757"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 16:20:38 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8C9C720528; Wed, 15 Apr 2020 02:20:36 +0300 (EEST)
Date:   Wed, 15 Apr 2020 02:20:36 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 06/17] media: imx: mipi csi-2: Implement
 get_fwnode_pad op
Message-ID: <20200414232036.GB27762@paasikivi.fi.intel.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-7-slongerbeam@gmail.com>
 <20200414230729.GC27621@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414230729.GC27621@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Apr 15, 2020 at 02:07:29AM +0300, Laurent Pinchart wrote:
> Hi Steve,
> 
> Thank you for the patch.
> 
> On Tue, Mar 03, 2020 at 03:42:45PM -0800, Steve Longerbeam wrote:
> > Implement get_fwnode_pad operation. If the endpoint is owned by the MIPI
> > CSI-2 receiver, return the endpoint's port number. The MIPI CSI-2 receiver
> > maps port numbers and pad indexes 1:1.
> > 
> > Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> > ---
> >  drivers/staging/media/imx/imx6-mipi-csi2.c | 28 ++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> > index fdd763587e6c..8500207e5ea9 100644
> > --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> > +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> > @@ -507,9 +507,37 @@ static int csi2_registered(struct v4l2_subdev *sd)
> >  				      640, 480, 0, V4L2_FIELD_NONE, NULL);
> >  }
> >  
> > +static int csi2_get_fwnode_pad(struct media_entity *entity,
> > +			       struct fwnode_endpoint *endpoint)
> > +{
> > +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> > +	struct csi2_dev *csi2 = sd_to_dev(sd);
> > +	struct fwnode_handle *csi2_ep;
> > +
> > +	/*
> > +	 * If the endpoint is one of ours, return the endpoint's port
> > +	 * number. This device maps port numbers and pad indexes 1:1.
> > +	 */
> > +	fwnode_graph_for_each_endpoint(dev_fwnode(csi2->dev), csi2_ep) {
> > +		if (endpoint->local_fwnode == csi2_ep) {
> > +			struct fwnode_endpoint fwep;
> > +			int ret;
> > +
> > +			ret = fwnode_graph_parse_endpoint(csi2_ep, &fwep);
> > +
> > +			fwnode_handle_put(csi2_ep);
> > +
> > +			return ret ? ret : fwep.port;
> > +		}
> > +	}
> > +
> > +	return -ENXIO;
> > +}
> 
> As the 1:1 mapping is the common case, would it make sense to modify
> media_entity_get_fwnode_pad() accordingly when .get_fwnode_pad is not
> set ? The current behaviour is to return the first pad that matches the

I also think this would make sense.

> requested direction, which could be preserved as a second-level fallback
> if the 1:1 mapping doesn't give the right direction (but I'm not sure
> there's a use case for that, the 1:1 mapping seems to be all we need if
> there's no specific .get_fwnode_pad implementation).

I believe at least the smiapp driver breaks if you do that, so the current
behaviour should be retained (secondary to the 1:1 mapping).

-- 
Regards,

Sakari Ailus
