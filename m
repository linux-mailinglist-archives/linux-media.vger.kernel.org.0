Return-Path: <linux-media+bounces-58549-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOe8HPTz2GlJkAgAu9opvQ
	(envelope-from <linux-media+bounces-58549-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 14:58:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C733D7C99
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 14:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B62C5300888E
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DDF344046;
	Fri, 10 Apr 2026 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5P/Y4Re"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA40283FDD
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825812; cv=none; b=Ll6FAzKbi3Rk/ALdxKQ+0bNfljtC9NUtr7R7ISbCjlUOE7to1qu+CmxnNqYAjVEJNdLNZWYtx4LhaEHzm00lRT4cBz7b+iMAFZymVedHVdm/1DQ+HHM1PJANOhyzNDZS+SGxwRaiTrzjqgC+HaBvcAmuQ/kQUweTLCjSl+7GWvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825812; c=relaxed/simple;
	bh=MbzarjFhlcj9MXK89dFXel+in2wEe7xnai45TB579gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4cZQBuZlPiDx8i5v1a4OmwstbT9hxKa/eRkugA4WKEQ2AEPUtukOJx5vGtZFRQ2Qz+2ghboT9bj5DmJOM8W571G39ndpM4A8kaM7oTu3kckSQziRweaBYuPrbOFgwmFHaT/MY+uGQb/SUdBkj434u/tmJL9P9C7OFLut7H0ASk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5P/Y4Re; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775825811; x=1807361811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MbzarjFhlcj9MXK89dFXel+in2wEe7xnai45TB579gs=;
  b=D5P/Y4ReHUzD2FaqMkM/oVaNlKyXzFej1ZIcYu5k2q5N+OsP9GXtp1JR
   MgVmELDbQaGjX/y+vLeR5iHvZyNd8MEpqbXmt4ZUH8Qg921/5xAje/J7i
   L4INP38M3VYgSH+HQiqXCyKEwlaz3u5SFde4aDqjocTQUHxnUibqK8FfF
   Hx3QsX53t9LiCxPNU71wjSzgVtHTp8ytz4cxEe4TP6RPxQke81uEXdNIc
   WZh0WkJ/OTcfUOzyIw61dcGpwzgiYh7ARrRLKIwgVK8tT13s2peKIyOzq
   7OssIJ460jjjb3yoGJ88EUCvTQ1ywki402PT0U2feIk9Lsfh4++b3/t8u
   Q==;
X-CSE-ConnectionGUID: /F8X36UuRLqFeLbRhDQqpQ==
X-CSE-MsgGUID: j0336JI6Q5uXpU8x6XnV1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76721897"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76721897"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 05:56:51 -0700
X-CSE-ConnectionGUID: NLPNx4pBQCGFBCkPx0B7Sw==
X-CSE-MsgGUID: 6eWYLYqdRi+FqwqgnzTZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="233159407"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 05:56:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C033911FA4F;
	Fri, 10 Apr 2026 15:56:58 +0300 (EEST)
Date: Fri, 10 Apr 2026 15:56:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 21/29] media: mc: Don't care about unsettable flags in
 MEDIA_IOC_LINK_SETUP
Message-ID: <adjzmjukGeTesBYr@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-22-sakari.ailus@linux.intel.com>
 <adjPiWt-UFsf0h7h@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adjPiWt-UFsf0h7h@zed>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58549-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[30];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E9C733D7C99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

Thanks for the review.

On Fri, Apr 10, 2026 at 12:31:58PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, Apr 08, 2026 at 06:39:30PM +0300, Sakari Ailus wrote:
> > The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
> > flags that are set by the driver are correctly set as the driver expects.
> 
> I would
> 
> The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
> flags that are not configurable are not modified by userspace.

Sounds good.

> 
> > This poses a problem for adding new flags as programs could not work with
> > links that have unknown flags even when the use of these flags wouldn't
> > affect the program.
> >
> > Ignore the non-settable link flags.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/mc/mc-entity.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 717569bd1a8c..287eded356bb 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -1319,7 +1319,7 @@ static int __media_entity_setup_link_notify(struct media_link *link, u32 flags)
> >
> >  int __media_entity_setup_link(struct media_link *link, u32 flags)
> 
> Let me get this right: "link" comes from userspace. "flags" are the
> flags set by driver when creating the link, right ?

It's the other way around; this is called via MEDIA_IOC_SETUP_LINK IOCTL.

> 
> >  {
> > -	const u32 mask = MEDIA_LNK_FL_ENABLED;
> > +	const u32 settable_flags = MEDIA_LNK_FL_ENABLED;
> >  	struct media_device *mdev;
> >  	struct media_pad *source, *sink;
> >  	int ret = -EBUSY;
> > @@ -1327,9 +1327,9 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
> >  	if (link == NULL)
> >  		return -EINVAL;
> >
> > -	/* The non-modifiable link flags must not be modified. */
> > -	if ((link->flags & ~mask) != (flags & ~mask))
> > -		return -EINVAL;
> > +	/* Only allow changing user-settable flags. */
> > +	flags &= settable_flags;
> > +	flags |= link->flags & ~settable_flags;
> >
> >  	if (link->flags & MEDIA_LNK_FL_IMMUTABLE)
> 
> If my above understanding is correct and if you drop the above check,
> doesn't this mean userspace can now clear MEDIA_LNK_FL_IMMUTABLE ?
> 
> Should link->flags be replaced by "flags" here ?

The intent here is to drop whatever non-settable flags the user provided
and replace them with what is set on the link.

> 
> >  		return link->flags == flags ? 0 : -EINVAL;
> 
> And this should probably be changed as well. Unfortunately, if we
> want to allow userspace to ignore the forthcoming MEDIA_LNK_FL_VALIDATE_LATE
> flag I guess we need to make it an exception (which is not great, I know).
> 
> Hope I got it right...
> 

-- 
Regards,

Sakari Ailus

