Return-Path: <linux-media+bounces-59209-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG4ZOURV52nz6gEAu9opvQ
	(envelope-from <linux-media+bounces-59209-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 12:45:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAD8439B16
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 12:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A50630146A8
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 10:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3852C11D5;
	Tue, 21 Apr 2026 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bW5xDT1i"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902893126BF
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 10:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768289; cv=none; b=KfWqd+kLUQGvKEwZdVqclVLMU9rc/8L0gnjeZwu1RFTh4rwT2ARasH0MagaIsJzZT+kuc8CSIwYgFQTy0LkuEXdA/txfjw832dvU/LFRT9/VTC8b74iz7FHGmDqtQQK5YIzZhigcLghs/7UeDDpD7rzCzEgXCYozlLbzWpxb080=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768289; c=relaxed/simple;
	bh=GQend2Cgn5EM7xVdLjt3ih7b+wHBHkdLVANh50/gFF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwrZBezZFZUr3y1GUFbOFzTinxI9mMACifxOs2BfEiVGy0u8dOIxU0lKcT8Oj7PFUwFZwFSewQzlDoOyxOihX7QcCF/e1GQzSsWVT2L5bGy1OM4ERSoOSRIE3PTL8EjJkGKXMHg3IECbHEhTZlz7p2znu5r3p/plbsHH5v6rTH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bW5xDT1i; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776768286; x=1808304286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GQend2Cgn5EM7xVdLjt3ih7b+wHBHkdLVANh50/gFF8=;
  b=bW5xDT1iCbk9q6wQbj5d1wlVD9KtJVFoLUBaGD8LMq1EjvZGJ4A7bXop
   Vrrf0Z8w6nIYv8SF+aN5AQRQtSoyivJxilzHCkW72R6BdTrbFDYMHv+dz
   Kq8mdlXWzq5HR3Wu1C4x9rdpRixFLwtag4mpdb8gLTc55MNH6K0gBo04g
   IPbRYyb927K6fvcirAU4P7SeZGjEQ5BCUSbCg3z/kQW5rd9VpIbdEPcbp
   OF+RgXA7RQfjjnIciQ0hGZUeHO17FDgCBBQHf2gxRhh8QGmsYkyUOBGHY
   LKbSeNG2yRhBJunlz4gy47m+a16H7hrhHTNndW9idu5M+YvSh+Gq3VElk
   Q==;
X-CSE-ConnectionGUID: jjJ4iWCNR0uieBmPyo09lg==
X-CSE-MsgGUID: G7t5YW3PREiakV13VZOOJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76860789"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="76860789"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 03:44:45 -0700
X-CSE-ConnectionGUID: ZFKYkPcNRlu/KdbZb7ULdg==
X-CSE-MsgGUID: 78W3KSdVS0Wdk8fXwbkonQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="231908575"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.56])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 03:44:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DAE5A120D05;
	Tue, 21 Apr 2026 13:44:36 +0300 (EEST)
Date: Tue, 21 Apr 2026 13:44:36 +0300
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
Subject: Re: [PATCH v4 21/29] media: mc: Don't care about unsettable flags in
 MEDIA_IOC_LINK_SETUP
Message-ID: <aedVFMLiINDWRh45@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-22-sakari.ailus@linux.intel.com>
 <20260416155917.GB1823068@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416155917.GB1823068@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-59209-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: EEAD8439B16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Thu, Apr 16, 2026 at 06:59:17PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Apr 08, 2026 at 06:39:30PM +0300, Sakari Ailus wrote:
> > The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
> > flags that are set by the driver are correctly set as the driver expects.
> > This poses a problem for adding new flags as programs could not work with
> > links that have unknown flags even when the use of these flags wouldn't
> > affect the program.
> 
> I suppose applications could be instructed to preserve the flags they
> don't know about, but some existing applications probably don't do that.
> 
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
> 
> Now that the link can be configured with different flags than the ones
> set by userspace, I think the ioctl should return the actual link flags.

I'll do that for v5.

> 
> >  
> >  	if (link->flags & MEDIA_LNK_FL_IMMUTABLE)
> >  		return link->flags == flags ? 0 : -EINVAL;
> 

-- 
Regards,

Sakari Ailus

