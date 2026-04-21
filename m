Return-Path: <linux-media+bounces-59208-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KMFMCpR52mL6gEAu9opvQ
	(envelope-from <linux-media+bounces-59208-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 12:27:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E19F34397E6
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 12:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 081BE301D078
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 10:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301533B19B2;
	Tue, 21 Apr 2026 10:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFCpAeWD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214E839FCDE
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767267; cv=none; b=U8SPSoaazcH79hrRmHKhEomL1nglHC17nl3EzJUZYA7Bg/YlYa1OymYDMvX5qtLUtAqBmuJOI2qbW4nvLrrMwqcSBocX1AIX30Webvs230Qj5hCAQs1pM7hTk5y7bJ6mlMjYeDWRY4KQdZspCYEIdNDCGQeWLGU+cb7dxf1iZlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767267; c=relaxed/simple;
	bh=2BFG78IAgikYabN4/CLeIrIyHSZ1FNQhsAAOeDN6bsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSWpxW8aVH4Ni4ot1OsRa4+u0Jj+pIbhAkSMD+L4S9hAn9pLSFbdVocps3uOOdvoo00149S/9yNvp7o2be3RQPMLtdrJcozbPdaQGkFdMSqFfpo2XgIGIsZKzOq+hUqJYobps+tPNDUdt6xh6cqUwStpzyJzHwNE/nX6GG/Chj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFCpAeWD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776767266; x=1808303266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2BFG78IAgikYabN4/CLeIrIyHSZ1FNQhsAAOeDN6bsw=;
  b=fFCpAeWDTS5TAAVhvA5/DtgBWmtua3Jmgd0MdnXtOiYiPJy4xcUjV7vp
   b4UzQdFs8XNks1EpML4sH/d6m9eSFjUAHoSUzsFLQK8McN7Tbobo5LLuZ
   ctNsTYyIRHJeLslGiWbBYtvY3MyQ8tthkDBDWvWL+KMPBQh8Lq6AM/Rk1
   hQj/s42i/ElWM5zAGv1lR/k1605M82yyk90XqsSByPlxfc2ZdJai3vvw4
   6RpT2rAegX1lqswEjod5LW5qB+q6NNjqH0vif577m1bBVs6Vlr/O7UoF3
   bv2kfFbpbA9jWGjMm1eMeF+VhZ+gYyo2DazQXyVPzphFYO2N8RPtKecE8
   g==;
X-CSE-ConnectionGUID: 1d6QLWx4TuyRW2bAdtK1iQ==
X-CSE-MsgGUID: wOyvdaZjTCeIXn/PBIlZ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="65233122"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="65233122"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 03:27:45 -0700
X-CSE-ConnectionGUID: 4af0l8wWRU62LwBfm1Ypuw==
X-CSE-MsgGUID: G4lUtymTShuQ2z75JTErAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="228837342"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.56])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 03:27:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E72EC120D05;
	Tue, 21 Apr 2026 13:27:36 +0300 (EEST)
Date: Tue, 21 Apr 2026 13:27:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
Subject: Re: [PATCH v4 20/29] media: uapi: Bump the STREAMS bit a little
Message-ID: <aedRGEfS6KHODSXK@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-21-sakari.ailus@linux.intel.com>
 <adjDJdB6rBscZ-lZ@zed>
 <20260416143112.GL1775831@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416143112.GL1775831@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-59208-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: E19F34397E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Thu, Apr 16, 2026 at 05:31:12PM +0300, Laurent Pinchart wrote:
> On Fri, Apr 10, 2026 at 11:31:06AM +0200, Jacopo Mondi wrote:
> > On Wed, Apr 08, 2026 at 06:39:29PM +0300, Sakari Ailus wrote:
> > > Bump the V4L2_SUBDEV_CAP_STREAMS by one bit up, order to avoid confusing
> > > libcamera with streams that has moved forward from the original libcamera
> > > implementation. The bit can presumably be taken into use but only after
> > > the other free bits.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Thanks!
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > 
> > > ---
> > >  include/uapi/linux/v4l2-subdev.h | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > > index 2347e266cf75..6160c3e21436 100644
> > > --- a/include/uapi/linux/v4l2-subdev.h
> > > +++ b/include/uapi/linux/v4l2-subdev.h
> > > @@ -196,8 +196,11 @@ struct v4l2_subdev_capability {
> > >  /* The v4l2 sub-device video device node is registered in read-only mode. */
> > >  #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
> > >
> > > +/* Reserved, old STREAMS bit libcamera used before API stabilisation. */
> > > +/* #define V4L2_SUBDEV_CAP_STREAMS_PRELIMINARY	0x00000002 */
> > 
> > This should make sure libcamera versions which support the new flag
> > won't match agains older kernel which use the old value!
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Could we delay merging this patch until we work on implementing the new
> behaviour in libcamera ?

I guess we're not in hurry to merge this although I don't see the direct
connection to libcamera. Are you worried someone could start using this bit
instead before wget things entirely stabilised? :-)

> 
> > > +
> > >  /* The v4l2 sub-device supports routing and multiplexed streams. */
> > > -#define V4L2_SUBDEV_CAP_STREAMS			0x00000002
> > > +#define V4L2_SUBDEV_CAP_STREAMS			0x00000004
> > >
> > >  /*
> > >   * Is the route active? An active route will start when streaming is enabled
> 

-- 
Kind regards,

Sakari Ailus

