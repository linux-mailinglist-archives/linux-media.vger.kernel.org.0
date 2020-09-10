Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D9D2651E5
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 23:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgIJVEe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 17:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731175AbgIJOhg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 10:37:36 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E028C061799
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 07:26:25 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 37so5510371oto.4
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 07:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c09JxSr1XUKKzAFJy15maBise8KOeiPU0mV0zBX6I1c=;
        b=fmy9E1Sx9ENoBeL3m/Wo9JWXkizgoX9vknkcHVdJ4/9MGJwbIIxKkEzqP1ceAkQE/L
         8fdAzYONKnHe9rSaYVLU+xFADK0imN+gqrwoPKzPuY/XWOOVdedZKUs0qXbro7pO5qGp
         lP3j/tCRvrpArnPChyTNjZIom1hRF0/hTwX+M7tAGWKBg14JHv4iCHqEGx/HAqf5F3Kg
         ntDcTKYgh9CuPNWqjvb1gmQDygz1rGMB3bV7N82F5E4bQyJNU9nmt0vPVhU0T2mb0p7k
         y2u0pOhFoQZDtvD3z7p6RAGSZWtuQMZTvl6qpYzjBZn+0VgV3r7qT9LkXT6DZJmCHRoa
         0EGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c09JxSr1XUKKzAFJy15maBise8KOeiPU0mV0zBX6I1c=;
        b=JfpwbLym3vGg5UOCQ58C4ZlyChgLqVEh6J1xL6y7WBpJiF2oynOh6SLtFC6fLGJXU+
         kcTSzrDUM3HO119T5cF8jAl/LPHmVBU0f8BYEObae/RegQEJ3FckQ3Hiz99YcFiVmLPt
         CtTPKNi5JlQw/lDlaTmtBFdmEs92/KmeyyI0735Z3HxauTf8BXSHEEXWPNNRu21D9z9B
         KdguaNam6xbdbnZXY5HdsN/eidktImfHGBkYox2VEtWDRG5iGhQ8lmJuZ5w/1V8aYI8X
         a8I55ZAGVmEAVGQYJP7Jc+u70FPVkreaaC7ck5BGNcfRGTgVynh/FJ2DvpldYl4LHijA
         zdbQ==
X-Gm-Message-State: AOAM530YVJJekhIKcRoEW0zvPjhhZX5HkEJyTGW5nhFYvFr710l57YID
        cZcgaPsig/mEOEhg5fpYfiT29g==
X-Google-Smtp-Source: ABdhPJwlL4vUAD4hIIHStlYhw9JaO++kDERp7tgLCh1ZDzzlclXpoEbqXjdmVoT3x6hCqA7Td0Avug==
X-Received: by 2002:a9d:5b7:: with SMTP id 52mr3931033otd.134.1599747984807;
        Thu, 10 Sep 2020 07:26:24 -0700 (PDT)
Received: from tuxbook-pro ([2605:6000:e5cb:c100:f65c:89ff:fe90:ceeb])
        by smtp.gmail.com with ESMTPSA id 106sm861736oth.63.2020.09.10.07.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 07:26:23 -0700 (PDT)
Date:   Thu, 10 Sep 2020 09:26:21 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Elliot Berman <eberman@codeaurora.org>
Subject: Re: [PATCH v3 2/2] venus: firmware: Set virtual address ranges
Message-ID: <20200910142621.GA6485@tuxbook-pro>
References: <20200910075227.950-1-stanimir.varbanov@linaro.org>
 <20200910075227.950-3-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910075227.950-3-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu 10 Sep 02:52 CDT 2020, Stanimir Varbanov wrote:

> In order to boot some of the new Venus firmware versions TZ call to set
> virtual address ranges is needed. Add virtual address ranges for CP and
> CP_NONPIX in resource structure and use them when loading and booting
> the firmware on remote processor.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c     |  4 ++++
>  drivers/media/platform/qcom/venus/core.h     |  4 ++++
>  drivers/media/platform/qcom/venus/firmware.c | 19 ++++++++++++++++++-
>  3 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index c5af42873aed..3549a094e860 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -540,6 +540,10 @@ static const struct venus_resources sdm845_res_v2 = {
>  	.vmem_size = 0,
>  	.vmem_addr = 0,
>  	.dma_mask = 0xe0000000 - 1,
> +	.cp_start = 0,
> +	.cp_size = 0x70800000,
> +	.cp_nonpixel_start = 0x1000000,
> +	.cp_nonpixel_size = 0x24800000,
>  	.fwname = "qcom/venus-5.2/venus.mdt",
>  };
>  
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 1a7aee7ee628..3e3f0138e3c3 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -77,6 +77,10 @@ struct venus_resources {
>  	unsigned int vmem_id;
>  	u32 vmem_size;
>  	u32 vmem_addr;
> +	u32 cp_start;
> +	u32 cp_size;
> +	u32 cp_nonpixel_start;
> +	u32 cp_nonpixel_size;
>  	const char *fwname;
>  };
>  
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 8801a6a7543d..1db64a854b88 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -181,6 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>  int venus_boot(struct venus_core *core)
>  {
>  	struct device *dev = core->dev;
> +	const struct venus_resources *res = core->res;
>  	phys_addr_t mem_phys;
>  	size_t mem_size;
>  	int ret;
> @@ -200,7 +201,23 @@ int venus_boot(struct venus_core *core)
>  	else
>  		ret = venus_boot_no_tz(core, mem_phys, mem_size);
>  
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	if (core->use_tz && res->cp_size) {
> +		ret = qcom_scm_mem_protect_video_var(res->cp_start,
> +						     res->cp_size,
> +						     res->cp_nonpixel_start,
> +						     res->cp_nonpixel_size);
> +		if (ret) {
> +			qcom_scm_pas_shutdown(VENUS_PAS_ID);
> +			dev_err(dev, "set virtual address ranges fail (%d)\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
>  }
>  
>  int venus_shutdown(struct venus_core *core)
> -- 
> 2.17.1
> 
