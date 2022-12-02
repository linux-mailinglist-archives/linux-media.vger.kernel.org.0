Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 596DD63FD56
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 01:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232193AbiLBAvO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Dec 2022 19:51:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbiLBAvK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Dec 2022 19:51:10 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1FABCEF9D
        for <linux-media@vger.kernel.org>; Thu,  1 Dec 2022 16:51:07 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so3134135wms.0
        for <linux-media@vger.kernel.org>; Thu, 01 Dec 2022 16:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jSla93EpscSPQh3ATxY6DK8WOubu5/W+e14yqK8GABA=;
        b=eNIwG7QMQk4WVoF38bIkacJ3GEMa2RStDsjcNOmVBAESS6mUah2bmTVAdYJYiXBQtr
         fn9lQ0gk/aEB8BPsVAjLvPBrTnKcuf5weyIPGf/d+SaYJPTPvBDyqx1zssYFZmlDON6I
         hK3RYLjzicmQ0Y3uVub8PEvquFU0gFwqY81x4X9v7d3wwdITQRRV1cMQmhW0o5rd7mTb
         mj2KFLdtX5kehATeM9tiVd5sVtD697VsvUXFMWhQougnoCtojQ58GgFYqmonATLKUSpx
         WaE629eaGEVXvNrrRXgVqKDiiCbX19vdunxavc+Edle5RRd7mSnLDu7MGy+l8eEwOqdv
         u6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jSla93EpscSPQh3ATxY6DK8WOubu5/W+e14yqK8GABA=;
        b=0h3WuJr75xpQLbxnEDpeN26JGTsUQNa+YNIYP3sRCcvzBKii93m2LYs6U2N3qQSwuu
         MeleOsdioe0cTK43A7f2PVWiw1GYfHjiIwNXb29cUtpPxDQ6bmWh7NKlwt+QYtDf2+ll
         lcrt6qQl+aDwFJCl+Wz94llZrz6q6vaVjgHHoMYm6PV5g3Dj8UZrOQLzDXV/rFuCufiO
         LWKRFtiA+WnBIH3mo9Rhr/ciFbY1F8ONxa1BnTdoFqn78vaoyK3KvdidWaULaBrymO8Y
         WivtIPLYt3ks0MX9QjcvRhhL4y6jXMkfxXm1O96PAojkbkKBAOoRCkErbuFB8sW+L+TQ
         c0DQ==
X-Gm-Message-State: ANoB5pkYHz5EPnyppjcRnArVj6s2dgrsG1/fTazAl2TD2lD1YfVaz58Y
        qE6agxGfNeJVn8rECGMFaieTfA==
X-Google-Smtp-Source: AA0mqf5os0dg5CrBOfGor7KO+EaTj/T+8bvDBh7/FuwnwMPUbNUGnljXviQcBLivdynYywjbz3/jYw==
X-Received: by 2002:a05:600c:5010:b0:3cf:b067:416c with SMTP id n16-20020a05600c501000b003cfb067416cmr38912984wmr.134.1669942266208;
        Thu, 01 Dec 2022 16:51:06 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s1-20020adfdb01000000b002420a2cdc96sm5584765wri.70.2022.12.01.16.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 16:51:05 -0800 (PST)
Message-ID: <fab6a134-21a3-ce49-dede-97f0a4b0dc50@linaro.org>
Date:   Fri, 2 Dec 2022 00:51:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/1] venus : Fix for H265 decoding failure.
Content-Language: en-US
To:     quic_vboma@quicinc.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@qti.qualcomm.com>
References: <20221115121004.28197-1-quic_vboma@quicinc.com>
 <20221115121004.28197-2-quic_vboma@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20221115121004.28197-2-quic_vboma@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/11/2022 12:10, quic_vboma@quicinc.com wrote:
> From: Viswanath Boma <quic_vboma@quicinc.com>
> 
> Aligned the mismatch of persist1 and scratch1 buffer calculation,
> as per the firmware requirements .
> 
> Signed-off-by: Vikash Garodia <vgarodia@qti.qualcomm.com>
> Signed-off-by: Viswanath Boma <quic_vboma@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> index ea25c451222b..a9be31ec6927 100644
> --- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> @@ -93,7 +93,7 @@
>   #define LCU_MIN_SIZE_PELS		16
>   #define SIZE_SEI_USERDATA		4096
>   
> -#define H265D_MAX_SLICE			600
> +#define H265D_MAX_SLICE			3600
>   #define SIZE_H265D_HW_PIC_T		SIZE_H264D_HW_PIC_T
>   #define SIZE_H265D_BSE_CMD_PER_BUF	(16 * sizeof(u32))
>   #define SIZE_H265D_VPP_CMD_PER_BUF	256
> @@ -1021,7 +1021,7 @@ static u32 h264d_persist1_size(void)
>   static u32 h265d_persist1_size(void)
>   {
>   	return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 + H265_NUM_TILE
> -			* sizeof(u32)), HFI_DMA_ALIGNMENT);
> +			* sizeof(u32) + NUM_HW_PIC_BUF * SIZE_SEI_USERDATA), HFI_DMA_ALIGNMENT);
>   }
>   
>   static u32 vp8d_persist1_size(void)

If this is a real fix it need to be applied elsewhere

Please add a Fixes tag

Fixes: 3a75bf4e7925 ("media: venus: Add platform buffers for v6")

and

Cc: <stable@vger.kernel.org> # 5.14.x

---
bod
