Return-Path: <linux-media+bounces-47347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FF0C6CC83
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 06:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 4D4522C5AD
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 05:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5A0270542;
	Wed, 19 Nov 2025 05:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fUFcaMcA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD51C220698;
	Wed, 19 Nov 2025 05:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763528597; cv=none; b=K3MZ+Fm2eW6pa+NOD619dAM5lSjVxaQ7MTb9G72tJ2lwqzLVfQwTIySfyOKkoWIs8aqn1muHUB6rRaqxGTeLiFBstwPvG0R1YDvaifjxJBHNyPy+tVaWFHji5yVPezY+eki6jpKFrjgsh2tEYlk8Xh5meI5MFnCkZN0OgIuFpRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763528597; c=relaxed/simple;
	bh=6f04bYijyMFsZjVjgltBRwZEr1RHbFar8/wn5NeBitM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+fKi4M9I1U/QV+gSal2J38EfRSSqVCsPqtD1YJXS7p1q6RRvXWysRoby31aOZAB1R4o6o0cG/sfdxzILOyE7uJAP/SRqL2PH6WoCphsxTh0OGSh1u8o0YuAO9CQl80Q9n4KQzW15vPnOU4T/M4yH9w9O06EOH25bCuDpV+15v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fUFcaMcA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 53739195E;
	Wed, 19 Nov 2025 06:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763528468;
	bh=6f04bYijyMFsZjVjgltBRwZEr1RHbFar8/wn5NeBitM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUFcaMcA4k5pMNwr3yRgoRddLq9BLebhEBuD47UPiZg1bPfq9Hb69MKVNFtE+5/be
	 v5nT1KiTI04S8GGb9elvBgOOgb5AyShKEstDfnB+0f5AtvlsG0wLpvaw7LGP7iKnlA
	 oTyQ5jAKw/+U4TnzntuqvjuC2l5qxsB1LwfuYigw=
Date: Wed, 19 Nov 2025 14:02:39 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: nxp: use cleanup __free(fwnode_handle)
 simplify code
Message-ID: <20251119050239.GA16725@pendragon.ideasonboard.com>
References: <20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com>
 <20251117-cam_cleanup-v1-4-6cd42872db79@nxp.com>
 <20251119042505.GO10711@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119042505.GO10711@pendragon.ideasonboard.com>

On Wed, Nov 19, 2025 at 01:25:29PM +0900, Laurent Pinchart wrote:
> On Mon, Nov 17, 2025 at 01:58:14PM -0500, Frank Li wrote:
> > Use cleanup __free(fwnode_handle) simplify code. Change to dev_err_probe()
> > because replace goto with return.
> > 
> > Add missed "\n" at error message.
> > 
> > No functional change.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c    | 31 +++++++++------------------
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 31 +++++++++------------------
> >  2 files changed, 20 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index ce93d868746f002c22e2f86b1e0aa84ec1a76061..d924adb406a30797b66f0094ab17e98ad44fefac 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -12,6 +12,7 @@
> >   *
> >   */
> >  
> > +#include <linux/cleanup.h>
> >  #include <linux/clk.h>
> >  #include <linux/debugfs.h>
> >  #include <linux/delay.h>
> > @@ -1349,28 +1350,25 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
> >  		.bus_type = V4L2_MBUS_CSI2_DPHY,
> >  	};
> >  	struct v4l2_async_connection *asd;
> uuu> -	struct fwnode_handle *ep;
> >  	unsigned int i;
> >  	int ret;
> >  
> >  	v4l2_async_subdev_nf_init(&csis->notifier, &csis->sd);
> >  
> > -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
> > -					     FWNODE_GRAPH_ENDPOINT_NEXT);
> > +	struct fwnode_handle *ep __free(fwnode_handle) =
> > +		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
> > +						FWNODE_GRAPH_ENDPOINT_NEXT);
> 
> Let's avoid mixing variable declarations and code, this is a style
> change that is not widely accepted (yet). You can write
> 
> 	struct fwnode_handle *ep __free(fwnode_handle) = NULL;
>  	struct v4l2_async_connection *asd;
> 	unsigned int i;
> 	int ret;
> 
>   	v4l2_async_subdev_nf_init(&csis->notifier, &csis->sd);
> 
> 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
> 					     FWNODE_GRAPH_ENDPOINT_NEXT);

Quite a coincidence, there's an ongoing mail thread on LKML about this
topic:

http://lore.kernel.org/r/CAHk-=whPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdgPWP1WA@mail.gmail.com

> >  	if (!ep)
> >  		return -ENOTCONN;
> >  
> >  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> >  	if (ret)
> > -		goto err_parse;
> > +		return ret;
> >  
> >  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> > -		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
> > -			dev_err(csis->dev,
> > -				"data lanes reordering is not supported");
> > -			ret = -EINVAL;
> > -			goto err_parse;
> > -		}
> > +		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
> > +			return dev_err_probe(csis->dev, -EINVAL,
> > +					     "data lanes reordering is not supported\n");
> 
> To switch to dev_err_probe(), we should drop the error message in the
> probe() function when mipi_csis_async_register() fails, and make sure
> every error path in this function prints a message. I'd prefer splitting
> that to a separate patch.
> 
> >  	}
> >  
> >  	csis->bus = vep.bus.mipi_csi2;
> > @@ -1381,12 +1379,8 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
> >  
> >  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
> >  					      struct v4l2_async_connection);
> > -	if (IS_ERR(asd)) {
> > -		ret = PTR_ERR(asd);
> > -		goto err_parse;
> > -	}
> > -
> > -	fwnode_handle_put(ep);
> > +	if (IS_ERR(asd))
> > +		return PTR_ERR(asd);
> >  
> >  	csis->notifier.ops = &mipi_csis_notify_ops;
> >  
> > @@ -1395,11 +1389,6 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
> >  		return ret;
> >  
> >  	return v4l2_async_register_subdev(&csis->sd);
> > -
> > -err_parse:
> > -	fwnode_handle_put(ep);
> > -
> > -	return ret;
> >  }
> >  
> >  /* -----------------------------------------------------------------------------
> > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > index 75709161fb26a61239b94430365849e022fdc14f..94882568405db55593c5c51722db2233a64d53e4 100644
> > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > @@ -6,6 +6,7 @@
> >   */
> >  
> >  #include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> >  #include <linux/clk.h>
> >  #include <linux/clk-provider.h>
> >  #include <linux/delay.h>
> > @@ -717,28 +718,25 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
> >  		.bus_type = V4L2_MBUS_CSI2_DPHY,
> >  	};
> >  	struct v4l2_async_connection *asd;
> > -	struct fwnode_handle *ep;
> >  	unsigned int i;
> >  	int ret;
> >  
> >  	v4l2_async_subdev_nf_init(&state->notifier, &state->sd);
> >  
> > -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
> > -					     FWNODE_GRAPH_ENDPOINT_NEXT);
> > +	struct fwnode_handle *ep __free(fwnode_handle) =
> > +		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
> > +						FWNODE_GRAPH_ENDPOINT_NEXT);
> 
> Same comment as above.
> 
> >  	if (!ep)
> >  		return -ENOTCONN;
> >  
> >  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> >  	if (ret)
> > -		goto err_parse;
> > +		return ret;
> >  
> >  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> > -		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
> > -			dev_err(state->dev,
> > -				"data lanes reordering is not supported");
> > -			ret = -EINVAL;
> > -			goto err_parse;
> > -		}
> > +		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
> > +			return dev_err_probe(state->dev, -EINVAL,
> > +					     "data lanes reordering is not supported\n");
> 
> And here too.
> 
> Usage of __free(fwnode_handle) looks good, it just needs to be split to
> a patch of its own.
> 
> >  	}
> >  
> >  	state->bus = vep.bus.mipi_csi2;
> > @@ -749,12 +747,8 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
> >  
> >  	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
> >  					      struct v4l2_async_connection);
> > -	if (IS_ERR(asd)) {
> > -		ret = PTR_ERR(asd);
> > -		goto err_parse;
> > -	}
> > -
> > -	fwnode_handle_put(ep);
> > +	if (IS_ERR(asd))
> > +		return PTR_ERR(asd);
> >  
> >  	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
> >  
> > @@ -763,11 +757,6 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
> >  		return ret;
> >  
> >  	return v4l2_async_register_subdev(&state->sd);
> > -
> > -err_parse:
> > -	fwnode_handle_put(ep);
> > -
> > -	return ret;
> >  }
> >  
> >  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart

