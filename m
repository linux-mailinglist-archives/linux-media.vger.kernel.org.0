Return-Path: <linux-media+bounces-64168-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DEaUHMWNJmqfYgIAu9opvQ
	(envelope-from <linux-media+bounces-64168-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:39:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C14FA654A8E
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:39:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=MPpqcEgx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64168-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64168-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FD993025D2F
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 09:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AB7397332;
	Mon,  8 Jun 2026 09:34:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A73B42D7
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 09:34:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911282; cv=none; b=JhtJ/PXgZ/SGyvMEPplny2faOx//IpOyT8+ZmKib6jN3pojgdGj0xiF+VAYuAxiDyB3rDqnIkFaMeg8bVXxTHr7isDCygoatlRtxuQWUdzNknf4E29YC1v9qsZpSOqk+7IO0p2j8TvUBjbFOsKqL8ulIhXTKrSoky2Smv9rgcnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911282; c=relaxed/simple;
	bh=xj6upxhcfl+Ax8bF4ytIKRBfQNVmvIPWdSdc/+Vvmn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFYTBt+uSw4g6YDeVPL+LKDAngeMKy6kAf6xr++crgE8WWrpFtVRfuYB4kqvoePirwyV4Lbmtnk0KThqjj11gxfBCD+OkgAdvlzT2BkLjlU9CRuHbahsIU92jEybjFFr827+qd7cN08r5Jb+FlKRLnepKzcJ7dYgTE/K3ydqXH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MPpqcEgx; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AC442D7;
	Mon,  8 Jun 2026 11:34:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780911250;
	bh=xj6upxhcfl+Ax8bF4ytIKRBfQNVmvIPWdSdc/+Vvmn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPpqcEgxmb1U2ox88yoNqQrU1i1pz0c9nCy5mfP8Co33XpfUqz2ei3zR0i5Z3FzcE
	 jJs5v6Z4kr48082mxy85t3jcciajLDIAnXU2wu7gSZnvpZasubyv6/9GxbyWDXCkb9
	 F66odRqXyjCa6zYuoJINEN9oo4c40JpS3mNS4lr4=
Date: Mon, 8 Jun 2026 12:34:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 08/10] media: v4l2-subdev: Move subdev client
 capabilities into a new struct
Message-ID: <20260608093436.GD772117@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-9-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260607215356.842932-9-sakari.ailus@linux.intel.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64168-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:from_mime,ideasonboard.com:dkim,nxp.com:email,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C14FA654A8E

Hi Sakari,

Thank you for the patch.

On Mon, Jun 08, 2026 at 12:53:54AM +0300, Sakari Ailus wrote:
> Add struct v4l2_subdev_client_info to hold sub-device client capability
> bits that used to be stored in the client_caps field of struct
> v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
> pad operation callbacks for capability information. The main reason why
> this is a new struct instead of a u64 field is that modifying the callback
> arguments requires touching almost every sub-device driver and that is
> desirable to avoid in the future, should more than the client capability bits
> need to be known to the callbacks.
> 
> To be squashed to the previous patch.

This seems to be a leftover, patch 07/10 is unrelated.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
>  include/media/v4l2-subdev.h           | 12 ++++++++++--
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index dc4ac08c210f..e4ac6981e950 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -634,7 +634,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
>  		struct v4l2_subdev_frame_interval *fi = arg;
>  
> -		if (!(subdev_fh->client_caps &
> +		if (!(subdev_fh->ci.client_caps &
>  		      V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
>  			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  
> @@ -673,7 +673,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
>  	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
>  	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
> -	bool client_supports_streams = subdev_fh->client_caps &
> +	bool client_supports_streams = subdev_fh->ci.client_caps &
>  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>  	int rval;
>  
> @@ -1133,7 +1133,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
>  		struct v4l2_subdev_client_capability *client_cap = arg;
>  
> -		client_cap->capabilities = subdev_fh->client_caps;
> +		client_cap->capabilities = subdev_fh->ci.client_caps;
>  
>  		return 0;
>  	}
> @@ -1153,7 +1153,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
>  					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
>  
> -		subdev_fh->client_caps = client_cap->capabilities;
> +		subdev_fh->ci.client_caps = client_cap->capabilities;
>  
>  		return 0;
>  	}
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a25234befbe9..e83ef88fe12c 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -741,6 +741,14 @@ struct v4l2_subdev_state {
>  	struct v4l2_subdev_stream_configs stream_configs;
>  };
>  
> +/**
> + * struct v4l2_subdev_client_info - Sub-device client information
> + * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> + */
> +struct v4l2_subdev_client_info {
> +	u64 client_caps;

As this is now part of a structure called *client* info, maybe the field
could be named just "caps" ?

> +};
> +
>  /**
>   * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
>   *
> @@ -1144,14 +1152,14 @@ struct v4l2_subdev {
>   * @vfh: pointer to &struct v4l2_fh
>   * @state: pointer to &struct v4l2_subdev_state
>   * @owner: module pointer to the owner of this file handle
> - * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> + * @ci: sub-device client info related to this file handle

I'm not a fan of "ci", I would write client_info to make the code more
explicit.

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

-- 
Regards,

Laurent Pinchart

