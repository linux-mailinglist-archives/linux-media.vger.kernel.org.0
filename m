Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCB07BB4F4
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 12:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbjJFKNm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 06:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbjJFKNl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 06:13:41 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0969EA
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 03:13:38 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3214cdb4b27so1861360f8f.1
        for <linux-media@vger.kernel.org>; Fri, 06 Oct 2023 03:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696587217; x=1697192017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5ZiMUDCBG5q+dOhucBT4pqBcaD3QFKz8YWmZyOxDh4=;
        b=QWGCesHJCPcvpDWc/cLY4vaeOHFuou15GOuLmEkfmfvaKTsV78pqhWsGDmrTWr27DN
         h1f3ggP7Zp8qrN4ReBNEio7bznXgirXgI3u7K312lcGz6uQi0EjOfDMgPgl2Yy+RXcsw
         9G0XBbvP9J+QMBntIGv/clJV27qDbxjMzf6xcE+9QUv02w4HOeFqbwGcf5MRdP+il8Et
         havWXtps3DhHJHpinQVF85eLjHt4cf7pPZVGciC4mx5NFcDwRenGUTkaC1KPpLdw+0XE
         xCeVmUZUHveeliocMEFGiPSuIMU9TSjOoDMZumWmyABQvBlGjckFVTdMrSzpgFqlIxI3
         6Uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696587217; x=1697192017;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5ZiMUDCBG5q+dOhucBT4pqBcaD3QFKz8YWmZyOxDh4=;
        b=aPHz/qXfy8bzX9T4CO0XmAGPk4jQJ/ntzmdjfP4lb9nSjZbMYIuyunmSFuD7Lsm9LK
         vUs98FmPsOiFuN0kdTQQGbspPzZs2ZG2BLcUMBUgljyH1ddw1J9im2gO/nuc3aExXf+X
         xwlMb+lsM9qSSrR/USKwo0XutURgv1RhzH/q4EdxIl1Q0mCyT3sk3jzb1acaQ4s0h7e3
         LDpp/QAdloDhfozlBw9QLKMAbeVkDVGB16HqY/y9/SbJLPckLC2iN325j3SrO8W7PNfc
         eVqzdpihulwzqM9qDnyfOT4t3Vkdp4/+H+kQiMJfzlL2rBdUYEDkiwt8XR60RLmN1uQw
         KDWg==
X-Gm-Message-State: AOJu0YyKDvyFTNLMjA6FeL7jVmbmvWwuagO8HO4xNkaVB76fXin8kKOo
        Lv/l/X1A9mUJegBJT/tkzirw3Q==
X-Google-Smtp-Source: AGHT+IEgKVlQn0MpuB6kGWJfiTaeEec0q7RiFC/D89MW3PVSim/8c/17pVEMbUnQmFBkOI1LIrwfCg==
X-Received: by 2002:a5d:4b92:0:b0:31f:ea3d:f93 with SMTP id b18-20020a5d4b92000000b0031fea3d0f93mr7305536wrt.40.1696587217011;
        Fri, 06 Oct 2023 03:13:37 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l1-20020a5d4bc1000000b00323287186b2sm1287582wrt.29.2023.10.06.03.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 03:13:36 -0700 (PDT)
Message-ID: <87ddd6ea-e219-43c9-8157-e15ac8ae448b@linaro.org>
Date:   Fri, 6 Oct 2023 11:13:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] media: qcom: venus: fix incorrect return value
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
 <aca1fc4a0f8b503e77365bd7d7d06d2dfa2d7d91.1696586632.git.hverkuil-cisco@xs4all.nl>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aca1fc4a0f8b503e77365bd7d7d06d2dfa2d7d91.1696586632.git.hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/10/2023 11:08, Hans Verkuil wrote:
> 'pd' can be NULL, and in that case it shouldn't be passed to
> PTR_ERR. Fixes a smatch warning:
> 
> drivers/media/platform/qcom/venus/pm_helpers.c:873 vcodec_domains_get() warn: passing zero to 'PTR_ERR'
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> CC: Vikash Garodia <quic_vgarodia@quicinc.com>
> CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/pm_helpers.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 48c9084bb4db..a1b127caa90a 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -870,7 +870,7 @@ static int vcodec_domains_get(struct venus_core *core)
>   		pd = dev_pm_domain_attach_by_name(dev,
>   						  res->vcodec_pmdomains[i]);
>   		if (IS_ERR_OR_NULL(pd))
> -			return PTR_ERR(pd) ? : -ENODATA;
> +			return pd ? PTR_ERR(pd) : -ENODATA;
>   		core->pmdomains[i] = pd;
>   	}
>   

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
