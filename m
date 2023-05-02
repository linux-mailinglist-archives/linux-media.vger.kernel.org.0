Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA1F6F486F
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 18:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234306AbjEBQhs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 May 2023 12:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234375AbjEBQhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 May 2023 12:37:20 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6274E78
        for <linux-media@vger.kernel.org>; Tue,  2 May 2023 09:37:14 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f178da21afso26931025e9.1
        for <linux-media@vger.kernel.org>; Tue, 02 May 2023 09:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683045433; x=1685637433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zwqdNjAxsqWdNF43eJm/VW7zQPj9015oX6KfsTDqztg=;
        b=eNUp2crIS46e7N3KSjvRJrhQLNcLm1vPb0OJnqO7628nXtomN2YnCtYl/qhrHuyF9Q
         UJTAHmMxFDx5KHuIyjmFzm5mW9wAZq1lmzbFzMhi/TRGULV2tUjnBzwxwFjq3LkiOAg2
         fUpgCkzplFsMjK9xGn4EBuAVqd1+ePHSQw/3DNhxCdRAPOCnA2peHlbPsCz5coCH4Qs5
         lXIbEYnrXuw+TZ+gyg1M8EypwAhR8iJQs7/EYlyAJUnNDKR7vhzYVZ/1ydMo0d3Ierhg
         t9dNB4JVsjNrwygvbMrbj40XphsIjB/uyxwhUo5RbfkxEEBN3gBgvxj8xgGAj6GdXlac
         yBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683045433; x=1685637433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zwqdNjAxsqWdNF43eJm/VW7zQPj9015oX6KfsTDqztg=;
        b=Bmikj8FWd59L/MSpbngdzSIuP3Oowufly2P7CTxCcoXywoDhl5PImWlmMErTAgZOa/
         vHW+N6lXv6OSMLAQRSdW/p0Zirep1CtuHFty8rkCHkuFJ8h/iRLpZ4CzXsxr3HDNzZUJ
         sz8lL4o/cy65GeBLwilNuDZcPNV1Dxd42eu7mHmrSgPcWTPb/EKJpbbQ1f6N10XzVKjw
         oSlpyehtUN/4PxNcfIsQ18/JH/3fHIXu7THN1fzqUftcUbWaNVcCm0A3hJujwlBXAOvz
         sD8ASXwPlv4VYnE8YJXbJRCsnipGw4ab71hRTEsD83tcnqWBOC7m+kF9/1lIHiKkxdU5
         P7tw==
X-Gm-Message-State: AC+VfDwF0crqW45tJHwiCWskW8WqPAiSF/ZpE1jzn+ZYxA/sHByD13E/
        wphuei8Mvqa8fQNlb04BexZO2w==
X-Google-Smtp-Source: ACHHUZ4Fe/oTsDtZ0c562/VZ5uzdNMNn2prXZBa/X9/pJeP957bny/AnzziQCqM6dsEBZio67V93rQ==
X-Received: by 2002:a1c:7502:0:b0:3f2:54ae:6921 with SMTP id o2-20020a1c7502000000b003f254ae6921mr12863258wmc.2.1683045433269;
        Tue, 02 May 2023 09:37:13 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003f1745c7df3sm12742860wmz.23.2023.05.02.09.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 09:37:12 -0700 (PDT)
Message-ID: <2e61e054-105c-ae22-77b8-a3f41fe3eff0@linaro.org>
Date:   Tue, 2 May 2023 17:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: venus: only set H264_TRANSFORM_8X8 on supported
 hfi versions
Content-Language: en-US
To:     =?UTF-8?Q?Martin_D=c3=b8rum?= <dorum@noisolation.com>,
        stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
References: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/04/2023 11:12, Martin Dørum wrote:
> Setting the H264_TRANSFORM_8X8 property only works on HFI versions
>> =4xx. The code used to unconditionally set the property in
> venc_set_properties, which meant that initializing the encoder would
> always fail unless the hfi_version was >=4xx.
> 
> This patch changes venc_set_properties to only set the
> H264_TRANSFORM_8X8 property if the hfi version is >=4xx.
> 
> Signed-off-by: Martin Dørum <dorum@noisolation.com>
> 
> ---
> 
> I have an APQ8016-based board. Before this patch, the Venus driver
> would simply fail with EINVAL when trying to request buffers
> (VIDIOC_REQBUFS). With this patch, encoding works
> (tested using gstreamer's v4l2h264enc).
> 
>   drivers/media/platform/qcom/venus/venc.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index cdb12546c4fa..b3df805a8c9c 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -672,16 +672,17 @@ static int venc_set_properties(struct venus_inst *inst)
>   		if (ret)
>   			return ret;
> 
> -		ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
> -		h264_transform.enable_type = 0;
> -		if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
> -		    ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
> -			h264_transform.enable_type = ctr->h264_8x8_transform;
> -
> -		ret = hfi_session_set_property(inst, ptype, &h264_transform);
> -		if (ret)
> -			return ret;
> -
> +		if (!IS_V1(inst->core) && !IS_V3(inst->core)) {
> +			ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
> +			h264_transform.enable_type = 0;
> +			if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
> +			    ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
> +				h264_transform.enable_type = ctr->h264_8x8_transform;
> +
> +			ret = hfi_session_set_property(inst, ptype, &h264_transform);
> +			if (ret)
> +				return ret;
> +		}
>   	}
> 
>   	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
> --
> 2.34.1

I agree that a Fixes should be added.

Fixes: bfee75f73c37 ("media: venus: venc: add support for 
V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control")

When sending out your V2, please remember to cc -> Hans Verkuil 
<hverkuil-cisco@xs4all.nl>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
