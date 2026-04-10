Return-Path: <linux-media+bounces-58553-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOrODMT72GmRkggAu9opvQ
	(envelope-from <linux-media+bounces-58553-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 15:31:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EFC3D8226
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 15:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E38C3017782
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 13:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F803C3C07;
	Fri, 10 Apr 2026 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CdEVK8PA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42A733A702
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827900; cv=none; b=uuwMRf/EXu3shThhNEMju0gSr7ekBvIIZnr4xW4j/+0bO0EGqWZ2/OWx9DVEmU8coQdsidGxWh61YPULLIH/NW8EQQxC4uyQh3/jsOeKEqBEXgBsHr9MVVCfvDOWNPH92c2viRiDyYfdrtpPJPGfwDjHLc+KzbhzhqaM43MIhO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827900; c=relaxed/simple;
	bh=FI4sv2wc/0kUlHDnJsc/NYpt1SyN2EhEcMY6AAi47Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXtqvyCGcg68XmmUfmbHU+BV194mvUrYZJHLyLZGL8Oo0vMOz9JOZ74Gwg9kPDVfkAFVv3sZIgGIVOPYabqqcRl7M8EwfzNk3XlY7ucc8MYYh47B6IHyuJPxQ1w4WAMSnuyGjw1gSIgGBwnQG6rFnhnVQ+atKKKUovR4fZleRPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CdEVK8PA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E3D1225;
	Fri, 10 Apr 2026 15:30:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775827806;
	bh=FI4sv2wc/0kUlHDnJsc/NYpt1SyN2EhEcMY6AAi47Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CdEVK8PAriUDIe9+Z9I7gXQKnb2yikdd3IODhpynKWAjBzGH3o4sUdXfYn/JVbTxb
	 faGT8sc9D604SpP1fF1pZd10Fi9gT4bA4Qtd6DTaZcrN7azQJKyAbBtBxA+pqveEvB
	 6zMO5gDcRHNsx2oE10oLABQQ2jnTvQHatXUnK+Zs=
Date: Fri, 10 Apr 2026 15:31:32 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 25/29] media: v4l2-subdev: Move subdev client
 capabilities into a new struct
Message-ID: <adj0ToEep5Ny_NX7@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-26-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-26-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58553-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 36EFC3D8226
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, Apr 08, 2026 at 06:39:34PM +0300, Sakari Ailus wrote:
> Add struct v4l2_subdev_client_info to hold sub-device client capability
> bits that used to be stored in the client_caps field of struct
> v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
> pad operation callbacks for capability information. The main reason why
> this is a new struct instead of a u64 field is that modifying the callback
> arguments requires touching almost every sub-device driver and that is
> desirable to avoid in the future, should more than the client capability bits
> need to be known to the callbacks.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
>  include/media/v4l2-subdev.h           | 12 ++++++++++--
>  2 files changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 40b28e070726..eaa408832c6b 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -612,7 +612,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
>  		struct v4l2_subdev_frame_interval *fi = arg;
>
> -		if (!(subdev_fh->client_caps &
> +		if (!(subdev_fh->ci.client_caps &
>  		      V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
>  			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>
> @@ -652,7 +652,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
>  	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
>  	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
> -	bool client_supports_streams = subdev_fh->client_caps &
> +	bool client_supports_streams = subdev_fh->ci.client_caps &
>  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>  	int rval;
>
> @@ -1119,7 +1119,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
>  		struct v4l2_subdev_client_capability *client_cap = arg;
>
> -		client_cap->capabilities = subdev_fh->client_caps;
> +		client_cap->capabilities = subdev_fh->ci.client_caps;
>
>  		return 0;
>  	}
> @@ -1139,7 +1139,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
>  					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
>
> -		subdev_fh->client_caps = client_cap->capabilities;
> +		subdev_fh->ci.client_caps = client_cap->capabilities;


I'm sorry for being annoying, but the discussion on v2 ended with the
question on why we can't propagate the client caps to the drivers
using the subdev state.

I understand we have the active state which is stored in the subdev
and not per-file handle. But ioctls are called on a file handle and it
seems trivial to me copy the caps from the subdev_fh to the active
state.

It would result in a much smaller set of changes.

What am I missing ?


>
>  		return 0;
>  	}
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 93b672edd08e..e0861acc638d 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -734,6 +734,14 @@ struct v4l2_subdev_state {
>  	struct v4l2_subdev_stream_configs stream_configs;
>  };
>
> +/**
> + * struct v4l2_subdev_client_info - Sub-device client information
> + * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> + */
> +struct v4l2_subdev_client_info {
> +	u64 client_caps;
> +};
> +
>  /**
>   * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
>   *
> @@ -1129,14 +1137,14 @@ struct v4l2_subdev {
>   * @vfh: pointer to &struct v4l2_fh
>   * @state: pointer to &struct v4l2_subdev_state
>   * @owner: module pointer to the owner of this file handle
> - * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> + * @ci: sub-device client info related to this file handle
>   */
>  struct v4l2_subdev_fh {
>  	struct v4l2_fh vfh;
>  	struct module *owner;
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  	struct v4l2_subdev_state *state;
> -	u64 client_caps;
> +	struct v4l2_subdev_client_info ci;
>  #endif
>  };
>
> --
> 2.47.3
>
>

