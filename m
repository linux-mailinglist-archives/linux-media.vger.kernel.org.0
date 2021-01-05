Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9AFB2EB029
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 17:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbhAEQef (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 11:34:35 -0500
Received: from foss.arm.com ([217.140.110.172]:57076 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726132AbhAEQee (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Jan 2021 11:34:34 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83C64113E;
        Tue,  5 Jan 2021 08:33:48 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 647673F70D;
        Tue,  5 Jan 2021 08:33:37 -0800 (PST)
Subject: Re: [PATCH 19/31] drm/panfrost: convert to use devm_pm_opp_* API
To:     Yangtao Li <tiny.windzz@gmail.com>, myungjoo.ham@samsung.com,
        kyungmin.park@samsung.com, cw00.choi@samsung.com, krzk@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, digetx@gmail.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, yuq825@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
        sean@poorly.run, robh@kernel.org, tomeu.vizoso@collabora.com,
        alyssa.rosenzweig@collabora.com, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        lukasz.luba@arm.com, adrian.hunter@intel.com,
        ulf.hansson@linaro.org, vireshk@kernel.org, nm@ti.com,
        sboyd@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, rjw@rjwysocki.net, jcrouse@codeaurora.org,
        hoegsberg@google.com, eric@anholt.net, tzimmermann@suse.de,
        marijn.suijten@somainline.org, gustavoars@kernel.org,
        emil.velikov@collabora.com, jonathan@marek.ca,
        akhilpo@codeaurora.org, smasetty@codeaurora.org,
        airlied@redhat.com, masneyb@onstation.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, ddavenport@chromium.org,
        jsanka@codeaurora.org, rnayak@codeaurora.org,
        tongtiangen@huawei.com, miaoqinglang@huawei.com,
        khsieh@codeaurora.org, abhinavk@codeaurora.org,
        chandanu@codeaurora.org, groeck@chromium.org, varar@codeaurora.org,
        mka@chromium.org, harigovi@codeaurora.org,
        rikard.falkeborn@gmail.com, natechancellor@gmail.com,
        georgi.djakov@linaro.org, akashast@codeaurora.org,
        parashar@codeaurora.org, dianders@chromium.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-20-tiny.windzz@gmail.com>
From:   Steven Price <steven.price@arm.com>
Message-ID: <63e5e2ae-0baf-cbd1-b2eb-43fac89acb7c@arm.com>
Date:   Tue, 5 Jan 2021 16:33:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210101165507.19486-20-tiny.windzz@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/01/2021 16:54, Yangtao Li wrote:
> Use devm_pm_opp_* API to simplify code, and remove opp_table
> from panfrost_devfreq.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_devfreq.c | 34 ++++++---------------
>   drivers/gpu/drm/panfrost/panfrost_devfreq.h |  1 -
>   2 files changed, 10 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index f44d28fad085..c42fa9eb43b1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -92,25 +92,26 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>   	struct thermal_cooling_device *cooling;
>   	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
>   
> -	opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
> +	opp_table = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
>   					      pfdev->comp->num_supplies);
>   	if (IS_ERR(opp_table)) {
>   		ret = PTR_ERR(opp_table);
>   		/* Continue if the optional regulator is missing */
>   		if (ret != -ENODEV) {
>   			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> -			goto err_fini;
> +			return ret;
>   		}
> -	} else {
> -		pfdevfreq->regulators_opp_table = opp_table;
>   	}
>   
> -	ret = dev_pm_opp_of_add_table(dev);
> +	ret = devm_pm_opp_of_add_table(dev);
>   	if (ret) {
> +		if (!IS_ERR(opp_table))
> +			devm_pm_opp_put_regulators(dev, opp_table);
> +
>   		/* Optional, continue without devfreq */
>   		if (ret == -ENODEV)
>   			ret = 0;
> -		goto err_fini;
> +		return ret;
>   	}
>   	pfdevfreq->opp_of_table_added = true;
>   
> @@ -121,10 +122,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>   	cur_freq = clk_get_rate(pfdev->clock);
>   
>   	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
> -	if (IS_ERR(opp)) {
> -		ret = PTR_ERR(opp);
> -		goto err_fini;
> -	}
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
>   
>   	panfrost_devfreq_profile.initial_freq = cur_freq;
>   	dev_pm_opp_put(opp);
> @@ -133,8 +132,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>   					  DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
>   	if (IS_ERR(devfreq)) {
>   		DRM_DEV_ERROR(dev, "Couldn't initialize GPU devfreq\n");
> -		ret = PTR_ERR(devfreq);
> -		goto err_fini;
> +		return PTR_ERR(devfreq);
>   	}
>   	pfdevfreq->devfreq = devfreq;
>   
> @@ -145,10 +143,6 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>   		pfdevfreq->cooling = cooling;
>   
>   	return 0;
> -
> -err_fini:
> -	panfrost_devfreq_fini(pfdev);
> -	return ret;
>   }
>   
>   void panfrost_devfreq_fini(struct panfrost_device *pfdev)
> @@ -159,14 +153,6 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
>   		devfreq_cooling_unregister(pfdevfreq->cooling);
>   		pfdevfreq->cooling = NULL;
>   	}
> -
> -	if (pfdevfreq->opp_of_table_added) {
> -		dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
> -		pfdevfreq->opp_of_table_added = false;
> -	}
> -
> -	dev_pm_opp_put_regulators(pfdevfreq->regulators_opp_table);
> -	pfdevfreq->regulators_opp_table = NULL;
>   }
>   
>   void panfrost_devfreq_resume(struct panfrost_device *pfdev)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.h b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
> index db6ea48e21f9..a51854cc8c06 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
> @@ -15,7 +15,6 @@ struct panfrost_device;
>   
>   struct panfrost_devfreq {
>   	struct devfreq *devfreq;
> -	struct opp_table *regulators_opp_table;
>   	struct thermal_cooling_device *cooling;
>   	bool opp_of_table_added;
>   
> 

