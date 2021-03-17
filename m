Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1BA33EE06
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 11:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhCQKGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 06:06:07 -0400
Received: from a0.mail.mailgun.net ([198.61.254.59]:42297 "EHLO
        a0.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbhCQKFf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 06:05:35 -0400
X-Greylist: delayed 340 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Mar 2021 06:05:34 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615975534; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=B6rCIClG88WIX0070GF43o2RDQ87mELfqaJlTc0lXQU=;
 b=utRPdKdElSH/XPZ3WS7eAq11v6JrHLhzae0PFOTanZKanMyzA+USwY2udVlCJbQwzFcfp06B
 MqYs2t4Ncp7N173k3VR+KfIllkEQKZemYUiEr1xGB/P6a70D8v7pRP/QS5IFPm6SMiP/YvI3
 y8WhyyE7fCm2dzJX9CA9UG/XEfU=
X-Mailgun-Sending-Ip: 198.61.254.59
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6051d3175d70193f88901656 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Mar 2021 09:59:51
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B0F56C4346A; Wed, 17 Mar 2021 09:59:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D661C43463;
        Wed, 17 Mar 2021 09:59:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 17 Mar 2021 15:29:47 +0530
From:   dikshita@codeaurora.org
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: Re: [PATCH v2 21/25] media: venus: helpers: Add internal buffer list
 for v6
In-Reply-To: <20210312173039.1387617-22-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
 <20210312173039.1387617-22-bryan.odonoghue@linaro.org>
Message-ID: <e0fac30ba39f35abff9262fa9538f790@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-03-12 23:00, Bryan O'Donoghue wrote:
> From: Dikshita Agarwal <dikshita@codeaurora.org>
> 
> - Internal buffers required by v6 are different than v4,
>   add new list of internal buffers for v6.
> - Differentiate encoder/decoder buffers for 6xx
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c    | 13 ++++++++++++-
>  drivers/media/platform/qcom/venus/hfi_helper.h |  9 ++++++---
>  2 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c
> b/drivers/media/platform/qcom/venus/helpers.c
> index 2515a2225614..8b08632b0296 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -279,13 +279,24 @@ static const unsigned int intbuf_types_4xx[] = {
>  	HFI_BUFFER_INTERNAL_PERSIST_1,
>  };
> 
> +static const unsigned int intbuf_types_6xx[] = {
> +	HFI_BUFFER_INTERNAL_SCRATCH(HFI_VERSION_6XX),
> +	HFI_BUFFER_INTERNAL_SCRATCH_1(HFI_VERSION_6XX),
> +	HFI_BUFFER_INTERNAL_SCRATCH_2(HFI_VERSION_6XX),
> +	HFI_BUFFER_INTERNAL_PERSIST,
> +	HFI_BUFFER_INTERNAL_PERSIST_1,
> +};
> +

Hi Bryan,

this change will require additional handling in hfi_plat_buf_v6.c to
return buffer_size as 0 for internal buffer type which is not applicable 
for
encoder or decoder, currently we return -EINVAL for the same.

Thanks,
Dikshita

>  int venus_helper_intbufs_alloc(struct venus_inst *inst)
>  {
>  	const unsigned int *intbuf;
>  	size_t arr_sz, i;
>  	int ret;
> 
> -	if (IS_V4(inst->core)) {
> +	if (IS_V6(inst->core)) {
> +		arr_sz = ARRAY_SIZE(intbuf_types_6xx);
> +		intbuf = intbuf_types_6xx;
> +	} else if (IS_V4(inst->core)) {
>  		arr_sz = ARRAY_SIZE(intbuf_types_4xx);
>  		intbuf = intbuf_types_4xx;
>  	} else {
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h
> b/drivers/media/platform/qcom/venus/hfi_helper.h
> index 6b524c7cde5f..f367f43c9fb7 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -395,11 +395,14 @@
>  #define HFI_BUFFER_INTERNAL_PERSIST		0x4
>  #define HFI_BUFFER_INTERNAL_PERSIST_1		0x5
>  #define HFI_BUFFER_INTERNAL_SCRATCH(ver)	\
> -	(((ver) == HFI_VERSION_4XX) ? 0x6 : 0x1000001)
> +	(((ver) == HFI_VERSION_4XX ||		\
> +	(ver) == HFI_VERSION_6XX) ? 0x6 : 0x1000001)
>  #define HFI_BUFFER_INTERNAL_SCRATCH_1(ver)	\
> -	(((ver) == HFI_VERSION_4XX) ? 0x7 : 0x1000005)
> +	(((ver) == HFI_VERSION_4XX ||		\
> +	(ver) == HFI_VERSION_6XX) ? 0x7 : 0x1000005)
>  #define HFI_BUFFER_INTERNAL_SCRATCH_2(ver)	\
> -	(((ver) == HFI_VERSION_4XX) ? 0x8 : 0x1000006)
> +	(((ver) == HFI_VERSION_4XX ||		\
> +	(ver) == HFI_VERSION_6XX) ? 0x8 : 0x1000006)
>  #define HFI_BUFFER_EXTRADATA_INPUT(ver)		\
>  	(((ver) == HFI_VERSION_4XX) ? 0xc : 0x1000002)
>  #define HFI_BUFFER_EXTRADATA_OUTPUT(ver)	\
