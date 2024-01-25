Return-Path: <linux-media+bounces-4176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DBC83C13F
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 12:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB6161C22589
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 11:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D15C2CCBA;
	Thu, 25 Jan 2024 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7u9n94G"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C1012E45
	for <linux-media@vger.kernel.org>; Thu, 25 Jan 2024 11:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706183154; cv=none; b=SHNxe6qitOIq2E0lYdSPsLL6L/07n964Q8LGd3nLkjhuWRTKXHfD8GYd7K7bmHz633cAC6Pn+qvCZZrxQv77TXSGwSNtvRWCAuvDxAvaWqEodqYvaxi5vE5mq3zguRjMYPrQ8x1/s5weTpkxGiK684yVqSaiWzhgSM4rzBDo04Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706183154; c=relaxed/simple;
	bh=ncdibyQ/vTGvuzjALdtKnO+fMYnvo2VLuA8LtYjBbSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsG8xOw67TBKOQerNm9JxozRUC5ULeuMPfYi6YUyccMz6WrK4bDLs+tAu2rkdNWdHumtMqFFs2furNKVFEiFvrMfG3Ng69br205Zk/uWiMOvL+gPlvgXUbRXKXnNzv4mpz+9tX7Y8Z4O139f1jEnGNgf0LPMfEHzRYdRR507+mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7u9n94G; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706183152; x=1737719152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ncdibyQ/vTGvuzjALdtKnO+fMYnvo2VLuA8LtYjBbSo=;
  b=X7u9n94GKEduuCcrlmTZGeTC/NT2HLsvXjwiIxqhneEe2AlPSeJDYCWg
   WqEfzXkzCTtxHP7HfZbDfdbqXO5mb68nTX8iuK4W5HSBpf3GIvoJ13QV/
   m65g6I2O1uW+SejTPWTr1mA7TDLAhHGFGPsXE5U03ojl49s69BupOj7iq
   VVBsDPYY3R8iZrkhOD90ImrYYDaqZ7acuRpCi6gy/f3O7YbWwls1XX6pJ
   q665dnZJ3xVBSMRh45Zskzy8aWKRcaigJerInUCtTB2jg04QYvmuTG0GX
   i8ZQwdKIRVqIPYptyf3cNuBoapbmz5Hfrn8f1LPWjlsjjgr+xPfAnz60T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8794076"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8794076"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 03:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="877030417"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="877030417"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 03:45:48 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E3A8F11FAD4;
	Thu, 25 Jan 2024 13:38:58 +0200 (EET)
Date: Thu, 25 Jan 2024 11:38:58 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Chen, Jason Z" <jason.z.chen@intel.com>
Cc: tfiga@chromium.org, senozhatsky@chromium.org,
	bingbu.cao@linux.intel.com, linux-media@vger.kernel.org,
	andy.yeh@intel.com, qingwu.zhang@intel.com
Subject: Re: [PATCH v6] media: ov08x40: Reduce start streaming time
Message-ID: <ZbJIUifwktbz1MS5@kekkonen.localdomain>
References: <20240124144301.1126453-1-jason.z.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124144301.1126453-1-jason.z.chen@intel.com>

Hi Jason,

Thanks for the update.

On Wed, Jan 24, 2024 at 10:43:01PM +0800, Chen, Jason Z wrote:
> From: Jason Chen <jason.z.chen@intel.com>
> 
> Because video duration involves calculating the streaming time, and i2c
> communication incurs too many XTALK register settings every 4 bytes with
> i2c START and STOP.
> 
> So we have opted switch to the i2c burst method.
> This method involves writing the XTALK registers in the order of
> the register block.
> 
> The start streaming time can be reduced from around 400ms to 150ms
> 
> Signed-off-by: Jason Chen <jason.z.chen@intel.com>
> ---
>  drivers/media/i2c/ov08x40.c | 1211 ++---------------------------------
>  1 file changed, 59 insertions(+), 1152 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index ddcb4b6848b..01cf3b8be6c 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2022 Intel Corporation.
>  
> +#include <asm-generic/unaligned.h>
>  #include <linux/acpi.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> @@ -95,6 +96,12 @@
>  /* Vertical Window Offset */
>  #define OV08X40_REG_V_WIN_OFFSET	0x3813
>  
> +/* Burst Register */
> +#define OV08X40_REG_XTALK_FIRST_A	0x5a80
> +#define OV08X40_REG_XTALK_LAST_A	0x5b9f
> +#define OV08X40_REG_XTALK_FIRST_B	0x5bc0
> +#define OV08X40_REG_XTALK_LAST_B	0x5f1f
> +
>  enum {
>  	OV08X40_LINK_FREQ_400MHZ_INDEX,
>  };
> @@ -682,1158 +689,6 @@ static const struct ov08x40_reg mode_3856x2416_regs[] = {
>  	{0x3502, 0x10},
>  	{0x3508, 0x0f},
>  	{0x3509, 0x80},
> -	{0x5a80, 0x75},
> -	{0x5a81, 0x75},
> -	{0x5a82, 0x75},
> -	{0x5a83, 0x75},
> -	{0x5a84, 0x75},
> -	{0x5a85, 0x75},
> -	{0x5a86, 0x75},
> -	{0x5a87, 0x75},
> -	{0x5a88, 0x75},
> -	{0x5a89, 0x75},
> -	{0x5a8a, 0x75},
> -	{0x5a8b, 0x75},
> -	{0x5a8c, 0x75},
> -	{0x5a8d, 0x75},
> -	{0x5a8e, 0x75},
> -	{0x5a8f, 0x75},
> -	{0x5a90, 0x75},
> -	{0x5a91, 0x75},
> -	{0x5a92, 0x75},
> -	{0x5a93, 0x75},
> -	{0x5a94, 0x75},
> -	{0x5a95, 0x75},
> -	{0x5a96, 0x75},
> -	{0x5a97, 0x75},
> -	{0x5a98, 0x75},
> -	{0x5a99, 0x75},
> -	{0x5a9a, 0x75},
> -	{0x5a9b, 0x75},
> -	{0x5a9c, 0x75},
> -	{0x5a9d, 0x75},
> -	{0x5a9e, 0x75},
> -	{0x5a9f, 0x75},
> -	{0x5aa0, 0x75},
> -	{0x5aa1, 0x75},
> -	{0x5aa2, 0x75},
> -	{0x5aa3, 0x75},
> -	{0x5aa4, 0x75},
> -	{0x5aa5, 0x75},
> -	{0x5aa6, 0x75},
> -	{0x5aa7, 0x75},
> -	{0x5aa8, 0x75},
> -	{0x5aa9, 0x75},
> -	{0x5aaa, 0x75},
> -	{0x5aab, 0x75},
> -	{0x5aac, 0x75},
> -	{0x5aad, 0x75},
> -	{0x5aae, 0x75},
> -	{0x5aaf, 0x75},
> -	{0x5ab0, 0x75},
> -	{0x5ab1, 0x75},
> -	{0x5ab2, 0x75},
> -	{0x5ab3, 0x75},
> -	{0x5ab4, 0x75},
> -	{0x5ab5, 0x75},
> -	{0x5ab6, 0x75},
> -	{0x5ab7, 0x75},
> -	{0x5ab8, 0x75},
> -	{0x5ab9, 0x75},
> -	{0x5aba, 0x75},
> -	{0x5abb, 0x75},
> -	{0x5abc, 0x75},
> -	{0x5abd, 0x75},
> -	{0x5abe, 0x75},
> -	{0x5abf, 0x75},
> -	{0x5ac0, 0x75},
> -	{0x5ac1, 0x75},
> -	{0x5ac2, 0x75},
> -	{0x5ac3, 0x75},
> -	{0x5ac4, 0x75},
> -	{0x5ac5, 0x75},
> -	{0x5ac6, 0x75},
> -	{0x5ac7, 0x75},
> -	{0x5ac8, 0x75},
> -	{0x5ac9, 0x75},
> -	{0x5aca, 0x75},
> -	{0x5acb, 0x75},
> -	{0x5acc, 0x75},
> -	{0x5acd, 0x75},
> -	{0x5ace, 0x75},
> -	{0x5acf, 0x75},
> -	{0x5ad0, 0x75},
> -	{0x5ad1, 0x75},
> -	{0x5ad2, 0x75},
> -	{0x5ad3, 0x75},
> -	{0x5ad4, 0x75},
> -	{0x5ad5, 0x75},
> -	{0x5ad6, 0x75},
> -	{0x5ad7, 0x75},
> -	{0x5ad8, 0x75},
> -	{0x5ad9, 0x75},
> -	{0x5ada, 0x75},
> -	{0x5adb, 0x75},
> -	{0x5adc, 0x75},
> -	{0x5add, 0x75},
> -	{0x5ade, 0x75},
> -	{0x5adf, 0x75},
> -	{0x5ae0, 0x75},
> -	{0x5ae1, 0x75},
> -	{0x5ae2, 0x75},
> -	{0x5ae3, 0x75},
> -	{0x5ae4, 0x75},
> -	{0x5ae5, 0x75},
> -	{0x5ae6, 0x75},
> -	{0x5ae7, 0x75},
> -	{0x5ae8, 0x75},
> -	{0x5ae9, 0x75},
> -	{0x5aea, 0x75},
> -	{0x5aeb, 0x75},
> -	{0x5aec, 0x75},
> -	{0x5aed, 0x75},
> -	{0x5aee, 0x75},
> -	{0x5aef, 0x75},
> -	{0x5af0, 0x75},
> -	{0x5af1, 0x75},
> -	{0x5af2, 0x75},
> -	{0x5af3, 0x75},
> -	{0x5af4, 0x75},
> -	{0x5af5, 0x75},
> -	{0x5af6, 0x75},
> -	{0x5af7, 0x75},
> -	{0x5af8, 0x75},
> -	{0x5af9, 0x75},
> -	{0x5afa, 0x75},
> -	{0x5afb, 0x75},
> -	{0x5afc, 0x75},
> -	{0x5afd, 0x75},
> -	{0x5afe, 0x75},
> -	{0x5aff, 0x75},
> -	{0x5b00, 0x75},
> -	{0x5b01, 0x75},
> -	{0x5b02, 0x75},
> -	{0x5b03, 0x75},
> -	{0x5b04, 0x75},
> -	{0x5b05, 0x75},
> -	{0x5b06, 0x75},
> -	{0x5b07, 0x75},
> -	{0x5b08, 0x75},
> -	{0x5b09, 0x75},
> -	{0x5b0a, 0x75},
> -	{0x5b0b, 0x75},
> -	{0x5b0c, 0x75},
> -	{0x5b0d, 0x75},
> -	{0x5b0e, 0x75},
> -	{0x5b0f, 0x75},
> -	{0x5b10, 0x75},
> -	{0x5b11, 0x75},
> -	{0x5b12, 0x75},
> -	{0x5b13, 0x75},
> -	{0x5b14, 0x75},
> -	{0x5b15, 0x75},
> -	{0x5b16, 0x75},
> -	{0x5b17, 0x75},
> -	{0x5b18, 0x75},
> -	{0x5b19, 0x75},
> -	{0x5b1a, 0x75},
> -	{0x5b1b, 0x75},
> -	{0x5b1c, 0x75},
> -	{0x5b1d, 0x75},
> -	{0x5b1e, 0x75},
> -	{0x5b1f, 0x75},
> -	{0x5b20, 0x75},
> -	{0x5b21, 0x75},
> -	{0x5b22, 0x75},
> -	{0x5b23, 0x75},
> -	{0x5b24, 0x75},
> -	{0x5b25, 0x75},
> -	{0x5b26, 0x75},
> -	{0x5b27, 0x75},
> -	{0x5b28, 0x75},
> -	{0x5b29, 0x75},
> -	{0x5b2a, 0x75},
> -	{0x5b2b, 0x75},
> -	{0x5b2c, 0x75},
> -	{0x5b2d, 0x75},
> -	{0x5b2e, 0x75},
> -	{0x5b2f, 0x75},
> -	{0x5b30, 0x75},
> -	{0x5b31, 0x75},
> -	{0x5b32, 0x75},
> -	{0x5b33, 0x75},
> -	{0x5b34, 0x75},
> -	{0x5b35, 0x75},
> -	{0x5b36, 0x75},
> -	{0x5b37, 0x75},
> -	{0x5b38, 0x75},
> -	{0x5b39, 0x75},
> -	{0x5b3a, 0x75},
> -	{0x5b3b, 0x75},
> -	{0x5b3c, 0x75},
> -	{0x5b3d, 0x75},
> -	{0x5b3e, 0x75},
> -	{0x5b3f, 0x75},
> -	{0x5b40, 0x75},
> -	{0x5b41, 0x75},
> -	{0x5b42, 0x75},
> -	{0x5b43, 0x75},
> -	{0x5b44, 0x75},
> -	{0x5b45, 0x75},
> -	{0x5b46, 0x75},
> -	{0x5b47, 0x75},
> -	{0x5b48, 0x75},
> -	{0x5b49, 0x75},
> -	{0x5b4a, 0x75},
> -	{0x5b4b, 0x75},
> -	{0x5b4c, 0x75},
> -	{0x5b4d, 0x75},
> -	{0x5b4e, 0x75},
> -	{0x5b4f, 0x75},
> -	{0x5b50, 0x75},
> -	{0x5b51, 0x75},
> -	{0x5b52, 0x75},
> -	{0x5b53, 0x75},
> -	{0x5b54, 0x75},
> -	{0x5b55, 0x75},
> -	{0x5b56, 0x75},
> -	{0x5b57, 0x75},
> -	{0x5b58, 0x75},
> -	{0x5b59, 0x75},
> -	{0x5b5a, 0x75},
> -	{0x5b5b, 0x75},
> -	{0x5b5c, 0x75},
> -	{0x5b5d, 0x75},
> -	{0x5b5e, 0x75},
> -	{0x5b5f, 0x75},
> -	{0x5b60, 0x75},
> -	{0x5b61, 0x75},
> -	{0x5b62, 0x75},
> -	{0x5b63, 0x75},
> -	{0x5b64, 0x75},
> -	{0x5b65, 0x75},
> -	{0x5b66, 0x75},
> -	{0x5b67, 0x75},
> -	{0x5b68, 0x75},
> -	{0x5b69, 0x75},
> -	{0x5b6a, 0x75},
> -	{0x5b6b, 0x75},
> -	{0x5b6c, 0x75},
> -	{0x5b6d, 0x75},
> -	{0x5b6e, 0x75},
> -	{0x5b6f, 0x75},
> -	{0x5b70, 0x75},
> -	{0x5b71, 0x75},
> -	{0x5b72, 0x75},
> -	{0x5b73, 0x75},
> -	{0x5b74, 0x75},
> -	{0x5b75, 0x75},
> -	{0x5b76, 0x75},
> -	{0x5b77, 0x75},
> -	{0x5b78, 0x75},
> -	{0x5b79, 0x75},
> -	{0x5b7a, 0x75},
> -	{0x5b7b, 0x75},
> -	{0x5b7c, 0x75},
> -	{0x5b7d, 0x75},
> -	{0x5b7e, 0x75},
> -	{0x5b7f, 0x75},
> -	{0x5b80, 0x75},
> -	{0x5b81, 0x75},
> -	{0x5b82, 0x75},
> -	{0x5b83, 0x75},
> -	{0x5b84, 0x75},
> -	{0x5b85, 0x75},
> -	{0x5b86, 0x75},
> -	{0x5b87, 0x75},
> -	{0x5b88, 0x75},
> -	{0x5b89, 0x75},
> -	{0x5b8a, 0x75},
> -	{0x5b8b, 0x75},
> -	{0x5b8c, 0x75},
> -	{0x5b8d, 0x75},
> -	{0x5b8e, 0x75},
> -	{0x5b8f, 0x75},
> -	{0x5b90, 0x75},
> -	{0x5b91, 0x75},
> -	{0x5b92, 0x75},
> -	{0x5b93, 0x75},
> -	{0x5b94, 0x75},
> -	{0x5b95, 0x75},
> -	{0x5b96, 0x75},
> -	{0x5b97, 0x75},
> -	{0x5b98, 0x75},
> -	{0x5b99, 0x75},
> -	{0x5b9a, 0x75},
> -	{0x5b9b, 0x75},
> -	{0x5b9c, 0x75},
> -	{0x5b9d, 0x75},
> -	{0x5b9e, 0x75},
> -	{0x5b9f, 0x75},
> -	{0x5bc0, 0x75},
> -	{0x5bc1, 0x75},
> -	{0x5bc2, 0x75},
> -	{0x5bc3, 0x75},
> -	{0x5bc4, 0x75},
> -	{0x5bc5, 0x75},
> -	{0x5bc6, 0x75},
> -	{0x5bc7, 0x75},
> -	{0x5bc8, 0x75},
> -	{0x5bc9, 0x75},
> -	{0x5bca, 0x75},
> -	{0x5bcb, 0x75},
> -	{0x5bcc, 0x75},
> -	{0x5bcd, 0x75},
> -	{0x5bce, 0x75},
> -	{0x5bcf, 0x75},
> -	{0x5bd0, 0x75},
> -	{0x5bd1, 0x75},
> -	{0x5bd2, 0x75},
> -	{0x5bd3, 0x75},
> -	{0x5bd4, 0x75},
> -	{0x5bd5, 0x75},
> -	{0x5bd6, 0x75},
> -	{0x5bd7, 0x75},
> -	{0x5bd8, 0x75},
> -	{0x5bd9, 0x75},
> -	{0x5bda, 0x75},
> -	{0x5bdb, 0x75},
> -	{0x5bdc, 0x75},
> -	{0x5bdd, 0x75},
> -	{0x5bde, 0x75},
> -	{0x5bdf, 0x75},
> -	{0x5be0, 0x75},
> -	{0x5be1, 0x75},
> -	{0x5be2, 0x75},
> -	{0x5be3, 0x75},
> -	{0x5be4, 0x75},
> -	{0x5be5, 0x75},
> -	{0x5be6, 0x75},
> -	{0x5be7, 0x75},
> -	{0x5be8, 0x75},
> -	{0x5be9, 0x75},
> -	{0x5bea, 0x75},
> -	{0x5beb, 0x75},
> -	{0x5bec, 0x75},
> -	{0x5bed, 0x75},
> -	{0x5bee, 0x75},
> -	{0x5bef, 0x75},
> -	{0x5bf0, 0x75},
> -	{0x5bf1, 0x75},
> -	{0x5bf2, 0x75},
> -	{0x5bf3, 0x75},
> -	{0x5bf4, 0x75},
> -	{0x5bf5, 0x75},
> -	{0x5bf6, 0x75},
> -	{0x5bf7, 0x75},
> -	{0x5bf8, 0x75},
> -	{0x5bf9, 0x75},
> -	{0x5bfa, 0x75},
> -	{0x5bfb, 0x75},
> -	{0x5bfc, 0x75},
> -	{0x5bfd, 0x75},
> -	{0x5bfe, 0x75},
> -	{0x5bff, 0x75},
> -	{0x5c00, 0x75},
> -	{0x5c01, 0x75},
> -	{0x5c02, 0x75},
> -	{0x5c03, 0x75},
> -	{0x5c04, 0x75},
> -	{0x5c05, 0x75},
> -	{0x5c06, 0x75},
> -	{0x5c07, 0x75},
> -	{0x5c08, 0x75},
> -	{0x5c09, 0x75},
> -	{0x5c0a, 0x75},
> -	{0x5c0b, 0x75},
> -	{0x5c0c, 0x75},
> -	{0x5c0d, 0x75},
> -	{0x5c0e, 0x75},
> -	{0x5c0f, 0x75},
> -	{0x5c10, 0x75},
> -	{0x5c11, 0x75},
> -	{0x5c12, 0x75},
> -	{0x5c13, 0x75},
> -	{0x5c14, 0x75},
> -	{0x5c15, 0x75},
> -	{0x5c16, 0x75},
> -	{0x5c17, 0x75},
> -	{0x5c18, 0x75},
> -	{0x5c19, 0x75},
> -	{0x5c1a, 0x75},
> -	{0x5c1b, 0x75},
> -	{0x5c1c, 0x75},
> -	{0x5c1d, 0x75},
> -	{0x5c1e, 0x75},
> -	{0x5c1f, 0x75},
> -	{0x5c20, 0x75},
> -	{0x5c21, 0x75},
> -	{0x5c22, 0x75},
> -	{0x5c23, 0x75},
> -	{0x5c24, 0x75},
> -	{0x5c25, 0x75},
> -	{0x5c26, 0x75},
> -	{0x5c27, 0x75},
> -	{0x5c28, 0x75},
> -	{0x5c29, 0x75},
> -	{0x5c2a, 0x75},
> -	{0x5c2b, 0x75},
> -	{0x5c2c, 0x75},
> -	{0x5c2d, 0x75},
> -	{0x5c2e, 0x75},
> -	{0x5c2f, 0x75},
> -	{0x5c30, 0x75},
> -	{0x5c31, 0x75},
> -	{0x5c32, 0x75},
> -	{0x5c33, 0x75},
> -	{0x5c34, 0x75},
> -	{0x5c35, 0x75},
> -	{0x5c36, 0x75},
> -	{0x5c37, 0x75},
> -	{0x5c38, 0x75},
> -	{0x5c39, 0x75},
> -	{0x5c3a, 0x75},
> -	{0x5c3b, 0x75},
> -	{0x5c3c, 0x75},
> -	{0x5c3d, 0x75},
> -	{0x5c3e, 0x75},
> -	{0x5c3f, 0x75},
> -	{0x5c40, 0x75},
> -	{0x5c41, 0x75},
> -	{0x5c42, 0x75},
> -	{0x5c43, 0x75},
> -	{0x5c44, 0x75},
> -	{0x5c45, 0x75},
> -	{0x5c46, 0x75},
> -	{0x5c47, 0x75},
> -	{0x5c48, 0x75},
> -	{0x5c49, 0x75},
> -	{0x5c4a, 0x75},
> -	{0x5c4b, 0x75},
> -	{0x5c4c, 0x75},
> -	{0x5c4d, 0x75},
> -	{0x5c4e, 0x75},
> -	{0x5c4f, 0x75},
> -	{0x5c50, 0x75},
> -	{0x5c51, 0x75},
> -	{0x5c52, 0x75},
> -	{0x5c53, 0x75},
> -	{0x5c54, 0x75},
> -	{0x5c55, 0x75},
> -	{0x5c56, 0x75},
> -	{0x5c57, 0x75},
> -	{0x5c58, 0x75},
> -	{0x5c59, 0x75},
> -	{0x5c5a, 0x75},
> -	{0x5c5b, 0x75},
> -	{0x5c5c, 0x75},
> -	{0x5c5d, 0x75},
> -	{0x5c5e, 0x75},
> -	{0x5c5f, 0x75},
> -	{0x5c60, 0x75},
> -	{0x5c61, 0x75},
> -	{0x5c62, 0x75},
> -	{0x5c63, 0x75},
> -	{0x5c64, 0x75},
> -	{0x5c65, 0x75},
> -	{0x5c66, 0x75},
> -	{0x5c67, 0x75},
> -	{0x5c68, 0x75},
> -	{0x5c69, 0x75},
> -	{0x5c6a, 0x75},
> -	{0x5c6b, 0x75},
> -	{0x5c6c, 0x75},
> -	{0x5c6d, 0x75},
> -	{0x5c6e, 0x75},
> -	{0x5c6f, 0x75},
> -	{0x5c70, 0x75},
> -	{0x5c71, 0x75},
> -	{0x5c72, 0x75},
> -	{0x5c73, 0x75},
> -	{0x5c74, 0x75},
> -	{0x5c75, 0x75},
> -	{0x5c76, 0x75},
> -	{0x5c77, 0x75},
> -	{0x5c78, 0x75},
> -	{0x5c79, 0x75},
> -	{0x5c7a, 0x75},
> -	{0x5c7b, 0x75},
> -	{0x5c7c, 0x75},
> -	{0x5c7d, 0x75},
> -	{0x5c7e, 0x75},
> -	{0x5c7f, 0x75},
> -	{0x5c80, 0x75},
> -	{0x5c81, 0x75},
> -	{0x5c82, 0x75},
> -	{0x5c83, 0x75},
> -	{0x5c84, 0x75},
> -	{0x5c85, 0x75},
> -	{0x5c86, 0x75},
> -	{0x5c87, 0x75},
> -	{0x5c88, 0x75},
> -	{0x5c89, 0x75},
> -	{0x5c8a, 0x75},
> -	{0x5c8b, 0x75},
> -	{0x5c8c, 0x75},
> -	{0x5c8d, 0x75},
> -	{0x5c8e, 0x75},
> -	{0x5c8f, 0x75},
> -	{0x5c90, 0x75},
> -	{0x5c91, 0x75},
> -	{0x5c92, 0x75},
> -	{0x5c93, 0x75},
> -	{0x5c94, 0x75},
> -	{0x5c95, 0x75},
> -	{0x5c96, 0x75},
> -	{0x5c97, 0x75},
> -	{0x5c98, 0x75},
> -	{0x5c99, 0x75},
> -	{0x5c9a, 0x75},
> -	{0x5c9b, 0x75},
> -	{0x5c9c, 0x75},
> -	{0x5c9d, 0x75},
> -	{0x5c9e, 0x75},
> -	{0x5c9f, 0x75},
> -	{0x5ca0, 0x75},
> -	{0x5ca1, 0x75},
> -	{0x5ca2, 0x75},
> -	{0x5ca3, 0x75},
> -	{0x5ca4, 0x75},
> -	{0x5ca5, 0x75},
> -	{0x5ca6, 0x75},
> -	{0x5ca7, 0x75},
> -	{0x5ca8, 0x75},
> -	{0x5ca9, 0x75},
> -	{0x5caa, 0x75},
> -	{0x5cab, 0x75},
> -	{0x5cac, 0x75},
> -	{0x5cad, 0x75},
> -	{0x5cae, 0x75},
> -	{0x5caf, 0x75},
> -	{0x5cb0, 0x75},
> -	{0x5cb1, 0x75},
> -	{0x5cb2, 0x75},
> -	{0x5cb3, 0x75},
> -	{0x5cb4, 0x75},
> -	{0x5cb5, 0x75},
> -	{0x5cb6, 0x75},
> -	{0x5cb7, 0x75},
> -	{0x5cb8, 0x75},
> -	{0x5cb9, 0x75},
> -	{0x5cba, 0x75},
> -	{0x5cbb, 0x75},
> -	{0x5cbc, 0x75},
> -	{0x5cbd, 0x75},
> -	{0x5cbe, 0x75},
> -	{0x5cbf, 0x75},
> -	{0x5cc0, 0x75},
> -	{0x5cc1, 0x75},
> -	{0x5cc2, 0x75},
> -	{0x5cc3, 0x75},
> -	{0x5cc4, 0x75},
> -	{0x5cc5, 0x75},
> -	{0x5cc6, 0x75},
> -	{0x5cc7, 0x75},
> -	{0x5cc8, 0x75},
> -	{0x5cc9, 0x75},
> -	{0x5cca, 0x75},
> -	{0x5ccb, 0x75},
> -	{0x5ccc, 0x75},
> -	{0x5ccd, 0x75},
> -	{0x5cce, 0x75},
> -	{0x5ccf, 0x75},
> -	{0x5cd0, 0x75},
> -	{0x5cd1, 0x75},
> -	{0x5cd2, 0x75},
> -	{0x5cd3, 0x75},
> -	{0x5cd4, 0x75},
> -	{0x5cd5, 0x75},
> -	{0x5cd6, 0x75},
> -	{0x5cd7, 0x75},
> -	{0x5cd8, 0x75},
> -	{0x5cd9, 0x75},
> -	{0x5cda, 0x75},
> -	{0x5cdb, 0x75},
> -	{0x5cdc, 0x75},
> -	{0x5cdd, 0x75},
> -	{0x5cde, 0x75},
> -	{0x5cdf, 0x75},
> -	{0x5ce0, 0x75},
> -	{0x5ce1, 0x75},
> -	{0x5ce2, 0x75},
> -	{0x5ce3, 0x75},
> -	{0x5ce4, 0x75},
> -	{0x5ce5, 0x75},
> -	{0x5ce6, 0x75},
> -	{0x5ce7, 0x75},
> -	{0x5ce8, 0x75},
> -	{0x5ce9, 0x75},
> -	{0x5cea, 0x75},
> -	{0x5ceb, 0x75},
> -	{0x5cec, 0x75},
> -	{0x5ced, 0x75},
> -	{0x5cee, 0x75},
> -	{0x5cef, 0x75},
> -	{0x5cf0, 0x75},
> -	{0x5cf1, 0x75},
> -	{0x5cf2, 0x75},
> -	{0x5cf3, 0x75},
> -	{0x5cf4, 0x75},
> -	{0x5cf5, 0x75},
> -	{0x5cf6, 0x75},
> -	{0x5cf7, 0x75},
> -	{0x5cf8, 0x75},
> -	{0x5cf9, 0x75},
> -	{0x5cfa, 0x75},
> -	{0x5cfb, 0x75},
> -	{0x5cfc, 0x75},
> -	{0x5cfd, 0x75},
> -	{0x5cfe, 0x75},
> -	{0x5cff, 0x75},
> -	{0x5d00, 0x75},
> -	{0x5d01, 0x75},
> -	{0x5d02, 0x75},
> -	{0x5d03, 0x75},
> -	{0x5d04, 0x75},
> -	{0x5d05, 0x75},
> -	{0x5d06, 0x75},
> -	{0x5d07, 0x75},
> -	{0x5d08, 0x75},
> -	{0x5d09, 0x75},
> -	{0x5d0a, 0x75},
> -	{0x5d0b, 0x75},
> -	{0x5d0c, 0x75},
> -	{0x5d0d, 0x75},
> -	{0x5d0e, 0x75},
> -	{0x5d0f, 0x75},
> -	{0x5d10, 0x75},
> -	{0x5d11, 0x75},
> -	{0x5d12, 0x75},
> -	{0x5d13, 0x75},
> -	{0x5d14, 0x75},
> -	{0x5d15, 0x75},
> -	{0x5d16, 0x75},
> -	{0x5d17, 0x75},
> -	{0x5d18, 0x75},
> -	{0x5d19, 0x75},
> -	{0x5d1a, 0x75},
> -	{0x5d1b, 0x75},
> -	{0x5d1c, 0x75},
> -	{0x5d1d, 0x75},
> -	{0x5d1e, 0x75},
> -	{0x5d1f, 0x75},
> -	{0x5d20, 0x75},
> -	{0x5d21, 0x75},
> -	{0x5d22, 0x75},
> -	{0x5d23, 0x75},
> -	{0x5d24, 0x75},
> -	{0x5d25, 0x75},
> -	{0x5d26, 0x75},
> -	{0x5d27, 0x75},
> -	{0x5d28, 0x75},
> -	{0x5d29, 0x75},
> -	{0x5d2a, 0x75},
> -	{0x5d2b, 0x75},
> -	{0x5d2c, 0x75},
> -	{0x5d2d, 0x75},
> -	{0x5d2e, 0x75},
> -	{0x5d2f, 0x75},
> -	{0x5d30, 0x75},
> -	{0x5d31, 0x75},
> -	{0x5d32, 0x75},
> -	{0x5d33, 0x75},
> -	{0x5d34, 0x75},
> -	{0x5d35, 0x75},
> -	{0x5d36, 0x75},
> -	{0x5d37, 0x75},
> -	{0x5d38, 0x75},
> -	{0x5d39, 0x75},
> -	{0x5d3a, 0x75},
> -	{0x5d3b, 0x75},
> -	{0x5d3c, 0x75},
> -	{0x5d3d, 0x75},
> -	{0x5d3e, 0x75},
> -	{0x5d3f, 0x75},
> -	{0x5d40, 0x75},
> -	{0x5d41, 0x75},
> -	{0x5d42, 0x75},
> -	{0x5d43, 0x75},
> -	{0x5d44, 0x75},
> -	{0x5d45, 0x75},
> -	{0x5d46, 0x75},
> -	{0x5d47, 0x75},
> -	{0x5d48, 0x75},
> -	{0x5d49, 0x75},
> -	{0x5d4a, 0x75},
> -	{0x5d4b, 0x75},
> -	{0x5d4c, 0x75},
> -	{0x5d4d, 0x75},
> -	{0x5d4e, 0x75},
> -	{0x5d4f, 0x75},
> -	{0x5d50, 0x75},
> -	{0x5d51, 0x75},
> -	{0x5d52, 0x75},
> -	{0x5d53, 0x75},
> -	{0x5d54, 0x75},
> -	{0x5d55, 0x75},
> -	{0x5d56, 0x75},
> -	{0x5d57, 0x75},
> -	{0x5d58, 0x75},
> -	{0x5d59, 0x75},
> -	{0x5d5a, 0x75},
> -	{0x5d5b, 0x75},
> -	{0x5d5c, 0x75},
> -	{0x5d5d, 0x75},
> -	{0x5d5e, 0x75},
> -	{0x5d5f, 0x75},
> -	{0x5d60, 0x75},
> -	{0x5d61, 0x75},
> -	{0x5d62, 0x75},
> -	{0x5d63, 0x75},
> -	{0x5d64, 0x75},
> -	{0x5d65, 0x75},
> -	{0x5d66, 0x75},
> -	{0x5d67, 0x75},
> -	{0x5d68, 0x75},
> -	{0x5d69, 0x75},
> -	{0x5d6a, 0x75},
> -	{0x5d6b, 0x75},
> -	{0x5d6c, 0x75},
> -	{0x5d6d, 0x75},
> -	{0x5d6e, 0x75},
> -	{0x5d6f, 0x75},
> -	{0x5d70, 0x75},
> -	{0x5d71, 0x75},
> -	{0x5d72, 0x75},
> -	{0x5d73, 0x75},
> -	{0x5d74, 0x75},
> -	{0x5d75, 0x75},
> -	{0x5d76, 0x75},
> -	{0x5d77, 0x75},
> -	{0x5d78, 0x75},
> -	{0x5d79, 0x75},
> -	{0x5d7a, 0x75},
> -	{0x5d7b, 0x75},
> -	{0x5d7c, 0x75},
> -	{0x5d7d, 0x75},
> -	{0x5d7e, 0x75},
> -	{0x5d7f, 0x75},
> -	{0x5d80, 0x75},
> -	{0x5d81, 0x75},
> -	{0x5d82, 0x75},
> -	{0x5d83, 0x75},
> -	{0x5d84, 0x75},
> -	{0x5d85, 0x75},
> -	{0x5d86, 0x75},
> -	{0x5d87, 0x75},
> -	{0x5d88, 0x75},
> -	{0x5d89, 0x75},
> -	{0x5d8a, 0x75},
> -	{0x5d8b, 0x75},
> -	{0x5d8c, 0x75},
> -	{0x5d8d, 0x75},
> -	{0x5d8e, 0x75},
> -	{0x5d8f, 0x75},
> -	{0x5d90, 0x75},
> -	{0x5d91, 0x75},
> -	{0x5d92, 0x75},
> -	{0x5d93, 0x75},
> -	{0x5d94, 0x75},
> -	{0x5d95, 0x75},
> -	{0x5d96, 0x75},
> -	{0x5d97, 0x75},
> -	{0x5d98, 0x75},
> -	{0x5d99, 0x75},
> -	{0x5d9a, 0x75},
> -	{0x5d9b, 0x75},
> -	{0x5d9c, 0x75},
> -	{0x5d9d, 0x75},
> -	{0x5d9e, 0x75},
> -	{0x5d9f, 0x75},
> -	{0x5da0, 0x75},
> -	{0x5da1, 0x75},
> -	{0x5da2, 0x75},
> -	{0x5da3, 0x75},
> -	{0x5da4, 0x75},
> -	{0x5da5, 0x75},
> -	{0x5da6, 0x75},
> -	{0x5da7, 0x75},
> -	{0x5da8, 0x75},
> -	{0x5da9, 0x75},
> -	{0x5daa, 0x75},
> -	{0x5dab, 0x75},
> -	{0x5dac, 0x75},
> -	{0x5dad, 0x75},
> -	{0x5dae, 0x75},
> -	{0x5daf, 0x75},
> -	{0x5db0, 0x75},
> -	{0x5db1, 0x75},
> -	{0x5db2, 0x75},
> -	{0x5db3, 0x75},
> -	{0x5db4, 0x75},
> -	{0x5db5, 0x75},
> -	{0x5db6, 0x75},
> -	{0x5db7, 0x75},
> -	{0x5db8, 0x75},
> -	{0x5db9, 0x75},
> -	{0x5dba, 0x75},
> -	{0x5dbb, 0x75},
> -	{0x5dbc, 0x75},
> -	{0x5dbd, 0x75},
> -	{0x5dbe, 0x75},
> -	{0x5dbf, 0x75},
> -	{0x5dc0, 0x75},
> -	{0x5dc1, 0x75},
> -	{0x5dc2, 0x75},
> -	{0x5dc3, 0x75},
> -	{0x5dc4, 0x75},
> -	{0x5dc5, 0x75},
> -	{0x5dc6, 0x75},
> -	{0x5dc7, 0x75},
> -	{0x5dc8, 0x75},
> -	{0x5dc9, 0x75},
> -	{0x5dca, 0x75},
> -	{0x5dcb, 0x75},
> -	{0x5dcc, 0x75},
> -	{0x5dcd, 0x75},
> -	{0x5dce, 0x75},
> -	{0x5dcf, 0x75},
> -	{0x5dd0, 0x75},
> -	{0x5dd1, 0x75},
> -	{0x5dd2, 0x75},
> -	{0x5dd3, 0x75},
> -	{0x5dd4, 0x75},
> -	{0x5dd5, 0x75},
> -	{0x5dd6, 0x75},
> -	{0x5dd7, 0x75},
> -	{0x5dd8, 0x75},
> -	{0x5dd9, 0x75},
> -	{0x5dda, 0x75},
> -	{0x5ddb, 0x75},
> -	{0x5ddc, 0x75},
> -	{0x5ddd, 0x75},
> -	{0x5dde, 0x75},
> -	{0x5ddf, 0x75},
> -	{0x5de0, 0x75},
> -	{0x5de1, 0x75},
> -	{0x5de2, 0x75},
> -	{0x5de3, 0x75},
> -	{0x5de4, 0x75},
> -	{0x5de5, 0x75},
> -	{0x5de6, 0x75},
> -	{0x5de7, 0x75},
> -	{0x5de8, 0x75},
> -	{0x5de9, 0x75},
> -	{0x5dea, 0x75},
> -	{0x5deb, 0x75},
> -	{0x5dec, 0x75},
> -	{0x5ded, 0x75},
> -	{0x5dee, 0x75},
> -	{0x5def, 0x75},
> -	{0x5df0, 0x75},
> -	{0x5df1, 0x75},
> -	{0x5df2, 0x75},
> -	{0x5df3, 0x75},
> -	{0x5df4, 0x75},
> -	{0x5df5, 0x75},
> -	{0x5df6, 0x75},
> -	{0x5df7, 0x75},
> -	{0x5df8, 0x75},
> -	{0x5df9, 0x75},
> -	{0x5dfa, 0x75},
> -	{0x5dfb, 0x75},
> -	{0x5dfc, 0x75},
> -	{0x5dfd, 0x75},
> -	{0x5dfe, 0x75},
> -	{0x5dff, 0x75},
> -	{0x5e00, 0x75},
> -	{0x5e01, 0x75},
> -	{0x5e02, 0x75},
> -	{0x5e03, 0x75},
> -	{0x5e04, 0x75},
> -	{0x5e05, 0x75},
> -	{0x5e06, 0x75},
> -	{0x5e07, 0x75},
> -	{0x5e08, 0x75},
> -	{0x5e09, 0x75},
> -	{0x5e0a, 0x75},
> -	{0x5e0b, 0x75},
> -	{0x5e0c, 0x75},
> -	{0x5e0d, 0x75},
> -	{0x5e0e, 0x75},
> -	{0x5e0f, 0x75},
> -	{0x5e10, 0x75},
> -	{0x5e11, 0x75},
> -	{0x5e12, 0x75},
> -	{0x5e13, 0x75},
> -	{0x5e14, 0x75},
> -	{0x5e15, 0x75},
> -	{0x5e16, 0x75},
> -	{0x5e17, 0x75},
> -	{0x5e18, 0x75},
> -	{0x5e19, 0x75},
> -	{0x5e1a, 0x75},
> -	{0x5e1b, 0x75},
> -	{0x5e1c, 0x75},
> -	{0x5e1d, 0x75},
> -	{0x5e1e, 0x75},
> -	{0x5e1f, 0x75},
> -	{0x5e20, 0x75},
> -	{0x5e21, 0x75},
> -	{0x5e22, 0x75},
> -	{0x5e23, 0x75},
> -	{0x5e24, 0x75},
> -	{0x5e25, 0x75},
> -	{0x5e26, 0x75},
> -	{0x5e27, 0x75},
> -	{0x5e28, 0x75},
> -	{0x5e29, 0x75},
> -	{0x5e2a, 0x75},
> -	{0x5e2b, 0x75},
> -	{0x5e2c, 0x75},
> -	{0x5e2d, 0x75},
> -	{0x5e2e, 0x75},
> -	{0x5e2f, 0x75},
> -	{0x5e30, 0x75},
> -	{0x5e31, 0x75},
> -	{0x5e32, 0x75},
> -	{0x5e33, 0x75},
> -	{0x5e34, 0x75},
> -	{0x5e35, 0x75},
> -	{0x5e36, 0x75},
> -	{0x5e37, 0x75},
> -	{0x5e38, 0x75},
> -	{0x5e39, 0x75},
> -	{0x5e3a, 0x75},
> -	{0x5e3b, 0x75},
> -	{0x5e3c, 0x75},
> -	{0x5e3d, 0x75},
> -	{0x5e3e, 0x75},
> -	{0x5e3f, 0x75},
> -	{0x5e40, 0x75},
> -	{0x5e41, 0x75},
> -	{0x5e42, 0x75},
> -	{0x5e43, 0x75},
> -	{0x5e44, 0x75},
> -	{0x5e45, 0x75},
> -	{0x5e46, 0x75},
> -	{0x5e47, 0x75},
> -	{0x5e48, 0x75},
> -	{0x5e49, 0x75},
> -	{0x5e4a, 0x75},
> -	{0x5e4b, 0x75},
> -	{0x5e4c, 0x75},
> -	{0x5e4d, 0x75},
> -	{0x5e4e, 0x75},
> -	{0x5e4f, 0x75},
> -	{0x5e50, 0x75},
> -	{0x5e51, 0x75},
> -	{0x5e52, 0x75},
> -	{0x5e53, 0x75},
> -	{0x5e54, 0x75},
> -	{0x5e55, 0x75},
> -	{0x5e56, 0x75},
> -	{0x5e57, 0x75},
> -	{0x5e58, 0x75},
> -	{0x5e59, 0x75},
> -	{0x5e5a, 0x75},
> -	{0x5e5b, 0x75},
> -	{0x5e5c, 0x75},
> -	{0x5e5d, 0x75},
> -	{0x5e5e, 0x75},
> -	{0x5e5f, 0x75},
> -	{0x5e60, 0x75},
> -	{0x5e61, 0x75},
> -	{0x5e62, 0x75},
> -	{0x5e63, 0x75},
> -	{0x5e64, 0x75},
> -	{0x5e65, 0x75},
> -	{0x5e66, 0x75},
> -	{0x5e67, 0x75},
> -	{0x5e68, 0x75},
> -	{0x5e69, 0x75},
> -	{0x5e6a, 0x75},
> -	{0x5e6b, 0x75},
> -	{0x5e6c, 0x75},
> -	{0x5e6d, 0x75},
> -	{0x5e6e, 0x75},
> -	{0x5e6f, 0x75},
> -	{0x5e70, 0x75},
> -	{0x5e71, 0x75},
> -	{0x5e72, 0x75},
> -	{0x5e73, 0x75},
> -	{0x5e74, 0x75},
> -	{0x5e75, 0x75},
> -	{0x5e76, 0x75},
> -	{0x5e77, 0x75},
> -	{0x5e78, 0x75},
> -	{0x5e79, 0x75},
> -	{0x5e7a, 0x75},
> -	{0x5e7b, 0x75},
> -	{0x5e7c, 0x75},
> -	{0x5e7d, 0x75},
> -	{0x5e7e, 0x75},
> -	{0x5e7f, 0x75},
> -	{0x5e80, 0x75},
> -	{0x5e81, 0x75},
> -	{0x5e82, 0x75},
> -	{0x5e83, 0x75},
> -	{0x5e84, 0x75},
> -	{0x5e85, 0x75},
> -	{0x5e86, 0x75},
> -	{0x5e87, 0x75},
> -	{0x5e88, 0x75},
> -	{0x5e89, 0x75},
> -	{0x5e8a, 0x75},
> -	{0x5e8b, 0x75},
> -	{0x5e8c, 0x75},
> -	{0x5e8d, 0x75},
> -	{0x5e8e, 0x75},
> -	{0x5e8f, 0x75},
> -	{0x5e90, 0x75},
> -	{0x5e91, 0x75},
> -	{0x5e92, 0x75},
> -	{0x5e93, 0x75},
> -	{0x5e94, 0x75},
> -	{0x5e95, 0x75},
> -	{0x5e96, 0x75},
> -	{0x5e97, 0x75},
> -	{0x5e98, 0x75},
> -	{0x5e99, 0x75},
> -	{0x5e9a, 0x75},
> -	{0x5e9b, 0x75},
> -	{0x5e9c, 0x75},
> -	{0x5e9d, 0x75},
> -	{0x5e9e, 0x75},
> -	{0x5e9f, 0x75},
> -	{0x5ea0, 0x75},
> -	{0x5ea1, 0x75},
> -	{0x5ea2, 0x75},
> -	{0x5ea3, 0x75},
> -	{0x5ea4, 0x75},
> -	{0x5ea5, 0x75},
> -	{0x5ea6, 0x75},
> -	{0x5ea7, 0x75},
> -	{0x5ea8, 0x75},
> -	{0x5ea9, 0x75},
> -	{0x5eaa, 0x75},
> -	{0x5eab, 0x75},
> -	{0x5eac, 0x75},
> -	{0x5ead, 0x75},
> -	{0x5eae, 0x75},
> -	{0x5eaf, 0x75},
> -	{0x5eb0, 0x75},
> -	{0x5eb1, 0x75},
> -	{0x5eb2, 0x75},
> -	{0x5eb3, 0x75},
> -	{0x5eb4, 0x75},
> -	{0x5eb5, 0x75},
> -	{0x5eb6, 0x75},
> -	{0x5eb7, 0x75},
> -	{0x5eb8, 0x75},
> -	{0x5eb9, 0x75},
> -	{0x5eba, 0x75},
> -	{0x5ebb, 0x75},
> -	{0x5ebc, 0x75},
> -	{0x5ebd, 0x75},
> -	{0x5ebe, 0x75},
> -	{0x5ebf, 0x75},
> -	{0x5ec0, 0x75},
> -	{0x5ec1, 0x75},
> -	{0x5ec2, 0x75},
> -	{0x5ec3, 0x75},
> -	{0x5ec4, 0x75},
> -	{0x5ec5, 0x75},
> -	{0x5ec6, 0x75},
> -	{0x5ec7, 0x75},
> -	{0x5ec8, 0x75},
> -	{0x5ec9, 0x75},
> -	{0x5eca, 0x75},
> -	{0x5ecb, 0x75},
> -	{0x5ecc, 0x75},
> -	{0x5ecd, 0x75},
> -	{0x5ece, 0x75},
> -	{0x5ecf, 0x75},
> -	{0x5ed0, 0x75},
> -	{0x5ed1, 0x75},
> -	{0x5ed2, 0x75},
> -	{0x5ed3, 0x75},
> -	{0x5ed4, 0x75},
> -	{0x5ed5, 0x75},
> -	{0x5ed6, 0x75},
> -	{0x5ed7, 0x75},
> -	{0x5ed8, 0x75},
> -	{0x5ed9, 0x75},
> -	{0x5eda, 0x75},
> -	{0x5edb, 0x75},
> -	{0x5edc, 0x75},
> -	{0x5edd, 0x75},
> -	{0x5ede, 0x75},
> -	{0x5edf, 0x75},
> -	{0x5ee0, 0x75},
> -	{0x5ee1, 0x75},
> -	{0x5ee2, 0x75},
> -	{0x5ee3, 0x75},
> -	{0x5ee4, 0x75},
> -	{0x5ee5, 0x75},
> -	{0x5ee6, 0x75},
> -	{0x5ee7, 0x75},
> -	{0x5ee8, 0x75},
> -	{0x5ee9, 0x75},
> -	{0x5eea, 0x75},
> -	{0x5eeb, 0x75},
> -	{0x5eec, 0x75},
> -	{0x5eed, 0x75},
> -	{0x5eee, 0x75},
> -	{0x5eef, 0x75},
> -	{0x5ef0, 0x75},
> -	{0x5ef1, 0x75},
> -	{0x5ef2, 0x75},
> -	{0x5ef3, 0x75},
> -	{0x5ef4, 0x75},
> -	{0x5ef5, 0x75},
> -	{0x5ef6, 0x75},
> -	{0x5ef7, 0x75},
> -	{0x5ef8, 0x75},
> -	{0x5ef9, 0x75},
> -	{0x5efa, 0x75},
> -	{0x5efb, 0x75},
> -	{0x5efc, 0x75},
> -	{0x5efd, 0x75},
> -	{0x5efe, 0x75},
> -	{0x5eff, 0x75},
> -	{0x5f00, 0x75},
> -	{0x5f01, 0x75},
> -	{0x5f02, 0x75},
> -	{0x5f03, 0x75},
> -	{0x5f04, 0x75},
> -	{0x5f05, 0x75},
> -	{0x5f06, 0x75},
> -	{0x5f07, 0x75},
> -	{0x5f08, 0x75},
> -	{0x5f09, 0x75},
> -	{0x5f0a, 0x75},
> -	{0x5f0b, 0x75},
> -	{0x5f0c, 0x75},
> -	{0x5f0d, 0x75},
> -	{0x5f0e, 0x75},
> -	{0x5f0f, 0x75},
> -	{0x5f10, 0x75},
> -	{0x5f11, 0x75},
> -	{0x5f12, 0x75},
> -	{0x5f13, 0x75},
> -	{0x5f14, 0x75},
> -	{0x5f15, 0x75},
> -	{0x5f16, 0x75},
> -	{0x5f17, 0x75},
> -	{0x5f18, 0x75},
> -	{0x5f19, 0x75},
> -	{0x5f1a, 0x75},
> -	{0x5f1b, 0x75},
> -	{0x5f1c, 0x75},
> -	{0x5f1d, 0x75},
> -	{0x5f1e, 0x75},
> -	{0x5f1f, 0x75},
>  };
>  
>  static const struct ov08x40_reg mode_1928x1208_regs[] = {
> @@ -2493,6 +1348,42 @@ static int ov08x40_read_reg(struct ov08x40 *ov08x,
>  	return 0;
>  }
>  
> +static int ov08x40_burst_fill_regs(struct ov08x40 *ov08x, u16 first_reg,
> +				   u16 last_reg,  u8 val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
> +	struct i2c_msg msgs;
> +	size_t i, num_regs;
> +	int ret;
> +
> +	num_regs = last_reg - first_reg + 1;
> +	msgs.addr = client->addr;
> +	msgs.flags = 0;
> +	msgs.len = 2 + num_regs;
> +	msgs.buf = kmalloc(msgs.len, GFP_KERNEL);
> +
> +	if (!msgs.buf)
> +		return -ENOMEM;
> +
> +	put_unaligned_be16(first_reg, msgs.buf);
> +
> +	for (i = 0; i < num_regs; ++i)
> +		msgs.buf[2 + i] = val;
> +
> +	ret = i2c_transfer(client->adapter, &msgs, 1);
> +
> +	kfree(msgs.buf);
> +
> +	if (ret != 1) {
> +		dev_err(&client->dev, "Failed regs transferred: %d\n", ret);
> +		return -EIO;
> +	}
> +
> +	dev_dbg(&client->dev, "I2C burst transfer succeeded\n");

This is a quite useless messages, there are no messages printed on other
successful writes either. I'll remove while applying the patch.

> +
> +	return 0;
> +}
> +
>  /* Write registers up to 4 at a time */
>  static int ov08x40_write_reg(struct ov08x40 *ov08x,
>  			     u16 reg, u32 len, u32 __val)
> @@ -2936,6 +1827,22 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
>  		return ret;
>  	}
>  
> +	/* Use i2c burst to write register on full size registers */
> +	if (ov08x->cur_mode->exposure_shift == 1) {
> +		ret = ov08x40_burst_fill_regs(ov08x, OV08X40_REG_XTALK_FIRST_A,
> +					      OV08X40_REG_XTALK_LAST_A, 0x75);
> +		if (ret == 0)
> +			ret = ov08x40_burst_fill_regs(ov08x,
> +						      OV08X40_REG_XTALK_FIRST_B,
> +						      OV08X40_REG_XTALK_LAST_B,
> +						      0x75);
> +	}
> +
> +	if (ret) {
> +		dev_err(&client->dev, "%s failed to set regs\n", __func__);
> +		return ret;
> +	}
> +
>  	/* Apply customized values from user */
>  	ret =  __v4l2_ctrl_handler_setup(ov08x->sd.ctrl_handler);
>  	if (ret)

-- 
Regards,

Sakari Ailus

