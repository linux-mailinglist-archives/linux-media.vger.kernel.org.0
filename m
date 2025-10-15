Return-Path: <linux-media+bounces-44491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBEEBDC33F
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 04:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 481334E273D
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 02:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BB3204F99;
	Wed, 15 Oct 2025 02:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQKQtlTr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11347494;
	Wed, 15 Oct 2025 02:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496374; cv=none; b=eoNpgN6awyjiULmtLT/iAj1Dz7SMmsB6UALMiCw6OJ6ZnVkK0j1c55hvp6fPSXTJGos37xc5QY4DST1qPB8fP7X/tQOhVCSioLGlNNpy37sVE4lXBsv8Q9taH7k+JqJG2FvcMoOYL0h4ik9KTMshyy/g/5ImtNXV818Jw5qJw1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496374; c=relaxed/simple;
	bh=BmvbppvD1Pdyn+EwwfAntWEm5YRei268VrvS7FegDfA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=cT9y0YEwBvX52+6Stud8tyS2WyjakleYr9IIdFVV7PCmkx+nSmyczQFuks1/YOiFn3oVHcQaZFVY3UO1TioAiC8fk7gRyCgGHaUT4cGg1cMVV/Y7WUUueCKQt+ShmzYDLWyPCD1Y554Vc92Ks4KjGCwN5Buu2fpvDxzNTCHcqDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQKQtlTr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760496373; x=1792032373;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=BmvbppvD1Pdyn+EwwfAntWEm5YRei268VrvS7FegDfA=;
  b=mQKQtlTroHW4l0x0S4VbDfEIBGK3AMT4rgylzdbVA0eNd/8M/PI3JlUF
   J/ayOOqqeoT+s2IqU/9P4IaL5WP7wgtuCkgLhD4QmRyBo5U/i/SqCoUIJ
   h5rO/xPMLBEJQkY0LqdVeHR3l/iCsZaZuF1brV3ygyB2XdBH2Hj9UYGQc
   MYLm36rLaLE5trTl0NH2eJSVpiv4YQJiCPdmcyXmknfkfsVEESQUR50zm
   ivan/Wl+7pWHh4lQTyMM2MgvkF/83l3vGZg8AZn2D6NvW0NXQFiFavI3h
   qMak7ZBLGFW04F9gMMs5HrjFIodMDs5b63Dj7qCpkKbzmRg0ZSKOv3BLS
   Q==;
X-CSE-ConnectionGUID: mnz/334/TYiKLpwLm/hxgg==
X-CSE-MsgGUID: wi1YKl/pTu6gKff+4iYX0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="88128559"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="88128559"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 19:45:37 -0700
X-CSE-ConnectionGUID: 6zAVs3j1RUi96Ej9QNODlw==
X-CSE-MsgGUID: t7X9mrw9QbWQX5ASZzwsmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="181721764"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 19:45:35 -0700
Subject: Re: [PATCH 04/25] media: i2c: ov01a10: Add missing
 v4l2_subdev_cleanup() calls
To: Hans de Goede <hansg@kernel.org>, Bingbu Cao <bingbu.cao@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, stable@vger.kernel.org
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-5-hansg@kernel.org>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <12bce6fb-2353-1ae7-f22f-6a4efa9e12f0@linux.intel.com>
Date: Wed, 15 Oct 2025 10:37:29 +0800
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

Thank for the patch.
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

