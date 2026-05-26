Return-Path: <linux-media+bounces-62754-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM3pFQ1ZFWp7UgcAu9opvQ
	(envelope-from <linux-media+bounces-62754-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:25:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C18925D26F3
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 947EB3022563
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 08:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742BE3B774A;
	Tue, 26 May 2026 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUP+45EU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011092C181
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779783941; cv=none; b=ppc81RPVWJlGdVnySq7BGXHw7ejqowX0naJmkP6ouMmRA8STCgjtvY5MqTsc0cW23a8VEzwCfWEYxD7jrX3RhQ5LLqWdiJTFZCcZC8wFhyGkpkn0y5YfxpF9HiVhL4MrGr36w1UgQOU+23uIALg3D7zc1Id44sRyv+RXJUxsTzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779783941; c=relaxed/simple;
	bh=Sy/DJCITrRp7ad+gFaje8cxTkjdbRFEmrCf2KT5HMlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVsyTVwQaMECw7loCJxCeniu7ahO6LWcnEdAouhA65MbrueVx+okAnstHhLOMXnvOM+43MBBM48Bao8VOTr+fvfW50N4KBsJsuGMRCi7iVIKg92q+XpB/VWh1CxBnsqHBPbqYj/cG8rNrE0vg1yGfEXT2ic81YM4GOTXcu0BRwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUP+45EU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779783940; x=1811319940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sy/DJCITrRp7ad+gFaje8cxTkjdbRFEmrCf2KT5HMlI=;
  b=AUP+45EUOoeCTxAZJw8+x+cctyVAtUbol8pzgZuYqGlpnc9iT6mJAb/H
   zNPp+tlhgO6JldIL8/N0SjVsgTWaZZxYiIed9quAEHsMKZ/AVarHgQea0
   +Pve45nX4cL5koCkekKcLht/Fnbnnw/AJ7FIp/dIfrSa0QnVtCFNJem6O
   zKqGyWV5IkwUJBS7tzLTOKScvZsG/Cj/u5aTuALc8YRPKoVUNjm2l3RI+
   4iQghMe6luORzc7rBYD3Gj0CseJxiqUFqXYg8pk11jkgh2lRLb3h+Ih/l
   OXUsKp6tpdaZNnP7D3qdBu/UL2qsxjfcAEFWMkiHBytvUOF1ymE3VFJns
   g==;
X-CSE-ConnectionGUID: Dp/hqB1YRAujUaCQxuJ80w==
X-CSE-MsgGUID: A8LwG6bgQV+Q3uyMtFRGcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80625437"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80625437"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 01:25:39 -0700
X-CSE-ConnectionGUID: ZQx+MEUcSF+NheFaMAYZqg==
X-CSE-MsgGUID: KN2kI0y3RJOGAlECiMWggA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="265456675"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.122])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 01:25:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A55A911F93A;
	Tue, 26 May 2026 11:25:36 +0300 (EEST)
Date: Tue, 26 May 2026 11:25:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] staging: media: ipu3-imgu: Ensure correct binary
 selection
Message-ID: <ahVZAJrW8RxpWe8U@kekkonen.localdomain>
References: <20260522225402.247080-1-sakari.ailus@linux.intel.com>
 <CANiDSCtH7treRe_2Y7h9YoiAfRGXZoX9pHNpLhcaoT2qS5+mFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtH7treRe_2Y7h9YoiAfRGXZoX9pHNpLhcaoT2qS5+mFA@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62754-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C18925D26F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

On Mon, May 25, 2026 at 05:08:51PM +0200, Ricardo Ribalda wrote:
> Hi Sakari
> 
> 
> 
> On Sat, 23 May 2026 at 00:55, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > The ImgU has two sets of binaries, those that support striping (fixed at
> > 2) and those that don't. There's overlap between the stripes and so that
> > implies a minimum width for the images themselves, or the Bayer downscale
> > rectangle in particular.
> >
> > Take this account in binary selection.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi Ricardo,
> >
> > I'm not sure if this makes smatch happy but it somehow addresses the issue
> > it found. In the end it's up to the userspace to configure this
> > correctly...
> 
> Smatch should be calmed now:
> 
> https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/c32fe4c4918c9aa49f61359e3b42619c4d8686de

I dislike that because it's written simply to appease smatch and does not
properly even try to address a problem. Can you try to revert it once
this patch is merged? At the very least we need a comment on why that check
is there.

> 
> But if you want to add more tests, you are of course welcome :)
> 
> >
> > Compile tested only.
> >
> > - Sakari
> >
> >  drivers/staging/media/ipu3/ipu3-css.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
> > index 8063401246fb..3e4e03a8fa3a 100644
> > --- a/drivers/staging/media/ipu3/ipu3-css.c
> > +++ b/drivers/staging/media/ipu3/ipu3-css.c
> > @@ -1613,6 +1613,12 @@ static int imgu_css_find_binary(struct imgu_css *css,
> >                     in->height > bi->info.isp.sp.input.max_height)
> >                         continue;
> >
> > +               /* Check the striping overlap isn't wider than the stripe. */
> > +               if (bi->info.isp.sp.iterator.num_stripes > 1 &&
> > +                   rects[IPU3_CSS_RECT_BDS].width <
> > +                   4 * IPU3_UAPI_ISP_VEC_ELEMS * 2)
> > +                       continue;
> > +
> >                 if (imgu_css_queue_enabled(&queue[IPU3_CSS_QUEUE_OUT])) {
> >                         if (bi->info.isp.num_output_pins <= 0)
> >                                 continue;

-- 
Regards,

Sakari Ailus

