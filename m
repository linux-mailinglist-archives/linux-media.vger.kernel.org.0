Return-Path: <linux-media+bounces-44492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA76BDC360
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 04:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 096F33E31A2
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 02:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D0025D1FC;
	Wed, 15 Oct 2025 02:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTZZE2LK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564CB248893;
	Wed, 15 Oct 2025 02:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496861; cv=none; b=in9Hza+Tt8ouW3xnF2WlMJpfucatZ02GINP8mb7xLbcIv0Nq1HNDUqxuxIZVg8kpJqTdo9Xebaw79EaGnxb0Rx7qsp5NL3CA+OWjVxU3sDsU8bJMR5cuKFJQI5EiUwqJVv7UlspZPxOYhWrMhAHttClunzwstlaqRO3LV6Oy6PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496861; c=relaxed/simple;
	bh=sFmj2fMk9jMBlMCIWcZpZ/GnYxqwdn3H9iuswb9h89U=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=TQid0y35PLEs7w0jwy7l72/8SCL0MmLgkJdMC7WMTbUoIPINoPU3oP4ws7zObu/7vC+nBTNhNTRnL2i3l08JzmfO8mkIPphCtEgRlH5pXl22Q55iIZKf4f92+Nt1Qn6oK31Xsjq8ucNQkYN0ZF4vFJVw0AjJ6+j8F+pZT4yJzro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTZZE2LK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760496859; x=1792032859;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=sFmj2fMk9jMBlMCIWcZpZ/GnYxqwdn3H9iuswb9h89U=;
  b=TTZZE2LK4p45fEH6wId7VCDKPfpMd67sph/gHkozA4Jm/6XfNuRZz+Uy
   d/d3KNX/Fmkm9xalG8VFy1jYDAdbl3yzhugizGVLfl1TEfR2Ur35M+lCt
   1WUADzM+13P/XB/L/k+KXgK9aOe4Wn/pCQB4FZv5MDlAcPDD8w3OuiVP8
   lpuBsDcTKUsOd8ziSnY1S8v1Mb/Mu3GpR+JzOvSCwwi75ss5fzVurSmAa
   s1czxwvLH7bcesJfhnGr4eD1P6zY+31OOUpR8UGQhxa9E0cAwKm3CGKO5
   ygoLoKVaCFaK98/K7pPkgWv/7zqwUKN/Co+vfC7ks+/+3uO6f8Z3Lren7
   A==;
X-CSE-ConnectionGUID: 4DZvNDdDSheRQ+EpTGIUgw==
X-CSE-MsgGUID: TLqKWR/7RAWepzN6G5mA3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="74006074"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="74006074"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 19:54:19 -0700
X-CSE-ConnectionGUID: 7pBkXqObRrGWvV/Umcr21A==
X-CSE-MsgGUID: SmodjvE7QkqiF982p4nmeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="212996844"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 19:54:17 -0700
Subject: Re: [PATCH 04/25] media: i2c: ov01a10: Add missing
 v4l2_subdev_cleanup() calls
To: Hans de Goede <hansg@kernel.org>, Bingbu Cao <bingbu.cao@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, stable@vger.kernel.org
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-5-hansg@kernel.org>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <d0be226a-6c07-9709-7331-59d04055f660@linux.intel.com>
Date: Wed, 15 Oct 2025 10:46:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251014174033.20534-5-hansg@kernel.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hans,

Thank you for the fix. 
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 10/15/25 1:40 AM, Hans de Goede wrote:
> Add missing v4l2_subdev_cleanup() calls to cleanup after
> v4l2_subdev_init_finalize().
> 
> Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>  drivers/media/i2c/ov01a10.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> index 95d6a0f046a0..f92867f542f0 100644
> --- a/drivers/media/i2c/ov01a10.c
> +++ b/drivers/media/i2c/ov01a10.c
> @@ -864,6 +864,7 @@ static void ov01a10_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  
>  	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
>  	media_entity_cleanup(&sd->entity);
>  	v4l2_ctrl_handler_free(sd->ctrl_handler);
>  
> @@ -934,6 +935,7 @@ static int ov01a10_probe(struct i2c_client *client)
>  err_pm_disable:
>  	pm_runtime_disable(dev);
>  	pm_runtime_set_suspended(&client->dev);
> +	v4l2_subdev_cleanup(&ov01a10->sd);
>  
>  err_media_entity_cleanup:
>  	media_entity_cleanup(&ov01a10->sd.entity);
> 

-- 
Best regards,
Bingbu Cao

