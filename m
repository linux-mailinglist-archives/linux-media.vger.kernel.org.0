Return-Path: <linux-media+bounces-27783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE875A55879
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 22:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F23823ADC29
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 21:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE7F25A338;
	Thu,  6 Mar 2025 21:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="QHKpVznW"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CE3207A03;
	Thu,  6 Mar 2025 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741295634; cv=pass; b=jWO/B3uZY+T7dvbta5KhDoWOx/rTTTti8kyxMrmqhEdlajIvdaUsD/ltJIZJQjpxMVOtpBk+F4io6lzS0dJtiXzt8OAsqHWobYuU+/ONDrXqkS4V5QwkmVxsUb8e9y5KOmnanvFs8GiYDjs9hh0BjfAHWOz8B8YGHMt6jazFpmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741295634; c=relaxed/simple;
	bh=2YeV/1mWxuLyHhkSMOigK8GBrpDYk/+Quuds0otH2Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYNV8xHnvv5q3tUSkzqwJm0PXZxaai3SjrP1gDR7si3EkTy3P4nYzloJBeLW7e7ylrYppgHMGinjln07gmU9XFTmZLz1AwgN9aOAYHUManw1WWYvGIWlqsmZsqMfQ4xjqxzPmVKwuPIlLhajKH5zs1WbqwWzL1z1R1dmcprqokc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=QHKpVznW; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Z82GN1hW5z49Q16;
	Thu,  6 Mar 2025 23:13:48 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1741295629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RyXNjuHLnx3cU+qPnE9MNm9qjAiojX2ux1nNWDZm2TY=;
	b=QHKpVznW8iOM4SSfMfAUzcBerrMwpo5ndWtah6O0FYF5U5qIavbQWW0yuVdXBWA1duZfPG
	/tPNUGI/434peavUNxEA2kX3HSOY9FIMbXWNYSAPJKQdVQ7rgoY+fQnCfgOk1SxxG1BHxc
	23NY7Y6H0hyhzO6u2omYlpkPPM/s6q9LNlrxIWndp5uz99rOSfAxRhvL92OD3YWvxGpy0U
	YJ+iPeMNPhJGbqwzzEa0omqYpudmdFN7+Jp4Lz2X86ldR8Sx94xeFlvOhcwhj0cd/io67F
	W3As/b7mzHhPVyiTFykzsK9o4FIFi5weN9IMheju33jYHCZVd+/nB9nx3wAnZg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1741295629; a=rsa-sha256;
	cv=none;
	b=odHNYxXjVxIMvfaBsNyalVkmcTcgedlDXyrhQhsDLMI56nvguJdnH9gEt1w0TSUd5UJwJ5
	cLwunozpTjPqWC33xOmxa/EE8rfzQLM4rGvYTc1+ziYvrPJT8zjsyTyAjcQIgQDBDKDQ0L
	jRAhQ39xD6luECNolcTi0pLdNZGO6cRihpAnNXEKq96nd+JY72TWHGwqDGY+1y2PKVGStZ
	o3ed7haqNQr3UlHxrQByRgXhgZlI+WQZQUJQPlQ6N8P7y7EkBGzgsu/B5PmeLS9iNA9uUE
	W98onpkBkWErJ2mECRo0vso+TTrKHKPeeyjv4vfFPSP8hlvPhtE+M210UOlhGg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1741295629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RyXNjuHLnx3cU+qPnE9MNm9qjAiojX2ux1nNWDZm2TY=;
	b=eJzhBEsC+Ytpu13kBlhPZecQyJnWw45qF0/4DHv8VDb+WsOQoiPKvwZDprykmqqd61Tk+W
	M+/yFaW2nLr3dI+hzkbXgNlIy9WkyjULc0TMPcNPEMWS1lXV2mSQ4gQ//71LERkXyEX8kg
	GhY/y6YffUbBlB9s8lCfVY3pv0nsFw92Y/OGVWeOF1vBNetpA0guOfq0liwMN9VIX80QII
	28OgfEKAcYtP8Y69c/6tJkOGvVGjnrB5Vp8xOPj1J7errMK189/gEl57RcyvZN9uuyNTdS
	5XDgw/x4K0wal3SYfTSUdf4YF8qd2ViDIDxaIeWS09XUPFBG6jdm3zJfi3yDeg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 095B1634C93;
	Thu,  6 Mar 2025 23:13:47 +0200 (EET)
Date: Thu, 6 Mar 2025 21:13:46 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mathis Foerst <mathis.foerst@mt.com>, linux-kernel@vger.kernel.org,
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
Message-ID: <Z8oQCuqKVH225lPw@valkosipuli.retiisi.eu>
References: <20250305113802.897087-1-mathis.foerst@mt.com>
 <20250305113802.897087-2-mathis.foerst@mt.com>
 <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>
 <84aa2d87-d7f1-46c9-b28d-6f0e9a78788d@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84aa2d87-d7f1-46c9-b28d-6f0e9a78788d@stanley.mountain>

Hi Dan,

On Thu, Mar 06, 2025 at 10:07:20PM +0300, Dan Carpenter wrote:
> On Thu, Mar 06, 2025 at 04:33:18PM +0000, Sakari Ailus wrote:
> > Hi Mathis,
> > 
> > Thanks for the patch.
> > 
> > On Wed, Mar 05, 2025 at 12:38:02PM +0100, Mathis Foerst wrote:
> > > The imx-media-csi driver requires upstream camera drivers to implement
> > > the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
> > > implement this function are not usable on the i.MX6.
> > > 
> > > The docs for get_mbus_config [1] say:
> > > @get_mbus_config: get the media bus configuration of a remote sub-device.
> > >             The media bus configuration is usually retrieved from the
> > >             firmware interface at sub-device probe time, immediately
> > >             applied to the hardware and eventually adjusted by the
> > >             driver.
> > > 
> > > Currently, the imx-media-csi driver is not incorporating the information
> > > from the firmware interface and therefore relies on the implementation of
> > > get_mbus_config by the camera driver.
> > > 
> > > To be compatible with camera drivers not implementing get_mbus_config
> > > (which is the usual case), use the bus information from the fw interface:
> > > 
> > > The camera does not necessarily has a direct media bus link to the CSI as
> > > the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
> > > between them on the media pipeline.
> > > The CSI driver already implements the functionality to find the connected
> > > camera sub-device to call get_mbus_config on it.
> > > 
> > > At this point the driver is modified as follows:
> > > In the case that get_mbus_config is not implemented by the upstream
> > > camera, try to get its endpoint configuration from the firmware interface
> > > usign v4l2_fwnode_endpoint_parse.
> > > For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
> > > V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
> > > configuration.
> > > For all other mbus_types, return an error.
> > > 
> > > Note that parsing the mbus_config from the fw interface is not done during
> > > probing because the camera that's connected to the CSI can change based on
> > > the selected input of the video-mux at runtime.
> > > 
> > > [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
> > > [1] include/media/v4l2-subdev.h - line 814
> > > 
> > > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > > ---
> > >  drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
> > >  1 file changed, 32 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > > index 3edbc57be2ca..394a9321a10b 100644
> > > --- a/drivers/staging/media/imx/imx-media-csi.c
> > > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > > @@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > >  {
> > >  	struct v4l2_subdev *sd, *remote_sd;
> > >  	struct media_pad *remote_pad;
> > > +	struct fwnode_handle *ep_node;
> > > +	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
> > 
> > Are there any defaults in DT bindings (other than 0's)? Also initialising a
> > field to zero this way is redundant, just use {}.
> > 
> 
> I was going to respond in much the same way.  This is equivalen to:
> 
> struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_UNKNOWN };

Thinking about this in a context of parsing the endpoint, in fact the
bus_type should be specified. Presumably the hardware is D-PHY, so the
correct value would be V4L2_MBUS_CSI2_DPHY. This way
v4l2_fwnode_endpoint_parse() doesn't need to guess.

> 
> > >  	int ret;
> > >  
> > >  	if (!priv->src_sd)
> > > @@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > >  
> > >  	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
> > >  			       remote_pad->index, mbus_cfg);
> > > -	if (ret == -ENOIOCTLCMD)
> > > -		v4l2_err(&priv->sd,
> > > -			 "entity %s does not implement get_mbus_config()\n",
> > > -			 remote_pad->entity->name);
> > > +	if (ret == -ENOIOCTLCMD) {
> > 
> > 	if (!ret)
> > 		return 0;
> > 
> > And you can unindent the rest.
> 
> I was going to say this too but then I thought actually this needs to
> be:
> 
> 	if (ret != -ENOIOCTLCMD)
> 		return ret;
> 
> Which is weird.  Better to break all the new code into a separate
> helper function.
> 
> 	if (ret == -ENOIOCTLCMD)
> 		ret = parse_fw_link_config_stuff();
> 
> 	return ret;

Indeed. get_mbus_config() presumably wouldn't return an error but
correctness is usually a good idea.

-- 
Regards,

Sakari Ailus

