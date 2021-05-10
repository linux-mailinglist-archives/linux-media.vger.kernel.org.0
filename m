Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2AC8379079
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 16:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbhEJOUP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 10:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbhEJOR4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 10:17:56 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A2DC06137A
        for <linux-media@vger.kernel.org>; Mon, 10 May 2021 06:54:48 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id l4so24637469ejc.10
        for <linux-media@vger.kernel.org>; Mon, 10 May 2021 06:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N/tsR4FPpi1SMa4JphRzoqbRD642hzPRhRehPxfLE8I=;
        b=FPrJVgd7V/a2zz2Q0otP08sQFNf/w1p+kVWgnWsOnyKsYCck2v8rIeWPnFO2FuYhuI
         bE2RHp92aBVZ6n4NZ4rz7Kg1aiRJQf2/EXF+OlgXmVhxhlDFQeVASC/NuoaNhQqd4y6K
         eEZ8IpC6c0yXpubstKGcroxL6vZ6Vvg8920GalWCq/BAbUgMSK848W/e0xXI2u/FF2Wc
         vANQekUzQlLLjYdwyGc9ID0Y9UiqrbpgiS4rGltEP4GlJtAZjO6YoErvirmwVdb5eScx
         M4rjJzY1C/75EVAd9XX9gBT+1w5poDKuWYut+ufz8O3zndjtkL57z4F9xiAxX410Kq4V
         bYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N/tsR4FPpi1SMa4JphRzoqbRD642hzPRhRehPxfLE8I=;
        b=c4dwhYqxparwdT6qr0VkuJjsMhwI8qt++ipgimSC8yhHZx6epk221+I4sLCtjE/eco
         BJqZGlCQ44RIVRPuiml8+pFYVzHp2plqZ3/kyqH3veP9IvE2PieLenjyXNMg4cK512Kl
         Fic8XZ0d/Ho5oHOJMkJccL2xHRPhg5/W83PuorX1jMnpuzOw643+m8CuZfm64RstbT1o
         VtTXUEYb5hdrkHv6BVmhovi8ndVE6mKryIoLq0WFW4PgL9/+rsZoY5BBCjPskQe7RiWr
         KZrD/hQuAOrde74RnoZkMlOcDwK/Xy98pjl6zZRlzreQcMB8ea7blVu3YA/WeLPj7OdX
         2GnA==
X-Gm-Message-State: AOAM531mk6I1tjZOrtqTk8r/BpQBztUwJpVWGE/eUcp174JqCaj9P020
        Tta3PGwZ0qLJ2UUJs8GwIsvxmL1fPdrgwA==
X-Google-Smtp-Source: ABdhPJx4OsN4bcqkQbOKWXhTyPn2+tTamYNiif8kVzvyu0hItzjNmFGr6lyBRCAfCvz2Y20of3O3mQ==
X-Received: by 2002:a17:906:4809:: with SMTP id w9mr22916796ejq.401.1620654887266;
        Mon, 10 May 2021 06:54:47 -0700 (PDT)
Received: from [192.168.1.14] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id v14sm11444780edx.5.2021.05.10.06.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 06:54:46 -0700 (PDT)
Subject: Re: [PATCH v5 13/25] media: venus: core: use
 pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
 <492e148ae1c7b0a8858c1670037925d3e4adb719.1620314616.git.mchehab+huawei@kernel.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <adb102ab-c197-fdc8-4858-5683bd97baf4@linaro.org>
Date:   Mon, 10 May 2021 16:54:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <492e148ae1c7b0a8858c1670037925d3e4adb719.1620314616.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/6/21 6:25 PM, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Tested-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index c7e1ebec47ee..d0fddf5e9a69 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -990,9 +990,8 @@ static int core_power_v4(struct venus_core *core, int on)
>  
>  	if (on == POWER_ON) {
>  		if (pmctrl) {
> -			ret = pm_runtime_get_sync(pmctrl);
> +			ret = pm_runtime_resume_and_get(pmctrl);
>  			if (ret < 0) {
> -				pm_runtime_put_noidle(pmctrl);
>  				return ret;
>  			}
>  		}
> 

-- 
regards,
Stan
