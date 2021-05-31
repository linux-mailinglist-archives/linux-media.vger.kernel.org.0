Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931E839599B
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 13:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbhEaLX3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 07:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbhEaLX0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 07:23:26 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FBCC061574
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:21:46 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id j10so13038359edw.8
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FdUWrypFboll3s6XGR9/NH8Gi70rzyMBTmGkIlVn5fQ=;
        b=nN1/gv2aRK2Ka4CUIRbUDq9drpxmUdjaRVH6FquQHWKZvgADex2vktzLgxtsGS6jRd
         teh/1yI+GhGPDTFshNTMOCKHGwnHoiOGljQHuewaUXo18F3l1EHZ4YfrOfmnuWmwQx8A
         GHp7kpSkSJAKvc98aWO1MeptFtovu2dXIFCvcVIVEQBxkNH2eedm0TLGXeD5Xeck02Pf
         UTmeCdTnLNMaNQc4yGpYMRy59v42YEv8qMMj5RfZMAyS8tKeoQbkP4PtsW3oFlYUxKUV
         UE9bBET/TqpxoC4b3abv1Ut7dmZwszopG5IF2KLSUIXl1j/FfA5/a9frn0V4hhZp6pYl
         SJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FdUWrypFboll3s6XGR9/NH8Gi70rzyMBTmGkIlVn5fQ=;
        b=jjThQo59S0Y+g8gFuEH04zXulWTEnLGJwKooov5WzTH1issWbIxvf3TaabFvacGPUo
         46yFA2BtCMrAzo6oxn9VIQiCEWFA5IK3LzBppGjukl8+6AldwgHTPVcm+DZodMFog5E3
         5oLl0qL6xg50ylrA+mxWj/grViSXKSVAbPPHUCKtUB4E9bvfqC/bKBMVTvNF3LnhdeK4
         OaQSQALo5lalFiA6gb8DHxa6UpSftjXuFedz+0Jt7sSwVeWiD7PDqDPU5VdnIEYNunZE
         GDcmw+sdkNMWk/HI+INoh6PlGRnqjEVl3FVbk/LPSpQJ2Gdkxw6oXRuX8Wlwd9eWqMtu
         7hTg==
X-Gm-Message-State: AOAM530fyM4MhiPkJgQNx2SgC+WDoTq+iSPBN8IJDM5o/JxJPULxrISL
        VSR0D3GPk7o9m7Bx9sIdZF3/2aErLEHAONHr
X-Google-Smtp-Source: ABdhPJyG78ZSnq+sMy7XuSdIclAryG5dz6kh+Bs8p3TayYSSqPI9EiNLzpIst0vR5tFpeW13Bue7zw==
X-Received: by 2002:aa7:c450:: with SMTP id n16mr516801edr.386.1622460105389;
        Mon, 31 May 2021 04:21:45 -0700 (PDT)
Received: from [192.168.1.28] (hst-221-6.medicom.bg. [84.238.221.6])
        by smtp.googlemail.com with ESMTPSA id dh21sm6784486edb.28.2021.05.31.04.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 04:21:45 -0700 (PDT)
Subject: Re: [PATCH 6/7] media: venus: helpers: update NUM_MBS macro
 calculation
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1621417008-6117-1-git-send-email-dikshita@codeaurora.org>
 <1621417008-6117-7-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c285b442-f031-3d0e-08b2-281a53df1121@linaro.org>
Date:   Mon, 31 May 2021 14:21:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621417008-6117-7-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/19/21 12:36 PM, Dikshita Agarwal wrote:
> Consider alignment while calculating NUM_MBS.
> 
> Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 2223f55..cbe653f 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -18,8 +18,8 @@
>  #include "hfi_platform.h"
>  #include "hfi_parser.h"
>  
> -#define NUM_MBS_720P	(((1280 + 15) >> 4) * ((720 + 15) >> 4))
> -#define NUM_MBS_4K	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
> +#define NUM_MBS_720P	(((ALIGN(1280, 16)) >> 4) * ((ALIGN(736, 16)) >> 4))
> +#define NUM_MBS_4K	(((ALIGN(4096, 16)) >> 4) * ((ALIGN(2304, 16)) >> 4))
>  
>  struct intbuf {
>  	struct list_head list;
> @@ -1099,17 +1099,19 @@ static u32 venus_helper_get_work_mode(struct venus_inst *inst)
>  	u32 num_mbs;
>  
>  	mode = VIDC_WORK_MODE_2;
> -	if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
> -		num_mbs = (ALIGN(inst->height, 16) * ALIGN(inst->width, 16)) / 256;
> -		if (inst->hfi_codec == HFI_VIDEO_CODEC_MPEG2 ||
> -		    inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ||
> -		    num_mbs <= NUM_MBS_720P)
> -			mode = VIDC_WORK_MODE_1;
> -	} else {
> -		num_mbs = (ALIGN(inst->out_height, 16) * ALIGN(inst->out_width, 16)) / 256;
> -		if (inst->hfi_codec == HFI_VIDEO_CODEC_VP8 &&
> -		    num_mbs <= NUM_MBS_4K)
> -			mode = VIDC_WORK_MODE_1;
> +	if (IS_V6(inst->core)) {

IS_V6() is not needed - we already have this check in
venus_helper_set_work_mode()

> +		if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
> +			num_mbs = ((ALIGN(inst->height, 16))/16 * (ALIGN(inst->width, 16)))/16;
> +			if (inst->hfi_codec == HFI_VIDEO_CODEC_MPEG2 ||
> +			    inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ||
> +			    num_mbs <= NUM_MBS_720P)
> +				mode = VIDC_WORK_MODE_1;
> +		} else {
> +			num_mbs = (ALIGN(inst->out_height, 16) * ALIGN(inst->out_width, 16)) / 256;
> +			if (inst->hfi_codec == HFI_VIDEO_CODEC_VP8 &&
> +			    num_mbs <= NUM_MBS_4K)
> +				mode = VIDC_WORK_MODE_1;
> +		}
>  	}
>  
>  	return mode;
> 

-- 
regards,
Stan
