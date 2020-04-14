Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A9A1A8F15
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731251AbgDNX1S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731159AbgDNX1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:27:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B72C061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 16:27:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 493E8521;
        Wed, 15 Apr 2020 01:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586906835;
        bh=RUK8H6TwblhT6ZfW+3CrZUglv97W+2hyNmRX8k6rHYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oQ7Flk8zFUuCingQcjwlf6z+jeVg6J1nq+9TpaLRjfE/4fDvW9iEddSFniYuouTQn
         KY4n41P2rf++rfFiCdxVySV9jIJflUuAmIZXXUEuq1HSGhNqBsHx44aq3qB0ELZM5b
         4ul4RAR8PkkGI+2M8yBhfn/G9Ppiqz+Iy+65Bpo8=
Date:   Wed, 15 Apr 2020 02:27:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 06/17] media: imx: mipi csi-2: Implement
 get_fwnode_pad op
Message-ID: <20200414232703.GC28533@pendragon.ideasonboard.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-7-slongerbeam@gmail.com>
 <20200414230729.GC27621@pendragon.ideasonboard.com>
 <20200414232036.GB27762@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200414232036.GB27762@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Apr 15, 2020 at 02:20:36AM +0300, Sakari Ailus wrote:
> On Wed, Apr 15, 2020 at 02:07:29AM +0300, Laurent Pinchart wrote:
> > On Tue, Mar 03, 2020 at 03:42:45PM -0800, Steve Longerbeam wrote:
> > > Implement get_fwnode_pad operation. If the endpoint is owned by the MIPI
> > > CSI-2 receiver, return the endpoint's port number. The MIPI CSI-2 receiver
> > > maps port numbers and pad indexes 1:1.
> > > 
> > > Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> > > ---
> > >  drivers/staging/media/imx/imx6-mipi-csi2.c | 28 ++++++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > > 
> > > diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> > > index fdd763587e6c..8500207e5ea9 100644
> > > --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> > > +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> > > @@ -507,9 +507,37 @@ static int csi2_registered(struct v4l2_subdev *sd)
> > >  				      640, 480, 0, V4L2_FIELD_NONE, NULL);
> > >  }
> > >  
> > > +static int csi2_get_fwnode_pad(struct media_entity *entity,
> > > +			       struct fwnode_endpoint *endpoint)
> > > +{
> > > +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> > > +	struct csi2_dev *csi2 = sd_to_dev(sd);
> > > +	struct fwnode_handle *csi2_ep;
> > > +
> > > +	/*
> > > +	 * If the endpoint is one of ours, return the endpoint's port
> > > +	 * number. This device maps port numbers and pad indexes 1:1.
> > > +	 */
> > > +	fwnode_graph_for_each_endpoint(dev_fwnode(csi2->dev), csi2_ep) {
> > > +		if (endpoint->local_fwnode == csi2_ep) {
> > > +			struct fwnode_endpoint fwep;
> > > +			int ret;
> > > +
> > > +			ret = fwnode_graph_parse_endpoint(csi2_ep, &fwep);
> > > +
> > > +			fwnode_handle_put(csi2_ep);
> > > +
> > > +			return ret ? ret : fwep.port;
> > > +		}
> > > +	}
> > > +
> > > +	return -ENXIO;
> > > +}
> > 
> > As the 1:1 mapping is the common case, would it make sense to modify
> > media_entity_get_fwnode_pad() accordingly when .get_fwnode_pad is not
> > set ? The current behaviour is to return the first pad that matches the
> 
> I also think this would make sense.
> 
> > requested direction, which could be preserved as a second-level fallback
> > if the 1:1 mapping doesn't give the right direction (but I'm not sure
> > there's a use case for that, the 1:1 mapping seems to be all we need if
> > there's no specific .get_fwnode_pad implementation).
> 
> I believe at least the smiapp driver breaks if you do that, so the current
> behaviour should be retained (secondary to the 1:1 mapping).

Shouldn't the smiapp driver get a .get_fwnode_pad() implementation then
? It could be argued that the smiapp use case is also quite common, and
would deserve handling in the core, as a second fallback. It makes me
wonder if we should really try to have a core fallback in the first
place then, we could instead create helpers for the common cases that
would be used by drivers as their .get_fwnode_pad() implementation,
forcing each driver to think about which version matches its needs best.

-- 
Regards,

Laurent Pinchart
