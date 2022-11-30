Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C15063D387
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 11:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235884AbiK3KiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 05:38:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235813AbiK3KiI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 05:38:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E604F45ECD
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 02:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669804637;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xLa8AzlHOrSU45KCtzXisqtvFoABjHdv0YQ5GJeGwu4=;
        b=P7HLdWVaR6Rt/CgAwBSXXj8Cf/YlJuy1vGmRDgltWTA3TqSmMTm5ERN4rgXxdi/0lA+bhw
        8kvTxduRD24KzG344fRurUxzWoQwmlXNiWnWomZmq19Xi5Nb0Xk7NZhjHsyVoBoTDVp6wB
        m3CdwGkpf/XpGY+BwDBKyb3ry/+XeS0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-fNM6gg8uM1avd9wyRs1rOg-1; Wed, 30 Nov 2022 05:37:15 -0500
X-MC-Unique: fNM6gg8uM1avd9wyRs1rOg-1
Received: by mail-ed1-f70.google.com with SMTP id q13-20020a056402518d00b00462b0599644so9703354edd.20
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 02:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xLa8AzlHOrSU45KCtzXisqtvFoABjHdv0YQ5GJeGwu4=;
        b=6lbydKbzUQwh//06nhC+KztQhtTr788E0SgSZXiU+zHDurzpY9r380UobBscuLN3aS
         W38MRMS2ktZ0yamc2nmXOyskyV17EsCSypFKCGMK5IJ/c3s9NOpUgmRHO9LxwWVYjZKc
         OKOUYx3jDb/lX8ljf9noTwtjDgqgLzTOBGVAuH5X6kZs8CIeAhzj2IWHZP2Smfx9YqOa
         6mINbliSkIFcWGpF4xccj/DXH1WgF0g0k5fbwAxRxiNWPrVEv0JuWvuP8iF5dRfjyK85
         6cCFPq87Wu/6LyN7IagBRvjFdXbClq+O7o5MFvz4QG43YFn9lIQXhbRojv2bqr9cS8R5
         hj+Q==
X-Gm-Message-State: ANoB5pnUOwp/mhHblexmzLEieZqTedSj/youxtDucjBSntehQ2wP2dJl
        sdAwMgj+3NRLjRhWuMiuFZ50kpxGaljbMqPlg7rRIxw1CWFVXoRIimfJfXwldU7bJE7cbIM/2ns
        /pDdKG1N7YOSBlrnOAsCouPY=
X-Received: by 2002:a17:906:5052:b0:7a9:6107:572a with SMTP id e18-20020a170906505200b007a96107572amr51852674ejk.729.1669804634205;
        Wed, 30 Nov 2022 02:37:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5zisYgipQtHZ4HF/gBS6f6BFGjROtSKjpzmYfhuTkOkz2fzYYatOo58K4pqM52J+8h9JqQeA==
X-Received: by 2002:a17:906:5052:b0:7a9:6107:572a with SMTP id e18-20020a170906505200b007a96107572amr51852666ejk.729.1669804634023;
        Wed, 30 Nov 2022 02:37:14 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id y8-20020a50eb88000000b0046ac017b007sm485594edr.18.2022.11.30.02.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 02:37:13 -0800 (PST)
Message-ID: <21624116-0d91-4e5a-7fd2-7bc5eb6e3b72@redhat.com>
Date:   Wed, 30 Nov 2022 11:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/6] platform/x86: int3472/discrete: Ensure the clk/power
 enable pins are in output mode
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-6-hdegoede@redhat.com>
 <CAHp75VdQqJu1YRozd5-qKKn5W9Rk_fLyzfHm0+HVDcgg0heCDA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdQqJu1YRozd5-qKKn5W9Rk_fLyzfHm0+HVDcgg0heCDA@mail.gmail.com>
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

On 11/30/22 10:59, Andy Shevchenko wrote:
> On Wed, Nov 30, 2022 at 1:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> acpi_get_and_request_gpiod() does not take a gpio_lookup_flags argument
>> specifying that the pins direction should be initialized to a specific
>> value.
>>
>> This means that in some cases the pins might be left in input mode, causing
>> the gpiod_set() calls made to enable the clk / regulator to not work.
>>
>> One example of this problem is the clk-enable GPIO for the ov01a1s sensor
>> on a Dell Latitude 9420 being left in input mode causing the clk to
>> never get enabled.
>>
>> Explicitly set the direction of the pins to output to fix this.
> 
> ...
> 
>> +       /* Ensure the pin is in output mode */
> 
> ...in output mode and non-active state */

Ack.

>> +       gpiod_direction_output(int3472->clock.ena_gpio, 0);
> 
> ...
> 
>> +       /* Ensure the pin is in output mode */
>> +       gpiod_direction_output(int3472->regulator.gpio, 0);
> 
> So, previously it was AS IS and now it's non-active state. I believe
> this makes no regressions for the other laptops / platforms.

Correct, and no regression intended indeed. I'll add the improved
comment when merging this (unless there are other / bigger
reasons for a v2).

Regards,

Hans


