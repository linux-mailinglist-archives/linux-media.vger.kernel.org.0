Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A428251951
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 15:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgHYNOc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 09:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgHYNOQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 09:14:16 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC36C061574
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 06:14:11 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id q14so1552406wrn.9
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 06:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J2KLLHnWpzEaROqybattjmp752iKViN/pWCMk2HsG6o=;
        b=diMnaWxxxQ1b4KnV9p1ds1iP6jlA49k4zMKFqrt6UUzC+pTeMietsYGYeO3+g7LZ+X
         BjJZpq4TbL4/eKtsNRKXxYh4jeU+J0pBOvmABldjaz6hKNnt/aM7IK8mry8dPgMNs2cD
         zFQJ5CT2PEG2x6HjqG62X0fxufHGzshuxeLvstVfRBXgxy1ilrL4SjYkUm//lIXW4DQL
         E7yCrY8csXQ6JXESWRsNd+buhKNT1nwQySZWsekFupQO6dLQXBLtiwWdQVUJYJWmS15b
         SGF3vfAfXu50Qw09uKCvLLdE3siHMMGeujTbU5vqgQhmXu3O/utbrLn5FZxaDdGCTilU
         1yRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J2KLLHnWpzEaROqybattjmp752iKViN/pWCMk2HsG6o=;
        b=OKPJOozEd6/n76rPqtOrnnIA97fI34nTbYKCmEPc3QDfXK1EBhSe1AET4JW/1k8Qm4
         PUGYA2KBix6tKVL4gfKpwG/x8U7VXx9XETFARdSnYataXlWg/PQwAHFHeGV9zTbmd47P
         +oFyeAoQVt8kiJdiK52lY8fz9ir2n+0WvyMT/kN+rITjcYoInBY2KlKMDuPq3nInnw0w
         fZZLAtzB+VIJf97j2y7EVrGU9IiBoJkhbJ7+Hy3h9dxHYpzTy+ONVzRLxmOy/wJ2nqxm
         kCiEMbL7GNFZ2BTHum4QEbTgmKdgPR0flPierGYlxB1n3YYqKW29Y13Od1x5h64JbG4V
         Dq0w==
X-Gm-Message-State: AOAM532EnvijlgSqRFv8FrDh2wmDaupsZ+3OdJGkbyc9JjJpsIqgjH+Q
        BwivfRa2XYZax2VFm0q/tdQiGg==
X-Google-Smtp-Source: ABdhPJxCPhGC8o2j7hWAzsss3oYxt71NlITRxQ7VCIMr0NGOVx0aZ/OkPd6JMEkFzAXFV9uaYIojaA==
X-Received: by 2002:adf:c108:: with SMTP id r8mr10930488wre.350.1598361241278;
        Tue, 25 Aug 2020 06:14:01 -0700 (PDT)
Received: from [192.168.1.4] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id u17sm18413285wrp.81.2020.08.25.06.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 06:14:00 -0700 (PDT)
Subject: Re: [RESEND 3/3] venus: handle use after free for
 iommu_map/iommu_unmap
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1596781478-12216-1-git-send-email-mansur@codeaurora.org>
 <1596781478-12216-4-git-send-email-mansur@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <05935d9c-b8f2-42b3-181c-023f716d4949@linaro.org>
Date:   Tue, 25 Aug 2020 16:13:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596781478-12216-4-git-send-email-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/7/20 9:24 AM, Mansur Alisha Shaik wrote:
> In concurrency usecase and reboot scenario we are trying
> to map fw.iommu_domain which is already unmapped during
> shutdown. This is causing NULL pointer dereference crash.
> 
> This case is handled by adding necessary checks.
> 
> Call trace:
>  __iommu_map+0x4c/0x348
>  iommu_map+0x5c/0x70
>  venus_boot+0x184/0x230 [venus_core]
>  venus_sys_error_handler+0xa0/0x14c [venus_core]
>  process_one_work+0x210/0x3d0
>  worker_thread+0x248/0x3f4
>  kthread+0x11c/0x12c
>  ret_from_fork+0x10/0x18
> 
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/firmware.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 8801a6a..c427e88 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -171,9 +171,14 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>  
>  	iommu = core->fw.iommu_domain;
>  
> -	unmapped = iommu_unmap(iommu, VENUS_FW_START_ADDR, mapped);
> -	if (unmapped != mapped)
> -		dev_err(dev, "failed to unmap firmware\n");
> +	if (core->fw.mapped_mem_size && iommu) {
> +		unmapped = iommu_unmap(iommu, VENUS_FW_START_ADDR, mapped);
> +
> +		if (unmapped != mapped)
> +			dev_err(dev, "failed to unmap firmware\n");
> +		else
> +			core->fw.mapped_mem_size = 0;
> +	}
>  
>  	return 0;
>  }
> @@ -288,7 +293,11 @@ void venus_firmware_deinit(struct venus_core *core)
>  	iommu = core->fw.iommu_domain;
>  
>  	iommu_detach_device(iommu, core->fw.dev);
> -	iommu_domain_free(iommu);
> +
> +	if (core->fw.iommu_domain) {

why not just ?

	if (iommu)

> +		iommu_domain_free(iommu);
> +		core->fw.iommu_domain = NULL;
> +	}
>  
>  	platform_device_unregister(to_platform_device(core->fw.dev));
>  }
> 

-- 
regards,
Stan
