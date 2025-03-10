Return-Path: <linux-media+bounces-27935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E5EA59118
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 11:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBFA83AB57E
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 10:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6709D22686B;
	Mon, 10 Mar 2025 10:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="sZ7xHOF7"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61BD225797;
	Mon, 10 Mar 2025 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741602320; cv=pass; b=QMy4ERn02ZI2wghSj9OB7+FvcyJIb1eQ+xQtpxt54Ldd3wZ5+lY9R4LC7o8aumGXd/EjAl1ibXXzqZIP7Fwaqyb0lcSTghm2EL7NYswF2USzwORDlejl5cy2cpF2/cUYQCZfg7Dz0OeCg7Pc2CegF+RLW6iB8vyPL5DOcFFA6/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741602320; c=relaxed/simple;
	bh=hzvCCp7hE1VHF1M93UATEhcDu5LaeDH+ubaeNpDVLbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJwXVFxSFi7uxckWTxIdFyRrWXBbmex4GU4fbsB2pVZPNgRgANqDxUrtTjCCEGOYswltQTuT9fDd4KxXY79cHC2LkgcrQh41bciIH+//yDFB9X01Fgzd+blLXeOJGhXzz9i8ghxkf3JOftt0sMwA4UVLojhcRK3ZSR9puq76LdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=sZ7xHOF7; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4ZBCh125fyzyT0;
	Mon, 10 Mar 2025 12:25:05 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1741602308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rqphmd21bOkdXsuSWrt33WicDw56krWCddUo2Bhz1zE=;
	b=sZ7xHOF7Oan5NNSDXvxp1e0VKFUe4VYxlrtSJEDrnoq9d81lIHeModlB6azC8Hr2rtyxnz
	nOlMLlBDiL7ZSAOwYESC1KRHx7nwvrAClLR5z1Bo3BUeZ229b2zedzgUo4fal2HPwY29gE
	ZNv6z1uQXUDDsO49u/4yZckTm535Lxw=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1741602308; a=rsa-sha256; cv=none;
	b=ysSrW01wgE/Uwql8eegaOY1vWm5yuAyMz9ZLw/vbaO2/LlKplPRUhLfwZ9QYHhHd09XuUT
	8R6JetviriF8NqnA2NtJLKvbdoLBqIioSjRU5XPc9vKdQaZBrEhXFDEq2T3g7AKSk78SZG
	DfrlnjrLXJvHlnI+OgeQREZGZoT32KA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1741602308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rqphmd21bOkdXsuSWrt33WicDw56krWCddUo2Bhz1zE=;
	b=eWSILLlusI23VAAXDpL3Zq70o/OfyX74lU3Y9ikUD4m4iK4gJvdGH79yMXLYKYiw1l9KFq
	mefPQuHMrXFREKljV2q28I3vVW79G60GPJHYSit2hGpR/G5QMki0e+oIKsHig/2O+HzmmW
	e7rtGlwQd5O0a5qevF4uP5tSYfF4Nkk=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 942A6634C93;
	Mon, 10 Mar 2025 12:25:04 +0200 (EET)
Date: Mon, 10 Mar 2025 10:25:04 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: Re: [PATCH v1 1/1] media: imx: csi: Parse link configuration from
 fw_node
Message-ID: <Z86-AFnPQ2wXKidi@valkosipuli.retiisi.eu>
References: <20250305113802.897087-1-mathis.foerst@mt.com>
 <20250305113802.897087-2-mathis.foerst@mt.com>
 <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>
 <84aa2d87-d7f1-46c9-b28d-6f0e9a78788d@stanley.mountain>
 <Z8oQCuqKVH225lPw@valkosipuli.retiisi.eu>
 <Z8r21Z2HthBwGDSq@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8r21Z2HthBwGDSq@mt.com>

Hi Mathis,

On Fri, Mar 07, 2025 at 02:38:29PM +0100, Mathis Foerst wrote:
> Hi Sakari, Hi Dan,
> 
> thanks a lot for your feedback.
> 
> On Thu, Mar 06, 2025 at 09:13:46PM +0000, Sakari Ailus wrote:
> > Hi Dan,
> > 
> > On Thu, Mar 06, 2025 at 10:07:20PM +0300, Dan Carpenter wrote:
> > > On Thu, Mar 06, 2025 at 04:33:18PM +0000, Sakari Ailus wrote:
> > > > Hi Mathis,
> > > > 
> > > > Thanks for the patch.
> > > > 
> > > > On Wed, Mar 05, 2025 at 12:38:02PM +0100, Mathis Foerst wrote:
> > > > > The imx-media-csi driver requires upstream camera drivers to implement
> > > > > the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
> > > > > implement this function are not usable on the i.MX6.
> > > > > 
> > > > > The docs for get_mbus_config [1] say:
> > > > > @get_mbus_config: get the media bus configuration of a remote sub-device.
> > > > >             The media bus configuration is usually retrieved from the
> > > > >             firmware interface at sub-device probe time, immediately
> > > > >             applied to the hardware and eventually adjusted by the
> > > > >             driver.
> > > > > 
> > > > > Currently, the imx-media-csi driver is not incorporating the information
> > > > > from the firmware interface and therefore relies on the implementation of
> > > > > get_mbus_config by the camera driver.
> > > > > 
> > > > > To be compatible with camera drivers not implementing get_mbus_config
> > > > > (which is the usual case), use the bus information from the fw interface:
> > > > > 
> > > > > The camera does not necessarily has a direct media bus link to the CSI as
> > > > > the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
> > > > > between them on the media pipeline.
> > > > > The CSI driver already implements the functionality to find the connected
> > > > > camera sub-device to call get_mbus_config on it.
> > > > > 
> > > > > At this point the driver is modified as follows:
> > > > > In the case that get_mbus_config is not implemented by the upstream
> > > > > camera, try to get its endpoint configuration from the firmware interface
> > > > > usign v4l2_fwnode_endpoint_parse.
> > > > > For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
> > > > > V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
> > > > > configuration.
> > > > > For all other mbus_types, return an error.
> > > > > 
> > > > > Note that parsing the mbus_config from the fw interface is not done during
> > > > > probing because the camera that's connected to the CSI can change based on
> > > > > the selected input of the video-mux at runtime.
> > > > > 
> > > > > [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
> > > > > [1] include/media/v4l2-subdev.h - line 814
> > > > > 
> > > > > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > > > > ---
> > > > >  drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
> > > > >  1 file changed, 32 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > > > > index 3edbc57be2ca..394a9321a10b 100644
> > > > > --- a/drivers/staging/media/imx/imx-media-csi.c
> > > > > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > > > > @@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > > > >  {
> > > > >  	struct v4l2_subdev *sd, *remote_sd;
> > > > >  	struct media_pad *remote_pad;
> > > > > +	struct fwnode_handle *ep_node;
> > > > > +	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
> > > > 
> > > > Are there any defaults in DT bindings (other than 0's)? Also initialising a
> > > > field to zero this way is redundant, just use {}.
> > > > 
> > > 
> > > I was going to respond in much the same way.  This is equivalen to:
> > > 
> > > struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_UNKNOWN };
> > 
> > Thinking about this in a context of parsing the endpoint, in fact the
> > bus_type should be specified. Presumably the hardware is D-PHY, so the
> > correct value would be V4L2_MBUS_CSI2_DPHY. This way
> > v4l2_fwnode_endpoint_parse() doesn't need to guess.
> 
> I think we must use "bus_type = V4L2_MBUS_UNKNOWN" here:
> 
> The i.MX6 has two types of camera interfaces: Parallel and MIPI CSI-2.
> They are connected either directly or via a video-mux to the CSIs
> (See IMX6DQRM.pdf - Figure 9-3 for the connection diagram)
> 
> Pre-defining V4L2_MBUS_CSI2_DPHY here would let
> v4l2_fwnode_endpoint_parse() fail if the camera uses the parallel bus.
> 
> We could distinguish between MIPI CSI-2 and Parallel input by checking
> the grp_id of the upstream device like it's already done in
> csi_get_upstream_mbus_config().
> But for the Parallel case we still can't know if we should set bus_type
> to V4L2_MBUS_PARALLEL or to V4L2_MBUS_BT656 - the i.MX6 supports both
> formats on the parallel interface.
> 
> That's why I would argue that v4l2_fwnode_endpoint_parse() must figure
> out the bus_type from the fw node.

Right, nowadays you can indeed do this -- it wasn't a long ago when you
couldn't. I presume the bindings do specify the bus-type property is
mandatory? Where are the bindings btw.?

> 
> > 
> > > 
> > > > >  	int ret;
> > > > >  
> > > > >  	if (!priv->src_sd)
> > > > > @@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > > > >  
> > > > >  	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
> > > > >  			       remote_pad->index, mbus_cfg);
> > > > > -	if (ret == -ENOIOCTLCMD)
> > > > > -		v4l2_err(&priv->sd,
> > > > > -			 "entity %s does not implement get_mbus_config()\n",
> > > > > -			 remote_pad->entity->name);
> > > > > +	if (ret == -ENOIOCTLCMD) {
> > > > 
> > > > 	if (!ret)
> > > > 		return 0;
> > > > 
> > > > And you can unindent the rest.
> > > 
> > > I was going to say this too but then I thought actually this needs to
> > > be:
> > > 
> > > 	if (ret != -ENOIOCTLCMD)
> > > 		return ret;
> > > 
> > > Which is weird.  Better to break all the new code into a separate
> > > helper function.
> > > 
> > > 	if (ret == -ENOIOCTLCMD)
> > > 		ret = parse_fw_link_config_stuff();
> > > 
> > > 	return ret;
> 
> Good point. I factored out a helper function as suggested.
> 
> > 
> > Indeed. get_mbus_config() presumably wouldn't return an error but
> > correctness is usually a good idea.
> > 

-- 
Regards,

Sakari Ailus

