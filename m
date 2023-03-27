Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 024D16C9E8B
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 10:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232866AbjC0IuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 04:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbjC0Itb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 04:49:31 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FF8AD29
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:45:52 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i13so10299717lfe.9
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679906738;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1vKxZD4uY+8xzaJ91LfecL8ep0yvr9IuwHztb6HOThc=;
        b=oJUWlmf5aBjtk58Izrpr0xINr6zH3yqRdhf/SRw+DbnaHIoqvZoglEIuEdjvUYSlgK
         yj5aMFd+z/Bgfn6EnEUKZDDSHuho5yXrATVKIAv3aFwq46x5hgGQlm0VFl9xa+kuW/H+
         K1d67eTkXv9pb01tA4D15WgLqK7NefRcPODLU0qEmFFm7cVY7lVXBAmAOLf9sz4xI+Bi
         Ohez4C6wCR0zuddRzBZ9HsTj2NE56eCBGFV0FVSbOYhHTUp2sgSBIGxKyMaWRTLIArZQ
         6Bujy5kl3EPR2I3HEkwMpqGFO3UHclGhF0Phba0402d4xaCdY3I6IPAbtZiQEZA+CDAv
         vWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906738;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vKxZD4uY+8xzaJ91LfecL8ep0yvr9IuwHztb6HOThc=;
        b=2jwlgQR0zAJUCchviIAgYpAQfhQjtHoV+0GR5QODQvynq19z1sbE6tp1MVz/kne/yv
         O0N6TZr5lo9qfYMX9yZebaPiVGldBj5DIIb727eN/EsQ3WQsqME8X9uiH8APVgyG0jAg
         fZ5fL+cIZ6A9wKkF61HL/Jd7BZW7KIoOcy4KXtOsDq5/mS0bt1ui/4JpLNawHAG/jYLe
         wtgFkU2OR+CYS+AcAZiZSJmQl6sOC3PrjoB1B4qjDaVPt1nzXt5MrP6aAQQHERAOIxBh
         7IVU90H3Wcp4Z7wJmQyQfFeNR6duk5a9JrkMfDTX/aLWR5qpcaJa+IJi4XqCAaa6cOT+
         rsVw==
X-Gm-Message-State: AAQBX9db9+UlCKiHsZMFxMLefyNbg86n399WO/OeKoETaeU/dMhGGwbg
        cwHszjLucqDXxTJdD4umTfkBYg==
X-Google-Smtp-Source: AKy350Z8aL1WJvTtsYWkT17l2/W33C47pumO65qP68QCcUcqLXSR1EhQ42yLQXCt7LxrXqnX8rSQEg==
X-Received: by 2002:a05:6512:25b:b0:4e9:7d60:7108 with SMTP id b27-20020a056512025b00b004e97d607108mr2862883lfo.53.1679906738711;
        Mon, 27 Mar 2023 01:45:38 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id l14-20020a05651c10ce00b002a11280db83sm2066214ljn.96.2023.03.27.01.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:45:38 -0700 (PDT)
Message-ID: <e1d70b0a-42da-bcf4-7d1c-d6bbc86b5b53@linaro.org>
Date:   Mon, 27 Mar 2023 10:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 043/117] media: venus: Warn only once about problems in
 .remove()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@pengutronix.de
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-46-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230326143224.572654-46-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 26.03.2023 16:31, Uwe Kleine-König wrote:
> The only effect of returning an error code in a remove callback is that
> the driver core emits a warning. The device is unbound anyhow.
> 
> As the remove callback already emits a (quite verbose) warning when ret
> is non-zero, return zero to suppress the additional warning.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/media/platform/qcom/venus/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 990a1519f968..403ffb92af60 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -448,7 +448,7 @@ static int venus_remove(struct platform_device *pdev)
>  	mutex_destroy(&core->lock);
>  	venus_dbgfs_deinit(core);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void venus_core_shutdown(struct platform_device *pdev)
