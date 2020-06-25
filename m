Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C3920A26A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 17:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390006AbgFYPwN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 11:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389567AbgFYPwM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 11:52:12 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32383C08C5DB
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 08:52:12 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id g20so4383850edm.4
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 08:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KXqoAfwqJjFswhwLZp3+6buwkSwmtb+FpqbKTmlJZoY=;
        b=iBMYAQ01jjIK2rgc9mVr+Yly8ObD4pm58VppkGjO71MrklExKxdwSKwWFuP9YkSMax
         vMiKxZI9B0EFAul7JTwn8UhhRGSpfvKL0+dtbk9Pa5T00iX7tBM0ceq9B81xzAEHeecb
         /gFnqMvJAhk4K2nj3CwK4jafNNa61MnrqJqWOhDmlRn4SsNOXBvB0SXoWY9RDcShQ5sf
         c5dIltSFrsuKw2h0e6D3zXXaJCXnuMOjyjMyN3XUk/mv3CfpMlt8GYket32jOOJfj/Cd
         erYnaLeELb5vAMrWYGVD5+F1x+gfPoqYphOQEtLZtVtu8GtkaljRimp7G7gL9CmUYHxH
         Rteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KXqoAfwqJjFswhwLZp3+6buwkSwmtb+FpqbKTmlJZoY=;
        b=J+nnD5ywt5nINvSFAzOIUg/n0gsa2rT7uWWRd2QIebxs7lY86P5PahcJD6ulOYU31d
         nS+uL4oDu7rpyeXJO+ZLfDcpc7jvHyAweNlk3bRg1Qzrncf3u0RigqgKUM72Dus9E6zt
         GskfExohYMRuU0yLb7I3z2EaS/Lv2ckcWQN/sVg89f04ErzWQgwGmJpQJyxcHq9+0kRi
         rdO7whjwpL28dNwHJ9Tlx+v9NCdHLgFOC2xssMX4DI47jt30LC8+MKcozag+TEMxudVR
         PHdXM9v0tKDXs2alHXj9jHuPgIwt9B9dUClZfTx1P98w9E95dhMleyhdQXaAzfPw1Pt6
         bjsg==
X-Gm-Message-State: AOAM5301wyDMa32XHleGEpkFsiZm6UscNyye1q/2jBfUvHfEzLCVH1Nw
        6Vu6VNCMt3Eki9bZqe1lCYpz5g==
X-Google-Smtp-Source: ABdhPJwbt395lRqEkrc239QutfG7/2q46qATHxzzPM6+/whTFZe8sqUtd5p2MOO4Rt2ysNAmZ0Gz7A==
X-Received: by 2002:a50:9a82:: with SMTP id p2mr23429201edb.130.1593100330935;
        Thu, 25 Jun 2020 08:52:10 -0700 (PDT)
Received: from [192.168.1.4] (212-5-158-60.ip.btc-net.bg. [212.5.158.60])
        by smtp.googlemail.com with ESMTPSA id e1sm4809370edn.16.2020.06.25.08.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 08:52:10 -0700 (PDT)
Subject: Re: [PATCH] [v2] media: venus: core: Fix runtime PM imbalance in
 venus_probe
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200624063024.17059-1-dinghao.liu@zju.edu.cn>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <812ead80-766b-1dad-1447-ffab5d7d2ee8@linaro.org>
Date:   Thu, 25 Jun 2020 18:52:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200624063024.17059-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dinghao,

On 6/24/20 9:30 AM, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced. For other error
> paths after this call, things are the same.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
> 
> Changelog:
> 
> v2: - Add pm_runtime_get_noresume() on failure of
>       pm_runtime_put_sync() to balance PM counter instead of
>       releasing everything here.

You are adding pm_runtime_get_noresume in pm_runtime_put_sync error path
but the patch description is referring to pm_runtime_get_sync. I'm confused.

> ---
>  drivers/media/platform/qcom/venus/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 203c6538044f..b0b932bf8c02 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -287,8 +287,10 @@ static int venus_probe(struct platform_device *pdev)
>  		goto err_core_deinit;
>  
>  	ret = pm_runtime_put_sync(dev);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_get_noresume(dev);
>  		goto err_dev_unregister;
> +	}
>  
>  	return 0;
>  
> @@ -299,6 +301,7 @@ static int venus_probe(struct platform_device *pdev)
>  err_venus_shutdown:
>  	venus_shutdown(core);
>  err_runtime_disable:
> +	pm_runtime_put_noidle(dev);
>  	pm_runtime_set_suspended(dev);
>  	pm_runtime_disable(dev);
>  	hfi_destroy(core);
> 

-- 
regards,
Stan
