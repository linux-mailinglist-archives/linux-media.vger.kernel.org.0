Return-Path: <linux-media+bounces-49714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A1ECE9A7C
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11C9A3016BBB
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 12:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD192280A21;
	Tue, 30 Dec 2025 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/+CRRH4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410B23D76
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767097892; cv=none; b=bobU4jcfdN0A7y/i/yzdOdB76jnocKTwSirq6KC2jXvK3+N+LY2MzmTo0TjZzlzzpkWgqd0iAAjPYc06TalGy51zkpBSvrjdzrkDthgpUQLUnwHXKJ45sg7KPcyIMczYKy49cjhv18ymLdh/9mM8Y746B8GzvGkxlR7P65Elr7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767097892; c=relaxed/simple;
	bh=LoZSHJT7ahZYDELHl8Nnf4AQRDV+MPB+wHfg+hTZXoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urlPCd95TR6p6MiwYrdjhtuuQ0KZfj1KxQcszwJ+qbEgc13hFuOsWvYWK2my81WuxEO1LPxTHHPZ7i0pLmwyytnqhfWKENwwoJFE8/hPgiPlp91dScPG0E0MFaryKxDWyp5cjeeEQgtF/kscKgt6TFpYCo++fjjdTTy//oqwaPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/+CRRH4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767097890; x=1798633890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LoZSHJT7ahZYDELHl8Nnf4AQRDV+MPB+wHfg+hTZXoI=;
  b=Q/+CRRH4xYHMgvavCzKtZfsLvjgiBBCdhmK2qwa6kQp2iJEaqbxXtLpy
   0win7tqDaDnwRq1cTMwg0ypaTkxPlIrFy4FN9YixNNapYKiFT0Nr/SHlp
   kwB9R0iLvjbl1szdnbmQDsfYsOR6frPbUArxzHEKx64J1fsv3dGz/sYtp
   oqrHkM1NJUkfpC8mzoGaxgdOy9OXNkEhl5PxvKMALgqm/wYSXG0EsEQ/L
   1hhCbqkz+WiEVIq6XHkjb/7pJGbDiU83Riefav8VUcVbygcu5o9kXaVBf
   TBUYczPjG43mPvE7o2OBUPFJZlLjcFe+46yGA8UH632wojAnpRqMisaYM
   Q==;
X-CSE-ConnectionGUID: u/4prQU+R3WzIXAQZOchSg==
X-CSE-MsgGUID: MKsXFvyHRYenrqLB49ac0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="86265722"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="86265722"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:31:29 -0800
X-CSE-ConnectionGUID: bIVtfteCRBiRmCim3SZlVg==
X-CSE-MsgGUID: dXzHSvyNTjmoUHcIcoptxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201675799"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:31:29 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6DF4711F8E7;
	Tue, 30 Dec 2025 14:31:36 +0200 (EET)
Date: Tue, 30 Dec 2025 14:31:36 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com, antti.laakso@linux.intel.com
Subject: Re: [PATCH 08/13] media: ipu6: Drop error argument from
 ipu6_isys_stream_start()
Message-ID: <aVPGGCUCHYm_k5ym@kekkonen.localdomain>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
 <20251219095829.2830843-9-sakari.ailus@linux.intel.com>
 <gnvl3gi7dgwghfzmyt34lzhojqtgkw2h7evlgbcx565d7amfus@3nzkxci5otnd>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gnvl3gi7dgwghfzmyt34lzhojqtgkw2h7evlgbcx565d7amfus@3nzkxci5otnd>

Hi Mehdi,

Thanks for the review.

On Tue, Dec 23, 2025 at 02:47:10PM +0100, Mehdi Djait wrote:
> Hi Sakari,
> 
> Thank you for the patch!
> 
> On Fri, Dec 19, 2025 at 11:58:24AM +0200, Sakari Ailus wrote:
> > error argument for ipu6_isys_stream_start() is always false, remove the
> > argument.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> > index dcad6aafee29..db533d45d994 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> > @@ -290,7 +290,7 @@ ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
> >  
> >  /* Start streaming for real. The buffer list must be available. */
> >  static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
> > -				  struct ipu6_isys_buffer_list *bl, bool error)
> > +				  struct ipu6_isys_buffer_list *bl)
> >  {
> >  	struct ipu6_isys_stream *stream = av->stream;
> >  	struct device *dev = &stream->isys->adev->auxdev.dev;
> > @@ -336,10 +336,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
> >  out_requeue:
> >  	if (bl && bl->nbufs)
> >  		ipu6_isys_buffer_list_queue(bl,
> > -					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING |
> > -					    (error ?
> > -					    IPU6_ISYS_BUFFER_LIST_FL_SET_STATE :
> > -					     0), error ? VB2_BUF_STATE_ERROR :
> > +					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING,
> 
> is IPU6_ISYS_BUFFER_LIST_FL_SET_STATE still needed after this patch ?

It isn't. I'll remove it as well and post v3 soon.

-- 
Kind regards,

Sakari Ailus

