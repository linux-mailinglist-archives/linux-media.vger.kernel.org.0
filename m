Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7613B6E3883
	for <lists+linux-media@lfdr.de>; Sun, 16 Apr 2023 15:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbjDPNKQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Apr 2023 09:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjDPNKN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Apr 2023 09:10:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F712D60
        for <linux-media@vger.kernel.org>; Sun, 16 Apr 2023 06:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681650540;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YYjPZsCNrqGMbLHPtu1l9hSHzXZoEudtLitWN2eVd14=;
        b=hQ4ZSAFnL0dRuhZPv29tZkpqqJNod9B+prjdQYeboj7zntc32NUOYSOMjEHPMgGBDSSUQ0
        RpGGrGJxUWcz7gB8SJ3Dgcvr7WCtHCvAg6qUMZT3XHAiASw3Kam4y7BbLdtAMkKYQ0vKhB
        8bmha8QRVxCybpDGTSHZ0Zq15RmEc/o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-_uTbdGzIO9eLJllV3Pvueg-1; Sun, 16 Apr 2023 09:08:58 -0400
X-MC-Unique: _uTbdGzIO9eLJllV3Pvueg-1
Received: by mail-ej1-f71.google.com with SMTP id ue7-20020a170907c68700b009339c9c32ffso7749618ejc.5
        for <linux-media@vger.kernel.org>; Sun, 16 Apr 2023 06:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681650538; x=1684242538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYjPZsCNrqGMbLHPtu1l9hSHzXZoEudtLitWN2eVd14=;
        b=EI47gU1capNIxxZpfwBWhpICy/uRX4t/wmhRkAHCKDXzoK8Eej64JtsMnSorla5f57
         ghjyw+xCdOXWXryYJ7q331f3E98PVtPEvPDCkw90rgwo+fUdkJJ2Kze2926sKXQzTJHG
         HYvI1v+HSI5JD6gdqJbSNk0HMk6jO5vZVQrZbFwgkTMVWxraWMlcAOtyG1pwt3m0ravd
         5LwjIzIhQv9hcVKqShTZmUyRs/4JzMROCVGZ2JrOJQt3sHpscAki3JHfC6eBcMDFf6hS
         ZlV//RIQj3VlSbWzBV4rxat0mfcBo9lkJQo5dhOTqCQMtU6YrtEids8JxSJW3kBtL/LD
         45+Q==
X-Gm-Message-State: AAQBX9dmUD67wbaw7iPcXw3OtsgGrUeJe6nIgqL5tETciyUze5e6swka
        KhodJnu+dnP98Z95xdU90l53LRsyTX5xjOOLbSIdZGRH62MaHSXWuSnWoltkoF6eYrGj9NWdwEj
        VHc272BZO65ba0yvVE1/b27g=
X-Received: by 2002:a17:906:5616:b0:94a:4107:3975 with SMTP id f22-20020a170906561600b0094a41073975mr3988004ejq.76.1681650537909;
        Sun, 16 Apr 2023 06:08:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y8T5yCBh6wbbbBr7heC2qmakzdZtsbI8F4J0aabpm/Yfbud6LdMSwb8q3jPy/KSS4e7PhRhQ==
X-Received: by 2002:a17:906:5616:b0:94a:4107:3975 with SMTP id f22-20020a170906561600b0094a41073975mr3987989ejq.76.1681650537667;
        Sun, 16 Apr 2023 06:08:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g25-20020a17090613d900b0094edfbd475csm3581864ejc.127.2023.04.16.06.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 06:08:57 -0700 (PDT)
Message-ID: <1a4a7016-a871-abbe-e8cb-c8a7241de50f@redhat.com>
Date:   Sun, 16 Apr 2023 15:08:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Staging: media: atomisp: include: mmu: include
 <linux/processor.h> instead of <asm/processor.h>
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Anup Sharma <anupnewsmail@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, andy@kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org
References: <ZDuhnLPczec5qJnq@yoga>
 <CAHp75Veaqp4O1jcBHZZh2L5ReMU1+2vH+FfRzfLyY8CdwZwq+w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Veaqp4O1jcBHZZh2L5ReMU1+2vH+FfRzfLyY8CdwZwq+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 4/16/23 12:01, Andy Shevchenko wrote:
> On Sun, Apr 16, 2023 at 10:20 AM Anup Sharma <anupnewsmail@gmail.com> wrote:
>>
>> Fix following checkpatch.pl warning by including
>> <linux/processor.h> instead of <asm/processor.h>
> 
> Missing period at the end. But the entire patch seems unnecessary
> since it's all about x86, and we have more arch headers there anyway.
> Anyway it's up to Hans. Also see below.

Right, given how much real work this driver still needs this
really feels like needless churn, so I'm not going to take
this patch, sorry.

Regards,

Hans



> 
> ...
> 
>>  #include <asm/intel-family.h>
>> -#include <asm/processor.h>
>> +#include <linux/processor.h>
>>
>>  #include <linux/i2c.h>
>>  #include <media/v4l2-subdev.h>
> 
> This seems a bit chaotic with the ordering of the headers here.
> 
> ...
> 
> If you want a good patch, you need to understand what headers are
> _really_ being used in the header file. Then drop unused, try to
> compile that and fix all files that will have missing headers after
> that. This will be a very useful clean up!
> 

