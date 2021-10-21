Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8223F436ADC
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 20:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhJUSsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 14:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57748 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232343AbhJUSsx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 14:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634841997;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dwo9VIX6lsiT4Wv1KFdeEER1lG1DpM8l88ri6KFwDGU=;
        b=KIwy2sQZzLeJOk9c356WbOuWq40T622lBuF6Ey5wDqVwhS6sTJVy6oQ9Z+Pqb/k3K4tzKr
        LgjgnPSvKiug8nX2WYasTlWwrqNyQAdLOHS2VDLvwaWHnNzHityMmlrOFJ3D2uH+SLhi3T
        9a03chZEImaHw7kfOoXDKJCD3jxZBeQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-fr_ZdQHpNEmnCZEEcs6ceA-1; Thu, 21 Oct 2021 14:46:35 -0400
X-MC-Unique: fr_ZdQHpNEmnCZEEcs6ceA-1
Received: by mail-ed1-f70.google.com with SMTP id p20-20020a50cd94000000b003db23619472so1258248edi.19
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 11:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dwo9VIX6lsiT4Wv1KFdeEER1lG1DpM8l88ri6KFwDGU=;
        b=NGPzWvXj0otoL+ss3asXFiQSkv85uhl+zuPoNzU1T4v7vyWBKf4gxWMBzMGOWJcDFY
         +A+djvQckZ5mZ+ZXATG074NK317txPR3WL++3NKg9sL4AGN23G45vtPKgBG2kT/FAE0E
         tdSxTZ9G1iv60e08AWJeGLTLGOCMujFxYziw+eS6eUjrE5w6CQm3qLPGoaAYmlSWxioO
         arCKI2n2kYbta+YtO2ivx0Sg3spFG3mW1apBqPsnlKonTxQZ/U8dgKpnZ1yOg7MQNyVf
         FLSU8N0mIjV6VC2QF89MdAWL67c5OFlNnn+XDRF9MVeIy/ZFPLQfB2SlPa3fRkGp6amx
         rdgw==
X-Gm-Message-State: AOAM5335q9jKXpjzc9tQn3F1xPlWmcKWURWds9Lg3sLU0L+Rxw900iyN
        983kwYZFFkus1E4Es+rN9cEZVaDYPRCXNx0mdsxKcsoMYbvX5Ae7JqoI+eUUCgq9ho6sv7IQyUh
        vIm/z1RPCB1e+GQizIvNpWBA=
X-Received: by 2002:a17:907:3d9e:: with SMTP id he30mr9106406ejc.348.1634841994172;
        Thu, 21 Oct 2021 11:46:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTboahS2w3/VAWWqbsfGX7K2SRfYOLcs9i8Sc9rVRRFwLr9tDOPWnBjoOK41QqrMRAhs3NRQ==
X-Received: by 2002:a17:907:3d9e:: with SMTP id he30mr9106364ejc.348.1634841993903;
        Thu, 21 Oct 2021 11:46:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v15sm3215225edi.89.2021.10.21.11.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 11:46:31 -0700 (PDT)
Message-ID: <a2aa76c3-a8bb-99ef-9f5a-e62cc503a1e2@redhat.com>
Date:   Thu, 21 Oct 2021 20:46:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 16/17] [NOT-FOR-MERGE] media: atomsip: pci: add DMI match
 for Microsoft Surface 3 with broken DMI (OEMB)
Content-Language: en-US
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aniket Bhattacharyea <aniketmail669@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-17-kitakar@gmail.com>
 <71b5b886-2ca1-27a9-6776-b3bcc430e5ed@redhat.com>
 <ace1264d7254f7159865602614d70caf7ff4b609.camel@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ace1264d7254f7159865602614d70caf7ff4b609.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/21/21 11:46, Tsuchiya Yuto wrote:
> On Mon, 2021-10-18 at 09:56 +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 10/17/21 18:19, Tsuchiya Yuto wrote:
>>> This commit is added for Surface 3 with broken DMI table. HACK-ish.
>>> Not intended for upstreaming. Thus, NOT-FOR-MERGE. But, if someone
>>> knows a nicer way to address this, comments are welcome...
>>>
>>>> 8-----------------------------------------------------------------8<
>>>
>>> On some Microsoft Surface 3, the DMI table gets corrupted for unknown
>>> reasons and breaks existing DMI matching used for device-specific quirks.
>>>
>>> This commit adds the (broken) DMI data into dmi_system_id tables used
>>> for quirks so that the driver can enable quirks even on the affected
>>> systems.
>>>
>>> On affected systems, the DMI data will look like this:
>>>
>>>         $ grep . /sys/devices/virtual/dmi/id/{bios_vendor,board_name,board_vendor,\
>>>         chassis_vendor,product_name,sys_vendor}
>>>         /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
>>>         /sys/devices/virtual/dmi/id/board_name:OEMB
>>>         /sys/devices/virtual/dmi/id/board_vendor:OEMB
>>>         /sys/devices/virtual/dmi/id/chassis_vendor:OEMB
>>>         /sys/devices/virtual/dmi/id/product_name:OEMB
>>>         /sys/devices/virtual/dmi/id/sys_vendor:OEMB
>>
>> I wonder what the bios_date field contains ? Typically when the DMI strings
>> are no good (e.g. often they contain "Default String" or "To be filled by OEM")
>> we add a check on the bios-date, which together with the broken strings is
>> considered unique enough to still allow a match with broken strings in the
>> kernel.
> 
> Thank you so much for the comment :-)
> 
> Here is the full output of "/sys/devices/virtual/dmi/id/*" (not showing
> files that need root permission to read):
> 
>         $ grep . /sys/devices/virtual/dmi/id/*
>         /sys/devices/virtual/dmi/id/bios_date:03/09/2015
>         /sys/devices/virtual/dmi/id/bios_release:5.6
>         /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
>         /sys/devices/virtual/dmi/id/bios_version:1.51116.238

Interesting, this is the latest BIOS from july 2019 according to:
https://support.microsoft.com/en-us/surface/surface-3-update-history-5d86a7bc-03f7-2d27-d858-e90ce637fb52
yet the date is still set to 03/09/2015.

I just checked and the BIOS with not corrupted DMI strings also keeps
the date at 03/09/2015 in BIOS updates.

So the date is correct, and together with matching a coupleof the OEMB-s
(which I've never seen anywhere else either) this should be plenty
unique.

So this not only allows adding this mathc to atomisp, but also to fix
sound + wmi on bad DMI data OEMB Surface 3-s, by updating this patch:

https://github.com/linux-surface/linux-surface/blob/2fb7e9ae91350098db9a280277f424272816a9ab/patches/5.5/0003-surface3-oemb.patch

To include the BIOS-date match and then submitting this upstream
(as 2 separate patches please).

Tsuchiya, I take it that your Surface 3 has the OEMB issue, so you
can actually test this ?

If you can prepare 2 patches for the sound + wmi then; and submit
them upstream that would be great. Please Cc me on both patches.

Regards,

Hans






>         /sys/devices/virtual/dmi/id/board_name:OEMB
>         grep: /sys/devices/virtual/dmi/id/board_serial: Permission denied
>         /sys/devices/virtual/dmi/id/board_vendor:OEMB
>         /sys/devices/virtual/dmi/id/board_version:00
>         grep: /sys/devices/virtual/dmi/id/chassis_serial: Permission denied
>         /sys/devices/virtual/dmi/id/chassis_type:9
>         /sys/devices/virtual/dmi/id/chassis_vendor:OEMB
>         /sys/devices/virtual/dmi/id/modalias:dmi:bvnAmericanMegatrendsInc.:bvr1.51116.238:bd03/09/2015:br5.6:svnOEMB:pnOEMB:pvrB16D0SM1C4G1X1:rvnOEMB:rnOEMB:rvr00:cvnOEMB:ct9:cvr:sku:
>         grep: /sys/devices/virtual/dmi/id/power: Is a directory
>         /sys/devices/virtual/dmi/id/product_name:OEMB
>         grep: /sys/devices/virtual/dmi/id/product_serial: Permission denied
>         grep: /sys/devices/virtual/dmi/id/product_uuid: Permission denied
>         /sys/devices/virtual/dmi/id/product_version:B16D0SM1C4G1X1
>         grep: /sys/devices/virtual/dmi/id/subsystem: Is a directory
>         /sys/devices/virtual/dmi/id/sys_vendor:OEMB
>         /sys/devices/virtual/dmi/id/uevent:MODALIAS=dmi:bvnAmericanMegatrendsInc.:bvr1.51116.238:bd03/09/2015:br5.6:svnOEMB:pnOEMB:pvrB16D0SM1C4G1X1:rvnOEMB:rnOEMB:rvr00:cvnOEMB:ct9:cvr:sku:
> 
> The "bios_date" ("03/09/2015") looks not broken.
> 
> I also noticed when writing this mail, regarding the ones that need root
> permission to read, "board_serial" and "chassis_serial" are now empty.
> "product_serial" now shows "OEM":
> 
>         $ sudo cat /sys/devices/virtual/dmi/id/product_serial
>         OEM
> 
> "product_uuid" looks not broken.
> 
>> Also have you tried doing something like "load bios/setup defaults" in
>> the BIOS setup ? Maybe that helps ?
> 
> Unfortunately, there is no option like this...
> 
> Regards,
> Tsuchiya Yuto
> 

