Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0FC52C33B
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 21:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241886AbiERTV4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 15:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241839AbiERTVz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 15:21:55 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A83146429
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 12:21:53 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id a23so3670978ljd.9
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 12:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qZ26mcBQDZSLiRufaECwZ6oiziPAQxL7V+fcgunGTxg=;
        b=aidLyug1DNbEWTzG8AgJcm9OTAYxyiW5rweO1JVUz/v6XPYK/cN20nISmy/hKzIBiw
         HeTZ58cgZ8awu6MOzESGfR+4CcasU2CYQNkNkUHTPRy37/U6Lbaf8V+Twyd/tlBQ7qDA
         nDhT2l//1iEqz1/WHSuIGw5oOOHqXPjylgsC4qNO33HlnhnTDrQulZfX5mANVHhB0mnb
         pDAGYBY1hXAN+aFxPITKYwwuWRFLfOeqIkyPJxBJgK/F2GZZKH6PPgPF6uGUirLb/FXz
         XTRn4lLAD3Bb8p9q54losG1V+biQmf0OBc+VSJo/KpO1Jd2PPOwZsoKSLbCj2tFB3xlv
         BxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qZ26mcBQDZSLiRufaECwZ6oiziPAQxL7V+fcgunGTxg=;
        b=L62emVdar7M0WHAEcG6Pr6UUibgaKl+OVP88UL/r1ZoK9QkAI547aAiEzW4Fvh3T/n
         ruNGA60y/AXZUapn3tA6QCcgUIBzSYjhnhIOnnIQKTlLlRoKwyXUw8Rqe51xtzmj36Za
         T1xHE066f17LLmec5JbyyMy0d3LDIE+kSe8FUxRpYCayFodmbADhs8QaUwvDKPStfBxq
         6lFWUlV+bbUEz7m4p3yt4oEuu6mQ5sul+BflOHZaB5g99hi3Za/Qry7ALPvSGOpK5gxf
         4koMFpEQzP0TSGq9uPGerskwYjuf0lhgcLe7zABuElnHqLd7w9MxX9q+TmuNf5afWLX7
         pLAw==
X-Gm-Message-State: AOAM532xghmTqyjtih2/A2v68p4qu1TjtEWQLwgtwUtnwj2CRomyAzbQ
        0jNK6EiBYBny+n6wxsINdywXpA==
X-Google-Smtp-Source: ABdhPJyCgcKtuQzRAFdToUxmBdUBiSg/dAyL5VJc0LcDBiTIR8b5L46jJhQ2mvP/6dqNQ0dUJwASuw==
X-Received: by 2002:a2e:b98b:0:b0:24f:1b64:a7b7 with SMTP id p11-20020a2eb98b000000b0024f1b64a7b7mr483732ljp.331.1652901712157;
        Wed, 18 May 2022 12:21:52 -0700 (PDT)
Received: from [192.168.1.102] (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id f26-20020a19ae1a000000b0047255d211cesm30150lfc.253.2022.05.18.12.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 12:21:51 -0700 (PDT)
Message-ID: <0c1a180b-b46a-308e-a7bd-1168009e3e27@linaro.org>
Date:   Wed, 18 May 2022 22:21:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] media: camss: Allocate camss struct as a managed device
 resource
Content-Language: en-US
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220513080529.416245-1-vladimir.zapolskiy@linaro.org>
 <CAG3jFyuupy=rcY3Nsg=n52t_JZ1ePDW28RGMi=2Lzdx6LNRetA@mail.gmail.com>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAG3jFyuupy=rcY3Nsg=n52t_JZ1ePDW28RGMi=2Lzdx6LNRetA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On 5/18/22 21:46, Robert Foss wrote:
> Hey Vladimir,
> 
> On Fri, 13 May 2022 at 10:05, Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> The change simplifies driver's probe and remove functions, no functional
>> change is intended.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>> The change is supposed to be applied on top of this one:
>>
>>    https://lore.kernel.org/linux-media/20220512082318.189398-1-vladimir.zapolskiy@linaro.org/
>>
>> drivers/media/platform/qcom/camss/camss.c | 33 +++++++----------------
>>   1 file changed, 10 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index e90fea28ac88..0f4908fa21e2 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -1751,7 +1751,7 @@ static int camss_probe(struct platform_device *pdev)
>>          struct camss *camss;
>>          int num_subdevs, ret;
>>
>> -       camss = kzalloc(sizeof(*camss), GFP_KERNEL);
>> +       camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
>>          if (!camss)
>>                  return -ENOMEM;
>>
>> @@ -1795,39 +1795,30 @@ static int camss_probe(struct platform_device *pdev)
>>                  camss->csid_num = 5;
>>                  camss->vfe_num = 5;
>>          } else {
>> -               ret = -EINVAL;
>> -               goto err_free;
>> +               return -EINVAL;
>>          }
>>
>>          camss->csiphy = devm_kcalloc(dev, camss->csiphy_num,
>>                                       sizeof(*camss->csiphy), GFP_KERNEL);
>> -       if (!camss->csiphy) {
>> -               ret = -ENOMEM;
>> -               goto err_free;
>> -       }
>> +       if (!camss->csiphy)
>> +               return -ENOMEM;
>>
>>          camss->csid = devm_kcalloc(dev, camss->csid_num, sizeof(*camss->csid),
>>                                     GFP_KERNEL);
>> -       if (!camss->csid) {
>> -               ret = -ENOMEM;
>> -               goto err_free;
>> -       }
>> +       if (!camss->csid)
>> +               return -ENOMEM;
>>
>>          if (camss->version == CAMSS_8x16 ||
>>              camss->version == CAMSS_8x96) {
>>                  camss->ispif = devm_kcalloc(dev, 1, sizeof(*camss->ispif), GFP_KERNEL);
>> -               if (!camss->ispif) {
>> -                       ret = -ENOMEM;
>> -                       goto err_free;
>> -               }
>> +               if (!camss->ispif)
>> +                       return -ENOMEM;
>>          }
>>
>>          camss->vfe = devm_kcalloc(dev, camss->vfe_num, sizeof(*camss->vfe),
>>                                    GFP_KERNEL);
>> -       if (!camss->vfe) {
>> -               ret = -ENOMEM;
>> -               goto err_free;
>> -       }
>> +       if (!camss->vfe)
>> +               return -ENOMEM;
>>
>>          v4l2_async_nf_init(&camss->notifier);
>>
>> @@ -1909,8 +1900,6 @@ static int camss_probe(struct platform_device *pdev)
>>          v4l2_device_unregister(&camss->v4l2_dev);
>>   err_cleanup:
>>          v4l2_async_nf_cleanup(&camss->notifier);
>> -err_free:
>> -       kfree(camss);
>>
>>          return ret;
>>   }
>> @@ -1929,8 +1918,6 @@ void camss_delete(struct camss *camss)
>>                  device_link_del(camss->genpd_link[i]);
>>                  dev_pm_domain_detach(camss->genpd[i], true);
>>          }
>> -
>> -       kfree(camss);
>>   }
>>
>>   /*
>> --
>> 2.33.0
>>
> 
> I'm  having issues applying this patch to upstream/master or
> upstream-media/master, even when first applying the patch you
> mentioned above.

you are right, there is a minor conflict in the second patch hunk...

Please let me know a preferred branch/tag to use as the base, and
I'll resend v2 of the change shortly, thank you in advance!

--
Best wishes,
Vladimir
