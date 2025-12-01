Return-Path: <linux-media+bounces-47953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3981C97756
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 14:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A31D83A4CD1
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 12:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC5428BA95;
	Mon,  1 Dec 2025 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCxnZhww"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AB22D0C61
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 12:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593812; cv=none; b=IlqUX3sD7dGhE/H0V9/m0NSxLW6BvZ8aEg3vudGc6T5ReC7bkv/2HjQY/Xhu5Ku1anI8CR1VAqev0gn7JP3zIiB3fWtN9mntSD8VVDTv5M0/SDRkDInqLmgv4/OFeU7gX0R7EBUJ9yHUbX8U7Ra1RC57Ar61OtISqjwJDjOc50g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593812; c=relaxed/simple;
	bh=DusYfJsTVW3LWn6WW+8hvaiN2n7iyFrWg+0/vp9v7GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvtRgF6CQwZIgy5I+noKSQ//wd142dX9k4k6imlLukHIyf4iMYACOHCkmmXqzrPFJCrOt6IkBw+0uCQBvTLOPltGkPzkZ50DzvsDGPKVnmrQCLB0dhfFPaEFiQzk9icjjwdDlS7mvmLVfslxPOWxAs1aHNkw6Ps8EzZE3EaGItE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCxnZhww; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764593811; x=1796129811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DusYfJsTVW3LWn6WW+8hvaiN2n7iyFrWg+0/vp9v7GU=;
  b=LCxnZhwwkWPOhqT8roXjem7Qqwgjv9acta9szxQcPFHmfqP38O/vQfCo
   6gB4SH6Aqh17u85bVDYuCCnc9iuUSy1eyUc5vGCYrGCd+l0b+6b1wP/I9
   wy2QA5V9Y2qBREF5uvKG9DyqA2hQx7p7ZtUUEysGC8/E7mLVJziiAg913
   fMgMSM4VhnXiOOmgAheZtbYIVTUdNrsmAw+RIJ9wqHbz6VQANsp5cIaAs
   M4hKfASr+scSovBL1r3lWGH6XMtXZR/pY/bmiJ4RbkupHVAsVBbziTZsG
   g1f7p5UacQ2h4aCurmaIUAkepvjxQNe4xsFdz52PIOhkMStqzFfyQ+Cqi
   A==;
X-CSE-ConnectionGUID: aFbQNRuBQuC8NJitoke+aw==
X-CSE-MsgGUID: dqOqHlg8SpyUlmkkGFCo8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="78000679"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="78000679"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 04:56:49 -0800
X-CSE-ConnectionGUID: kwbECNkmRnSRCQTah0RQjw==
X-CSE-MsgGUID: Q3OKFrhrQe6UD8f9v1Ux6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="199183960"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.162])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 04:56:48 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4B5A311FA74;
	Mon, 01 Dec 2025 14:56:49 +0200 (EET)
Date: Mon, 1 Dec 2025 14:56:49 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 03/14] media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus
 fixes
Message-ID: <aS2QkaTtBq53AGeM@kekkonen.localdomain>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <1e7330bdeb61565bef5254fa35717a260d9e4633.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiMWDmqbYwBacpJ@kekkonen.localdomain>
 <4788af27-120e-4e01-b3d1-f30e466b4980@kernel.org>
 <aS1sVLJsj2iDk2qD@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS1sVLJsj2iDk2qD@kekkonen.localdomain>

On Mon, Dec 01, 2025 at 12:22:12PM +0200, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Dec 01, 2025 at 09:27:55AM +0100, Hans Verkuil wrote:
> > Hi Sakari,
> > 
> > On 22/10/2025 09:48, Sakari Ailus wrote:
> > > Hi Hans,
> > > 
> > > Thanks for the set.
> > > 
> > > On Fri, Oct 17, 2025 at 03:26:40PM +0200, Hans Verkuil wrote:
> > >> The isp_video_mbus_to_pix/pix_to_mbus functions did not take
> > >> the last empty entry { 0, } of the formats array into account.
> > >>
> > >> As a result, isp_video_mbus_to_pix would accept code 0 and
> > >> isp_video_pix_to_mbus would select code 0 if no match was found.
> > >>
> > >> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> > >> ---
> > >>  drivers/media/platform/ti/omap3isp/ispvideo.c | 6 +++---
> > >>  1 file changed, 3 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> > >> index 46609045e2c8..864d38140b87 100644
> > >> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> > >> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> > >> @@ -148,12 +148,12 @@ static unsigned int isp_video_mbus_to_pix(const struct isp_video *video,
> > >>  	pix->width = mbus->width;
> > >>  	pix->height = mbus->height;
> > >>  
> > >> -	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
> > >> +	for (i = 0; i < ARRAY_SIZE(formats) - 1; ++i) {
> > > 
> > > As it seems all users of the formats array depend on the size of the array
> > > and not its contents, could we remove the sentinel entry from the array
> > > instead?
> > 
> > Probably, but see this comment just before the sentinel in the array:
> > 
> >         /* Empty entry to catch the unsupported pixel code (0) used by the CCDC
> >          * module and avoid NULL pointer dereferences.
> >          */
> >         { 0, }
> > 
> > Now, I wonder if this comment is out of date, since I don't see code 0 being used
> > by CDDC. If you can confirm that that's indeed the case, then I can drop the sentinel.
> 
> Yes, please!

Actually it's omap3isp_video_format_info() I understand ispccdc.c relies
not to return NULL. I might add a separate variable for that, to get rid of
this obscure arrangement.

You could also add:

Fixes: c51364cafa26 ("[media] omap3isp: ccdc: Add YUV input formats support")

-- 
Kind regards,

Sakari Ailus

