Return-Path: <linux-media+bounces-56960-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKoKAG2lw2lssQQAu9opvQ
	(envelope-from <linux-media+bounces-56960-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:05:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0B9321DE3
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F57230F7003
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0C434C80D;
	Wed, 25 Mar 2026 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6MkTfVQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3945351C3E;
	Wed, 25 Mar 2026 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429241; cv=none; b=VEx/YkMTcnFBQk/eh6ukiToPe2zEbpTqaj6lTN5kqGVbXzS0YP8qr/eMRRla3zV/VEO4l+6BzqlEjiG72BVathNuT+99b6v1yBa9V0hy3xk6SqIZ55Os3Zc5dhcE0dl/9zieoRrDYPSg65a6zBX3aUt7z1cgltKLf0GLTl7tba0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429241; c=relaxed/simple;
	bh=DpD3cz3pQHgqJTBucX6RnJ1ygBMNYK/5RTUg9Cqf2cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHr3yQZV+IJJ8KJMKT5c+TnYvcJrVzGMGm2c2Cd3JaB0cewqtUM+zXnHhRi1xZkcI2HB7AmzYjnAiqVdu/DOmm3RXy7QYeFEk3Jk+GLU8mr6HGf2nKR5NkaIX1hIBmSNFyQoC7J7AAzmPgah45jzW/jPml9I5yQXe2rJSGAT3SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6MkTfVQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774429239; x=1805965239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DpD3cz3pQHgqJTBucX6RnJ1ygBMNYK/5RTUg9Cqf2cE=;
  b=l6MkTfVQmJwvWEtdrVy+i5529g+EA4XUY60E1u432RTM5kqyFygXz9PC
   q9T2NMs2Cy1liAhx+1om/JZSDTLLyTmSu0DwuqiUrDCRGEhz80F0lGjeR
   oWUyYHZG5/Vc1M9HnpZMLqdTTIdrFv8Ll2z57SnzTsLl5xOgjAvfTXNp5
   ZFOXkldYZhx9oOK09PMZ1ZsVRE3Py5eYJUwJ7+4MubD9PeOPnh91MACsX
   bSGXOLNzilF3AP7o/CEwgTI0Uq1KTIt5s3aJAP4bPqWRVn9nBEOCUidxc
   JMvfySTiCGgciFemRewffv8D6WLGnOr1rZLxLwqUXwXMrASRDWZ1AHtIj
   w==;
X-CSE-ConnectionGUID: GyY2p0t7QoWCoNBvakPBcg==
X-CSE-MsgGUID: gVdthHgPRRalmZSYjvY+ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="85771607"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="85771607"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 02:00:38 -0700
X-CSE-ConnectionGUID: FfBrG/siSUeCka5yu+K/8A==
X-CSE-MsgGUID: YXrsMJFFTrywJEx/SOr1vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="226253949"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.94])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 02:00:33 -0700
Date: Wed, 25 Mar 2026 10:00:25 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, 
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Collabora Kernel Team <kernel@collabora.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/9] media: rockchip: rkcif: add support for rk3588
 vicap mipi capture
Message-ID: <acOjnYakfLwgIW2V@mdjait-mobl>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-3-77de5ee9048e@collabora.com>
 <ablRBViDR996euua@mdjait-mobl>
 <e894fe10-3780-465a-984d-01f5e8f4c97e@collabora.com>
 <ablWdjlrPLGhDJi4@mdjait-mobl>
 <d97b05cb-396b-4189-8b96-88eab6f85f24@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d97b05cb-396b-4189-8b96-88eab6f85f24@collabora.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56960-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com,linux.intel.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B0B9321DE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael,

On Wed, Mar 25, 2026 at 09:04:57AM +0100, Michael Riesch wrote:
> Hi Mehdi,
> 
> On 3/17/26 14:28, Mehdi Djait wrote:
> > Hi Michael,
> > 
> > On Tue, Mar 17, 2026 at 02:21:20PM +0100, Michael Riesch wrote:
> >> Hi Mehdi,
> >>
> >> On 3/17/26 14:08, Mehdi Djait wrote:
> >>> Hi Michael,
> >>>
> >>> Thank you for this nice patch!
> >>>
> >>> On Tue, Mar 17, 2026 at 10:32:21AM +0100, Michael Riesch via B4 Relay wrote:
> >>>> From: Michael Riesch <michael.riesch@collabora.com>
> >>>>
> >>>> The RK3588 Video Capture (VICAP) unit features a Digital Video Port
> >>>> (DVP) and six MIPI CSI-2 capture interfaces. Add initial support
> >>>> for this variant to the rkcif driver and enable the MIPI CSI-2
> >>>> capture interfaces.
> >>>>
> >>>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> >>>
> >>> [...]
> >>>
> >>>>  static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
> >>>>  					      unsigned int index)
> >>>>  {
> >>>> @@ -631,6 +765,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
> >>>>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
> >>>>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
> >>>>  
> >>>> +	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RKCIF_MIPI_CTRL_CAP_EN);
> >>>> +
> >>>
> >>> while this is the correct solution for rk3588, for the rk3568 vicap this
> >>> will write 0x1 to the VICAP_MIPI_CTRL : 0x00A0 which will enable the water line.
> >>
> >> nice catch ;-) However, the TRM (at least my version) claims that this
> >> bit has a reset value of 0x1, so the bit in question should be already
> >> set in the first place. Thus I decided to *not* make variant specific
> >> code paths.
> > 
> > Yes, the reset value is indeed 0x1
> > 
> >>
> >> Do you see problems in your setup?
> >>
> > 
> > No problems, it works as expected, I was just confused to see the
> > mipi capture enable added with this rk3588 patch and not before.
> > 
> > I just find it a bit confusing but if a nicer solution is too much
> > hassle we can leave it like this.
> 
> I agree that this is (while correct) not the nicest way. I am still
> bringing up the remaining features of the RK3588 VICAP (MUX + TOISP +
> SCALER) and it looks like I need to do some refactoring anyway to
> support them. When I do that, I shall rewrite this part. For the time
> being it would be great to have this merged in order to provide initial
> mainline support for this unit.

That sounds good.

How about adding a TODO comment ?

--
Kind Regards
Mehdi Djait

