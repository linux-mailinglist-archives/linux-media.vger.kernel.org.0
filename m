Return-Path: <linux-media+bounces-4223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8946283DD1F
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 16:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 162791F236A7
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 15:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982DF1D530;
	Fri, 26 Jan 2024 15:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="Tf8kk8Qc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D211CFAC
	for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 15:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706281929; cv=none; b=XxCivyu3/tZkYvmzjHBkqXelAbEG8QDsXc+yQYa9qLdAzrohWneJ54k2w/Qnn/rXNBi4Jn5v8lo+QLrTCODqO4FZRHVeRaUiCMFs/9VaR2Pv+hfM5P9aVAqZHRiaFRbtFlyqQAx1F9uxF/CRf57BXVOmOAPn4zwnifRwsIucn1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706281929; c=relaxed/simple;
	bh=ZAknykhh6i+je3+8AduXaKwQ0/X3ywI2rznDeTP3kAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4xbsOBHeIyIPPwJVXtpnYjkYeND8IptLUQ/cqJnAZX/fNJ1tBXN9gJpi7AVz+TEkisjroS2bbwgWwIPBz2q8ib7Xjh4bUQ8+2qC/ebyjHiYttIefoMgkbw5pfTxGWfqI+FyitngpA+UhD+0iIb+mYppzAGPvtvbiwsJ/KXm1xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=Tf8kk8Qc; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7bfcaa23c57so16553939f.0
        for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 07:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1706281924; x=1706886724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmAGKlbUHD7/NpuouXn5/t0Fv7r/tBW38trG+EcklCI=;
        b=Tf8kk8QcqXWgvir1iNWT58kPSMqQMcc31G44n/mghDOr55lgoc8NBuPSl4I+8OZLyN
         OdhCNgp2NUVNPjqISHDLICpqUM4b6WptAw1L90/YQi4yz9ZDBJUMVd5XfnXkk7/4wdHg
         LoFURwDHVekXBnPvmekSNF5f0Hq2Z8q/6cq0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706281924; x=1706886724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FmAGKlbUHD7/NpuouXn5/t0Fv7r/tBW38trG+EcklCI=;
        b=GmtjWgy0H08JZFasSxq3VvZDnShssg72OvfTeCeYfxElzmvSCm8Jw173BK0fSwvSLS
         /tOZ+fXTq0/T25RpW2Uudep8Am9XCMbIXXfx5CTE6NerP9EpPALegw9ilRIoPSXEDl69
         gRyzNMla+LA4LSwAHE8a3GYUFB7m9hRvT1MJZBIIGV44bTWowPe4fBQfG1xRHOToZcWT
         MnoxFsYGLG5DCzFuJq5ktELMAa8JlPt8wkztdjxxxQ115NHoahn2xYUVCHI6Ll99/4wi
         hhLo76cFXrNHgP2OxIB+aa24sJiKMaSfypBh38Gr1v2bItNPOOtV5v2vX4eIeZX0edf2
         u7zA==
X-Gm-Message-State: AOJu0Yww2jIdNq/YCUgydrbyJvFzMIXNMJ1LKBlfZPXIdS5uxFVTQmTl
	uHzXA15lc/tF+LiPPY0uKYu5P27ZetesWiCzD2j/u8xWabUtgPRkuW4b//PA0Q==
X-Google-Smtp-Source: AGHT+IFrpj53ocxz4PIP+a6fhHNRuGa1zpehIftPdeKqCH8RZGrYTbgHmY9g2zpssARQH7gl5y/zrA==
X-Received: by 2002:a5d:9550:0:b0:7be:f7e5:44fc with SMTP id a16-20020a5d9550000000b007bef7e544fcmr2094553ios.21.1706281924568;
        Fri, 26 Jan 2024 07:12:04 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id c20-20020a056602335400b007bc3f75039dsm395844ioz.29.2024.01.26.07.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 07:12:04 -0800 (PST)
Message-ID: <912d4439-86cd-4060-a66d-baba5fa2bdec@ieee.org>
Date: Fri, 26 Jan 2024 09:12:02 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] pm: runtime: Simplify pm_runtime_get_if_active()
 usage
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-pm@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 laurent.pinchart@ideasonboard.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Paul Elder <paul.elder@ideasonboard.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org
References: <20240122114121.56752-1-sakari.ailus@linux.intel.com>
 <20240122114121.56752-2-sakari.ailus@linux.intel.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240122114121.56752-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/24 5:41 AM, Sakari Ailus wrote:
> There are two ways to opportunistically increment a device's runtime PM
> usage count, calling either pm_runtime_get_if_active() or
> pm_runtime_get_if_in_use(). The former has an argument to tell whether to
> ignore the usage count or not, and the latter simply calls the former with
> ign_usage_count set to false. The other users that want to ignore the
> usage_count will have to explitly set that argument to true which is a bit
> cumbersome.
> 
> To make this function more practical to use, remove the ign_usage_count
> argument from the function. The main implementation is renamed as
> pm_runtime_get_conditional().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Alex Elder <elder@linaro.org> # drivers/net/ipa/ipa_smp2p.c

I actually intended my "Reviewed-by" to cover the entire patch.  I
checked every caller and they all looked good to me.

					-Alex

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Takashi Iwai <tiwai@suse.de> # sound/
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com> # drivers/accel/ivpu/
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # drivers/gpu/drm/i915/
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   Documentation/power/runtime_pm.rst      |  5 ++--
>   drivers/accel/ivpu/ivpu_pm.c            |  2 +-
>   drivers/base/power/runtime.c            | 10 +++++---
>   drivers/gpu/drm/i915/intel_runtime_pm.c |  2 +-
>   drivers/gpu/drm/xe/xe_pm.c              |  2 +-
>   drivers/media/i2c/ccs/ccs-core.c        |  2 +-
>   drivers/media/i2c/ov64a40.c             |  2 +-
>   drivers/media/i2c/thp7312.c             |  2 +-
>   drivers/net/ipa/ipa_smp2p.c             |  2 +-
>   drivers/pci/pci.c                       |  2 +-
>   include/linux/pm_runtime.h              | 32 +++++++++++++++++++++----
>   sound/hda/hdac_device.c                 |  2 +-
>   12 files changed, 45 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
> index 65b86e487afe..da99379071a4 100644
> --- a/Documentation/power/runtime_pm.rst
> +++ b/Documentation/power/runtime_pm.rst
> @@ -396,10 +396,9 @@ drivers/base/power/runtime.c and include/linux/pm_runtime.h:
>         nonzero, increment the counter and return 1; otherwise return 0 without
>         changing the counter
>   
> -  `int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count);`
> +  `int pm_runtime_get_if_active(struct device *dev);`
>       - return -EINVAL if 'power.disable_depth' is nonzero; otherwise, if the
> -      runtime PM status is RPM_ACTIVE, and either ign_usage_count is true
> -      or the device's usage_count is non-zero, increment the counter and
> +      runtime PM status is RPM_ACTIVE, increment the counter and
>         return 1; otherwise return 0 without changing the counter
>   
>     `void pm_runtime_put_noidle(struct device *dev);`
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 0af8864cb3b5..c6d93c7a1c58 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -292,7 +292,7 @@ int ivpu_rpm_get_if_active(struct ivpu_device *vdev)
>   {
>   	int ret;
>   
> -	ret = pm_runtime_get_if_active(vdev->drm.dev, false);
> +	ret = pm_runtime_get_if_in_use(vdev->drm.dev);
>   	drm_WARN_ON(&vdev->drm, ret < 0);
>   
>   	return ret;
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 05793c9fbb84..b4cb3f19b0d8 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -1176,7 +1176,7 @@ int __pm_runtime_resume(struct device *dev, int rpmflags)
>   EXPORT_SYMBOL_GPL(__pm_runtime_resume);
>   
>   /**
> - * pm_runtime_get_if_active - Conditionally bump up device usage counter.
> + * pm_runtime_get_conditional - Conditionally bump up device usage counter.
>    * @dev: Device to handle.
>    * @ign_usage_count: Whether or not to look at the current usage counter value.
>    *
> @@ -1196,8 +1196,12 @@ EXPORT_SYMBOL_GPL(__pm_runtime_resume);
>    *
>    * The caller is responsible for decrementing the runtime PM usage counter of
>    * @dev after this function has returned a positive value for it.
> + *
> + * This function is not primarily intended for use in drivers, most of which are
> + * better served by either pm_runtime_get_if_active() or
> + * pm_runtime_get_if_in_use() instead.
>    */
> -int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count)
> +int pm_runtime_get_conditional(struct device *dev, bool ign_usage_count)
>   {
>   	unsigned long flags;
>   	int retval;
> @@ -1218,7 +1222,7 @@ int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count)
>   
>   	return retval;
>   }
> -EXPORT_SYMBOL_GPL(pm_runtime_get_if_active);
> +EXPORT_SYMBOL_GPL(pm_runtime_get_conditional);
>   
>   /**
>    * __pm_runtime_set_status - Set runtime PM status of a device.
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
> index 860b51b56a92..b5f8abd2a22b 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -246,7 +246,7 @@ static intel_wakeref_t __intel_runtime_pm_get_if_active(struct intel_runtime_pm
>   		 * function, since the power state is undefined. This applies
>   		 * atm to the late/early system suspend/resume handlers.
>   		 */
> -		if (pm_runtime_get_if_active(rpm->kdev, ignore_usecount) <= 0)
> +		if (pm_runtime_get_conditional(rpm->kdev, ignore_usecount) <= 0)
>   			return 0;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index b429c2876a76..dd110058bf74 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -330,7 +330,7 @@ int xe_pm_runtime_put(struct xe_device *xe)
>   
>   int xe_pm_runtime_get_if_active(struct xe_device *xe)
>   {
> -	return pm_runtime_get_if_active(xe->drm.dev, true);
> +	return pm_runtime_get_if_active(xe->drm.dev);
>   }
>   
>   void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index e21287d50c15..e1ae0f9fad43 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -674,7 +674,7 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>   		break;
>   	}
>   
> -	pm_status = pm_runtime_get_if_active(&client->dev, true);
> +	pm_status = pm_runtime_get_if_active(&client->dev);
>   	if (!pm_status)
>   		return 0;
>   
> diff --git a/drivers/media/i2c/ov64a40.c b/drivers/media/i2c/ov64a40.c
> index 4fba4c2cb064..541bf74581d2 100644
> --- a/drivers/media/i2c/ov64a40.c
> +++ b/drivers/media/i2c/ov64a40.c
> @@ -3287,7 +3287,7 @@ static int ov64a40_set_ctrl(struct v4l2_ctrl *ctrl)
>   					 exp_max, 1, exp_val);
>   	}
>   
> -	pm_status = pm_runtime_get_if_active(ov64a40->dev, true);
> +	pm_status = pm_runtime_get_if_active(ov64a40->dev);
>   	if (!pm_status)
>   		return 0;
>   
> diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
> index 2806887514dc..19bd923a7315 100644
> --- a/drivers/media/i2c/thp7312.c
> +++ b/drivers/media/i2c/thp7312.c
> @@ -1052,7 +1052,7 @@ static int thp7312_s_ctrl(struct v4l2_ctrl *ctrl)
>   	if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
>   		return -EINVAL;
>   
> -	if (!pm_runtime_get_if_active(thp7312->dev, true))
> +	if (!pm_runtime_get_if_active(thp7312->dev))
>   		return 0;
>   
>   	switch (ctrl->id) {
> diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
> index 5620dc271fac..cbf3d4761ce3 100644
> --- a/drivers/net/ipa/ipa_smp2p.c
> +++ b/drivers/net/ipa/ipa_smp2p.c
> @@ -92,7 +92,7 @@ static void ipa_smp2p_notify(struct ipa_smp2p *smp2p)
>   		return;
>   
>   	dev = &smp2p->ipa->pdev->dev;
> -	smp2p->power_on = pm_runtime_get_if_active(dev, true) > 0;
> +	smp2p->power_on = pm_runtime_get_if_active(dev) > 0;
>   
>   	/* Signal whether the IPA power is enabled */
>   	mask = BIT(smp2p->enabled_bit);
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index d8f11a078924..f8293ae71389 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -2510,7 +2510,7 @@ static void pci_pme_list_scan(struct work_struct *work)
>   			 * If the device is in a low power state it
>   			 * should not be polled either.
>   			 */
> -			pm_status = pm_runtime_get_if_active(dev, true);
> +			pm_status = pm_runtime_get_if_active(dev);
>   			if (!pm_status)
>   				continue;
>   
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index 7c9b35448563..a212b3008ade 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -72,7 +72,8 @@ extern int pm_runtime_force_resume(struct device *dev);
>   extern int __pm_runtime_idle(struct device *dev, int rpmflags);
>   extern int __pm_runtime_suspend(struct device *dev, int rpmflags);
>   extern int __pm_runtime_resume(struct device *dev, int rpmflags);
> -extern int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count);
> +extern int pm_runtime_get_conditional(struct device *dev,
> +					bool ign_usage_count);
>   extern int pm_schedule_suspend(struct device *dev, unsigned int delay);
>   extern int __pm_runtime_set_status(struct device *dev, unsigned int status);
>   extern int pm_runtime_barrier(struct device *dev);
> @@ -94,16 +95,33 @@ extern void pm_runtime_release_supplier(struct device_link *link);
>   
>   extern int devm_pm_runtime_enable(struct device *dev);
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
> +	return pm_runtime_get_conditional(dev, true);
> +}
> +
>   /**
>    * pm_runtime_get_if_in_use - Conditionally bump up runtime PM usage counter.
>    * @dev: Target device.
>    *
>    * Increment the runtime PM usage counter of @dev if its runtime PM status is
> - * %RPM_ACTIVE and its runtime PM usage counter is greater than 0.
> + * %RPM_ACTIVE and its runtime PM usage counter is greater than 0, in which case
> + * it returns 1. If the device is in a different state or its usage_count is 0,
> + * 0 is returned. -EINVAL is returned if runtime PM is disabled for the device.
>    */
>   static inline int pm_runtime_get_if_in_use(struct device *dev)
>   {
> -	return pm_runtime_get_if_active(dev, false);
> +	return pm_runtime_get_conditional(dev, false);
>   }
>   
>   /**
> @@ -275,8 +293,12 @@ static inline int pm_runtime_get_if_in_use(struct device *dev)
>   {
>   	return -EINVAL;
>   }
> -static inline int pm_runtime_get_if_active(struct device *dev,
> -					   bool ign_usage_count)
> +static inline int pm_runtime_get_if_active(struct device *dev)
> +{
> +	return -EINVAL;
> +}
> +static inline int pm_runtime_get_conditional(struct device *dev,
> +					     bool ign_usage_count)
>   {
>   	return -EINVAL;
>   }
> diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
> index 7f7b67fe1b65..068c16e52dff 100644
> --- a/sound/hda/hdac_device.c
> +++ b/sound/hda/hdac_device.c
> @@ -612,7 +612,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_power_up_pm);
>   int snd_hdac_keep_power_up(struct hdac_device *codec)
>   {
>   	if (!atomic_inc_not_zero(&codec->in_pm)) {
> -		int ret = pm_runtime_get_if_active(&codec->dev, true);
> +		int ret = pm_runtime_get_if_active(&codec->dev);
>   		if (!ret)
>   			return -1;
>   		if (ret < 0)


