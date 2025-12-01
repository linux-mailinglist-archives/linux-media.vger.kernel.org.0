Return-Path: <linux-media+bounces-47930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C992AC969DF
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 11:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 98CAD4E12F8
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 10:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E62D302CB4;
	Mon,  1 Dec 2025 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XycC24qm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BCD21CC4F
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764584534; cv=none; b=BuMp8s91p7fmNePEi5OZMW/xYMw3mAhf6nUL6Cxh1QzC6LOl/QS6VBMf7H9+hf1D743U6pOtqLOHY6+WkaWwcbRCTIxJPUklrQJ9xNf+qlHHJJatllwZ2Xh8hKMT5bogcCuBjbpVxAEG5mrqH/IZQTcq6C5ueO1Aiq0NJ5fzbAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764584534; c=relaxed/simple;
	bh=NUvejo8feWFJm1jwQbZvluG19HxaH/1MRmoiBS+9vyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiUVl45FgVSTw+2B6t8iq86+V1LMVpjx6hb0vVeJSNyV4ajW0WTDsR4aAoCpaC2iNnbXx5ds12dipbt0qOoOjIi8f25zgj2HlsnDvnbgQCLhd6pg15BO9shbP5ChuJOqd38FLCp9N7HjOt0HeE+zioDtCYbkG5LpbcFpQYuZx1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XycC24qm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764584533; x=1796120533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NUvejo8feWFJm1jwQbZvluG19HxaH/1MRmoiBS+9vyg=;
  b=XycC24qmLCFc6E6ZlmsHY8WVVG8RPGzU9v1HtbPbdnae92AGBYE7O42K
   KjANqkdKp4VLHSd3AVhZl6d+6ysst0aJid8qcG/RNu1sa0to9hNF6Dc++
   9iGfzC/dV79KYi/yZ+cnLVaEuuPL7ZcINyKvf8y+BuGNRSAc0bYjTWXyL
   kD4a9vrA4fqxTYSEhCT3mCdGeII8S9SM2+cwVJPeKPykIti5Kirki4Lzj
   FvL+bCpupi8Xwbd/sl9JsKZfq014JQPPWLbCtm6UeEnGkXRtzcYXx3A6S
   rd85R/HWF+oKss2X66cYURUIxGonPqS4Q30mpTWJivhpECcPqijulZwqU
   A==;
X-CSE-ConnectionGUID: vz3ID3nrQfuQfnDjWqAxzQ==
X-CSE-MsgGUID: unbFDd97QtG1p0YEqSAkdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66682353"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="66682353"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 02:22:12 -0800
X-CSE-ConnectionGUID: eytThOqiRrqsoqEhzokmZg==
X-CSE-MsgGUID: BKQdy18wQZ+ED/DeQnLG0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="198386128"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.162])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 02:22:11 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E167111FA74;
	Mon, 01 Dec 2025 12:22:12 +0200 (EET)
Date: Mon, 1 Dec 2025 12:22:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 03/14] media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus
 fixes
Message-ID: <aS1sVLJsj2iDk2qD@kekkonen.localdomain>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <1e7330bdeb61565bef5254fa35717a260d9e4633.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiMWDmqbYwBacpJ@kekkonen.localdomain>
 <4788af27-120e-4e01-b3d1-f30e466b4980@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4788af27-120e-4e01-b3d1-f30e466b4980@kernel.org>

Hi Hans,

On Mon, Dec 01, 2025 at 09:27:55AM +0100, Hans Verkuil wrote:
> Hi Sakari,
> 
> On 22/10/2025 09:48, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > Thanks for the set.
> > 
> > On Fri, Oct 17, 2025 at 03:26:40PM +0200, Hans Verkuil wrote:
> >> The isp_video_mbus_to_pix/pix_to_mbus functions did not take
> >> the last empty entry { 0, } of the formats array into account.
> >>
> >> As a result, isp_video_mbus_to_pix would accept code 0 and
> >> isp_video_pix_to_mbus would select code 0 if no match was found.
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> >> ---
> >>  drivers/media/platform/ti/omap3isp/ispvideo.c | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >> index 46609045e2c8..864d38140b87 100644
> >> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> >> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >> @@ -148,12 +148,12 @@ static unsigned int isp_video_mbus_to_pix(const struct isp_video *video,
> >>  	pix->width = mbus->width;
> >>  	pix->height = mbus->height;
> >>  
> >> -	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
> >> +	for (i = 0; i < ARRAY_SIZE(formats) - 1; ++i) {
> > 
> > As it seems all users of the formats array depend on the size of the array
> > and not its contents, could we remove the sentinel entry from the array
> > instead?
> 
> Probably, but see this comment just before the sentinel in the array:
> 
>         /* Empty entry to catch the unsupported pixel code (0) used by the CCDC
>          * module and avoid NULL pointer dereferences.
>          */
>         { 0, }
> 
> Now, I wonder if this comment is out of date, since I don't see code 0 being used
> by CDDC. If you can confirm that that's indeed the case, then I can drop the sentinel.

Yes, please!

-- 
Kind regards,

Sakari Ailus

