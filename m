Return-Path: <linux-media+bounces-58538-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP05DIvU2GmuiwgAu9opvQ
	(envelope-from <linux-media+bounces-58538-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:44:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE313D5CC0
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B8303049E38
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3F538C43F;
	Fri, 10 Apr 2026 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vtqeBPzL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6619D38F651
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 10:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775817695; cv=none; b=Wl4S+CYhtHxGUPk1Tve97nV9qpjI0qbmewEx3A6EH5Er1EiM1dloJvalVgVcmMYJSKTr3jlT1P2XLexppSyKeAaqtQ9Ql1mUR9HIPPxlWgYes7WezDuaUTHFvk1oCdM6xhuG6V9pw/AB52K+G93N4G+KGtUbbgLc99m3sUd9JG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775817695; c=relaxed/simple;
	bh=N5r04aoC8mL/7wdUgmj/pV6K8FAE7f8f59CQzUaCzYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CE38aRqfkK/nNA0D+B3tKAwgaXpVaiIDCVb84SI6dxXAW7WHGyQQFqpe74qT++Xgjs3V7le5M7L2jtxQfLhxmNidQDLa6rZmp6EZGDnQkXR7TAbVhKOBpkTPE39IsUE+DVLplHqEnCdjZbYvgWMVKjl9fnzHMyDfZGgVbr10tKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vtqeBPzL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF3A61E7;
	Fri, 10 Apr 2026 12:40:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775817601;
	bh=N5r04aoC8mL/7wdUgmj/pV6K8FAE7f8f59CQzUaCzYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vtqeBPzLq2O0je9oH5926sb2XFnHieNxUvnESqLu+sR8fSEkrlgsqjNOJOwewGO77
	 dKSu1fGNT6ghc3pMndh+y90YU5aobu+SEbctEjhvZvgIAehupHRNp9q3QP/ZQnXZlu
	 K2+DUNm7cGT2QBJEVWh9BweTbQEvRP4Rj0xt1XxQ=
Date: Fri, 10 Apr 2026 12:41:27 +0200
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
Subject: Re: [PATCH v4 22/29] media: mc: Add MEDIA_LNK_FL_VALIDATE_LATE
Message-ID: <adjR6lJWKDdg4tBZ@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-23-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-23-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58538-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 2CE313D5CC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, Apr 08, 2026 at 06:39:31PM +0300, Sakari Ailus wrote:
> Add MEDIA_LNK_FL_VALIDATE_LATE flag to support late validation of links.
> This is serving the use case where video devices are configured and
> started streaming indepenently of each other but this sequence may be run

s/indepenently/independently

> in series, in such a way that a video device in a pipeline starts
> streaming before another one is configured.
>
> Before this flag, drivers have resorted to implementing the link
> validation separately for the video nodes as part of streaming start
> sequence.
>
> media_pipeline_start() shall be called on each leaf entity connected to
> the graph with a link where MEDIA_LNK_FL_VALIDATE_LATE is set before
> uphardware operation.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/mediactl/media-ioc-setup-link.rst   |  4 +
>  .../media/mediactl/media-types.rst            |  5 ++
>  drivers/media/mc/mc-entity.c                  | 82 ++++++++++++++++++-
>  include/uapi/linux/media.h                    |  1 +
>  4 files changed, 88 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> index 23208300cb61..7c2bced57e77 100644
> --- a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> @@ -49,6 +49,10 @@ Only links marked with the ``DYNAMIC`` link flag can be enabled/disabled
>  while streaming media data. Attempting to enable or disable a streaming
>  non-dynamic link will return an ``EBUSY`` error code.
>
> +Pipeline validation may be delayed for links marked with the ``VALIDATE_LATE``

Is it helpful to say "created" instead of "marked" to highlight that
this flag is set by drivers or is it clear enough from the context ?

> +flag until actual hardware operation even if the rest of the pipeline would be

operation or operations ?

> +validated at an earlier point of time.
> +
>  If the specified link can't be found the driver returns with an ``EINVAL``
>  error code.
>
> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> index 6332e8395263..d6a690655a01 100644
> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> @@ -391,6 +391,7 @@ must be set for every pad.
>  .. _MEDIA-LNK-FL-ENABLED:
>  .. _MEDIA-LNK-FL-IMMUTABLE:
>  .. _MEDIA-LNK-FL-DYNAMIC:
> +.. _MEDIA-LNK-FL-VALIDATE-LATE:
>  .. _MEDIA-LNK-FL-LINK-TYPE:
>
>  .. flat-table:: Media link flags
> @@ -410,6 +411,10 @@ must be set for every pad.
>         -  The link enabled state can be modified during streaming. This flag
>  	  is set by drivers and is read-only for applications.
>
> +    *  -  ``MEDIA_LNK_FL_VALIDATE_LATE``
> +       -  The validation of the link may be delayed up to until the start of

Not an English native speaker here, but "delayed up to until" sounds more
complicated than just "delayed to"

> +	  hardware operation.
> +
>      *  -  ``MEDIA_LNK_FL_LINK_TYPE``
>         -  This is a bitmask that defines the type of the link. The following
>  	  link types are currently supported:
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 287eded356bb..5b0162f81425 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -771,7 +771,7 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
>  static int
>  __media_pipeline_validate_one(struct media_pad *origin,
>  			      struct media_pad *pad, struct media_link *link,
> -			      bool *has_enabled_link)
> +			      bool *has_enabled_link, bool skip_validation)
>  {
>  	struct media_device *mdev = origin->graph_obj.mdev;
>  	struct media_entity *entity = pad->entity;
> @@ -784,6 +784,9 @@ __media_pipeline_validate_one(struct media_pad *origin,
>  	if (has_enabled_link)
>  		*has_enabled_link = true;
>
> +	if (skip_validation)
> +		return 0;
> +
>  	/* Skip validation if the current pad isn't the sink pad of the link. */
>  	if (link->sink != pad)
>  		return 0;
> @@ -825,11 +828,48 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>  		return -EINVAL;
>
>  	/*
> -	 * If the pipeline has already been started, it is guaranteed to be
> -	 * valid, so just increase the start count.
> +	 * Increase start count on pipelines that have been validated
> +	 * earlier. Also check links with the VALIDATE_LATE flag here.
>  	 */
>  	if (pipe->start_count) {
> +		struct media_link *link;
> +
> +		link = __media_entity_next_link(origin->entity, NULL,
> +						MEDIA_LNK_FL_DATA_LINK);
> +		if (link && link->flags & MEDIA_LNK_FL_VALIDATE_LATE) {
> +			struct media_link *link2 =
> +				__media_entity_next_link(origin->entity, link,
> +							 MEDIA_LNK_FL_DATA_LINK);
> +			bool has_enabled_link = false;
> +
> +			/*
> +			 * Only a single pad is allowed for VALIDATE_LATE
> +			 * links. That pad needs to have exactly one link.
> +			 */
> +			if (origin->entity->num_pads != 1)
> +				return -EINVAL;
> +
> +			if (!link || link2)
> +				return -EINVAL;

This is a development error, isn't it ? Is it worth an error message ?

> +
> +			dev_dbg(mdev->dev,
> +				"Validating pad '%s':%u late\n",
> +				origin->entity->name, origin->index);
> +
> +			ret = __media_pipeline_validate_one(link->sink,
> +							    link->sink, link,
> +							    &has_enabled_link,
> +							    false);
> +			if (ret)
> +				return ret;
> +
> +			if (origin->flags & MEDIA_PAD_FL_MUST_CONNECT &&
> +			    !has_enabled_link)
> +				return -ENOLINK;
> +		}
> +
>  		pipe->start_count++;
> +
>  		return 0;
>  	}
>
> @@ -873,12 +913,19 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>  		 * the connected sink pad to avoid duplicating checks.
>  		 */
>  		for_each_media_entity_data_link(entity, link) {
> +			/* Skip late-validated links not connected to origin. */
> +			bool skip_validation =
> +				link->flags & MEDIA_LNK_FL_VALIDATE_LATE &&
> +				link->sink != origin &&
> +				link->source != origin;
> +
>  			/* Skip links unrelated to the current pad. */
>  			if (link->sink != pad && link->source != pad)
>  				continue;
>
>  			ret = __media_pipeline_validate_one(origin, pad, link,
> -							    &has_enabled_link);
> +							    &has_enabled_link,
> +							    skip_validation);
>  			if (ret)
>  				goto error;
>  		}
> @@ -1158,6 +1205,33 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
>  	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
>  		return -EINVAL;
>
> +	/*
> +	 * With the late validate flag, either source or sink shall have exactly
> +	 * one pad and no links before this one. Similarly, no links may be
> +	 * added to entities with a single pad and an existing late-validated
> +	 * link.
> +	 */
> +	if (flags & MEDIA_LNK_FL_VALIDATE_LATE) {
> +		if (!(source->num_pads == 1 && !source->num_links) &&
> +		    !(sink->num_pads == 1 && !sink->num_links))
> +			return -EINVAL;

Ah, so the above error check for which I suggested an error message
cannot happen, right ?

> +	} else {
> +		struct media_entity *entities[] = { source, sink };
> +
> +		for (unsigned int i = 0; i < ARRAY_SIZE(entities); i++) {
> +			if (entities[i]->num_pads != 1)
> +				continue;
> +
> +			struct media_link *__link =
> +				__media_entity_next_link(entities[i], NULL,
> +							 MEDIA_LNK_FL_DATA_LINK);
> +
> +			if (__link &&
> +			    __link->flags & MEDIA_LNK_FL_VALIDATE_LATE)
> +				return -EINVAL;
> +		}
> +	}
> +
>  	link = media_add_link(&source->links);
>  	if (link == NULL)
>  		return -ENOMEM;
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 1c80b1d6bbaf..c96e2118ea99 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -219,6 +219,7 @@ struct media_pad_desc {
>  #define MEDIA_LNK_FL_ENABLED			(1U << 0)
>  #define MEDIA_LNK_FL_IMMUTABLE			(1U << 1)
>  #define MEDIA_LNK_FL_DYNAMIC			(1U << 2)
> +#define MEDIA_LNK_FL_VALIDATE_LATE		(1U << 3)

Nice, with the above minors addressed, if applicable
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>  #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
>  #  define MEDIA_LNK_FL_DATA_LINK		(0U << 28)
> --
> 2.47.3
>
>

