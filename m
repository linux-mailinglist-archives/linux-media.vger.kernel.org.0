Return-Path: <linux-media+bounces-45228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F116EBFB97B
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 13:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9AB43ACB9B
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 11:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0724133030B;
	Wed, 22 Oct 2025 11:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AN9y4r6T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF02F363C;
	Wed, 22 Oct 2025 11:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131898; cv=none; b=ELTTzVGrrVdUjiM9rQZVqwpFooJ0YtgWfpYZ71ERoVEUqJFPie18QPxxfXHkMw1uUohb3IAmQoDO82sR1rkzmXlM4jqCOTiON4eiK4OSa4dxIK3P04K5jcngwqHhcMfWF408iaXuudXWlL0Pbe8Dp9HLjHtrBdSlzOq3q5zENrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131898; c=relaxed/simple;
	bh=1901YWV8QAqYLiWkqE3HU9VXDof/C1F9RGSdirmrns4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+7ZOxdUspQsbiUiC/vCM2Y4wTF0aVDR+Hhg/zEGYvKF2G3FreInGTxTqfca//6fJJ7MulBJ3O8l9NRfv87w011au1CQyvq28A4yiVdZcpThGwhJemxKJJ3aww0UoG5DTWwJy7l50zI71MdGlkzI9tODnoITa9yrJYNxdjAq1mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AN9y4r6T; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761131896; x=1792667896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1901YWV8QAqYLiWkqE3HU9VXDof/C1F9RGSdirmrns4=;
  b=AN9y4r6T3ywUvOECo6vRIRz+Bq/XGDhqdIFwSsu44BPpnbFxea5+UbNj
   aDK1B88YhtYx1xTclwyuuy4PgGhARyC3zjvP5/j4ck1Bx+0s+Hlxa5D0s
   lCoxtRCh2x0+GzIie9KBAsBKYvZhcHK3rs1a+CoxrCacVCpQkgDXkgI8W
   R2JebasMW3r7I8bj3X2V1CdKSczOSWvCdl6VAFAzByAAoInK31kAKVTX5
   7gGh4ZSgyyQoZWl+8i138MqXAc2lQfIjpw5jxq6EUTgzjnkE5xxa6PyKI
   Kn4ebZ0mZBPjF6xsQg39lng/kiVtPPNr2PPLr3MLa4TIL8TZEoA6M+mgJ
   Q==;
X-CSE-ConnectionGUID: UChtCx2BQ+Sv8EN4varOMg==
X-CSE-MsgGUID: QNnPipkMR+K+zBnQEKCliw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66916415"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="66916415"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 04:18:16 -0700
X-CSE-ConnectionGUID: 1agvuoLLTji72NddwreG1g==
X-CSE-MsgGUID: FS7bWDWqS1OhmbKwic0GUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="207518607"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 04:18:13 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 51F3F121E5B;
	Wed, 22 Oct 2025 14:18:11 +0300 (EEST)
Date: Wed, 22 Oct 2025 14:18:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
	david.plowman@raspberrypi.com, naush@raspberrypi.com,
	kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] v4l: controls: Add v4l2 control to store camera module
 identifier
Message-ID: <aPi9c_c9f0dkduLA@kekkonen.localdomain>
References: <20251021124121.93907-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021124121.93907-1-isaac.scott@ideasonboard.com>

Hi Isaac,

On Tue, Oct 21, 2025 at 01:41:21PM +0100, Isaac Scott wrote:
> Add a new v4l2 control ID that would be used by drivers to store a
> string representing a SKU or other vendor-specific camera module
> identifier. This would be used to tell user space which specific type of
> camera module is present in the system.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> 
> ---
> 
> Hi all,
> 
> This patch builds on the discussion here:
> 
> https://lore.kernel.org/all/20250507081338.53614-1-sakari.ailus@linux.intel.com/
> 
> regarding the need to be able to identify camera modules. This is useful
> when modules need to use the base driver of the camera sensor they
> include, but need adjustments to account for different module features.
> 
> The driver, or potentially core v4l2, would be responsible for setting
> this as a read-only control containing the SKU, or a vendor-specific
> identifier for a camera module.
> 
> A SKU is expected to cover the sensor (found in the compatible string),
> as well as the lens / packaging. For example, Raspberry Pi produce an
> IMX708 camera module with several variations; a lot of code duplication
> could be avoided in user space applications if a camera module
> identifier was available.
> 
> These could be expressed through the SKU instead of variations of the
> compatible string.
> 
> This would allow user space programs, such as libcamera, to select
> different configurations specific to that module to account for
> differences in lens characteristics, different CCMs, and more.
> 
> Tested on media/next
> 
> Best wishes,
> 
> Isaac
> ---
>  include/uapi/linux/v4l2-controls.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 2d30107e047e..39267bdd5286 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1102,6 +1102,8 @@ enum v4l2_auto_focus_range {
>  
>  #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
>  
> +#define V4L2_CID_CAMERA_MODULE_IDENTIFIER	(V4L2_CID_CAMERA_CLASS_BASE+37)

I'd add this to the image source class as the camera class is mainly for
USB webcams and alike.

I'd also wait until we've got the bindings agreed upon, so we could see
what to put here and if a single control is enough. More documentation is
also needed.

> +
>  /* FM Modulator class control IDs */
>  
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)

-- 
Kind regards,

Sakari Ailus

