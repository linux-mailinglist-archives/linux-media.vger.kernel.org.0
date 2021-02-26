Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A4C326137
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 11:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhBZK0j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 05:26:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbhBZK0f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 05:26:35 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7F1C06174A
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:25:54 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id g3so10275766edb.11
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5rKpGoiRrT+bkmlgbReBpLp1vitCMiQU7wBDSXEmNTA=;
        b=p6VVeTkcR4B2rlycKujGM5IcMvd+H2V1Dc+iXTjc+Vuk0hkW6RAyt/43lpuMO8HYN7
         JEssIDXeBnRDoHJaEUSDzl4iUsOZXj0tQr2z8OnXvdQ3J1IGFS0q48bFduqysfrQLKHm
         3N/q5HzXVj+Dnhe0rmyO2MFYv1x9xHINL433/umoihi4e5r9uwIz+2fDUicumPuTBOfD
         nAFSmuq3Q+CESZRAt0sF5D+Tjr9olpKs1jAqONhllTPJPQ9NNXIrshlTumcvVnDI/KC7
         1wWPXG0H588hEpmgqTFu/aCEYVcQbP8uyz7eN+3Rb/WWq4l5uFpBbeI4GWVTP21Soy7h
         JgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5rKpGoiRrT+bkmlgbReBpLp1vitCMiQU7wBDSXEmNTA=;
        b=W6xUN/NnJoF9skUQVNFGojzpally0SlfLWq6eIyXTe0UyyIuIby67UmbA/N6yl+5MH
         MkQAB/RHkTrHJvi9uDzaTYFUwTTpIfceJ04SKRhmMFUBpeSxVCyHmUueInq/VWJoZviT
         s6tkV0IfZxarxlStDD7Vx7k35Os+7w4WcGl+aUWrG1Il7sSjYddowWrnrU8BIma5ez7k
         Vjriy2nns4tOAJgkV2nD2K0+IPzvr2oks/TjdBTFMh2jZJ2A/4vMxtm/qb70E5ESO6WH
         vaBHJSGMKnsVmgI7N/2aQp2a0WC3Xr1SdWJ5StmZPN48cyZsUh8JxrT0sd05pvn3bKBl
         70mA==
X-Gm-Message-State: AOAM531U0NucpR/PRwTi2JeXrCfp6hsyA1j2sblwX9qZTrSf2gQc8m/z
        xm7V+nBFJYbJQjre4yF912sn7w==
X-Google-Smtp-Source: ABdhPJyiBVBAnEA3oza8gnERr+ycgJz8KJVEFDYTjuf7W3oxJsZ+5aeTp/c//dphLxLYiueU8twFBg==
X-Received: by 2002:aa7:d0d7:: with SMTP id u23mr27635edo.255.1614335153065;
        Fri, 26 Feb 2021 02:25:53 -0800 (PST)
Received: from [192.168.0.4] ([84.238.208.204])
        by smtp.googlemail.com with ESMTPSA id z2sm4494691eju.55.2021.02.26.02.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Feb 2021 02:25:52 -0800 (PST)
Subject: Re: [PATCH 25/25] media: venus: vdec: Fix decoder cmd STOP issue
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-26-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <bc4b5c97-8a31-357c-7fd1-2ba9c2353eab@linaro.org>
Date:   Fri, 26 Feb 2021 12:25:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222160300.1811121-26-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/22/21 6:03 PM, Bryan O'Donoghue wrote:
> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 
> Fixes an issue when issuing a stop command to the controller, negating the
> following firmware error.
> 
> "SFR message from FW: Exception: TID = Unknown IP = 0x3b7dc FA = 0x0
>  cause = 0x6"
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
>  drivers/media/platform/qcom/venus/vdec.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index cc282b0df8c3..0a32bb44506c 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -254,7 +254,7 @@ int pkt_session_unset_buffers(struct hfi_session_release_buffer_pkt *pkt,
>  int pkt_session_etb_decoder(struct hfi_session_empty_buffer_compressed_pkt *pkt,
>  			    void *cookie, struct hfi_frame_data *in_frame)
>  {
> -	if (!cookie || !in_frame->device_addr)
> +	if (!cookie)
>  		return -EINVAL;
>  
>  	pkt->shdr.hdr.size = sizeof(*pkt);
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 903443a7a757..9fbff40c4568 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -515,7 +515,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>  
>  		fdata.buffer_type = HFI_BUFFER_INPUT;
>  		fdata.flags |= HFI_BUFFERFLAG_EOS;
> -		fdata.device_addr = 0xdeadb000;
> +		fdata.device_addr = 0;

This should be 0 for v6 only until we find some better way for this EOS
packet.

>  
>  		ret = hfi_session_process_buf(inst, &fdata);
>  
> 

-- 
regards,
Stan
