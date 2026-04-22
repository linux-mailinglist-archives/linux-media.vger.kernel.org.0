Return-Path: <linux-media+bounces-59302-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM5RLe6d6GlNNQIAu9opvQ
	(envelope-from <linux-media+bounces-59302-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:07:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B41F84446D8
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96E193016EFC
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D041E2882B7;
	Wed, 22 Apr 2026 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNoYBKqL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E692D2773F0
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 10:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776852163; cv=none; b=YuugyLNEDSPIgyNHP1vL6z+Ri1ANfEtVwj9v5xY+mNtLWjQ4OQIq9oY023f2npRdpY4ngDj2PTAQAHCjZOCawlfwpu0wMK/MIJtWlvtGQrDXupoq9vB7DOEOH/yicjGMoQG9lQBpHOdaIFfQLPJlzQwW8L2YS90bSHvJaxHVaWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776852163; c=relaxed/simple;
	bh=8rSPTkgBl6E457KXlDb4MEPXFqmnvG+rhlt1hTRGWrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzIj28z9e3fb77qgcpa5IxnpxZnT42iVTdvO9hCeQnDKIidW2aYaqcZtZAdWJHlopM0qSVPUc8vmxqVzu7bpK5zPJHY8bXHy3/cE7Ub9x/rKbG/adBTPPUtLM/5AkN4k+I8U+Zc8XAV980IciqbFUtRNUp7cx4jO9WLfNJ9NHNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNoYBKqL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776852162; x=1808388162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8rSPTkgBl6E457KXlDb4MEPXFqmnvG+rhlt1hTRGWrs=;
  b=KNoYBKqLf9IDIwP5/myQhwmXkzep4vg1PLXHeFzu2bk5D2Q2h4aBh12I
   Q7sLcu2XG07rgLZ4hz0X5V9bSxzq4PkKpF4qm4aiCK529lH/Djkqrt+Qd
   jatDb45VOYSw97gROYkLVc7xT8uYX+AHcrbEaikHBHF316AMHVyWn0QzY
   6XGMeYHZ5iX/wAdW74+5Usm2l9v6PUf3R6nhofsPrwLh6IzqC03cEaSsf
   oFXADUlqIixKrNOnyYMFK7CBmxmDebfTuFGUDsvzIShYPBmQADS0R3jK3
   4R5eDV904wGh8kfCbQNW4wuAxm54rIk9lc5qeFso5DrBtkYkj5g2rmYt2
   w==;
X-CSE-ConnectionGUID: yw8Va0CnTFa+DegYEGMFCQ==
X-CSE-MsgGUID: OmRfFnUHSvGpRFTGnbgsAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="81412142"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="81412142"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 03:02:42 -0700
X-CSE-ConnectionGUID: TUjFrSoqTuCaV2SJ40IGXw==
X-CSE-MsgGUID: iv15sD3uT4ub/JmhJTHDOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="270413435"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 03:02:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1A6D3120D05;
	Wed, 22 Apr 2026 13:02:32 +0300 (EEST)
Date: Wed, 22 Apr 2026 13:02:32 +0300
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
Subject: Re: [PATCH v4 24/29] media: v4l2-subdev: Introduce
 v4l2_subdev_get_frame_desc()
Message-ID: <aeicuM9S6_x1zNpb@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-25-sakari.ailus@linux.intel.com>
 <adjWaqk9qO7CWM5W@zed>
 <adykK0JxoIoZjWUT@kekkonen.localdomain>
 <20260416161654.GC1823068@killaraus.ideasonboard.com>
 <aedrEm-Mh21TnJ4N@kekkonen.localdomain>
 <20260421221817.GF2315844@killaraus.ideasonboard.com>
 <aeiGUIFh3UOp6ksw@kekkonen.localdomain>
 <20260422090256.GA2807981@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422090256.GA2807981@killaraus.ideasonboard.com>
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
	TAGGED_FROM(0.00)[bounces-59302-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B41F84446D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 12:02:56PM +0300, Laurent Pinchart wrote:
> > > > > > > > +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > > > > > > > +			       struct v4l2_mbus_frame_desc *desc)
> > > > > > > > +{
> > > > > > > > +	struct v4l2_subdev_format subdev_fmt = {
> > > > > > > > +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > > > > > > > +		.pad = pad,
> > > > > > > > +	};
> > > > > > > > +	int ret;
> > > > > > > > +
> > > > > > > > +	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> > > > > > > > +		unsigned int type = desc->type;
> > > > > > > > +
> > > > > > > > +		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
> > > > > > > > +
> > > > > > > > +		if (desc->type != type)
> > > > > > > > +			return -EINVAL;
> > > > > 
> > > > > I'd add a dev_err() here. There are .get_frame_desc() callers that check
> > > > > if the returned type matches what they expect and log an error
> > > > > otherwise. When using this helper the check can't be performed in the
> > > > > callera any more, leading to possibly hard to debug issues if no message
> > > > > is printed.
> > > > 
> > > > dev_err_once()?
> > > 
> > > Is there a need to limit it to printing the message once only ? It will
> > > only occur if an incompatible source is connected, which shouldn't
> > > happen in normal circumstances.
> > 
> > Yes, but still enables filling logs with that message. A single one in this
> > case should be enough.
> 
> Is it user-triggerable without a serious bug in drivers ?

No. But one message still tells about the problem, doesn't it?

-- 
Sakari Ailus

