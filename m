Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96853D3787
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 11:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232265AbhGWIhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 04:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhGWIhL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 04:37:11 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41346C061575;
        Fri, 23 Jul 2021 02:17:45 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id o3-20020a05600c5103b029024c0f9e1a5fso2833040wms.4;
        Fri, 23 Jul 2021 02:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=g6gQqT1e2qPhC9Tz0/AdPOlfRpuJENOmn4sgVOzMOlM=;
        b=suUJ8VdYjo/v1PwRjnJHeOkuvKsNxb5CZwlU0AXKlfNglb9V6dtd07/zaTGpM30cLd
         dQqgMYD3lsZ2EauYzh6zXAuRvLM5Mng8MDIqs5WxRi6j1ScNIaXH4wohtBkhsSaIkss6
         pNLRERKmo0WFqaTviZgWlJBOJ7Qda84Q8x5KHFJJOsATC1muUHjmOA+SFPJNBL/cQl8+
         jFDPq9ktL9FEtkEj1iuWVjsSJ7gSXkqPCekFnCZJQPZI1miOblmZ9uWHih9x8Gg7SK6z
         lrAccRo1/1HlBMwj6WvKaorWTkbCutw2vk2p5tC3G1MT4FGg1g1VH5XIjBjZOV870vuK
         jT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=g6gQqT1e2qPhC9Tz0/AdPOlfRpuJENOmn4sgVOzMOlM=;
        b=CJxnF4z+zPGvfabnvcoFPi9NXa3K21dbnHkhhYCW3sklo6KWk2Y2OksUbUSgwdo+RQ
         NJEpdu2xIP9UBEURoQLMKqwqoVgzyUv6DodknDDe7OqOoWiIlDG8S21OJYn8wZC23v2T
         f2tzZ5V8CKLGdsreO8Xtm0lrhpiiYu86TyWdBK+tMb+tDRbUaGcDQEmMy0dvoGGZxoYA
         /vqsWUbj0ZVTM+2clqRvpsEU71lxKCGn/vvT9TkYxSr5d7ZrUhDgadzAmpza45Gz3C0q
         ioi6GpmAtAY1D2FDXmInucAjJOd/e2unGTsW2swiIFZZbpVOvgvrDa+e2hI/NEwAZkbS
         7/7Q==
X-Gm-Message-State: AOAM532CNws9tqWZyj/UxT8slJf0so1nAIaiz/0Jv7Z07zy5Fsqp0l/c
        H+YN5pxpSlipZw4rR55/L/8=
X-Google-Smtp-Source: ABdhPJw6HkvXSB+qepurCFtxwPh4YNT1N9S1rb7+K+J5W8TMnmaTzb++3nZ8z3qnE1KhVu89SQCuYw==
X-Received: by 2002:a1c:790a:: with SMTP id l10mr3579872wme.8.1627031863806;
        Fri, 23 Jul 2021 02:17:43 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id k7sm4479674wms.48.2021.07.23.02.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 02:17:43 -0700 (PDT)
Subject: Re: [PATCH 02/13] media: i2c: Fix incorrect value in comment
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20210722203407.3588046-1-djrscally@gmail.com>
 <20210722203407.3588046-3-djrscally@gmail.com> <YPpzb5pqpSycAlxN@aptenodytes>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <4d9b0ebf-560a-d4fe-c9ef-d9e92f6c5f44@gmail.com>
Date:   Fri, 23 Jul 2021 10:17:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPpzb5pqpSycAlxN@aptenodytes>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 23/07/2021 08:44, Paul Kocialkowski wrote:
> Hi,
>
> On Thu 22 Jul 21, 21:33, Daniel Scally wrote:
>> The PLL configuration defined here sets 72MHz (which is correct), not
>> 80MHz. Correct the comment.
> This is:
>
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>
> Thanks,


Thank you :)

>
> Paul
>  
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  drivers/media/i2c/ov8865.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>> index fe60cda3dea7..2ef146e7e7ef 100644
>> --- a/drivers/media/i2c/ov8865.c
>> +++ b/drivers/media/i2c/ov8865.c
>> @@ -713,7 +713,7 @@ static const struct ov8865_pll2_config ov8865_pll2_config_native = {
>>  /*
>>   * EXTCLK = 24 MHz
>>   * DAC_CLK = 360 MHz
>> - * SCLK = 80 MHz
>> + * SCLK = 72 MHz
>>   */
>>  
>>  static const struct ov8865_pll2_config ov8865_pll2_config_binning = {
>> -- 
>> 2.25.1
>>
