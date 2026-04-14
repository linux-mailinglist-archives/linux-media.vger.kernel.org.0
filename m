Return-Path: <linux-media+bounces-58767-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OeJJu2O3mkrFwAAu9opvQ
	(envelope-from <linux-media+bounces-58767-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 21:01:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B133FDE4B
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 21:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 414E630552BC
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 18:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BED277026;
	Tue, 14 Apr 2026 18:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJ+h+Aiy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AB8269CE6
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776193193; cv=none; b=BP6xQxy7uQwG0XNMJpCobYwYQHLpdEx9iWN6+3eeiEm3BE4MvunjJbcW3wDUGh5qogJt5Qexpbpa4vnD77/Tu01JcP5skjhRjGKoJopYzOZ7jCAJrEASgS/8/fnLaHJqpFqDmsmBZaZvYWbLZVSmkayyI0icvzUlaNG42RmX/rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776193193; c=relaxed/simple;
	bh=e593CbZ1DdiQILDn/cuGVfI/i57yqinsPW7ynD0DQPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Exayuj6BUE8Ixx0tELLN/iXhKjsPMUQ4zEMZRMjQwn5QuGYK5Nyp5BcDEN+WZwuVhDwsj/NFgjQRnwi+fB6BvyOIckxOWNaSFE/OY10z850RAtEzq3zYNUkMzCb8lnIFSKnzqlqSSVm8X6THxV0C3J8Qpp2x6hWkW8xOrEg0/uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJ+h+Aiy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776193192; x=1807729192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e593CbZ1DdiQILDn/cuGVfI/i57yqinsPW7ynD0DQPI=;
  b=CJ+h+AiyNGfjmZT6Q5qZ05w7//BmXc5SzAk3pJCeNaw1id1sooDtAfWp
   D4DaglPxFqjJymsseSfYq+hKFeWtR/q71f1D38Te13nKO4XYNhwaoPWKi
   vxrtG81mmHe+1tTw2VPM6OcATwRau+YWZtrulx38X4vv/im/7ALD2DtHn
   kXPHMrDRd1zYvuYM96WfyQ50dbS/KLioTebevek5xiyphSjEgEM2mezuF
   mXUu12ocTbnXoeqDr+R8UROKU3AbF7DCc2PTS8jHTLdBx6VSsRQpKI6iw
   ngYFtFiAQQza1IF3nRGDZBvrzikaXJFr14SRNXFdFdjTfh/5WWbB3hmOI
   g==;
X-CSE-ConnectionGUID: mVzhN76xQ8GXwWGk4msJSg==
X-CSE-MsgGUID: HQnr9VGHQFyRiJHEqly/Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77236449"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77236449"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 11:59:51 -0700
X-CSE-ConnectionGUID: ezSXyR65SfyeW/AVhfQHAA==
X-CSE-MsgGUID: iFg7Mz3AS0qmP10O7fZ62w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227532194"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.3])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 11:59:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5D99F121CD9;
	Tue, 14 Apr 2026 22:00:08 +0300 (EEST)
Date: Tue, 14 Apr 2026 22:00:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: Re: [PATCH 1/1] media: Documentation: Improve PIXEL_RATE control
 documentation
Message-ID: <ad6OuAisjkvnesdz@kekkonen.localdomain>
References: <20260414103559.1021712-1-sakari.ailus@linux.intel.com>
 <ad5d_I4LGrLLEVK2@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad5d_I4LGrLLEVK2@zed>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58767-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92B133FDE4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

On Tue, Apr 14, 2026 at 05:46:51PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, Apr 14, 2026 at 01:35:59PM +0300, Sakari Ailus wrote:
> > Document explicitly that the PIXEL_RATE control reflects the actual
> > frequency at which the pixels are read in the pixel array. It is thus
> > orthogonal to analogue binning.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > index 6d516f041ca2..8616bcd67270 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > @@ -41,6 +41,11 @@ Image Process Control IDs
> >      The configuration of the frame rate is performed by selecting the desired
> >      horizontal and vertical blanking. The unit of this control is Hz.
> >
> > +    Note that this control isn't affected by analogue binning as the pixels are
> > +    still being read at the same frequency as without analogue binning, only
> > +    what is being read is different (a single pixel value vs. a binned pixel
> > +    value based on the values of two or more pixels).
> > +
> 
> This breaks the model implemented to support "special" (aka analogue
> ?) binning mode on imx219 where we double the pixel rate to express an
> higher frame rate and halve the blanking values before writing them to
> registers

Note that this patch is a clarification to the existing documentation, not
a change as such. It was never expected to be used as it is currently in
the imx219 driver.

> 
> I guess we have to keep this mode working not to break existing
> userspace, also because it's the only way we can have it working
> without the introduction of the FLL and LLP controls.

The other option is indeed to leave the HBLANK as-is but based on a
discussion with Jai I decided to write a patch to remove the rate
multiplier. Overall I'd say it'd be better to change this now rather than
leave imx219 using a different interface behaviour than the rest.

> 
> With the new model and FLL and LLP controls, I presume analog binning
> would require userspace to program halved FLL and LLP values ?

The userspace would in fact use LLP and FLL as the sensor does, there's no
need to divide or multiply these values with another variable.

> 
> Currently in your proposal of V4L2_CID_BINNING_FACTORS it doesn't seem
> there is a way to distinguish between  a digital and an analogue
> binning mode, they're both 2x2 so I guess it's the driver that has to
> realize that if FLL and LLP are smaller the [output width + blank] it
> has to activate the analogue binning mode ?

The driver is indeed responsible for setting the limits for FLL and LLP (or
blanking) controls depending on binning and analogue cropping
configuration, a sensor supporting analogue binning is not a special case
as such.

> 
> 
> >  ``V4L2_CID_TEST_PATTERN (menu)``
> >      Some capture/display/sensor devices have the capability to generate
> >      test pattern images. These hardware specific test patterns can be

-- 
Kind regards,

Sakari Ailus

