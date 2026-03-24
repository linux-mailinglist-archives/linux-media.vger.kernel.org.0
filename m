Return-Path: <linux-media+bounces-56835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGoYBCJdwmlKcAQAu9opvQ
	(envelope-from <linux-media+bounces-56835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:45:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B10305D15
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91B8430BA108
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEEF3DE445;
	Tue, 24 Mar 2026 09:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L11xPVqT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335503DE444;
	Tue, 24 Mar 2026 09:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345098; cv=none; b=JqibvGb7LKp6EOipyykb8POm0OUeHXPZZBn2WbyEV2JyoicrfT02NUvKTe6cX4rEdV/dM4M7CW2+UArIbZd97aeKLiZO6OKsz8L0v6nf7xGBA7eLqMb8f74XC1cICRUwWJRM7vYjHsJVea7gC5WeP8CINqKU6xrwQbyIdDck3RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345098; c=relaxed/simple;
	bh=VTMaO7KKMD5/VJbzqpc0nYT1u2BoPwWytiRM+7mqsPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0RYQi/XpGMpg1hb3POhQ4Y0EbHpBJdYku3ITpILzqSeKFeT4L4mev1eJv52RUmXIjicC6BgRzFkIzEnds3f31x1T2PH9SYnUMja86DBTvG9mVhzjhEHkSySHbpEfXcFw4L0uoeusW0QwjtD1EliVNXSpMjJCnRAmpvhzyDe6JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L11xPVqT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774345095; x=1805881095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VTMaO7KKMD5/VJbzqpc0nYT1u2BoPwWytiRM+7mqsPA=;
  b=L11xPVqTz5UE2MicsWzP2tbq7UYqXcSMpjLMq4WGGSY1Qap9wQD9K/wP
   ovMq3fmIZDXVO5WZd1RGQtPyfzXrs4ODdWfiVFSW/kIAvkNv/vdaqos/d
   5ytvZBeJ5Uj4RJvftC+83vR5Px2Ae1yfbP7onSRz+B81qgsUriitj6/gL
   g4Nh3iP60Bc7wyQbjnBBHc7evZ+QF/f248TM6/MFvZ4mFMWAutZRi0QiE
   DZBHqYRX6pR9CSAuqEMx4seiG9FTd3/Ll1mK+VtWi+r+NvFJCPZoOafPt
   /lnz1+1rg/pjdDrMKRQz27dPorcoiXng4eDNcN9mGE4SN7ziB+ZL8H1xi
   A==;
X-CSE-ConnectionGUID: SUhD6vq1QMSxXeLsVeV0DA==
X-CSE-MsgGUID: vTT/qifPQlKWL3yDVLELRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75472353"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75472353"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 02:38:14 -0700
X-CSE-ConnectionGUID: K+9nreRqRjKe6MYJglQkHA==
X-CSE-MsgGUID: Dttpec5pTOulT3+z+97dKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247933680"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 02:38:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F03F3121CFF;
	Tue, 24 Mar 2026 11:38:15 +0200 (EET)
Date: Tue, 24 Mar 2026 11:38:15 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Suraj Sonawane <surajsonawane0215@gmail.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5647: handle V4L2_CID_LINK_FREQ in s_ctrl
Message-ID: <acJbh5v8H28q1B_h@kekkonen.localdomain>
References: <20260322135348.11339-1-surajsonawane0215@gmail.com>
 <CAPY8ntAKzB42sNzW+FV283rHktD3OEE9cePS4Dg1iihJtB3nyA@mail.gmail.com>
 <acGHeFMGJVuUXVkm@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acGHeFMGJVuUXVkm@zed>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[raspberrypi.com,gmail.com,jmondi.org,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56835-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 30B10305D15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

On Mon, Mar 23, 2026 at 07:44:23PM +0100, Jacopo Mondi wrote:
> Hi Dave
> 
> On Mon, Mar 23, 2026 at 03:37:37PM +0000, Dave Stevenson wrote:
> > Hi Suraj
> >
> > On Sun, 22 Mar 2026 at 13:59, Suraj Sonawane
> > <surajsonawane0215@gmail.com> wrote:
> > >
> > > Handle V4L2_CID_LINK_FREQ in ov5647_s_ctrl().
> > >
> > > Currently this control is defined but not handled in s_ctrl(),
> > > so V4L2 falls back to estimating link frequency from pixel rate
> > > and prints warning like:
> > >
> > >   v4l2_get_link_freq: Link frequency estimated using pixel rate:
> > >   result might be inaccurate
> > >   v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ
> > >   in the transmitter driver
> > >
> > > Handle it as no-op since link frequency is fixed per mode and
> > > not meant to be changed at runtime.
> >
> > I'm confused by this description compared to the patch.
> >
> > v4l2_get_link_freq searches for the V4L2_CID_LINK_FREQ control, and if
> > found then it calls g_ctrl (not s_ctrl).
> > If it can't find the control then it searches for V4L2_CID_PIXEL_RATE
> > and will log the error message quoted.
> >
> > The control is registered by the ov5647 driver, therefore it should
> > never go into that second clause, so how have you got that error
> > message logged?
> >
> > AFAIK no part of that code path will result in a call to ov5647_s_ctrl
> > that you're patching.
> > I've just run with the ov5647 driver on a Pi5 (which uses
> > v4l2_get_link_freq) running 7.0.0-rc5, and I can't get an error
> > logged. v4l2_get_link_freq finds V4L2_CID_LINK_FREQ and uses the value
> > it reports.
> >
> >
> > You are right that ov5647_s_ctrl doesn't handle V4L2_CID_LINK_FREQ,
> > which could mean that an error is returned from the __v4l2_ctrl_s_ctrl
> > calls from within the driver to change the link frequency and lead to
> > the dev_info in the driver being logged iff the sensor was powered up
> > at the time (otherwise pm_runtime_get_if_in_use will fail). Generally
> > the sensor won't be powered on as the pad format is set before
> > enable_streams, and it shouldn't be possible to change it whilst
> > streaming.
> >
> > However, as I understand it, the current preferred way to handle this
> > case of read only controls where the value is changed by the driver is
> > to pass NULL as the ops for the ctrl when registering. That is already
> > the case looking at c6e115144b50 ("media: i2c: ov5647: Add
> > V4L2_CID_LINK_FREQUENCY control"). So how are you managing to get
> 
> I was about to mention the same. Setting the ctrl ops to NULL is
> preferred for controls not handled by the driver.

Yes, indeed that's the other option. It makes sense in this case.

> 
> I'm surprised I didn't see any merged patch that address the many
> faulty i2c drivers we have which manually handle the read-only
> controls in their s_ctrl implementation!
> 
> We should WARN if a Read-Only control is registered with a valid
> ops pointer maybe

There may still be side effects from the value change the driver should
handle. I guess it could take place through other means, too, but I think
I'd keep it as-is.

-- 
Regards,

Sakari Ailus

