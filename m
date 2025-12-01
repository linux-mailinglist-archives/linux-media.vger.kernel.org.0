Return-Path: <linux-media+bounces-47990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 102F1C9857D
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 17:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0EA34344F6B
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 16:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4784F335062;
	Mon,  1 Dec 2025 16:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIkoPn6H"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9B32D3EE5
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 16:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764607419; cv=none; b=KgchQJFBxnvNbQPM0vqES96vO2chUQ8POi+y+YpJi+6ah2fk5DOX/GXHJVq2Ir3/rS7/Bj6u0F21hoFmSTXfJXZMLFDyb/LHAQSt7PFCNxCVbvUF0x3fyf9A1scA4g8fHLH8hkL0vgOMVUbJY0Bw///XZ0uMzsOTsS3dC6FTd7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764607419; c=relaxed/simple;
	bh=OvF3vxt5V9VP0MDf5N/QD0jR8qYoDIj3I3i2koa3SMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHMhaI1dwsNHd7Ja2EXdN9bDSGR83abudQxSiKVYRlVJtzQUDqbHcYx20AJ7jWqwBXsciizcLaQbgEyK+L+0fKiwiIDfZXBLcCjKWLVcyIK0uUix3RdpTSGs36m2b6pC61VbbMXVmZ2PD5Ygx4LuMoa85CZFpvcwTTS6FLsFeSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIkoPn6H; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764607417; x=1796143417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OvF3vxt5V9VP0MDf5N/QD0jR8qYoDIj3I3i2koa3SMU=;
  b=lIkoPn6HX7UAk98y2nS6xUhwsuNgSmwidQ0lOaN8k+WAV0R0MbX9QCW/
   Q5EvOId+1Bq56BMqtt8a+P3zcHxOxNy7zPdxiqH5oOdieHZiSlHpZiwla
   MvypXSJJ91mwu87SSxk1ZQm5uZMH4xo/6UJQXTUITBBPtauWowDAHQ0k8
   JMqeXKMU+r1b2eUifseOzB2VOHpaMikXgE6mS1z9lK6Osn9zoztASFjyo
   0iYeogzn+YFs9T/FfghYrOig3ERPa+lWSf22ZunLr/u/bV4FbUMEMJ2nR
   z9oZSDeVwRtGBnVeptcldA4nZGRlyDmvdIe+UbIJ9Pmxgw1g0q2gSExVS
   Q==;
X-CSE-ConnectionGUID: awnnNTNUSz26Uax+RbZLPg==
X-CSE-MsgGUID: ih2Civo1Sfu5ABCeY/EBVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="54107393"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="54107393"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 08:43:37 -0800
X-CSE-ConnectionGUID: tmJoAT9FTAazsqkyYiXY3A==
X-CSE-MsgGUID: NbQsFnNTTgC0oV6aItMung==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194219933"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 08:43:36 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 94FFD11FA74;
	Mon, 01 Dec 2025 18:43:38 +0200 (EET)
Date: Mon, 1 Dec 2025 18:43:38 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 03/14] media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus
 fixes
Message-ID: <aS3FukU32gxMKuwt@kekkonen.localdomain>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <1e7330bdeb61565bef5254fa35717a260d9e4633.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiMWDmqbYwBacpJ@kekkonen.localdomain>
 <4788af27-120e-4e01-b3d1-f30e466b4980@kernel.org>
 <aS1sVLJsj2iDk2qD@kekkonen.localdomain>
 <aS2QkaTtBq53AGeM@kekkonen.localdomain>
 <ed704af1-3ec9-45a9-ac5b-c33fe9975822@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed704af1-3ec9-45a9-ac5b-c33fe9975822@kernel.org>

Hi Hans,

On Mon, Dec 01, 2025 at 04:35:23PM +0100, Hans Verkuil wrote:
> On 01/12/2025 13:56, Sakari Ailus wrote:
> > On Mon, Dec 01, 2025 at 12:22:12PM +0200, Sakari Ailus wrote:
> >> Hi Hans,
> >>
> >> On Mon, Dec 01, 2025 at 09:27:55AM +0100, Hans Verkuil wrote:
> >>> Hi Sakari,
> >>>
> >>> On 22/10/2025 09:48, Sakari Ailus wrote:
> >>>> Hi Hans,
> >>>>
> >>>> Thanks for the set.
> >>>>
> >>>> On Fri, Oct 17, 2025 at 03:26:40PM +0200, Hans Verkuil wrote:
> >>>>> The isp_video_mbus_to_pix/pix_to_mbus functions did not take
> >>>>> the last empty entry { 0, } of the formats array into account.
> >>>>>
> >>>>> As a result, isp_video_mbus_to_pix would accept code 0 and
> >>>>> isp_video_pix_to_mbus would select code 0 if no match was found.
> >>>>>
> >>>>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> >>>>> ---
> >>>>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 6 +++---
> >>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>>>> index 46609045e2c8..864d38140b87 100644
> >>>>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>>>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>>>> @@ -148,12 +148,12 @@ static unsigned int isp_video_mbus_to_pix(const struct isp_video *video,
> >>>>>  	pix->width = mbus->width;
> >>>>>  	pix->height = mbus->height;
> >>>>>  
> >>>>> -	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
> >>>>> +	for (i = 0; i < ARRAY_SIZE(formats) - 1; ++i) {
> >>>>
> >>>> As it seems all users of the formats array depend on the size of the array
> >>>> and not its contents, could we remove the sentinel entry from the array
> >>>> instead?
> >>>
> >>> Probably, but see this comment just before the sentinel in the array:
> >>>
> >>>         /* Empty entry to catch the unsupported pixel code (0) used by the CCDC
> >>>          * module and avoid NULL pointer dereferences.
> >>>          */
> >>>         { 0, }
> >>>
> >>> Now, I wonder if this comment is out of date, since I don't see code 0 being used
> >>> by CDDC. If you can confirm that that's indeed the case, then I can drop the sentinel.
> >>
> >> Yes, please!
> > 
> > Actually it's omap3isp_video_format_info() I understand ispccdc.c relies
> > not to return NULL. I might add a separate variable for that, to get rid of
> > this obscure arrangement.
> 
> So ispccdc.c can call omap3isp_video_format_info with a code value of 0?
> Can you give an example where that happens? If true, then this feels very
> fragile.

It is fragile, yes. I can't point to a place where this happens but the
driver relies on every mbus code ever used to be on that table, and this
not holding will result in NULL dereference. In other words, it's not easy
at all to figure out it won't happen.

-- 
Sakari Ailus

