Return-Path: <linux-media+bounces-27143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B88A2A4797A
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 10:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41F811722EF
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 09:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950FE227EB0;
	Thu, 27 Feb 2025 09:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LE/9j/7s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413CD270024;
	Thu, 27 Feb 2025 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649365; cv=none; b=oBMKjGWWeG/Xe2E3Z1SGJy0gJrgBSMCfZU3XNeqXpxJqpEZGPFQ3mygJGXpemO4ulQThzu/RbLeuoSSG4I79b9zncRpIlkWfWT3Fv7Mx/MDbn+iK3U6P7Z7MaE14NIgKzfrUQ+GfRWIwPuHRobeGK1vXAOcBEQ1H+YGQUT5/z1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649365; c=relaxed/simple;
	bh=oLNUegc/8XBTSty1DSCgLYoYhliXB9vD63U3ploOAAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=if6ejS+v4IDDBJd1NTZgXTV11a3rcLfR/vwuPH6hwQyFcjj/thlbkWXG03vIjEJ8bLLajeEVo6XRV3NCDbQV9pI4eGafwzGQiGUjCcfVelZ4bnSR4W1Ent4H+fOzYMMyubA+0tYp/n2Is6dqtGDTCv6ZjW1UU/X7yYTvOA63zAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LE/9j/7s; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740649363; x=1772185363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oLNUegc/8XBTSty1DSCgLYoYhliXB9vD63U3ploOAAY=;
  b=LE/9j/7sAx6yaVO4QhyJCGvHDH1n1TlgHI6aVhql/gHfnwq3iclMIflr
   CWV2u9ekVEcaIHWWNmRbZP6kw2n4uOR+4mxe/a6qEHZpGE1WgWLAxj6mN
   70XCH+rMTHy6zywkQvhP8sIYRvvuQ4/1YurRw5jO/JYrbE3X+J6AFNtBq
   6ThsugpbB5Qw1A/it7MbVL2MWZL0oVxbSpRwchvntl1ErfugpADjDwGRr
   E5GFGqDMpGeggMwxiHNRJnd+3p5MgAZZ2Gt6GrEPoUUCEFHNY7FBhcu72
   4IFjaxedtewrOHwRCamY0OEisFanS0/SIEoVl0Nx7AEpz+eT31BvwAU1L
   A==;
X-CSE-ConnectionGUID: M+SlBi5mRoaTrznA4G222w==
X-CSE-MsgGUID: bvO+j3t7QeqrJM78DRSySw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52943700"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52943700"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 01:42:42 -0800
X-CSE-ConnectionGUID: wKzqTMBVQQ6L/nWZSPpo/g==
X-CSE-MsgGUID: a0FFmI9oQsqIumUt9EzBcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="121986583"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 01:42:39 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C1B0C11F944;
	Thu, 27 Feb 2025 11:42:36 +0200 (EET)
Date: Thu, 27 Feb 2025 09:42:36 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, manuel.traut@mt.com
Subject: Re: [PATCH v1 7/8] MT9M114: Fix deadlock in
 get_frame_interval/set_frame_interval
Message-ID: <Z8AzjGF-vuMedinG@kekkonen.localdomain>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
 <20250226153929.274562-8-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226153929.274562-8-mathis.foerst@mt.com>

Hi Mathis,

On Wed, Feb 26, 2025 at 04:39:28PM +0100, Mathis Foerst wrote:
> Getting / Setting the frame interval using the V4L2 subdev pad ops
> get_frame_interval/set_frame_interval causes a deadlock, as the subdev
> state is locked in the [1] but also in the driver itself.
> 
> In [2] it's described that the caller is responsible to acquire and
> release the lock in this case. Therefore, acquiring the lock in the
> driver is wrong.
> 
> Remove the lock acquisitions/releases from mt9m114_ifp_get_frame_interval()
> and mt9m114_ifp_set_frame_interval().
> 
> [1] drivers/media/v4l2-core/v4l2-subdev.c - line 1129
> [2] Documentation/driver-api/media/v4l2-subdev.rst
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>

Could you add:

Fixes: 24d756e914fc ("media: i2c: Add driver for onsemi MT9M114 camera sensor")
Cc: stable@vger.kernel.org

-- 
Regards,

Sakari Ailus

