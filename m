Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26B307639C4
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 17:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbjGZPAl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 11:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbjGZPAj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 11:00:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D342137
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690383590;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lJMF9LzzPNqBVN3P1BEd2BHKU8Jyc/6qhmCqGoJE7EM=;
        b=exK7rH4ok9BiG7RLuv9N99X4URO987HGx3wXQucP99midpmUNrBH/vvU/Y2KRHkPrtu9OI
        tzqJ799xjNJ+lrWEmIB8svJ7wujNmOZ5X7WKLxok4ndZczvFetgkk5p4rlg/J2Tm/PEC8G
        0Wahw/rh0B+uNGUDs/sV9ZbMiUcW4Wo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-5KABLemzP4eUWfa18AiObg-1; Wed, 26 Jul 2023 10:59:49 -0400
X-MC-Unique: 5KABLemzP4eUWfa18AiObg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4fb748a83b4so5964061e87.2
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 07:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690383587; x=1690988387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJMF9LzzPNqBVN3P1BEd2BHKU8Jyc/6qhmCqGoJE7EM=;
        b=k6dMkFQx/n8M81U10Qg/ylhmZMcQDQY2/aKC8Uu4DMRq7aD0cm9bxto8zB09IQUwX1
         BB6F+HYKXSocUUMNXpcxR2pr3CmzmViHpWSVNyfo4r1jNf+731X47Ga72bNqtnqkyqps
         KsI3DLACCiZy//dAviOhbsg9UbreYSKy1SQcJtAFA/0fgCwaTvu3kUy5XMlHJxJOU+Fi
         cKmOHFFQWBvlFo41LZYHUCPBHRgQl6xH2ZaglsqI0bAMaiywHDKq766nRKBjhr48SIpA
         ejRTFg0GMqEhJnvdSC6lIToHZwG2d66fpsz5cC4rHpQsWp3JbFqHQ4o5z3OSoNy3pcH/
         vuVQ==
X-Gm-Message-State: ABy/qLbBM8ph7AYqASDCMZ2wRm8l6bkkJce7R7j5uuZ87jLwlYf2Y/Q+
        4ywEuW6a9uAnVNjT3TlndtFWJPb0Q/nhyvQ1YPBMgrLGhhyrqGVnqasEAWdrCTwdwHC+bxAkCpL
        NMOFmWkmef7bzAtJUvE969iQ=
X-Received: by 2002:a05:6512:2030:b0:4fe:c40:3583 with SMTP id s16-20020a056512203000b004fe0c403583mr1416343lfs.39.1690383587759;
        Wed, 26 Jul 2023 07:59:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGfjw+xBa4NmPtRFoaGioLqISBqspdvCpM6W0plVO8/ha3LOl8KBGeaWuVQNQS9994+Bxo2jQ==
X-Received: by 2002:a05:6512:2030:b0:4fe:c40:3583 with SMTP id s16-20020a056512203000b004fe0c403583mr1416325lfs.39.1690383587406;
        Wed, 26 Jul 2023 07:59:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l2-20020a170906230200b00997e52cb30bsm9573752eja.121.2023.07.26.07.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 07:59:46 -0700 (PDT)
Message-ID: <5be97e28-2a05-8bdc-fdc2-91de0ee0ac77@redhat.com>
Date:   Wed, 26 Jul 2023 16:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] media: atomisp: Remove empty isys_public.h
To:     Kate Hsuan <hpa@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230715170906.3627-1-hdegoede@redhat.com>
 <CAEth8oGmY+GTGw2Xs61GbD1uFycoCSetk1NQecphp4Sw9XbM0g@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAEth8oGmY+GTGw2Xs61GbD1uFycoCSetk1NQecphp4Sw9XbM0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kate,

On 7/17/23 05:23, Kate Hsuan wrote:
> Hi Hans.
> 
> On Sun, Jul 16, 2023 at 1:09 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> isys_public.h is empty, remove it.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../hive_isp_css_include/host/isys_public.h   | 19 -------------------
>>  .../atomisp/pci/isp2400_input_system_public.h |  1 -
>>  2 files changed, 20 deletions(-)
>>  delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
>>
>> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
>> deleted file mode 100644
>> index 9dacef7a5cc1..000000000000
>> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0 */
>> -/*
>> - * Support for Intel Camera Imaging ISP subsystem.
>> - * Copyright (c) 2015, Intel Corporation.
>> - *
>> - * This program is free software; you can redistribute it and/or modify it
>> - * under the terms and conditions of the GNU General Public License,
>> - * version 2, as published by the Free Software Foundation.
>> - *
>> - * This program is distributed in the hope it will be useful, but WITHOUT
>> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> - * more details.
>> - */
>> -
>> -#ifndef __ISYS_PUBLIC_H_INCLUDED__
>> -#define __ISYS_PUBLIC_H_INCLUDED__
>> -
>> -#endif /* __ISYS_PUBLIC_H_INCLUDED__ */
>> diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
>> index 375c0db84b55..b1360eeb58df 100644
>> --- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
>> +++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
>> @@ -17,7 +17,6 @@
>>  #define __INPUT_SYSTEM_2400_PUBLIC_H_INCLUDED__
>>
>>  #include <type_support.h>
>> -#include "isys_public.h"
>>
>>  typedef struct receiver_state_s                        receiver_state_t;
>>
>> --
>> 2.41.0
>>
> 
> Thank you for working on this.
> 
> This file can be removed and it looks for me.
> 
> Reviewed-by: Kate Hsuan <hpa@redhat.com>

Thank you for the reviews.

I've pushed all 3 patches to my hansg/media-atomisp branch now.

Regards,

Hans




