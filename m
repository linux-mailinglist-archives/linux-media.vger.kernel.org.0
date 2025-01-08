Return-Path: <linux-media+bounces-24393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EAAA05A78
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 12:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 661803A5B6A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 11:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D401F8F07;
	Wed,  8 Jan 2025 11:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/9/1IFw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385421F7554;
	Wed,  8 Jan 2025 11:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337091; cv=none; b=OhyAbt6FcjmBf+Hz7OukgjwSIMxfZeyaslD5eJbnIUOHTclgB/Ulo4ley8NR17VnduRTjX/+i5SFkjYbljqB/Ot+z9nh0YIIFEREAYEeY5XcRTvHO5FE+INmLu6ZTrFgPmNMbMhAXB1UWpi5vM5bfSkE8vAVThfXiZ4zsFrFzTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337091; c=relaxed/simple;
	bh=rkKCHpvNGeFWh4x9a0HzXvY7gr+2ucLUjuhisunDK00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsAf7AclSoyUjtnqjS+xVW4bZdTL8PO0mUvv87WZzISI/pA5do+MHviY7hIaEsxHGdaAVdQicCU1u8BbcztsUHPcI3fHMEcxrVEqC1vWrqoqUrTqWk9z/Oc2LZ6L1rXNnhF5SJfsiqqfXFsovgOpwrFsB/bzUYBbfZQ+d5RkYPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/9/1IFw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736337089; x=1767873089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rkKCHpvNGeFWh4x9a0HzXvY7gr+2ucLUjuhisunDK00=;
  b=C/9/1IFw11XZC9RJWPxV5V+KXxrTCMcjX1h740HrsTMmDhQ4j/qtNjzB
   zeJgBYC2MTcDlw/Kvvt5RJrmPRCJ3o+m74+zBogGeh+KiSDHAmUIVG3eh
   455ZLybRv3Z0XSfcmkjwjJxVuIgqlmnkFrHtj+1mL4Kb36C11DTxgaXge
   sGB8YGTceWErfWj8VsivSF82SUdh8X8iooQLX7+9IoX/0Y7ZVMJOdC5Xe
   ZXowL5+yyAT2IH6PTQMNiEsbs+02bkTIQHYM+coyrnE0rAie5e4H7rhrZ
   jh2F6YUj2VVcMXi6wjTQPFEql18PtVGKBzn9c8/B6BHdVQvVvSPOKzpca
   w==;
X-CSE-ConnectionGUID: TbcKcoksQYWEz5yiYANpDA==
X-CSE-MsgGUID: WWKyNsEKS0WjOgagWXL0LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36440623"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36440623"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 03:51:25 -0800
X-CSE-ConnectionGUID: TKwn/y2wSQCWJ0qmYOM4Pw==
X-CSE-MsgGUID: b1v4x6QGRLOqBn2zppSZBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103581416"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 03:51:22 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CD31011F8DF;
	Wed,  8 Jan 2025 13:51:19 +0200 (EET)
Date: Wed, 8 Jan 2025 11:51:19 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v6 12/13] media: i2c: imx214: Fix clock handling on probe
 error or remove
Message-ID: <Z35mt_ViYmrJLKZb@kekkonen.localdomain>
References: <20241220-imx214-v6-0-d90a185d82e5@apitzsch.eu>
 <20241220-imx214-v6-12-d90a185d82e5@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220-imx214-v6-12-d90a185d82e5@apitzsch.eu>

Hi André,

Thanks for the update.

On Fri, Dec 20, 2024 at 02:26:11PM +0100, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> The driver should disable or unprepare the clock on probe error and on
> removing the module.
> 
> Remove regulator_bulk_disable(), because it is called by
> imx214_power_off().
> 
> Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: André Apitzsch <git@apitzsch.eu>

This and the next one appear to be bugfixes. I think it'd be reasonable to
backport them. Any idea where this got broken, for the Fixes: tag? The bug
fixed by the last patch was probably introduced with the driver?

> ---
>  drivers/media/i2c/imx214.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 96d05acfeb66480770bb6291027dd023fdccb649..e8d35f8b0f8b57d64f03ff6f5ed9eac51a671e8e 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1340,7 +1340,7 @@ static int imx214_probe(struct i2c_client *client)
>  	v4l2_ctrl_handler_free(&imx214->ctrls);
>  error_power_off:
>  	pm_runtime_disable(imx214->dev);
> -	regulator_bulk_disable(IMX214_NUM_SUPPLIES, imx214->supplies);
> +	imx214_power_off(dev);
>  
>  	return ret;
>  }
> @@ -1356,6 +1356,8 @@ static void imx214_remove(struct i2c_client *client)
>  	v4l2_ctrl_handler_free(&imx214->ctrls);
>  
>  	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		imx214_power_off(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
>  }
>  
> 

-- 
Regards,

Sakari Ailus

