Return-Path: <linux-media+bounces-28257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A71A61541
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9846C16E187
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25C4202992;
	Fri, 14 Mar 2025 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="KckZN8rI"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13841FF7DB;
	Fri, 14 Mar 2025 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741967346; cv=pass; b=EdmigiwrZEXafyxRWDJU2hWEsdUAFvcB5KJ4AK1+WMtEQ4nT6/xw9r+uk7LBSG7ZqFDmeM9kvOMpKmVapHDD2yiz0l/OTUhC05FITQZOtEkBS1qG9z6ouhb6j5GeB/HDDfR/adlcRwyyHkQeNMYXLNjRgsFco1D4ZZslrWxJ9gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741967346; c=relaxed/simple;
	bh=LsIwn96rTUyMYp6JErbWuOGB2YqH3cB1QS6IrvMwxkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2MWR3EfD9L8+85pOsha/tu9cBMkCzFFigWwsCm5sLWwEWtdHVXZkbUEihIUS+cuokDtVV3ghNROq2QETbubYiZxEj/FTWYYH4gSHWzp5Rs/QtJJOy8DPdvq7G+Bgf7WVF3D7e2dYMBaBq6eoePhdJZdkylPCCBisDLu1SzqxPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=KckZN8rI; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4ZDpgm6DKzz49Psw;
	Fri, 14 Mar 2025 17:48:52 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1741967336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NG+3oZUdUflk/5HazmxtSJfIR3MIJ45eqIo7Q4WCdRc=;
	b=KckZN8rI27QLCSdhNDbjK2fjh3nvDmFpbhfqN+qMXHEKv3R68nFBrWT/luMdFt1F3odDXW
	WAhMLeYZ+6m0iSAvx0yTrXCM7Qw0f0sKJPLVw9oUnKUaX2u7K1gXXE0lDEesCtl5curk0g
	LqRhKhk8F3ylI8pLRPSciGHTDTK31pf4koAdo0QQVfSpiA8ncMckvn+FKr49ysHXBL9TmJ
	xF7lbjxiIcFd9E6UNzAGJuJ8FgSvTcvRZYSY420wJKCoSk0d5oybOdKVMDklTEfbTlysXY
	5IRAnzEgVIkwXMiFDuNEfqjmVlbOo0vjAe0k8Civ7Mn5RMuCdUcBsBMxqEvC1w==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1741967336; a=rsa-sha256;
	cv=none;
	b=GIMXfzmWU/WxPOaWO91d9zUYYheh78If8+NhDvamEb4ms4qFtAkclZV+zZviMH7TEJLMPu
	q3dQbNeuPbVEicEJbJlkPzqRUg1kvSjb+040aaAk7lI5qWCfXmCOcDayow88jkZmQnpHJs
	F/weRsm70GZg1RDpygTJu5Wbys9athd6jW9HnE3ZTDr9i/Zsm2dSCUb/8zzC1xYOfey7lZ
	rUKQPXW3TnKY7619kV39dr0O/ggBL+X6bsqrMcExxGiI/nLHqeTj+ipzXsU+rufiR2O/rb
	wI3sEqWifZLqKX5cfOFT4ZRs3O0gW/GNSUiQUVAynKKllCoyvFb2Cnhof7p/WA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1741967336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NG+3oZUdUflk/5HazmxtSJfIR3MIJ45eqIo7Q4WCdRc=;
	b=Jyn+2ktu5ijW2EPDYfO+0uY2gdt7oRsv2+cFFFZHEL6BO1FjHIb4xNRJmSLEg3GWqi+VTa
	NzKfAyol3S/3vnqPKiskMj89GwXa/he/Uf+2WQCgAT284739xDpG2PSXgK3mEV2SXhjilr
	QTiZLA9XDEwZOr5qZT3KzFcwtfjHoYego3cjC7zcxV1FAWdBskDtyfWew5fVgVnmTD6w5H
	X7wn1kB/tjibvAkttHyMEq8TCW+03njLCOns0/CNLyfLJNCYXe9YAVReQoDuEZHkm/4PQZ
	rTdXifQqd+DtfpKZqKmtVfImxWGriwpoRqsNRkDRzYXaSpncBNhURxm3VyRIuw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6CB3F634C93;
	Fri, 14 Mar 2025 17:48:52 +0200 (EET)
Date: Fri, 14 Mar 2025 15:48:52 +0000
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
Message-ID: <Z9RP5K59sZwuphIc@valkosipuli.retiisi.eu>
References: <20250305113802.897087-1-mathis.foerst@mt.com>
 <20250305113802.897087-2-mathis.foerst@mt.com>
 <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>
 <84aa2d87-d7f1-46c9-b28d-6f0e9a78788d@stanley.mountain>
 <Z8oQCuqKVH225lPw@valkosipuli.retiisi.eu>
 <Z8r21Z2HthBwGDSq@mt.com>
 <Z86-AFnPQ2wXKidi@valkosipuli.retiisi.eu>
 <Z9RKllMJ0Duac83Y@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9RKllMJ0Duac83Y@mt.com>

Hi Mathis,

On Fri, Mar 14, 2025 at 04:26:14PM +0100, Mathis Foerst wrote:
> On Mon, Mar 10, 2025 at 10:25:04AM +0000, Sakari Ailus wrote:
> Hi Sakari,
> 
> > Hi Mathis,
> > 
> > On Fri, Mar 07, 2025 at 02:38:29PM +0100, Mathis Foerst wrote:
> > > Hi Sakari, Hi Dan,
> > > 
> > > thanks a lot for your feedback.
> > > 
> > > On Thu, Mar 06, 2025 at 09:13:46PM +0000, Sakari Ailus wrote:
> > > > Hi Dan,
> > > > 
> > > > On Thu, Mar 06, 2025 at 10:07:20PM +0300, Dan Carpenter wrote:
> > > > > On Thu, Mar 06, 2025 at 04:33:18PM +0000, Sakari Ailus wrote:
> > > > > > Hi Mathis,
> > > > > > 
> > > > > > Thanks for the patch.
> > > > > > 
> > > > > > On Wed, Mar 05, 2025 at 12:38:02PM +0100, Mathis Foerst wrote:
> > > > > > > The imx-media-csi driver requires upstream camera drivers to implement
> > > > > > > the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
> > > > > > > implement this function are not usable on the i.MX6.
> > > > > > > 
> > > > > > > The docs for get_mbus_config [1] say:
> > > > > > > @get_mbus_config: get the media bus configuration of a remote sub-device.
> > > > > > >             The media bus configuration is usually retrieved from the
> > > > > > >             firmware interface at sub-device probe time, immediately
> > > > > > >             applied to the hardware and eventually adjusted by the
> > > > > > >             driver.
> > > > > > > 
> > > > > > > Currently, the imx-media-csi driver is not incorporating the information
> > > > > > > from the firmware interface and therefore relies on the implementation of
> > > > > > > get_mbus_config by the camera driver.
> > > > > > > 
> > > > > > > To be compatible with camera drivers not implementing get_mbus_config
> > > > > > > (which is the usual case), use the bus information from the fw interface:
> > > > > > > 
> > > > > > > The camera does not necessarily has a direct media bus link to the CSI as
> > > > > > > the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
> > > > > > > between them on the media pipeline.
> > > > > > > The CSI driver already implements the functionality to find the connected
> > > > > > > camera sub-device to call get_mbus_config on it.
> > > > > > > 
> > > > > > > At this point the driver is modified as follows:
> > > > > > > In the case that get_mbus_config is not implemented by the upstream
> > > > > > > camera, try to get its endpoint configuration from the firmware interface
> > > > > > > usign v4l2_fwnode_endpoint_parse.
> > > > > > > For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
> > > > > > > V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
> > > > > > > configuration.
> > > > > > > For all other mbus_types, return an error.
> > > > > > > 
> > > > > > > Note that parsing the mbus_config from the fw interface is not done during
> > > > > > > probing because the camera that's connected to the CSI can change based on
> > > > > > > the selected input of the video-mux at runtime.
> > > > > > > 
> > > > > > > [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
> > > > > > > [1] include/media/v4l2-subdev.h - line 814
> > > > > > > 
> > > > > > > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > > > > > > ---
> > > > > > >  drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
> > > > > > >  1 file changed, 32 insertions(+), 4 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > > > > > > index 3edbc57be2ca..394a9321a10b 100644
> > > > > > > --- a/drivers/staging/media/imx/imx-media-csi.c
> > > > > > > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > > > > > > @@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > > > > > >  {
> > > > > > >  	struct v4l2_subdev *sd, *remote_sd;
> > > > > > >  	struct media_pad *remote_pad;
> > > > > > > +	struct fwnode_handle *ep_node;
> > > > > > > +	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
> > > > > > 
> > > > > > Are there any defaults in DT bindings (other than 0's)? Also initialising a
> > > > > > field to zero this way is redundant, just use {}.
> > > > > > 
> > > > > 
> > > > > I was going to respond in much the same way.  This is equivalen to:
> > > > > 
> > > > > struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_UNKNOWN };
> > > > 
> > > > Thinking about this in a context of parsing the endpoint, in fact the
> > > > bus_type should be specified. Presumably the hardware is D-PHY, so the
> > > > correct value would be V4L2_MBUS_CSI2_DPHY. This way
> > > > v4l2_fwnode_endpoint_parse() doesn't need to guess.
> > > 
> > > I think we must use "bus_type = V4L2_MBUS_UNKNOWN" here:
> > > 
> > > The i.MX6 has two types of camera interfaces: Parallel and MIPI CSI-2.
> > > They are connected either directly or via a video-mux to the CSIs
> > > (See IMX6DQRM.pdf - Figure 9-3 for the connection diagram)
> > > 
> > > Pre-defining V4L2_MBUS_CSI2_DPHY here would let
> > > v4l2_fwnode_endpoint_parse() fail if the camera uses the parallel bus.
> > > 
> > > We could distinguish between MIPI CSI-2 and Parallel input by checking
> > > the grp_id of the upstream device like it's already done in
> > > csi_get_upstream_mbus_config().
> > > But for the Parallel case we still can't know if we should set bus_type
> > > to V4L2_MBUS_PARALLEL or to V4L2_MBUS_BT656 - the i.MX6 supports both
> > > formats on the parallel interface.
> > > 
> > > That's why I would argue that v4l2_fwnode_endpoint_parse() must figure
> > > out the bus_type from the fw node.
> > 
> > Right, nowadays you can indeed do this -- it wasn't a long ago when you
> > couldn't. I presume the bindings do specify the bus-type property is
> > mandatory? Where are the bindings btw.?
> > 
> 
> From my understanding, it's not even required to set the bus-type as 
> v4l2_fwnode_endpoint_parse() will try to parse the endpoint first as a
> CSI-2 bus and in case of failure as a Parallel bus if the bus-type is
> unknown (see drivers/media/v4l2-core/v4l2-fwnode.c#L493).

It only exists for compatibility with old drivers. Do not add new users for
this code.

> 
> About the bindings:
> 
> There are bindings for the MIPI CSI-2 receiver:
> Documentation/devicetree/bindings/media/imx.txt
> I think here it's not necessary to make the bus-type property mandatory
> as the imx6-mipi-csi2 driver enforces V4L2_MBUS_CSI2_DPHY anyhow
> (see drivers/staging/media/imx/imx6-mipi-csi2.c#L677).

That seems to document a CSI-2 to parallel bridge, with support for four
virtual channels. I'd suppose you parse the ports knowing which interface
they use.

> 
> For the case of a camera with parallel bus, the camera endpoint is
> connected to a video-mux and not directly to the CSI. Therefore, we cannot
> make the bus-type property mandatory on this endpoint as it this wouldn't
> apply to other use-cases of video-mux.
> 
> > > 
> > > > 
> > > > > 
> > > > > > >  	int ret;
> > > > > > >  
> > > > > > >  	if (!priv->src_sd)
> > > > > > > @@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > > > > > >  
> > > > > > >  	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
> > > > > > >  			       remote_pad->index, mbus_cfg);
> > > > > > > -	if (ret == -ENOIOCTLCMD)
> > > > > > > -		v4l2_err(&priv->sd,
> > > > > > > -			 "entity %s does not implement get_mbus_config()\n",
> > > > > > > -			 remote_pad->entity->name);
> > > > > > > +	if (ret == -ENOIOCTLCMD) {
> > > > > > 
> > > > > > 	if (!ret)
> > > > > > 		return 0;
> > > > > > 
> > > > > > And you can unindent the rest.
> > > > > 
> > > > > I was going to say this too but then I thought actually this needs to
> > > > > be:
> > > > > 
> > > > > 	if (ret != -ENOIOCTLCMD)
> > > > > 		return ret;
> > > > > 
> > > > > Which is weird.  Better to break all the new code into a separate
> > > > > helper function.
> > > > > 
> > > > > 	if (ret == -ENOIOCTLCMD)
> > > > > 		ret = parse_fw_link_config_stuff();
> > > > > 
> > > > > 	return ret;
> > > 
> > > Good point. I factored out a helper function as suggested.
> > > 
> > > > 
> > > > Indeed. get_mbus_config() presumably wouldn't return an error but
> > > > correctness is usually a good idea.
> > > > 
> > 

-- 
Regards,

Sakari Ailus

