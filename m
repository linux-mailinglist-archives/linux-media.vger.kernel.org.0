Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2FE63A737
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 12:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbiK1L33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 06:29:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbiK1L31 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 06:29:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EC921A5
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 03:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669634912;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/7MySPxfWRhKCAy6L+JYq3epC62mBperdDn509xL1Vw=;
        b=Oozhk3ZQGsEj0HILjlgcqFvy3J+FI0fYhKrLPofk6R9uScsfWeVw2KPZ/VOaRDYpRhSEHf
        zQlA4/Qs1QokOsT4xy5rtjp659SpybF9LvSUCTzWmCUXy0pu+dWnMecN5UsFFO7JbZvaOJ
        Xb6dsXk36hS9JaxGtuIqhmaLeq0ioow=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-261-arcqVVzlP-CDHHiAJNxGcg-1; Mon, 28 Nov 2022 06:28:31 -0500
X-MC-Unique: arcqVVzlP-CDHHiAJNxGcg-1
Received: by mail-ed1-f71.google.com with SMTP id y18-20020a056402359200b004635f8b1bfbso6454889edc.17
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 03:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7MySPxfWRhKCAy6L+JYq3epC62mBperdDn509xL1Vw=;
        b=CUbWqEp7MvPBxmJIJoF8Y1qHb8hatAtcyS8rtBGef2p6WVcKg80XYMvix4iB8bJosH
         BSCsrPIQFZNyxQXuThXhZkWmVtBqWmgUORnz4GOOWW49M8mvxpl1JYap44dDQX/GhnXj
         M+zIUltxFGK8CMKm7NmR3e4Bme9FmrNBZ+7WR99p8rR3bEcA3JWyqPOzVZEm6O7aXobH
         vYWsI3VqiLXE+9IaA+52q3lAUsRPpW5yiqeJh5ogs8qGJutCGJVAbyA0ltp9ROmhG0xT
         cr+Zh7L7buYiCwBWi1Hq2YgMEnTCkaP9gkLBGgnxofcAUbtYmqn3VsdQ280qUqroU0QC
         WnNg==
X-Gm-Message-State: ANoB5pkC9Xue9Pp6Az/w8zupPq+7qVZe7xSrKwkAbULM0gHTjBTXzgYt
        hiP7IXvQK5dDmtHpsiQfke+I0/L3xo10Ht2PmOK1uOWnU6nC4PmiGuvpWk2h0SpMelr918i0Vpp
        P3OHwI6XqlPXwHNSMbYnAASs=
X-Received: by 2002:a17:907:1df2:b0:7ae:8411:112c with SMTP id og50-20020a1709071df200b007ae8411112cmr40613901ejc.97.1669634910343;
        Mon, 28 Nov 2022 03:28:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4EozmQhAikXbysdfaXIEphfNhPq7AAiRrBsCCsuA355SFjl7TuyhFyhyWb5rxNJcCp0SqThg==
X-Received: by 2002:a17:907:1df2:b0:7ae:8411:112c with SMTP id og50-20020a1709071df200b007ae8411112cmr40613886ejc.97.1669634910141;
        Mon, 28 Nov 2022 03:28:30 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id gk5-20020a17090790c500b007be301a1d51sm2548411ejb.211.2022.11.28.03.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 03:28:29 -0800 (PST)
Message-ID: <f863bbad-2b8a-2089-d39c-bf57cfc53b05@redhat.com>
Date:   Mon, 28 Nov 2022 12:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <Y4DT1ovvIR4NB5qm@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4DT1ovvIR4NB5qm@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/25/22 15:40, Laurent Pinchart wrote:
> On Thu, Nov 24, 2022 at 09:00:04PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> Here is a small set of patches to make the int3472/discrete code
>> work with the sensor drivers bundled with the (unfortunately out of tree)
>> IPU6 driver.
>>
>> There are parts of the out of tree IPU6 code, like the sensor drivers,
>> which can be moved to the mainline and I do plan to work on this at some
>> point and then some of this might need to change. But for now the goal is
>> to make the out of tree driver work with standard mainline distro kernels
>> through e.g. dkms. Otherwise users need to run a patched kernel just for
>> a couple of small differences.
>>
>> This is basically a rewrite of this patch:
>> https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch
>>
>> Wich users who want to use the IPU6 driver so far have had to manually
>> apply to their kernels which is quite inconvenient.
>>
>> This rewrite makes 2 significant changes:
>>
>> 1. Don't break things on IPU3 platforms
>>
>> 2. Instead of extending the int3472_sensor_configs[] quirks table for each
>> model which needs "clken" and "pled" GPIOs, do this based on matching
>> the ACPI HID of the ACPI device describing the sensor.
> 
> How can we be sure that a given sensor model will always be wired to the
> same GPIOs on all platforms that integrate it with an IPU6 (or IPU3) ?

This is not about which GPIOs are actually there, this is about what the
driver expects. Specifically about if the driver expects the clock to
be modelled with the clk framework or as a clk-en GPIO which is
a property of the driver, not of the board design.

But as already mentioned I agree with Dan and you that modelling it
through the clk framework is correct and what needs to happen here is to
patch the IPU6 sensor drivers to move them to the clk framework.

so this is all mute.

Regards,

Hans

