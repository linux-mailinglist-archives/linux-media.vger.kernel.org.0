Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5F7A1C644B
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 01:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729447AbgEEXHG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 19:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727089AbgEEXHG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 19:07:06 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC94C061A0F
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 16:07:04 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t40so15084pjb.3
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 16:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lnMvLXoN54fiT5bQ9B36ujD00twLWQQOJMf5mTznE2I=;
        b=XcvJJmrhLeml8LvNg+e0aEqu2fgQOHjibmSlo0uENuXWka6vbu5QxddzF0qXyBySj4
         ERWA+nfNguqgX+PjiYndGtiQ16Ig4mcMbCyL6K0dOLQdYtrnJsaL9+F94IMFpMXApxM+
         hPms0zmx3o6GMAtdvu/GNVXSSGieqcwAqOo3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lnMvLXoN54fiT5bQ9B36ujD00twLWQQOJMf5mTznE2I=;
        b=lbW7X4RqS+ba6FFG8rxBfTzTEkily7cX93/r6sk8yg0EaMh+T+QR9qZLja3BUDr4uX
         Wc0TyBnJ7NQ4OUuY+GGU2asaiBdVVddi71D8VFnwL0VOzCs5BSmCptDCeb/+Sb+y0L/f
         B1YkuXGtvQsxNuLCrDKCrxdODt04ZssFGpUhnu65cQvlVGK408Kcs6C2izdfzpMrkVx6
         H8JXg0iLMA3+6SO9aq34SJvK8A8Zu48FBBTO0bJddWlNrRMC0nh6W5uaRzizlum4/hhj
         d8O/zdGLh9wHed3DmrSs4Okxu1v7wDDnRIZ5mecIWo45lKTa1S0lgh9P83lSPk0EiIor
         wF5g==
X-Gm-Message-State: AGi0PubGdwJo6Df5QNPnNzZHQzmno9HsEJpk4/KM+4tm8uCvD7wW8ISB
        Ro9cZyms52JVok/MIu/JKtzhvw==
X-Google-Smtp-Source: APiQypKWFU3p57Hd9uUtW+gyz/ATiQN945XSVyla1OHMs2n/q7J6O7vqOVLV3UG5FLVjmrA/tShUKw==
X-Received: by 2002:a17:90a:7105:: with SMTP id h5mr5488824pjk.3.1588720024172;
        Tue, 05 May 2020 16:07:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id g43sm2932584pje.22.2020.05.05.16.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 16:07:03 -0700 (PDT)
Date:   Tue, 5 May 2020 16:07:02 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 5/6] media: venus: core: Add support for opp
 tables/perf voting
Message-ID: <20200505230702.GX4525@google.com>
References: <1588507469-31889-1-git-send-email-rnayak@codeaurora.org>
 <1588507469-31889-6-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588507469-31889-6-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rajendra,

On Sun, May 03, 2020 at 05:34:28PM +0530, Rajendra Nayak wrote:
> Add support to add OPP tables and perf voting on the OPP powerdomain.
> This is needed so venus votes on the corresponding performance state
> for the OPP powerdomain along with setting the core clock rate.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Cc: linux-media@vger.kernel.org
> ---
>  drivers/media/platform/qcom/venus/core.c       | 28 +++++++++++++
>  drivers/media/platform/qcom/venus/core.h       |  5 +++
>  drivers/media/platform/qcom/venus/pm_helpers.c | 54 ++++++++++++++++++++++++--
>  3 files changed, 83 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 194b10b9..6f72e99 100644
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
> +	if (IS_ERR(core->opp_table))
> +		return PTR_ERR(core->opp_table);
> +
> +	if (core->res->opp_pmdomain) {
> +		ret = dev_pm_opp_of_add_table(dev);
> +		if (!ret) {
> +			core->has_opp_table = true;
> +		} else if (ret != -ENODEV) {
> +			dev_err(dev, "invalid OPP table in device tree\n");

			dev_pm_opp_put_clkname(core->opp_table);

this and removing the OPP table is also needed in other error paths below,
which currently return directly. Looks like you want to add another label
to the unwind path.

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
> +	if (core->has_opp_table)
> +		dev_pm_opp_of_remove_table(dev);
> +	dev_pm_opp_put_clkname(core->opp_table);

move this after hfi_destroy(core), to do unwinding in reverse order, it
also allows to add the new jump label mentioned above.

>  	pm_runtime_set_suspended(dev);
>  	pm_runtime_disable(dev);
>  	hfi_destroy(core);
> @@ -326,6 +344,10 @@ static int venus_remove(struct platform_device *pdev)
>  
>  	venus_firmware_deinit(core);
>  
> +	if (core->has_opp_table)
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

The new power domain needs to be added to the SDM845 and SC7180 bindings.

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
> index abf9315..30600bc 100644
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
> +	if (!res->opp_pmdomain || !core->has_opp_table)

nit: '!res->opp_pmdomain' isn't strictly needed, 'has_opp_table' is always
false when there is no OPP domain. It's ok if you prefer to keep it.

> +		return 0;
> +
> +	/* Attach the power domain for setting performance state */
> +	opp_table = dev_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
> +	if (IS_ERR(opp_table)) {
> +		ret = PTR_ERR(opp_table);
> +		goto opp_attach_err;
> +	} else if (opp_virt_dev) {

If I read dev_pm_opp_attach_genpd() correctly 'opp_virt_dev' is always
set unless the function returns an error. If that's correct the condition
can be removed. Otherwise you probably want to initialize 'opp_virt_dev' to
NULL, to not rely on dev_pm_opp_attach_genpd() to do it.
