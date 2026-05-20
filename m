Return-Path: <linux-media+bounces-62353-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDZLFztBDmqs9QUAu9opvQ
	(envelope-from <linux-media+bounces-62353-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:18:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B63AD59CA98
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E99533D28EE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 21:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0D037F8A6;
	Wed, 20 May 2026 21:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RTzdR8+K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A632437F8D5;
	Wed, 20 May 2026 21:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779312127; cv=none; b=M7CIwtX8pEbJUesqPnv5kF/5e2n0HFq0yFdFilknnNzqfg7UodBfAHvsKkOnl7dfEooiJwoIMdmzLx7JmNNShQDryJ0olDmblUtmWbeb2N445WFq3TBXxOKmhoMcKjUGNux7YeVJbQb1gvDAKLU2pL9env6qsHl4Z0tRApMF308=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779312127; c=relaxed/simple;
	bh=Y1rMEzlaiUJ1fqWI8kiFvjdxUfnUCtEhmT0b78R7Io8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ule9Db4HrjI4swqA0hvsX/1rwsKORkLuJa4zqcNjY0/VXHPjodoLXuip+XZCLef4UPhUWjyv2iGihUaV0n4B/BnlPbgi8x7gkUSyYemjH91k/hYR+i03vmL5EaLaXBVuIKnhKUNEzFzCq4SVzK9cfh9h2g55QgWIA6ew1J8bnzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RTzdR8+K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9607642B;
	Wed, 20 May 2026 23:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779312108;
	bh=Y1rMEzlaiUJ1fqWI8kiFvjdxUfnUCtEhmT0b78R7Io8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RTzdR8+KDBxDyElJVu8oBC2z5QLYgeD3vaVIDqGEx6VjXeojnOaxldKOm/0p1JZ47
	 XyKKljc2WLcRBhbSmGk35C4DXFzY37rvnIqjuLVNao+NEp0xwKB1CwNuU91zrnSS0m
	 /KC2l5BZ4EMItojYybETV1GlaY4ouGprNRHBzBw8=
Date: Wed, 20 May 2026 23:22:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 2/2] media: nxp: imx8-isi: Implement get_frame_desc
 for crossbar subdev
Message-ID: <20260520212201.GC9017@killaraus.ideasonboard.com>
References: <20260508-isi_vc-v4-0-feee39c63939@oss.nxp.com>
 <20260508-isi_vc-v4-2-feee39c63939@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260508-isi_vc-v4-2-feee39c63939@oss.nxp.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62353-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: B63AD59CA98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Guoniu,

Thank you for the patch.

On Fri, May 08, 2026 at 11:05:41AM +0800, Guoniu Zhou wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Implement the get_frame_desc pad operation for the crossbar subdevice
> to propagate frame descriptor information from the source subdevice to
> downstream ISI channels.
> 
> This allows the ISI driver to retrieve virtual channel information and
> other stream parameters from the connected upstream, which is required
> for proper virtual channel routing on platforms supporting multiple VCs.

Have you looked at v4l2_subdev_get_frame_desc_passthrough(), could it be
used instead of a manual implementation ? This could be either direct
usage of v4l2_subdev_get_frame_desc_passthrough(), or with minor
additional customization (first calling the unlocked helper
__v4l2_subdev_get_frame_desc_passthrough() and updating the descriptors.

> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v4:
> - Use %d instead of %u for ret variable in error messages
> - Fix potential -ENOIOCTLCMD leak by resetting ret to 0 on continue
> 
> Changes in v3:
> - New patch added based on feedback from Laurent Pinchart
> ---
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 605a45124103..b5eff191b2d5 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -306,6 +306,103 @@ static int mxc_isi_crossbar_set_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int mxc_isi_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				  struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
> +	struct device *dev = xbar->isi->dev;
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev_state *state;
> +	int ret = 0;
> +
> +	if (pad < xbar->num_sinks)
> +		return -EINVAL;
> +
> +	memset(fd, 0, sizeof(*fd));
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	/*
> +	 * Iterate over all active routes. For each route going through the
> +	 * requested source pad, get the frame descriptor from the connected
> +	 * source subdev, find the corresponding stream entry, and add it to
> +	 * the output frame descriptor with the routed stream ID.
> +	 */
> +	for_each_active_route(&state->routing, route) {
> +		struct v4l2_mbus_frame_desc source_fd;
> +		struct v4l2_subdev *remote_sd;
> +		struct media_pad *remote_pad;
> +		unsigned int i;
> +
> +		if (route->source_pad != pad)
> +			continue;
> +
> +		/* Find the remote subdev connected to this sink pad */
> +		remote_pad = media_pad_remote_pad_first(&xbar->pads[route->sink_pad]);
> +		if (!remote_pad) {
> +			dev_dbg(dev, "no remote pad connected to crossbar input %u\n",
> +				route->sink_pad);
> +			continue;
> +		}
> +
> +		remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +		if (!remote_sd) {
> +			dev_err(dev, "no subdev connected to crossbar input %u\n",
> +				route->sink_pad);
> +			ret = -EPIPE;
> +			goto out_unlock;
> +		}
> +
> +		/* Get frame descriptor from the remote subdev */
> +		ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
> +				       remote_pad->index, &source_fd);
> +		if (ret == -ENOIOCTLCMD) {
> +			dev_dbg(dev, "%s:%u does not support frame descriptors\n",
> +				remote_sd->entity.name, remote_pad->index);
> +			ret = 0;
> +			continue;
> +		}
> +		if (ret < 0) {
> +			dev_err(dev, "failed to get frame desc from %s:%u: %d\n",
> +				remote_sd->entity.name, remote_pad->index, ret);
> +			goto out_unlock;
> +		}
> +
> +		if (fd->num_entries == 0)
> +			fd->type = source_fd.type;
> +
> +		/* Find the source frame descriptor entry matching the sink stream */
> +		for (i = 0; i < source_fd.num_entries; i++) {
> +			if (source_fd.entry[i].stream == route->sink_stream)
> +				break;
> +		}
> +
> +		if (i == source_fd.num_entries) {
> +			dev_err(dev, "stream %u not found in frame desc from %s:%u\n",
> +				route->sink_stream, remote_sd->entity.name,
> +				remote_pad->index);
> +			ret = -EPIPE;
> +			goto out_unlock;
> +		}
> +
> +		if (fd->num_entries >= ARRAY_SIZE(fd->entry)) {
> +			dev_err(dev, "frame descriptor is full\n");
> +			ret = -ENOSPC;
> +			goto out_unlock;
> +		}
> +
> +		/* Copy the entry and update the stream ID */
> +		fd->entry[fd->num_entries] = source_fd.entry[i];
> +		fd->entry[fd->num_entries].stream = route->source_stream;
> +		fd->num_entries++;
> +	}
> +
> +out_unlock:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
>  static int mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
>  					struct v4l2_subdev_state *state,
>  					enum v4l2_subdev_format_whence which,
> @@ -404,6 +501,7 @@ static const struct v4l2_subdev_pad_ops mxc_isi_crossbar_subdev_pad_ops = {
>  	.enum_mbus_code = mxc_isi_crossbar_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = mxc_isi_crossbar_set_fmt,
> +	.get_frame_desc = mxc_isi_get_frame_desc,
>  	.set_routing = mxc_isi_crossbar_set_routing,
>  	.enable_streams = mxc_isi_crossbar_enable_streams,
>  	.disable_streams = mxc_isi_crossbar_disable_streams,

-- 
Regards,

Laurent Pinchart

