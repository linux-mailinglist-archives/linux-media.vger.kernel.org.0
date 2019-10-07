Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D68ECE570
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 16:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbfJGOi7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 10:38:59 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43317 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfJGOi7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 10:38:59 -0400
Received: by mail-lj1-f196.google.com with SMTP id n14so13906055ljj.10
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 07:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F4Ty+1qbx7fp2IOThQZa5p1hnninGpZKNUIn0Vlr5gA=;
        b=Qtyu1kzD9LwmbmAVo6V+ZkqowQVFtwCMupTjz5pN4PdMpRaUyQOQskM5F3xvBdzT2k
         vSOz0NdSY44Qx1HzL2p25ysaIj9dwF+TrJvuWeRNWsp9KUtOC15K8SuHZXyMPXJcEI66
         Vx0M4vAGLMi+UavZCUqa+EIjhkeyVHQiqIacaUjrwDkCgr5fucbcdI9kEhn5k9+b483V
         hJY7/zvKMEgD86CSANP/jDy9BWN1xzeQPmRqIFjBhNMdIlJ06PFVEF3PwvUTlberngGI
         LS3Us0oLb/1wc2XgDV+MBCOIoa22ksznoKnb0CIERo7GNhZHo4Gp7S38PO2iW+UBY1J+
         45yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F4Ty+1qbx7fp2IOThQZa5p1hnninGpZKNUIn0Vlr5gA=;
        b=iml9XxZcC2TR+sB0S3z7EUvGUdz53hZbZQBRq1DI9Wo6JQBOApMzWIE4sYQUNozUYb
         Xpm0GFnU50u/+Vzo7ksVxVch/WpjXC1a7Tq+RtB6GlIiF3xmpq7OjrHNCyv3a1oaIy+T
         DlDJS9rpESPOgkUHTs8B3kEsDzAtuEww+0D/04bGjTeEMrvWJ6vMpuzL5pdJk6xGzjQd
         Hlw8HeH7IQyFYogzKcsn6rSeP6kHXqpP+As2IKBrIB2djaQdgWVuc4FdSf7dh/0CCjri
         of3jq5RVFLIMoA+yGz1OYlHf+8vcDTtQ6LI+RxGsnqm6euzslfdpjExLXTZW56cq20nk
         8tfg==
X-Gm-Message-State: APjAAAU1zvG1D0yiBBGaZWdEqAzfSVCv4+rjRy/fBJTbsgIiDXBkp2tM
        xQVESZCIIl05cC7VduQvIexnPw==
X-Google-Smtp-Source: APXvYqyrzQHE9XMk37hzyE9ZaZmWpxtZxck4/tx3aRmKe0OABFskZ5aA58/d7741xgH0hxNIap2qdg==
X-Received: by 2002:a2e:8199:: with SMTP id e25mr15282464ljg.246.1570459137409;
        Mon, 07 Oct 2019 07:38:57 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id z26sm3181004lji.79.2019.10.07.07.38.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 07:38:56 -0700 (PDT)
Subject: Re: [PATCH] media: venus: fix build on 32bit environments
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
References: <f8b266dea8594c046bd545ca1f497bfc1658835d.1570455418.git.mchehab+samsung@kernel.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <2f22ff7f-0e47-b03f-75bf-a9822afb0507@linaro.org>
Date:   Mon, 7 Oct 2019 17:38:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f8b266dea8594c046bd545ca1f497bfc1658835d.1570455418.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for the fix!

On 10/7/19 4:37 PM, Mauro Carvalho Chehab wrote:
> As reported by jenkins@linuxtv.org, the build with i386 fails
> with:
> 
> 	ld: drivers/media/platform/qcom/venus/helpers.o: in function `venus_helper_load_scale_clocks':
> 	(.text+0x1d77): undefined reference to `__udivdi3'
> 	ld: (.text+0x1dce): undefined reference to `__udivdi3'
> 	make: *** [Makefile:1094: vmlinux] Error 1
> 
> That's because it divides an u32 bit integer by a u64 one.

General question, shouldn't such errors been catch from builder on the
pull request?

> 
> Fix it by explicitly callind do_div.
> 
> That's said, why fps is a 64 bits integer?

I don't have other explanation than - just to avoid casting after the
math in vdec/venc_s_parm() functions.

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 5ea5d90f8e5f..09fa87e3c0a0 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -522,8 +522,14 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
>  	unsigned long vpp_freq = 0, vsp_freq = 0;
>  	u64 fps = inst->fps;
>  	u32 mbs_per_sec;
> +	u64 tmp;
> +

you have extra blank line here.

> +
> +	tmp = load_per_instance(inst);
> +	do_div(tmp, inst->fps);
> +
> +	mbs_per_sec = (u32)tmp;
>  
> -	mbs_per_sec = load_per_instance(inst) / inst->fps;
>  	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
>  	/* 21 / 20 is overhead factor */
>  	vpp_freq += vpp_freq / 20;
> 

I guess this fix should be squashed with the commit which introduce it :(

Note taken, always build patches on i386 :/

-- 
regards,
Stan
