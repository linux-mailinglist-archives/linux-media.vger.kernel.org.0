Return-Path: <linux-media+bounces-19014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB6298E99C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 08:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D43451C2164F
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 06:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D16E6A8D2;
	Thu,  3 Oct 2024 06:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8qmB60c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFA3537F8;
	Thu,  3 Oct 2024 06:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727935343; cv=none; b=BBz1VFo/VQS6GidO7cubVjOxKUdNcnJS6P1p/UR5C7vK8xGhvA0HK+XMQ2Bea98V5mCJcbpYfuMC8Ve45N7IQtpKAyGtkxJrldx7f/kVK1TtyyXWMmwbkpX0jA+GE+E/LAYL21qIOjr5xo7MY+iid+eM56+SRHV/fUTZy8QpEtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727935343; c=relaxed/simple;
	bh=I9OKan9DUlhf/oLqJkG2nst+uBFBUoQzFFv737FNhfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWKZKwSwzcN65CYbaZwJERkbu1fA0VjfRgmpOYMm0euARsS+qWqgqUVtfCLbiK6rYf0dTtbv8LWDp2FKs6SQ+J9Dz4BGSZ7XZ6/PUTnXTSCkEmI/c/hMF5XT04bJu7skOpMXauOUs7E4yZx0GMWeq23V22TPL3cP/e6gJV7RIM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8qmB60c; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727935343; x=1759471343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I9OKan9DUlhf/oLqJkG2nst+uBFBUoQzFFv737FNhfs=;
  b=i8qmB60c148PThoCW/NnoNiGlQ6oZJ791wKSwGZBFAmwar8XQFgF7u5h
   qihzjBjjnZXfdedGGKSUZbOHHYXe156MkU5Igz4NXTI0QGQTI92yrtC11
   GBBXQjtbN+nPkbzVvneYdQOmfeNK1102vNG2LRHQd50W8Er89my6fESVz
   f/Rkd1hSbyUuAAWAGWaFXdLE3ljQMYjh0DppClKgaZ/yvqClPUjsqAAwv
   VgwQYOuGeiTYn/YwVqa6iYTIEse4OXh245b5LI6Bg0a4WTnEWJHMu+nbu
   fwRwFJeLeeOzk8iEVdeoF4OTlrALFQn5lB88DiyefXajBkTakPqyFUIGI
   w==;
X-CSE-ConnectionGUID: 7eD1sh+KQJajYspCAZtp9w==
X-CSE-MsgGUID: hOfRGyZ4SVyGVXV+BRCQlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27065919"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="27065919"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 23:02:22 -0700
X-CSE-ConnectionGUID: 9BmMbbPzSQ6Uz3pI0pmRBg==
X-CSE-MsgGUID: mMWuNEQsRRWSCVXURiJr2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="111703363"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 23:02:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8769F11F83B;
	Thu,  3 Oct 2024 09:02:16 +0300 (EEST)
Date: Thu, 3 Oct 2024 06:02:16 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, mhecht73@gmail.com,
	michael.roeder@avnet.eu, hverkuil@xs4all.nl,
	Martin Hecht <martin.hecht@avnet.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] media: i2c: alvium: add camera sysfs attributes
Message-ID: <Zv4zaBALocW0SL6q@kekkonen.localdomain>
References: <20240909105831.684371-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909105831.684371-1-tomm.merciai@gmail.com>

Hi Tommaso,

On Mon, Sep 09, 2024 at 12:58:29PM +0200, Tommaso Merciai wrote:
> Hi All,
> With this patch I'm going to add some sysfs attributes to the alvium-csi2 driver.
> This patch adds the following sysfs attributes:
> 
>  - cci_register_layout_version:
>    Shows current cci regs layout version of the camera.
> 
>  - csi_clock_mhz:
>    Shows current alvium camera csi2 freq.
> 
>  - device_capabilities:
>    Show the capabilities of the current camera.
> 
>  - device_guid:
>    Shows the current device guid as programmed by the vendor during production.
> 
>  - device_version:
>    Shows the version of the alvium hardware.
> 
>  - family_name:
>    Shows the Alvium family name, like Alvium CSI-2, GM2, FP3, ...
> 
>  - genio:
>    Generic camera input/output xfer for using user programmable part of the flash.
>    Reading and writing camera's user programmable flash memory.
> 
>  - lane_count:
>    Shows device current CSI2 camera's lanes number.
> 
>  - manufacturer_info:
>    Shows manufacturer info as programmed by the vendor during production.
> 
>  - manufacturer_name:
>    Shows manufacturer name as programmed by the vendor during production.
> 
>  - mode:
>    As stated by the BCRM Ref Manual camera can work in 2 modes BCM/GENCP.
>    This attribute is responsible for switching the camera mode and check the current mode.
> 
>  - model_name:
>    Shows model name as programmed by the vendor during production.
> 
>  - serial_number:
>    Shows camera serial number as programmed by the vendor during production.
> 
>  - user_defined_name:
>    Shows camera user defined name as programmed by the vendor during production.

I think most these would be better implemented as V4L2 controls. Some
appear to be internal to the driver and not matter from actual user space
implementation point of view, such as CCI register layout version and
possibly device capabilities to some extent. What would be the reason to
expose these to the user space?

What are the BCM and GENCP modes?

If there's a need to program the device's memory, the NVM interface would
seem like a better fit for that. Presumably this would be only accessible
for the root?

The lane count control should probably be standardised, there are other
devices that could benefit from it. The LINK_FREQ control already exists,
it conveys the (CSI-2) link frequency to the user.

-- 
Kind regards,

Sakari Ailus

