Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E291D7776E6
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 13:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbjHJL03 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Aug 2023 07:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234385AbjHJL02 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Aug 2023 07:26:28 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84213269F
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 04:26:26 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fe4b95c371so4409575e9.1
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 04:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691666785; x=1692271585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0tTnJRznSRZRdOph0O6zcCrYZpGpbt3RxvxZjdVmHkE=;
        b=fKJ+XgKfS6t6OZDf5M7jPUsCyW9CxjMy/rf5IpsMyVGixbslL5/c8+CUJ+pDk7tHoa
         V/JUS2s0qjrb8TP01tAcL0IcZ8nIuK0TX3bIQ4J6vUorWnmDmJDtpOR6R8JQSNFzDZlY
         LOYoRSc3UzkxNvrE4Sebp/Frl0mAnRt4+H5sX1rsq/Lx1iMtyq9MakfrVXzpxSOnzjUH
         PaeH7rWr9u4HkiJdSbkqvoCKE4IArcLZU6ef/2qZVCpIj4e7Spx4VTAmVcIswwyLIyrS
         ZMRjj5yg3V4yGMTXu4mys6kQi65osuj0z7DD+ZvJkDiStuGoigYzxgr4n7zmr8qu0pmR
         2m7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691666785; x=1692271585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0tTnJRznSRZRdOph0O6zcCrYZpGpbt3RxvxZjdVmHkE=;
        b=Va5NQibbS+DAuIP3ePdbiCxXuOR8+Z47CsrEm6vduViBGD0PE3G1JjGFh2tfvNGEHS
         TBkwDwPQokeQWwr0V1km3Ej2his7r1ihil+Y0GBSN0zQmmyimReMPP2/gDdGvN+anFn+
         j13FLrdwmpUgI6h5buAQ02Ar5K6wPNEb0KmDvkVvewxV70zuFCX+M77z87ZjqM9FVKXZ
         cfbKZyBjQLu3XbQaaVWsoOj9Wdup343Jiin+/XBmtKhez5KpqrLqHxse1YWOiTY8tBlX
         xDEpxq/tFIZ0476JUYdAX1o5D0t86movL5iYVrIxSCWSLuqWby0gmkXyy822y4jrrD7f
         McUw==
X-Gm-Message-State: AOJu0YxX6+3EU7ZbbU7wvSzriF8PPYm3y85053/ls53lkeLECcqEC3cy
        RiyqqvJ00Ivd4WVOcw0UGfsyMQ==
X-Google-Smtp-Source: AGHT+IHdFYAAEgnvQD6jGM2SnDVCS+3Wzj/A1stVZmaHIXLVFIBuw9so+aEaH6Q6sDmmr8ES3lrCEw==
X-Received: by 2002:a05:600c:a3a1:b0:3fb:b18a:f32d with SMTP id hn33-20020a05600ca3a100b003fbb18af32dmr1453763wmb.17.1691666785048;
        Thu, 10 Aug 2023 04:26:25 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c378d00b003fe2de3f94fsm1839494wmr.12.2023.08.10.04.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 04:26:24 -0700 (PDT)
Message-ID: <e8b53000-8640-5345-1d8f-2a75f2ee0805@linaro.org>
Date:   Thu, 10 Aug 2023 12:26:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] venus: hfi: fix the check to handle session buffer
 requirement
Content-Language: en-US
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        stanimir.k.varbanov@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hans.verkuil@cisco.com, tfiga@chromium.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <1691634304-2158-1-git-send-email-quic_vgarodia@quicinc.com>
 <1691634304-2158-3-git-send-email-quic_vgarodia@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1691634304-2158-3-git-send-email-quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/08/2023 03:25, Vikash Garodia wrote:
> Buffer requirement, for different buffer type, comes from video firmware.
> While copying these requirements, there is an OOB possibility when the
> payload from firmware is more than expected size. Fix the check to avoid
> the OOB possibility.
> 
> Cc: stable@vger.kernel.org
> Fixes: 09c2845e8fe4 ("[media] media: venus: hfi: add Host Firmware Interface (HFI)")
> Reviewed-by: Nathan Hebert <nhebert@chromium.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_msgs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
> index 3d5dadf..3e85bd8 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
> @@ -398,7 +398,7 @@ session_get_prop_buf_req(struct hfi_msg_session_property_info_pkt *pkt,
>   		memcpy(&bufreq[idx], buf_req, sizeof(*bufreq));
>   		idx++;
>   
> -		if (idx > HFI_BUFFER_TYPE_MAX)
> +		if (idx >= HFI_BUFFER_TYPE_MAX)
>   			return HFI_ERR_SESSION_INVALID_PARAMETER;
>   
>   		req_bytes -= sizeof(struct hfi_buffer_requirements);

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
