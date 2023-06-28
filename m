Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D39741322
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 15:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbjF1N6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 09:58:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30375 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230270AbjF1N6U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 09:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687960648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TyekAqzQ9iB8Ezg9x5ZxJmX0nm6iWMF3ioFxoTUmXA4=;
        b=M9qsuRDH9jCtknzcd6fgeVXjXc7I1Gp4HLwdPLz9ipKGftChvw6RqRrYVqGR8VjmdP96sE
        MxaEr+Q79gGrpiRDVi0uGl9GCJ5EyblODgGH7Hs/8dd+EnQ52C6izRSDvCklsIETvEsYxH
        4DpINmsZfkKgfcwmZEZrnhWdiS0SKMA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-TJjZCRv6M5aDQqPfaF7GYQ-1; Wed, 28 Jun 2023 09:57:26 -0400
X-MC-Unique: TJjZCRv6M5aDQqPfaF7GYQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94f7a2b21fdso506475566b.2
        for <linux-media@vger.kernel.org>; Wed, 28 Jun 2023 06:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687960643; x=1690552643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyekAqzQ9iB8Ezg9x5ZxJmX0nm6iWMF3ioFxoTUmXA4=;
        b=K1EVHzWmOwOoYLHFlI+gfOesv9UCrHTJtUz/lsCy8SbIvfz9IOEgMk3/kfs98quDtr
         nbYadyBBvY9FkhXoyuKLaq0VMExtmYJhNhhf4aXrxVK/xUU58mMsYHKR1Eof/ZJcaExK
         LMOnyAItZa+9QG9D4yoCc5M9YSWnmR5e3UtZowvtvonhxLkDEsY77HOOXFd6GaCFUj+q
         ZbDkERYn6uiAZ6LAQV9vXUyEAWaNX6SqsxCbvqc21q9FAH/z3oBpy2uXKSzyyLaznMcF
         yt8kzc4fVOwgRl2McN+dDxp6K3ShHYSrrGlZ4m/ucT9NNnKLoSNGqnojkgxBHFMOsCd0
         mLqA==
X-Gm-Message-State: AC+VfDzXeHX9YHu2zHR759zmmd2Dgb24vg8KKEDEeMxnxvgJiy9E1epQ
        R27fxzHwi6V+SPlFQNYIkzHLQ6QveMltKowkIeYwfSD8pvHiFYmQPQe2Xi8+CZQ4bNPxN/7CpEO
        DM3/dewQL6faEEJZUiMU3yNI=
X-Received: by 2002:a17:907:3f87:b0:97d:9b73:690b with SMTP id hr7-20020a1709073f8700b0097d9b73690bmr34998367ejc.59.1687960643046;
        Wed, 28 Jun 2023 06:57:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7tVt50P39iJphpef1DTohck9xJCSkr/9BbkTcht0qZ6iZCSjEgovaCJTrHwmogPQhuiYyysw==
X-Received: by 2002:a17:907:3f87:b0:97d:9b73:690b with SMTP id hr7-20020a1709073f8700b0097d9b73690bmr34998359ejc.59.1687960642785;
        Wed, 28 Jun 2023 06:57:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b21-20020a170906491500b009828dac8425sm5679139ejq.105.2023.06.28.06.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 06:57:21 -0700 (PDT)
Message-ID: <f943821e-360f-b46a-7bc6-b1696afe14c9@redhat.com>
Date:   Wed, 28 Jun 2023 15:57:20 +0200
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <DM8PR11MB5653A2A59A5858F0880889369924A@DM8PR11MB5653.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On 6/28/23 03:19, Cao, Bingbu wrote:
> Hans,
> 
> Thanks for your patch.
> 
> ------------------------------------------------------------------------
> BRs,  
> Bingbu Cao 
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Wednesday, June 28, 2023 01:57
>> To: Sakari Ailus <sakari.ailus@linux.intel.com>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; Daniel Scally
>> <dan.scally@ideasonboard.com>
>> Cc: Hans de Goede <hdegoede@redhat.com>; Mauro Carvalho Chehab
>> <mchehab@kernel.org>; Andy Shevchenko <andy@kernel.org>; Kate Hsuan
>> <hpa@redhat.com>; Yao, Hao <hao.yao@intel.com>; Cao, Bingbu
>> <bingbu.cao@intel.com>; linux-media@vger.kernel.org
>> Subject: [PATCH 00/12] media: intel-cio2-bridge: Add shared intel-cio2-
>> bridge code, rework VCM instantiation
>>
>> Hi All,
>>
>> While working on adding (proper) VCM support to the atomisp code I found
>> myself copying yet more code from drivers/media/pci/intel/ipu3/cio2-
>> bridge.c into the atomisp code.
>>
>> So I decided that it really was time to factor out the common code (most of
>> the code) from intel/ipu3/cio2-bridge.c into its own helper library and
>> then share it between the atomisp and IPU3 code.
>>
>> This will hopefully also be useful for the ongoing work to upstream
>> IPU6 input system support which also needs this functionality and currently
>> contains a 3th copy of this code in the out of tree driver.
>>
>> This set consists of the following parts:
>>
>> Patch 1     A bugfix for a recent change to the cio2-bridge code
>> Patches 2-8 Cleanup / preparation patches
>> Patch 9     Move the main body of the cio2-bridge.c code into
>>            a new shared intel-cio2-bridge module
> 
> Another cio2-bridge patch - https://patchwork.kernel.org/project/linux-media/patch/20230517103004.724264-1-bingbu.cao@intel.com/
> I remember Sakari include it in the latest pull request. 

Ah, yes looks like I need to rebase this on top of that patch,
as Dan also mentioned in another reply.

But I don't see this patch in media-staging yet:
https://git.linuxtv.org/media_stage.git/log/

Is there a branch for the pull-request on which I can rebase this
available somewhere ?

Regards,

Hans




> 
>> Patch 10    Drop cio2-bridge code copy from atomisp, switching to
>>            the shared intel-cio2-bridge module
>> Patch 11    Rework how VCM client instantiation is done so that
>>            a device-link can be added from VCM to sensor to
>>            fix issues with the VCM power-state being tied to
>>            the sensor power state
>> Patch 12    Example patch to show how patch 11 avoids the need
>>            for hacks in VCM drivers caused by the shared power state
>>            (not intended for merging)
>>
>> Regards,
>>
>> Hans
>>
>>
>> Hans de Goede (12):
>>  media: ipu3-cio2: Do not use on stack memory for software_node.name
>>    field
>>  media: ipu3-cio2: Move initialization of node_names.vcm to
>>    cio2_bridge_init_swnode_names()
>>  media: ipu3-cio2: Make cio2_bridge_init() take a regular struct device
>>    as argument
>>  media: ipu3-cio2: Store dev pointer in struct cio2_bridge
>>  media: ipu3-cio2: Only keep PLD around while parsing
>>  media: ipu3-cio2: Add a cio2_bridge_parse_sensor_fwnode() helper
>>    function
>>  media: ipu3-cio2: Add a parse_sensor_fwnode callback to
>>    cio2_bridge_init()
>>  media: ipu3-cio2: Add supported_sensors parameter to
>>    cio2_bridge_init()
>>  media: ipu3-cio2: Move cio2_bridge_init() code into a new shared
>>    intel-cio2-bridge.ko
>>  media: atomisp: csi2-bridge: Switch to new common cio2_bridge_init()
>>  media: intel-cio2-bridge: Add a runtime-pm device-link between VCM and
>>    sensor
>>  [RFC] media: dw9719: Drop hack to enable "vsio" regulator
>>
>> MAINTAINERS                                   |   9 +
>> drivers/media/common/Kconfig                  |   4 +
>> drivers/media/common/Makefile                 |   1 +
>> drivers/media/common/intel-cio2-bridge.c      | 464 ++++++++++++++++++
>> drivers/media/i2c/dw9719.c                    |  27 +-
>> drivers/media/pci/intel/ipu3/Kconfig          |   1 +
>> drivers/media/pci/intel/ipu3/cio2-bridge.c    | 464 +++---------------
>> drivers/media/pci/intel/ipu3/cio2-bridge.h    | 146 ------
>> drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   7 +-
>> drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   7 +-
>> drivers/staging/media/atomisp/Kconfig         |   2 +
>> .../staging/media/atomisp/pci/atomisp_csi2.h  |  67 ---
>> .../media/atomisp/pci/atomisp_csi2_bridge.c   | 307 ++----------
>> include/media/intel-cio2-bridge.h             | 105 ++++
>> 14 files changed, 723 insertions(+), 888 deletions(-)  create mode 100644
>> drivers/media/common/intel-cio2-bridge.c
>> delete mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
>> create mode 100644 include/media/intel-cio2-bridge.h
>>
>> --
>> 2.41.0
> 

