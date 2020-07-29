Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC21F2325DD
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 22:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgG2UHP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 16:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbgG2UHN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 16:07:13 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C35C061794
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 13:07:12 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id c6so2504551pje.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 13:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SxNA+L8rUhB1Bc6LLTgpGXr9c5vU5yL6AHdcNoeaNxA=;
        b=pvf5XSdxAh16xqgZxP9BVFUyH6stSgPCzZ6a6WEeODNIjwQo1VTGUzg1/3j4pnx0as
         7Vfvx58XKq3ZbFCMDOLR55WGvEZLJEVPCOQnZ9pD5qLwysvuK44MhSEW5DCSWazEhbu1
         88/pvsM9aeSW8OEMsQFErmKJLleEBWDrdWMKApngt6DFs2/z+18G/u3oN5kZLsm3cqim
         z2Lmc2EDSjB2Ps1z3VwaUhKwWBbObqdB/aVan8zYp+axJpyZw2BPSJnHBnDdWFpvKrVX
         TysZZGT+gxfBLBV3MatKp657yehoahCA7In7kYm+3mZ7sQ85fpFOUkLyzUT3tJ4lzWNx
         2Anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SxNA+L8rUhB1Bc6LLTgpGXr9c5vU5yL6AHdcNoeaNxA=;
        b=SVQPFJxrcLDfEpJ6aI7ALOcZJo6qmTAPuD+fLCeCME+8leYx21Uqlf6AqW4ZneME/6
         grhEUjt+Kbu51KZQNhg+UQ03CMkWj4KcaxD9Ny7Mez/9DlsVP6PbBAbYW3rB4Cp1Zb5p
         9aRvIl2ETiorgb/5sDT5ZuRqlYrbbK3WKsoZCFgv5bS70Bxc/xyilmOrBil5xRTBylym
         58bXEOOJYysxuRpBkT5H507DpoLo6A9r4WXzxbc1q3TeQ2470noAM4fzxthUPLazdk1r
         qKId7W8t90OxjmUoNZYKnhx43MUIvkgXMdhB0zjPdlLQZfLi2US5kAdtMywhPA4nW27X
         UomA==
X-Gm-Message-State: AOAM5308NRvJ7xMT2YnjPGJUrbN+aW+w7Mo2GIhSuaSobRB7XrNHUa8R
        Va7m5kp+BgFurp0VXhwoMXCv5w==
X-Google-Smtp-Source: ABdhPJxQmSsca4rpT68BQI9U3lGtXd5d9DnRgwFf/Lu+rMoHX3/eA5JVkuOqFNOOYA39BcQ6hzj4AQ==
X-Received: by 2002:a17:90a:fa92:: with SMTP id cu18mr10998801pjb.215.1596053231946;
        Wed, 29 Jul 2020 13:07:11 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y9sm3108940pja.13.2020.07.29.13.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 13:07:11 -0700 (PDT)
Date:   Wed, 29 Jul 2020 13:03:42 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
Subject: Re: [PATCH v5 3/5] media: venus: core: Add support for opp
 tables/perf voting
Message-ID: <20200729200342.GJ229995@builder.lan>
References: <1596007005-30425-1-git-send-email-rnayak@codeaurora.org>
 <1596007005-30425-4-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596007005-30425-4-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed 29 Jul 00:16 PDT 2020, Rajendra Nayak wrote:

> Add support to add OPP tables and perf voting on the OPP powerdomain.
> This is needed so venus votes on the corresponding performance state
> for the OPP powerdomain along with setting the core clock rate.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/media/platform/qcom/venus/core.c       |  2 +
>  drivers/media/platform/qcom/venus/core.h       |  5 ++
>  drivers/media/platform/qcom/venus/pm_helpers.c | 92 ++++++++++++++++++++++++--
>  3 files changed, 92 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index bfcaba3..a3e98a5 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -525,6 +525,7 @@ static const struct venus_resources sdm845_res_v2 = {
>  	.vcodec_clks_num = 2,
>  	.vcodec_pmdomains = { "venus", "vcodec0", "vcodec1" },
>  	.vcodec_pmdomains_num = 3,
> +	.opp_pmdomain = (const char *[]) { "cx", NULL },
>  	.vcodec_num = 2,
>  	.max_load = 3110400,	/* 4096x2160@90 */
>  	.hfi_version = HFI_VERSION_4XX,
> @@ -570,6 +571,7 @@ static const struct venus_resources sc7180_res = {
>  	.vcodec_clks_num = 2,
>  	.vcodec_pmdomains = { "venus", "vcodec0" },
>  	.vcodec_pmdomains_num = 2,
> +	.opp_pmdomain = (const char *[]) { "cx", NULL },
>  	.vcodec_num = 1,
>  	.hfi_version = HFI_VERSION_4XX,
>  	.vmem_id = VIDC_RESOURCE_NONE,
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7118612..b0cc544 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -62,6 +62,7 @@ struct venus_resources {
>  	unsigned int vcodec_clks_num;
>  	const char * const vcodec_pmdomains[VIDC_PMDOMAINS_NUM_MAX];
>  	unsigned int vcodec_pmdomains_num;
> +	const char **opp_pmdomain;
>  	unsigned int vcodec_num;
>  	enum hfi_version hfi_version;
>  	u32 max_load;
> @@ -145,8 +146,12 @@ struct venus_core {
>  	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
>  	struct icc_path *video_path;
>  	struct icc_path *cpucfg_path;
> +	struct opp_table *opp_table;
> +	bool has_opp_table;
>  	struct device_link *pd_dl_venus;
>  	struct device *pmdomains[VIDC_PMDOMAINS_NUM_MAX];
> +	struct device_link *opp_dl_venus;
> +	struct device *opp_pmdomain;
>  	struct video_device *vdev_dec;
>  	struct video_device *vdev_enc;
>  	struct v4l2_device v4l2_dev;
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index abf9315..0308d20 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -9,6 +9,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/types.h>
>  #include <media/v4l2-mem2mem.h>
> @@ -66,10 +67,9 @@ static void core_clks_disable(struct venus_core *core)
>  
>  static int core_clks_set_rate(struct venus_core *core, unsigned long freq)
>  {
> -	struct clk *clk = core->clks[0];
>  	int ret;
>  
> -	ret = clk_set_rate(clk, freq);
> +	ret = dev_pm_opp_set_rate(core->dev, freq);
>  	if (ret)
>  		return ret;
>  
> @@ -740,13 +740,16 @@ static int venc_power_v4(struct device *dev, int on)
>  
>  static int vcodec_domains_get(struct device *dev)
>  {
> +	int ret;
> +	struct opp_table *opp_table;
> +	struct device **opp_virt_dev;
>  	struct venus_core *core = dev_get_drvdata(dev);
>  	const struct venus_resources *res = core->res;
>  	struct device *pd;
>  	unsigned int i;
>  
>  	if (!res->vcodec_pmdomains_num)
> -		return -ENODEV;
> +		goto skip_pmdomains;
>  
>  	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
>  		pd = dev_pm_domain_attach_by_name(dev,
> @@ -763,7 +766,41 @@ static int vcodec_domains_get(struct device *dev)
>  	if (!core->pd_dl_venus)
>  		return -ENODEV;
>  
> +skip_pmdomains:
> +	if (!core->has_opp_table)
> +		return 0;
> +
> +	/* Attach the power domain for setting performance state */
> +	opp_table = dev_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
> +	if (IS_ERR(opp_table)) {
> +		ret = PTR_ERR(opp_table);
> +		goto opp_attach_err;
> +	}
> +
> +	core->opp_pmdomain = *opp_virt_dev;
> +	core->opp_dl_venus = device_link_add(dev, core->opp_pmdomain,
> +					     DL_FLAG_RPM_ACTIVE |
> +					     DL_FLAG_PM_RUNTIME |
> +					     DL_FLAG_STATELESS);
> +	if (!core->opp_dl_venus) {
> +		ret = -ENODEV;
> +		goto opp_dl_add_err;
> +	}
> +
>  	return 0;
> +
> +opp_dl_add_err:
> +	dev_pm_domain_detach(core->opp_pmdomain, true);
> +opp_attach_err:
> +	if (core->pd_dl_venus) {
> +		device_link_del(core->pd_dl_venus);
> +		for (i = 0; i < res->vcodec_pmdomains_num; i++) {
> +			if (IS_ERR_OR_NULL(core->pmdomains[i]))
> +				continue;
> +			dev_pm_domain_detach(core->pmdomains[i], true);
> +		}
> +	}
> +	return ret;
>  }
>  
>  static void vcodec_domains_put(struct device *dev)
> @@ -773,7 +810,7 @@ static void vcodec_domains_put(struct device *dev)
>  	unsigned int i;
>  
>  	if (!res->vcodec_pmdomains_num)
> -		return;
> +		goto skip_pmdomains;
>  
>  	if (core->pd_dl_venus)
>  		device_link_del(core->pd_dl_venus);
> @@ -783,6 +820,15 @@ static void vcodec_domains_put(struct device *dev)
>  			continue;
>  		dev_pm_domain_detach(core->pmdomains[i], true);
>  	}
> +
> +skip_pmdomains:
> +	if (!core->has_opp_table)
> +		return;
> +
> +	if (core->opp_dl_venus)
> +		device_link_del(core->opp_dl_venus);
> +
> +	dev_pm_domain_detach(core->opp_pmdomain, true);
>  }
>  
>  static int core_get_v4(struct device *dev)
> @@ -811,19 +857,46 @@ static int core_get_v4(struct device *dev)
>  	if (legacy_binding)
>  		return 0;
>  
> +	core->opp_table = dev_pm_opp_set_clkname(dev, "core");
> +	if (IS_ERR(core->opp_table))
> +		return PTR_ERR(core->opp_table);
> +
> +	if (core->res->opp_pmdomain) {
> +		ret = dev_pm_opp_of_add_table(dev);
> +		if (!ret) {
> +			core->has_opp_table = true;
> +		} else if (ret != -ENODEV) {
> +			dev_err(dev, "invalid OPP table in device tree\n");
> +			dev_pm_opp_put_clkname(core->opp_table);
> +			return ret;
> +		}
> +	}
> +
>  	ret = vcodec_domains_get(dev);
> -	if (ret)
> +	if (ret) {
> +		if (core->has_opp_table)
> +			dev_pm_opp_of_remove_table(dev);
> +		dev_pm_opp_put_clkname(core->opp_table);
>  		return ret;
> +	}
>  
>  	return 0;
>  }
>  
>  static void core_put_v4(struct device *dev)
>  {
> +	struct venus_core *core = dev_get_drvdata(dev);
> +
>  	if (legacy_binding)
>  		return;
>  
>  	vcodec_domains_put(dev);
> +
> +	if (core->has_opp_table)
> +		dev_pm_opp_of_remove_table(dev);
> +	if (core->opp_table)
> +		dev_pm_opp_put_clkname(core->opp_table);
> +
>  }
>  
>  static int core_power_v4(struct device *dev, int on)
> @@ -831,10 +904,15 @@ static int core_power_v4(struct device *dev, int on)
>  	struct venus_core *core = dev_get_drvdata(dev);
>  	int ret = 0;
>  
> -	if (on == POWER_ON)
> +	if (on == POWER_ON) {
>  		ret = core_clks_enable(core);
> -	else
> +	} else {
> +		/* Drop the performance state vote */
> +		if (core->opp_pmdomain)
> +			dev_pm_opp_set_rate(dev, 0);
> +
>  		core_clks_disable(core);
> +	}
>  
>  	return ret;
>  }
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
