Return-Path: <linux-media+bounces-17555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7094596B94B
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 12:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 957CB1C24FF9
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 10:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09AB01CFEDA;
	Wed,  4 Sep 2024 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pPlo8gFg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FEF13AD22;
	Wed,  4 Sep 2024 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447130; cv=none; b=ElS6PPIkLrVHmF3jfBJeRVlUMAbOOVhIBzMI7CBdLRFL5HsokKH0I+cnYgaat1vhFKgPc46oltIM7y+tkUS8iGCtmZGoiBWuzC/6evk1KoBlZRUChO8M1eYJRoYFV1T3+U+Zhy7165GCA80CGrc5kE2gHMx2P0RceDxX5FWJaHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447130; c=relaxed/simple;
	bh=kbFrdq9xxLycol7fPFRViV6Wik6wBNW/To8Oii874UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ax4kXJ8Q8AIwryToerW/spMFMBDV4uhq5/MyXsFomc6r3Xvnx/vIP/semY099NNxTQbTYtqKOAiUzYEyKejTriTpHuTN7u7W2jdKfIlosPYMVVK6VHdX48xz9ax67kkcxh7XogUp1/8dPTLHjBqeTuyitFvJmh9r4ZaFwgyeRDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pPlo8gFg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07A322E3;
	Wed,  4 Sep 2024 12:50:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725447052;
	bh=kbFrdq9xxLycol7fPFRViV6Wik6wBNW/To8Oii874UA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pPlo8gFg6Pzfh7O+DVvty0+XAoGU7U5mxfWtLf+b83zmqDDfwiYPgFmEpH2Qe+Vmc
	 8HNTFn1jU5Mok9BoXvC40Y4LETkWBnq33HMj1DEJYDdpj6LdSGuDuqkrMxBww1U8nM
	 1vgmwiZmEYz1XmUIhSiagF6KNEIs/QwHs3PLQK0I=
Message-ID: <26aa28fd-63f0-4b31-8022-24e0e234374b@ideasonboard.com>
Date: Wed, 4 Sep 2024 13:52:01 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] media: raspberrypi: Add support for RP1-CFE
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Naushir Patuck <naush@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20240815-rp1-cfe-v3-0-e15a979db327@ideasonboard.com>
 <20240815-rp1-cfe-v3-3-e15a979db327@ideasonboard.com>
 <ZtAnpqmiidMXY3o8@kekkonen.localdomain>
 <0a9f8470-606b-47e2-a622-038a2c070b5e@ideasonboard.com>
 <ZtgHRrH55fKX6m_P@kekkonen.localdomain>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <ZtgHRrH55fKX6m_P@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2024 10:07, Sakari Ailus wrote:
> Moi,
> 
> On Mon, Sep 02, 2024 at 01:05:42PM +0300, Tomi Valkeinen wrote:
>> Hi Sakari,
>>
>> Thanks for the review!
> 
> You're welcome.
> 
>>>> +#define cfe_dbg(fmt, arg...) dev_dbg(&cfe->pdev->dev, fmt, ##arg)
>>>
>>> cfe should be an argument to cfe_dbg().
>>
>> Why? This, and the ones below, is an internal macro to make it easier and
>> shorter to do prints. Adding the parameter gives no benefit that I can see.
> 
> Generally macros shouldn't expect certain variables not defined on the same
> level the macros themselves. It gets harder to maintain this way.

I agree, but I'm fine taking shortcuts in private macros to make the 
code a bit shorter and more readable.

In any case, I don't feel strongly about this so I'll make the change, 
it's an easy find and replace.

>>>> +#define node_supports_image_output(node) \
>>>> +	(!!(node_desc[(node)->id].caps & V4L2_CAP_VIDEO_CAPTURE))
>>>
>>> No need to cast to bool through !!. Same below.
>>
>> I like my bools to be bools, not ints... But at the same time, I don't see
>> how that would cause issues in the uses we have in this driver. So I'll drop
>> these.
> 
> Alternatively, explicitly cast to bool. But I don't think it's needed.
> 
>>
>>>> +#define node_supports_meta_output(node) \
>>>> +	(!!(node_desc[(node)->id].caps & V4L2_CAP_META_CAPTURE))
>>>> +#define node_supports_image_input(node) \
>>>> +	(!!(node_desc[(node)->id].caps & V4L2_CAP_VIDEO_OUTPUT))
>>>> +#define node_supports_meta_input(node) \
>>>> +	(!!(node_desc[(node)->id].caps & V4L2_CAP_META_OUTPUT))
>>>> +#define node_supports_image(node) \
>>>> +	(node_supports_image_output(node) || node_supports_image_input(node))
>>>> +#define node_supports_meta(node) \
>>>> +	(node_supports_meta_output(node) || node_supports_meta_input(node))
>>>> +
>>>> +#define is_image_output_node(node) \
>>>> +	((node)->buffer_queue.type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
>>>> +#define is_image_input_node(node) \
>>>> +	((node)->buffer_queue.type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>>>> +#define is_image_node(node) \
>>>> +	(is_image_output_node(node) || is_image_input_node(node))
>>>> +#define is_meta_output_node(node) \
>>>> +	((node)->buffer_queue.type == V4L2_BUF_TYPE_META_CAPTURE)
>>>> +#define is_meta_input_node(node) \
>>>> +	((node)->buffer_queue.type == V4L2_BUF_TYPE_META_OUTPUT)
>>>> +#define is_meta_node(node) \
>>>> +	(is_meta_output_node(node) || is_meta_input_node(node))
>>>> +
>>>> +/* To track state across all nodes. */
>>>> +#define NUM_STATES		5
> 
> This might be nicer if declared as last.

Sure.

>>>> +#define NODE_REGISTERED		BIT(0)
>>>> +#define NODE_ENABLED		BIT(1)
>>>> +#define NODE_STREAMING		BIT(2)
>>>> +#define FS_INT			BIT(3)
>>>> +#define FE_INT			BIT(4)
> 
> ...
> 
>>>> +static int cfe_start_channel(struct cfe_node *node)
>>>> +{
>>>> +	struct cfe_device *cfe = node->cfe;
>>>> +	struct v4l2_subdev_state *state;
>>>> +	struct v4l2_mbus_framefmt *source_fmt;
>>>> +	const struct cfe_fmt *fmt;
>>>> +	unsigned long flags;
>>>> +	bool start_fe;
>>>> +	int ret;
>>>> +
>>>> +	cfe_dbg("%s: [%s]\n", __func__, node_desc[node->id].name);
>>>
>>> This looks like a development time leftover. There are quite a few such
>>> prints that provide little information anyway. How about removing them all?
>>
>> These are very valuable when testing, fixing or improving the driver. If I
>> were to remove them, I would just have to add them back whenever I'd be
>> doing something with the driver and things would not work perfectly.
>>
>> The debug prints we have are all low frequency. There's a bunch printed when
>> starting the streaming and when stopping it, but the debug prints are not
>> used while streaming is on-going, and instead we have trace events for that.
> 
> I'm fine with debug prints when they do print useful information but you
> have many of them just in the beginning of the function, printing only the
> function name (and possibly the node name). I'd remove those, except in
> cases where calling the function itself is useful information, such as on
> returning the buffers.

I have removed a few debug prints, but I ended up adding a few too.

The useful information here in many cases is the function name and the 
node name. With multiple streams, and with the different possibilities 
in handling enable and disable (start streaming when the first video 
node is enabled? or only when all of them are enabled? what happens when 
one of the enabled nodes is disabled? is the csi side enabled along with 
the fe, and which csi channel?), it's very beneficial to see what goes on.

>>>> +static int cfe_link_node_pads(struct cfe_device *cfe)
>>>> +{
>>>> +	int ret;
>>>> +	int pad;
>>>> +
>>>> +	/* Source -> CSI2 */
>>>> +
>>>> +	pad = media_entity_get_fwnode_pad(&cfe->source_sd->entity,
>>>> +					  cfe->remote_ep_fwnode,
>>>> +					  MEDIA_PAD_FL_SOURCE);
>>>> +	if (pad < 0) {
>>>> +		cfe_err("Source %s has no connected source pad\n",
>>>> +			cfe->source_sd->name);
>>>> +		return pad;
>>>> +	}
>>>> +
>>>> +	cfe->source_pad = pad;
>>>> +
>>>> +	ret = media_create_pad_link(&cfe->source_sd->entity, pad,
>>>> +				    &cfe->csi2.sd.entity, CSI2_PAD_SINK,
>>>> +				    MEDIA_LNK_FL_IMMUTABLE |
>>>> +				    MEDIA_LNK_FL_ENABLED);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	for (unsigned int i = 0; i < CSI2_NUM_CHANNELS; i++) {
>>>> +		struct cfe_node *node = &cfe->node[i];
>>>> +
>>>> +		if (!check_state(cfe, NODE_REGISTERED, i))
>>>> +			continue;
>>>> +
>>>> +		/* CSI2 channel # -> /dev/video# */
>>>> +		ret = media_create_pad_link(&cfe->csi2.sd.entity,
>>>> +					    node_desc[i].link_pad,
>>>> +					    &node->video_dev.entity, 0, 0);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		if (node_supports_image(node)) {
>>>> +			/* CSI2 channel # -> FE Input */
>>>> +			ret = media_create_pad_link(&cfe->csi2.sd.entity,
>>>> +						    node_desc[i].link_pad,
>>>> +						    &cfe->fe.sd.entity,
>>>> +						    FE_STREAM_PAD, 0);
>>>> +			if (ret)
>>>> +				return ret;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	for (unsigned int i = CSI2_NUM_CHANNELS; i < NUM_NODES; i++) {
>>>> +		struct cfe_node *node = &cfe->node[i];
>>>> +		struct media_entity *src, *dst;
>>>> +		unsigned int src_pad, dst_pad;
>>>> +
>>>> +		if (node_desc[i].pad_flags & MEDIA_PAD_FL_SINK) {
>>>> +			/* FE -> /dev/video# */
>>>> +			src = &cfe->fe.sd.entity;
>>>> +			src_pad = node_desc[i].link_pad;
>>>> +			dst = &node->video_dev.entity;
>>>> +			dst_pad = 0;
>>>> +		} else {
>>>> +			/* /dev/video# -> FE */
>>>> +			dst = &cfe->fe.sd.entity;
>>>> +			dst_pad = node_desc[i].link_pad;
>>>> +			src = &node->video_dev.entity;
>>>> +			src_pad = 0;
>>>> +		}
>>>> +
>>>> +		ret = media_create_pad_link(src, src_pad, dst, dst_pad, 0);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int cfe_probe_complete(struct cfe_device *cfe)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	cfe->v4l2_dev.notify = cfe_notify;
>>>> +
>>>> +	for (unsigned int i = 0; i < NUM_NODES; i++) {
>>>> +		ret = cfe_register_node(cfe, i);
>>>> +		if (ret) {
>>>> +			cfe_err("Unable to register video node %u.\n", i);
>>>> +			goto unregister;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	ret = cfe_link_node_pads(cfe);
>>>> +	if (ret) {
>>>> +		cfe_err("Unable to link node pads.\n");
>>>> +		goto unregister;
>>>> +	}
>>>> +
>>>> +	ret = v4l2_device_register_subdev_nodes(&cfe->v4l2_dev);
>>>> +	if (ret) {
>>>> +		cfe_err("Unable to register subdev nodes.\n");
>>>> +		goto unregister;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +unregister:
>>>> +	cfe_unregister_nodes(cfe);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int cfe_async_bound(struct v4l2_async_notifier *notifier,
>>>> +			   struct v4l2_subdev *subdev,
>>>> +			   struct v4l2_async_connection *asd)
>>>> +{
>>>> +	struct cfe_device *cfe = to_cfe_device(notifier->v4l2_dev);
>>>> +
>>>> +	if (cfe->source_sd) {
>>>> +		cfe_err("Rejecting subdev %s (Already set!!)", subdev->name);
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	cfe->source_sd = subdev;
>>>> +
>>>> +	cfe_dbg("Using source %s for capture\n", subdev->name);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int cfe_async_complete(struct v4l2_async_notifier *notifier)
>>>> +{
>>>> +	struct cfe_device *cfe = to_cfe_device(notifier->v4l2_dev);
>>>> +
>>>> +	return cfe_probe_complete(cfe);
>>>> +}
>>>> +
>>>> +static const struct v4l2_async_notifier_operations cfe_async_ops = {
>>>> +	.bound = cfe_async_bound,
>>>> +	.complete = cfe_async_complete,
>>>> +};
>>>> +
>>>> +static int cfe_register_async_nf(struct cfe_device *cfe)
>>>> +{
>>>> +	struct platform_device *pdev = cfe->pdev;
>>>> +	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
>>>> +	int ret = -EINVAL;
> 
> Is the assignment necessary?

No, doesn't look like it.

>>>> +	struct fwnode_handle *local_ep_fwnode;
>>>> +	struct fwnode_handle *remote_ep_fwnode;
>>>> +	struct v4l2_async_connection *asd;
>>>> +
>>>> +	local_ep_fwnode = fwnode_graph_get_endpoint_by_id(pdev->dev.fwnode, 0, 0, 0);
>>>> +	if (!local_ep_fwnode) {
>>>> +		cfe_err("Failed to find local endpoint fwnode\n");
>>>> +		return -ENODEV;
>>>> +	}
>>>> +
>>>> +	remote_ep_fwnode = fwnode_graph_get_remote_endpoint(local_ep_fwnode);
>>>> +	if (!remote_ep_fwnode) {
>>>> +		cfe_err("Failed to find remote endpoint fwnode\n");
>>>> +		ret = -ENODEV;
>>>> +		goto err_put_local_fwnode;
>>>> +	}
>>>> +
>>>> +	/* Parse the local endpoint and validate its configuration. */
>>>> +	v4l2_fwnode_endpoint_parse(local_ep_fwnode, &ep);
> 
> You'll need to check the return value here.

I'll add that.

>>>> +
>>>> +	if (ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> 
> This check is redundant.

Indeed.

>>>> +		cfe_err("endpoint node type != CSI2\n");
>>>> +		ret = -EINVAL;
>>>> +		goto err_put_remote_fwnode;
>>>> +	}
>>>> +
>>>> +	for (unsigned int lane = 0; lane < ep.bus.mipi_csi2.num_data_lanes; lane++) {
>>>> +		if (ep.bus.mipi_csi2.data_lanes[lane] != lane + 1) {
>>>> +			cfe_err("subdevice %pfwf: data lanes reordering not supported\n",
>>>> +				remote_ep_fwnode);
>>>> +			ret = -EINVAL;
>>>> +			goto err_put_remote_fwnode;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	cfe->csi2.dphy.max_lanes = ep.bus.mipi_csi2.num_data_lanes;
>>>> +	cfe->csi2.bus_flags = ep.bus.mipi_csi2.flags;
>>>> +
>>>> +	cfe->remote_ep_fwnode = remote_ep_fwnode;
>>>> +
>>>> +	cfe_dbg("source %pfwf: %u data lanes, flags=0x%08x\n",
>>>> +		remote_ep_fwnode, cfe->csi2.dphy.max_lanes, cfe->csi2.bus_flags);
>>>> +
>>>> +	/* Initialize and register the async notifier. */
>>>> +	v4l2_async_nf_init(&cfe->notifier, &cfe->v4l2_dev);
>>>> +	cfe->notifier.ops = &cfe_async_ops;
>>>> +
>>>> +	asd = v4l2_async_nf_add_fwnode(&cfe->notifier, remote_ep_fwnode,
>>>> +				       struct v4l2_async_connection);
>>>
>>> Could you use v4l2_async_nf_add_fwnode_remote() and just not bother with
>>> remote_ep_fwnode at all?
>>
>> I need the remote_ep_fwnode in cfe_link_node_pads() when creating the links.
>>
>> Is there some other way to get the remote pad so that I can call the
>> media_create_pad_link()?
> 
> Could you use v4l2_create_fwnode_links_to_pad() for that?

Yes, seems to work. However, I don't know why it works, as the docs say 
the sink has to implement .get_fwnode_pad(), which I don't have, yet 
everything seems to work fine... Ah, the code looks for the first sink 
pad if .get_fwnode_pad() is not implemented. So either the code or the 
doc is not right.

I still need to get the remote pad number, which I previously got from 
media_entity_get_fwnode_pad(), but I can now create the link first with 
v4l2_create_fwnode_links_to_pad() and then get the pad with 
media_pad_remote_pad_unique().

  Tomi


