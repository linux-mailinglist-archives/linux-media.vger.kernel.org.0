Return-Path: <linux-media+bounces-57952-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IQwNEtkzmmXnQYAu9opvQ
	(envelope-from <linux-media+bounces-57952-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:42:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4064E3892F6
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC51530916A4
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 12:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555903E3D99;
	Thu,  2 Apr 2026 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O+qls6jY"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4253D9DD3
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775133376; cv=none; b=qv+M5YSmBvF0CmHaSTKUnWSnHJxbPpV7hvrwmZVE7kygu6kbnJqmuntzlyn802e+Fa8bnA22FndrYxSudy84jXTFoJHXQDA/o4Ez93gKJ+ikjpEpVjQxHrawDf+5iPuO5TSaO0jOdBwZAfHU/rM7kfrZ00u5+70aZO+ZUYuQrXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775133376; c=relaxed/simple;
	bh=1NEVIbIBpd83OEhtZ8cPOGeg8wJRksOKI2Qm0J2WXtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQfoSutfmWfFBMZe6GQN696FFY6HodEAoOqC3ro8Z5nesFJLytqNoypqmlJFWK/IdkLtD2OBjz7iYM9F/QBvJwOvpm/5rQNoqd1qBxEur/tnbr7vFRkAKe3ZHbU5N+UXQW+IkaYVh2YDVtyXUs60suYAXpNHj5HzXKZIEOY0n9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O+qls6jY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775133368;
	bh=1NEVIbIBpd83OEhtZ8cPOGeg8wJRksOKI2Qm0J2WXtY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O+qls6jYK9GvFLQ0V9buheGUcjjJfSYcJ4dP5vlhEQQsAFymJOaf4BVTdFFf3IpKO
	 FKcSpPSDZdHB5vlt7OUW8p3uMQempcyVU2/sdYnQau7Lz+fkk5LY5SYTWnQAppnY/Y
	 PKbuC/NdTFbH7PT3wJEfx0JeqIFmDUJgXcb6PFQmKz3a/dloIae7w0/2+ZjxbzIaUf
	 ONCyGImGOnAniLGDL7Zu3nMfVxIeannyzk+KiUd6ylMiAXbrfY7ijs/+TyXABSmC/N
	 1Bwdeq3yNkJUM0le0JD+HVdbyJZ4VSdDMNQj96zt+IS8O4SPiWjb8gNt1Ty9ndLMch
	 KAfDcih6REtAw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9194C17E7992;
	Thu,  2 Apr 2026 14:36:07 +0200 (CEST)
Message-ID: <7e622a1e-0ec0-4fe2-9aa4-4b152b4cbb3a@collabora.com>
Date: Thu, 2 Apr 2026 14:36:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/22] media: mc: Separate single link validation into
 a new function
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
 <20260325105818.1176816-14-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260325105818.1176816-14-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57952-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: 4064E3892F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On 3/25/26 11:58, Sakari Ailus wrote:
> Add a new function __media_pipeline_validate_one() to validate a single
> link in a pipeline. This will soon be used for performing validation in
> multiple phases.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael

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


