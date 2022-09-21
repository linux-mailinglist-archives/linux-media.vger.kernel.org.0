Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7608D5C03E3
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 18:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbiIUQQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 12:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbiIUQQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 12:16:28 -0400
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56485A98E5
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 09:01:26 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id y5so10655069wrh.3
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 09:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Zf6orjlsf/V2mH9HL0+BjQ0JuIZJlfhjkfJLThDjoTw=;
        b=fo5kxf4JTtRSewAvH8DkBZdrlRELHl/lGsfpSTKDOk1zyk6Ioid08oh4Fsyv31Hp6b
         esMoMIJpyF4PmcLA8g8aqKYuxQmpMzFz+j2Ywwx4qq4iP5/Cjxjr67CSD2l7Hg3TH+bB
         uggqwbY6l8UPn7VMYb1peDtKAkX7DhppHBKqAbaQ/ucx/OEGHcmMy4sS57S1iepzUYcL
         Ooi0P6gzmL7t45sVwJ/ozfgvAP1wORRKQDWzQ0Nkr6TL3rShnMEinv/xK5QMOemQg56A
         XWV9n0UB5bWsYPcy3+SCMd/c1NDJEcg6jQXcSEQU5OctqUTjZO7/QaM3YTytirOcSggU
         mVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Zf6orjlsf/V2mH9HL0+BjQ0JuIZJlfhjkfJLThDjoTw=;
        b=1ir1Pmbk3aplwd76e2wnz4KqAPm46IbfhiMxfECxfD4Eo1bni/QHVAjPSe2GooNB7u
         Y/Zdt8vYOqxI/vogvMkd3EsYYAhP+qgO27lY0pGFBFtnnpDsfMYdvvDAzzhacZa6uWjj
         bXSKlB9F36rTaUFg1qKQe9ZfjhhQkwpxvR/UjjJ3IYOBy1X1bF5+HUT0R55lBY4RIwBn
         /NEteq4HZLXOcLa/6HGEAukw3MD5fyEcOmda42CIKOsx2QRYYE5y3vfm2pkoSe6ssGuy
         HMeJXLKEIb3d0npoky3H9NFjEoLhscKw0xvOXiYduATq4CKfz6bl5JWGDQ+YfF/aPIAI
         ySGA==
X-Gm-Message-State: ACrzQf1FQpRPWCjpB3e+F31o5wdUaHu3M+LqzmbfBJ4WLkGA0RJ2io7V
        QVCVufSK3eFU4Xs6UIy2Cb9LqA==
X-Google-Smtp-Source: AMsMyM5eAErvFTDpQ2lb0e8xWVApArWW3Mm2yukAN3ouS79PDwCxrOvKZv+atHcIKabjrVF7bImVAQ==
X-Received: by 2002:a5d:59a7:0:b0:22a:47e3:a1b with SMTP id p7-20020a5d59a7000000b0022a47e30a1bmr17412464wrr.319.1663775718664;
        Wed, 21 Sep 2022 08:55:18 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o8-20020a5d58c8000000b0022b1d74dc56sm2839107wrf.79.2022.09.21.08.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 08:55:18 -0700 (PDT)
Message-ID: <889049dd-2cd9-ee25-c5f5-a8a7e503a3e9@linaro.org>
Date:   Wed, 21 Sep 2022 16:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] media: camss: vfe-480: Multiple outputs support for
 SM8250
Content-Language: en-US
To:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mchehab@kernel.org
References: <20220921141012.1709-1-quic_mmitkov@quicinc.com>
 <20220921141012.1709-4-quic_mmitkov@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220921141012.1709-4-quic_mmitkov@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/09/2022 15:10, quic_mmitkov@quicinc.com wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> 
> On SM8250 each VFE supports at least 3 RDI channels, or 4
> in case of VFE-Lite, so add appropriate IRQ setup and handling.
> 
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-vfe-480.c | 60 ++++++++++++-------
>   1 file changed, 39 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> index 129585110393..04272d085e5b 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
> @@ -94,6 +94,8 @@ static inline int bus_irq_mask_0_comp_done(struct vfe_device *vfe, int n)
>   #define RDI_WM(n)			((IS_LITE ? 0 : 23) + (n))
>   #define RDI_COMP_GROUP(n)		((IS_LITE ? 0 : 11) + (n))
>   
> +#define MAX_VFE_OUTPUT_LINES	4
> +
>   static u32 vfe_hw_version(struct vfe_device *vfe)
>   {
>   	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
> @@ -171,12 +173,25 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>   
>   static void vfe_enable_irq_common(struct vfe_device *vfe)
>   {
> -	/* enable only the IRQs used: rup and comp_done irqs for RDI0 */
> +	/* enable reset ack IRQ and top BUS status IRQ */
>   	writel_relaxed(IRQ_MASK_0_RESET_ACK | IRQ_MASK_0_BUS_TOP_IRQ,
>   		       vfe->base + VFE_IRQ_MASK(0));
> -	writel_relaxed(BUS_IRQ_MASK_0_RDI_RUP(vfe, 0) |
> -		       BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(0)),
> -		       vfe->base + VFE_BUS_IRQ_MASK(0));
> +}
> +
> +static void vfe_enable_lines_irq(struct vfe_device *vfe)
> +{
> +	u32 bus_irq_mask;
> +	int i;
> +
> +	for (i = 0; i < MAX_VFE_OUTPUT_LINES; i++) {
> +		/* Enable IRQ for newly added lines, but also keep already running lines's IRQ */
> +		if (vfe->line[i].output.state == VFE_OUTPUT_RESERVED ||
> +		    vfe->line[i].output.state == VFE_OUTPUT_ON)
> +			bus_irq_mask |= BUS_IRQ_MASK_0_RDI_RUP(vfe, i)
> +					| BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i));

A multi-line should be enclosed with {}

if (vfe->line[i].output.state == VFE_OUTPUT_RESERVED ||
     vfe->line[i].output.state == VFE_OUTPUT_ON) {
	bus_irq_mask |= BUS_IRQ_MASK_0_RDI_RUP(vfe, i)
			| BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i));
}

---
bod
