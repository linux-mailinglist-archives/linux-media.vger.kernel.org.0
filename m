Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B09E01BE14A
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 16:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgD2Og1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 10:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727785AbgD2Og1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 10:36:27 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D51C035494
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 07:36:26 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k12so2290812wmj.3
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5pX5dyKlz3kEclb3vgYdtEy6+QBLRs0/5uSq26swTfQ=;
        b=ubyNkFZZiNf+IYPn1gLGagDsDg2h9nmmAYtHlhZUsMD8PenhsUWtJ69nRGUNl6oF3m
         BmJ9aN2bhE2yGEOmLf4+uO9UP016HB+3LNJoadT/r/DMCL95Fe2UaOXQkvBzP8OIZbk4
         pRoODB0KeGx0+QsbUqgcKwqmJcHbT5wOEuGbrI/u1fFl6/xa4cHw++LIAHH8KfQruAbY
         ZS7izPPdUG2D+oZ5dykDd7T/TqQeJNb5dQH9RVj5nlWFsBCVOvXC1G1J4l5MqDIf6aoX
         ru3g/1xPhuhKWF81+UNCOZAoPOHyUEQrF8d8T27ImMlxCEdeuHBYWIICczZjIWEN9ybD
         Ilkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5pX5dyKlz3kEclb3vgYdtEy6+QBLRs0/5uSq26swTfQ=;
        b=f3vo8G/3ec3q6v2E8TMKZHedDi/GRuCEVCHnMINehF689XCL2W68hJ99cvj4DybhGj
         ppvtnXTEtauEtJQiGQZL1mtrlGX9XovbZ8tOnny7JELHpVYkzzfj9rVKj/8lPcT7svpJ
         ZeHYAm9/+uJ7gb3RWKwGPY1QksJKeijUcFVuvL8tsRoL8SRWUW/gImHJzPrxPvak+60r
         1Wjy4HlahrjRUbUPc5ojuvAYJclo88QBrAceU/X+Y9EyVbdSd+fAKKQ2MGc6aJgqP3Q4
         LCxac02oXX3aRxeaoYp1EuAUo3H1ZzPFwbDZDsmG9wn6viJThbq4EgrwBYQsSPQqBkTH
         56Kw==
X-Gm-Message-State: AGi0PuaiM5K889uXw+LnNySjTz9ZF66SdKI6cHl0lP+LGUi6LU2JFyNP
        L4RrIBp2ungHdOql2WUNG6yFEpFCQpnaPg==
X-Google-Smtp-Source: APiQypLxhQ4iHWzR7Ia7VtmPtdtF4C0pbsdqvxnTQ0XmBFW7O/a5/5AxEhx1zMlFaMe4piac7uUHgA==
X-Received: by 2002:a1c:4ca:: with SMTP id 193mr3651483wme.18.1588170985057;
        Wed, 29 Apr 2020 07:36:25 -0700 (PDT)
Received: from [192.168.1.2] (212-5-158-103.ip.btc-net.bg. [212.5.158.103])
        by smtp.googlemail.com with ESMTPSA id z10sm31325213wrg.69.2020.04.29.07.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 07:36:24 -0700 (PDT)
Subject: Re: [PATCH v3 12/17] media: venus: core: Add support for opp
 tables/perf voting
To:     Rajendra Nayak <rnayak@codeaurora.org>, viresh.kumar@linaro.org,
        sboyd@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        linux-media@vger.kernel.org
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-13-git-send-email-rnayak@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <b091dc29-d2e8-ed3f-fe1c-ae60e16d5d78@linaro.org>
Date:   Wed, 29 Apr 2020 17:36:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588080785-6812-13-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rajendra,

Thanks for the patch!

On 4/28/20 4:33 PM, Rajendra Nayak wrote:
> Add support to add OPP tables and perf voting on the OPP powerdomain.
> This is needed so venus votes on the corresponding performance state
> for the OPP powerdomain along with setting the core clock rate.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Cc: linux-media@vger.kernel.org
> ---
>  drivers/media/platform/qcom/venus/core.c       | 28 +++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.h       |  5 ++++
>  drivers/media/platform/qcom/venus/pm_helpers.c | 37 +++++++++++++++++++++++---
>  3 files changed, 66 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 194b10b9..e98fea92 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -12,6 +12,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <media/videobuf2-v4l2.h>
>  #include <media/v4l2-mem2mem.h>
> @@ -214,6 +215,20 @@ static int venus_probe(struct platform_device *pdev)
>  	if (!core->pm_ops)
>  		return -ENODEV;
>  
> +	core->opp_table = dev_pm_opp_set_clkname(dev, "core");

Should we set opp clkname if opp_of_add_table fails? We have platforms
which don't have opp tables in Venus DT node. We have to be backward
compatible for them.

> +	if (IS_ERR(core->opp_table))
> +		return PTR_ERR(core->opp_table);
> +
> +	if (core->res->opp_pmdomain) {
> +		ret = dev_pm_opp_of_add_table(dev);
> +		if (!ret) {
> +			core->has_opp_table = true;
> +		} else if (ret != -ENODEV) {

Is it possible dev_pm_opp_of_add_table() to return EPROBE_DEFER?

> +			dev_err(dev, "Invalid OPP table in Device tree\n");

... if so, please drop dev_err.

> +			return ret;
> +		}
> +	}
> +
>  	if (core->pm_ops->core_get) {
>  		ret = core->pm_ops->core_get(dev);
>  		if (ret)
> @@ -301,6 +316,9 @@ static int venus_probe(struct platform_device *pdev)
>  err_venus_shutdown:
>  	venus_shutdown(core);
>  err_runtime_disable:
> +	if (core->res->opp_pmdomain && core->has_opp_table)
> +		dev_pm_opp_of_remove_table(dev);
> +	dev_pm_opp_put_clkname(core->opp_table);
>  	pm_runtime_set_suspended(dev);
>  	pm_runtime_disable(dev);
>  	hfi_destroy(core);
> @@ -326,6 +344,10 @@ static int venus_remove(struct platform_device *pdev)
>  
>  	venus_firmware_deinit(core);
>  
> +	if (core->res->opp_pmdomain && core->has_opp_table)
> +		dev_pm_opp_of_remove_table(dev);
> +	dev_pm_opp_put_clkname(core->opp_table);
> +
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);
>  
> @@ -350,6 +372,10 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	/* Drop the performance state vote */
> +	if (core->opp_pmdomain)
> +		dev_pm_opp_set_rate(dev, 0);
> +
>  	if (pm_ops->core_power)
>  		ret = pm_ops->core_power(dev, POWER_OFF);
>  
> @@ -511,6 +537,7 @@ static const struct venus_resources sdm845_res_v2 = {
>  	.vcodec_clks_num = 2,
>  	.vcodec_pmdomains = { "venus", "vcodec0", "vcodec1" },
>  	.vcodec_pmdomains_num = 3,
> +	.opp_pmdomain = (const char *[]) { "opp-pd", NULL },
>  	.vcodec_num = 2,
>  	.max_load = 3110400,	/* 4096x2160@90 */
>  	.hfi_version = HFI_VERSION_4XX,
> @@ -556,6 +583,7 @@ static const struct venus_resources sc7180_res = {
>  	.vcodec_clks_num = 2,
>  	.vcodec_pmdomains = { "venus", "vcodec0" },
>  	.vcodec_pmdomains_num = 2,
> +	.opp_pmdomain = (const char *[]) { "opp-pd", NULL },
>  	.vcodec_num = 1,
>  	.hfi_version = HFI_VERSION_4XX,
>  	.vmem_id = VIDC_RESOURCE_NONE,
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index bd3ac6a..cc1d511 100644
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
> @@ -144,8 +145,12 @@ struct venus_core {
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
> index abf9315..bc5bbd2 100644
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

Is this will work for legacy platforms without OPP tables?

Also what about the other clocks (vicodec0,1) in this function.

>  	if (ret)
>  		return ret;
>  
> @@ -740,13 +740,15 @@ static int venc_power_v4(struct device *dev, int on)
>  
>  static int vcodec_domains_get(struct device *dev)
>  {
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
> @@ -763,6 +765,24 @@ static int vcodec_domains_get(struct device *dev)
>  	if (!core->pd_dl_venus)
>  		return -ENODEV;
>  
> +skip_pmdomains:
> +	if (!res->opp_pmdomain || !core->has_opp_table)
> +		return 0;
> +
> +	/* Attach the power domain for setting performance state */
> +	opp_table = dev_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
> +	if (IS_ERR(opp_table)) {
> +		return PTR_ERR(opp_table);
> +	} else if (opp_virt_dev) {
> +		core->opp_pmdomain = *opp_virt_dev;
> +		core->opp_dl_venus = device_link_add(dev, core->opp_pmdomain,
> +						     DL_FLAG_RPM_ACTIVE |
> +						     DL_FLAG_PM_RUNTIME |
> +						     DL_FLAG_STATELESS);
> +		if (!core->opp_dl_venus)
> +			return -ENODEV;

I think as you return ENODEV you have to detach opp domain here because
vcodec_domains_put() is not called in error path.

> +	}
> +
>  	return 0;
>  }
>  
> @@ -773,7 +793,7 @@ static void vcodec_domains_put(struct device *dev)
>  	unsigned int i;
>  
>  	if (!res->vcodec_pmdomains_num)
> -		return;
> +		goto skip_pmdomains;
>  
>  	if (core->pd_dl_venus)
>  		device_link_del(core->pd_dl_venus);
> @@ -783,6 +803,15 @@ static void vcodec_domains_put(struct device *dev)
>  			continue;
>  		dev_pm_domain_detach(core->pmdomains[i], true);
>  	}
> +
> +skip_pmdomains:
> +	if (!res->opp_pmdomain)
> +		return;
> +
> +	if (core->opp_dl_venus)
> +		device_link_del(core->opp_dl_venus);
> +
> +	dev_pm_domain_detach(core->opp_pmdomain, true);
>  }
>  
>  static int core_get_v4(struct device *dev)
> 

-- 
regards,
Stan
