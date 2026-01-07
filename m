Return-Path: <linux-media+bounces-50128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47532CFD6E1
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 12:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C6963013972
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 11:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24CB328B49;
	Wed,  7 Jan 2026 11:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ure10IyA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E5830F52D
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785881; cv=none; b=O2bnrDa2STiCqoShyu9HG9tNe0tk+b+/Tk/1b8zIK/DcJuT8cVFiTn1dh66b1l9ZfV2wz/S2RDOwRtmhGBm5OrG0FtLcpQf84V+N4qBVjFAAgzTllNaoHPL2Vgq8qVKd+xwqMeDEvWx9TARAD6f88BsKdZJAuxsJ5zvcw895PFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785881; c=relaxed/simple;
	bh=N3/wTqXdrOgjt1QdycyAPCawnY1Nw3hDT/PHnupDaDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uB/CEEDxS+rRu+QbwG0whpWCGpAl24Ux8ywZbaKlwThF0gtCD3ZebZLDU7O+TUPTo+yKBFX+m6URP6AzZK71SRUqv/Z9uDRgOUjBb0+51BshEGoyB5RZF4bhz8WvCdeXJ2nI4PuzHWqlZXVczwd1jOZyR+GCYtS6kSb+3AKR7x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ure10IyA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767785880; x=1799321880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N3/wTqXdrOgjt1QdycyAPCawnY1Nw3hDT/PHnupDaDw=;
  b=Ure10IyA2rlZJvPvkFY6ZP1WjZEpKMQmdoF/e/yhaC2kYjRShlEHYUxR
   JwjkDQgzZurs3pkDkkQ8cQ5Sg4TCy+NrbQN2c5PlA+LpX3CQW6rM09nTv
   PdZKxzfSTusa9DWG66iJinpyHFSXb5lnF+5Ua04G+clqGcng7M85moUpd
   js5L6Z3vzUYdqHyPeLXcfuuVJdTUYTBejzQFOuXufaMHSXIlKkFbx4nnd
   Ku9mzRkbEH2lgB1bb90QJClb56RBpMRSOB/esdJVJ0DuPbNlygeCPwFGW
   z3kvW+q7lRvhzEK/GA5T1YM5+u5dDcDJIt2FhpL87UCebe3UHmgdvolJC
   w==;
X-CSE-ConnectionGUID: c541ma7qTmC9Qyn91xvRvQ==
X-CSE-MsgGUID: 11QLcduKT4mb35eGwcPkBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="86739653"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="86739653"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:37:59 -0800
X-CSE-ConnectionGUID: m+zdtv3sS0aD2RZfu2NNQg==
X-CSE-MsgGUID: ub22VaJqQWS4rQwJAUZe7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="207770660"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.143])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:37:57 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9039D121D80;
	Wed, 07 Jan 2026 13:38:11 +0200 (EET)
Date: Wed, 7 Jan 2026 13:38:11 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [GIT FIXES for v6.19] media: ov02c10: h/vflip fixes
Message-ID: <aV5Fo-tuEVmQxSiL@kekkonen.localdomain>
References: <df8059ac-2c6a-46e2-9494-974fc6460184@oss.qualcomm.com>
 <7ae434c0-0e36-4434-826a-2122c4e9ccb4@kernel.org>
 <ed3d569f-ce42-4594-ae49-5ed67139acd9@oss.qualcomm.com>
 <aV481_mfjuHGumUS@kekkonen.localdomain>
 <ns64xwfqm4xpju26c2yifcg7spa7j2nwfc7slrvlhdmdat5lra@dsgbsq4liude>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ns64xwfqm4xpju26c2yifcg7spa7j2nwfc7slrvlhdmdat5lra@dsgbsq4liude>

Hi Mehdi, Hanses,

On Wed, Jan 07, 2026 at 12:19:15PM +0100, Mehdi Djait wrote:
> Hi Sakari,
> 
> On Wed, Jan 07, 2026 at 01:00:39PM +0200, Sakari Ailus wrote:
> > Hi Hanses,
> > 
> > On Tue, Jan 06, 2026 at 11:43:32AM +0100, Hans de Goede wrote:
> > > Hi Hans,
> > > 
> > > On 6-Jan-26 09:44, Hans Verkuil wrote:
> > > > Hi Hans,
> > > > 
> > > > On 19/12/2025 16:03, Hans de Goede wrote:
> > > >> Hi Hans, Mauro,
> > > >>
> > > >> As discussed in:
> > > >>
> > > >> https://lore.kernel.org/linux-media/382e2dc1-6552-4ff4-adb2-7e4bfafaefb4@kernel.org/
> > > >>
> > > >> Here is a pull-request for a set of ov02c10: h/vflip fixes.
> > > >>
> > > >> Note the tag has a -2 suffix, because for -1 I had accidentally
> > > >> used a random post v6.19-rc1 commit from Torvald's tree instead
> > > >> of v6.19-rc1. The -2 tag is correctly based on top of v6.19-rc1.
> > > >>
> > > >> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> > > >>
> > > >>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> > > >>
> > > >> are available in the Git repository at:
> > > >>
> > > >>   git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/ov02c10-fixes-for-6.19-2
> > > >>
> > > >> for you to fetch changes up to ddf8d8757cb36654cb146f90c4af6a82d0edff25:
> > > >>
> > > >>   media: ov02c10: Remove unnecessary hflip and vflip pointers (2025-12-19 15:50:49 +0100)
> > > > 
> > > > The patches are for this v2 series:
> > > > 
> > > > https://patchwork.linuxtv.org/project/linux-media/cover/20251210112436.167212-1-johannes.goede@oss.qualcomm.com/
> > > > 
> > > > However, this series is marked as Superseded in patchwork. Is that a mistake?
> > > > 
> > > > The v1 series https://patchwork.linuxtv.org/project/linux-media/list/?series=20131
> > > > is still marked as 'New'. Did you mark the wrong series as Superseded?
> > > > 
> > > > Also, most of the v2 patches are delegated to Sakari, not Hans de Goede.
> > > > 
> > > > I just wanted to clarify this before merging anything to the fixes branch, and
> > > > make sure you and Sakari are on the same page.
> > > 
> > > I did not make any changes in patchwork, so I assume those were done
> > > by Sakari.
> > > 
> > > I guess Sakari may have marked these for picking up by him, but since
> > > these fix a regression in 6.19-rc# these should get picked up as
> > > fixes, rather then go to media-committers/next.
> > > 
> > > Sakari ?
> > 
> > I've squashed the changes Hans posted plus trivial fixes; I'll send v2 (and
> > a PR) once Mehdi has tested it. The patches can be found here
> > <URL:https://git.retiisi.eu/?p=~sailus/linux.git;a=shortlog;h=refs/heads/ov01a10>.
> 
> This is a different sensor the ov01a10 and not the ov02c10 or am I missing something here ?

Oops. Yes, you're right.

That PR is fine IMO. I've fixed the state in Patchwork (v1 is now
superseded).

-- 
Kind regards,

Sakari Ailus

