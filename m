Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C73A742ECA
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 22:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbjF2Uqx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 16:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjF2Uqv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 16:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CEF2D4A
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 13:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688071560;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f03GwBzM7n5SJ4HgzGb1IDhOxusW86RzuadfFdVQx44=;
        b=RbknWVdiqn8FUDMRVsQwLl9tJm6KDjwYc8mdhHfgbQL10ocTsf5YDe+2fEvy86spMSUb9v
        GK2l5vJXYYIrH3gSzDl/hqHol9rk9PJGgPrSS8/X20yAT3VLda30e2kfJq44JJKFtzByiN
        mjfZOCBFtQdJ//L5E9g8BVnFOU59i0A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-C9P9-Nh6NeifLC4uV9aQbw-1; Thu, 29 Jun 2023 16:45:59 -0400
X-MC-Unique: C9P9-Nh6NeifLC4uV9aQbw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-98e1085308eso124112666b.0
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 13:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688071557; x=1690663557;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f03GwBzM7n5SJ4HgzGb1IDhOxusW86RzuadfFdVQx44=;
        b=Jf21jyAGwuNATj8MGL9cCg/VRjX5qft9QvhzdpKSsDnrWtM9tbq3sk4l1vhlJeURjK
         0rqEw6KkDIKr0sAyB/8bXZwVJLzly/zvVVMeX/xYGsax1AvG8qM6+BG+REiKy6NFW1rt
         6cSMOF91VMbXY/4GUj8hWOwm0zK63EPfEDnPl36K21LyfD+49s6Zvw81IqueQ8oRCV90
         H7DVDTXR1XNMrIWRK/iAoy27Ih7Ny04vR65vPZJwl7wuRglDD/XSLu57rLw05SA1Bojt
         lL9rV5HMeGvSg9Nit/Ot36vvOPgNxqUCJFgg4vuCpyBaXOdxzBJXY5IoOZYLBAUsWY0Z
         Lpzg==
X-Gm-Message-State: AC+VfDwggOtwd8+ngkuzBiT86uT5gzK3gqgBHsOxRSjc8t2fmWjJl0kH
        LuAxrPKFOs71xYQ4jex09rd4+vkLzcjn9glNTtCz4/vsh8Tk1F6D546mcioOV5/0EbmVBR2VM0m
        mBvlBCtGGUyr9yyxwiZmDIfqFAUScDjI=
X-Received: by 2002:a17:907:1b1d:b0:992:8ee8:2a29 with SMTP id mp29-20020a1709071b1d00b009928ee82a29mr5199273ejc.0.1688071557754;
        Thu, 29 Jun 2023 13:45:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5pPbwAPaHQLQx+P70vO3DWEmzm09UtBsQjlWiVzWgju8//XQJZIWYuHHWyBMVtuEpcg1hFEA==
X-Received: by 2002:a17:907:1b1d:b0:992:8ee8:2a29 with SMTP id mp29-20020a1709071b1d00b009928ee82a29mr5199262ejc.0.1688071557484;
        Thu, 29 Jun 2023 13:45:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k7-20020a170906a38700b00985ed2f1584sm7154759ejz.187.2023.06.29.13.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 13:45:56 -0700 (PDT)
Message-ID: <972adcc7-63b1-5cb7-e425-cac4686e43c5@redhat.com>
Date:   Thu, 29 Jun 2023 22:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 00/12] media: intel-cio2-bridge: Add shared
 intel-cio2-bridge code, rework VCM instantiation
Content-Language: en-US, nl
To:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        "Yao, Hao" <hao.yao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <DM8PR11MB5653A2A59A5858F0880889369924A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <f943821e-360f-b46a-7bc6-b1696afe14c9@redhat.com>
 <DM8PR11MB56533BB556809D3083B80C269925A@DM8PR11MB5653.namprd11.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <DM8PR11MB56533BB556809D3083B80C269925A@DM8PR11MB5653.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/29/23 10:22, Cao, Bingbu wrote:
> Hans,
> 
> 
> ------------------------------------------------------------------------
> BRs,  
> Bingbu Cao 
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Wednesday, June 28, 2023 21:57
>> To: Cao, Bingbu <bingbu.cao@intel.com>; Sakari Ailus
>> <sakari.ailus@linux.intel.com>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; Daniel Scally
>> <dan.scally@ideasonboard.com>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Andy Shevchenko
>> <andy@kernel.org>; Kate Hsuan <hpa@redhat.com>; Yao, Hao
>> <hao.yao@intel.com>; linux-media@vger.kernel.org
>> Subject: Re: [PATCH 00/12] media: intel-cio2-bridge: Add shared intel-cio2-
>> bridge code, rework VCM instantiation
>>
>> Hi Bingbu,
>>
>> On 6/28/23 03:19, Cao, Bingbu wrote:
>>> Hans,
>>>
>>> Thanks for your patch.
>>>
>>> ----------------------------------------------------------------------
>>> --
>>> BRs,
>>> Bingbu Cao
>>>
>>>> -----Original Message-----
>>>> From: Hans de Goede <hdegoede@redhat.com>
>>>> Sent: Wednesday, June 28, 2023 01:57
>>>> To: Sakari Ailus <sakari.ailus@linux.intel.com>; Laurent Pinchart
>>>> <laurent.pinchart@ideasonboard.com>; Daniel Scally
>>>> <dan.scally@ideasonboard.com>
>>>> Cc: Hans de Goede <hdegoede@redhat.com>; Mauro Carvalho Chehab
>>>> <mchehab@kernel.org>; Andy Shevchenko <andy@kernel.org>; Kate Hsuan
>>>> <hpa@redhat.com>; Yao, Hao <hao.yao@intel.com>; Cao, Bingbu
>>>> <bingbu.cao@intel.com>; linux-media@vger.kernel.org
>>>> Subject: [PATCH 00/12] media: intel-cio2-bridge: Add shared
>>>> intel-cio2- bridge code, rework VCM instantiation
>>>>
>>>> Hi All,
>>>>
>>>> While working on adding (proper) VCM support to the atomisp code I
>>>> found myself copying yet more code from
>>>> drivers/media/pci/intel/ipu3/cio2-
>>>> bridge.c into the atomisp code.
>>>>
>>>> So I decided that it really was time to factor out the common code
>>>> (most of the code) from intel/ipu3/cio2-bridge.c into its own helper
>>>> library and then share it between the atomisp and IPU3 code.
>>>>
>>>> This will hopefully also be useful for the ongoing work to upstream
>>>> IPU6 input system support which also needs this functionality and
>>>> currently contains a 3th copy of this code in the out of tree driver.
>>>>
>>>> This set consists of the following parts:
>>>>
>>>> Patch 1     A bugfix for a recent change to the cio2-bridge code
>>>> Patches 2-8 Cleanup / preparation patches
>>>> Patch 9     Move the main body of the cio2-bridge.c code into
>>>>            a new shared intel-cio2-bridge module
>>>
>>> Another cio2-bridge patch -
>>> https://patchwork.kernel.org/project/linux-media/patch/20230517103004.
>>> 724264-1-bingbu.cao@intel.com/ I remember Sakari include it in the
>>> latest pull request.
>>
>> Ah, yes looks like I need to rebase this on top of that patch, as Dan also
>> mentioned in another reply.
>>
>> But I don't see this patch in media-staging yet:
>> https://git.linuxtv.org/media_stage.git/log/
>>
>> Is there a branch for the pull-request on which I can rebase this available
>> somewhere ?
> 
> I see they are in Sakari's repo -
> https://git.linuxtv.org/sailus/media_tree.git/log/?h=for-6.6-1.4-signed

Thank you.

I'll rebase and send out a new version.

Regards,

Hans




>>>> Patch 10    Drop cio2-bridge code copy from atomisp, switching to
>>>>            the shared intel-cio2-bridge module
>>>> Patch 11    Rework how VCM client instantiation is done so that
>>>>            a device-link can be added from VCM to sensor to
>>>>            fix issues with the VCM power-state being tied to
>>>>            the sensor power state
>>>> Patch 12    Example patch to show how patch 11 avoids the need
>>>>            for hacks in VCM drivers caused by the shared power state
>>>>            (not intended for merging)
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>> Hans de Goede (12):
>>>>  media: ipu3-cio2: Do not use on stack memory for software_node.name
>>>>    field
>>>>  media: ipu3-cio2: Move initialization of node_names.vcm to
>>>>    cio2_bridge_init_swnode_names()
>>>>  media: ipu3-cio2: Make cio2_bridge_init() take a regular struct device
>>>>    as argument
>>>>  media: ipu3-cio2: Store dev pointer in struct cio2_bridge
>>>>  media: ipu3-cio2: Only keep PLD around while parsing
>>>>  media: ipu3-cio2: Add a cio2_bridge_parse_sensor_fwnode() helper
>>>>    function
>>>>  media: ipu3-cio2: Add a parse_sensor_fwnode callback to
>>>>    cio2_bridge_init()
>>>>  media: ipu3-cio2: Add supported_sensors parameter to
>>>>    cio2_bridge_init()
>>>>  media: ipu3-cio2: Move cio2_bridge_init() code into a new shared
>>>>    intel-cio2-bridge.ko
>>>>  media: atomisp: csi2-bridge: Switch to new common cio2_bridge_init()
>>>>  media: intel-cio2-bridge: Add a runtime-pm device-link between VCM and
>>>>    sensor
>>>>  [RFC] media: dw9719: Drop hack to enable "vsio" regulator
>>>>
>>>> MAINTAINERS                                   |   9 +
>>>> drivers/media/common/Kconfig                  |   4 +
>>>> drivers/media/common/Makefile                 |   1 +
>>>> drivers/media/common/intel-cio2-bridge.c      | 464 ++++++++++++++++++
>>>> drivers/media/i2c/dw9719.c                    |  27 +-
>>>> drivers/media/pci/intel/ipu3/Kconfig          |   1 +
>>>> drivers/media/pci/intel/ipu3/cio2-bridge.c    | 464 +++---------------
>>>> drivers/media/pci/intel/ipu3/cio2-bridge.h    | 146 ------
>>>> drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   7 +-
>>>> drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   7 +-
>>>> drivers/staging/media/atomisp/Kconfig         |   2 +
>>>> .../staging/media/atomisp/pci/atomisp_csi2.h  |  67 ---
>>>> .../media/atomisp/pci/atomisp_csi2_bridge.c   | 307 ++----------
>>>> include/media/intel-cio2-bridge.h             | 105 ++++
>>>> 14 files changed, 723 insertions(+), 888 deletions(-)  create mode
>>>> 100644 drivers/media/common/intel-cio2-bridge.c
>>>> delete mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
>>>> create mode 100644 include/media/intel-cio2-bridge.h
>>>>
>>>> --
>>>> 2.41.0
>>>
> 

