Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B768D587996
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 11:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbiHBJHS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 05:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbiHBJHR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 05:07:17 -0400
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 02 Aug 2022 02:07:13 PDT
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D984B1E3F3
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 02:07:13 -0700 (PDT)
X-KPN-MessageId: 4a84b24d-1242-11ed-bfe8-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 4a84b24d-1242-11ed-bfe8-005056999439;
        Tue, 02 Aug 2022 11:05:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=mLOsJT0TJ3c4KXdQDSuI0fX6PHkphFKUJPumIvXjI+M=;
        b=Lnwt2a1LAM4XU3PL4ppbW8wfRou994jyhv6qaV7s0h9PXRqIHblVC5bZQV2pz7A84TBvdhA8lENJ5
         e6f/5oDD7Q6XC8nVw2Rwua6diJdHuCUUp0De9BdJH9E6E4bZ9Kd+vy5Vk8fMGqlYpiA0O5INvQ4EdX
         9T1ssDarv+15yLUXbisIDu/hFxdDjgtsoPKl5UgH2irGdMKv+LZVW4D2HrZO8U+eehuVFhypIZDNL+
         MDQWBLzHN74Nuswnqr8el/8sVGxOopw1vPD+tUG9TJHhdonchxd8CV5+P8F3grzHfLw8WjpoqpJ+7a
         syIapiqDtYnlI+qXY1KqxId3H/Uj2Ng==
X-KPN-MID: 33|xrJjbMnG31eMG1uuOuySwe40UL/nEWnoa6hAl/rFxgO/Up2uow3xOQPutPxVdq1
 6IgEwndvYAsFmLL1IWR9vO64AC8ZNvct+9k+lTg2o8co=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|bkauOvJvXBXhdlX0okvocgx6DVLRjHDVJrDpnUMWCeeXyZFQb2PgFy+IaIoC/yD
 GMYfUMqFUR63gUIEBUrdEbw==
X-Originating-IP: 173.38.220.52
Received: from [10.47.77.219] (unknown [173.38.220.52])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 58f82e4d-1242-11ed-9b28-00505699d6e5;
        Tue, 02 Aug 2022 11:06:09 +0200 (CEST)
Message-ID: <5d3fe43f-5615-137d-b712-f6c9079460cd@xs4all.nl>
Date:   Tue, 2 Aug 2022 11:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID
 EEPROM
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Erling Ljunggren (hljunggr)" <hljunggr@cisco.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "jonathansb1@gmail.com" <jonathansb1@gmail.com>
References: <20220728114050.2400475-1-hljunggr@cisco.com>
 <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75Ve6-BQ_Ajst96cr=XvJGV247_FYLTHTz=nvTCC3NhQa1A@mail.gmail.com>
 <db2d74d0ab17b407223092c8e0e01784d36bbda1.camel@cisco.com>
 <CAHp75Vc2qWQXk-+0ath8zuTaGHmSG_ZiUYih=4rGeKx3_nmtsQ@mail.gmail.com>
 <b426bd08-6c52-3891-9319-b6cc52bdfbab@xs4all.nl>
 <CAHp75Vdtv6qtjxACA+nET2wyzHpHqxvPeZ-KhRWSByGtH4T5TQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAHp75Vdtv6qtjxACA+nET2wyzHpHqxvPeZ-KhRWSByGtH4T5TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/2/22 10:42, Andy Shevchenko wrote:
> On Mon, Aug 1, 2022 at 8:35 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>> On 01/08/2022 16:57, Andy Shevchenko wrote:
>>> On Mon, Aug 1, 2022 at 3:07 PM Erling Ljunggren (hljunggr)
>>> <hljunggr@cisco.com> wrote:
>>>> On Fri, 2022-07-29 at 17:51 +0200, Andy Shevchenko wrote:
>>>>> On Thu, Jul 28, 2022 at 1:53 PM Erling Ljunggren <hljunggr@cisco.com>
>>>>> wrote:
> 
> ...
> 
>>>>>> +       state = kzalloc(sizeof(*state), GFP_KERNEL);
>>>>>> +       if (!state)
>>>>>> +               return -ENOMEM;
>>>>>
>>>>> devm_kzalloc() ?
>>>>
>>>> This will fail if the device is forcibly unloaded while some
>>>> application has the device node open.
>>>
>>> I'm not sure how it's related. Can you elaborate a bit, please?
>>>
>>> If you try to forcibly unload the device (driver) when it's open and
>>> it somehow succeeds, that will be a sign of lifetime issues in the
>>> code.
>>
>> Not with rmmod but using the unbind facility.
> 
> And what is the difference? The device driver core calls the same, no?

rmmod when the /dev/videoX is open won't work (device is busy), whereas
unbind *will* work, and it is really the same as a USB unplug.

> 
>> For new media drivers we generally
>> want to avoid using devm_*alloc, it causes more problems than it solves.
> 
> I think it's because people don't think much about the lifetime of
> objects. I don't think devm is an issue here.

Yes, it is: unbind will call the driver remove() function, and after that
function all memory allocated with devm_*alloc will be freed immediately.

But if an application still has a filehandle open and was possibly even in
the middle of an ioctl call, then having the memory removed instantaneously
is a really bad thing.

Hotpluggable devices in general definitely should not use it. I'm not a fan
of devm_*alloc anymore.

Regards,

	Hans

> 
>> It's unlikely to be an issue here, but I'd rather keep it as-is.
> 
> OK.
> 

