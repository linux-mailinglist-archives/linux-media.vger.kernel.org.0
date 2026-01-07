Return-Path: <linux-media+bounces-50127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 705FACFD624
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 12:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 621163019255
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 11:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7421F7916;
	Wed,  7 Jan 2026 11:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELPyFUjo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F8D304BBC
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784767; cv=none; b=qKXSzSkgBFhkOyk1EVkkYq+CmA8BDzOr/5dVWee5vTnQ5pgflDnPLiImGF6K5BIleqwd16z7/dncVO2iEhgS15Pbq/evZ8IG4FOqlEwstV1JzD87SU+mIIlRJuIvSHm4eEZD+IzsDEKjA59qkU3KkDMzE8i43j1IBxQ124Q8pxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784767; c=relaxed/simple;
	bh=3R/Qt1L2NNkXifqeUhQeJXTQ0wH3bAsdGQ7GGbcUifw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsApe97lk+U511/Fd4xi7hfOkpmmepERehNasP82j8sSApt/2HYqZwbPPTm+tpglm8DjECDHcpX4LEE3vyjjTWMg5A6nF1/Glq+biBGczaCtpaW5VMrSx0Jyi2grTFrrXyJwHm+ZxThThZ4bSSIs9vbHV4Xno4z8H5eGORszFj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELPyFUjo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767784765; x=1799320765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3R/Qt1L2NNkXifqeUhQeJXTQ0wH3bAsdGQ7GGbcUifw=;
  b=ELPyFUjoVlLeJ2lzhxtXUdMBpujCPr3jNOsl8zMx5h8koIj2XHtFAVaz
   HVvXZakseyYQmrBBNuxkkiQSFm8vq39OLeaDPsSThdpEw0hg8uP7WKBje
   jrdrPCmxDNKPcEYMABGoZNcr2yO4EYl5++CjHfK3Oa9ZeE5Z9jY0+zD8e
   /b3BuyBGwrLiB4JfsWV6PWI/X/S8onFBbQkq6rdn944Z19vlhSSbTv5vw
   ADUbSWTJTfcmKjXHhDyIa5M4jk8MP6PYoRIM+iHYxRjYn6AOcfRNcghp+
   a8GHsoe5ZzyoX/YI1NbC9BVzIMBLssF7KLQt80lDoTjmoopU9PyhUijas
   g==;
X-CSE-ConnectionGUID: BUwNH03HQjGp6VQTYFqf+g==
X-CSE-MsgGUID: pSosNHwRRWC77iDj98ZHzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69051648"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="69051648"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:19:24 -0800
X-CSE-ConnectionGUID: yvLW2RF3Ro29UOVmT5FQBQ==
X-CSE-MsgGUID: 86ZDjhoLRseaLI+Bx7ctOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="207961054"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.149])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:19:22 -0800
Date: Wed, 7 Jan 2026 12:19:15 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [GIT FIXES for v6.19] media: ov02c10: h/vflip fixes
Message-ID: <ns64xwfqm4xpju26c2yifcg7spa7j2nwfc7slrvlhdmdat5lra@dsgbsq4liude>
References: <df8059ac-2c6a-46e2-9494-974fc6460184@oss.qualcomm.com>
 <7ae434c0-0e36-4434-826a-2122c4e9ccb4@kernel.org>
 <ed3d569f-ce42-4594-ae49-5ed67139acd9@oss.qualcomm.com>
 <aV481_mfjuHGumUS@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV481_mfjuHGumUS@kekkonen.localdomain>

Hi Sakari,

On Wed, Jan 07, 2026 at 01:00:39PM +0200, Sakari Ailus wrote:
> Hi Hanses,
> 
> On Tue, Jan 06, 2026 at 11:43:32AM +0100, Hans de Goede wrote:
> > Hi Hans,
> > 
> > On 6-Jan-26 09:44, Hans Verkuil wrote:
> > > Hi Hans,
> > > 
> > > On 19/12/2025 16:03, Hans de Goede wrote:
> > >> Hi Hans, Mauro,
> > >>
> > >> As discussed in:
> > >>
> > >> https://lore.kernel.org/linux-media/382e2dc1-6552-4ff4-adb2-7e4bfafaefb4@kernel.org/
> > >>
> > >> Here is a pull-request for a set of ov02c10: h/vflip fixes.
> > >>
> > >> Note the tag has a -2 suffix, because for -1 I had accidentally
> > >> used a random post v6.19-rc1 commit from Torvald's tree instead
> > >> of v6.19-rc1. The -2 tag is correctly based on top of v6.19-rc1.
> > >>
> > >> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> > >>
> > >>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> > >>
> > >> are available in the Git repository at:
> > >>
> > >>   git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/ov02c10-fixes-for-6.19-2
> > >>
> > >> for you to fetch changes up to ddf8d8757cb36654cb146f90c4af6a82d0edff25:
> > >>
> > >>   media: ov02c10: Remove unnecessary hflip and vflip pointers (2025-12-19 15:50:49 +0100)
> > > 
> > > The patches are for this v2 series:
> > > 
> > > https://patchwork.linuxtv.org/project/linux-media/cover/20251210112436.167212-1-johannes.goede@oss.qualcomm.com/
> > > 
> > > However, this series is marked as Superseded in patchwork. Is that a mistake?
> > > 
> > > The v1 series https://patchwork.linuxtv.org/project/linux-media/list/?series=20131
> > > is still marked as 'New'. Did you mark the wrong series as Superseded?
> > > 
> > > Also, most of the v2 patches are delegated to Sakari, not Hans de Goede.
> > > 
> > > I just wanted to clarify this before merging anything to the fixes branch, and
> > > make sure you and Sakari are on the same page.
> > 
> > I did not make any changes in patchwork, so I assume those were done
> > by Sakari.
> > 
> > I guess Sakari may have marked these for picking up by him, but since
> > these fix a regression in 6.19-rc# these should get picked up as
> > fixes, rather then go to media-committers/next.
> > 
> > Sakari ?
> 
> I've squashed the changes Hans posted plus trivial fixes; I'll send v2 (and
> a PR) once Mehdi has tested it. The patches can be found here
> <URL:https://git.retiisi.eu/?p=~sailus/linux.git;a=shortlog;h=refs/heads/ov01a10>.

This is a different sensor the ov01a10 and not the ov02c10 or am I missing something here ?

--
Kind Regards
Mehdi Djait

