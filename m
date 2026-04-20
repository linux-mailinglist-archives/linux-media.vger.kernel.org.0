Return-Path: <linux-media+bounces-59182-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOU+CRSg5mmyywEAu9opvQ
	(envelope-from <linux-media+bounces-59182-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 23:52:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 749EB434624
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 23:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DB16300B461
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 21:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1113C4553;
	Mon, 20 Apr 2026 21:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHZMWvLD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154E3384253
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 21:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776721935; cv=none; b=k8bgbc+Y6Ni+zg9DlIwqQfFkcd5zuNpF3uC74CPGKfdrDnoNz03K841aosKdEeyep8E3VIH82AOBnbugOVAUaCpNGSQsJAfX7oU40fg4sArbPDTSAIiTiXECsYW9YcqK5oYTobQ4Ekm+ghKdiFsTtQKLfMd+sY27Ia5kIxsR3zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776721935; c=relaxed/simple;
	bh=6smdwP0R3o+p+UfI2UKDe7dOXSMsI5pj6HRO+wrnhFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PE/LeIbZDw/O+Q2T1FaTn+xphyAs8XuM9ijqgd09MQ8nFO2Plm6B/u87L5rJ6ZqQSTNYFMm9msgM2CCEmqV5ICoeG0U60VQl3hm42DpgDeCQEUYE6bhaGzDFMXLUXmg7C8dcboLPMUkD+TGeNerLkBk35XPZnvHKxd+5viWrtv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHZMWvLD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776721933; x=1808257933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6smdwP0R3o+p+UfI2UKDe7dOXSMsI5pj6HRO+wrnhFw=;
  b=NHZMWvLD3R7REVdPe5CE1GkxBFUnGo0htv5AWy1IALWplDct7uvf3e5M
   1x2575iE6XR4G7s5fHkvwAvcKduywPAg4NzpXwgaQhiayfLPwNWowaA1U
   4Bf/CIiS0BvfSCYmHiN0sAZru/uwukL/EyF/VNn4jii6g9kCcXoTufZBF
   lIMrhHakmxlJzWHToZaqL4z1BazGmA+R1IeUuyeTQ5GfObu9d0SPmtynp
   qrn9scG4as2Af725UBVDAKvXf73q+mnYppnwoJC1WX6++QTzWggHOObF1
   rqeLP5C8noymfnn4n7+0nSy8uo5UatHj5v/UgmmLvUeqYRkaWXxN5P0/U
   A==;
X-CSE-ConnectionGUID: dO5kW1JvQAai8+IVeoD1dQ==
X-CSE-MsgGUID: xGCH3HrWSAy7gBG8IdhFrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="103109275"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="103109275"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 14:52:12 -0700
X-CSE-ConnectionGUID: Ofve+EoXROSZ97vqmN0WsQ==
X-CSE-MsgGUID: 1isBp9CGR8qVV4pYthVzNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="236834230"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.228])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 14:52:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6D69A11FA58;
	Tue, 21 Apr 2026 00:52:08 +0300 (EEST)
Date: Tue, 21 Apr 2026 00:52:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: Re: [PATCH 1/1] media: Documentation: Improve PIXEL_RATE control
 documentation
Message-ID: <aeagCB125re6m0Hm@kekkonen.localdomain>
References: <20260414103559.1021712-1-sakari.ailus@linux.intel.com>
 <ad5d_I4LGrLLEVK2@zed>
 <ad6OuAisjkvnesdz@kekkonen.localdomain>
 <ad-RcFZO67FgrIqx@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad-RcFZO67FgrIqx@zed>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59182-lists,linux-media=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 749EB434624
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

On Wed, Apr 15, 2026 at 03:35:39PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, Apr 14, 2026 at 10:00:08PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Tue, Apr 14, 2026 at 05:46:51PM +0200, Jacopo Mondi wrote:
> > > Hi Sakari
> > >
> > > On Tue, Apr 14, 2026 at 01:35:59PM +0300, Sakari Ailus wrote:
> > > > Document explicitly that the PIXEL_RATE control reflects the actual
> > > > frequency at which the pixels are read in the pixel array. It is thus
> > > > orthogonal to analogue binning.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > > > index 6d516f041ca2..8616bcd67270 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > > > @@ -41,6 +41,11 @@ Image Process Control IDs
> > > >      The configuration of the frame rate is performed by selecting the desired
> > > >      horizontal and vertical blanking. The unit of this control is Hz.
> > > >
> > > > +    Note that this control isn't affected by analogue binning as the pixels are
> > > > +    still being read at the same frequency as without analogue binning, only
> > > > +    what is being read is different (a single pixel value vs. a binned pixel
> > > > +    value based on the values of two or more pixels).
> > > > +
> > >
> > > This breaks the model implemented to support "special" (aka analogue
> > > ?) binning mode on imx219 where we double the pixel rate to express an
> > > higher frame rate and halve the blanking values before writing them to
> > > registers
> >
> > Note that this patch is a clarification to the existing documentation, not
> > a change as such. It was never expected to be used as it is currently in
> > the imx219 driver.
> >
> > >
> > > I guess we have to keep this mode working not to break existing
> > > userspace, also because it's the only way we can have it working
> > > without the introduction of the FLL and LLP controls.
> >
> > The other option is indeed to leave the HBLANK as-is but based on a
> > discussion with Jai I decided to write a patch to remove the rate
> > multiplier. Overall I'd say it'd be better to change this now rather than
> > leave imx219 using a different interface behaviour than the rest.
> >
> 
> imx219 is PiCamera module v2, it's very popular, I would be careful
> changing it. If I'm not mistaken (please confirm) your series now
> require userspace to program FLL and LLP in units of two lines when
> using binning. What would happen to existing userspace with the new
> version ?

The unit of LLP and FLL are pixels and lines, respectively. Please see my
other reply <aeaVsZQVHsqlOtGP@kekkonen.localdomain>. This patch isn't
directly related to the imx219 driver, the purpose here was to define it in
a way that left no room for interpretation.

The imx219 driver is a different discussion as it does affect an existing
UAPI.

> 
> Again, I would defer it to Dave as the maintainer.
> 
> > >
> > > With the new model and FLL and LLP controls, I presume analog binning
> > > would require userspace to program halved FLL and LLP values ?
> >
> > The userspace would in fact use LLP and FLL as the sensor does, there's no
> > need to divide or multiply these values with another variable.
> >
> > >
> > > Currently in your proposal of V4L2_CID_BINNING_FACTORS it doesn't seem
> > > there is a way to distinguish between  a digital and an analogue
> > > binning mode, they're both 2x2 so I guess it's the driver that has to
> > > realize that if FLL and LLP are smaller the [output width + blank] it
> > > has to activate the analogue binning mode ?
> >
> > The driver is indeed responsible for setting the limits for FLL and LLP (or
> > blanking) controls depending on binning and analogue cropping
> > configuration, a sensor supporting analogue binning is not a special case
> > as such.
> 
> Maybe I wasn't clear
> 
> The imx219 supports 2 different 2x2 binning modes
> 
> #define IMX219_BINNING_X2		0x01
> #define IMX219_BINNING_X2_ANALOG	0x03
> 
> We currently use X2_ANALOG unconditionally, and your patches do not
> change this, I agree.
> 
> My thinking was in general, is there a need to distinguish between a
> 2x2 digital binning and a 2x2 analog binning ? Does the new API allow
> to do so ?

I think we'd need a new control to do that, if we needed to tell them
apart. I'm fairly certain we'll never need the digital option.

-- 
Kind regards,

Sakari Ailus

