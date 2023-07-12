Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD617503DA
	for <lists+linux-media@lfdr.de>; Wed, 12 Jul 2023 11:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbjGLJuh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jul 2023 05:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233191AbjGLJue (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jul 2023 05:50:34 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D665B1994
        for <linux-media@vger.kernel.org>; Wed, 12 Jul 2023 02:50:28 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so72730455e9.2
        for <linux-media@vger.kernel.org>; Wed, 12 Jul 2023 02:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689155427; x=1691747427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDLl7N6iOSv4y2UNRlUrhwDMQ6zi5QYkOLDM/VqBWRY=;
        b=w9d5GrFLFCoTstxsHOxlhqo/yha4f4p32y9TXodqZSSxwDujNRDl5umxgBzfoGdiSI
         yNC0iHAB4Xk4CAMQZo0z9ylUrvOAf4sw7UR8NHQPdKmpYSk3iKhN+ffjR3VJo3yfQd1d
         2qC73ay2slCOhXYPuwdgOz7GGhrdXBK4UBt9peU+pR1HwYSsiRG49zSPBtUb9be2vQYa
         N2+axpGwyrkDdrATsnaxJNN+I14W5Q42DxyYSdyDT/wgVvqs348MZuuAaFkwCn6g8wTc
         RDYOjGCRPF41ip7MLlJwv0yLMf1zDtATdc6HvFsVy/uq9sE+FCcnFm0DeXCTIixry7eh
         Wvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689155427; x=1691747427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDLl7N6iOSv4y2UNRlUrhwDMQ6zi5QYkOLDM/VqBWRY=;
        b=PwH8xjsuVcyctvDha6jx0LLkDFhf93Crwal6x8eXQgmCfbca00EK71Llj77JeX6tPk
         hnWi4L9aK4cbiLR9gXNG7V4FGGQdhyVuQtlM/M3IMYcsDvxMHZBIbID8HYZwSIRQpsNb
         Yign6z6c1pG9OjklJoQk7qm6+L4g+8k7hoJMCicxHLBVZMDkYZgVzTSRWxCvRw0utMJE
         x+GfBtY3qSEIxm/3PxFfnoDwhA7AheE688X1IvwHjvKhcM5XhXuZRcILkYJpw353GjA3
         VSjQbSEesLEbYbA9JlcLO6ojBaHSzQSSFPfCRkGnAV2v1JhILqgwtxrv5lMzRLgQf1WG
         M4XA==
X-Gm-Message-State: ABy/qLaQEtPN9LQQSrvSMWBPFKV8xExu0fh104aIX6UK0c/NlwgHK5xh
        YY03XSj0pKvpXW12GuiGfps6Ug==
X-Google-Smtp-Source: APBJJlGiavtnYkAOBeJMkeW+URsKlQtTYOUF8TITqpkgTcPLRi8xCUl4VRxsbeG91n1Qvbnds+IwTg==
X-Received: by 2002:adf:fe01:0:b0:315:ac1b:91e with SMTP id n1-20020adffe01000000b00315ac1b091emr1931523wrr.53.1689155427018;
        Wed, 12 Jul 2023 02:50:27 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3-20020a5d4f03000000b00311d8c2561bsm4554831wru.60.2023.07.12.02.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 02:50:26 -0700 (PDT)
Message-ID: <2abbae30-f92e-33e4-5509-8979129da665@linaro.org>
Date:   Wed, 12 Jul 2023 10:50:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: venus: Fix firmware path for sm8250
Content-Language: en-US
To:     Patrick Whewell <patrick.whewell@sightlineapplications.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        William Gray <william.gray@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230711185330.10106-1-patrick.whewell@sightlineapplications.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230711185330.10106-1-patrick.whewell@sightlineapplications.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/07/2023 19:53, Patrick Whewell wrote:
> The firmware path for the sm8250 resources is incorrect. This fixes the
> path to address the firmware correctly.
> 
> Signed-off-by: Patrick Whewell <patrick.whewell@sightlineapplications.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 2ae867cb4c48..348085f8fc9c 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -814,7 +814,7 @@ static const struct venus_resources sm8250_res = {
>   	.vmem_size = 0,
>   	.vmem_addr = 0,
>   	.dma_mask = 0xe0000000 - 1,
> -	.fwname = "qcom/vpu-1.0/venus.mdt",
> +	.fwname = "qcom/vpu-1.0/venus.mbn",
>   };
>   
>   static const struct freq_tbl sc7280_freq_table[] = {

Is the policy not to stick with .mdt for existing platforms but use .mbn 
for new platforms.

https://lore.kernel.org/all/CALAqxLU1gjTY95+phBt=WksyguZuKpNKa6aYaJTe0GeCAg6WrA@mail.gmail.com/T/

Its a symlink for me but, is it a symlink for everybody ?

root@linaro-gnome:~# ls /lib/firmware/qcom/vpu-1.0/ -l
lrwxrwxrwx 1 root root       9 Dec  2  2022 venus.mdt -> venus.mbn

---
bod
