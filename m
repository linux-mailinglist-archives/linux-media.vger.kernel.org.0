Return-Path: <linux-media+bounces-17528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CB496B258
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 09:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC1261F24A55
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 07:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CBF14600D;
	Wed,  4 Sep 2024 07:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaDQiCd8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A913D6A8D2;
	Wed,  4 Sep 2024 07:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725433681; cv=none; b=dvq8EFZFJ84dCCRtN52z+WnvIQEgAXui73UulzebfClDi1w8nIm28eqhRp/FTokDyVCHCaTlnzeifvPEmOZy38TWfCwZUEa5Na9lTWa1EVE3a/29D7YfoV2Ry3qHWyKRkpn8KzYky63UrtNH/0EK/0zNxYuTjBcA+SkUHXTP6+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725433681; c=relaxed/simple;
	bh=ujkfgFcta+jaZo3W65HHpjN0mTvqdn/KfBCJvNnjwZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D00ZLpZbxtJIwBmuufqPSnXuE58oAp6wJ+TlJ4v0wL4WecnmZdSoJotw/aGFkm6hVKFwx/Y1WCcz3o/QLS1/QAf6zSq/5rUpvAyPpLhDs/7CQtjtZX7PdzllEhV4+vKIiH4YMDj9K/MCS6qNhLBJfy5Wu7VMpDVnXyOaZoEc94E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaDQiCd8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725433679; x=1756969679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ujkfgFcta+jaZo3W65HHpjN0mTvqdn/KfBCJvNnjwZ0=;
  b=HaDQiCd8dMal8qu+9TnB6eK1xho90YX4Gbh1KvCiQ47IopCBdcs2eMN4
   ocoUGj9aoMD2AViTBJ+wVkS2PO3VBssn99GpUyeD2GUH4/qWKC+WkTaO9
   9VCUBu0WjcWAveqks9yP9GYMF3uYHd0igwrzmN0w14ytsBaGPAxpLSK3I
   Ob2IqVA5Uxr24hR1i4sI6ZrBWPc2WFrGZ/BNhyHbX7eUJEGpuAn61CgBO
   nB7i9thXIHuhIZyIYdaeIlMzuvf5q6/Qy+hAvlEzDD3l8GtrGAiIdG3o8
   QJvuaBJd5wfpmxrBffWJEZdQEEQy7xX+DgkcAT89XIgHvwN5AuWANWCgL
   Q==;
X-CSE-ConnectionGUID: R+NSA22gT0iz8BMghLtbfw==
X-CSE-MsgGUID: rr4qs/tGSxauei4dFJw9Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27824600"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="27824600"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 00:07:57 -0700
X-CSE-ConnectionGUID: istFUcuDT9aLhJqRl4HKng==
X-CSE-MsgGUID: h1/a3uwrTjKQrqngGD06Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="69801822"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 00:07:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 75EF311F781;
	Wed,  4 Sep 2024 10:07:50 +0300 (EEST)
Date: Wed, 4 Sep 2024 07:07:50 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 3/4] media: raspberrypi: Add support for RP1-CFE
Message-ID: <ZtgHRrH55fKX6m_P@kekkonen.localdomain>
References: <20240815-rp1-cfe-v3-0-e15a979db327@ideasonboard.com>
 <20240815-rp1-cfe-v3-3-e15a979db327@ideasonboard.com>
 <ZtAnpqmiidMXY3o8@kekkonen.localdomain>
 <0a9f8470-606b-47e2-a622-038a2c070b5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a9f8470-606b-47e2-a622-038a2c070b5e@ideasonboard.com>

Moi,

On Mon, Sep 02, 2024 at 01:05:42PM +0300, Tomi Valkeinen wrote:
> Hi Sakari,
> 
> Thanks for the review!

You're welcome.

> > > +#define cfe_dbg(fmt, arg...) dev_dbg(&cfe->pdev->dev, fmt, ##arg)
> > 
> > cfe should be an argument to cfe_dbg().
> 
> Why? This, and the ones below, is an internal macro to make it easier and
> shorter to do prints. Adding the parameter gives no benefit that I can see.

Generally macros shouldn't expect certain variables not defined on the same
level the macros themselves. It gets harder to maintain this way.

> > > +#define node_supports_image_output(node) \
> > > +	(!!(node_desc[(node)->id].caps & V4L2_CAP_VIDEO_CAPTURE))
> > 
> > No need to cast to bool through !!. Same below.
> 
> I like my bools to be bools, not ints... But at the same time, I don't see
> how that would cause issues in the uses we have in this driver. So I'll drop
> these.

Alternatively, explicitly cast to bool. But I don't think it's needed.

> 
> > > +#define node_supports_meta_output(node) \
> > > +	(!!(node_desc[(node)->id].caps & V4L2_CAP_META_CAPTURE))
> > > +#define node_supports_image_input(node) \
> > > +	(!!(node_desc[(node)->id].caps & V4L2_CAP_VIDEO_OUTPUT))
> > > +#define node_supports_meta_input(node) \
> > > +	(!!(node_desc[(node)->id].caps & V4L2_CAP_META_OUTPUT))
> > > +#define node_supports_image(node) \
> > > +	(node_supports_image_output(node) || node_supports_image_input(node))
> > > +#define node_supports_meta(node) \
> > > +	(node_supports_meta_output(node) || node_supports_meta_input(node))
> > > +
> > > +#define is_image_output_node(node) \
> > > +	((node)->buffer_queue.type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > > +#define is_image_input_node(node) \
> > > +	((node)->buffer_queue.type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > > +#define is_image_node(node) \
> > > +	(is_image_output_node(node) || is_image_input_node(node))
> > > +#define is_meta_output_node(node) \
> > > +	((node)->buffer_queue.type == V4L2_BUF_TYPE_META_CAPTURE)
> > > +#define is_meta_input_node(node) \
> > > +	((node)->buffer_queue.type == V4L2_BUF_TYPE_META_OUTPUT)
> > > +#define is_meta_node(node) \
> > > +	(is_meta_output_node(node) || is_meta_input_node(node))
> > > +
> > > +/* To track state across all nodes. */
> > > +#define NUM_STATES		5

This might be nicer if declared as last.

> > > +#define NODE_REGISTERED		BIT(0)
> > > +#define NODE_ENABLED		BIT(1)
> > > +#define NODE_STREAMING		BIT(2)
> > > +#define FS_INT			BIT(3)
> > > +#define FE_INT			BIT(4)

...

> > > +static int cfe_start_channel(struct cfe_node *node)
> > > +{
> > > +	struct cfe_device *cfe = node->cfe;
> > > +	struct v4l2_subdev_state *state;
> > > +	struct v4l2_mbus_framefmt *source_fmt;
> > > +	const struct cfe_fmt *fmt;
> > > +	unsigned long flags;
> > > +	bool start_fe;
> > > +	int ret;
> > > +
> > > +	cfe_dbg("%s: [%s]\n", __func__, node_desc[node->id].name);
> > 
> > This looks like a development time leftover. There are quite a few such
> > prints that provide little information anyway. How about removing them all?
> 
> These are very valuable when testing, fixing or improving the driver. If I
> were to remove them, I would just have to add them back whenever I'd be
> doing something with the driver and things would not work perfectly.
> 
> The debug prints we have are all low frequency. There's a bunch printed when
> starting the streaming and when stopping it, but the debug prints are not
> used while streaming is on-going, and instead we have trace events for that.

I'm fine with debug prints when they do print useful information but you
have many of them just in the beginning of the function, printing only the
function name (and possibly the node name). I'd remove those, except in
cases where calling the function itself is useful information, such as on
returning the buffers.

> > > +static int cfe_link_node_pads(struct cfe_device *cfe)
> > > +{
> > > +	int ret;
> > > +	int pad;
> > > +
> > > +	/* Source -> CSI2 */
> > > +
> > > +	pad = media_entity_get_fwnode_pad(&cfe->source_sd->entity,
> > > +					  cfe->remote_ep_fwnode,
> > > +					  MEDIA_PAD_FL_SOURCE);
> > > +	if (pad < 0) {
> > > +		cfe_err("Source %s has no connected source pad\n",
> > > +			cfe->source_sd->name);
> > > +		return pad;
> > > +	}
> > > +
> > > +	cfe->source_pad = pad;
> > > +
> > > +	ret = media_create_pad_link(&cfe->source_sd->entity, pad,
> > > +				    &cfe->csi2.sd.entity, CSI2_PAD_SINK,
> > > +				    MEDIA_LNK_FL_IMMUTABLE |
> > > +				    MEDIA_LNK_FL_ENABLED);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	for (unsigned int i = 0; i < CSI2_NUM_CHANNELS; i++) {
> > > +		struct cfe_node *node = &cfe->node[i];
> > > +
> > > +		if (!check_state(cfe, NODE_REGISTERED, i))
> > > +			continue;
> > > +
> > > +		/* CSI2 channel # -> /dev/video# */
> > > +		ret = media_create_pad_link(&cfe->csi2.sd.entity,
> > > +					    node_desc[i].link_pad,
> > > +					    &node->video_dev.entity, 0, 0);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		if (node_supports_image(node)) {
> > > +			/* CSI2 channel # -> FE Input */
> > > +			ret = media_create_pad_link(&cfe->csi2.sd.entity,
> > > +						    node_desc[i].link_pad,
> > > +						    &cfe->fe.sd.entity,
> > > +						    FE_STREAM_PAD, 0);
> > > +			if (ret)
> > > +				return ret;
> > > +		}
> > > +	}
> > > +
> > > +	for (unsigned int i = CSI2_NUM_CHANNELS; i < NUM_NODES; i++) {
> > > +		struct cfe_node *node = &cfe->node[i];
> > > +		struct media_entity *src, *dst;
> > > +		unsigned int src_pad, dst_pad;
> > > +
> > > +		if (node_desc[i].pad_flags & MEDIA_PAD_FL_SINK) {
> > > +			/* FE -> /dev/video# */
> > > +			src = &cfe->fe.sd.entity;
> > > +			src_pad = node_desc[i].link_pad;
> > > +			dst = &node->video_dev.entity;
> > > +			dst_pad = 0;
> > > +		} else {
> > > +			/* /dev/video# -> FE */
> > > +			dst = &cfe->fe.sd.entity;
> > > +			dst_pad = node_desc[i].link_pad;
> > > +			src = &node->video_dev.entity;
> > > +			src_pad = 0;
> > > +		}
> > > +
> > > +		ret = media_create_pad_link(src, src_pad, dst, dst_pad, 0);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int cfe_probe_complete(struct cfe_device *cfe)
> > > +{
> > > +	int ret;
> > > +
> > > +	cfe->v4l2_dev.notify = cfe_notify;
> > > +
> > > +	for (unsigned int i = 0; i < NUM_NODES; i++) {
> > > +		ret = cfe_register_node(cfe, i);
> > > +		if (ret) {
> > > +			cfe_err("Unable to register video node %u.\n", i);
> > > +			goto unregister;
> > > +		}
> > > +	}
> > > +
> > > +	ret = cfe_link_node_pads(cfe);
> > > +	if (ret) {
> > > +		cfe_err("Unable to link node pads.\n");
> > > +		goto unregister;
> > > +	}
> > > +
> > > +	ret = v4l2_device_register_subdev_nodes(&cfe->v4l2_dev);
> > > +	if (ret) {
> > > +		cfe_err("Unable to register subdev nodes.\n");
> > > +		goto unregister;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +unregister:
> > > +	cfe_unregister_nodes(cfe);
> > > +	return ret;
> > > +}
> > > +
> > > +static int cfe_async_bound(struct v4l2_async_notifier *notifier,
> > > +			   struct v4l2_subdev *subdev,
> > > +			   struct v4l2_async_connection *asd)
> > > +{
> > > +	struct cfe_device *cfe = to_cfe_device(notifier->v4l2_dev);
> > > +
> > > +	if (cfe->source_sd) {
> > > +		cfe_err("Rejecting subdev %s (Already set!!)", subdev->name);
> > > +		return 0;
> > > +	}
> > > +
> > > +	cfe->source_sd = subdev;
> > > +
> > > +	cfe_dbg("Using source %s for capture\n", subdev->name);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int cfe_async_complete(struct v4l2_async_notifier *notifier)
> > > +{
> > > +	struct cfe_device *cfe = to_cfe_device(notifier->v4l2_dev);
> > > +
> > > +	return cfe_probe_complete(cfe);
> > > +}
> > > +
> > > +static const struct v4l2_async_notifier_operations cfe_async_ops = {
> > > +	.bound = cfe_async_bound,
> > > +	.complete = cfe_async_complete,
> > > +};
> > > +
> > > +static int cfe_register_async_nf(struct cfe_device *cfe)
> > > +{
> > > +	struct platform_device *pdev = cfe->pdev;
> > > +	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
> > > +	int ret = -EINVAL;

Is the assignment necessary?

> > > +	struct fwnode_handle *local_ep_fwnode;
> > > +	struct fwnode_handle *remote_ep_fwnode;
> > > +	struct v4l2_async_connection *asd;
> > > +
> > > +	local_ep_fwnode = fwnode_graph_get_endpoint_by_id(pdev->dev.fwnode, 0, 0, 0);
> > > +	if (!local_ep_fwnode) {
> > > +		cfe_err("Failed to find local endpoint fwnode\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	remote_ep_fwnode = fwnode_graph_get_remote_endpoint(local_ep_fwnode);
> > > +	if (!remote_ep_fwnode) {
> > > +		cfe_err("Failed to find remote endpoint fwnode\n");
> > > +		ret = -ENODEV;
> > > +		goto err_put_local_fwnode;
> > > +	}
> > > +
> > > +	/* Parse the local endpoint and validate its configuration. */
> > > +	v4l2_fwnode_endpoint_parse(local_ep_fwnode, &ep);

You'll need to check the return value here.

> > > +
> > > +	if (ep.bus_type != V4L2_MBUS_CSI2_DPHY) {

This check is redundant.

> > > +		cfe_err("endpoint node type != CSI2\n");
> > > +		ret = -EINVAL;
> > > +		goto err_put_remote_fwnode;
> > > +	}
> > > +
> > > +	for (unsigned int lane = 0; lane < ep.bus.mipi_csi2.num_data_lanes; lane++) {
> > > +		if (ep.bus.mipi_csi2.data_lanes[lane] != lane + 1) {
> > > +			cfe_err("subdevice %pfwf: data lanes reordering not supported\n",
> > > +				remote_ep_fwnode);
> > > +			ret = -EINVAL;
> > > +			goto err_put_remote_fwnode;
> > > +		}
> > > +	}
> > > +
> > > +	cfe->csi2.dphy.max_lanes = ep.bus.mipi_csi2.num_data_lanes;
> > > +	cfe->csi2.bus_flags = ep.bus.mipi_csi2.flags;
> > > +
> > > +	cfe->remote_ep_fwnode = remote_ep_fwnode;
> > > +
> > > +	cfe_dbg("source %pfwf: %u data lanes, flags=0x%08x\n",
> > > +		remote_ep_fwnode, cfe->csi2.dphy.max_lanes, cfe->csi2.bus_flags);
> > > +
> > > +	/* Initialize and register the async notifier. */
> > > +	v4l2_async_nf_init(&cfe->notifier, &cfe->v4l2_dev);
> > > +	cfe->notifier.ops = &cfe_async_ops;
> > > +
> > > +	asd = v4l2_async_nf_add_fwnode(&cfe->notifier, remote_ep_fwnode,
> > > +				       struct v4l2_async_connection);
> > 
> > Could you use v4l2_async_nf_add_fwnode_remote() and just not bother with
> > remote_ep_fwnode at all?
> 
> I need the remote_ep_fwnode in cfe_link_node_pads() when creating the links.
> 
> Is there some other way to get the remote pad so that I can call the
> media_create_pad_link()?

Could you use v4l2_create_fwnode_links_to_pad() for that?

> 
> > > +	if (IS_ERR(asd)) {
> > > +		ret = PTR_ERR(asd);
> > > +		cfe_err("Error adding subdevice: %d\n", ret);
> > > +		goto err_put_remote_fwnode;
> > > +	}
> > > +
> > > +	ret = v4l2_async_nf_register(&cfe->notifier);
> > > +	if (ret) {
> > > +		cfe_err("Error registering async notifier: %d\n", ret);
> > > +		goto err_nf_cleanup;
> > > +	}
> > > +
> > > +	fwnode_handle_put(local_ep_fwnode);
> > > +
> > > +	return 0;
> > > +
> > > +err_nf_cleanup:
> > > +	v4l2_async_nf_cleanup(&cfe->notifier);
> > > +err_put_remote_fwnode:
> > > +	fwnode_handle_put(remote_ep_fwnode);
> > > +err_put_local_fwnode:
> > > +	fwnode_handle_put(local_ep_fwnode);
> > > +
> > > +	return ret;
> > > +}

...

> > > +static void cfe_remove(struct platform_device *pdev)
> > > +{
> > > +	struct cfe_device *cfe = platform_get_drvdata(pdev);
> > > +
> > > +	debugfs_remove(cfe->debugfs);
> > > +
> > > +	v4l2_async_nf_unregister(&cfe->notifier);
> > > +	v4l2_async_nf_cleanup(&cfe->notifier);
> > > +
> > > +	media_device_unregister(&cfe->mdev);
> > 
> > Do you think you might have the time to write patch that would convert the
> > driver to use media device refcounting? It's not needed for upstreaming
> > though, but would be nice to have such a new driver to be converted when we
> > (hopefully not in too distant future) could merge that set.
> 
> I had a quick try. I noticed that the current driver will crash if streaming
> is active when unbinding/unloading, so that needs fixing anyway.
> 
> But with the v4 series ([PATCH v4 00/26] Media device lifetime management),
> I hit WARN_ON(!vdev->release) in __video_register_device(). I haven't
> studied the series that much, but I understood vdev's release will be
> handled via the media device. Is that not right?

Let's discuss this online.

> > > +	debugfs_create_file("csi2_regs", 0444, debugfs, csi2, &csi2_regs_fops);
> > 
> > Should this reflect the device name? This will currently only work with one
> > such device in the system.
> 
> These files are in a device specific directory, e.g.
> "rp1-cfe:1f00110000.csi/".

Ack.

-- 
Kind regards,

Sakari Ailus

