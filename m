Return-Path: <linux-media+bounces-11638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8AC8C9A4B
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 11:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 795FE281769
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 09:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223B01CD20;
	Mon, 20 May 2024 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQbBfgZ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79850224EF;
	Mon, 20 May 2024 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716197174; cv=none; b=NyyneuxiJun7uhRbT6znuUzPBHbcSyhWLeubWLSvf2u26zCJkTRYFZF7PHYw+oNbnhZDUJ2Yad2fJ0a+cgWeyMkS3oqo0oRvwNtA4NP4iHDw9yqZUXwQn9XkQzvBvmjNMpUtqYFY9rWUJ5djY6bshzd7EjhWiu2YBzkeA5j1rKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716197174; c=relaxed/simple;
	bh=+o5WBwq3z89cCTcpo5xmDGTx5x6mVmQa0pcXGwdpSq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhciQVV301egcocf8RJE67gxvX+jYeH1m47gBjr6Ej/jsqR9JjmTDrd/e8WQZvsKEW9uqU0yK1DL3Hc3FbVxty3Vqireuq2L2Dvk37IiAZGZCKIE8iJD362DuE/CRLkC2mQF83EWLV+xwe3qn2PokgnxzB2E28rvt4WnIlK6fUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQbBfgZ5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716197173; x=1747733173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+o5WBwq3z89cCTcpo5xmDGTx5x6mVmQa0pcXGwdpSq4=;
  b=aQbBfgZ5H59yVx9i9S2AKHX73xLvS2LmNSfbwYdy0AdDPNSqniTxmLlx
   izUv2MO9LE0iL/GAyVqQbkyK6nrNcrVaJALBOOfbEoQB8bEPFR4gCIUUY
   T786iRnLUyggogR2cjn2OJ3kx1FU2hKm7TX+tIqiakIxBmmf17TmjV0WW
   7hNZGFxjFBXt642VmvZ4k42yG/eiOhOuZKFTDamn0bQvZ02j9CaNIVltP
   93JCTnjz/oQmUZi8/z1ks7dAZ0WZeuYXy5iR8pFrNLl/WgVo5jO43cVwi
   xqQKnqs7HOi6Bz+bkh7HfqYcvSGqJtuNxlnRBBPM0R/uOowjieQxEekvZ
   Q==;
X-CSE-ConnectionGUID: ZvmBHbUPQ26zvOx2Kxb48g==
X-CSE-MsgGUID: CNLzunPFQKqD08nGHAUc6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12503804"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="12503804"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 02:26:11 -0700
X-CSE-ConnectionGUID: bgDNe6UKToKCx6fw2iVP6Q==
X-CSE-MsgGUID: JkJGMuG0TSyTHiDiTgyLHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="36886785"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 02:26:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s8zHO-00000009GGq-0M79;
	Mon, 20 May 2024 12:26:02 +0300
Date: Mon, 20 May 2024 12:26:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Latypov <dlatypov@google.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
	sebastian.fricke@collabora.com, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, adobriyan@gmail.com,
	jani.nikula@intel.com, p.zabel@pengutronix.de, airlied@gmail.com,
	daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
	detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
	andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com
Subject: Re: [PATCH v8 07/10] lib: add basic KUnit test for lib/math
Message-ID: <ZksXKaT2514B71QL@smile.fi.intel.com>
References: <20240517171532.748684-1-devarsht@ti.com>
 <20240517173607.800549-1-devarsht@ti.com>
 <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
 <CAGS_qxpCM=Aw1J_EVQPZv_nDy0zCp6JqxfQk5mGkV+5iCe1OZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGS_qxpCM=Aw1J_EVQPZv_nDy0zCp6JqxfQk5mGkV+5iCe1OZA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 17, 2024 at 01:53:47PM -0700, Daniel Latypov wrote:
> On Fri, May 17, 2024 at 1:14 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > > [devarsht: Rebase to 6.9 and change license to GPL]
> >
> > I'm not sure that you may change license. It needs the author's confirmation.
> 
> Checking, this is referring to the MODULE_LICENSE, which used to be
> MODULE_LICENSE("GPL v2");
> 
> and is now
> MODULE_LICENSE("GPL");
> 
> If checkpatch is suggesting that now, then changing it sounds good to me.

In this case I agree on the change as it's purely syntax and not semantic.

> > > ---
> > > Changes since v6:
> > > * Rebase to linux-next, change license to GPL as suggested by checkpatch.
> >
> > Note, checkpatch.pl is not false positives free. Be careful
> > with what it suggests.
> >
> > > +#include <kunit/test.h>
> > > +#include <linux/gcd.h>
> >
> > > +#include <linux/kernel.h>
> >
> > Do you know why this header is included?
> 
> I think I had put it in the original before a lot of the work you did
> to split things out of kernel.h.
> I haven't had time to look apply this patch series locally yet, but
> I'd be pretty sure we can remove it without anything breaking.

Briefly looking at the code I even not sure it was needed before, but maybe
I missed something, in any case, please remove / replace it.

-- 
With Best Regards,
Andy Shevchenko



