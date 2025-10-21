Return-Path: <linux-media+bounces-45110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDC9BF534C
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 10:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E93314E8F2F
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 08:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEB12F9998;
	Tue, 21 Oct 2025 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6rfIdlH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA60D19CC28
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 08:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761034704; cv=none; b=rOvxW1aEkdKlbcy5S53drJ4cDQfSpeLj2yLrSvE3bFwZ929DRCjF/MibqpC0shQP5ZxNb2EnkVE2kBxgIMQvpWZ7ysJupfZJ+49KTbvmMm50TdY3jKNBvcTqijYmbi2ZYW5ThVR0KBLa5K2i+5mHZwkmRCGzoaTd0CmPfXwzZxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761034704; c=relaxed/simple;
	bh=h/am4B0L0K0hiTzsSR+YlpyjkwkA9TtvuM6ncJ897vc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=BmLK7KgyFH1k/qKTh62Zkry5wpDcqWukJEkIFxAPv9AVLz+fr9pKs03Shv/hu188soTKmsdJbrnMolWgzIfVPkooSUp5G2ADawooFW3RD8NrTsqPc+9KxAsrlGq4XOtODJa1wv/FRjgBEj6BuEZ815RXVTeA6Vlgi4NJfrVrdHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6rfIdlH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761034702; x=1792570702;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=h/am4B0L0K0hiTzsSR+YlpyjkwkA9TtvuM6ncJ897vc=;
  b=E6rfIdlHvER5DPHMukU7SCx3s2u5YrR6iDxMZw2S8vy5QlttNlJDcSYZ
   Lk/hr0cmBLbfQr/QTLU+LOB/MJ1YDWqzeUomf0C/taN/wzaT/jtMrZWXk
   9gxCyVWl/nXHcQ2PC+flYhPmZ8uvNIVHNcCrLsaxr4BCt8R1j85jHYhbv
   KGhxBWC0MzKo3MKzQeGlbHStrjnzGWz2NIqZHkrdwjqYbndAwuf2Ghyf2
   H7WVsPsyaxyQjbKLtn6go35PBZ13FPrySv9x2NvEAxunvaX9p+OqazvK4
   DkxNPDi+DCzvzDi2mB6hFsUaNHer20Dxr8CSJEUsQWDTXm0y5pKu76xYG
   Q==;
X-CSE-ConnectionGUID: lZdmKxcDSSe/zYJ8gBBikA==
X-CSE-MsgGUID: kUQBW36mQES+jWvquEUfxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63196420"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="63196420"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 01:18:22 -0700
X-CSE-ConnectionGUID: XKTLglWZRtK8MoVgO3q2Ag==
X-CSE-MsgGUID: 0im5U1MgQbCCnpeC343d5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="183389933"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 01:18:21 -0700
Subject: Re: [PATCH] media: ipu6: isys: Add support for monochrome media bus
 formats
To: Hans de Goede <hansg@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>
Cc: linux-media@vger.kernel.org
References: <20251020153741.55404-1-hansg@kernel.org>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <0d13a805-fc50-b8dc-4f5f-b4c9d24ea77a@linux.intel.com>
Date: Tue, 21 Oct 2025 16:10:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251020153741.55404-1-hansg@kernel.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hans,

Thanks for the patch.

On 10/20/25 11:37 PM, Hans de Goede wrote:
> Add support for monochrome media bus formats, for use with monochrome/IR
> camera sensors.
> 
> This has been tested on a Dell XPS 13 9320 with OV1A1B IR sensor.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  4 +++
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 34 ++++++++++++++-----
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 14 ++++++++
>  3 files changed, 43 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index d1fece6210ab..daec6b865bda 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -42,6 +42,10 @@ static const u32 csi2_supported_codes[] = {
>  	MEDIA_BUS_FMT_SGBRG8_1X8,
>  	MEDIA_BUS_FMT_SGRBG8_1X8,
>  	MEDIA_BUS_FMT_SRGGB8_1X8,
> +	MEDIA_BUS_FMT_Y8_1X8,
> +	MEDIA_BUS_FMT_Y10_1X10,
> +	MEDIA_BUS_FMT_Y12_1X12,
> +	MEDIA_BUS_FMT_Y16_1X16,
>  	MEDIA_BUS_FMT_META_8,
>  	MEDIA_BUS_FMT_META_10,
>  	MEDIA_BUS_FMT_META_12,
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> index 463a0adf9e13..869e7d4ba572 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> @@ -25,24 +25,28 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
>  	case MEDIA_BUS_FMT_RGB565_1X16:
>  	case MEDIA_BUS_FMT_UYVY8_1X16:
>  	case MEDIA_BUS_FMT_YUYV8_1X16:
> +	case MEDIA_BUS_FMT_Y16_1X16:
>  	case MEDIA_BUS_FMT_META_16:
>  		return 16;
>  	case MEDIA_BUS_FMT_SBGGR12_1X12:
>  	case MEDIA_BUS_FMT_SGBRG12_1X12:
>  	case MEDIA_BUS_FMT_SGRBG12_1X12:
>  	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +	case MEDIA_BUS_FMT_Y12_1X12:
>  	case MEDIA_BUS_FMT_META_12:
>  		return 12;
>  	case MEDIA_BUS_FMT_SBGGR10_1X10:
>  	case MEDIA_BUS_FMT_SGBRG10_1X10:
>  	case MEDIA_BUS_FMT_SGRBG10_1X10:
>  	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_Y10_1X10:
>  	case MEDIA_BUS_FMT_META_10:
>  		return 10;
>  	case MEDIA_BUS_FMT_SBGGR8_1X8:
>  	case MEDIA_BUS_FMT_SGBRG8_1X8:
>  	case MEDIA_BUS_FMT_SGRBG8_1X8:
>  	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_Y8_1X8:
>  	case MEDIA_BUS_FMT_META_8:
>  		return 8;
>  	default:
> @@ -65,21 +69,25 @@ unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
>  	case MEDIA_BUS_FMT_SGBRG16_1X16:
>  	case MEDIA_BUS_FMT_SGRBG16_1X16:
>  	case MEDIA_BUS_FMT_SRGGB16_1X16:
> +	case MEDIA_BUS_FMT_Y16_1X16:
>  		return MIPI_CSI2_DT_RAW16;
>  	case MEDIA_BUS_FMT_SBGGR12_1X12:
>  	case MEDIA_BUS_FMT_SGBRG12_1X12:
>  	case MEDIA_BUS_FMT_SGRBG12_1X12:
>  	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +	case MEDIA_BUS_FMT_Y12_1X12:
>  		return MIPI_CSI2_DT_RAW12;
>  	case MEDIA_BUS_FMT_SBGGR10_1X10:
>  	case MEDIA_BUS_FMT_SGBRG10_1X10:
>  	case MEDIA_BUS_FMT_SGRBG10_1X10:
>  	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_Y10_1X10:
>  		return MIPI_CSI2_DT_RAW10;
>  	case MEDIA_BUS_FMT_SBGGR8_1X8:
>  	case MEDIA_BUS_FMT_SGBRG8_1X8:
>  	case MEDIA_BUS_FMT_SGRBG8_1X8:
>  	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_Y8_1X8:
>  		return MIPI_CSI2_DT_RAW8;
>  	case MEDIA_BUS_FMT_META_8:
>  	case MEDIA_BUS_FMT_META_10:
> @@ -96,15 +104,23 @@ unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
>  
>  bool ipu6_isys_is_bayer_format(u32 code)
>  {
> -	switch (ipu6_isys_mbus_code_to_mipi(code)) {
> -	case MIPI_CSI2_DT_RAW8:
> -	case MIPI_CSI2_DT_RAW10:
> -	case MIPI_CSI2_DT_RAW12:
> -	case MIPI_CSI2_DT_RAW14:
> -	case MIPI_CSI2_DT_RAW16:
> -	case MIPI_CSI2_DT_RAW20:
> -	case MIPI_CSI2_DT_RAW24:
> -	case MIPI_CSI2_DT_RAW28:
> +	switch (code) {
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB16_1X16:
> +	case MEDIA_BUS_FMT_SGRBG16_1X16:
> +	case MEDIA_BUS_FMT_SGBRG16_1X16:
> +	case MEDIA_BUS_FMT_SBGGR16_1X16:
>  		return true;
>  	default:
>  		return false;
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index f3f3bc0615e5..dec8f5ffcfa5 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -77,6 +77,20 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
>  	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
>  	{ V4L2_PIX_FMT_SRGGB10P, 10, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
>  	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
> +
> +	{ V4L2_PIX_FMT_GREY, 8, 8, MEDIA_BUS_FMT_Y8_1X8,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
> +	{ V4L2_PIX_FMT_Y10, 16, 10, MEDIA_BUS_FMT_Y10_1X10,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> +	{ V4L2_PIX_FMT_Y12, 16, 12, MEDIA_BUS_FMT_Y12_1X12,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> +	{ V4L2_PIX_FMT_Y16, 16, 16, MEDIA_BUS_FMT_Y16_1X16,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> +	{ V4L2_PIX_FMT_Y10P, 10, 10, MEDIA_BUS_FMT_Y10_1X10,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
> +	{ V4L2_PIX_FMT_Y12P, 12, 12, MEDIA_BUS_FMT_Y12_1X12,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },

The code looks fine for me. I am wondering which sensor to test these
packed format for IPU6.

> +
>  	{ V4L2_PIX_FMT_UYVY, 16, 16, MEDIA_BUS_FMT_UYVY8_1X16,
>  	  IPU6_FW_ISYS_FRAME_FORMAT_UYVY},
>  	{ V4L2_PIX_FMT_YUYV, 16, 16, MEDIA_BUS_FMT_YUYV8_1X16,
> 

-- 
Best regards,
Bingbu Cao

