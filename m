Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAB365B37A9
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 14:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbiIIMVx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 08:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbiIIMVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 08:21:21 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D772C2A7
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 05:19:59 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id k10so2379296lfm.4
        for <linux-media@vger.kernel.org>; Fri, 09 Sep 2022 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=BUn8NXeYC9d7A6qTHVY9TyWaiwiTLNVZ7hIK/xjo1fo=;
        b=BMXRUx3OA9Prq5qDvD4SNiLLJwjkD0OlyhdQByteAIo1pv1vdTXh5H9K3LlGOGZZjl
         w+BDTOjTgruxqodsPt2OtaEkZEQIAk6YFUbkNsBWXzPcg31/fzVUlj/vNHv1BSdmGdyq
         +bmBcDMXPcuQ1eNxRIjEyLkB8cM2R04SqE27J0LZQId1Ql0gvIGl6Bp43PMIYZ++O2TC
         jIRN0kBHAwfzuuVbDVCpn6vxO+Y2u3apY3O7U6GWONG0sV7BpvrJl6BiUlq/fn6SPLGJ
         Thewnb4bPVt/6y1OcNVxAyrsbYcCGW+mfVqjB6PNoJ1t4ehG+C+zd4gtK63J+634j2UP
         +0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BUn8NXeYC9d7A6qTHVY9TyWaiwiTLNVZ7hIK/xjo1fo=;
        b=zc2eXApk39h8b82L47un6KKTBAtOP3ZCAHPrC1nsK+7DMjypDwtBUkeARqKCTlpWBN
         qSF82oQP/kMLqXMCXj/inoecP2UUaoKaA4qGu1j4DJOtwXRN+IaidShijzsPdBTdjSGp
         3UvWDZfGky9ND2Tpp7EdEO8o79lf2gEHNFA23HzGUv77AEhLWscdRpRe6Rt43aZ4kMI9
         pMrzPk7+hdIsmZH7KRN4B5y9PLzWLjMiymipMogyCz/w29jqU1rWKvhITvspTEJEzQGb
         at/WSos02/4L0J9/lYk8856rmfOsfs19PrpxGeG5m+DJpQhHq2dNNUeHVx6IAE93QvGY
         qMIQ==
X-Gm-Message-State: ACgBeo3BSY7r6hJ9HJJsWaWDDgsvppFMWyw2aEuV5+DRdGe/1q73Wsio
        4CT/NBq6QU45Gk8eTkI0hnYqJA==
X-Google-Smtp-Source: AA6agR6imYF7//TgI5j+s66OdUwGd+YWw5Efkbkwp4Nyzy4GCZTWQ7SYJKvOItK7uP2gjUvNJKLPaA==
X-Received: by 2002:a05:6512:22d2:b0:498:f68b:6cab with SMTP id g18-20020a05651222d200b00498f68b6cabmr1233111lfu.548.1662725998082;
        Fri, 09 Sep 2022 05:19:58 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id x21-20020a19f615000000b004945c1c5cccsm54174lfe.268.2022.09.09.05.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 05:19:57 -0700 (PDT)
Message-ID: <1f96d0c8-d1b2-6d87-e78e-a479beb49650@linaro.org>
Date:   Fri, 9 Sep 2022 15:19:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v2] media: camss: Do not attach an already attached power
 domain on MSM8916 platform
Content-Language: en-US
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Todor Tomov <todor.too@gmail.com>,
        Robert Foss <robert.foss@linaro.org>
References: <20220704220814.629130-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220704220814.629130-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/5/22 01:08, Vladimir Zapolskiy wrote:
> The change to dynamically allocated power domains neglected a case of
> CAMSS on MSM8916 platform, where a single VFE power domain is neither
> attached, linked or managed in runtime in any way explicitly.
> 
> This is a special case and it shall be kept as is, because the power
> domain management is done outside of the driver, and it's very different
> in comparison to all other platforms supported by CAMSS.
> 
> Fixes: 6b1814e26989 ("media: camss: Allocate power domain resources dynamically")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Gentle ping, it would be great to see this fix on media/fixes for 6.0.

> Changes from v1 to v2:
> * corrected the fixed commit id, which is found on media/master
> 
>   drivers/media/platform/qcom/camss/camss.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 932968e5f1e5..7a929f19e79b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1465,6 +1465,14 @@ static int camss_configure_pd(struct camss *camss)
>   		return camss->genpd_num;
>   	}
>   
> +	/*
> +	 * If a platform device has just one power domain, then it is attached
> +	 * at platform_probe() level, thus there shall be no need and even no
> +	 * option to attach it again, this is the case for CAMSS on MSM8916.
> +	 */
> +	if (camss->genpd_num == 1)
> +		return 0;
> +
>   	camss->genpd = devm_kmalloc_array(dev, camss->genpd_num,
>   					  sizeof(*camss->genpd), GFP_KERNEL);
>   	if (!camss->genpd)
> @@ -1698,6 +1706,9 @@ void camss_delete(struct camss *camss)
>   
>   	pm_runtime_disable(camss->dev);
>   
> +	if (camss->genpd_num == 1)
> +		return;
> +
>   	for (i = 0; i < camss->genpd_num; i++) {
>   		device_link_del(camss->genpd_link[i]);
>   		dev_pm_domain_detach(camss->genpd[i], true);

--
Best wishes,
Vladimir
