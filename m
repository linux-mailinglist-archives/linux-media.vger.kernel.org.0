Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8149978C22D
	for <lists+linux-media@lfdr.de>; Tue, 29 Aug 2023 12:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235077AbjH2KSO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 06:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235226AbjH2KSK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 06:18:10 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C6A2187
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 03:18:03 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fef56f7223so37735365e9.3
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 03:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693304281; x=1693909081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1ssAKWxR+FAoGENQI/f/XVJ/7MRGV6MLU9ZO88fUcE=;
        b=qbtYCrWbENeYLOxOm6A8TxmNYqKeekcRmELiD8drl6j0cFht8k2DBUEBlRjWXdMZd6
         sYdozD728E88MYFA5saYdpIwTH7igUnfdioK3SE40ZeTqCd6p6hnDuQFurf5MWK6uHh5
         zqfuFFyr96Mlp2St+4/fmzhkO5OuyAzy4Dbh/xx7NuIBiiRJdIqlMPM6NVWK4+5+4wxT
         LGURH2E/hMoXrzmpphqQJ5nqktoFd9D1PFnsgown6Liyd5V0q5BBXgFj++iBE2EaMOur
         +WqfYjmw08nSJ4ClrxgJZWlv5eQunnXdjaaEDXbjm2VLjx779W+FK0xC0XUDHCdTDMuY
         hyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693304281; x=1693909081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1ssAKWxR+FAoGENQI/f/XVJ/7MRGV6MLU9ZO88fUcE=;
        b=MvYnIggB6lg+mqX5t4OohFk1FO9aSRGcbTvA4Q63s9UIR0Z1mpvUzLz1zp2kNMQWlb
         0+TeXVsty9JimDhN/02uP+wRcT2vV5ROHflWSzbxzIrQ9+HoX1RfKRKNyK2Hvpi1vDiw
         W9HnVwk4NR30svVFn0H/tEIYkgBuF0O3W5nrlPm5Je6COVb/NYbbD8i0oQQGAkXqIwtC
         f69ec4q9VL/TZFJbvBDtbOkT96wzyYEUR1xGGFCF5k/5wupkOa409eWY/t5+BOaChLAy
         ocjRt84S5e5gHljB20dkY6nFfkHDIQes1MrZQV0EuB/kNcKfdXa2MT6b/5KsVFwKwhcl
         mhaw==
X-Gm-Message-State: AOJu0YyH3RgN3gTcbwT57IjJ4AEnDkHBBEvxg2a/C3XEmnhFcGpRQm9m
        Es9wTrmBAb9fx1feLb10dmO3Cw==
X-Google-Smtp-Source: AGHT+IHRsieMNwysX9pXfxTroPijAI7QED+e1zDUiqV4mgP4Zv8aAyuDlx4bAPpJTi5iNIknTKg0GQ==
X-Received: by 2002:a05:600c:44c:b0:3f9:255e:ee3b with SMTP id s12-20020a05600c044c00b003f9255eee3bmr21319600wmb.30.1693304281545;
        Tue, 29 Aug 2023 03:18:01 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l1-20020a5d4101000000b0031c6ae19e27sm13199271wrp.99.2023.08.29.03.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 03:18:01 -0700 (PDT)
Message-ID: <601817fd-fc94-1476-6bc0-f27ebcb652fd@linaro.org>
Date:   Tue, 29 Aug 2023 11:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Fix V4L2 async notifier error
 path
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230822200626.1931129-1-bryan.odonoghue@linaro.org>
 <20230822200626.1931129-3-bryan.odonoghue@linaro.org>
 <20230828170559.GW14596@pendragon.ideasonboard.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230828170559.GW14596@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/08/2023 18:05, Laurent Pinchart wrote:
> Hi Bryan,
> 
> Thank you for the patch.
> 
> On Tue, Aug 22, 2023 at 09:06:19PM +0100, Bryan O'Donoghue wrote:
>> Previously the jump label err_cleanup was used higher in the probe()
>> function to release the async notifier however the async notifier
>> registration was moved later in the code rendering the previous four jumps
>> redundant.
>>
>> Rename the label from err_cleanup to err_v4l2_device_register to capture
>> what the jump does.
> 
> Shouldn't it be named err_v4l2_device_unregister then ? As the
> err_register_subdevs label should also be renamed err_unregister_subdevs
> you could rename them all in a separate patch.
> 
>> Fixes: 51397a4ec75d ("media: qcom: Initialise V4L2 async notifier later")
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 75991d849b571..f4948bdf3f8f9 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -1617,21 +1617,21 @@ static int camss_probe(struct platform_device *pdev)
>>   
>>   	ret = camss_icc_get(camss);
>>   	if (ret < 0)
>> -		goto err_cleanup;
>> +		return ret;
>>   
>>   	ret = camss_configure_pd(camss);
>>   	if (ret < 0) {
>>   		dev_err(dev, "Failed to configure power domains: %d\n", ret);
>> -		goto err_cleanup;
>> +		return ret;
>>   	}
>>   
>>   	ret = camss_init_subdevices(camss);
>>   	if (ret < 0)
>> -		goto err_cleanup;
>> +		return ret;
>>   
>>   	ret = dma_set_mask_and_coherent(dev, 0xffffffff);
>>   	if (ret)
>> -		goto err_cleanup;
>> +		return ret;
> 
> This doesn't seem right, you should call v4l2_async_nf_cleanup() when
> v4l2_async_nf_init() has been called, and that's done before
> camss_icc_get().

Ah no, after 51397a4ec75d ("media: qcom: Initialise V4L2 async notifier 
later") the behaviour changes.

-       v4l2_async_nf_init(&camss->notifier);
-
-       num_subdevs = camss_of_parse_ports(camss);
-       if (num_subdevs < 0) {
-               ret = num_subdevs;
-               goto err_cleanup;
-       }
-
         ret = camss_icc_get(camss);
         if (ret < 0)
                 goto err_cleanup;
@@ -1648,9 +1640,17 @@ static int camss_probe(struct platform_device *pdev)
                 goto err_cleanup;
         }

+       v4l2_async_nf_init(&camss->notifier);
+
+       num_subdevs = camss_of_parse_ports(camss);
+       if (num_subdevs < 0) {
+               ret = num_subdevs;
+               goto err_cleanup;
+       }


This patch is still a good opportunity to fix the jump labels for 
example genpd which you mentioned earlier.

---
bod

