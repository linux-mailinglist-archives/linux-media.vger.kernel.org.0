Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C66146387BC
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 11:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbiKYKnA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 05:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiKYKm5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 05:42:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15E91C901;
        Fri, 25 Nov 2022 02:42:55 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EE8625B;
        Fri, 25 Nov 2022 11:42:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669372973;
        bh=qqeLik6STwfgOWZed0SK8Nma42uOo01IV8pt3qWWMKE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=O3CgybIp12IBarUhUi6YXUahoLZ9H21gi6/rBs7KVUUqu1rF/fz/rGuFQgroKXQ00
         kwafzP5TH5GtBF7yjObEPrsL6iPzW3azt8peNMnVTcDg8hVy6mdb3Wp30nBceQephb
         JTZkQ9gJcxhEXBMefMYmvCeKqse1aZ0HSeIhJneI=
Message-ID: <1d5944a3-8d06-d95a-fa7e-347ac41a858a@ideasonboard.com>
Date:   Fri, 25 Nov 2022 10:42:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] platform/x86: int3472/discrete: Get the polarity from
 the _DSM entry
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <20221124200007.390901-3-hdegoede@redhat.com>
 <CAHp75VcgRN=3O7cYsxVxcJ6PuSpDuZAs3ex0rhedaE94DBwBzg@mail.gmail.com>
 <8da77836-c53b-8468-13ee-dc02eabfc8a5@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <8da77836-c53b-8468-13ee-dc02eabfc8a5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello

On 24/11/2022 20:26, Hans de Goede wrote:
> Hi,
>
> On 11/24/22 21:13, Andy Shevchenko wrote:
>> On Thu, Nov 24, 2022 at 10:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>> The out of tree IPU6 driver has moved to also using the in kernel INT3472
>>> code for doing power-ctrl rather then doing their own thing (good!).
>>>
>>> On IPU6 the polarity is encoded in the _DSM entry rather then being
>>> hardcoded to GPIO_ACTIVE_LOW.
>>>
>>> Using the _DSM entry for this on IPU3 leads to regressions, so only
>>> use the _DSM entry for this on non IPU3 devices.
>>>
>>> Note there is a whole bunch of PCI-ids for the IPU6 which is why
>>> the check is for the IPU3-CIO2, because the CIO2 there has a unique
>>> PCI-id which can be used for this.
>> ...
>>
>>> +/* IPU3 vs IPU6 needs to be handled differently */
>>> +#define IPU3_CIO2_PCI_ID                               0x9d32
>> If it makes more than a single driver, perhaps pci_ids.h is a good
>> place to keep it there?
> Yes, I've added a note to my TODO to clean this up in a follow-up
> patch (the pci-ids.h maintainers want to see multiple users of
> an id before accepting new ids in there).


fwiw this in drivers/media/pci/intel/ipu3/ipu3-cio2.h already as 
CIO2_PCI_ID, so it will have multiple users with this change.

>> ...
>>
>>> +       dev_dbg(int3472->dev, "%s %s pin %d active-%s\n", func,
>>> +               agpio->resource_source.string_ptr, agpio->pin_table[0],
>>> +               (polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
>> Parentheses are not needed, right?
> Right, but I prefer to use them in conditional statements like these,
> because I personally find that they make things easier to read.


Seconded.

> Regards,
>
> Hans
>
>
