Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B04C26448F
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 12:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728970AbgIJKsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 06:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730356AbgIJKqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 06:46:06 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0146CC06179E
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 03:45:12 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id ay8so5793052edb.8
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 03:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l79SfYkBrB8eBkLTxTm30QFDMV6D/aEjgGf7kz6GKH8=;
        b=DJxGtKQq3fNqzbw0NV15QU2g+lXd31Rj8IJvgRkmxSITdEZjWipc09xOc3NSbzlnqS
         LSWzMMePsttylmJYWDnCSaRWKb1BYhCdX7DUHwmW8C64BFBOOtybEiKeNpWtlPUualiy
         9nhq5tFslI0ABxnJmKxf47Qt/oRWwgsEcvLfJkoiQ/mcBOPLdXTxj77V1xZKt/Jv6KNx
         WA1MGxYBceEanw4cq8b4bqV/K34C0NkTNfaxjw7nHmvTtZDCulOx+OE8uiQukw5GHNe2
         9H8f2YIbQFfcfqQbpj3AiCW8R+QLENQTIBzSErnivxE0WcjL9tyGzxCgH0aREro/gI6W
         37yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l79SfYkBrB8eBkLTxTm30QFDMV6D/aEjgGf7kz6GKH8=;
        b=JwWg/l4e54py++8FjB6/HUSZJaqBoO6I4Rmmh0XdJ02FtYEVr13+lx81W2ANkajb2g
         sMxwasAwgDt3SAjj4LFy7yQcdIrCXoSZRrJO9lpyqCRJrvCM5bppTbQeF5tgyaJvbzul
         wGHEJXTFoz6/sK2Nli1SrYX5BJk/CJb58r795U5JsSnRD2QLUEuBw6diex8fc3mA6Ecz
         5a80zKnHDU3cWIZa5685swyhLRQxLb+ZBONZZxGD1/Rc6uv4BXJmGZLK/ZcsA0TC6gO+
         N6g1IE89IBlm8SCU1MiT4d0OwrB/AzhX6JfD+HyN+NBQ9Brh0bQwUVhh3loGCpw8QM2U
         oRMw==
X-Gm-Message-State: AOAM530kX1O2ahJ5W+KXI6qaGAeopI51yh8bjQVIt43pS/ZARenUTPmf
        1itrTt5OuUpMCM9wu+sGq8PJiRinGOO8l0vn
X-Google-Smtp-Source: ABdhPJxLPpOYGdfGam7C5qx7e4pq7eM8ctQGw5CrrVjQtFNkfIXN7oOEb+gcnV3V6HeJNWuS3cornA==
X-Received: by 2002:aa7:dc05:: with SMTP id b5mr8908207edu.137.1599734710690;
        Thu, 10 Sep 2020 03:45:10 -0700 (PDT)
Received: from [192.168.1.8] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id f13sm6324424ejb.81.2020.09.10.03.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 03:45:10 -0700 (PDT)
Subject: Re: [PATCH 06/38] media: venus: place extern venus_fw_debug on a
 header file
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
 <64a99ecb3e7cfae697a16c6b6ca05034f73ad985.1599062230.git.mchehab+huawei@kernel.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <8886c59a-02e3-1762-23ad-fdc6960309c8@linaro.org>
Date:   Thu, 10 Sep 2020 13:45:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <64a99ecb3e7cfae697a16c6b6ca05034f73ad985.1599062230.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for the fix!

On 9/2/20 7:10 PM, Mauro Carvalho Chehab wrote:
> Sparse warns about this symbol:
> 
> 	drivers/media/platform/qcom/venus/hfi_venus.c:133:5:  warning: symbol 'venus_fw_debug' was not declared. Should it be static?
> 
> Because hfi_venus.c doesn't include a header file with the
> extern. So, move it to core.h, with is included by both
> hfi_venus.c and dbgfs.c.
> 
> This way, if something changes with it, warnings or errors
> will be produced.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/core.h  | 2 ++
>  drivers/media/platform/qcom/venus/dbgfs.c | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 8e75a199f9f7..1a7aee7ee628 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -24,6 +24,8 @@
>  #define VIDC_VCODEC_CLKS_NUM_MAX	2
>  #define VIDC_PMDOMAINS_NUM_MAX		3
>  
> +extern int venus_fw_debug;
> +
>  struct freq_tbl {
>  	unsigned int load;
>  	unsigned long freq;
> diff --git a/drivers/media/platform/qcom/venus/dbgfs.c b/drivers/media/platform/qcom/venus/dbgfs.c
> index 782d54ac1b8f..52de47f2ca88 100644
> --- a/drivers/media/platform/qcom/venus/dbgfs.c
> +++ b/drivers/media/platform/qcom/venus/dbgfs.c
> @@ -7,8 +7,6 @@
>  
>  #include "core.h"
>  
> -extern int venus_fw_debug;
> -
>  void venus_dbgfs_init(struct venus_core *core)
>  {
>  	core->root = debugfs_create_dir("venus", NULL);
> 

-- 
regards,
Stan
