Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A047373009A
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 15:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245238AbjFNNv3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 09:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245197AbjFNNvZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 09:51:25 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B36268A
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 06:51:01 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f762b3227dso1394641e87.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686750660; x=1689342660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOIXfmRnx769aI0E7UjcgziLzQIefiUm7yVyqk4c9T8=;
        b=fOC0cvyssD5iXPh9inqQOD0HhXmOuMj+Aexa6IG6CxwMfxrtZn7kChdNBTM/U3nlnZ
         5SX8/Oa15Cw4ipPsZa1tvR8xiOCcjZNhy2YN/+Cp89VFRdm8YP/MsVUVCM7cNoibQEsh
         0Jfo2okHh8HSk4nlOaKZpDLX2EQ4PN3QsMxFC+jNUS/UznXM8t5dn3RiPNM4AwD4scxu
         ac3tDX+Kx1dZUSnksjeL6hUFAWDSBttikTzUBDq/6zU3Pi/xnLTosSmsyH/tlfM2Ix4V
         0ogKRBtnPJZ/vEtL+xZeit/7HPqWC98SwkUI/CFxf4a89/E8R0CvIByVf2WcvZ+S7anU
         yd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686750660; x=1689342660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOIXfmRnx769aI0E7UjcgziLzQIefiUm7yVyqk4c9T8=;
        b=fGLtOrr12TvU68IygvLixd5qYa7hPlImZZv9WWgueYF+92JegCT7el8AiHtTTZMihv
         uTI+u1ivkyFuvtfHXcggqBGjgJRvwNMuipilfGx5wSzlEsw7cHhRQwNeiisfj+4k2nvL
         noM5KX72FDMluZePsT/kW5QSDG/JJbli/myMkNrwO9+aKcQGEHkZYw5z4K/yWMLBY4hI
         1FJSjEolBY/AduZ91wgwNpEz/QywdtRjcySIiIo0zdqQHaYdfYaivIceidFfE/uI0lHl
         74kv0YUhutqUMLwdakV9se4svgR++dY4lnXAWhrfG/EFL+psI3aUN0JqTowoj/PfSek5
         4sJQ==
X-Gm-Message-State: AC+VfDxO0He8bE/7uYa+qNUW8bb8zwjLWizlgnG2e++Ee1RokRy+vvpu
        vEcihjPcMCdI1fAAyQ4IDfY+/g==
X-Google-Smtp-Source: ACHHUZ6WFpedESV5dgbMMh0G/LhPlKdm+KgjJs+wJiffzsuVP0ZkCW2LrXfAtW6X+bCkKGPOl6QP+Q==
X-Received: by 2002:a19:4f46:0:b0:4f6:2368:3eca with SMTP id a6-20020a194f46000000b004f623683ecamr729172lfk.0.1686750659978;
        Wed, 14 Jun 2023 06:50:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id w1-20020ac254a1000000b004f64409eef4sm2138775lfk.253.2023.06.14.06.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 06:50:59 -0700 (PDT)
Message-ID: <efe0b912-24d8-9617-ce6a-aca5dfba6910@linaro.org>
Date:   Wed, 14 Jun 2023 15:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH RFC] media: camss: Intepret OF graph connections more
 sensibly
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230614-topic-camss_grpah-v1-1-5f4b516310fa@linaro.org>
 <8f53da6d-76ec-a7e1-8308-b676930d224c@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <8f53da6d-76ec-a7e1-8308-b676930d224c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14.06.2023 15:48, Bryan O'Donoghue wrote:
> On 14/06/2023 14:22, Konrad Dybcio wrote:
>> Not all endpoints of camss have to be populated. In fact, most of the
>> time they shouldn't be as n-th auxilliary cameras are usually ewaste.
>>
>> Don't fail probing the entire camss even even one endpoint is not
>> linked and throw an error when none is found.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 1ef26aea3eae..3aa03fbc94e2 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -1084,9 +1084,8 @@ static int camss_of_parse_ports(struct camss *camss)
>>             remote = of_graph_get_remote_port_parent(node);
>>           if (!remote) {
>> -            dev_err(dev, "Cannot get remote parent\n");
>> -            ret = -EINVAL;
>> -            goto err_cleanup;
>> +            of_node_put(node);
>> +            continue;
>>           }
>>             csd = v4l2_async_nf_add_fwnode(&camss->notifier,
>> @@ -1105,7 +1104,7 @@ static int camss_of_parse_ports(struct camss *camss)
>>           num_subdevs++;
>>       }
>>   -    return num_subdevs;
>> +    return num_subdevs ? num_subdevs : -EINVAL;
>>     err_cleanup:
>>       of_node_put(node);
>>
>> ---
>> base-commit: b16049b21162bb649cdd8519642a35972b7910fe
>> change-id: 20230614-topic-camss_grpah-39f9a4f7420c
>>
>> Best regards,
> 
> Can you give an example of the DT that is causing this ?
None upstream (8916 has a single port and 845c's sec camera has
never been enabled), but it's easy to spot if you leave csiphy0_ep
unoccupied and add something to csiphyN_ep for N>=1

Konrad
> 
> ---
> bod
