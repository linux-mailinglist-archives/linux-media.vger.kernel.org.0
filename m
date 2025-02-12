Return-Path: <linux-media+bounces-26047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FDAA322A0
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 10:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55AF93A9F07
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 09:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12B5207A07;
	Wed, 12 Feb 2025 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTRA1D3e"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FC0207650
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739353154; cv=none; b=GjcIVVEw7JV10k0+DSpx8erPhtsB3lUk2v/cppxbGlvzh3DFqG8e4tQBuHp4i8npnFcOuSjnaKCyRr7AiyPp2tuaZOkv6g3bBC6P68oRhsQ+Kv4Hie8+jXVap5eSwUzFYsSY/zdoBmg3eFcsyweQQCDOkR8u669JW3kRYtKzpTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739353154; c=relaxed/simple;
	bh=ceZi0WiE7IbCiRQ/gy47tAslG4f5+ioQwsgWkSqJgqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJWtvW5WIWhw5KCiAdqSz8EnG3cyH8uYCWybXWrpAdHzmfTW0tYWds6twjVwAicy2CmSdW/1efcPrnNLIu4y/pGjlQp1mIqqatqzuQ9fBUWDXExu645pLO9N1gJqzjUw0IIM/VFk0JZtZXhyd/xtw3pSy892zlfqMui9ICGn+FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTRA1D3e; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739353153; x=1770889153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ceZi0WiE7IbCiRQ/gy47tAslG4f5+ioQwsgWkSqJgqE=;
  b=YTRA1D3eVtOhgke5NNaX1impbBPX8WfSs5znHxMYHA4Ub/f5kVLhWVlz
   TghhHTMYrREl6aRC8gqy2firXKMjVK7KiSAFvIVd/kPOZ0ykcWyCuvQvT
   aDfLFQBPD6vLhh3raa0u1HH56LyiA8eL188sz3asq/YCGu/Oz+K4Xd6TE
   lxQ+Hviaxvunxz9FJw35Cq4S7+v5Q8DgEgQWNYxE2kgv7NCMHi1UBUsE0
   hn/WOS9/xt8ugMStorUHkLqyFLOzYK2OK+bvs42V2IBbu3pCbC0ukGCFK
   PHlKQt4u7zMKiNkFFm7akd0FPUb+Nk6kS9l/itesTTEO6UqzBOztLxDpR
   g==;
X-CSE-ConnectionGUID: zSblq2Q9SwSvkfiwalOVSQ==
X-CSE-MsgGUID: 9cP3fatbQ7m4/LcA3/pl7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="51395252"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="51395252"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 01:39:12 -0800
X-CSE-ConnectionGUID: Ocl02P78TlKHLrpKe17E/A==
X-CSE-MsgGUID: qYlSO75VTymYh8i65ykkHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="143621249"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 01:39:10 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9274711F7E8;
	Wed, 12 Feb 2025 11:39:07 +0200 (EET)
Date: Wed, 12 Feb 2025 09:39:07 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	hidenorik@chromium.org
Subject: Re: [PATCH] media: intel/ipu6: set the bus_info of the
 v4l2_capability
Message-ID: <Z6xsO1hU3_wQQoqT@kekkonen.localdomain>
References: <20250212075314.2291135-1-bingbu.cao@intel.com>
 <Z6xa5VleQumTgto9@kekkonen.localdomain>
 <6b8939b3-6d21-d8ab-27bd-02b04bab7d05@linux.intel.com>
 <4b6a4a24-30ff-143d-be61-457ea36ad9ff@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b6a4a24-30ff-143d-be61-457ea36ad9ff@linux.intel.com>

Hi Bingbu,

On Wed, Feb 12, 2025 at 05:20:54PM +0800, Bingbu Cao wrote:
> 
> On 2/12/25 5:14 PM, Bingbu Cao wrote:
> > 
> > 
> > On 2/12/25 4:25 PM, Sakari Ailus wrote:
> >> Hi Bingbu,
> >>
> >> Thanks for the patch.
> >>
> >> On Wed, Feb 12, 2025 at 03:53:14PM +0800, bingbu.cao@intel.com wrote:
> >>> From: Bingbu Cao <bingbu.cao@intel.com>
> >>>
> >>> IPU6 isys driver missed setting the bus_info of its v4l2_capability.
> >>> `v4l2-ctl --all` cannot show the bus_info. This patch copy the bus_info
> >>> from the media device to fill the v4l2_capability.
> >>>
> >>> Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffer queues")
> >>> Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
> >>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >>> ---
> >>>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> >>> index 387963529adb..3ca3f44da387 100644
> >>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> >>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> >>> @@ -146,6 +146,8 @@ static int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
> >>>  
> >>>  	strscpy(cap->driver, IPU6_ISYS_NAME, sizeof(cap->driver));
> >>>  	strscpy(cap->card, av->isys->media_dev.model, sizeof(cap->card));
> >>> +	strscpy(cap->bus_info, av->isys->media_dev.bus_info,
> >>> +		sizeof(cap->bus_info));
> >>
> >> Is there a need to do this? The bus_info is set by the framework based on
> >> struct video_device dev_parent field and that comes from struct v4l2_device
> >> dev field.
> >>
> > 
> > The v4l2_device.dev filed is set to the dev_parent which is auxdev.dev
> > instead of pdev. So the bus_info was not set by framework.
> >
> 
> I remember we made a change in isys_register_devices() :
> 
> - 	ret = v4l2_device_register(dev->parent, &isys->v4l2_dev);
> +	ret = v4l2_device_register(dev, &isys->v4l2_dev);

Right. I vaguely recall there were changes in device assignments over the
course of upstreaming, due to the sub-device driver module refcounting. So
I think this needs to stay as-is.

Instead, would assigning the dev_parent field in struct video_device
achieve this or would there be side effects? The other alternative is to
use media_set_bus_info().

-- 
Regards,

Sakari Ailus

