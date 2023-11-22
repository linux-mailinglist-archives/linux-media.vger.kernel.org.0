Return-Path: <linux-media+bounces-731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C0B7F3F44
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 08:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CE281C20803
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 07:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5661120B2E;
	Wed, 22 Nov 2023 07:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyzNJgmS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4085E10E
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 23:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700639577; x=1732175577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FnMrM1JakHue7GcONIDJ7QNuqzIcuNhLWXq2sDyXN74=;
  b=FyzNJgmST0Nf8WLdFNUehfKwVsM8KIVj0X7STRXvxWGta/+7/KLlCyvX
   6oYbmTCrqLg8lAIRPk0De9wj9JQD/FDkqqEmyLXH+MDC1p0yrxJIgO66c
   XgOcGMiZ5XccVtxDSslYT14NVw5NgxX23LNifMM4Rmncl4cnDapDeoItB
   9ZgrhV/EICfyvnXdeNm2bTyZJAMxhBaUxWKWVBdDuVBDBs3jkC11Vhj0F
   /ot52SIa3j4U1RfNzm5BwT/wC6ub86HVn4hCGiREANR0OU7cSd1G7WL3P
   AUv0G0JbwJmwpk7bXswk97JWQSiNKs4WHSIx/Q4aETsu+S03LMFrfuDtU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="377033602"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="377033602"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 23:52:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="801816359"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="801816359"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 23:52:55 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B401D1202B6;
	Wed, 22 Nov 2023 09:43:42 +0200 (EET)
Date: Wed, 22 Nov 2023 07:43:42 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH v2 2/4] media: ov01a10: Enable runtime PM before
 registering async sub-device
Message-ID: <ZV2xLlcsCLAlf4oB@kekkonen.localdomain>
References: <20231122025411.2961572-1-bingbu.cao@intel.com>
 <20231122025411.2961572-3-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122025411.2961572-3-bingbu.cao@intel.com>

Hi Bingbu,

On Wed, Nov 22, 2023 at 10:54:08AM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> As the sensor device maybe accessible right after its async sub-device is
> registered, such as ipu-bridge will try to power up sensor by sensor's client
> device's runtime PM from the async notifier callback, if runtime PM is not
> enabled, it will fail.
> 
> So runtime PM should be ready before its async sub-device is registered
> and accessible by others.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/i2c/ov01a10.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> index 2b9e1b3a3bf4..8e36f91913aa 100644
> --- a/drivers/media/i2c/ov01a10.c
> +++ b/drivers/media/i2c/ov01a10.c
> @@ -953,17 +953,20 @@ static int ov01a10_probe(struct i2c_client *client)
>  		goto err_media_entity_cleanup;
>  	}
>  
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);

Somehow this driver is missign pm_runtime_set_active() call. Could you
add it? (Similarly, pm_runtime_set_suspended() goes to .remove().)

I think it's fine to have it in the same patch.

A Fixes: tag would be nice, too, including Cc: stable.

> +
>  	ret = v4l2_async_register_subdev_sensor(&ov01a10->sd);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to register subdev: %d\n", ret);
> -		goto err_media_entity_cleanup;
> +		goto err_pm_disable;
>  	}
>  
> -	pm_runtime_enable(dev);
> -	pm_runtime_idle(dev);
> -
>  	return 0;
>  
> +err_pm_disable:
> +	pm_runtime_disable(dev);
> +
>  err_media_entity_cleanup:
>  	media_entity_cleanup(&ov01a10->sd.entity);
>  

-- 
Regards,

Sakari Ailus

