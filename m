Return-Path: <linux-media+bounces-11654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B338C9CB4
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 13:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5A5B1F22651
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 11:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B4353E3B;
	Mon, 20 May 2024 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKKDURXJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFEA5381D;
	Mon, 20 May 2024 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716206060; cv=none; b=NynKaHeZZjCzkLA1YhWrxTlxeIjW1Mx2iFcfJvE0OO5QCuIxCHVhXG2brEWUa2UVXzRZanReXnYONU0OVlWogBL+AUL/U3VPom8Qy8LENDoygfSRNjFWuItqyAllc7iVTHB7GygKQBOo83arThYBGxn2ekSNN7Cg2ZYdZjELaSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716206060; c=relaxed/simple;
	bh=6T/LxFwDsB4C2hzVBPcuFqDMYHoW8Lwuk7UjmrI9QgA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JwZvAYOcZPe8pRmchDLXMnIK7bPimJIrFdY1bRL7fl0P1KxXLyfzg/HW2mbZzylaZq6ijFTPzqT9itwnbJK/qUTnd3qFKwYKsjwgblQHbPHTmXKZ7g3NHUNw8rGoWh41eZbmzBxlBxhosQildPuzkYxQb+Yy43Iok7CrMnmPEDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKKDURXJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716206059; x=1747742059;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=6T/LxFwDsB4C2hzVBPcuFqDMYHoW8Lwuk7UjmrI9QgA=;
  b=NKKDURXJbsyK6Aoz7WththbLZi/ahkE6TCBdNFPyLH3xBfzAKQEqzFyb
   1rXQKkMO+tFRSdOfN7m3V2NrmW8hTEObT1OuO/fG1xMq2ZZrXfTBb3ljq
   CTpydVYjPZpsgn5Yl6q27NN3pHtbOcEiUr+dzo0vBGPgMHwqJOYpXYIjP
   91SCaqpQZGo+wLn8/nI50Uo7JkrMcMoT3MwOUK9kGtyE6oTbsZo7B99dr
   A/KT5+ziXkjEoMzq0YqfrTBpxOXLb4sr+NOLdPuwlejjazCMbi7TFKvUR
   1Oaq+owYgl1wUEKADY9KUfek6A50MDVKpZJKbffPZYbrmV28B+5RgjiPT
   w==;
X-CSE-ConnectionGUID: FjFjdSZ6QDiLP3pgY1Fzrg==
X-CSE-MsgGUID: tYOrlzFvQyS1B1mwlY+qmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12548085"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="12548085"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 04:54:18 -0700
X-CSE-ConnectionGUID: OQ0wOBEZSIOqHfbBhUgPSQ==
X-CSE-MsgGUID: DUvUtQmjSwi8l+LY38rq8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="32950757"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa006.jf.intel.com with ESMTP; 20 May 2024 04:54:16 -0700
Subject: Re: [PATCH] media: intel/ipu6: Fix some redundant resources freeing
 in ipu6_pci_remove()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-media@vger.kernel.org
References: <33dbf7b5c1b1b94d64a13441b69e1ff976caaa62.1716198935.git.christophe.jaillet@wanadoo.fr>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <f622051b-7ccd-e261-a311-2073c293602e@linux.intel.com>
Date: Mon, 20 May 2024 19:54:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <33dbf7b5c1b1b94d64a13441b69e1ff976caaa62.1716198935.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Christophe,

Thanks for the patch.

On 5/20/24 5:55 PM, Christophe JAILLET wrote:
> pcim_iomap_regions() and pcim_enable_device() are used in the probe. So
> the corresponding managed resources don't need to be freed explicitly in
> the remove function.
> 
> Remove the incorrect pci_release_regions() and pci_disable_device() calls.
> 
> Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---
>  drivers/media/pci/intel/ipu6/ipu6.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index d2bebd208461..f587f609259d 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -727,9 +727,6 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
>  	pm_runtime_forbid(&pdev->dev);
>  	pm_runtime_get_noresume(&pdev->dev);
>  
> -	pci_release_regions(pdev);
> -	pci_disable_device(pdev);
> -
>  	release_firmware(isp->cpd_fw);
>  
>  	ipu6_mmu_cleanup(psys_mmu);
>

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

-- 
Best regards,
Bingbu Cao

