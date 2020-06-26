Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7CA20B6B1
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 19:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgFZRQU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 13:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgFZRQT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 13:16:19 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F0CC03E979
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 10:16:19 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id q17so4903329pfu.8
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=oELsdD79HY1hHlOXofDl6Fvlehf2Gye5Ag05RctGylg=;
        b=K+thiFk8hfqCSu6f0PTYVqmqgpNbc1kv86ri43WtUpeYDltLUQTwGzuD+wpx6o9Eri
         E3dMjXqLIq8sMZvbLqIiazWe6wjmPk4HGicMGlpuNq/Z/q7xphmmbsBrt6JcvLPqivlK
         rghSWt8rx0RIpYsVuuKBJw21WpEHt8sGVzh2+M4vsKfrWzX7asTgX++FdaPdjcGzB8hG
         BXPE6/BxSNIP4qBHSAKpidVqdmorfIN1T0fCswD/m6id7wJQnQDhegL5BntbNoyU9oK1
         /zqaS8ODPUEfgcGOrDXGJ46UZIBmThrmsY54msITFNgrC96KVrtRNf6HC6z3+bsyX7uA
         Rpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=oELsdD79HY1hHlOXofDl6Fvlehf2Gye5Ag05RctGylg=;
        b=JDPMIL9mESyTGMfo7r1KazIgtNA+b/cyONeW5zZBoPcNFVs33nHy69eE3f4OH7bfah
         Iqa53aoEdNf3g7Ss7EGUF3+nUcSMQSGPVQDhZ7LMaRuSCjTNJlUt309Q3dIHaONH3jsG
         DnNu3QDzdxLTglza5nbo2m33wGLKKI+Lg7u6t5gdFn1rPY2E+6iPVER6EoI/NlVfZl0b
         cj2xMKgp3SmptXEt/uEaoDHS3B146OVqBSkqd8qcEgBUokR5zQo0RLyRkXUU/JgEicua
         fI4QCLWJPb0qGbA1ayAVn7i8h8R86KwFY7luJgRmeJ2Zi7nRJ/2v6M8gtvMCUEfnFunO
         rNXA==
X-Gm-Message-State: AOAM530AGuSh4SUjYeWpihPKWWlJZ/qp0+aOjHDELOV1ZeYPH5tfz0dI
        9uKv8pGWGEobNcS8ZZEXHQA0ZGnN
X-Google-Smtp-Source: ABdhPJxcmuG4tL3kLwoNFy8fHA1ArAeYFtc0initaXiyt2fy1vKZQMwi0PtsbOVLvMggcUWcHpQ0UA==
X-Received: by 2002:a63:4f1b:: with SMTP id d27mr3491736pgb.389.1593191778985;
        Fri, 26 Jun 2020 10:16:18 -0700 (PDT)
Received: from [172.30.88.83] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id y18sm25471497pfn.177.2020.06.26.10.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 10:16:18 -0700 (PDT)
Subject: Re: [PATCH] MEDIA-STAGING: Remove unneeded geometry restrictions from
 i.MX CSI driver
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>
Cc:     linux-media@vger.kernel.org
References: <m31rnmx2cw.fsf@t19.piap.pl>
 <5d8e8b2b8daf8a44fd9650f08bacb423f4beb940.camel@pengutronix.de>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <fe1b792e-2cfd-f380-923c-457762280546@gmail.com>
Date:   Fri, 26 Jun 2020 10:16:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5d8e8b2b8daf8a44fd9650f08bacb423f4beb940.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof, Philipp,



On 6/26/20 1:58 AM, Philipp Zabel wrote:
> Hi Krzysztof,
>
> thank you for the patch.
>
> On Thu, 2020-05-14 at 12:00 +0200, Krzysztof Hałasa wrote:
>> I don't know what minimal image dimensions are, but 32x32 appears to
>> be ok according to the docs.
>> This is needed for small sensors like 80x80 thermal imagers.
>>
>> Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>
> This looks fine to me for the CSI. Steve, are you aware of any
> limitations?

I looked at the imx6 ref manual and don't see any limitations in IC or 
VDIC or IDMAC or CPMEM, so this is fine to me as well.

One nitpick, please change the all-caps commit subject to

media: imx: Remove unneeded geometry restrictions from i.MX CSI driver

After that,

Acked-by: Steve Longerbeam <slongerbeam@gmail.com>


> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> (with CSI crop to 32x32, I have no 32x32 sensors at hand)
>
> regards
> Philipp
>
>> diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
>> index 2a4f77e83ed3..622a52c46229 100644
>> --- a/drivers/staging/media/imx/imx-ic-prp.c
>> +++ b/drivers/staging/media/imx/imx-ic-prp.c
>> @@ -26,8 +26,8 @@
>>   /*
>>    * Min/Max supported width and heights.
>>    */
>> -#define MIN_W       176
>> -#define MIN_H       144
>> +#define MIN_W        32
>> +#define MIN_H        32
>>   #define MAX_W      4096
>>   #define MAX_H      4096
>>   #define W_ALIGN    4 /* multiple of 16 pixels */
>> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
>> index 09c4e3f33807..cb46455a1a36 100644
>> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
>> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
>> @@ -35,8 +35,8 @@
>>    * has not requested a planar format, we should allow 8 pixel
>>    * alignment at the source pad.
>>    */
>> -#define MIN_W_SINK  176
>> -#define MIN_H_SINK  144
>> +#define MIN_W_SINK   32
>> +#define MIN_H_SINK   32
>>   #define MAX_W_SINK 4096
>>   #define MAX_H_SINK 4096
>>   #define W_ALIGN_SINK  3 /* multiple of 8 pixels */
>> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
>> index e76a6a85baa3..d9e5388ffeb5 100644
>> --- a/drivers/staging/media/imx/imx-media-csi.c
>> +++ b/drivers/staging/media/imx/imx-media-csi.c
>> @@ -33,8 +33,8 @@
>>    * has not requested planar formats, we should allow 8 pixel
>>    * alignment.
>>    */
>> -#define MIN_W       176
>> -#define MIN_H       144
>> +#define MIN_W       32
>> +#define MIN_H       32
>>   #define MAX_W      4096
>>   #define MAX_H      4096
>>   #define W_ALIGN    1 /* multiple of 2 pixels */
>> diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
>> index 0d83c2c41606..ee71b70d3544 100644
>> --- a/drivers/staging/media/imx/imx-media-vdic.c
>> +++ b/drivers/staging/media/imx/imx-media-vdic.c
>> @@ -49,8 +49,8 @@ struct vdic_pipeline_ops {
>>   /*
>>    * Min/Max supported width and heights.
>>    */
>> -#define MIN_W       176
>> -#define MIN_H       144
>> +#define MIN_W        32
>> +#define MIN_H        32
>>   #define MAX_W_VDIC  968
>>   #define MAX_H_VDIC 2048
>>   #define W_ALIGN    4 /* multiple of 16 pixels */
>>

