Return-Path: <linux-media+bounces-58528-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eC+qCKTE2GnxhwgAu9opvQ
	(envelope-from <linux-media+bounces-58528-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:36:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1DD3D4F66
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D1473060D4F
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DEC3B47C3;
	Fri, 10 Apr 2026 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GIdQZVbY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C7D3B3C00
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 09:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813384; cv=none; b=km1S+doYnTdN/KceTxDPf359KVgJEjJBQ9snraUSD+noBROZc8pIBYBbyWEXws6VxdeaDxP53RVQn8svA9imPLOk9YYbFADo6/a3yBIgcyJBLsl6lr8C1vLGYQ/XoEnjtod/yvpjScO9kCvkZFnqV042jAMcpLkzpB/OHOs/wdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813384; c=relaxed/simple;
	bh=0ul6Hy7vt2LqmKbNQ7VCQhBI5Ysa7dEW7Ewf4uPTwjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+VappnxkQND0/JKSZLSEX/lyf56i7WflpMafJVJ3MqV8IMYj8fHFzFoV0Lp6bYUAnNnhQi/VUlW+h17zItHnQRa3X3P8MpQZt9nts8iJF/czlKVAm8+H9V5KxsAXE39h1VsfwRvh7mzPo/1Dw/L/fu5/2EuMxKo+c2lAW3QSvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GIdQZVbY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C431225;
	Fri, 10 Apr 2026 11:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775813289;
	bh=0ul6Hy7vt2LqmKbNQ7VCQhBI5Ysa7dEW7Ewf4uPTwjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GIdQZVbYHBAT5p9q1c1YYytNcKtxJoJ/zKh9vLk//TaQXYniPbWlsh+R1Fhf5q06x
	 XGlGGrFBO55TPkjjbGY1w/YD1PywiA1/Gc4q2bqaa9BXnhBqgwVDSN1ra0Q1v2mSoD
	 AjigTmbFWLHRipnjf35E5mXVZbJXJFvIRnXc1kbg=
Date: Fri, 10 Apr 2026 11:29:36 +0200
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
Subject: Re: [PATCH v4 19/29] media: mc: Separate single link validation into
 a new function
Message-ID: <adjC9IsNCdAMLxaj@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-20-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-20-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58528-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 5F1DD3D4F66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, Apr 08, 2026 at 06:39:28PM +0300, Sakari Ailus wrote:
> Add a new function __media_pipeline_validate_one() to validate a single
> link in a pipeline. This will soon be used for performing validation in
> multiple phases.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/mc/mc-entity.c | 74 ++++++++++++++++++++----------------
>  1 file changed, 42 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 6bf4730b89d2..717569bd1a8c 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -768,6 +768,45 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
>  	return ret;
>  }
>
> +static int
> +__media_pipeline_validate_one(struct media_pad *origin,
> +			      struct media_pad *pad, struct media_link *link,
> +			      bool *has_enabled_link)
> +{
> +	struct media_device *mdev = origin->graph_obj.mdev;
> +	struct media_entity *entity = pad->entity;
> +	int ret;
> +
> +	/* Return here if the link is disabled. */
> +	if (!(link->flags & MEDIA_LNK_FL_ENABLED))
> +		return 0;
> +
> +	if (has_enabled_link)
> +		*has_enabled_link = true;
> +
> +	/* Skip validation if the current pad isn't the sink pad of the link. */
> +	if (link->sink != pad)
> +		return 0;
> +
> +	if (!entity->ops || !entity->ops->link_validate)
> +		return 0;
> +
> +	ret = entity->ops->link_validate(link);
> +	if (ret) {
> +		dev_dbg(mdev->dev,
> +			"Link '%s':%u -> '%s':%u failed validation: %d\n",
> +			link->source->entity->name, link->source->index,
> +			link->sink->entity->name, link->sink->index, ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(mdev->dev, "Link '%s':%u -> '%s':%u is valid\n",
> +		link->source->entity->name, link->source->index,
> +		link->sink->entity->name, link->sink->index);
> +
> +	return 0;
> +}
> +
>  __must_check int __media_pipeline_start(struct media_pad *origin,
>  					struct media_pipeline *pipe)
>  {
> @@ -838,39 +877,10 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>  			if (link->sink != pad && link->source != pad)
>  				continue;
>
> -			/*
> -			 * Ensure the link is enabled and if so, record
> -			 * it. Proceed to the next link if the current pad isn't
> -			 * the sink pad of the link.
> -			 */
> -			if (!(link->flags & MEDIA_LNK_FL_ENABLED))
> -				continue;
> -
> -			has_enabled_link = true;
> -
> -			if (link->sink != pad)
> -				continue;
> -
> -			if (!entity->ops || !entity->ops->link_validate)
> -				continue;
> -
> -			ret = entity->ops->link_validate(link);
> -			if (ret) {
> -				dev_dbg(mdev->dev,
> -					"Link '%s':%u -> '%s':%u failed validation: %d\n",
> -					link->source->entity->name,
> -					link->source->index,
> -					link->sink->entity->name,
> -					link->sink->index, ret);
> +			ret = __media_pipeline_validate_one(origin, pad, link,
> +							    &has_enabled_link);
> +			if (ret)
>  				goto error;
> -			}
> -
> -			dev_dbg(mdev->dev,
> -				"Link '%s':%u -> '%s':%u is valid\n",
> -				link->source->entity->name,
> -				link->source->index,
> -				link->sink->entity->name,
> -				link->sink->index);
>  		}
>
>  		/*
> --
> 2.47.3
>
>

