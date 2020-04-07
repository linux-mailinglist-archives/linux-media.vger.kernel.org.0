Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69D711A092A
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 10:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgDGIPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 04:15:36 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39684 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgDGIPe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 04:15:34 -0400
Received: by mail-ed1-f66.google.com with SMTP id a43so2924196edf.6
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 01:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gYSBPF0kqvjFsMt96b7gq4l3LXMLVPqJ/kTyN1DMzC4=;
        b=Q14xEyVQtMB9EutZZR+8RRGK9Zf6kbBWZ940ZDnrulLNn06x2V6BdqqTY2KwOAjyB+
         1DdDvh7XDSL4+3ENES1jPazifAXGACgRDQvf0o+WckllB05VtC07VQtxp5jqxhZ6d/eR
         WeKjYa+zIP4PHVwh7H5LDDCwXUji2Fwa4ck0haiajLbrZDkCi5jtKF1hG3ufUc5eTZ8H
         6m7ABzlJ52jurXp5oBrWaT1HUSbM050utDGxa3mSEyoxo+k5GV8pbgtpJWAeCZiOi9GZ
         yX8FHXHvMF9IZcCQCa+KgmcKzoSF61oPZXSv736Xf+ztL8g9HFRTcyVQfFmOUNuMmZA5
         4AkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gYSBPF0kqvjFsMt96b7gq4l3LXMLVPqJ/kTyN1DMzC4=;
        b=htFoWMbKh651JBlFR9qrsrL37vZmPdspOvL72ylUr5rVRBVM8xvBXCM94WeY9tyhI8
         i2JJYCXMVkrsDHbREMCh7Q/fLCwVnaz0ETTQHp/D3T5JwrftKNy8m99NPjZKtyzud9Me
         nELCAno0nswqKyhiJj92XPAON8Ugsia9qEKcd4zn1aHECQgGdjULScIwMLhAMhSXD56W
         hlMzKPzSl903N15FtJabIlKF74J5ERDkCY9jOej01LvygSOGRxLuS40DH7BEYgIMllVI
         FDalzVDLvEtsETzMlEQpRUj1Acg6LYvx0LBh79oUrIRe9X9GDLYTh9YiY20JZL5Q1Ojy
         tGkA==
X-Gm-Message-State: AGi0PuZ896EaPvdsxSKEtV44UKOVm+Ep/14c/LOtSGLIf99V+obVc4U+
        p4RCdsz/1oXbuAzyXU5Mdxxt1g==
X-Google-Smtp-Source: APiQypJsinurJQlKKhBli7w6pCn0J6twQ6wYYsj5qr8ytdr2SAZP7IWJnQE1AJwhokOlwmwPMtM1cg==
X-Received: by 2002:a17:907:b1a:: with SMTP id h26mr879545ejl.321.1586247331125;
        Tue, 07 Apr 2020 01:15:31 -0700 (PDT)
Received: from [192.168.1.4] (212-5-158-179.ip.btc-net.bg. [212.5.158.179])
        by smtp.googlemail.com with ESMTPSA id a24sm3175976ejy.38.2020.04.07.01.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 01:15:30 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH] [PATCH] venus: core: remove CNOC voting while device
 suspend
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1581940891-2376-1-git-send-email-mansur@codeaurora.org>
Message-ID: <e5b94b17-5864-e02d-435d-beceeceed375@linaro.org>
Date:   Tue, 7 Apr 2020 11:15:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581940891-2376-1-git-send-email-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mansur,

The patch looks fine and correct but the description should be better.

On 2/17/20 2:01 PM, Mansur Alisha Shaik wrote:
> video driver is voting for CNOC during probe and not clear
> while device suspend. Because of which XO shutdown is
> happing(BCM42: VALID: 0x1 VOTE_X: 0x0000 VOTE_Y: 0x0004).
> 
> So, clearing CNOC voting while device suspend.

Maybe something like this ?

The Venus driver is voting Configuration NoC during .probe but not clear
voting in .suspend. As a consequence the whole device could leak energy
while in suspend. Correct this by moving voting in .resume and unvoting
in .suspend.

> 
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index e7995cb..153effe 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -244,10 +244,6 @@ static int venus_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
> -	if (ret)
> -		return ret;
> -
>  	ret = hfi_create(core, &venus_core_ops);
>  	if (ret)
>  		return ret;
> @@ -353,6 +349,10 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	ret = icc_set_bw(core->cpucfg_path, 0, 0);
> +	if (ret)
> +		return ret;
> +
>  	if (pm_ops->core_power)
>  		ret = pm_ops->core_power(dev, POWER_OFF);
>  
> @@ -371,6 +371,10 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
>  			return ret;
>  	}
>  
> +	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
> +	if (ret)
> +		return ret;
> +
>  	return hfi_core_resume(core, false);
>  }
>  
> 

-- 
regards,
Stan

-- 
regards,
Stan
