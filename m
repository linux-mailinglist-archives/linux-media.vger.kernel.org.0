Return-Path: <linux-media+bounces-58020-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH4NO3p4z2kewgYAu9opvQ
	(envelope-from <linux-media+bounces-58020-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:21:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B4E392069
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CE4730931B9
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F88B371D00;
	Fri,  3 Apr 2026 08:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IufqW9wT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10D42E62B3;
	Fri,  3 Apr 2026 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204164; cv=none; b=R0G7jIebjh8PYEyHBVrInJn8OcOZwH0eFzfRBh23NtUeIqc8QATKDAZN63R2SLfkmrYljREi8Thh4tg+ruo2NOpbnsIrlFb5DwxU1AW3sQ6RLdyN00xIBE2SrYNsWS1XA2Q1N97mCINjIQCQU+KvQeY4TneE0fuk3XplaKxtZ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204164; c=relaxed/simple;
	bh=/Fk0k/nSlFoURHZ44wQ7caQik297I+7jIw8PN8V0mws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1A0Jz00ir85c/fF0QgzxotYnUQTA7+usd0Qu2hjEpcwV1zalKQEu/sJSGxBDB0UdNuYqY3Z+KH5EqU9KEmceTJO6sLkW1YEjJ2Jwr5H/KLgA7dkZnXC5I9n0TRI0zXOtAeV1MFAKK2KUFHzyoZ5ls7jx6WukhzYkaIec+u0mkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IufqW9wT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (static.170.20.224.46.clients.your-server.de [46.224.20.170])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 619C2143C;
	Fri,  3 Apr 2026 10:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775204076;
	bh=/Fk0k/nSlFoURHZ44wQ7caQik297I+7jIw8PN8V0mws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IufqW9wTjvds+3kYS6U0gl9vJyRhgj4TBviBz/FzTxXdXJJyR5HvUn/i1imOgVno5
	 pFeysj+RdI8oZZXdn68vztcYe+FU47BN9T8x/vFi5gKsupLAGPe0RZF36ymUZKeh29
	 Gg5JDyonq7ur1mDGNhf+2ZQx50WVoSSoXmf2MgqM=
Date: Fri, 3 Apr 2026 10:15:57 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] media: rzg2l-cru: Switch to v4l2_subdev_get_frame_desc()
Message-ID: <ac91IOZe4SZbm537@zed>
References: <20260330150639.272174-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330150639.272174-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58020-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 50B4E392069
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar

On Mon, Mar 30, 2026 at 04:06:39PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Replace direct v4l2_subdev_call() invocations of the get_frame_desc pad
> operation with the new v4l2_subdev_get_frame_desc() helper in both
> rzg2l-csi2 and rzg2l-video.
>
> Drop the -ENOIOCTLCMD handling and frame descriptor type validation as
> these are redundant after switching to v4l2_subdev_get_frame_desc().
> Set fd.type to V4L2_MBUS_FRAME_DESC_TYPE_CSI2 before calling the helper
> as required by its API contract.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Note, this patch depends on the patch [0] posted by Sakari which adds
> the v4l2_subdev_get_frame_desc() helper.
>
> [0] https://lore.kernel.org/all/20260329195625.2840728-1-sakari.ailus@linux.intel.com/
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c    |  5 +++--
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c   | 18 +++++++-----------
>  2 files changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 6dc4b53607b4..1fdd423f6e6c 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c

There is one thing I'm missing here.

The media topology I see on V2H is:

"CRU output" -> "cru-ip" -> "cru" -> sensor

With the 'output' being the video device.

The handling of the get_frame_desc call chain is implemented in the
video device rzg2l-video.c and in the "cru" subdevice (rzg2l-csi2.c)
while the "ip" subdev doesn't implement get_frame_desc at all

static const struct v4l2_subdev_pad_ops rzg2l_cru_ip_pad_ops = {
	.enum_mbus_code = rzg2l_cru_ip_enum_mbus_code,
	.enum_frame_size = rzg2l_cru_ip_enum_frame_size,
	.get_fmt = v4l2_subdev_get_fmt,
	.set_fmt = rzg2l_cru_ip_set_format,
};

Have I missed how the call chain is propagated from the video device
to the sensor through the 'ip' block maybe ?

> @@ -737,8 +737,9 @@ static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  			csi2->remote_source->name, remote_pad);
>  		return PTR_ERR(remote_pad);
>  	}
> -	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
> -				remote_pad->index, fd);
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	return v4l2_subdev_get_frame_desc(csi2->remote_source,
> +					  remote_pad->index, fd);
>  }
>
>  static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 162e2ace6931..e701a591ce8a 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -406,24 +406,20 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>
>  static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)

>  {
> -	struct v4l2_mbus_frame_desc fd = { };
> +	struct v4l2_mbus_frame_desc fd = {
> +		.type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2,
> +	};
>  	struct media_pad *remote_pad;
>  	int ret;
>
>  	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
> -	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
> -	if (ret < 0 && ret != -ENOIOCTLCMD) {
> +
> +	ret = v4l2_subdev_get_frame_desc(cru->ip.remote,
> +					 remote_pad->index, &fd);
> +	if (ret < 0) {
>  		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
>  		return ret;
>  	}
> -	/* If remote subdev does not implement .get_frame_desc default to VC0. */
> -	if (ret == -ENOIOCTLCMD)
> -		return 0;
> -
> -	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> -		dev_err(cru->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
> -		return -EINVAL;
> -	}
>
>  	if (!fd.num_entries) {
>  		dev_err(cru->dev, "get_frame_desc returned zero entries\n");
> --
> 2.53.0
>
>

