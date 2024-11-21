Return-Path: <linux-media+bounces-21761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F02D39D4DE0
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 14:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D9F5B211B1
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EA81D7E57;
	Thu, 21 Nov 2024 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bsl2xWmJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9EA74068;
	Thu, 21 Nov 2024 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732196134; cv=none; b=lwrXJjD902Yrnt8t6LbTJnfocYjGGk2s+IgYrfym/k6/wHh5mRTUwb/9DQ9SNi9CbOgQM5EXs6fRmG1GRBSQKkxCP2P6YoqxBx09TBcPA0oNh5yOXDXWXVDrDd59samXg4byAu3bIy4e+3v3HpGklMA9b6tFgMjr9EX/Yxmpz3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732196134; c=relaxed/simple;
	bh=noycbgP4PsyZPywg+z9UDRP/hJOHtMDGqxpMFtsP7Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2vtFAWjWlKrf+XxllMvhLP84g/DrVxD6b1iVEsFv4wYGmLi/4siaBpmjyV0FYuLKoEZXMVN4vRVb833mvC5v3WovU1b1y2fOsYSzlagGdMSG7qczx0WCY4QU6llRwZlz+FbxEvb8RigXquesbHI2iapPP0XF0cyPYkwVNL8tmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bsl2xWmJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732196133; x=1763732133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=noycbgP4PsyZPywg+z9UDRP/hJOHtMDGqxpMFtsP7Nc=;
  b=Bsl2xWmJQO3tOQV1ccKPsiMO4Wu2eht3Qm2i5nxokVUk72FwTrnGi8ld
   iFOhs2pqfIL0dgYcSr+zN+RIxv3ZSRZJKyxEPVUppatk7GKKbV8o3CmEn
   gFEH3Ln9wKVwlS3nfyCIgAxdTNm2nQssOPF3XW/wplTMnumS9TaYXKrtq
   CE87TufHYKKkQAvYKL7oyHE3+Y1emWIrCiDjJXhHOi5lxsLl+ycBXtBaW
   SC0EkIlxsmw+d4yIyZuJXc0HOEQieoeXVgULPY7tfP4u2a0O+2SNFUkkK
   1Ez3KH+dMNM5mrv97Hkz6o/UQNivext/dfZIwhTDEGuXTmx1Kyx2XNW1k
   Q==;
X-CSE-ConnectionGUID: 9HhA71+sQeSboKq1CqFKtw==
X-CSE-MsgGUID: ezlnj124R3W1wkgiI9RBfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43691378"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="43691378"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 05:35:32 -0800
X-CSE-ConnectionGUID: vX4zYwK+TiyfLlEQtH1+5w==
X-CSE-MsgGUID: 47aUcOP8S1m4WzoaVcLhZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="90640279"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 05:35:29 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D04E811F8D9;
	Thu, 21 Nov 2024 15:35:26 +0200 (EET)
Date: Thu, 21 Nov 2024 13:35:26 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
	git@xilinx.com, Sam Bobrowicz <sam@elite-embedded.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	"open list:V4L2 CAMERA SENSOR DRIVERS" <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: ov5640: fix get_light_freq on auto
Message-ID: <Zz83Hh6gKCFkxWtI@kekkonen.localdomain>
References: <cb9f8aca1f07472d4c794cc66ebbde1977ee9e95.1732195934.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb9f8aca1f07472d4c794cc66ebbde1977ee9e95.1732195934.git.michal.simek@amd.com>

Hi Michal,

On Thu, Nov 21, 2024 at 02:32:16PM +0100, Michal Simek wrote:
> From: Sam Bobrowicz <sam@elite-embedded.com>
> 
> Light frequency was not properly returned when in auto
> mode and the detected frequency was 60Hz.
> 
> Signed-off-by: Sam Bobrowicz <sam@elite-embedded.com>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  drivers/media/i2c/ov5640.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index c1d3fce4a7d3..8566bc2edde9 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1982,6 +1982,7 @@ static int ov5640_get_light_freq(struct ov5640_dev *sensor)
>  			light_freq = 50;
>  		} else {
>  			/* 60Hz */
> +			light_freq = 60;

Any idea where this issue was introduced?

It'd be good to add Fixes: and Cc: stable to this.

>  		}
>  	}
>  

-- 
Regards,

Sakari Ailus

