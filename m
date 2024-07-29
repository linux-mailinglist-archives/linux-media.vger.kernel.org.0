Return-Path: <linux-media+bounces-15411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEF493EDF1
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 09:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B37F2B224F9
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 07:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF8D12FB0A;
	Mon, 29 Jul 2024 07:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfYuodPH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB7782D9A;
	Mon, 29 Jul 2024 07:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722236605; cv=none; b=o2lJlUULVVe8HQHj2Ou73uQXdAYJe0spWswwh27v+vryOYlg/YBb1wg2OSNydcoHdSumtsLVNgEOimExGejyHRoDUuUAvufHhwXufwTM6LCguw8lfBnNfFmv+yP54DsBbaFIhOHpfI9LU2KcAEf8aXH5vHi7d7/0TFOu1/BL7w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722236605; c=relaxed/simple;
	bh=oq1A0MF+2MxWNbcXuYQlOhYTI9d0mzUcvFOBVMotSks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdm2g347QHltMT6AEZAm7o1tuOlOfAVCScRAdCiXLGCSJ1PAKttnG4uDrrqQreHPcrmZzLfVRow9J2+P9eBqUYQpDEKGGaYtN4P85/gngckB/sMlKIXvWwOS4fLOjNF4xF6R7WPgbsKFhL6aPvtvwXpKiCtfAijYZXiDLHAYtpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfYuodPH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722236603; x=1753772603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oq1A0MF+2MxWNbcXuYQlOhYTI9d0mzUcvFOBVMotSks=;
  b=NfYuodPHjL+27zRejEa/hDveSwnWIkrdAYsI0dA3UI/i4QPpCjLsDGLX
   l6q2GUDakZDcTJtR6T+msk46079WZrkD9svToqsUQx17g2aXLunh8DKwI
   BAC9T4ei7Fa4FaYtRuRa02zEtlgxVQl02YgCtpOHonl4y7zIvSnOuxFdB
   TS8KfUo2xdCSBXLsGwUlv/4Cx+/cboBzlEcIRB7D4EhMH4bL+yrmG447/
   VAxcpk9Gn7CJSzeZtXnXNuQ+sLoayF+kYtutY5b3hyAJK7T4M4DJsY4P5
   99oOlN8eMOhzR2vwdL6MVSuw2wRqqdCyxTgLW74ZeIngBFwaygeu6yeO9
   Q==;
X-CSE-ConnectionGUID: EU6oDituSEu8vTPzFHhuag==
X-CSE-MsgGUID: TQoMdWkdQdOZgiY4Ka+7Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="20151703"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="20151703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 00:03:22 -0700
X-CSE-ConnectionGUID: AimuV77fSfqpLootLhfPKw==
X-CSE-MsgGUID: nV4vFffYSCO9vJWBQaxiGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="53837611"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 00:03:20 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2E14311F8A8;
	Mon, 29 Jul 2024 10:03:17 +0300 (EEST)
Date: Mon, 29 Jul 2024 07:03:17 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: fix ipu6 Kconfig dependencies
Message-ID: <Zqc-tY7LPLdEbZ-9@kekkonen.localdomain>
References: <20240719095403.3607027-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719095403.3607027-1-arnd@kernel.org>

Hi Arnd,

On Fri, Jul 19, 2024 at 11:53:50AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Commit 4670c8c3fb04 ("media: ipu-bridge: Fix Kconfig dependencies") changed
> how IPU_BRIDGE dependencies are handled for all drivers, but the IPU6 variant
> was added the old way, which causes build time warnings when I2C is turned
> off:
> 
> WARNING: unmet direct dependencies detected for IPU_BRIDGE
>   Depends on [n]: MEDIA_SUPPORT [=m] && PCI [=y] && MEDIA_PCI_SUPPORT [=y] && (ACPI [=y] || COMPILE_TEST [=y]) && I2C [=n]
>   Selected by [m]:
>   - VIDEO_INTEL_IPU6 [=m] && MEDIA_SUPPORT [=m] && PCI [=y] && MEDIA_PCI_SUPPORT [=y] && (ACPI [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && X86 [=y] && X86_64 [=y] && HAS_DMA [=y]
> 
> To make it consistent with the other IPU drivers as well as avoid this warning,
> change the 'select' into 'depends on'.

Thanks for the patch. I'm not sure how I managed to miss the IPU6 driver...

I think we also need, besides IPU_BRIDGE, || !IPU_BRIDGE, as the IPU_BRIDGE
has additional dependencies (I2C) compared to VIDEO_INTEL_IPU6. I'll add
that while applying. Please let me know if you have concerns.

> 
> Fixes: c70281cc83d6 ("media: intel/ipu6: add Kconfig and Makefile")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/pci/intel/ipu6/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
> index 154343080c82..ffadf03478a8 100644
> --- a/drivers/media/pci/intel/ipu6/Kconfig
> +++ b/drivers/media/pci/intel/ipu6/Kconfig
> @@ -3,13 +3,13 @@ config VIDEO_INTEL_IPU6
>  	depends on ACPI || COMPILE_TEST
>  	depends on VIDEO_DEV
>  	depends on X86 && X86_64 && HAS_DMA
> +	depends on IPU_BRIDGE
>  	select DMA_OPS
>  	select IOMMU_IOVA
>  	select VIDEO_V4L2_SUBDEV_API
>  	select MEDIA_CONTROLLER
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_FWNODE
> -	select IPU_BRIDGE
>  	help
>  	  This is the 6th Gen Intel Image Processing Unit, found in Intel SoCs
>  	  and used for capturing images and video from camera sensors.

-- 
Kind regards,

Sakari Ailus

