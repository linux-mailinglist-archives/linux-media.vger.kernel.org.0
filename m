Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1804423EE
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 00:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhKAX0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 19:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbhKAX0q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 19:26:46 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DB9C061714
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 16:24:12 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id b184-20020a1c1bc1000000b0033140bf8dd5so816094wmb.5
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 16:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=doh/qkM8QJrWj+VGUo/pjTv9mHNQld5eiH3UTjxdDbQ=;
        b=MwyxQinRrYDNctnQsbfIJjPPde73Hw7jxmouMNk56KNeZk2GHvfUetJyasN6PHuiEy
         3y1YCUKAIEwq/o9/hpSJoQGV3NLtxXGrmor4waZQs3nvpntkAAGosbVkLLhzsLFMq0nn
         Uw5RmpqjoccRLelqi24woZebo0XZh5sJW/+usworwKR1XXPv8S7B6G7ATL8M0ogAlsYC
         6pUArZ8WFxweTNTO+lCq0n2QcpUmdr8exw6DZBQ82sVY6auQ+zgbb7go0tO7uqeEcyvf
         aiiCB/trGnGlTyifntW/klGL/fGEq/efAA4wdrFWa5wHp2I9OSvTh/6kN+pR7BIuejIA
         Pbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=doh/qkM8QJrWj+VGUo/pjTv9mHNQld5eiH3UTjxdDbQ=;
        b=pWxStNWmx1873roE1cOHpWh5XQ/oZTtF8HqJDhyLOFtzNzUuztqnU1i1Ic2PFfZYFH
         2ZHH3qiYoOdeKPbzWH/knd5YgO8Eg26wwhYA+3VwEQqaykqgilGM6J5/5FijmXQYglln
         2O7SHNtybgTihuT6ZUYEANxpULE32gHFTGH29lz9Jktiz661LtJVfAO/jbRA8n1B1wj7
         wnwbvWrM9rbIKXGPGKrLn9yBUs1VGB+cOa8pcciGKKJpL3dtR/OrsK/OkY1oJjAfmd4B
         qN2DmeD575rQXz74+p01WvcQKBoIvYUODYhAp3fdZOm+nQ3rLA/yzbsiC7k77WwgYvL7
         srwg==
X-Gm-Message-State: AOAM531In0BhcCvi9MQJbzFxR51uCouROvcr+97J0VXDvuiezxg4Ggy/
        HRqeuWVhr7U9ppOsMWrlUKQ=
X-Google-Smtp-Source: ABdhPJxRzepjrtuVyf7fB5lhKPAZ5MbjT6e801Xy9HVM/zhCnDsWJV9ZmF1uX8vypoUipfKImyZdKQ==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr2358295wmi.123.1635809051312;
        Mon, 01 Nov 2021 16:24:11 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h3sm5868436wrv.69.2021.11.01.16.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 16:24:10 -0700 (PDT)
Subject: Re: [PATCH v4 01/16] media: i2c: Add ACPI support to ov8865
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
 <20211101001119.46056-2-djrscally@gmail.com>
 <CAHp75Vf_kOH28O6ZO9h5jpm2Wvcoi3vUifEqYFpD4nfojy4=UA@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <3df09e44-3b4e-19b0-7754-1d9c52f11fb5@gmail.com>
Date:   Mon, 1 Nov 2021 23:24:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vf_kOH28O6ZO9h5jpm2Wvcoi3vUifEqYFpD4nfojy4=UA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 01/11/2021 10:01, Andy Shevchenko wrote:
> On Mon, Nov 1, 2021 at 2:12 AM Daniel Scally <djrscally@gmail.com> wrote:
>> The ov8865 sensor is sometimes found on x86 platforms enumerated via ACPI.
>> Add an ACPI match table to the driver so that it's probed on those
>> platforms.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  drivers/media/i2c/ov8865.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>> index ce50f3ea87b8..7626c8608f8f 100644
>> --- a/drivers/media/i2c/ov8865.c
>> +++ b/drivers/media/i2c/ov8865.c
>> @@ -9,6 +9,7 @@
>>  #include <linux/delay.h>
>>  #include <linux/device.h>
>>  #include <linux/i2c.h>
>> +#include <linux/mod_devicetable.h>
>>  #include <linux/module.h>
>>  #include <linux/of_graph.h>
> I'm wondering if the code even uses of_*() APIs.
> If nbo, maybe it's good to replace of_graph.h with property.h.


Yeah you're right; it doesn't use any of_*() calls. I'll add a patch

>>  #include <linux/pm_runtime.h>
>> @@ -2946,6 +2947,12 @@ static const struct dev_pm_ops ov8865_pm_ops = {
>>         SET_RUNTIME_PM_OPS(ov8865_suspend, ov8865_resume, NULL)
>>  };
>>
>> +static const struct acpi_device_id ov8865_acpi_match[] = {
>> +       {"INT347A"},
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, ov8865_acpi_match);
>> +
>>  static const struct of_device_id ov8865_of_match[] = {
>>         { .compatible = "ovti,ov8865" },
>>         { }
>> @@ -2956,6 +2963,7 @@ static struct i2c_driver ov8865_driver = {
>>         .driver = {
>>                 .name = "ov8865",
>>                 .of_match_table = ov8865_of_match,
>> +               .acpi_match_table = ov8865_acpi_match,
>>                 .pm = &ov8865_pm_ops,
>>         },
>>         .probe_new = ov8865_probe,
>> --
>> 2.25.1
>>
>
