Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941431BD146
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 02:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgD2AjK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 20:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726522AbgD2AjK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 20:39:10 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F23C03C1AD
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 17:39:10 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id r14so242522pfg.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 17:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W7gWUUXU/Yr8aGKVFYA0eYnvhip9VKNyy91uupW34i0=;
        b=I02X3CZM/NUHTH3RQSutmuienX62rm5LBybo8+305etL9oecXnfyo7V6fNMAb2ZqsY
         GEnD1SVRAVPUrbKTGngrY5QzpG2TxAkPdT23TeWZ9XR+u9tUhgwZVxZ5uA8bl3iMxHRS
         7mxQERX7ZXWTguvM+vNzEh3xLlDgjIKuwbZ8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W7gWUUXU/Yr8aGKVFYA0eYnvhip9VKNyy91uupW34i0=;
        b=oevIsgqqHCf7tx4uajkJApAKqquH9t1xjl0f/SoBBUn9Ak8DxN12QuoFo/btRT5pn0
         3120xVLY/jjwSHSew15rQFJdBcX9NaD3LF8jMuJejZ9/gRUAZWHs5nHFDSlxydraOXLt
         om1uk08upIMwgu0iLXpzsoibiHDguLdNqJTQ7j7GaW9AyHHocM9Yo/DHV7nYPutsMqEZ
         9IV5tR7UaCQQ6FzfC/67wapKPDCRL5awtE4Ks/X6T2YlzPTygdmwWJ+9vJDFGw2ddggq
         2gXkyQJEPLuASL2w30Qo9RTpmFoWvIPHjdDxVomluxX+iSGrFDGPon6m+JhWnINxWq9H
         ZePw==
X-Gm-Message-State: AGi0Pua0cHc3EpCma4pUwpoeEGdm8EFA8uGLHn+P6LLo7zh1CSftMLJI
        ft1SxVf9oTdxx96Iq9HZiRf4pw==
X-Google-Smtp-Source: APiQypLbPYTzp9qbzyos35G6tVPdoCiVx7N0aCXfQqih6ccSR97hGwNwigOKEqtptnE5JuFmlqObAA==
X-Received: by 2002:a63:5717:: with SMTP id l23mr19849633pgb.217.1588120749609;
        Tue, 28 Apr 2020 17:39:09 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id u15sm3044185pjm.47.2020.04.28.17.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 17:39:08 -0700 (PDT)
Date:   Tue, 28 Apr 2020 17:39:07 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 12/17] media: venus: core: Add support for opp
 tables/perf voting
Message-ID: <20200429003907.GN4525@google.com>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-13-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588080785-6812-13-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 28, 2020 at 07:03:00PM +0530, Rajendra Nayak wrote:
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
> +	if (IS_ERR(core->opp_table))
> +		return PTR_ERR(core->opp_table);
> +
> +	if (core->res->opp_pmdomain) {
> +		ret = dev_pm_opp_of_add_table(dev);
> +		if (!ret) {
> +			core->has_opp_table = true;
> +		} else if (ret != -ENODEV) {
> +			dev_err(dev, "Invalid OPP table in Device tree\n");
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

the check for 'core->res->opp_pmdomain' is not needed, 'core->has_opp_table'
can only be true when 'core->res->opp_pmdomain' is not NULL.

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

ditto
