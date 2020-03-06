Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFB3B17B8E7
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 10:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgCFJDV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 04:03:21 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38016 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgCFJDV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 04:03:21 -0500
Received: by mail-ed1-f65.google.com with SMTP id e25so1614171edq.5
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2020 01:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EVfExVbvc4MvxivvhE8Zwkes3mQk8IuR0W5sHBoUt4M=;
        b=s6yA/sFVQfnkWOhzov76JC4v4Q6UutyZ2L2Ug8rveGNIABq+bmHeuErO/xR9kP+ZVq
         ABqMmyGsSidJfn9cZZy9F4syEURpDOjA53So+NYB0qFB97h6pM7kmZEqyBOE4czQsPfc
         qd6GHhD1w9RQSXdmT2bh5zN2TRQTXdFVY5j9roa1grZia95KM82NTrW1lnUZB2STrZqK
         liAupLupNj+py9BYsqUoCR3Obedn1WXJPcp5DVYdUOKo0Vi3Vtscc+jUMUcTclpjNhGH
         W456CdZ7bAQ33fJHtT4gZNcEhQoVWOqjhhCx6M4va25gzkqcbZtDVd2VzL4FBhObFQrV
         lefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EVfExVbvc4MvxivvhE8Zwkes3mQk8IuR0W5sHBoUt4M=;
        b=hmoOPZuEaCbwPBvIVdbSAsuT0zbLJAoOaRxsImR/K6CpsK7hfqtojBfuN6ZkmscHM6
         ozS2qt3tIC1dbvIK79COE1Aq6M7zXZLaLPJv19SPyU9tqWqirrO1OkhPaaf5RKstbWlr
         x6k8RASQPTfnV/KRFL2pkp3mRV8Xvi1kM99l9rLv8J7MfFJ/PLqtmRFVr46lWdGu2CQ8
         8bVP9+w2r7BIE5+fmrXHDY4vgLTOvT05ufXo3ZEL/NJNcDM+Duz19/eWqBjB+yywLVy6
         OkY36xmc0yXbzQSoWPOaOpT8R8YlCzBPtM85cHaSI/w/CmzBWcYLHKcDmFJgsYVq43Wk
         GHTg==
X-Gm-Message-State: ANhLgQ0ZKVGkMrsEjf4zr1CF4vFwRLMr7L3MtQoCVN0YfCBu4Gqddm6V
        lku/PWq/yXyeFbj5cjrJV7/YSg==
X-Google-Smtp-Source: ADFU+vtCgRacFQClx889CnjgxaGXzrkgaoyqx59KC3gGmUbS+9oMGQ7CB5b7VUWkaDXtpfGM1f47kQ==
X-Received: by 2002:a05:6402:b81:: with SMTP id cf1mr2021814edb.131.1583485399147;
        Fri, 06 Mar 2020 01:03:19 -0800 (PST)
Received: from [192.168.27.209] ([94.155.124.210])
        by smtp.googlemail.com with ESMTPSA id x6sm1505497edr.86.2020.03.06.01.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2020 01:03:18 -0800 (PST)
Subject: Re: [PATCH] media: venus: fix use after free for registeredbufs
To:     Jeffrey Kardatzke <jkardatzke@google.com>,
        linux-media@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306002321.3344-1-jkardatzke@google.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <892a0548-df6d-a4db-921f-7f4cfd69dc06@linaro.org>
Date:   Fri, 6 Mar 2020 11:03:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200306002321.3344-1-jkardatzke@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jeff,

Thanks for the patch!

On 3/6/20 2:23 AM, Jeffrey Kardatzke wrote:
> In dynamic bufmode we do not manage the buffers in the registeredbufs
> list, so do not add them there when they are initialized. Adding them
> there was causing a use after free of the list_head struct in the buffer
> when new buffers were allocated after existing buffers were freed.

Is this fixing a real issue? How you come to it?

> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index bcc603804041..688a3593b49b 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -1054,8 +1054,10 @@ int venus_helper_vb2_buf_init(struct vb2_buffer *vb)
>  	buf->size = vb2_plane_size(vb, 0);
>  	buf->dma_addr = sg_dma_address(sgt->sgl);
>  
> -	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> +	    !is_dynamic_bufmode(inst)) {

If you add !is_dynamic_bufmode here, we will loose the reference frames
mechanism (see venus_helper_release_buf_ref()) which is not good.

Thus, I wonder (depending on when you observe the use-after-free issue)
does this is the correct resolution of the problem.

>  		list_add_tail(&buf->reg_list, &inst->registeredbufs);
> +	}
>  
>  	return 0;
>  }
> 

-- 
regards,
Stan
