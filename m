Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 770732463A1
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 11:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgHQJnj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 05:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgHQJnh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 05:43:37 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B94C061342
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 02:43:36 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c15so14252968wrs.11
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 02:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qPlhVA01MUGvYBvTptO3+HXUAf2pza0AyA7yKccmN8M=;
        b=nslJ1+xoD0yWudkHNjqrd/pHfIZV1qUk9jRWIG95ey32Rmmnr/dg6qtTTnUknd+UGf
         iVDH83hLu4R3LIo2dV6/7hWGOmRzyX6jGES6ysEd91TVupDrDkCUUHGybo4zF0Q7lgk2
         TAou0KBPZ9URL6vGmmYgIBOXgvXahr5yR/I30kocPO2szduyKzQY+Fiq/JWgR3kuTq4/
         hVxZaSdlVhRpKpB79mUVDMLU232XeXks/HyYBKB0CrQWrL7z6OVYDXbaf4XDkw/SUK5R
         0DwOWhFDlJLsJiKNV/+H3rqk7mXKxRan2OcOvZK5grcdYRjfw1lJ+fUL3G7/s3ypgVU+
         6gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qPlhVA01MUGvYBvTptO3+HXUAf2pza0AyA7yKccmN8M=;
        b=OoqiiUT8JFe20Hdmkh0LCr5kLgb8VyUt6rGwgmeeMnHKaH8JCnKRSZE8mq1MWfmPB/
         xXBkjLkome8iI62eEJtbMKOevQfEIINQbGnqOcreG4hoqaI+sBKXxu49Ytyr2QLwYF/u
         mZVDBWUk957ziCjNVI48z2lTV+kCZMxYg9fGEJp0fdz7OWmRXvTtabZeHv4Ynd2ncotm
         1dTZseog2MeaVJXrNUPMglYspzgCPKAV/1hsc1KEANPYUdG0Byd2CBrH0MtoYqCXDHOX
         4sfYvHYqR4AT3L4sGIDSSuz2cTPgaVNnZ6upvcx57yDPF+WJVfVudNeSP6EW30hvVO6y
         OwEA==
X-Gm-Message-State: AOAM532w+zFlyngjNX49aVZdLrtHrdPboJU8du9PNvKR6ZE8aaXRqZ3s
        QJbYcBHa43/ZGK8q1jIFByu15A==
X-Google-Smtp-Source: ABdhPJzLQ3hYfhFcIyaTTVp965Xi1bI8BaT5rrHoC/S3nivR3ZHXbMOurHwGPuRyfJKx2YyKXGtUBg==
X-Received: by 2002:adf:ed48:: with SMTP id u8mr15230345wro.64.1597657415105;
        Mon, 17 Aug 2020 02:43:35 -0700 (PDT)
Received: from [192.168.1.10] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id v7sm12043475wmj.28.2020.08.17.02.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 02:43:34 -0700 (PDT)
Subject: Re: [PATCH V3] venus: core: add shutdown callback for venus
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, saiprakash.ranjan@codeaurora.org
References: <1596694917-7761-1-git-send-email-mansur@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <31d2e971-dda2-0aa0-661e-cca9e0aace13@linaro.org>
Date:   Mon, 17 Aug 2020 12:43:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596694917-7761-1-git-send-email-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mansur,

On 8/6/20 9:21 AM, Mansur Alisha Shaik wrote:
> After the SMMU translation is disabled in the
> arm-smmu shutdown callback during reboot, if
> any subsystem are still alive then IOVAs they
> are using will become PAs on bus, which may
> lead to crash.
> 
> Below are the consumers of smmu from venus
> arm-smmu: consumer: aa00000.video-codec supplier=15000000.iommu
> arm-smmu: consumer: video-firmware.0 supplier=15000000.iommu
> 
> So implemented shutdown callback, which detach iommu maps.
> 
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
> Changes in V3:
> - Fix build errors
> 
>  drivers/media/platform/qcom/venus/core.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

As there is no more comments and it looks good to me:

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 203c653..cfe211a 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -341,6 +341,16 @@ static int venus_remove(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static void venus_core_shutdown(struct platform_device *pdev)
> +{
> +	struct venus_core *core = platform_get_drvdata(pdev);
> +	int ret;
> +
> +	ret = venus_remove(pdev);
> +	if (ret)
> +		dev_warn(core->dev, "shutdown failed %d\n", ret);
> +}
> +
>  static __maybe_unused int venus_runtime_suspend(struct device *dev)
>  {
>  	struct venus_core *core = dev_get_drvdata(dev);
> @@ -592,6 +602,7 @@ static struct platform_driver qcom_venus_driver = {
>  		.of_match_table = venus_dt_match,
>  		.pm = &venus_pm_ops,
>  	},
> +	.shutdown = venus_core_shutdown,
>  };
>  module_platform_driver(qcom_venus_driver);
>  
> 

-- 
regards,
Stan
