Return-Path: <linux-media+bounces-18607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E75987047
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 11:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 343FDB26D4F
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 09:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB33B1AF4DD;
	Thu, 26 Sep 2024 09:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZSmsm6G"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B898A1ACE19
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727343057; cv=none; b=eB5P4gg6E2T5HBbr1xzJJVWlmwRMos9mdQ9wrvaNuIMbe5y+vPOMGztUX8eNU3cMcBhEkzT6BQ6xrL1E4zLJ6nc8tT+nQ9fFmMQKPkw6ftAMaguysX2Hy20zLnQpKfpd/JbJA05vuK2gz1HLaYQc7Q8gsUuIarj+k+uZXG9JS+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727343057; c=relaxed/simple;
	bh=465WbEmLOa2QFKDlgfwlDUlo1huX8qNDMWPo74z+ATw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7VFsPN/bZJLPkfSKtV99PV4CvDgxvAyrsUWVK5yUfCdZomYIXxl9kMAEi9UoTtC7kLYuoUCY4/CaNytj3qsiKLkQeAR7UeXY/C10gdKYvlEfDvhVjRcsx12W00zMV8z+71tR1xDbS5dIe9W9EOoE4nih8ECU+93rGdWBpvLHPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZSmsm6G; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727343056; x=1758879056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=465WbEmLOa2QFKDlgfwlDUlo1huX8qNDMWPo74z+ATw=;
  b=JZSmsm6G+ZKSZgx4t5cg0zLgnooTTSbWtJI/2k8L5TbZ83UCGNI+PtB8
   KyuZiPeUkjkkgxf+APPOmJJkwstF+CPrhaX7FLKS0id+NWqM3E7vimvld
   wm8AO8qC4UkIhcsr44Mtxwh/suK78lwUqeVN98HZiedEAO6WVPLeGO18o
   3s3c+L6ZXVHwPtEtpZKJ/UlluTKKc0SEuwiTJLHJSqyCfmLz2qMOG8bhI
   AYJY+m0C6Yw8wMhhKIr3vW6kJ+VApA7Swiaqv8XL3TEZCtMPg0YFWQz0l
   Ejs3c8uqwpfQu2RiMtMBYxTFy8n6KIgNuDtNiRA8GO2qJOURykyDPPpiS
   g==;
X-CSE-ConnectionGUID: AG63NWj5QBia947a/+LTgg==
X-CSE-MsgGUID: f6lb+cS8RHSnQk0j2HonAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26580389"
X-IronPort-AV: E=Sophos;i="6.10,260,1719903600"; 
   d="scan'208";a="26580389"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 02:30:42 -0700
X-CSE-ConnectionGUID: GPvV4C1GQvSzj0/6S3YimA==
X-CSE-MsgGUID: c4PzVE8ZTDaX2aDm7uR3XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,260,1719903600"; 
   d="scan'208";a="102903316"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 02:30:37 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 337CA11F843;
	Thu, 26 Sep 2024 12:30:34 +0300 (EEST)
Date: Thu, 26 Sep 2024 09:30:34 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <ZvUpuopPY8lwBHEm@kekkonen.localdomain>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
 <20240925195843.GK30399@pendragon.ideasonboard.com>
 <902b2828-5eb8-4741-90af-8e42f1240e86@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <902b2828-5eb8-4741-90af-8e42f1240e86@xs4all.nl>

Hi Hans, others,

On Thu, Sep 26, 2024 at 09:27:20AM +0200, Hans Verkuil wrote:
> On 25/09/2024 21:58, Laurent Pinchart wrote:
> > Hi Mauro,
> > 
> > On Wed, Sep 18, 2024 at 09:24:54AM +0200, Mauro Carvalho Chehab wrote:
> >> Em Tue, 17 Sep 2024 14:52:19 +0200 Hans Verkuil escreveu:
> >>> On 9/17/24 11:17 AM, Sebastian Fricke wrote:
> >>>> Greetings,
> >>>>
> >>>> I remember that we wanted to still define a couple of processes for the
> >>>> multi-committer model for which we hadn't have the time on the media
> >>>> summit. Just would like to gather who would be interested to meet for
> >>>> that, where we meet (probably LPC venue) and when (Laurent just told me
> >>>> that Friday is probably a good slot for that).  
> >>>
> >>> Can you refresh my memory which processes need more work?
> >>
> >> I have the same doubt. As discussed during the summit, Hans and I had some
> >> discussions yesterday, to address a few details. For both of us the process
> >> sounds well defined.
> >>
> >> From my personal notes, this will be the new process:
> >>
> >> - committers will merge patches at media-committers.git tree at fdo,
> >>   provided that they'll follow the rules defined on a committers agreement
> >>   and (partially?) enforced by media-ci checks;
> >> - core committers follow the same rules, with a broader privilege of
> >>   changing kernel API/ABI;
> >> - committers will ensure that patchwork will reflect the review process of
> >>   the patches;
> >> - maintainers will double-check if everything is ok and, if ok, merge the
> >>   changes at linuxtv.org. We intend to rename the tree there to "media.git",
> >>   being the main tree to be used for development;
> >> - pull requests will keep using the same process as currently. The only
> >>   change is that the media-stage.git tree will be renamed to "media.git";
> >> - maintainers will periodically send patches upstream.
> >>
> >> The media-commiters.git tree at fdo might be rebased if needed; the 
> >> media.git tree at linuxtv.org is stable. A large effort will be taken to
> >> avoid rebasing it.
> >>
> >> We may need some helper scripts and/or use pwclient to keep patchwork
> >> updated after committers reviews.
> > 
> > What will happen if we update the status of patches in patchwork when
> > merging them to the fdo tree, and the tree is later rebased to drop
> > commits ? Will the person rebasing handle updating patchwork to move the
> > patches back from accepted to a different status ?
> 
> That should be the responsibility of the person doing the rebase. I think
> that's what is done today as well in the rare cases we rebase.

Sounds reasonable. I'd also like to avoid rebases as much as possible.

Do we have a list of cases where a rebase would be needed? A license issue
or a missing Sob line, perhaps?

-- 
Kind regards,

Sakari Ailus

