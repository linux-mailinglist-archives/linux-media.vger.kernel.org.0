Return-Path: <linux-media+bounces-15414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1FB93EE83
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 09:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF502B209FC
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 07:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F66412C801;
	Mon, 29 Jul 2024 07:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5f6peYs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E2D12C475;
	Mon, 29 Jul 2024 07:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722238538; cv=none; b=IK5ZW/oB6+qd9r9dgywLZYRS3m8OhUnhsFagvjGxUQuNHJLzFQSTT9pKC/e7usJr/p9tO2kzpXO0GvRH4FiBaNKE8JDAanzahqEBD8GdhzA5Mrf3VMII5J+Zm92uU3RUr2jIOFRK0DNobxEjEthCd6YC6IiHm8QSHm6eOgOEoY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722238538; c=relaxed/simple;
	bh=mfRqRw7OeT7CaWmBvW4wfywMsg+XpK932zYjWGSTDVE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qVPr/Cg/64RsVSvFodzJE80B0FTnYeujRjCQoA5LCOMyk5c0aamq0tSL2nyhV4Zv+NadbrGxMOcu2Js+wLHxmpUNwnIzuF20ULE65AeQD6mNH9aRCQCKJFGus5Wq7uSySoqqvJnyBGCMtdwf8pdGfwq9OUsU//gHzXRWGBIui74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5f6peYs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722238537; x=1753774537;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=mfRqRw7OeT7CaWmBvW4wfywMsg+XpK932zYjWGSTDVE=;
  b=B5f6peYsh/R0zMlFoQOVBzvv9Ztz5sOaNA+rVcsgL5trI3blPzTyDqXy
   Q3Mwqz8/xCzLcI6zFFBZMFHJmUSgZNC+Rqui0Z2WTOJaXadOTcJn2HK2r
   3BWqWoh/L7hU1FjCY2Vmf8Y/V9QrLYTXY1U1RRmnIQoQtWfT1v+yKkEeI
   5o+cDT/F5hIxh436H68943pPagTw0BMAwiK08/VAJYz1Q3pyh1TzqWFjI
   Cf7YJ5HGPSHM4Ovz5IjDB9u7jpqaMTW3UiyfacuHWzxKPNP7BscvGDe/u
   M0F1MG/BO6oezTpyHFpY634Ww1QtW8adNFHS+E7qdG5TbwQYOaVUCX9gV
   w==;
X-CSE-ConnectionGUID: uR10lkmAQKSQLok4/cyD7Q==
X-CSE-MsgGUID: mAWUh5IlQ32uclB196W2rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="23726457"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="23726457"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 00:35:37 -0700
X-CSE-ConnectionGUID: LC1HM6ygRzWrljxzkONVpg==
X-CSE-MsgGUID: 2luf5HJGQTu9UMtzQt96hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="58734238"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa003.jf.intel.com with ESMTP; 29 Jul 2024 00:35:35 -0700
Subject: Re: [PATCH 1/1] media: ipu6: Depend on AUXILIARY_BUS
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Andreas Helbech Kleist <andreaskleist@gmail.com>
References: <202407161833.7BEFXejx-lkp@intel.com>
 <20240729071026.3775341-1-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <2da2103f-1f54-c70e-d8c4-ddcf3e4037d1@linux.intel.com>
Date: Mon, 29 Jul 2024 15:37:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240729071026.3775341-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

I also submitted one before :).
https://patchwork.kernel.org/project/linux-media/patch/20240717074050.4067898-1-bingbu.cao@intel.com/

On 7/29/24 3:10 PM, Sakari Ailus wrote:
> Auxiliary bus is optional, it needs to be selected by its users. Just do
> that.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407161833.7BEFXejx-lkp@intel.com/
> Fixes: c70281cc83d6 ("media: intel/ipu6: add Kconfig and Makefile")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
> index b7ab24b89836..c5389005dc37 100644
> --- a/drivers/media/pci/intel/ipu6/Kconfig
> +++ b/drivers/media/pci/intel/ipu6/Kconfig
> @@ -10,6 +10,7 @@ config VIDEO_INTEL_IPU6
>  	select MEDIA_CONTROLLER
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_FWNODE
> +	select AUXILIARY_BUS
>  	help
>  	  This is the 6th Gen Intel Image Processing Unit, found in Intel SoCs
>  	  and used for capturing images and video from camera sensors.
> 

-- 
Best regards,
Bingbu Cao

