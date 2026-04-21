Return-Path: <linux-media+bounces-59222-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFLpDvqN52m89wEAu9opvQ
	(envelope-from <linux-media+bounces-59222-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 16:47:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3400443C471
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 16:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C64330459F5
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 14:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EAB3D88ED;
	Tue, 21 Apr 2026 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMfrFhGe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6148332601
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 14:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782565; cv=none; b=spnpNb5Msz81wdrFvcXnz86/FA14gGEcPUrJmzTTgwXRJRC0Dr4hwQpL/FvlX59eadHhcC9ZmEVu9q460T/37HoBlQ4qWtVlv+Q4GGtn6J5mPYR8BHlfzaakotQM9ZblUbKFN5jLT2KY5iMSwX3B1Vs7jSL5hi4/PJAPUHyRZVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782565; c=relaxed/simple;
	bh=mownSQvKrZV16pSAQKMfYS9AnScPPIcfCxCatjG4FYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0A0sD76Ku6jAMYTyfmDxwU5ncL9++Rl4MlyfFmEWiU6FzBdSHXfc7iJRZlkJqQzc2zXeBy+OCf4wIdCU6TxC2BS3oT+dmVtw6VQdb+QCGvrXDS3uB7aSplP4J/3zTkNOetOOP5PlNKeDkXi8pBRrJaafF10DkdIWHsvVjce+os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMfrFhGe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776782563; x=1808318563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mownSQvKrZV16pSAQKMfYS9AnScPPIcfCxCatjG4FYg=;
  b=KMfrFhGek6KmQgRh+Vzjj27quoUREwmTlD9vx91hjX+oa3DXPWYagrPN
   gcwn/lkxqxzeN2FbOQw3RJBiJ5WELMypTsAG47ECiN+GWjGzlReGypFNi
   t9156+G93HgnubMwfupJaTAbTz+9czInDyv5cfODNB6ta3L+MV09GpOBo
   Vny0ALESzXyfmeBHEUhn/ieKHl0TWb5U7tV9I0sAYP+mWJC99SN0ksz9x
   YSRidItpIi40ZTM4mX4FNOHb8JJC3Sc9eOqPf0ozfCHdLXHiKh+4DGPAU
   8WOg+WWycNnI69bT6eyIdmCzJcHz//lXvS9BmL8Wo6SJf857EkEG83q4W
   g==;
X-CSE-ConnectionGUID: UigUstRJTaKeBH7NwDYmKA==
X-CSE-MsgGUID: 4OZVRQweTiWj9JeBuGuJhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="100373824"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="100373824"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 07:42:42 -0700
X-CSE-ConnectionGUID: i9ef7dTWSJuiilEtxHPYcA==
X-CSE-MsgGUID: OnAuGHaOSHagI3ss4yXmBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="227727009"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 07:42:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 08DEE120D05;
	Tue, 21 Apr 2026 17:42:34 +0300 (EEST)
Date: Tue, 21 Apr 2026 17:42:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 14/29] media: Documentation: Improve LINK_FREQ
 documentation
Message-ID: <aeeM2YSXe91IVJPF@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-15-sakari.ailus@linux.intel.com>
 <20260416150503.GN1775831@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416150503.GN1775831@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59222-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 3400443C471
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Thu, Apr 16, 2026 at 06:05:03PM +0300, Laurent Pinchart wrote:
> On Wed, Apr 08, 2026 at 06:39:23PM +0300, Sakari Ailus wrote:
> > Add a reference to the LINK_FREQ control and clarify the meaning of the
> > control as for C-PHY the matter is less obvious.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  Documentation/driver-api/media/tx-rx.rst                      | 3 ++-
> >  .../userspace-api/media/v4l/ext-ctrls-image-process.rst       | 4 +++-
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> > index 22e1b13ecde9..7df2407817b3 100644
> > --- a/Documentation/driver-api/media/tx-rx.rst
> > +++ b/Documentation/driver-api/media/tx-rx.rst
> > @@ -93,7 +93,8 @@ where
> >     * - variable or constant
> >       - description
> >     * - link_freq
> > -     - The value of the ``V4L2_CID_LINK_FREQ`` integer64 menu item.
> > +     - The value of the :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` integer64
> > +       menu item.
> >     * - nr_of_lanes
> >       - Number of data lanes used on the CSI-2 link.
> >     * - 2
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > index 6d516f041ca2..ee88933256dd 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > @@ -24,7 +24,9 @@ Image Process Control IDs
> >  .. _v4l2-cid-link-freq:
> >  
> >  ``V4L2_CID_LINK_FREQ (integer menu)``
> > -    The frequency of the data bus (e.g. parallel or CSI-2).
> > +    The fundamental frequency of the operating symbol rate (serial interfaces
> 
> While this is absolutely correct, I think it will confuse most readers
> more than the existing text. Do you think that mentioning that, for
> CSI-2, the frequency is equal to 1 / (2 * UI) would help ?

I'll add that for v5.

> 
> > +    such as CSI-2) or the sampling rate (parallel interfaces such as DVP or
> > +    Bt.565) of the data interface.
> >  
> >  .. _v4l2-cid-pixel-rate:
> >  
> 

-- 
Regards,

Sakari Ailus

