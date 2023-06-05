Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B246572222E
	for <lists+linux-media@lfdr.de>; Mon,  5 Jun 2023 11:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjFEJaX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jun 2023 05:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjFEJaW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jun 2023 05:30:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8014BD
        for <linux-media@vger.kernel.org>; Mon,  5 Jun 2023 02:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685957374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=98nYeq3pFKsuigocZLVMIcRPqxkIdBUW+cdvwG62xaU=;
        b=WUFIHGD5EJq+6qM8CG/fZwYfquFZ8GKDADS2j6uKJ7h2nC6NiZgCJUxj678plErKYYJAHY
        cAfThtYf4G9ie8IxU1u7L1VMyaLNm/HLY0xDqaN1KUj7wvEo1MGSS6MmxflKKJlLJRrVW4
        qnC3dCL7Ni/7f+MP6iveAKfjwsDiMZ4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-FHLoWl-rPaqpway07DPqLg-1; Mon, 05 Jun 2023 05:29:32 -0400
X-MC-Unique: FHLoWl-rPaqpway07DPqLg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-977e50b0120so38222366b.0
        for <linux-media@vger.kernel.org>; Mon, 05 Jun 2023 02:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685957371; x=1688549371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=98nYeq3pFKsuigocZLVMIcRPqxkIdBUW+cdvwG62xaU=;
        b=dDg1z22kxV2gXf/S7rbwgTs/zRsJOBHxws32A6DwinRK7ztPde92WtDIr8H7XwIEKH
         x7REYx3+OrMldmuLm3aIyZgHutDkkHWffdhZtDAhzokLqquF6WjOsVxLQ72yE21Pn1tS
         rNLmqswy59tVEevUmc57ZcCYnHc0IDS1KCSMnvcPTrA1yOriWgrLfx4YwK8cZdtynpxR
         IrH9ld0vOsJEx7e3nGl7QXGVLF4KVfOU9w4dM3slmfVyi9FDjIZeVxjDYIIenyGWTqRe
         m8QU2i/EYA03T4lh6kHnwa+byhvVcH60HQsWfAg+b/8KTIaqKnEaMxtJBetaplpmZr6t
         oY8A==
X-Gm-Message-State: AC+VfDx4viT2UNFFxV0Jh7xXOOxaWT15XF6Kuoq/70xwzz0mHRo1I/Go
        HugE4kgPBxfv8H+1SEG8sVh/9q6FOI16n+q/tLKHsPqQMTZSeymIF2+eUjHeyAbr8szKff4S3iI
        ctKU+xV0FSMvRt7Prdn26P5g=
X-Received: by 2002:a17:907:25c8:b0:949:cb6a:b6f7 with SMTP id ae8-20020a17090725c800b00949cb6ab6f7mr5137426ejc.56.1685957371639;
        Mon, 05 Jun 2023 02:29:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6adDqv06/bBGTB/iOHPlzSDcjRhww0ueLa4zPZJZcEblwVBiWyei6CTsNsTGFJCgQfuhDDyQ==
X-Received: by 2002:a17:907:25c8:b0:949:cb6a:b6f7 with SMTP id ae8-20020a17090725c800b00949cb6ab6f7mr5137414ejc.56.1685957371374;
        Mon, 05 Jun 2023 02:29:31 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id bj21-20020a170906b05500b009661484e84esm4044523ejb.191.2023.06.05.02.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 02:29:30 -0700 (PDT)
Message-ID: <72b083af-bbf9-199b-55d2-9749e7b8a13d@redhat.com>
Date:   Mon, 5 Jun 2023 11:29:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/5] media: atomisp: ov2680 work + add testing
 instructions
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230604161406.69369-1-hdegoede@redhat.com>
 <CAHp75Vd7t3Li7d9B2JEXzqsvc0uKvcuro5dV8Tj6x2Wai46LFw@mail.gmail.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd7t3Li7d9B2JEXzqsvc0uKvcuro5dV8Tj6x2Wai46LFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On 6/4/23 21:28, Andy Shevchenko wrote:
> On Sun, Jun 4, 2023 at 7:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Here is some more ov2680 sensor driver work. This work is the result
>> of trying to get the main drivers/media/i2c/ov2680.c driver in a shape
>> where it is good enough to replace the atomisp specific version.
>>
>> The plan is to port recent improvements to atomisp-ov2680.c over
>> to the main driver. While working on this I noticed some issues which
>> need fixing before copying them over to the "main" driver.
>>
>> Besides that this also adds a small patch to make testing with
>> gstreamer easier and this adds testing instruction to the TODO file.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> (a nit-pick in one patch commented separately)
> 
> Thank you!

Thank you for the reviews. I've pushed this series (with the nitpick
addressed) as well as the previous 3 fixes you reviewed to my
media-atomisp branch now.

Regards,

Hans




>> Hans de Goede (5):
>>   media: atomisp: Stop resetting selected input to 0 between /dev/video#
>>     opens
>>   media: atomisp: ov2680: Stop using half pixelclock for binned modes
>>   media: atomisp: ov2680: Remove unnecessary registers from
>>     ov2680_global_setting[]
>>   media: atomisp: ov2680: Rename unknown/0x370a to sensor_ctrl_0a
>>   media: atomisp: Add testing instructions to TODO file
>>
>>  drivers/staging/media/atomisp/TODO            |  33 +++++
>>  .../media/atomisp/i2c/atomisp-ov2680.c        |  15 +--
>>  drivers/staging/media/atomisp/i2c/ov2680.h    | 118 +++++++++---------
>>  .../staging/media/atomisp/pci/atomisp_fops.c  |   3 -
>>  4 files changed, 95 insertions(+), 74 deletions(-)
>>
>> --
>> 2.40.1
>>
> 
> 

