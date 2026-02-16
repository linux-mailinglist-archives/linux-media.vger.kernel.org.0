Return-Path: <linux-media+bounces-52936-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDWRGrOMk2mK6QEAu9opvQ
	(envelope-from <linux-media+bounces-52936-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 22:31:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C708B147B9A
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 22:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D26BD301F4A4
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 21:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FBE212F98;
	Mon, 16 Feb 2026 21:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbBhnIcT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C87946C
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 21:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771277483; cv=none; b=hCKENyXvdJqcj3c4GztWIZ3ygCRTHn6NaR6rVgqbYWffcK0iWAAFhJKAOvU8oNoa0jwtRepoUfKSNFPQ6HQg+t20gH6euGb7UiZlfxaB5YWJB3cj+ReCG95+hGPGmldRrVHq87J2rFJsdgQTtztcSTlsd+o7fN3QrT8qxxv8Yk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771277483; c=relaxed/simple;
	bh=5m+Ucg72eGCvYJZKdm1ss6BqJB4ICbEMU5932/dypP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ME8qAPRFNkMcG8qLATQhO2SKALiVZWkoPtcXVDI0UttE651nxtrfdImjA+r0PiTDoqEaBzcVbf/ixcCH9TjNE0tz0UNXVhxGHyiR+nreQDZQfCHymRchykoeBpG+OTWfUXUSlpzZnluUJH4ROIEM43GPA42X7uUTmaa6QRq68cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbBhnIcT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771277482; x=1802813482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5m+Ucg72eGCvYJZKdm1ss6BqJB4ICbEMU5932/dypP0=;
  b=lbBhnIcTDznuMmHuGucrJzl8OW0D8JlEKSFZi69OhsDKgdbnrwYDpnwu
   H0M7xgqznWXlllvra7SaqEbU3MMhZhqy2a5rYR6wsQHx4KEPuWr1l4biI
   xp4+YgwyD/wdW6u+ePZXe5A8Q7xtuCu8oFZk5u5a6k95UFw+w/TKnn0Py
   XKK3kEfUJZFmMHP02kWYQ3FUcpaBLoZxtnADMEXfQ3+2RfA5wnzjyBe9P
   nRttmhDnvTj0ZjknR9KLrA1jcnqpPIMQOjV9afOq9Yky8JQY5KQYzf1bY
   E8SLJ5YU0WZtLs7sJqtFAleWdSd0eSAMzC/QsN8pR3Mu3beQ0EplGpuhK
   w==;
X-CSE-ConnectionGUID: PNp+WMRbSmuVUK3zrzwIcA==
X-CSE-MsgGUID: 9dKHnI+1RQG8GcOU0fA8yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="76207914"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="76207914"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 13:31:21 -0800
X-CSE-ConnectionGUID: iXY3b/DNTpOJCAmTTexigA==
X-CSE-MsgGUID: BF/cs8H9SvK34dMVnZz/PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="244294568"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.46])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 13:31:15 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BC618121D2E;
	Mon, 16 Feb 2026 23:31:35 +0200 (EET)
Date: Mon, 16 Feb 2026 23:31:35 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 08/14] media: mc: Don't care about unsettable flags in
 MEDIA_IOC_LINK_SETUP
Message-ID: <aZOMt2HC4T-1ZTa7@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-9-sakari.ailus@linux.intel.com>
 <f1898c37-276f-4e20-98ab-ee8f5f3e686a@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1898c37-276f-4e20-98ab-ee8f5f3e686a@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52936-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: C708B147B9A
X-Rspamd-Action: no action

Hi Mirela,

On Mon, Feb 16, 2026 at 03:55:15PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 2/11/26 11:09, Sakari Ailus wrote:
> > The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
> > flags that are set by the driver are correctly set as the driver expect.
> expect->expects
> > This poses a problem for adding new flags as programs could not work with
> > links that have unknown flags even when the use of these flags wouldn't
> > affect the program.
> > 
> > Ignore the non-settable link flags.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/media/mc/mc-entity.c | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index b29b519237d6..cf72bfb8885c 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -1378,7 +1378,7 @@ static int __media_entity_setup_link_notify(struct media_link *link, u32 flags)
> > 
> >   int __media_entity_setup_link(struct media_link *link, u32 flags)
> >   {
> > -       const u32 mask = MEDIA_LNK_FL_ENABLED;
> > +       const u32 settable_flags = MEDIA_LNK_FL_ENABLED;
> >          struct media_device *mdev;
> >          struct media_pad *source, *sink;
> >          int ret = -EBUSY;
> > @@ -1386,10 +1386,6 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
> >          if (link == NULL)
> >                  return -EINVAL;
> > 
> > -       /* The non-modifiable link flags must not be modified. */
> > -       if ((link->flags & ~mask) != (flags & ~mask))
> > -               return -EINVAL;
> > -
> >          if (link->flags & MEDIA_LNK_FL_IMMUTABLE)
> >                  return link->flags == flags ? 0 : -EINVAL;
> > 
> > @@ -1403,6 +1399,10 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
> >              (media_pad_is_streaming(source) || media_pad_is_streaming(sink)))
> >                  return -EBUSY;
> > 
> > +       /* Only allow changing user-settable flags. */
> > +       flags &= settable_flags;
> > +       flags |= link->flags & ~settable_flags;
> > +
> 
> The immutable check now compares before filtering, previously this was after
> the filtering. Is this change intentional?

Indeed; this patch looked different earlier and I forgot to move the
condition back to where it was. I'll do that for v3.

-- 
Regards,

Sakari Ailus

