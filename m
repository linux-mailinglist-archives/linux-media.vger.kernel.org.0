Return-Path: <linux-media+bounces-50126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1E6CFD547
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 12:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CD17310F372
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 11:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB042DEA67;
	Wed,  7 Jan 2026 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDHnIZwb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2375423D291
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767783630; cv=none; b=Sr2++D0xmqBvlHysKpeAwXrwOXUMxV6Ir38lf+Na5e+uqY3xMIa76aIyNHdkbylppSje8TZoannECTS2kB3bBZFThQfSGV5rVIS4mT2b4GDFbFfNZpb1OaURhycO6Nc0D+L9BTNhYTrVe9sAqgWvzCuI4T2L8iPzc80MNBUvSwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767783630; c=relaxed/simple;
	bh=8NGAmcjL602tyWZWM1OeGT7lJgfQiu1Z1wM61wOJKNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsTSLKYqOMSkSIYYSbTdA7cJU9nMSIFiWaq001HhU0B2tqboSaHcqjoNTz5dqBHZH/6cNPWyDNQ6fpgzFRyhuj4G80To4q1NSgi7/ijEkjv0THvYwjc0b/VYBGqoMW8XtXmh6O4MGoVbKq4M/xlfnpgN/OVKyrq0noPYAF6ual8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDHnIZwb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767783627; x=1799319627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8NGAmcjL602tyWZWM1OeGT7lJgfQiu1Z1wM61wOJKNI=;
  b=YDHnIZwb/avqeeG107DPXIPuZiedcX3rQatLKkV7KMnx4DTYiq+VednG
   162xV5s5Vaf04K4V0XycRxd8Ius2EqOXgmUWX0emJFHgvQEV6homWDvKJ
   yGiaxrpkIqkaJrvoKfoh7ImvJY00ln/sn///PBu+/kVVVE3QJSR4B8F4B
   aeol763KnQ+5Jnca4CegFVkInhgO/YSG9SzzVsfp94jPwo22S+MCiYMPw
   3NuzjC/aFO4TqdLpz+DMaQhU8wBwjxt7gYfigPFWINZYoSUEwTaMNGniG
   TuyL867rq/opl3DaLTRYKObEH8naBVrUFKjOZo3xZfoCal0DFIcpSnZmV
   w==;
X-CSE-ConnectionGUID: +tyODDTCTIOCNKJaMtkoiw==
X-CSE-MsgGUID: LCwp2MdxQnKSOkARSqlimA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69200250"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="69200250"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:00:27 -0800
X-CSE-ConnectionGUID: I+iYY7qFTFqu5qcwc2HqsQ==
X-CSE-MsgGUID: q5fp45RbRBCHShFIAqTRsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="207766960"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.143])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:00:25 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 42D2E121D80;
	Wed, 07 Jan 2026 13:00:39 +0200 (EET)
Date: Wed, 7 Jan 2026 13:00:39 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [GIT FIXES for v6.19] media: ov02c10: h/vflip fixes
Message-ID: <aV481_mfjuHGumUS@kekkonen.localdomain>
References: <df8059ac-2c6a-46e2-9494-974fc6460184@oss.qualcomm.com>
 <7ae434c0-0e36-4434-826a-2122c4e9ccb4@kernel.org>
 <ed3d569f-ce42-4594-ae49-5ed67139acd9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed3d569f-ce42-4594-ae49-5ed67139acd9@oss.qualcomm.com>

Hi Hanses,

On Tue, Jan 06, 2026 at 11:43:32AM +0100, Hans de Goede wrote:
> Hi Hans,
> 
> On 6-Jan-26 09:44, Hans Verkuil wrote:
> > Hi Hans,
> > 
> > On 19/12/2025 16:03, Hans de Goede wrote:
> >> Hi Hans, Mauro,
> >>
> >> As discussed in:
> >>
> >> https://lore.kernel.org/linux-media/382e2dc1-6552-4ff4-adb2-7e4bfafaefb4@kernel.org/
> >>
> >> Here is a pull-request for a set of ov02c10: h/vflip fixes.
> >>
> >> Note the tag has a -2 suffix, because for -1 I had accidentally
> >> used a random post v6.19-rc1 commit from Torvald's tree instead
> >> of v6.19-rc1. The -2 tag is correctly based on top of v6.19-rc1.
> >>
> >> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> >>
> >>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> >>
> >> are available in the Git repository at:
> >>
> >>   git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/ov02c10-fixes-for-6.19-2
> >>
> >> for you to fetch changes up to ddf8d8757cb36654cb146f90c4af6a82d0edff25:
> >>
> >>   media: ov02c10: Remove unnecessary hflip and vflip pointers (2025-12-19 15:50:49 +0100)
> > 
> > The patches are for this v2 series:
> > 
> > https://patchwork.linuxtv.org/project/linux-media/cover/20251210112436.167212-1-johannes.goede@oss.qualcomm.com/
> > 
> > However, this series is marked as Superseded in patchwork. Is that a mistake?
> > 
> > The v1 series https://patchwork.linuxtv.org/project/linux-media/list/?series=20131
> > is still marked as 'New'. Did you mark the wrong series as Superseded?
> > 
> > Also, most of the v2 patches are delegated to Sakari, not Hans de Goede.
> > 
> > I just wanted to clarify this before merging anything to the fixes branch, and
> > make sure you and Sakari are on the same page.
> 
> I did not make any changes in patchwork, so I assume those were done
> by Sakari.
> 
> I guess Sakari may have marked these for picking up by him, but since
> these fix a regression in 6.19-rc# these should get picked up as
> fixes, rather then go to media-committers/next.
> 
> Sakari ?

I've squashed the changes Hans posted plus trivial fixes; I'll send v2 (and
a PR) once Mehdi has tested it. The patches can be found here
<URL:https://git.retiisi.eu/?p=~sailus/linux.git;a=shortlog;h=refs/heads/ov01a10>.

-- 
Kind regards,

Sakari Ailus

