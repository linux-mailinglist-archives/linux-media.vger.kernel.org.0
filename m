Return-Path: <linux-media+bounces-50217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD504D01F05
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 10:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A302B3016354
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 09:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9CC322A24;
	Thu,  8 Jan 2026 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3EQvmzK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AF42D060C
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861046; cv=none; b=VbaD+NHLGc5pDOY5vO440jiMpK5JHUlP+AscRbxID9jqQaOGrNuAMlmLh07b2QS3EPx4ARUcrDTrIhB8e0lX/ew3XOs7o6tfgkE/wbB5meyJaCnRLeND5WIHWTRPd//Y/ZLkAVhYq7JOsyxklfYu8XyFDW7A6Tb+G/q5ne77QC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861046; c=relaxed/simple;
	bh=UlTPaVU4bkRbVGlgG5rHW/RyHwg7KqH8VUD05zDfGAo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=h4hMQuAqJdSkNNnTY3/nawZ6YswqHiV1WY7eq7rPA/hNy+FpLLvbsPvuo6LNBQTfYr0IwEara5UaUBgd68fBiKkBDfeF2j+GhutHBz8N0OtTWOzkPGv3OAAW68fsh3SBGCcuCyXqQ8jVaovq7YSTjITtOA5yHNSr2GVuTTpMswM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3EQvmzK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767861041; x=1799397041;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=UlTPaVU4bkRbVGlgG5rHW/RyHwg7KqH8VUD05zDfGAo=;
  b=i3EQvmzKd4TUWJsCYCmkgNWfVZkiCpAhOVrsCpnODlouMzBH1hbMKQlf
   plKouR0zhrEVj/leHzF9c+5EcYHnroicw5y86TACaHyFLosrbgFP3ncgF
   AqyOT/LsQUoHa95QKJmobO/hp3vB3OPWx39VeoViZG+tzs0M4SKc70Toq
   cR6MEOY2pLdCERsO10ljvuahJlPG48n9aEngMkm1qYofG3FTEQr4PKHt/
   tKoky3heGXKzy9eqgsVvOOThnIWV99jQeoZyPocgre2Nz/vh3MedhGCvW
   0B8AimhWVhpqgUo2buTx9C89jdWxMy3jn3Jml3KmZ/+liIsbY0od5V1j6
   w==;
X-CSE-ConnectionGUID: akQ75zBNSKKacPVFuzBDAw==
X-CSE-MsgGUID: Htbf4EZSRRiw8kAsaK8QBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68969351"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="68969351"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:30:33 -0800
X-CSE-ConnectionGUID: 6VXjSUFhTtyszmmxag+WoQ==
X-CSE-MsgGUID: 9VGrZhDsQQGKf9BP2Kd0XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203052637"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:30:31 -0800
Subject: Re: [PATCH v4 11/14] media: ipu6: Obtain unique source pad from
 remote sub-device
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
 <20260108081712.543704-12-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <e40726ad-36e6-56e1-ba40-8ec589a17f65@linux.intel.com>
Date: Thu, 8 Jan 2026 16:20:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260108081712.543704-12-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 1/8/26 4:17 PM, Sakari Ailus wrote:
> Obtain unique source pad from a remote sub-device, instead of the first
> one. This means that only one link may be active at stream start. There's
> no functional change in practice, unless multiple CSI-2 transmitters are
> directly connected to the receiver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index 54d861aca008..1d58e321bda7 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -1204,10 +1204,10 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
>  
>  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
>  	asd = to_ipu6_isys_subdev(remote_sd);
> -	source_pad = media_pad_remote_pad_first(&remote_pad->entity->pads[0]);
> -	if (!source_pad) {
> +	source_pad = media_pad_remote_pad_unique(&remote_pad->entity->pads[0]);
> +	if (IS_ERR(source_pad)) {
>  		dev_dbg(dev, "No external source entity\n");
> -		return -ENODEV;
> +		return PTR_ERR(source_pad);
>  	}
>  
>  	*source_entity = source_pad->entity;
> 

-- 
Best regards,
Bingbu Cao

