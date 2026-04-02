Return-Path: <linux-media+bounces-57944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLZSFBBbzmmgnAYAu9opvQ
	(envelope-from <linux-media+bounces-57944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:03:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F47388C07
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 239EA3094029
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 11:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673D93C5540;
	Thu,  2 Apr 2026 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NjaTrbs5"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9D1370D47
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131004; cv=none; b=NivaSba3S+ZCfeku9VpzMhZdHQB2UBGVm+c80xhhKI4E310jUF88Clxmy3+g6Bt1RRJ+JnO9XFpPIdXBmR9c4MUnomfMUsdh1/NcsH1ste0VNBy5BbAXMkPl1QWnDNFexOA/ObdSQVzCtxfuqWyzBjkEcSEVDVSIprTgVGbLe8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131004; c=relaxed/simple;
	bh=0hhpUie3lopwdf2kqOxnj7Te7az2UkNJRTHQmk5UaW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrIBXs0iytJXqcFSWns4vXHXziCNLdWZtn/F/SyiSOrD9i5/tUj2BitSOVpO3s5rxkoUVxhk9HAOCJNUFK7AtRN8+ihS0HUMphU/wvQQVwUEDrKohf4SfEk8VIvXoV6GmbUDx/GQN4VcFlHajih9f2650MELadhToNtj6fb8jlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NjaTrbs5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775130999;
	bh=0hhpUie3lopwdf2kqOxnj7Te7az2UkNJRTHQmk5UaW4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NjaTrbs5C60sH5YHp4CHk7C6WkI0BVcauRvLpfDhfMNLj5n6rtW9n3shMyNk/QO/q
	 sEWvMG5fWsUGQEN3hxL+9svpOntVg1i4kpCaE8NVv+YR7O+uOpE5dNTj2FEpkjZXTX
	 I2xLgPp7ZcSN+rUy1t1ZDhTCVuJuY/vFT9HNcwi/JIrtuo1r1SeKM7UezEcSpvQvuY
	 +xJWmsMPub6YvoN0/ZrhcYPrKfN+SHdQagZ1plfKwf1diSgqWiwVNc3tbeFT2Af/xs
	 /lGkPBTJAUsL+fwii3NohWp+jfJHjhN3Uzt//YjmzYkch90GlRyRoPtbgmFQTcwrUo
	 vvRzxEUx1Ww4A==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B24E017E7C56;
	Thu,  2 Apr 2026 13:56:38 +0200 (CEST)
Message-ID: <25492190-7f46-40c8-8d90-ff53168d3971@collabora.com>
Date: Thu, 2 Apr 2026 13:56:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/22] media: v4l2-subdev: Refactor returning routes
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
 <20260325105818.1176816-11-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260325105818.1176816-11-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57944-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RSPAMD_URIBL_FAIL(0.00)[collabora.com:query timed out];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[sakari.ailus.linux.intel.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[30];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D8F47388C07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On 3/25/26 11:58, Sakari Ailus wrote:
> Refactor returning the routes by adding a new function that essentially
> does a memcopy and sets the number of the routes in the routing table.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael

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
> +{
> +	struct v4l2_subdev_route *routes =
> +		(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
> +	u32 copy_routes = min(routing->len_routes, state->routing.num_routes);
> +
> +	for (u32 i = 0; i < copy_routes; i++)
> +		routes[i] = state->routing.routes[i];
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


