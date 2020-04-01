Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07E3419A762
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 10:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730590AbgDAIhf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 04:37:35 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37750 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727627AbgDAIhe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Apr 2020 04:37:34 -0400
Received: by mail-ed1-f66.google.com with SMTP id de14so28644994edb.4
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2020 01:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FyEhiVQqCC0n6tZWozoPFO5HZtdSk1NEpUldzxKhYN4=;
        b=ZTEDs2BQyN8yoxD7A5h1aiqNIAWemIBANASqEaV0nOkgN043uKgdnMoNMFNVvdWhYW
         iFcvU6YirVUBRdBNdJ3aSOQeWtN9e3dW4IIVsAWFS7TBEmBSWjaxLPJTz5WRnegy/8ZW
         QCy8BmMOTKyQyfEFzAFmg91p5izsezVbwT3yZjYKuX1WtXuruELJ1sCx4R5AJer2wOfL
         MeS/MywUilRVPPFV9DHMSdzlobFLDl0+eA5N+o7scVJycty8/lY3yqLTfn8YYcecYOqp
         iWqwny1YvJB0NacacNBG5WWUj6HLGt6JzfU8djxL4guCmxPl8id2/bLf7SgQTofZdggv
         dsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FyEhiVQqCC0n6tZWozoPFO5HZtdSk1NEpUldzxKhYN4=;
        b=XXWeVbrpywNb4unSi1UHdae3l8OZAJ4EurLBTj4KESDSQLslXQm06HKKrbprV7Vegd
         44Rw4eD3T5ooNRdOt7q8HRn5U/TIwqPm1TXBYEb/hx+0btsr9aDbC66x7VOuztm2DVGe
         astxtMQc0CcBt4KVgBAe8p5MTWW1mxC3FWm5jH5tCimZ/91ulCBH0AB91oxh0M3HT3G7
         ZbboWBDJtrWHZlZIa9uLDLiCteSd5gb6btU9Uj5yqSPN4fh+pOUtN0xBoOdplbAHDmcw
         cAHNXzeHu459bzkSjnH6ULXrXc6GcRRWGK28UkbxcdGvWkJoFpAXX0EvObVCCPfiIbgb
         fF2g==
X-Gm-Message-State: ANhLgQ0xNg+WcgjxzK1Xhs7zFmHvxsnbvxbAl0LkOnUBycNaRDbwWdX0
        nw80a0Jn6uytG3cHRWo6JT2GM8oKWAY=
X-Google-Smtp-Source: ADFU+vsEN+s8QxK70fXDxbR3lYOgf1JF4FPA31mNI6F2POdUZYpThQRmL3S6XfZBnxVykWgtSYYkDg==
X-Received: by 2002:a17:906:1952:: with SMTP id b18mr18407508eje.216.1585730253512;
        Wed, 01 Apr 2020 01:37:33 -0700 (PDT)
Received: from [192.168.1.4] (212-5-158-119.ip.btc-net.bg. [212.5.158.119])
        by smtp.googlemail.com with ESMTPSA id l62sm274693edl.89.2020.04.01.01.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 01:37:32 -0700 (PDT)
Subject: Re: [PATCH][next] media: venus: hfi_cmds.h: Replace zero-length array
 with flexible-array member
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200319222105.GA19104@embeddedor.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <849ddb2c-d022-bd13-89c2-b0c1a4363a23@linaro.org>
Date:   Wed, 1 Apr 2020 11:37:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319222105.GA19104@embeddedor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gustavo,

Thanks for the patch!

On 3/20/20 12:21 AM, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Stanimir Varbanov <staninmir.varbanov@linaro.org>

> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index cae9d5d61c0c..83705e237f1c 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -107,7 +107,7 @@ struct hfi_session_abort_pkt {
>  struct hfi_session_set_property_pkt {
>  	struct hfi_session_hdr_pkt shdr;
>  	u32 num_properties;
> -	u32 data[0];
> +	u32 data[];
>  };
>  
>  struct hfi_session_set_buffers_pkt {
> 

-- 
regards,
Stan
