Return-Path: <linux-media+bounces-3291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2AA826993
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 09:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 166591F2168A
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 08:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D72BA33;
	Mon,  8 Jan 2024 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ga02pCP9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9162FBA4B
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 08:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704702969; x=1736238969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5cXh5kWf52RddeSZ0Fejoq+3mvlOueWd9E8xmTq7JMc=;
  b=ga02pCP9ZSk7Q1DzzMEdebrqaGNdTBSArC/+KywZ5rS9qFkCNzEqQ1H1
   wORmLoIxCRBqgPe7UYQz43cyq/4TkRU55cLPK8YJaIM9JWXADyQTeyGMc
   24VkwLHdZJ6s5UrRshohZkGe2zZVmNl0lkkwFErNaDhq9wY0UY6EC9AYB
   P82gGHOo19CrUP1NIoJR68p5FZhVWbAX2Z80h8FyCPhq8Xb7VlGLs2upJ
   oy7Vp3nLJlTTKv+p6P6PWSN+SVL7GsJgN3shOPauOHAk0IXzXYfo0Tokw
   dWIkJtRKCXobF22Qdl+uIbKNk0oQfH8glOBpu97QLJcMhcO7pWVZ7G1SN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="4583293"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="4583293"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 00:36:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="810136866"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="810136866"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 00:36:06 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 59BC711F8DE;
	Mon,  8 Jan 2024 10:36:03 +0200 (EET)
Date: Mon, 8 Jan 2024 08:36:03 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Chen, Jason Z" <jason.z.chen@intel.com>
Cc: linux-media@vger.kernel.org, andy.yeh@intel.com, qingwu.zhang@intel.com,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH v1] media: ov08x40: Avoid sensor probing in D0 state
Message-ID: <ZZuz8yMCiaHNZwpB@kekkonen.localdomain>
References: <20240105102008.2879073-1-jason.z.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105102008.2879073-1-jason.z.chen@intel.com>

Hi Jason,

On Fri, Jan 05, 2024 at 06:20:08PM +0800, Chen, Jason Z wrote:
> From: Jason Chen <jason.z.chen@intel.com>
> 
> When the system enters the D0 state and attempt to probe the device,
> another component, such as LED, will also be pulled high due to the
> hardware design. It's advisable to keep the device being probed in
> a different D state.
> 
> Signed-off-by: Jason Chen <jason.z.chen@intel.com>
> ---
>  drivers/media/i2c/ov08x40.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index 8f24be08c7b..f46cf0eb6c1 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -3226,6 +3226,7 @@ static int ov08x40_probe(struct i2c_client *client)
>  {
>  	struct ov08x40 *ov08x;
>  	int ret;
> +	bool full_power;
>  
>  	/* Check HW config */
>  	ret = ov08x40_check_hwcfg(&client->dev);
> @@ -3241,11 +3242,14 @@ static int ov08x40_probe(struct i2c_client *client)
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&ov08x->sd, client, &ov08x40_subdev_ops);
>  
> -	/* Check module identity */
> -	ret = ov08x40_identify_module(ov08x);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
> -		return ret;
> +	full_power = acpi_dev_state_d0(&client->dev);
> +	if (full_power) {
> +		/* Check module identity */
> +		ret = ov08x40_identify_module(ov08x);

This way the sensor identification will be missed if the device wasn't
powered on im probe. See e.g. commit d1d2ed5925c370ac09fa6efd39f5f569f562e5b7
for an example.

> +		if (ret) {
> +			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
> +			return ret;
> +		}
>  	}
>  
>  	/* Set default mode to max resolution */
> @@ -3277,7 +3281,8 @@ static int ov08x40_probe(struct i2c_client *client)
>  	 * Device is already turned on by i2c-core with ACPI domain PM.
>  	 * Enable runtime PM and turn off the device.
>  	 */

Please remove this comment, too.

> -	pm_runtime_set_active(&client->dev);
> +	if (full_power)
> +		pm_runtime_set_active(&client->dev);
>  	pm_runtime_enable(&client->dev);
>  	pm_runtime_idle(&client->dev);
>  
> @@ -3321,6 +3326,7 @@ static struct i2c_driver ov08x40_i2c_driver = {
>  	},
>  	.probe = ov08x40_probe,
>  	.remove = ov08x40_remove,
> +	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
>  };
>  
>  module_i2c_driver(ov08x40_i2c_driver);

-- 
Regards,

Sakari Ailus

