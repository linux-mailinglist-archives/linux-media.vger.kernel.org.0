Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7C5F6DBFD4
	for <lists+linux-media@lfdr.de>; Sun,  9 Apr 2023 14:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjDIM3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Apr 2023 08:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjDIM3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Apr 2023 08:29:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D673ABB
        for <linux-media@vger.kernel.org>; Sun,  9 Apr 2023 05:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681043308;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=esqSUMWr1wWYKhNDCasrbsq4Y4F4icBcjkgGPgdBn/0=;
        b=KnL+3uZIZ+BCItnTIyxfoKca3jjCPRZQ4CGdqg6penrQK8Fug1EvFvmJy5PydZIxfpkTnU
        BVCQ9+l6dLMAa9IMidJvefH025TZIlA5nPZr/KYvatmYitYAee87SbxuBDF2GFUQLpLqbn
        t2wuq50iaVswaZOgh7cTNiFv561pkBU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-_BkYAUljOFeQXWvF8e8cNA-1; Sun, 09 Apr 2023 08:28:19 -0400
X-MC-Unique: _BkYAUljOFeQXWvF8e8cNA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-50489c126ebso379839a12.2
        for <linux-media@vger.kernel.org>; Sun, 09 Apr 2023 05:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681043298; x=1683635298;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=esqSUMWr1wWYKhNDCasrbsq4Y4F4icBcjkgGPgdBn/0=;
        b=KgK7pfOE/XfC0ZF2zvNSsgSx5khOyDN6oI6ZPzfjDHDmuwYKJKMKhGggf+WfwyzLHQ
         k6J3Q+u6uNcxMXSws8huZdDZoSBYZtdZ1P46u52m55kP1kC9GEzZxMEZHGfPa7WESA1f
         8+sh29d9V4KUvWW0Zd+3tG1c1b/GHf6GkwLBEbp3mUFG/7AQ3EWwah0yzWrWjKQeTgo2
         DCS0XjYYEDErkgvqlrX1MB+bjXMkVVlFdmfStw+fBH8+I6UQOnQM/6oSNXU7V6Q/aEZk
         WL8xj2l28vdC1lbMFbgyBdlApavhR2ZKGop0JR8SgfTv6G1QbX1wzTGtAa5/3a8O9Ov7
         616w==
X-Gm-Message-State: AAQBX9c4Q/ZlaOcdd9VVnWy7mEuB58wo59BMVgBYuIMtwvhPEzYTmVqp
        Xq+gIbWItkOAMiV8n3WxqQUjAnx8oE9igI+0QLzzERKEHs0XhCqyUBN/oaCEbhCuYsXaXm619BT
        oy13pMmc2+HcVyNXoXJ9LDgQ=
X-Received: by 2002:a05:6402:6ce:b0:4af:6c5e:225c with SMTP id n14-20020a05640206ce00b004af6c5e225cmr7034034edy.33.1681043298249;
        Sun, 09 Apr 2023 05:28:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZRsLb2AH3IRto1BxVOzRd3Qm3iDJTl2qomyzf+3lLKj6jFnHbs7mbhkWcUd6FHXN7QXLuqjQ==
X-Received: by 2002:a05:6402:6ce:b0:4af:6c5e:225c with SMTP id n14-20020a05640206ce00b004af6c5e225cmr7034018edy.33.1681043297876;
        Sun, 09 Apr 2023 05:28:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d24-20020a50f698000000b0050299cebf6esm3857778edn.54.2023.04.09.05.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 05:28:17 -0700 (PDT)
Message-ID: <c9a85d8a-b920-391a-8738-ec34d3c88eae@redhat.com>
Date:   Sun, 9 Apr 2023 14:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 01/28] media: atomisp: Add v4l2_get_acpi_sensor_info()
 helper
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230401145926.596216-1-hdegoede@redhat.com>
 <20230401145926.596216-2-hdegoede@redhat.com>
 <CAHp75Vea_S-Sw+BYFCPbZ_aTy83kotMOofpqjyGYO7sVywpdYg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vea_S-Sw+BYFCPbZ_aTy83kotMOofpqjyGYO7sVywpdYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 4/2/23 08:17, Andy Shevchenko wrote:
> On Sat, Apr 1, 2023 at 4:59 PM Hans de Goede <hdegoede@redhat.com> wrote:

<snip>

>> +int v4l2_get_acpi_sensor_info(struct device *dev, char **module_id_str)
>> +{
>> +       struct acpi_device *adev = ACPI_COMPANION(dev);
>> +       struct v4l2_acpi_gpio_parsing_data data = { };
>> +       LIST_HEAD(resource_list);
>> +       union acpi_object *obj;
>> +       unsigned int i, j;
>> +       int ret;
>> +
>> +       if (module_id_str)
>> +               *module_id_str = NULL;
>> +
>> +       if (!adev)
>> +               return 0;
>> +
>> +       obj = acpi_evaluate_dsm_typed(adev->handle, &intel_sensor_module_guid,
>> +                                     0x00, 0x01, NULL, ACPI_TYPE_STRING);
>> +       if (obj) {
>> +               dev_info(dev, "Sensor module id: '%s'\n", obj->string.pointer);
>> +               if (module_id_str)
>> +                       *module_id_str = kstrdup(obj->string.pointer, GFP_KERNEL);
>> +
>> +               ACPI_FREE(obj);
>> +       }
> 
>> +       if (!soc_intel_is_byt() && !soc_intel_is_cht())
>> +               return 0;
> 
> So, you (might) call the previous _DSM for any SoC, is it intentional?

Yes the previous _DSM which gives a sensor-module-id string is also used on IPU3 and IPU6 so we want to at least try it on all x86/ACPI platforms. If the _DSM with that GUID is not supported then the call should be harmless.

Regards,

Hans


