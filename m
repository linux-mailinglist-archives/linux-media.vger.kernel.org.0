Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D111E204E5C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 11:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731976AbgFWJrP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 05:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731921AbgFWJrP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 05:47:15 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1254AC061573
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 02:47:15 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id dr13so20949958ejc.3
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zrmS3gtTtQi2K4pHTUv0F6q9doiPp0Co7v5Yn1sfwnU=;
        b=Of+mxFWt4GzUnIW+a9/K2elfBjiOpM+Fj6/L3R+8cuHbLnWeh+6bgR676UMbUV1ols
         XVbeZTzFaO+42UXh5NTacD2pXb4moofm09bJp/fwRx2Uy1uOnx9dL/60ZU1qH4y1IiQe
         b50//s8mc0XhoJwKsO6WtUaGpSJq1mADHrg9pUZtKDhUPixD2Ou/d7LmfxNMcX7teHF3
         XAktmS/zFNq6FGCIHJ7HCFBu2TPRR6a4DDVpH51XxJJJTNnKiOmCSrvmLLAubnSpc96f
         eeimgnxBbvFdb39LTrujygMt0fpT7mYoeUd/+HQie9LOOiGqa3KVuhw/pMPrWVeZOv2P
         ljuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zrmS3gtTtQi2K4pHTUv0F6q9doiPp0Co7v5Yn1sfwnU=;
        b=EfNVFIpNgEW4jo0NJs1eBphlAH5Sow4++o0vHpehU+qQa0Vds9K8Z9M7cWMexW3zm6
         dPPK5rWkB9DA+zT6BAzwCq/w5hDw38R6wafi+6T8kC8/CKk2LlzfuemVgtR3AODALJQH
         IO3HpwlL/Gi2gPnTQxXSt2Ih8aN0PqpIMX7wjIW+8lBKikoL4chS3ZLr0/A2hJfamBuK
         0UAvTGGt3dhzh/ICIIGB8yfKAnKeCFy33kHEQf6aFCt/rgVIB6F5wtiqOibQ9MOynAIC
         LAhuqDw/sc/O7QI15Oqgm+oCTZ3tVbu9gXxs1/Q9WYSVN71I3za5yJNXjTGdLjZVCiVl
         FApQ==
X-Gm-Message-State: AOAM531sO5opF5CznYV+AlAnpeO/GWVwswG0xToJfZRaKmrkJGdgNL7v
        aEhfOxxcZX8E+lXqIuFBzqCYBA==
X-Google-Smtp-Source: ABdhPJyVv2e/pbkuvnYAXqgFazRNKuDtyZiYAnHSEMVx0ukqHYTA41EbzOlMIi3sxLzqqJLXjba/lQ==
X-Received: by 2002:a17:906:168b:: with SMTP id s11mr3840952ejd.444.1592905633803;
        Tue, 23 Jun 2020 02:47:13 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-249.ip.btc-net.bg. [212.5.158.249])
        by smtp.googlemail.com with ESMTPSA id z22sm3210381edx.72.2020.06.23.02.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 02:47:13 -0700 (PDT)
Subject: Re: [PATCH] media: venus: venc: Fix runtime PM imbalance in venc_open
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200524043132.32758-1-dinghao.liu@zju.edu.cn>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c7f623b3-792b-d53f-a2ab-3736b79cb9b3@linaro.org>
Date:   Tue, 23 Jun 2020 12:47:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200524043132.32758-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dinghao,

Thanks for the patch!

On 5/24/20 7:31 AM, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 9981a2a27c90..eefcfbb8f211 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1169,7 +1169,7 @@ static int venc_open(struct file *file)
>  
>  	ret = pm_runtime_get_sync(core->dev_enc);
>  	if (ret < 0)
> -		goto err_free_inst;
> +		goto err_put_sync;
>  
>  	ret = venc_ctrl_init(inst);
>  	if (ret)
> @@ -1214,7 +1214,6 @@ static int venc_open(struct file *file)
>  	venc_ctrl_deinit(inst);
>  err_put_sync:
>  	pm_runtime_put_sync(core->dev_enc);
> -err_free_inst:
>  	kfree(inst);
>  	return ret;
>  }
> 

-- 
regards,
Stan
