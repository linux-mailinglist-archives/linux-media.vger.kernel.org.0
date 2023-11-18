Return-Path: <linux-media+bounces-560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 028FB7F01AB
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 18:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62C0AB209B8
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 17:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C543119449;
	Sat, 18 Nov 2023 17:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UUjkqvEG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BCFD66;
	Sat, 18 Nov 2023 09:46:01 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F1D1DA7;
	Sat, 18 Nov 2023 18:45:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700329531;
	bh=BVvENg7ffa1foaiSJAissliRVCT4IYE4of5WOGQfDnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UUjkqvEG3jVZ+1fOtHvdb+lggLoO+yh/VhzipqtsPnq/iDbG4TtFuRC4hgGIVILaD
	 VP4Or/SWDMokexmDZGq8qmnLKPyfNn875Ud7Bnx7Ma50Nwq2AyOIq16MlgjtKLzk5Y
	 daS5NeXR6m1NKiH1ZuaHRf+K4fUzns+IJjF6rdiM=
Date: Sat, 18 Nov 2023 19:46:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, linux-media@vger.kernel.org,
	rafael@kernel.org, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v2 1/7] pm: runtime: Simplify pm_runtime_get_if_active()
 usage
Message-ID: <20231118174606.GE20846@pendragon.ideasonboard.com>
References: <20231117111433.1561669-1-sakari.ailus@linux.intel.com>
 <20231117111433.1561669-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231117111433.1561669-2-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Fri, Nov 17, 2023 at 01:14:27PM +0200, Sakari Ailus wrote:
> The majority of the callers currently using pm_runtime_get_if_active()
> call it with ign_usage_count argument set to true. There's only one driver
> using this feature (and natually implementation of
> pm_runtime_get_if_in_use()).
> 
> To make this function more practical to use, remove the ign_usage_count
> argument from the function. The main implementation is renamed as
> __pm_runtime_get_conditional().
> 
> This function is expected to gain a large number of users in the future
> --- camera sensor drivers using runtime autosuspend have a need to get the

s/---/-/

> device's usage_count conditionally if it is enabled. Most of these
> currently use pm_runtime_get_if_in_use(), which is a bug.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> ---
> 
> since v1:
> 
> - Fix __pm_runtime_get_if_conditional() un-CONFIG_PM implementation.
> ---
>  Documentation/power/runtime_pm.rst      |  5 ++--
>  drivers/base/power/runtime.c            |  9 ++++---
>  drivers/gpu/drm/i915/intel_runtime_pm.c |  2 +-
>  drivers/media/i2c/ccs/ccs-core.c        |  2 +-
>  drivers/net/ipa/ipa_smp2p.c             |  2 +-
>  drivers/pci/pci.c                       |  2 +-
>  include/linux/pm_runtime.h              | 32 +++++++++++++++++++++----
>  sound/hda/hdac_device.c                 |  2 +-
>  8 files changed, 40 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
> index 65b86e487afe..da99379071a4 100644
> --- a/Documentation/power/runtime_pm.rst
> +++ b/Documentation/power/runtime_pm.rst
> @@ -396,10 +396,9 @@ drivers/base/power/runtime.c and include/linux/pm_runtime.h:
>        nonzero, increment the counter and return 1; otherwise return 0 without
>        changing the counter
>  
> -  `int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count);`
> +  `int pm_runtime_get_if_active(struct device *dev);`
>      - return -EINVAL if 'power.disable_depth' is nonzero; otherwise, if the
> -      runtime PM status is RPM_ACTIVE, and either ign_usage_count is true
> -      or the device's usage_count is non-zero, increment the counter and
> +      runtime PM status is RPM_ACTIVE, increment the counter and
>        return 1; otherwise return 0 without changing the counter
>  
>    `void pm_runtime_put_noidle(struct device *dev);`
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 4545669cb973..8b56468eca9d 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -1175,7 +1175,7 @@ int __pm_runtime_resume(struct device *dev, int rpmflags)
>  EXPORT_SYMBOL_GPL(__pm_runtime_resume);
>  
>  /**
> - * pm_runtime_get_if_active - Conditionally bump up device usage counter.
> + * __pm_runtime_get_conditional - Conditionally bump up device usage counter.
>   * @dev: Device to handle.
>   * @ign_usage_count: Whether or not to look at the current usage counter value.
>   *
> @@ -1195,8 +1195,11 @@ EXPORT_SYMBOL_GPL(__pm_runtime_resume);
>   *
>   * The caller is responsible for decrementing the runtime PM usage counter of
>   * @dev after this function has returned a positive value for it.
> + *
> + * This function is not intended to be called by drivers, use
> + * pm_runtime_get_if_active() or pm_runtime_get_if_in_use() instead.
>   */
> -int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count)
> +int __pm_runtime_get_conditional(struct device *dev, bool ign_usage_count)
>  {
>  	unsigned long flags;
>  	int retval;
> @@ -1217,7 +1220,7 @@ int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count)
>  
>  	return retval;
>  }
> -EXPORT_SYMBOL_GPL(pm_runtime_get_if_active);
> +EXPORT_SYMBOL_GPL(__pm_runtime_get_conditional);
>  
>  /**
>   * __pm_runtime_set_status - Set runtime PM status of a device.
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
> index 6d8e5e5c0cba..b163efe80975 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -434,7 +434,7 @@ static intel_wakeref_t __intel_runtime_pm_get_if_active(struct intel_runtime_pm
>  		 * function, since the power state is undefined. This applies
>  		 * atm to the late/early system suspend/resume handlers.
>  		 */
> -		if (pm_runtime_get_if_active(rpm->kdev, ignore_usecount) <= 0)
> +		if (__pm_runtime_get_conditional(rpm->kdev, ignore_usecount) <= 0)
>  			return 0;
>  	}
>  
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 12e6f0a26fc8..45701a18c845 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -664,7 +664,7 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_status = pm_runtime_get_if_active(&client->dev, true);
> +	pm_status = pm_runtime_get_if_active(&client->dev);
>  	if (!pm_status)
>  		return 0;
>  
> diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
> index 5620dc271fac..cbf3d4761ce3 100644
> --- a/drivers/net/ipa/ipa_smp2p.c
> +++ b/drivers/net/ipa/ipa_smp2p.c
> @@ -92,7 +92,7 @@ static void ipa_smp2p_notify(struct ipa_smp2p *smp2p)
>  		return;
>  
>  	dev = &smp2p->ipa->pdev->dev;
> -	smp2p->power_on = pm_runtime_get_if_active(dev, true) > 0;
> +	smp2p->power_on = pm_runtime_get_if_active(dev) > 0;
>  
>  	/* Signal whether the IPA power is enabled */
>  	mask = BIT(smp2p->enabled_bit);
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 59c01d68c6d5..d8d4abbc936f 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -2439,7 +2439,7 @@ static void pci_pme_list_scan(struct work_struct *work)
>  			 * If the device is in a low power state it
>  			 * should not be polled either.
>  			 */
> -			pm_status = pm_runtime_get_if_active(dev, true);
> +			pm_status = pm_runtime_get_if_active(dev);
>  			if (!pm_status)
>  				continue;
>  
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index 7c9b35448563..13cd526634c1 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -72,7 +72,8 @@ extern int pm_runtime_force_resume(struct device *dev);
>  extern int __pm_runtime_idle(struct device *dev, int rpmflags);
>  extern int __pm_runtime_suspend(struct device *dev, int rpmflags);
>  extern int __pm_runtime_resume(struct device *dev, int rpmflags);
> -extern int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count);
> +extern int __pm_runtime_get_conditional(struct device *dev,
> +					bool ign_usage_count);
>  extern int pm_schedule_suspend(struct device *dev, unsigned int delay);
>  extern int __pm_runtime_set_status(struct device *dev, unsigned int status);
>  extern int pm_runtime_barrier(struct device *dev);
> @@ -94,16 +95,33 @@ extern void pm_runtime_release_supplier(struct device_link *link);
>  
>  extern int devm_pm_runtime_enable(struct device *dev);
>  
> +/**
> + * pm_runtime_get_if_active - Bump up runtime PM usage counter if the device is
> + *			      in active state
> + * @dev: Target device.
> + *
> + * Increment the runtime PM usage counter of @dev if its runtime PM status is
> + * %RPM_ACTIVE, in which case it returns 1. If the device is in a different
> + * state, 0 is returned. -EINVAL is returned if runtime PM is disabled for the
> + * device.
> + */
> +static inline int pm_runtime_get_if_active(struct device *dev)
> +{
> +	return __pm_runtime_get_conditional(dev, true);
> +}
> +
>  /**
>   * pm_runtime_get_if_in_use - Conditionally bump up runtime PM usage counter.
>   * @dev: Target device.
>   *
>   * Increment the runtime PM usage counter of @dev if its runtime PM status is
> - * %RPM_ACTIVE and its runtime PM usage counter is greater than 0.
> + * %RPM_ACTIVE and its runtime PM usage counter is greater than 0, in which case
> + * it returns 1. If the device is in a different state or its usage_count is 0,
> + * 0 is returned. -EINVAL is returned if runtime PM is disabled for the device.

It would be nice to explain the difference between RPM_ACTIVE and
usage_count. It can be done in a separate patch.

>   */
>  static inline int pm_runtime_get_if_in_use(struct device *dev)
>  {
> -	return pm_runtime_get_if_active(dev, false);
> +	return __pm_runtime_get_conditional(dev, false);
>  }
>  
>  /**
> @@ -275,8 +293,12 @@ static inline int pm_runtime_get_if_in_use(struct device *dev)
>  {
>  	return -EINVAL;
>  }
> -static inline int pm_runtime_get_if_active(struct device *dev,
> -					   bool ign_usage_count)
> +static inline int pm_runtime_get_if_active(struct device *dev)
> +{
> +	return -EINVAL;
> +}

The pm_runtime_get_if_in_use() and pm_runtime_get_if_active() wrappers
could be defined once, outside of the CONFIG_PM conditional section,
nistead of having a stub version when !CONFIG_PM. Lowering the amount of
conditional code helps minimizing the risk of build errors in exotic
configurations. This can also be done in a separate patch.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +static inline int __pm_runtime_get_conditional(struct device *dev,
> +					       bool ign_usage_count)
>  {
>  	return -EINVAL;
>  }
> diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
> index bbf7bcdb449a..0a9223c18d77 100644
> --- a/sound/hda/hdac_device.c
> +++ b/sound/hda/hdac_device.c
> @@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_power_up_pm);
>  int snd_hdac_keep_power_up(struct hdac_device *codec)
>  {
>  	if (!atomic_inc_not_zero(&codec->in_pm)) {
> -		int ret = pm_runtime_get_if_active(&codec->dev, true);
> +		int ret = pm_runtime_get_if_active(&codec->dev);
>  		if (!ret)
>  			return -1;
>  		if (ret < 0)

-- 
Regards,

Laurent Pinchart

