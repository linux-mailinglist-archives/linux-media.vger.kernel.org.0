Return-Path: <linux-media+bounces-50730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF46D21450
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 22:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3466300FD41
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 21:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98D33570B3;
	Wed, 14 Jan 2026 21:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSi8pneg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033873559DF;
	Wed, 14 Jan 2026 21:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424839; cv=none; b=t+s4/l6pwf+m9uobP6+M/xBMkYUErG9m9fVjRds/tPWJnIewH3jj4rb+8XRAP9nYN4NRI6pKhSZhbGqYDsGN5XZikNfxT9xh0x+VLBKbUPasuEOPiFItT4T7CQvbs06tcMAwEU5lrFE5JfILKkck5RsM+UwqrPGJISBRJtgk14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424839; c=relaxed/simple;
	bh=9xnqwUhBPGuFd5DCHiebdmvadnCcHh51qnlLo2vipDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfQ7ZVYr188qMiMavvSiVJal2ZV7xKDhr7ZXargtCwoETmUIfwqVcAsHxGxHnmsewRm397f39hx4jeRrCmEyDmoB6vTqfNIXbwdhtN5f0CtDYcePqaHzG5E8KR6u3dkOi+sCDlulrPcQbETgHyLIPVxsIAB3ocNqBR6tOJD0cGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSi8pneg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768424838; x=1799960838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9xnqwUhBPGuFd5DCHiebdmvadnCcHh51qnlLo2vipDQ=;
  b=PSi8pnegWiLiOZhnPzPhtCW63Ncrcpc7EVkPuW3336sgUJH0HNdtqrSM
   CO/bvo+DwKq+7+iwglkrUGtAsrb5KI6mfS4DKIy4piui5w7Ylcgpa8BEb
   ik2qQIDWJsJv5diq8h2u+mBqiFAAIcS/brWbNxkRBw7jmffmVE1WmfRd3
   Bbifyw1pGzZSDwPKR306rE+ZBJu9I0o4Iyjv4VP3kE4pkLeSQ7cPDHefK
   tLiumRLBgOd+iEZca6YRmyabLXDKTBnCNq7aJSTK7dpFeVembBF17ATmf
   EEltlTdOgkFCLec6ahGMiZFdMdNL6DxD52Zrd6ffg218chZBg5FVonHGb
   A==;
X-CSE-ConnectionGUID: NdbDam0sQSybyNfnAVthjA==
X-CSE-MsgGUID: a4wnPmGHS6qcjTBh49svgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="87144362"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="87144362"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:07:17 -0800
X-CSE-ConnectionGUID: VpkK5O9GR/aJQXEOh9Vjzg==
X-CSE-MsgGUID: r11Z+JrVS8e8WulNe5R5pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204398283"
Received: from inaky-mobl1.amr.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.184])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:07:12 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 70CD6120742;
	Wed, 14 Jan 2026 23:07:11 +0200 (EET)
Date: Wed, 14 Jan 2026 23:07:11 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sultan@kerneltoast.com, pratap.nirujogi@amd.com,
	benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
	Phil.Jawich@amd.com, Dominic.Antony@amd.com,
	mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
Message-ID: <aWgFf998f12tYWYX@kekkonen.localdomain>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-5-Bin.Du@amd.com>
 <aUkZP8i90uWaFliY@kekkonen.localdomain>
 <62bd8248-dd8a-4d51-8a85-ad13d3a03180@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62bd8248-dd8a-4d51-8a85-ad13d3a03180@amd.com>

Hi Bin,

On Wed, Jan 14, 2026 at 06:34:34PM +0800, Du, Bin wrote:
> > The increment could probably be expressed as seen &= ~BIT(i).
> > 
> 
> Quoted below is Sultan's reply regarding this, Would it be acceptable to
> leave it unchanged?
> 
> "Yes it can be, but it adds several more instructions before the loop body,
> without any improvement to the loop body (the sarx in the loop body is
> replaced
> by andn). The right shift trick is faster and this is a hot path (IRQ
> handler).

Please see my reply to Sultan.

> > > +static int isp4sd_sdev_link_validate(struct media_link *link)
> > > +{
> > > +	return 0;
> > 
> > Uh-oh.
> > 
> > What is actually being configured via the sub-device? There is no device
> > node either, is there? Are there plans for future developments, apart from
> > possibly making the ISP and the sensor controllable by the host?
> > 
> 
> Yes, you are correct. For the first version, no device node and
> configuration for the sub-device now. Possible future development plan is
> under internal discussion.

You can drop these for now.

-- 
Kind regards,

Sakari Ailus

