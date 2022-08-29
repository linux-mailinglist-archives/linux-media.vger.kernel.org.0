Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36EDC5A46FD
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 12:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbiH2KTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Aug 2022 06:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiH2KTF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 06:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E27E1AF3A
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 03:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661768343;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FCY96VixVLfmhbs0diqGFtuIoxZKuA9d/sCdN7ut8aQ=;
        b=FGqmt8nytrrJqyT8ZBpNNaxVRnEgp38BEISzGbkZyZ957/YQgOlD5cFZ993m7HlzGqjQ8k
        2sUC/hLWsC77WUCGOdNYQ3FNYuNwZ5qo7rPkLwdh0ZBJ6NQq1CLCFEY7vy2m2AlPnO7x6c
        QHmyN1fOR9TETCP6E3oFmhA+t1ItPCI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-JXdEsClePumibOgjvliNow-1; Mon, 29 Aug 2022 06:19:02 -0400
X-MC-Unique: JXdEsClePumibOgjvliNow-1
Received: by mail-ej1-f71.google.com with SMTP id gs35-20020a1709072d2300b00730e14fd76eso2109461ejc.15
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 03:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=FCY96VixVLfmhbs0diqGFtuIoxZKuA9d/sCdN7ut8aQ=;
        b=D8hCjlp99qdS6KU2AhYocaCMkPsfON63sobvdA9hxskyxsTnpk7UlY4RpGnQEzIHTt
         KFzDBsTumxObYvjUJA2a7DLqe4QI2PGer+CpHs6/X4xTbiFI7PrsWvwFRjV4VxsrBHfY
         jGwNNSTg1k+ASMoNG2jtxIGcet0IazDvUr26GQ4K8m7DJ9SAsS4dubB6m3DcuslinYwW
         Ev0gttw0gPBhgkPlMb/IFygI8LQIp70/jsLyq+s9n4yqFpHI6IDf6xQ69TJ8xEvppGRx
         8gmLMdQFjV+TaOOtkTFNpgbXMsdQtFXpavSuCCuqRIB+Oy8eFKCCbkrjOcUu9mlOeoHJ
         7g4w==
X-Gm-Message-State: ACgBeo1C1a/YP/lAEbCJ4hCNDWFvjqkUtNbZXO+JiQSwf6nJPsR8pcBC
        eWglDDN+vduaLYkb78b7MzKlQvGUYPjyKNh26nROW13ESzLobG52V5boN4aj1OHCWuqw0cFfcIl
        J0LC2cTfKUT87xEdXLxxJinM=
X-Received: by 2002:a05:6402:3509:b0:43e:d80b:44a8 with SMTP id b9-20020a056402350900b0043ed80b44a8mr16226764edd.255.1661768341133;
        Mon, 29 Aug 2022 03:19:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR672RVhaIy0p4oobwXVbUm37hLIpasUEKl4eRjMXUDKLOqz7eskYCkRcaDa7i3HAvY4n/QCTA==
X-Received: by 2002:a05:6402:3509:b0:43e:d80b:44a8 with SMTP id b9-20020a056402350900b0043ed80b44a8mr16226744edd.255.1661768340926;
        Mon, 29 Aug 2022 03:19:00 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id v12-20020a1709061dcc00b0073dc8d0eabesm4401683ejh.15.2022.08.29.03.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 03:19:00 -0700 (PDT)
Message-ID: <8894c65a-d6b6-9c42-2085-435943e36019@redhat.com>
Date:   Mon, 29 Aug 2022 12:18:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 01/13] media: atomisp_gmin_platform: Switch to use
 acpi_evaluate_dsm_typed()
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220822150610.45186-1-hdegoede@redhat.com>
 <CAHp75Vd2KPjKo1QXaZ4pHr4400Rw2yQFrWJuAOLge9=gbo=RqA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd2KPjKo1QXaZ4pHr4400Rw2yQFrWJuAOLge9=gbo=RqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 8/22/22 23:28, Andy Shevchenko wrote:
> On Mon, Aug 22, 2022 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> The acpi_evaluate_dsm_typed() provides a way to check the type of the
>> object evaluated by _DSM call. Use it instead of open coded variant.
> 
> of an open
> 
> ...
> 
> Hmm... I thought I gave the Rb tag for patches 2-11.

Yes you did I forgot to add that, sorry. I have added it in my local tree now.

> In this version patches 12 and 13 also look good to me.

Thanks, also added in my local tree (I plan to send a v3 with more cleanups
added on top).

Regards,

Hans

