Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 480FA17888
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2019 13:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727684AbfEHLox (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 May 2019 07:44:53 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38162 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727545AbfEHLox (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 May 2019 07:44:53 -0400
Received: by mail-lf1-f66.google.com with SMTP id y19so6730771lfy.5
        for <linux-media@vger.kernel.org>; Wed, 08 May 2019 04:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MVZ8E32dM3IQUQ/4sulzcLWknTbAvmYBrKs0Eer6wKA=;
        b=aI8x9BVUyV0k/e6hHqtFg2VSGsAE8uqW1Ykt9Vt9Gnl3ZLDZJI+xVptz8VOJ0U+Epz
         reiiUaD5e1XXfszgv5IduYrWVDkVT6at8d1kvFGnbetBJijOdC2vEyTzs6U8wT/ezspt
         UDpUgm9iX0D8ixIaEDy8M7y97kMeSpbRcqY62ZwLgI5YxdPUFncrYswcdj413zXXnI3M
         w5BWe7ZbgDWv1fxphhnrqylrPaM8Pmcp2FX1LLC6KO4RAxI3RNF2dbvBxQNwfeU+zeD+
         wvYHu1h+x7sU+hANV+44uVwwK7mt5GGgjdxekZ85f5vFD4W1SBzSOMOSOhoEwgu/BEdV
         D9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MVZ8E32dM3IQUQ/4sulzcLWknTbAvmYBrKs0Eer6wKA=;
        b=nqRpuky/LZOim8hr8VP7GuVE3umTV6JAYC9xUZZQbDoedVWLOlrXzOr80iC6y8bgYY
         aMRbMqvnJnkXSjzWla8QJ32NMX62yz25ZXMCnOSpgINtrQfptEtKIu76rawtJaZTClAp
         bBiZOZQZMHxTKx9JGRmaRPYuXBdgAgwveb47mxLDB1ryvN2MobD8jbkFVBfin68QJ6CG
         w9TU6mXITP+1fiB92K2dm6PvUIiHed31igmNTvaGvhbWm4o+8e129EbciMp6/bJca32Y
         hDo3xiKmZdLY4R6q4a3w+y7rEbbKNTZThUzYuN8EMm5Lr/W3kWqSHW09HcbA5buxIrYg
         TxIw==
X-Gm-Message-State: APjAAAXvXnDhR/9LX0e4zwwHYDUJdUgP4kTKyMkWx/2jmEQA+2ZgFldo
        B+sqgHrLOXFFafb8fMY66mRYMQ==
X-Google-Smtp-Source: APXvYqxjMqVzBoEBMCg0Uqzhpta0oQMJtUFzmS+zyTM2gjOR58JZ7m+Sy9bAf2amhL1sDOv0Q+Dvrw==
X-Received: by 2002:ac2:5222:: with SMTP id i2mr19153297lfl.68.1557315891721;
        Wed, 08 May 2019 04:44:51 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id t20sm4067648lfb.27.2019.05.08.04.44.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 04:44:50 -0700 (PDT)
Subject: Re: [PATCH 1/4] media: venus: firmware: fix leaked of_node references
To:     Wen Yang <wen.yang99@zte.com.cn>, linux-kernel@vger.kernel.org
Cc:     wang.yi59@zte.com.cn,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1557126318-21487-1-git-send-email-wen.yang99@zte.com.cn>
 <1557126318-21487-2-git-send-email-wen.yang99@zte.com.cn>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <3f57c73e-3059-df43-8bc4-6ed8ca906d32@linaro.org>
Date:   Wed, 8 May 2019 14:44:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557126318-21487-2-git-send-email-wen.yang99@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wen,

Thanks for the patch!

On 5/6/19 10:05 AM, Wen Yang wrote:
> The call to of_parse_phandle returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
> 
> Detected by coccinelle with the following warnings:
> drivers/media/platform/qcom/venus/firmware.c:90:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 82, but without a corresponding object release within this function.
> drivers/media/platform/qcom/venus/firmware.c:94:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 82, but without a corresponding object release within this function.
> drivers/media/platform/qcom/venus/firmware.c:128:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 82, but without a corresponding object release within this function.
> 
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: David Brown <david.brown@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/media/platform/qcom/venus/firmware.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 6cfa802..f81449b 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -87,11 +87,11 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>  
>  	ret = of_address_to_resource(node, 0, &r);
>  	if (ret)
> -		return ret;
> +		goto err_put_node;
>  
>  	ret = request_firmware(&mdt, fwname, dev);
>  	if (ret < 0)
> -		return ret;
> +		goto err_put_node;
>  
>  	fw_size = qcom_mdt_get_size(mdt);
>  	if (fw_size < 0) {
> @@ -125,6 +125,8 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>  	memunmap(mem_va);
>  err_release_fw:
>  	release_firmware(mdt);
> +err_put_node:
> +	of_node_put(node);
>  	return ret;
>  }
>  
> 

-- 
regards,
Stan
