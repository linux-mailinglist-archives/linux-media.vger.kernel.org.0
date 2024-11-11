Return-Path: <linux-media+bounces-21234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EC49C366E
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 03:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35F061C216DE
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 02:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F0D42AA1;
	Mon, 11 Nov 2024 02:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QX6bvX+r"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0A217F7;
	Mon, 11 Nov 2024 02:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731291338; cv=none; b=Dal0TZOTMctlrK/B9s+pMnAOfAIstre/ZKECWXzmLsDHfybOo29pwR0eWb13CsvwRjUxTRP7n0m9sXdMlu8ZKIp1bFN3/ELeV/Ss9T6C7VACFghXxuaI4TwhYXToBViL03Kkc0/S3S1LeauMTDPw1rPCGe6ePFtoyA4M9sLkWUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731291338; c=relaxed/simple;
	bh=9Co/huiCFIkoDUcT8/Xj3fsF6cMccbLqTTQ/2iA5sXo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=TNsLrPu+2K1li3wyC4RYmMgPP/iydyhuYOW8wAi3Lvxtg1s33G4VbLkZj+Pc87GfR6emb3uoL0vRbpPLeYTMer02Rlnuq8vYDVey9hPw7PSg4Nl8uZ1mQuyLbzl/dCdQWtaKDQ/gCpmOc1rhek0HTHgmKoP/FKzl8UoL/Ia1y+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QX6bvX+r; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731291337; x=1762827337;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=9Co/huiCFIkoDUcT8/Xj3fsF6cMccbLqTTQ/2iA5sXo=;
  b=QX6bvX+r2vwr0welLvHXPQIHN0UnNhvz58WI5tKkdzJlf+oXQnKnbmby
   bb4OOLphptfj4pBtkRdWjtgWgFl2gU3v3kJIpoilF/5tnr5kHlhrYkOlM
   bMrRFBNoZ+QjSGCha87x73w7CX1CQ0FNxzS55CeadKF/J+6UMzP8rfQUp
   lc+mnrB4XNUmuADz2BnUvcNYVISARmUGZHe8E4GpNSTnLlTw8QCVvKSqR
   8ce+FGLoV9sdL4bLAaL7ZgqRqKXIieAmIdDLxXdUfHAC6MBipHlPkdf9S
   B+jibihI2gu581YWgUIaD0+jsz6pUtNUeJ03rJH27Q0a8NoLex6k/M1/7
   Q==;
X-CSE-ConnectionGUID: 8wPQxb9dQeiUa+MZyCxq8Q==
X-CSE-MsgGUID: XMZG8djaRPa33DUss2G6Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="30504557"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="30504557"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 18:15:36 -0800
X-CSE-ConnectionGUID: GpN0AMdhSgCcpWsiu57xlg==
X-CSE-MsgGUID: m4vVSHHUQGGvupmEHhJYwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="87485503"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 18:15:34 -0800
Subject: Re: [PATCH -next] media: ipu6: Remove duplicated include in
 ipu6-dma.h
To: Yang Li <yang.lee@linux.alibaba.com>, sakari.ailus@linux.intel.com,
 bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20241111015659.86760-1-yang.lee@linux.alibaba.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <67c23810-259b-fc0a-2792-eecdbbcc292e@linux.intel.com>
Date: Mon, 11 Nov 2024 10:12:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241111015659.86760-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Li,

Thanks for the patch.

On 11/11/24 9:56 AM, Yang Li wrote:
> The header files linux/iova.h is included twice in ipu6-dma.h,
> so one inclusion of each can be removed.
> 
> ./drivers/media/pci/intel/ipu6/ipu6-dma.h: linux/iova.h is included more
> than once.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11791

It'd better to add:
Fixes: 799d91fd3fe0 ("media: ipu6: not override the dma_ops of device in driver")

> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-dma.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
> index b51244add9e6..a902eec5c07a 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
> @@ -7,7 +7,6 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/iova.h>
> -#include <linux/iova.h>
>  #include <linux/scatterlist.h>
>  #include <linux/types.h>
>  
>

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>


-- 
Best regards,
Bingbu Cao

