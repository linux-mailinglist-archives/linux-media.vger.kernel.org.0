Return-Path: <linux-media+bounces-58934-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAaYG2kN4WnoogAAu9opvQ
	(envelope-from <linux-media+bounces-58934-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 18:25:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7609411B0A
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 18:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 901FA30511A6
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67777212F89;
	Thu, 16 Apr 2026 16:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZeZs6ufl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7921395DBC
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776356661; cv=none; b=cgbp20l1DUjlhglhpEby48b4jzqfNffATA9yL64r0KhAbusCllveRFKEUDWnggKNNVoxjEM3JyaWqg2zXPJT9UFKXsT1VgEZhn04acKmJT5yyBz65vX86WaZ9gbl8y3q/jVrN3QOOI4rVkYuKEnJYMzSsH27kqMj7c2UeUYdGBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776356661; c=relaxed/simple;
	bh=8CH3r9aR9kdGPIRsKGpFV1YmuoWiK9twlPnH0Sjusmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFdHiEZg2/85Qn5Wd0MNIsw/n/qYzT4txx3dBvlZ2IU8X37Vj7emhLn501HNFNYHGZEWOYndltj38Zm0Pu8I9hsKSlZvUUF0HUQ94kzoTZXipOQycj6vMvL0v24FJnVsGaTg/oqlVw1A2MaRoV1IqaPdGPX1F7aR5fFQCahNEuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZeZs6ufl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8590E132;
	Thu, 16 Apr 2026 18:22:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776356562;
	bh=8CH3r9aR9kdGPIRsKGpFV1YmuoWiK9twlPnH0Sjusmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZeZs6uflxGLm8TCKQv2I2hU+l7CCUBEgbFpRkQCVECstAGGaRJERhq0MhlHxGXl77
	 uOyZ1zz9MWsQd+aioawaAjbUKh+iIP25ZeLVeTIPaXhAcT5kEgisFRmqDs7hj0mgxg
	 ncDKcq/B2z86tqLaWRfieCEuxqEEptPJ2G6dEoG0=
Date: Thu, 16 Apr 2026 19:24:15 +0300
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
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
Subject: Re: [PATCH v4 16/29] media: v4l2-subdev: Refactor returning routes
Message-ID: <20260416162415.GE1823068@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-17-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-17-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58934-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,intel.com:email]
X-Rspamd-Queue-Id: D7609411B0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thank you for the patch.

On Wed, Apr 08, 2026 at 06:39:25PM +0300, Sakari Ailus wrote:
> Refactor returning the routes by adding a new function that essentially
> does a memcopy and sets the number of the routes in the routing table.

I'd write "factor out" instead of "refactor", here and in the subject
line. Then you can add

This avoids code duplication.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 34 +++++++++++++--------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 831c69c958b8..f8fde395a53a 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -629,6 +629,19 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>  			     v4l2_subdev_get_unlocked_active_state(sd);
>  }
>  
> +static void copy_routes_state_to_routing(struct v4l2_subdev_routing *routing,
> +					 const struct v4l2_subdev_state *state)

v4l2_subdev_ prefix.

> +{
> +	struct v4l2_subdev_route *routes =
> +		(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
> +	u32 copy_routes = min(routing->len_routes, state->routing.num_routes);
> +
> +	for (u32 i = 0; i < copy_routes; i++)
> +		routes[i] = state->routing.routes[i];

Any reason you use a loop instead of memcpy() ? If so, please document
it in the commit message.

With all that addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +
> +	routing->num_routes = state->routing.num_routes;
> +}
> +
>  static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  			    struct v4l2_subdev_state *state)
>  {
> @@ -1000,7 +1013,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  
>  	case VIDIOC_SUBDEV_G_ROUTING: {
>  		struct v4l2_subdev_routing *routing = arg;
> -		struct v4l2_subdev_krouting *krouting;
>  
>  		if (!v4l2_subdev_enable_streams_api)
>  			return -ENOIOCTLCMD;
> @@ -1010,13 +1022,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  
>  		memset(routing->reserved, 0, sizeof(routing->reserved));
>  
> -		krouting = &state->routing;
> -
> -		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -		       krouting->routes,
> -		       min(krouting->num_routes, routing->len_routes) *
> -		       sizeof(*krouting->routes));
> -		routing->num_routes = krouting->num_routes;
> +		copy_routes_state_to_routing(routing, state);
>  
>  		return 0;
>  	}
> @@ -1084,11 +1090,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		 * the routing table.
>  		 */
>  		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
> -			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -			       state->routing.routes,
> -			       min(state->routing.num_routes, routing->len_routes) *
> -			       sizeof(*state->routing.routes));
> -			routing->num_routes = state->routing.num_routes;
> +			copy_routes_state_to_routing(routing, state);
>  
>  			return 0;
>  		}
> @@ -1102,11 +1104,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		if (rval < 0)
>  			return rval;
>  
> -		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -		       state->routing.routes,
> -		       min(state->routing.num_routes, routing->len_routes) *
> -		       sizeof(*state->routing.routes));
> -		routing->num_routes = state->routing.num_routes;
> +		copy_routes_state_to_routing(routing, state);
>  
>  		return 0;
>  	}

-- 
Regards,

Laurent Pinchart

