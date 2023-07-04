Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17314746FC0
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjGDLUn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbjGDLUm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 109BF10D9
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688469553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Gt1P33Zakq8BZbGTiIneB+Me7/n3qT7CVF9NDstVBSk=;
        b=a+uj/XY+CpiQuy+vmQFDlSFtA2p1x13t5TurAqbICxIX4rcBKYfmrMWrwQZD8bn3DEQJgU
        OxQDd4p2+b/FN86SAz3wnMUGcIjNhzLexNVH5lVu2WrmKPugXfmnaAat5bEnrSDq4CR5IT
        rYjIfBTDK4CYXFAaEYgbHtHe5tfVgTg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-efZb1ynrN-qo8ttna7snjw-1; Tue, 04 Jul 2023 07:19:09 -0400
X-MC-Unique: efZb1ynrN-qo8ttna7snjw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-98e1085308eso625843266b.0
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 04:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688469548; x=1691061548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt1P33Zakq8BZbGTiIneB+Me7/n3qT7CVF9NDstVBSk=;
        b=PGVGfNJhuATZTjLowN8fkrtGOoZo3u783cI9f4cLIt47jjt9sRRnq66R98UpuKvVBv
         OKKSy9pzS2EtcX9Mua2jm3Ku4lmNzHYwvwVPXFP+VY9yg04tNPlwfM3pbC1KPZmWldCh
         LHTEfQ9Xf28a4K8U9au2Aj+J/rN1rAT+pl1Mqq97FNRog+e18JtNPUMyAkjMUxmJgMeu
         EhlgUU3ZiwcgLMy2qHlBhw6c/X5KlOFOPkySLC+iVrg/gG94JVCS68kZ91dNWIHcfDzq
         eZ1TtRh9NL+wdrbUwhaBmaiBM3n6aNabjqXBQQ85J5y5BWzJ98Cw4I9MZZ5st5wTI53h
         ndtA==
X-Gm-Message-State: ABy/qLbwKMPRjofoeFJALtBoe2/bjpsyEisU6JrjNcWxux0CLCOvNnkN
        bCllEg9SE99ue8HIiKuqFsHzWxpFY4uvlIXh18HSsRR+Klq6/crgqMlikCXOHN78/PWTrI0vbWa
        yu6mZB/LkNJnFik4i3+nqEN4=
X-Received: by 2002:a17:907:2d25:b0:992:4723:76f4 with SMTP id gs37-20020a1709072d2500b00992472376f4mr13988354ejc.6.1688469548599;
        Tue, 04 Jul 2023 04:19:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6mrcjEgitpJ3Jg1irl4D/hQS/1Md7c4phtJbOG+pG9aFNPKcZfZo4mLT6PJZP/zKNI2ZqSbA==
X-Received: by 2002:a17:907:2d25:b0:992:4723:76f4 with SMTP id gs37-20020a1709072d2500b00992472376f4mr13988339ejc.6.1688469548262;
        Tue, 04 Jul 2023 04:19:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id us3-20020a170906bfc300b00991bba473e2sm11119800ejb.85.2023.07.04.04.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 04:19:07 -0700 (PDT)
Message-ID: <bf3a315d-7f06-c0af-b23d-0c7bb27e2886@redhat.com>
Date:   Tue, 4 Jul 2023 13:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 04/15] media: ipu-bridge: Allow building as module
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-5-hdegoede@redhat.com>
 <CAHp75VcdP67ETJhy-2mV3TfC0e=awMnv_du0CkaHFuGubB8R3w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcdP67ETJhy-2mV3TfC0e=awMnv_du0CkaHFuGubB8R3w@mail.gmail.com>
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

On 6/30/23 16:08, Andy Shevchenko wrote:
> On Fri, Jun 30, 2023 at 2:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> After commit f54eb0ac7c1a ("media: ipu3-cio2: rename cio2 bridge to ipu
>> bridge and move out of ipu3") the ipu-bridge code is always builtin
> 
> built in
> 
>> even if all (its only) consumers are build as modules.
> 
> I'm not sure I understood the remark in parentheses correctly. All of
> its consumers are the only consumers of this module?

There is only 1 consumer so both all of its consumers and its only
consumer, I'll drop the confusing "(its only)" part.

> 
>> Fix this by turning "config IPU_BRIDGE" into a pure library Kconfig
>> option (not user selectable, must be selected by consumers) and
>> re-introducing the CIO2_BRIDGE Kconfig bits in .../pci/intel/ipu3/Kconfig
>> which were dropped to still allow building ipu3-cio2 without ipu-bridge
>> support.
> 
> ...
> 
>>  config IPU_BRIDGE
>> -       bool "Intel IPU Sensors Bridge"
>> -       depends on VIDEO_IPU3_CIO2 && ACPI
>> -       depends on I2C
>> -       help
>> -         This extension provides an API for the Intel IPU driver to create
>> -         connections to cameras that are hidden in the SSDB buffer in ACPI.
>> -         It can be used to enable support for cameras in detachable / hybrid
>> -         devices that ship with Windows.
>> -
>> -         Say Y here if your device is a detachable / hybrid laptop that comes
>> -         with Windows installed by the OEM, for example:
>> -
>> -               - Microsoft Surface models (except Surface Pro 3)
>> -               - The Lenovo Miix line (for example the 510, 520, 710 and 720)
>> -               - Dell 7285
>> -
>> -         If in doubt, say N here.
>> +       tristate
>> +       depends on ACPI && I2C
> 
> Can we leave
> 
>   depends on I2C
> 
> line untouched?

Sure, I'll change that for v3.

Regards,

Hans


