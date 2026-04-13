Return-Path: <linux-media+bounces-58649-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONsMNXm43Gn2VgkAu9opvQ
	(envelope-from <linux-media+bounces-58649-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 11:33:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3776C3E9E1A
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 11:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0633D3030EAF
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C523803C2;
	Mon, 13 Apr 2026 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MDHJsDzG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EC94C6D
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776072633; cv=none; b=BnTxvASw3uGpvkJDhfIqYM4Ra4bhB5Ct7uGp0hCKpU6PWClSjiH10yYEpsaE/N9GjczO4ltJPWru8RVWlxxsJyIHowQudIEzYZFqLcsdexDX0fFMTID1Q5K1br1BHRyunxmDUfNjq/eMRUvTRA3P7jCHLYoj9uMkWF7M/rhl8FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776072633; c=relaxed/simple;
	bh=vKwSzVAD4gtnxfMjYBQzGiq9gwCQT35drWyTgqBymdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/STzYpHlwbL530WB0jFmynkUIMmG6uHGKUjz6HInCAJabLQ1LlLKz2ZbgAGLs66eMbgUYVy1qUwtB4D00V52mJtFBTVkY3KhBHg1AX0sa4E8SyBZSd08pVaKnxM4rJoFCcoO8GoJxAjqybMawe+4gi64jmXaVLjV2bgnLD+hvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MDHJsDzG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56D0516A;
	Mon, 13 Apr 2026 11:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776072535;
	bh=vKwSzVAD4gtnxfMjYBQzGiq9gwCQT35drWyTgqBymdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDHJsDzG3Da+Ad5r9o2xMMYNyRmgvIGMHsKruCJGqE1/yJdKpPUi73HjZ9YJ+zjNV
	 llMJUsnwTqUk638cJm30urCZA2rcFnJNfc2WnYuad4jqpvGkXw3P7XFFPxsfhDLdes
	 69Hp7xubSOU51U0R8LBDAffOEDKIv8IMVmnTr0I8=
Date: Mon, 13 Apr 2026 11:30:24 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 22/29] media: mc: Add MEDIA_LNK_FL_VALIDATE_LATE
Message-ID: <ady3Ud_eoN9CTalK@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-23-sakari.ailus@linux.intel.com>
 <adjR6lJWKDdg4tBZ@zed>
 <adyiV0UtYSrlzcK4@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adyiV0UtYSrlzcK4@kekkonen.localdomain>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58649-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3776C3E9E1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Mon, Apr 13, 2026 at 10:59:19AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Fri, Apr 10, 2026 at 12:41:27PM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Wed, Apr 08, 2026 at 06:39:31PM +0300, Sakari Ailus wrote:
> > > Add MEDIA_LNK_FL_VALIDATE_LATE flag to support late validation of links.
> > > This is serving the use case where video devices are configured and
> > > started streaming indepenently of each other but this sequence may be run
> >
> > s/indepenently/independently
>
> Yes.
>
> >
> > > in series, in such a way that a video device in a pipeline starts
> > > streaming before another one is configured.
> > >
> > > Before this flag, drivers have resorted to implementing the link
> > > validation separately for the video nodes as part of streaming start
> > > sequence.
> > >
> > > media_pipeline_start() shall be called on each leaf entity connected to
> > > the graph with a link where MEDIA_LNK_FL_VALIDATE_LATE is set before
> > > uphardware operation.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../media/mediactl/media-ioc-setup-link.rst   |  4 +
> > >  .../media/mediactl/media-types.rst            |  5 ++
> > >  drivers/media/mc/mc-entity.c                  | 82 ++++++++++++++++++-
> > >  include/uapi/linux/media.h                    |  1 +
> > >  4 files changed, 88 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> > > index 23208300cb61..7c2bced57e77 100644
> > > --- a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> > > +++ b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> > > @@ -49,6 +49,10 @@ Only links marked with the ``DYNAMIC`` link flag can be enabled/disabled
> > >  while streaming media data. Attempting to enable or disable a streaming
> > >  non-dynamic link will return an ``EBUSY`` error code.
> > >
> > > +Pipeline validation may be delayed for links marked with the ``VALIDATE_LATE``
> >
> > Is it helpful to say "created" instead of "marked" to highlight that
> > this flag is set by drivers or is it clear enough from the context ?
>
> How about:
>
> Pipeline validation may be delayed for links with the ``VALIDATE_LATE`` flag set
> until actual hardware operation even if the rest of the pipeline would be
> validated at an earlier point of time.
>

Nice, thanks

> >
> > > +flag until actual hardware operation even if the rest of the pipeline would be
> >
> > operation or operations ?
>
> I'd use singular in referring what the hardware does as a whole here, but I
> can rework the sentence, too.
>

Oh ok, no worries, as long as it was intentional it's fine

> >
> > > +validated at an earlier point of time.
> > > +
> > >  If the specified link can't be found the driver returns with an ``EINVAL``
> > >  error code.
> > >
> > > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > index 6332e8395263..d6a690655a01 100644
> > > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > @@ -391,6 +391,7 @@ must be set for every pad.
> > >  .. _MEDIA-LNK-FL-ENABLED:
> > >  .. _MEDIA-LNK-FL-IMMUTABLE:
> > >  .. _MEDIA-LNK-FL-DYNAMIC:
> > > +.. _MEDIA-LNK-FL-VALIDATE-LATE:
> > >  .. _MEDIA-LNK-FL-LINK-TYPE:
> > >
> > >  .. flat-table:: Media link flags
> > > @@ -410,6 +411,10 @@ must be set for every pad.
> > >         -  The link enabled state can be modified during streaming. This flag
> > >  	  is set by drivers and is read-only for applications.
> > >
> > > +    *  -  ``MEDIA_LNK_FL_VALIDATE_LATE``
> > > +       -  The validation of the link may be delayed up to until the start of
> >
> > Not an English native speaker here, but "delayed up to until" sounds more
> > complicated than just "delayed to"
>
> Yes, but I don't think it's grammatically nor factually correct. :-)
>
> How about:
>
>        -  The validation of the link may be delayed from the pipeline start but
> 	  it is done no later than starting streaming on the hardware.
>

Fine with me, up to you :)

> >
> > > +	  hardware operation.
> > > +
> > >      *  -  ``MEDIA_LNK_FL_LINK_TYPE``
> > >         -  This is a bitmask that defines the type of the link. The following
> > >  	  link types are currently supported:
> > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > index 287eded356bb..5b0162f81425 100644
> > > --- a/drivers/media/mc/mc-entity.c
> > > +++ b/drivers/media/mc/mc-entity.c
> > > @@ -771,7 +771,7 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
> > >  static int
> > >  __media_pipeline_validate_one(struct media_pad *origin,
> > >  			      struct media_pad *pad, struct media_link *link,
> > > -			      bool *has_enabled_link)
> > > +			      bool *has_enabled_link, bool skip_validation)
> > >  {
> > >  	struct media_device *mdev = origin->graph_obj.mdev;
> > >  	struct media_entity *entity = pad->entity;
> > > @@ -784,6 +784,9 @@ __media_pipeline_validate_one(struct media_pad *origin,
> > >  	if (has_enabled_link)
> > >  		*has_enabled_link = true;
> > >
> > > +	if (skip_validation)
> > > +		return 0;
> > > +
> > >  	/* Skip validation if the current pad isn't the sink pad of the link. */
> > >  	if (link->sink != pad)
> > >  		return 0;
> > > @@ -825,11 +828,48 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
> > >  		return -EINVAL;
> > >
> > >  	/*
> > > -	 * If the pipeline has already been started, it is guaranteed to be
> > > -	 * valid, so just increase the start count.
> > > +	 * Increase start count on pipelines that have been validated
> > > +	 * earlier. Also check links with the VALIDATE_LATE flag here.
> > >  	 */
> > >  	if (pipe->start_count) {
> > > +		struct media_link *link;
> > > +
> > > +		link = __media_entity_next_link(origin->entity, NULL,
> > > +						MEDIA_LNK_FL_DATA_LINK);
> > > +		if (link && link->flags & MEDIA_LNK_FL_VALIDATE_LATE) {
> > > +			struct media_link *link2 =
> > > +				__media_entity_next_link(origin->entity, link,
> > > +							 MEDIA_LNK_FL_DATA_LINK);
> > > +			bool has_enabled_link = false;
> > > +
> > > +			/*
> > > +			 * Only a single pad is allowed for VALIDATE_LATE
> > > +			 * links. That pad needs to have exactly one link.
> > > +			 */
> > > +			if (origin->entity->num_pads != 1)
> > > +				return -EINVAL;
> > > +
> > > +			if (!link || link2)
> > > +				return -EINVAL;
> >
> > This is a development error, isn't it ? Is it worth an error message ?
>
> Actually the !link check can be removed from here as it is already checked
> earlier.
>
> >
> > > +
> > > +			dev_dbg(mdev->dev,
> > > +				"Validating pad '%s':%u late\n",
> > > +				origin->entity->name, origin->index);
> > > +
> > > +			ret = __media_pipeline_validate_one(link->sink,
> > > +							    link->sink, link,
> > > +							    &has_enabled_link,
> > > +							    false);
> > > +			if (ret)
> > > +				return ret;
> > > +
> > > +			if (origin->flags & MEDIA_PAD_FL_MUST_CONNECT &&
> > > +			    !has_enabled_link)
> > > +				return -ENOLINK;
> > > +		}
> > > +
> > >  		pipe->start_count++;
> > > +
> > >  		return 0;
> > >  	}
> > >
> > > @@ -873,12 +913,19 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
> > >  		 * the connected sink pad to avoid duplicating checks.
> > >  		 */
> > >  		for_each_media_entity_data_link(entity, link) {
> > > +			/* Skip late-validated links not connected to origin. */
> > > +			bool skip_validation =
> > > +				link->flags & MEDIA_LNK_FL_VALIDATE_LATE &&
> > > +				link->sink != origin &&
> > > +				link->source != origin;
> > > +
> > >  			/* Skip links unrelated to the current pad. */
> > >  			if (link->sink != pad && link->source != pad)
> > >  				continue;
> > >
> > >  			ret = __media_pipeline_validate_one(origin, pad, link,
> > > -							    &has_enabled_link);
> > > +							    &has_enabled_link,
> > > +							    skip_validation);
> > >  			if (ret)
> > >  				goto error;
> > >  		}
> > > @@ -1158,6 +1205,33 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
> > >  	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
> > >  		return -EINVAL;
> > >
> > > +	/*
> > > +	 * With the late validate flag, either source or sink shall have exactly
> > > +	 * one pad and no links before this one. Similarly, no links may be
> > > +	 * added to entities with a single pad and an existing late-validated
> > > +	 * link.
> > > +	 */
> > > +	if (flags & MEDIA_LNK_FL_VALIDATE_LATE) {
> > > +		if (!(source->num_pads == 1 && !source->num_links) &&
> > > +		    !(sink->num_pads == 1 && !sink->num_links))
> > > +			return -EINVAL;
> >
> > Ah, so the above error check for which I suggested an error message
> > cannot happen, right ?
>
> Indeed.
>
> >
> > > +	} else {
> > > +		struct media_entity *entities[] = { source, sink };
> > > +
> > > +		for (unsigned int i = 0; i < ARRAY_SIZE(entities); i++) {
> > > +			if (entities[i]->num_pads != 1)
> > > +				continue;
> > > +
> > > +			struct media_link *__link =
> > > +				__media_entity_next_link(entities[i], NULL,
> > > +							 MEDIA_LNK_FL_DATA_LINK);
> > > +
> > > +			if (__link &&
> > > +			    __link->flags & MEDIA_LNK_FL_VALIDATE_LATE)
> > > +				return -EINVAL;
> > > +		}
> > > +	}
> > > +
> > >  	link = media_add_link(&source->links);
> > >  	if (link == NULL)
> > >  		return -ENOMEM;
> > > diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> > > index 1c80b1d6bbaf..c96e2118ea99 100644
> > > --- a/include/uapi/linux/media.h
> > > +++ b/include/uapi/linux/media.h
> > > @@ -219,6 +219,7 @@ struct media_pad_desc {
> > >  #define MEDIA_LNK_FL_ENABLED			(1U << 0)
> > >  #define MEDIA_LNK_FL_IMMUTABLE			(1U << 1)
> > >  #define MEDIA_LNK_FL_DYNAMIC			(1U << 2)
> > > +#define MEDIA_LNK_FL_VALIDATE_LATE		(1U << 3)
> >
> > Nice, with the above minors addressed, if applicable
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> Thank you!
>

Thanks
   j

> >
> > >
> > >  #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
> > >  #  define MEDIA_LNK_FL_DATA_LINK		(0U << 28)
>
> --
> Kind regards,
>
> Sakari Ailus
>

