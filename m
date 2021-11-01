Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C275B442115
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 20:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhKATyd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 15:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49958 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229560AbhKATyb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 15:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635796317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XF+GUpk7TRN42x7Cxid2d7J7w5atfm+lJIY3Ab+K3mk=;
        b=YNHMRFRDrh6wIlIpcdL0FA94T2SktYVyezHIF4mXoe1Yi4tsB0UdOiwEI7GNLin22zrZvI
        I5x++MaTAT6UhqYNvrhp14rbEZOK2xglbV14miVCN9vssHztd6ucYwZxooR2Ijih36DxZ2
        ZU7xO0hDV2uLcCC1wVfNLFKekgK08Lc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-FHf9476VMj6kvLVBTyYoJA-1; Mon, 01 Nov 2021 15:51:50 -0400
X-MC-Unique: FHf9476VMj6kvLVBTyYoJA-1
Received: by mail-ed1-f70.google.com with SMTP id w12-20020aa7da4c000000b003e28acbf765so4104931eds.6
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 12:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XF+GUpk7TRN42x7Cxid2d7J7w5atfm+lJIY3Ab+K3mk=;
        b=I/FvL+CarHpQ2RpnuGML+VmQsK15rbd1+RFg+c2vAnW+ZjBF4FTNaBWCR2MgE/X03q
         zuzZ+YtTbIOGMgDo/QKrcNsAglVKMgGiCGfJV9P0MHSQ3DOkM7ng+u/KsLUlzqNA62nh
         qP1LLU77fRnvHuwOM2/7WGUEt1xzFc8YVTpsYgDAPMKS2NLNya1/RRwhKZViCHkuJexx
         ZvoYT59zhOB6R15hJ9X/57gb+TXnSFjjj2fKmoSHL0aEICw/TyUDSCbAKTRCxZJT2Dmg
         eR1cifkKN7to059IMfXPBP65N+VD0IhOIU1NQhP7y2E6GWg2LWxs5vYPtbt9/rdS929x
         bZCw==
X-Gm-Message-State: AOAM530aAmRnb55K8OEFei3pQ3R73x8RU7HnPlibv4kMgDRzBJG2pgXq
        n1kOUTRYwgcis7zPQAZAOT791grFXp3vDSXtC48z8rkyGJBynrTsDIwBC7MZJmfk+TGpmsV0HqP
        fgb5ZuJnQnaQvICzqNq5J4sA=
X-Received: by 2002:a05:6402:4308:: with SMTP id m8mr43423780edc.188.1635796309335;
        Mon, 01 Nov 2021 12:51:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyg+hEtJbMt/kYfTRxWVaDdO8Dqp2X16CmbcMyDYc1ID5vn61YoKNXfEklwSYjJJ2umJXnDA==
X-Received: by 2002:a05:6402:4308:: with SMTP id m8mr43423753edc.188.1635796309127;
        Mon, 01 Nov 2021 12:51:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u16sm7331189ejy.16.2021.11.01.12.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 12:51:48 -0700 (PDT)
Message-ID: <f1761496-7974-7892-962b-e6079cb6d8ca@redhat.com>
Date:   Mon, 1 Nov 2021 20:51:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <YYA9bJ/DZp0+K0MB@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YYA9bJ/DZp0+K0MB@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/1/21 20:18, Andy Shevchenko wrote:
> On Mon, Nov 01, 2021 at 05:02:58PM +0100, Hans de Goede wrote:
>> On 10/29/21 13:50, Daniel Scally wrote:
> 
> ...
> 
>>> To throw a spanner in the works though; I noticed this delightful _CRS
>>> for the OV9734 sensor of a  Surface Laptop 1 earlier:
>>>
>>> Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
>>> {
>>>     Name (SBUF, ResourceTemplate ()
>>>     {
>>>         I2cSerialBusV2 (0x0036, ControllerInitiated, 0x00061A80,
>>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>>             0x00, ResourceConsumer, , Exclusive,
>>>             )
>>>         I2cSerialBusV2 (0x0050, ControllerInitiated, 0x00061A80,
>>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>>             0x00, ResourceConsumer, , Exclusive,
>>>             )
>>>         I2cSerialBusV2 (0x0051, ControllerInitiated, 0x00061A80,
>>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>>             0x00, ResourceConsumer, , Exclusive,
>>>             )
>>>         I2cSerialBusV2 (0x0052, ControllerInitiated, 0x00061A80,
>>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>>             0x00, ResourceConsumer, , Exclusive,
>>>             )
>>>         I2cSerialBusV2 (0x0053, ControllerInitiated, 0x00061A80,
>>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>>             0x00, ResourceConsumer, , Exclusive,
>>>             )
>>>     })
>>>     Return (SBUF) /* \_SB_.PCI0.I2C2.CAMF._CRS.SBUF */
>>> }
>>
>> Hmm, we do have i2c_acpi_client_count(adev), so it is easy to use
>> that and just always use the last resource for the VCM. But that assumes
>> that is what is going on here and I have no idea.
> 
> You probably composed this message before reading my reply(ies).

Yes, sorry about that; and thank you for your answer the info
you provided is very helpful. If I understand things correctly
will can just always take the 2nd I2cSerialBusV2 resource entry
for the VCM since if there is a VCM that is where its
I2cSerialBusV2 resource entry will be.

> ...
> 
>> Change the first parameter of i2c_acpi_new_device() from
>> a struct device * to a struct acpi_device *.
>>
>> This is necessary because in some cases we may only have access
>> to the fwnode / acpi_device and not to the matching physical-node
>> struct device *.
> 
> Can we rather create an fwnode based API and then
> 
> static inline
> struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
> 				       struct i2c_board_info *info)
> 	return i2c_acpi_new_device_by_fwnode(dev_fwnode(), index, info);
> }
> 
> ?

Yes that is a good idea, I'll switch to that in my local tree, so
v1 (which I will post once I've something working) will have this.

Regards,

Hans

