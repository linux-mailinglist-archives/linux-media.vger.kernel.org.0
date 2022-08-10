Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430CF58EE4D
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 16:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232326AbiHJO1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 10:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232272AbiHJO1K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 10:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2C89D21250
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 07:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660141628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dIGuELdXM3VjaBDy3xdqCDzqpka3nMjhh0rC3IFyLhI=;
        b=hFAjPkq3FGTEC1IVULJsHPkp6wJVeHoWrSHyFyb12F1NlK5Jld25Y8OXg5LG22fWpZotx0
        DKp1not9rtp25XGqN7Z9ULBOsdJRndWvXdd4t/yikz7VN5sJex7xgXaYFfIbzOK2yGhQVn
        A/GMGag17iuxtIw7ZFJindCeKiwemlk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-S02dcRLBMJGuqgi56Uuwfg-1; Wed, 10 Aug 2022 10:27:07 -0400
X-MC-Unique: S02dcRLBMJGuqgi56Uuwfg-1
Received: by mail-ej1-f69.google.com with SMTP id ho13-20020a1709070e8d00b00730a655e173so4280871ejc.8
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 07:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=dIGuELdXM3VjaBDy3xdqCDzqpka3nMjhh0rC3IFyLhI=;
        b=UIvLaRjA/ORGJJCDD8o822r4heqrO8Ktfxf2+oxTTYQI19e1JmUYqiZjmw3lblsGbx
         CWP3RwdHRVpHSLDiNgn3UiWhe1QRIGZ16laMKUnP6xTD45x+9RB4kEW44r7oVJde9ctJ
         kUos2kQTJfRpvJTXgtyKwaahsuhMU3Lf1zESIDIesd6Lic2cft/eVXpYeuN3IHPCogI6
         ZQncaRlDxKtbTHr6z/JoOMVJRdGr5F8i9vj2GbBmkpWNUG8p0R+ZndbXLLHwFwD6unaO
         1bZhVJx3Qy1CynPSTTIP5ohXq2xnwCZDUp6MHS0RVCz6LmpcnzKnewFpyC5u/W++DPOv
         id9w==
X-Gm-Message-State: ACgBeo2/g2YUVyw2CXUHS4GV/aigJ1w4nkhcuONxw8Vv5L0mrOKbfA5s
        RyXTX4ZVFVCTc9ILrHlMJC7j+chDf8DxKqvBxTUSPxadlD8kd+RQdKwmySxTUgL5SJg0WwHcwA+
        hgNxT0B1HyPWZ/BqMYr+58N0=
X-Received: by 2002:aa7:d6da:0:b0:43f:99fb:f3aa with SMTP id x26-20020aa7d6da000000b0043f99fbf3aamr22160325edr.370.1660141625986;
        Wed, 10 Aug 2022 07:27:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4VAc0+IYG2u+Juvtrw59sw1wSGBEY4Lj8PJ3cohltl8DOSL3cCzuTY8u6u6wwpGlkleBmgWQ==
X-Received: by 2002:aa7:d6da:0:b0:43f:99fb:f3aa with SMTP id x26-20020aa7d6da000000b0043f99fbf3aamr22160314edr.370.1660141625840;
        Wed, 10 Aug 2022 07:27:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id d11-20020a170906304b00b006fec4ee28d0sm2363771ejd.189.2022.08.10.07.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 07:27:04 -0700 (PDT)
Message-ID: <630bf451-28a0-91d2-5e55-b95bcbde82d0@redhat.com>
Date:   Wed, 10 Aug 2022 16:27:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Proposal: removal of old vb1 or custom streaming I/O drivers
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
References: <1ca14c26-2e47-b144-1f5a-02824e81269a@xs4all.nl>
 <ab206a11-0f96-2d97-c17f-1455527ece2a@xs4all.nl>
 <YvJa5znh+5Rj5xTt@pendragon.ideasonboard.com>
 <a071cf35-3ed6-3c1b-4546-d4536f1fb6f3@xs4all.nl>
 <20220810122409.5303e8f9@coco.lan>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220810122409.5303e8f9@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 8/10/22 12:24, Mauro Carvalho Chehab wrote:
> Em Wed, 10 Aug 2022 10:18:56 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> We have the following drivers still using vb1:
>>
>> PCI: saa7146, bt8xx, cx18
>> USB: zr364xx, tm6000
>> platform: ti/davinci/vpfe_capture, nxp/fsl-viu
>> staging: atomisp
>>
>> And these drivers rolls their own streaming I/O implementation:
>>
>> pci: meye
>> usb: cpia2
>> staging: stkwebcam (deprecated, to be removed by the end of the year)
>>
>> I think we should bite the bullet and move all of these drivers to staging,
>> mark them deprecated and delete them some time next year if nobody will
>> convert them to vb2.
>>
>> That includes atomisp: is that going anywhere? Unless someone does the
>> hard work of converting it to vb2 I think it should be removed as well.
> 
> There have been improvements at atomisp driver. Hans de Goede has been
> doing some work. As far as I understand, he's planning to get VB2 and
> libcamera support for it. I'm also working on it when I have some spare
> time available.

Correct I'm planning to convert the atomisp code to vb2. I hope to resume
work on this again soon-ish.

>> The two drivers most likely to still be in use somewhere are bt8xx and
>> cx18. If it turns out that we can't remove them (yet), then I can probably
>> justify the time to convert cx18 to vb2 myself.
> 
> Yeah, bt8xx is probably still widely used, specially on analog camera
> multi-port capture scenarios. Not sure about cx18 usage those days.
> 
> IMO, once we get bt8xx, atomisp (and maybe cx18) converted to VB2, it
> should be OK to remove the other drivers. 
> 
> For now, we can move them to staging, adding a TODO explaining that they
> should be ported to VB2 or they'll be removed.
> 
> Scheduling removal to the end of the year is probably not doable, as
> the patch moving them to staging would be merged only around Oct.
> We should grant at least two Kernel cycles for people to convert the
> drivers - assuming that someone would do that for some driver(s).
> 
>> And for bt8xx I would probably be willing to convert it to vb2 as well,
>> provided we can strip the overlay support from the driver (since, if memory
>> serves, vb2 doesn't support that) and convert it to vb2. It's a big job, though.
> 
> It sounds OK on my eyes to remove overlay support from bt8xx during VB2
> conversion. We should probably add a warning about such removal before
> that (see below).

About bt8xx support. At least in the Netherlands the cable companies have
stopped sending analog TV over the cable (only DVB now) so I've remove
my bt8xx tv-card from my machine after many years of using it.

I believe something similar is happening in most of the rest of Europe
at least.

Regards,

Hans

