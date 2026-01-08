Return-Path: <linux-media+bounces-50216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A77D01F86
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 10:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CED1D30B755B
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 09:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6AF132AAD5;
	Thu,  8 Jan 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ozc2VhXQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FD128151C
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861036; cv=none; b=c7a7V9ayG6qrcnBLk2yJcfW2mrky8cgKHLYPecxUK9EFX2S7q23bVxo9ZD1ffQ/W5YDoygcMYOZSR8R+hR0Ut+UY/wnU6y9NNkQt1PcLSAxoQrOYMh98qXG4ZsB35fJDx0NIiWlUZhn5vLKhf2gxRyx7PuxpFVHhuIq/baETGuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861036; c=relaxed/simple;
	bh=BlCM2qE9UFOZYCQJOPAXzaJbHddndo/yshV4QrjTHXk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=n8FTEUHSo2c+0svRZKjxN1XyC+tVUr2+MCkKjrskrSbYKTzi3Y9xI0vcS/dQyi16SRWIPgZH+1Xr+5Zks/2Qo5N3HRSsYGbW6k+cYTMhDmpV/aqbjWKQ9QVph17MBWMlw0XRf76aNvDIn1db58hXymQ0GEnyRJTD84tMT/8TnVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ozc2VhXQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767861028; x=1799397028;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=BlCM2qE9UFOZYCQJOPAXzaJbHddndo/yshV4QrjTHXk=;
  b=Ozc2VhXQWuObnpATxdIbkNKXt1lh22g18oKjz1hWEkULEyiBP6OMQLqK
   f7MEtDGSXPLUTPfknBfArGcAjzNiV3m9W4le81jXHS79nkdwcOT1AhslT
   lWkB4eq0PmZH7IAT2PoFBX/u0DVgAmpB6cr0/QBD3mEjQAVmVqiTtFE97
   V9K2063MdLjaVFMW2P2fMYE2DxPn7jb3aBKBUCS1Dxu32YjJuD4+TrKCu
   Z7fVFWAt/eV/Kx4hG+HvW5FN49KXsTxJ2lvh2pUmeupVT8u3npuaD9GsR
   J+jAMc9UsOUxmkQ9vdYxir32RxezNxLDVCw1uES2QvBEyiJ20b24wsAIH
   w==;
X-CSE-ConnectionGUID: e/9bm3bRSSmvnLnzZAQ/dw==
X-CSE-MsgGUID: dPwSqhd4Q12iS+Yjjs6Ehw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86822796"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="86822796"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:30:21 -0800
X-CSE-ConnectionGUID: kdvMvE10S26ERQXyMRCWjA==
X-CSE-MsgGUID: afi3srNgTWS8I6+3tQuSOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="202761377"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:30:20 -0800
Subject: Re: [PATCH v4 10/14] media: ipu6: Obtain remote pad using
 media_pad_remote_pad_unique()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
 <20260108081712.543704-11-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <0232e2d7-c2b9-3f0f-238f-db73686bf7e6@linux.intel.com>
Date: Thu, 8 Jan 2026 16:20:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260108081712.543704-11-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 1/8/26 4:17 PM, Sakari Ailus wrote:
> There's no reason to use media_entity_remote_source_pad_unique() as we
> know our pads. Use media_pad_remote_pad_unique() instead.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index 43a2a16a3c2a..7e539a0c6c92 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -88,7 +88,7 @@ s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
>  	if (!csi2)
>  		return -EINVAL;
>  
> -	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
> +	src_pad = media_pad_remote_pad_unique(&csi2->asd.sd.entity.pads[CSI2_PAD_SINK]);
>  	if (IS_ERR(src_pad)) {
>  		dev_err(&csi2->isys->adev->auxdev.dev,
>  			"can't get source pad of %s (%pe)\n",
> 

-- 
Best regards,
Bingbu Cao

