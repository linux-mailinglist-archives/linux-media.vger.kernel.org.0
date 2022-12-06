Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46EC564450F
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 14:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234750AbiLFNz5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 08:55:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbiLFNzn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 08:55:43 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52132BB1F
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 05:55:41 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id h11so23501567wrw.13
        for <linux-media@vger.kernel.org>; Tue, 06 Dec 2022 05:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnOs7pcvmFOnnCna+HbqLKoHhRLMU0RIR9rIe1VPz1I=;
        b=c/B0ZaXccb4UimJk2g22JsUXDblykgEkVG6nhqTPtQBvD9Yn/hZ1MvmPLerpBDQhKR
         KREceLTzVCdaN7DmE6l/Ae/zGCUDdBXPKLeYWR+CmR6zyfmNqZsNcXpQYSzp+BinphTM
         ifuZpFuIeuUQeHUmjGZTx2IMm84h+xEJIeyo9wjTMAaNOreuTFXzoAcl5gYgeMyofhH4
         3t3BwSIowQxylZo33D9+HtjD7kJg07eI8UyEsL1lZmufBYlvBN4GwFiu0ktvUzGPtccy
         U/12CjWwab1euiTSyPYvHSgqwwOeuI6bpkxgbDfoRQOO/9OTKnXvMHIhRZD7N7+W/1yg
         MQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnOs7pcvmFOnnCna+HbqLKoHhRLMU0RIR9rIe1VPz1I=;
        b=moWWO6TErNtOBxIv9NWLmfJf11aTb+BiOOtiW2OS1zMA3tYpzJ3VQE3AXkYWEFfMvt
         W6ieGkzsuw8HD2oWgvgdUjy4cNmV25TyuiOOIYR5rJn1yLPkHiekOiPEto7rDHcrEmjr
         W7dSR+osSY1LeYbacpaN/1NDzBSq/zQbq869R8FBACp9ErcHOv8bgoAQ++wXn7J26gpK
         PzAZf8btfgJTwwQ/QdCNBlL5MJqFYNAwJkGgBZxZfwquIE9OSIjGSq95hGudG45qB9Q/
         pj3C1zjAMFw4FLejZOHS0VfP1RNbLmWqyVjXnEIDSlcPp0boPU8Oo2ztZMV36D06wZte
         rGrg==
X-Gm-Message-State: ANoB5pmoA5fn6GumxdkS/2bgxVNUaRLtN9HFglG6l2ccacGNxbb2BPfD
        yTuKeNIBzMqY7jy/vg+iWkzz+g==
X-Google-Smtp-Source: AA0mqf6b3SlLK06/M7Ib0YoqwhTZiPW89mBxzHkMfT2KgAPmTT0liM2Ons4KWDmLq2RZRGs7oHsYcA==
X-Received: by 2002:a5d:53cd:0:b0:242:47b9:7ad6 with SMTP id a13-20020a5d53cd000000b0024247b97ad6mr10242093wrw.93.1670334940296;
        Tue, 06 Dec 2022 05:55:40 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l22-20020a05600c4f1600b003cf54b77bfesm27869478wmq.28.2022.12.06.05.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 05:55:39 -0800 (PST)
Message-ID: <92fbb572-3599-726e-117e-0d4ace2d9a36@linaro.org>
Date:   Tue, 6 Dec 2022 13:55:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 2/4] media: camss: vfe: Reserve VFE lines on stream
 start and link to CSID
Content-Language: en-US
To:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221205152450.1099-1-quic_mmitkov@quicinc.com>
 <20221205152450.1099-3-quic_mmitkov@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20221205152450.1099-3-quic_mmitkov@quicinc.com>
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

On 05/12/2022 15:24, quic_mmitkov@quicinc.com wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> 
> For multiple virtual channels support, each VFE line can be in either
> ON, RESERVED or OFF states. This allows the starting and stopping
> of a VFE line independently of other active VFE lines.
> 
> Also, link the CSID entity's source ports to corresponding VFE lines.
> 
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 1 +
>   drivers/media/platform/qcom/camss/camss.c     | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index a26e4a5d87b6..e0832f3f4f25 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -740,6 +740,7 @@ static int vfe_set_stream(struct v4l2_subdev *sd, int enable)
>   	int ret;
>   
>   	if (enable) {
> +		line->output.state = VFE_OUTPUT_RESERVED;

This statement is breaking rb3

>   		ret = vfe->ops->vfe_enable(line);
>   		if (ret < 0)
>   			dev_err(vfe->camss->dev,

you need to extend your patch doing this for vfe-480.c

-       if (output->state != VFE_OUTPUT_OFF) {
+       if (output->state > VFE_OUTPUT_RESERVED) {


to vfe-170.c and camss-vfe-gen1.c

---
bod
