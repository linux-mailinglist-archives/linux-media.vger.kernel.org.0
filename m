Return-Path: <linux-media+bounces-60971-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKRQBadC/mkZogAAu9opvQ
	(envelope-from <linux-media+bounces-60971-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 22:08:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D784FB586
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 22:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F4603035A9B
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 20:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10593ECBEE;
	Fri,  8 May 2026 20:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fyU84/Me"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293E735F163
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 20:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778270881; cv=none; b=CIqXTO9nQ/H6UIL2AMNEPESzy58G3tS4/YGmQILqlpgV6sGF+HbDhbM82y1azhSSc8H/KnizdSqaRSavths0Kn5qgWsaPByZSngXSGa7Sm1RZpWcyLGZd5uVgR4jSe30i7aACl37M5PGb2IHR2PC+ONP/P2EgGLh9TXmeWgoxd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778270881; c=relaxed/simple;
	bh=C09w3l7Ktj5WP8f13NQhm7n2bOPpk6qR9cdhv8doShs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlvNfaW30Ht/Ebc9uDSyRl5Swydk/lgmvPTlV3Y/4qUhmxRsLjRyPsZgHYdJfOsehh7Nr5jmurrA79DHH4xcmOHl3uraFsbiHEJuSMrbZS6yP3doUAe7iy1U8kppWFFMlaeaqpGgsU5VeZj14CP8mB8YnmTM7/K648tw7y9rGS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fyU84/Me; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C8CBBCA;
	Fri,  8 May 2026 22:07:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778270872;
	bh=C09w3l7Ktj5WP8f13NQhm7n2bOPpk6qR9cdhv8doShs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fyU84/MeZy7Ypaw/pqJTHidMqkwi7k4NGlxiFtKfkRPdTl2UsaBr0Ry6UgjHs995V
	 GU7hdbtmlX7IYclkc6dUZ08pHkaSq/t89UPKON8PsEWPlhPV/42hx2Ig5JP+qtu9yw
	 6JkSS2CtsoCOyTSFteLfVtRjyUgnnh6ieEb3eZgk=
Date: Fri, 8 May 2026 23:07:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 1/2] media: mc-entity: Fix documentation typo in function
 name
Message-ID: <20260508200756.GE2186850@killaraus.ideasonboard.com>
References: <20260506165438.1767378-1-laurent.pinchart@ideasonboard.com>
 <af4K5RFxKAWkAcwf@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <af4K5RFxKAWkAcwf@lizhi-Precision-Tower-5810>
X-Rspamd-Queue-Id: 67D784FB586
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60971-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 12:10:13PM -0400, Frank Li wrote:
> On Wed, May 06, 2026 at 07:54:37PM +0300, Laurent Pinchart wrote:
> > The media_entity_pads_init() function name is misspelled. Fix it.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Nit: suggest put real functions name in subject.
> 
> documentation typo in media_entity_pads_init()

I've left it out to avoid a too long subject. If the person picking this
patch (Sakari ?) would prefer adding it I'm fine with that too.

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> > ---
> >  include/media/media-entity.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > index b91ff6f8c3bb..904f61c14dc1 100644
> > --- a/include/media/media-entity.h
> > +++ b/include/media/media-entity.h
> > @@ -726,7 +726,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >   * the entity (currently, it does nothing).
> >   *
> >   * Calling media_entity_cleanup() on a media_entity whose memory has been
> > - * zeroed but that has not been initialized with media_entity_pad_init() is
> > + * zeroed but that has not been initialized with media_entity_pads_init() is
> >   * valid and is a no-op.
> >   */
> >  #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> >
> > base-commit: 3cd9b7011519c3fffffb7b6752fc7603be52dc1d

-- 
Regards,

Laurent Pinchart

