Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73C6273190F
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 14:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244403AbjFOMjW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 08:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbjFOMjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 08:39:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9055F1FE5
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686832719;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4y5XlF7+P4puBisHahWVb8CkbwNpV9TQalR2O3xuL3g=;
        b=ceV4i9sPrQy+r6jVcqVgfVs4jwc8Ui8uZ+UlPkPQ+aQbYF0nM//r+Dlecgs1gWL20Dwp9R
        12T1In3UW8shvCM4tEZHuFuskrkGs23u3QmgybPBAMkqxzHfsWZoSY71Sj+DvhhYyGR0N7
        NFuRvGZdq3j6sZazDFHwLMFa8HyNdE0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-yU9wU-OHOJ--q_rjXzubtQ-1; Thu, 15 Jun 2023 08:38:38 -0400
X-MC-Unique: yU9wU-OHOJ--q_rjXzubtQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-514a6909c35so7112521a12.3
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 05:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686832717; x=1689424717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4y5XlF7+P4puBisHahWVb8CkbwNpV9TQalR2O3xuL3g=;
        b=V0L4ILowxHtGsagyq9Ubz4hiRGKInp52SibItIH14OQWS2gY9KRxrwRQh0+QRxFDys
         BTINQv2AsCU/GTY0VQjQIlCFhKzyckK7y6ZpmzKpR49TPu+5OTDzLCXetDkKXTCyTl2P
         x2HYKXA21nbJrMETiJanFa8KPDwFuXbpS/gzEeiDVq6U/Dty6StlxMM7PEXqwGtscLGh
         8R7p6M/B4Unj0+JjBArcx/0YnEcktUI1Dn5u+4ahvTq6kzenY5Mx+fmNY3MTKT/+4IYw
         xN0ZCdF9QIH+Urps5o1saLxfBADglc2z2Pfe7pRjgrFftDtzqLSRfY2YcUe36ciim3au
         x63A==
X-Gm-Message-State: AC+VfDxZd208ZwqQYzYHmAZL6z3iyMi+tbuCVrJ6f1UFRl16q5S96LSS
        Rhr8gorAZsMPcF9G+Y2EIFXWM+CIy0820231hUCDwYuPqoEphrKIxb6VPdwoFODCuL0JGcsFBWG
        Ep6t2EF2UjN8i9c9QH1FtZLo=
X-Received: by 2002:a05:6402:1acc:b0:519:608a:142 with SMTP id ba12-20020a0564021acc00b00519608a0142mr2913999edb.33.1686832717549;
        Thu, 15 Jun 2023 05:38:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+qIZ7tAmzegaBiAZKQ8qhI6L0DzRMftKtOqVHNA9h3sit8G1ZKZxiLY0YhH4WoepECeAj2A==
X-Received: by 2002:a05:6402:1acc:b0:519:608a:142 with SMTP id ba12-20020a0564021acc00b00519608a0142mr2913982edb.33.1686832717226;
        Thu, 15 Jun 2023 05:38:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s3-20020a056402164300b00510d8e43fe0sm8870903edx.7.2023.06.15.05.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 05:38:35 -0700 (PDT)
Message-ID: <0f58b3ca-125f-d4c6-9f7f-87a240e945dc@redhat.com>
Date:   Thu, 15 Jun 2023 14:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/4] platform/x86: int3472: discrete: Regulator rework /
 Lenovo Miix 510 support
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20230609204228.74967-1-hdegoede@redhat.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230609204228.74967-1-hdegoede@redhat.com>
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

Hi All,

On 6/9/23 22:42, Hans de Goede wrote:
> Hi Dan, Hao Yao and Bingbu Cao,
> 
> Patches 1/2 drop the sensor-config stuff since I thought we should be
> able to make things work without any board specific fixups.
> 
> This is the result of my working on getting IPU6 to work on Jasper Lake
> for $dayjob and then tonight I switched to trying to get the ov2680
> on the Lenovo Miix 510 to work and it turns out that does require some
> board specific workarounds after all :|
> 
> With this series together with my recent ov2680 sensor driver series:
> https://lore.kernel.org/linux-media/20230607164712.63579-1-hdegoede@redhat.com/
> I can get the ov2680 driver to load and successfully read the id register:
> 
> [   11.365319] ipu3-cio2 0000:00:14.3: Found supported sensor OVTI2680:00
> [   11.431595] ov2680 i2c-OVTI2680:00: supply DOVDD not found, using dummy regulator
> [   11.433125] ov2680 i2c-OVTI2680:00: supply DVDD not found, using dummy regulator
> [   11.454698] ov2680 i2c-OVTI2680:00: sensor_revision id = 0x2680, rev= 0
> 
> Dan, currently the DMI match used only matches the 12IKB version of
> the Miix 510 I think you have a 12ISK version. Can you verify this
> works there too?  I guess we can just drop the KB part of the DMI
> match if this works on the 12ISK version too.
> 
> Hao Yao and Bingbu Cao I think that the way the issue with how different
> drivers may expect different regulator supply-ids is of interest to you
> too. Note I see that the mainline version of ov13b10.c does not have
> regulator support at all yet. So when adding this please just use
> one of the existing set of supply-names + the bulk API like how
> the ov5693.c driver is doing. In this case no int3472 driver changes
> will be necessary at all.

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans




> Hans de Goede (4):
>   platform/x86: int3472: discrete: Drop GPIO remapping support
>   platform/x86: int3472: discrete: Remove sensor_config-s
>   platform/x86: int3472: discrete: Add support for 1 GPIO regulator
>     shared between 2 sensors
>   platform/x86: int3472: discrete: Add alternative "AVDD" regulator
>     supply name
> 
>  .../x86/intel/int3472/clk_and_regulator.c     | 72 ++++++++++++++----
>  drivers/platform/x86/intel/int3472/common.h   | 14 +---
>  drivers/platform/x86/intel/int3472/discrete.c | 76 ++-----------------
>  3 files changed, 66 insertions(+), 96 deletions(-)
> 

