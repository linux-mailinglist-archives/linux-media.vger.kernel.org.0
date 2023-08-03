Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E49376E459
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233795AbjHCJ3x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbjHCJ3q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:29:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1AEE30F1
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691054939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t+T2vOXvX4Ef3nxyLx3bZY2XiKpz8ch1uCCnr4/n+bM=;
        b=QyTBromYrkvFiEncE1v7+VpNJ22SNc2h4v534PDYsKScrrC30xO4Y1j0aZK9I5sUVRrHsm
        fKYYq8IaxNRGdiAdr4OU6HhzE4rJ3khcuMQpo6ipPxulhYn+xCux/KYeSdImjRYp8Q2Ueo
        wWZLfKuR+Pw8OmIhQD634TYLacBMox0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-yCqiO3_lOVKp25eGfNob3g-1; Thu, 03 Aug 2023 05:28:57 -0400
X-MC-Unique: yCqiO3_lOVKp25eGfNob3g-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99c01c680beso48491566b.2
        for <linux-media@vger.kernel.org>; Thu, 03 Aug 2023 02:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691054936; x=1691659736;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+T2vOXvX4Ef3nxyLx3bZY2XiKpz8ch1uCCnr4/n+bM=;
        b=UOqs4YNA76oKDtzSDjBD0EW3EQFWt2qUofTowiHSIVEgP+sVEUmP2msBDVVhuOYIeJ
         WDzzktG9G6hfCDvWmrLp/GWR2ZqgcXs/XBysegFKQxTdXTc1XWZbAHkqdpKdbMPjz3js
         fuEub9VJJDC6U2P6yGsu20331BG9s/8M7Ir1hPetHo8BgHVSmpxrZng+QCH/p3xwq4XU
         UZ/AYjjX33Dd6KHUNgUk5y7gQvi1wvx7Jy0USpms0FXP3lbB8lZ+TvZFnk8+2ZS3/NaW
         YC3hdNxFDQZnTJOg+3O8FJfnnK2553r2KGWMaXMxf0FwFrLvg8WzkmGfxQB1Gfc1Ykwz
         XuWQ==
X-Gm-Message-State: AOJu0YyQn0K+sgGNP9CPihu7JPfN+LqFnArDLdMIHKp4eOkxqQhq+RN9
        fqT9qN3zpYqV74HbUHacxlZdeD2znMdzoiAzr4zrdJzOAx8ZbV499Y7mer+mjBpiOuIoJNbwXdi
        FTgwKyZHgH0fwUIHgKWE6VTI=
X-Received: by 2002:a17:906:5dce:b0:99c:6bc6:3521 with SMTP id p14-20020a1709065dce00b0099c6bc63521mr1040010ejv.20.1691054936236;
        Thu, 03 Aug 2023 02:28:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJzB1PscqsCix6NXluebQxN+slnz8sEfaQ5+SaT0CWzPu0eZsPobsiK4WfMs+T7xfq2aDYGw==
X-Received: by 2002:a17:906:5dce:b0:99c:6bc6:3521 with SMTP id p14-20020a1709065dce00b0099c6bc63521mr1039997ejv.20.1691054935969;
        Thu, 03 Aug 2023 02:28:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s4-20020a170906c30400b009926928d486sm10210314ejz.35.2023.08.03.02.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 02:28:53 -0700 (PDT)
Message-ID: <bf16135d-184d-56d5-05dd-fb1699556ecd@redhat.com>
Date:   Thu, 3 Aug 2023 11:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 21/32] media: ov2680: Make setting the mode algorithm
 based
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230802173046.368434-1-hdegoede@redhat.com>
 <20230802173046.368434-22-hdegoede@redhat.com>
 <CAHp75VcxOTP-rdWy5CVq4m-DPCoB3fuGfBf5uP8sxqBa4v1WRQ@mail.gmail.com>
 <5fd37f72-4c26-963b-c67d-63d00eba2101@redhat.com>
In-Reply-To: <5fd37f72-4c26-963b-c67d-63d00eba2101@redhat.com>
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

Hi,

On 8/3/23 11:17, Hans de Goede wrote:
> Hi,
> 
> On 8/2/23 21:37, Andy Shevchenko wrote:

<snip>

>>> +       width = min_t(unsigned int, ALIGN(format->format.width, 2),
>>> +                     OV2680_NATIVE_WIDTH);
>>> +       height = min_t(unsigned int, ALIGN(format->format.height, 2),
>>> +                      OV2680_NATIVE_HEIGHT);
>>
>> Wondering if you can switch these to use min() (with a strict type checking).
>> It might require adding U/UL to the respective constants.
> 
> 
> I'll try to switch to regular min() use here for v5.

Ok, so I tried and failed. format->format.height is an __u32 and even
if I add a 'u' suffix to OV2680_NATIVE_WIDTH regular min() does not
like it:

drivers/media/i2c/ov2680.c: In function ‘ov2680_calc_mode’:
./include/linux/minmax.h:20:35: warning: comparison of distinct pointer types lacks a cast
   20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
      |                                   ^~

Regards,

Hans

