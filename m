Return-Path: <linux-media+bounces-50173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E003D0030A
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 22:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A75E301461F
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 21:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED43929DB8F;
	Wed,  7 Jan 2026 21:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DShm/ihe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59137227E82
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 21:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821585; cv=none; b=SoO+vuoAmSPF0ndgfnfT5TLfMyJBtN0M+/pQs34kL034hnegnsDBAaNSci2IRjffuLB3Z5IsklFyCPFExkdLgHw9DmktsLQ+sNgUoR6+9iqr4kJRT5c0WDPrnRUMhZFN97p/eCmN4QWXk3WsjBbBxO4iRmGyLqPFChrylbrwWtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821585; c=relaxed/simple;
	bh=l5RiyGTrEhjOo6RkzTX9KpuHeqiZ/ndFJGbXa2fwEDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dh7Rf41VbrX0AEmsfga0ZKe/yeDHL54X1qGgfWR3TraleFhTf4M7tyj5hJYfwYTdHo/EoSxAnOKa0tERLmbnDZz+jetn8XYvVX8VYToaXcaGkT7rq+DRWHVTKZIdMhlD9KS03YEqHyWSirvvAoTbgjsvdpR0pYTCMLiLOXpXZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DShm/ihe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767821583; x=1799357583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l5RiyGTrEhjOo6RkzTX9KpuHeqiZ/ndFJGbXa2fwEDI=;
  b=DShm/iheZvI7OzsLWM3mr2z4wli5iQunz2DaWUNpCETuDMyqGOMAPj/E
   FmCxihOZWZbsMAlx9JC+CmlHVlHHY1a++t6wAdXQ1o4yxDXfTY+RaFMG6
   HtLrnoHMnu/BZQPRKE/KE85hyCllfdqIQXGXLarXngdwdmB5f3RNQIVX2
   bffgCXfD89ZPjQql/ykQApUjLtP2NzIHmrOiENV9jAoi7ThtikDvtfSaE
   qpSjcu7SwCzxkra7jjUHCCIYPX4dgkjwVejozxLKIKDBDy3qAD24zMA9V
   a8QdZLPC0F9ZHKEyB84OmZWtXSVUlWl2dNkS8JGNmJjex1XkYLSevs1im
   Q==;
X-CSE-ConnectionGUID: +re8w7ebTvCvgKO1KR4Axg==
X-CSE-MsgGUID: PqxrmQiDTP6ZsIna4Cps2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69179575"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="69179575"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 13:33:03 -0800
X-CSE-ConnectionGUID: UpIB9XrfTZyhTQHrlNu0Jw==
X-CSE-MsgGUID: pwe2mg2yQ5ez4jleb3Jtxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="208092104"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.174])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 13:33:02 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 091051203D1;
	Wed, 07 Jan 2026 23:33:15 +0200 (EET)
Date: Wed, 7 Jan 2026 23:33:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCHv3 00/12] media: omap3isp: v4l2-compliance fixes
Message-ID: <aV7RGh6UtTMEKi_k@kekkonen.localdomain>
References: <cover.1764661880.git.hverkuil+cisco@kernel.org>
 <aUVGY_zKzbyDKJMU@kekkonen.localdomain>
 <63f21eb4-e789-4e77-b362-9ff94e1fdfcb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63f21eb4-e789-4e77-b362-9ff94e1fdfcb@kernel.org>

On Tue, Jan 06, 2026 at 08:20:28AM +0100, Hans Verkuil wrote:
> On 19/12/2025 13:34, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Tue, Dec 02, 2025 at 08:51:08AM +0100, Hans Verkuil wrote:
> >> When I worked on the patch series to remove the vb2 wait_prepare/finish
> >> callbacks, I had to test that series on my Beagle xM board with a
> >> Leopard Imaging li5m03 camera.
> >>
> >> Since I wanted to use v4l2-compliance to test the vb2 change, I first had
> >> to fix a bunch of other compliance problems in this driver so it would
> >> actually be able to run the streaming tests.
> >>
> >> This series contains the fixes I made to get to that point.
> >>
> >> It depends on one sensor driver fix (posted separately):
> >>
> >> https://patchwork.linuxtv.org/project/linux-media/patch/554fb9d7-374b-4868-b91b-959b8fd69b4d@kernel.org/
> >>
> >> This series doesn't fix all compliance problems, but at least it is
> >> a lot better now.
> > 
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Also let me know if you'd wish me to pick these.
> > 
> 
> I can take this series and add your Ack.
> 
> Thank you for looking at this!

Sure, thanks!

-- 
Sakari Ailus

