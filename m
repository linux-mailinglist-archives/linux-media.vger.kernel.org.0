Return-Path: <linux-media+bounces-35644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6431AAE430D
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 15:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F2E63BAF5D
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EE1253340;
	Mon, 23 Jun 2025 13:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5pyNCgH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B282517AF;
	Mon, 23 Jun 2025 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750684931; cv=none; b=CRurCyKmNbuJv6HXS2VCAMmQNUAmGFaHER9txHgdKAzVgM143uy2jfxVM6X4GuLnKdD2YdgYwSVljxpBv6/Yc1xo5Ho85cwaT1zfn72f26BWCVsa3Ep7La509xXVIc4udj/d52zy0cE2CL1yO7zn4ZzDrelSHzKyH/6cQFAdOG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750684931; c=relaxed/simple;
	bh=Eh79O5Bmx21LbpxhlRl7XC8RSLmkHIQyohmM3vYqqK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHyoMb4wgNFdlo/XoCL62OtZ8UoZykia2elo3HmjpzNxuGeuCQnaGhH3qRx2T4VkZl4Ugfuo5aYSh1eLdhkgTo+BEUToMtpGMmP3WO1YD/L3w+7M+FEEZWskY8PAwCoE2NF+SysiHMcsVWXnI7eTMLOIdEENjp7OJqg//uFngWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5pyNCgH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750684930; x=1782220930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Eh79O5Bmx21LbpxhlRl7XC8RSLmkHIQyohmM3vYqqK0=;
  b=Y5pyNCgHQmjmljqEJFnO73dMSq1sd5zsgzWnYmGWTVgxW94l0Uo6PZl3
   CKqKbbvYG9POVzWivjJ9R22xoY2TClT7a9XzWa7K20yuOJ+Q+XT2p2xer
   MQAcyQ5xi3xHExq8GU0ACxRlQy6pxg7EOxLY4DmpqLsAfiGyXSNX04Hs2
   dDunCX6iRiHb7Qbd3gEilMmj48huRRhlkUkbkL1bd4cgh/3f3xarwd/fa
   dDTz1JYKJa/fGSQI12a9YjeoxH6HbMYZ2fwpGxOdIoRU9q+lQP9vLfOdt
   ashoQLD+5BEyggkywhCm+UgdX3x+rzBdjOX1JApbbf8tgHPIljH+QlD0Z
   A==;
X-CSE-ConnectionGUID: wwRobED+RJGtll317dSKJw==
X-CSE-MsgGUID: ixuNkKF0QzWKQV3KUMWH6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56563906"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="56563906"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:22:10 -0700
X-CSE-ConnectionGUID: +khe6KORTkiYI2fJyr05eQ==
X-CSE-MsgGUID: F8oh866lQ6qxnof2o1M7CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151025268"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:22:04 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9EDD01201F7;
	Mon, 23 Jun 2025 16:22:00 +0300 (EEST)
Date: Mon, 23 Jun 2025 13:22:00 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Nirujogi, Pratap" <pnirujog@amd.com>, Hao Yao <hao.yao@intel.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
	jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com,
	king.li@amd.com, dantony@amd.com, vengutta@amd.com,
	dongcheng.yan@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <aFlU-E_GCHWBXErq@kekkonen.localdomain>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <3e8364e8-22e4-42ad-a0f0-017f86fd6bf9@amd.com>
 <20250623120929.GE826@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120929.GE826@pendragon.ideasonboard.com>

Hi Laurent, Pratap,

On Mon, Jun 23, 2025 at 03:09:29PM +0300, Laurent Pinchart wrote:
> On Mon, Jun 16, 2025 at 07:12:28PM -0400, Nirujogi, Pratap wrote:
> > On 6/13/2025 6:02 PM, Sakari Ailus wrote:
> > > On Fri, Jun 13, 2025 at 12:55:46PM +0800, Hao Yao wrote:
> > >> Hi Pratap,
> > >>
> > >> Thanks for your patch.
> > >>
> > >> This patch is written for your camera sensor module, which seems very
> > >> different from those already applied on Dell laptops (some of "Dell Pro"
> > >> series). Looking into the driver, I think this version will break the
> > >> devices using ov05c10 sensor.
> > > 
> > > There never was such a driver in upstream so nothing breaks. However, in
> > > order to support these, could you check what would it take to support them
> > > using this driver and post patches, please?
> > > 
> > >> I think this patch is better to be validated on existing devices, but please
> > >> do some fixes before we can do validation. Please check my comments inline.
> > >>
> > >> On 2025/6/10 03:42, Pratap Nirujogi wrote:
> > >>> Add driver for OmniVision 5.2M OV05C10 sensor. This driver
> > >>> supports only the full size normal 2888x1808@30fps 2-lane
> > >>> sensor profile.
> > >>>
> > >>> Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> > >>> Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> > >>> Co-developed-by: Bin Du <bin.du@amd.com>
> > >>> Signed-off-by: Bin Du <bin.du@amd.com>
> > >>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> 
> [snip]
> 
> > >> Hi Sakari,
> > >>
> > >> Seems there are already several camera sensors using page-based registers.
> > >> Is it a good idea to add page support in CCI interface?
> > > 
> > > Sounds like a good idea as such but I'm not sure how common this really is,
> > > I think I've seen a few Omnivision sensors doing this. If implemented, I
> > > think it would be nice if the page could be encoded in the register address
> > > which V4L2 CCI would store and switch page if needed only. This would
> > > require serialising accesses, too. There's some room in CCI register raw
> > > value space so this could be done without even changing that, say, with
> > > 8-bit page and 8-bit register address.
> > 
> > Hi Sakari, thank you for sharing your insights and guiding us. Could you 
> > please suggest if we should take up this work implementing the helpers 
> > in CCI and submit the patch or is it okay to leave it as-is for now and 
> > take care of updating in future once the implementation is ready.
> 
> I think it can live in the driver for now. Given that the device uses
> only 8 bits of register address, I would store the page number in bits
> 15:8 instead of bits 31:24, as the CCI helpers do not make bits 27:24
> available for driver-specific purpose.

I'd use the CCI private bits, the driver uses page numbers up to 4 so 4
bits are plenty for that. If we add pages to CCI later, this may be
refactored then.

-- 
Regards,

Sakari Ailus

