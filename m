Return-Path: <linux-media+bounces-65578-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2mpZAkctPGrxkwgAu9opvQ
	(envelope-from <linux-media+bounces-65578-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 21:17:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE486C0F5E
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 21:17:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=GaqAF6Y8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65578-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65578-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FDFF307483E
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DC33749E8;
	Wed, 24 Jun 2026 19:15:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CC93624BC;
	Wed, 24 Jun 2026 19:14:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328500; cv=none; b=CqeoY4FRLO3yH0jR2dYg3HPYfPSHmZ5kmVSPZ5j4d2Q6sGRBnWMAuJXgvHKYAVu0ytRd6xGqqFKTL8wx9svpzw49y50VMx2wu+dq1yTTh+sby8fLgh93WbMHp/YV9MeaXLGAl0AsdgLJq1EelycoafBV3ngqcdifCT7JpBX7+1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328500; c=relaxed/simple;
	bh=4l3LwfXynM0MsWP2kcvzPf7S3XQAOuf0AlSVOoYKWIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbrJLWh1UZlY4LFAimM45dbhEMRwLWN729HSyQT/y4LSVyhyRCmcyyMdnLnJRgAr4wwYFcvLeapIIrzIxs8oORI4wka7uN53T5upzLLuO4Pps7sdB1NZgbrrbiCisWex5xmkAFXDIRp53vddPsefIOTWsbrP1bJx7nYDz42U+mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GaqAF6Y8; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45848236;
	Wed, 24 Jun 2026 21:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782328457;
	bh=4l3LwfXynM0MsWP2kcvzPf7S3XQAOuf0AlSVOoYKWIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaqAF6Y8/h3JELG3xUHoxAj0t/lD1G8Yuz7xkdZoqjtld0QtIDHM5nhx+A5vDQmV7
	 ovby1WLWvV7w1axQLbuA+3u3efsU0JcAHedtGdbOdmgidHRiNaqhuK/pBzB30v6axE
	 YikzPxT71bFWSPP4vGlqpk0U3yjqe+Jgu9MgZUnk=
Date: Wed, 24 Jun 2026 22:14:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v2 2/4] media: mc: use
 fwnode_graph_for_each_endpoint_scoped() to simpilfy code
Message-ID: <20260624191455.GD851255@killaraus.ideasonboard.com>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
 <20260624-fw_scoped-v2-2-0a8db472af4a@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624-fw_scoped-v2-2-0a8db472af4a@nxp.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65578-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,sntech.de,linaro.org,oss.qualcomm.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,nxp.com,oss.nxp.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,nxp.com:email,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AE486C0F5E

On Wed, Jun 24, 2026 at 01:00:10PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Use cleanup helper fwnode_graph_for_each_endpoint_scoped() to simpilfy
> code.
> 
> Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-mc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> index 937d358697e19..5d7fcd67dc42e 100644
> --- a/drivers/media/v4l2-core/v4l2-mc.c
> +++ b/drivers/media/v4l2-core/v4l2-mc.c
> @@ -324,12 +324,10 @@ EXPORT_SYMBOL_GPL(v4l_vb2q_enable_media_source);
>  int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
>  				    struct media_pad *sink, u32 flags)
>  {
> -	struct fwnode_handle *endpoint;
> -
>  	if (!(sink->flags & MEDIA_PAD_FL_SINK))
>  		return -EINVAL;
>  
> -	fwnode_graph_for_each_endpoint(src_sd->fwnode, endpoint) {
> +	fwnode_graph_for_each_endpoint_scoped(src_sd->fwnode, endpoint) {
>  		struct fwnode_handle *remote_ep;
>  		int src_idx, sink_idx, ret;
>  		struct media_pad *src;
> @@ -397,7 +395,6 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
>  				src_sd->entity.name, src_idx,
>  				sink->entity->name, sink_idx, ret);
>  
> -			fwnode_handle_put(endpoint);
>  			return ret;
>  		}
>  	}

-- 
Regards,

Laurent Pinchart

