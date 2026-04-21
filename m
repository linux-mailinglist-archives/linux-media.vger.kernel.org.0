Return-Path: <linux-media+bounces-59224-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GfzL1ma52kV+QEAu9opvQ
	(envelope-from <linux-media+bounces-59224-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 17:40:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F11CE43CD96
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 17:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15E21304A9CF
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 15:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE5B2BD01B;
	Tue, 21 Apr 2026 15:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDuUItre"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7153829D267
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776785716; cv=none; b=dBypwggvO4HRYc2OFiIlmsSZhSdWmRdYVi2Fp3B/iMuk7MGHn2x12ZpDflPHb8WAhBWsJSM1kKIa3njS5k50k021S3V4+v+apyFhnFN/0SrsDAyJ8DmxSqtVT+hZzuwzPLXfKhNJgmYGLTfTIOCtMxVpczgzT6ndfrMhpWcKqOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776785716; c=relaxed/simple;
	bh=fu97RcVB3I8cgcN8T32yl3gshZeoXvY/V3dz9NsAdMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9pf0DKRJ8atbPhvYhGjT3/oxP09aH5gfaMEGgEObN2pfAAje999Y8ZBFikWPKo0gNX1/uBECCxqT+PSr2SX8HjCnd8u0kkS2HKC8Xbwwolm9+1CMULFc4/g1FR70lXxAUVR1RiZDuWIgH1QdJ9T4uOxMBWJEyRjlMdsQos1hzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDuUItre; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776785714; x=1808321714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fu97RcVB3I8cgcN8T32yl3gshZeoXvY/V3dz9NsAdMI=;
  b=hDuUItreUipitqevH+aY0dkFJVr6uZHgA/xk87O/jDYz2/I+gnahHCHB
   jt7pAal7PkjbdTNsau5yKzy1uP2cu7k1ec5M8BiTMa4sMXPyEUDcofqtF
   uUyVh+7ya6gL1gGHTljrJGL7X6X/qT550uGYj7DaJDA1VWVQR1tDcKxvW
   enEOau7+A4mYhjMB9Ry5xA4txT9Fh431v8Br6s3olTJwDRRQoBiimxsSK
   IgGXb+TdDpDZS1amIOMGfHRDIqxCHg4HaG4ZmkX5zf9w3s9DsRzGNEo8l
   o0Ug452fZcAXFS3YaFpDZKn9M/sgBgwC0pjDgk681iuDkkfBXDT0LUVLM
   g==;
X-CSE-ConnectionGUID: vrR9QPwSRQaKwLaMcHEQ9A==
X-CSE-MsgGUID: 4lsPmb/RQeGb5SoxiYaKLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77842964"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77842964"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 08:35:13 -0700
X-CSE-ConnectionGUID: eTUj090fTVm4ua6GfG/COA==
X-CSE-MsgGUID: c7Ah61JiQNu9lBMLt2jSDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="237053630"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 08:35:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5637E120D05;
	Tue, 21 Apr 2026 18:35:05 +0300 (EEST)
Date: Tue, 21 Apr 2026 18:35:05 +0300
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
Subject: Re: [PATCH v4 23/29] media: Improve enable_streams and
 disable_streams documentation
Message-ID: <aeeZKTf4Rr7-Ht3E@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-24-sakari.ailus@linux.intel.com>
 <20260416154914.GA1823068@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416154914.GA1823068@killaraus.ideasonboard.com>
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
	TAGGED_FROM(0.00)[bounces-59224-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,ideasonboard.com:email]
X-Rspamd-Queue-Id: F11CE43CD96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Thu, Apr 16, 2026 at 06:49:14PM +0300, Laurent Pinchart wrote:
> On Wed, Apr 08, 2026 at 06:39:32PM +0300, Sakari Ailus wrote:
> > Document that enable_streams may start additional streams and
> > disable_streams may not disable requested streams if other related streams
> > are still enabled.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > ---
> >  include/media/v4l2-subdev.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index d256b7ec8f84..4588992b4417 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -814,6 +814,10 @@ struct v4l2_subdev_state {
> >   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
> >   *	argument.
> >   *
> > + *	Starting the requested streams may require starting additional
> > + *	streams. Streams that are started together due to hardware are called a
> > + *	stream group.
> > + *
> >   * @disable_streams: Disable the streams defined in streams_mask on the given
> >   *	source pad. Subdevs that implement this operation must use the active
> >   *	state management provided by the subdev core (enabled through a call to
> > @@ -823,6 +827,9 @@ struct v4l2_subdev_state {
> >   *	Drivers that support only a single stream without setting the
> >   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
> >   *	argument.
> > + *
> > + *	A stream group is disabled when one or more streams in the stream
> > + *	group are disabled.
> 
> This contradicts the commit message. Did you mean that a stream group
> will be disabled when all the streams it contains are disabled ?

It was meant to say that a stream group will stop streaming once all
streams have been disabled. I'll fix this for v5.

> 
> >   */
> >  struct v4l2_subdev_pad_ops {
> >  	int (*enum_mbus_code)(struct v4l2_subdev *sd,
> 

-- 
Regards,

Sakari Ailus

