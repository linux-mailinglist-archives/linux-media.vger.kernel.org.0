Return-Path: <linux-media+bounces-23065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2950F9EB48F
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 16:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A78E2838D6
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 15:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780E11BD9D8;
	Tue, 10 Dec 2024 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9mx7JUH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ACE1B425E;
	Tue, 10 Dec 2024 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733843922; cv=none; b=nMzy2rWup13g6TM9/Q/BJh0arVVW1oWSY3r4ZG384oJwtABOGF+JD4JeC+R+Sw7Lv7Qd8/IYFNbguVLqa4gjslIchAuoaEpvx/uspTOUnXalWV/W7ju8zBJPn26OQ3DbVBJ2s2yTh4WUoPknkHmeRXShVHK5bD5TmMocVVwzFAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733843922; c=relaxed/simple;
	bh=MyYV/Dq/yh2N0al9eocpkchQGpyiruhLqw5oLkHPoWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5AdunRSANsrU7vGr0/ODehPM2+vIBZwVjRHx7vB2hMnSVOk5vIW+4Hu5hfcs43/WDb4WPI60qR6t75fPDSr/x6GirT9D/Hyn+IeMq6C7SUQfPBoVPNXgn+Y0NDSA+kQKT4nxbGJizIf+m7nF9am7BSzdlaynMYRJNhIS9BBYgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9mx7JUH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733843921; x=1765379921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MyYV/Dq/yh2N0al9eocpkchQGpyiruhLqw5oLkHPoWs=;
  b=P9mx7JUH8fYsIyMi8jyiMf48uLPOvnd3+4kJ2LquwhfdvKSzmtoAoHUg
   lHLd96Xs3NY4Jj9uIuPgHMIh0oITQBIJ47oEHa2F9GQJvvcKQ+2aMbZos
   T1RdJlFVMu1NmcXtnscXEWBwtqHh8EmlNMiejczGCo/13N+O7NZGBEztd
   T4Xb7nugBBGzk8mvTreLBcV2n73EB6+gTdh/e/6q7k1WIQ8ecAYAoHaMQ
   KULxJ3EgNQOyJ04GfuG2LNFdMrpPVKfAwx0FmZCr+spqmUpPs8oUcwVac
   7O7yItWx81DJNkLiqWrcPQFrml3vmr4cbbWg40Ti5WZEDcizNsxcqP6kS
   g==;
X-CSE-ConnectionGUID: agL51K1dQZeHzQYg6EUU6A==
X-CSE-MsgGUID: XdwoLW6TRvipJmUoarH3/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45206208"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="45206208"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 07:18:40 -0800
X-CSE-ConnectionGUID: A9Ohsn/hQfKsY0TvuxCS3w==
X-CSE-MsgGUID: WKZB0PDwSvqrhDvuB8FZxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95255207"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.118.67])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 07:18:35 -0800
Date: Tue, 10 Dec 2024 16:18:32 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Genes Lists <lists@sapience.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	torvalds@linux-foundation.org, stable@vger.kernel.org,
	linux-media@vger.kernel.org, bingbu.cao@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
Message-ID: <Z1hbyNXUubokloda@linux.intel.com>
References: <2024120917-vision-outcast-85f2@gregkh>
 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
 <Z1fqitbWlmELb5pj@kekkonen.localdomain>
 <87seqvzzg6.fsf@intel.com>
 <c1805642a6c5da6fef3927c70358c8cb851d2784.camel@sapience.com>
 <87bjxjzpwn.fsf@intel.com>
 <2024121001-senator-raffle-a371@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2024121001-senator-raffle-a371@gregkh>

On Tue, Dec 10, 2024 at 01:37:11PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Dec 10, 2024 at 02:24:56PM +0200, Jani Nikula wrote:
> > On Tue, 10 Dec 2024, Genes Lists <lists@sapience.com> wrote:
> > > On Tue, 2024-12-10 at 10:58 +0200, Jani Nikula wrote:
> > >> On Tue, 10 Dec 2024, Sakari Ailus <sakari.ailus@linux.intel.com>
> > >> wrote:
> > >> > Hi,
> > >> > 
> > >> > > ...
> > >> > > FYI 6.12.4 got a crash shortly after booting in dma_alloc_attrs -
> > >> > > maybe
> > >> > > triggered in ipu6_probe. Crash only happened on laptop with ipu6.
> > >> > > All
> > >> > > other machines are running fine.
> > >> > 
> > >> > Have you read the dmesg further than the IPU6 related warning? The
> > >> > IPU6
> > >> > driver won't work (maybe not even probe?) but if the system
> > >> > crashes, it
> > >> > appears unlikely the IPU6 drivers would have something to do with
> > >> > that.
> > >> > Look for warnings on linked list corruption later, they seem to be
> > >> > coming
> > >> > from the i915 driver.
> > >> 
> > >> And the list corruption is actually happening in
> > >> cpu_latency_qos_update_request(). I don't see any i915 changes in
> > >> 6.12.4
> > >> that could cause it.
> > >> 
> > >> I guess the question is, when did it work? Did 6.12.3 work?
> > >> 
> > >> 
> > >> BR,
> > >> Jani.
> > >
> > >
> > >  - 6.12.1 worked
> > >
> > >  - mainline - works (but only with i915 patch set [1] otherwise there
> > > are no graphics at all)
> > >
> > >     [1] https://patchwork.freedesktop.org/series/141911/
> > >
> > > - 6.12.3 - crashed (i see i915 not ipu6) and again it has       
> > >     cpu_latency_qos_update_request+0x61/0xc0
> > 
> > Thanks for testing.
> > 
> > There are no changes to either i915 or kernel/power between 6.12.1 and
> > 6.12.4.
> > 
> > There are some changes to drm core, but none that could explain this.
> > 
> > Maybe try the same kernels a few more times to see if it's really
> > deterministic? Not that I have obvious ideas where to go from there, but
> > it's a clue nonetheless.
> 
> 'git bisect' would be nice to run if possible...

I've reproduced the issue. It's caused by 6.12.y commit:

commit 6ac269abab9ca5ae910deb2d3ca54351c3467e99
Author: Bingbu Cao <bingbu.cao@intel.com>
Date:   Wed Oct 16 15:53:01 2024 +0800

    media: ipu6: not override the dma_ops of device in driver

    [ Upstream commit daabc5c64703432c4a8798421a3588c2c142c51b ]


It makes alloc_fw_msg_bufs() fail on isys_probe() 

	cpu_latency_qos_add_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);

	ret = alloc_fw_msg_bufs(isys, 20);
	if (ret < 0)
		goto out_remove_pkg_dir_shared_buffer;

And on error path we do not call cpu_latency_qos_remove_request() 
what cause pm_qos_request list corruption (it is memory use
after free bug).

The problem will disappear after applying:
https://lore.kernel.org/stable/20241209175416.59433-1-stanislaw.gruszka@linux.intel.com/
since the allocation will not longer fail.

But we also need to handle fail case correctly by adding
cpu_latency_qos_remove_request() on error path. This requires
mainline fix, I'll post it. 

Regards
Stanislaw

