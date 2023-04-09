Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 242656DBFEC
	for <lists+linux-media@lfdr.de>; Sun,  9 Apr 2023 15:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjDINCq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Apr 2023 09:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDINCo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Apr 2023 09:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE3735A5
        for <linux-media@vger.kernel.org>; Sun,  9 Apr 2023 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681045317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZuvnNk7wAmRbcO6BnXTKaMEXDzW/U+623FcOgVvEcps=;
        b=KrR5L6n3p8gIlTsvc2tDoVeMlLUM7PlrXDONLFE8A6uGTOd+a0QWcTiOiDk0T5zDbUeP0H
        CsaRlOia4NeWD5etcgCxfcZZeg5oH/PAKMEaSEbpZEFoJmSUdFgHrILjqnszFrXYMD/hsX
        RbTimny3yDQvQQ73TxrQcY/p0KHNYvU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-XEoJrscHPcydH0AaEhDrAQ-1; Sun, 09 Apr 2023 09:01:56 -0400
X-MC-Unique: XEoJrscHPcydH0AaEhDrAQ-1
Received: by mail-ed1-f71.google.com with SMTP id j25-20020a508a99000000b004fb36e6d670so1790374edj.5
        for <linux-media@vger.kernel.org>; Sun, 09 Apr 2023 06:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681045313; x=1683637313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuvnNk7wAmRbcO6BnXTKaMEXDzW/U+623FcOgVvEcps=;
        b=i50u5d1sDH+vPK3naYeG0TvY4Z8HlTfXY6y+V2Y7FGWIWzkaTJ59B9eaKBZBitnzjr
         Z7kDjuHIB3fg0fZrblGt0fkSLiI4ACdneKyxbBoh+sjCcMWnrE+iSUULEXiXupqZO5ZK
         hmp1Tix2tE1AFKxDs+27UolVoy2FQIjYVrgG39r1ihD85EL6vd2qBGwrREpbMM0cDm7Z
         vBEEvBNcfkdsb8l3zj13a7rl5JL1V4kuJzZWdoANAlN9GzCCN2FbiroEb7ltvHrobCJb
         dKroPl0mpTIaoP/Lxyc1Rwl9ih+oi2mHTp098x7iXT6laBSh8qNRR+Z6SfXvFXZq7bWF
         Y2wg==
X-Gm-Message-State: AAQBX9dwh8rGdnKfpnS+sNeJEbC7KoCzVL9TWG8iHt57pogkkN5DGzXY
        ojOA2ZXARmpVN2Df9QfW8PlPH33mBjDe3d+cj1jGJ4OQxx/jitGfmdk1FdcYcnOGKdPG6v2Dad8
        FYizcYTL2Hu2UFuwxYw8rBDo=
X-Received: by 2002:a17:906:8544:b0:94a:783d:cd1e with SMTP id h4-20020a170906854400b0094a783dcd1emr945333ejy.32.1681045312616;
        Sun, 09 Apr 2023 06:01:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZxbrhUp1Rce4uDyip6rmaIeOpZ7Sl+L+9WUpxm1h5Kt3BSqd+h2jbWYa+ZiPUwsdeDW7mTdw==
X-Received: by 2002:a17:906:8544:b0:94a:783d:cd1e with SMTP id h4-20020a170906854400b0094a783dcd1emr945309ejy.32.1681045312299;
        Sun, 09 Apr 2023 06:01:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ch1-20020a170906c2c100b009353066595csm4107746ejb.136.2023.04.09.06.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 06:01:51 -0700 (PDT)
Message-ID: <7a7d442b-938d-4d99-a368-a6ce917d571b@redhat.com>
Date:   Sun, 9 Apr 2023 15:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 28/28] media: atomisp: gmin_platform: Add Lenovo Ideapad
 Miix 310 gmin_vars
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230401145926.596216-1-hdegoede@redhat.com>
 <20230401145926.596216-29-hdegoede@redhat.com>
 <CAHp75VcOpL=aL9suDvBxiCK3cqm4vqCwVfwUp9SSFc31H+15cQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcOpL=aL9suDvBxiCK3cqm4vqCwVfwUp9SSFc31H+15cQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 4/2/23 21:12, Andy Shevchenko wrote:
> On Sat, Apr 1, 2023 at 5:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The _DSM used to get sensor variables like CsiPort returns the wrong
>> csi-port for the front OV2680 sensor on the Lenovo Ideapad Miix 310
>> add a gmin_vars DMI quirk / override setting the right CsiPort.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../media/atomisp/pci/atomisp_gmin_platform.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>> index f83de0ffaf16..efcfc133311f 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>> @@ -304,7 +304,17 @@ static struct gmin_cfg_var surface3_vars[] = {
>>         {},
>>  };
>>
>> +static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
>> +       /* _DSM contains the wrong CsiPort! */
>> +       { "OVTI2680:01_CsiPort", "0" },
>> +       {}
>> +};
>> +
>>  static const struct dmi_system_id gmin_vars[] = {
>> +       /*
>> +        * These DMI ids where present when the atomisp driver was merged into
> 
> IDs
> were ?

Ack fixed.

>> +        * drivers/staging and it is unclear if they are really necessary.
>> +        */
> 
> MRD7 and FFD8 are the reference designs. At least MRD7 is what we have
> in the lab and we can run some tests there. That's, for example, one
> which I used to run atomisp before it got removed from the kernel a
> few years ago.

Right, but do these need the quirks ? Or is our auto-detection code
good enough to get the right values ?

Regards,

Hans



> 
>>         {
>>                 .ident = "BYT-T FFD8",
>>                 .matches = {
>> @@ -341,6 +351,7 @@ static const struct dmi_system_id gmin_vars[] = {
>>                 },
>>                 .driver_data = i8880_vars,
>>         },
>> +       /* Later added DMI ids, these are confirmed to really be necessary! */
>>         {
>>                 .ident = "Surface 3",
>>                 .matches = {
>> @@ -348,6 +359,14 @@ static const struct dmi_system_id gmin_vars[] = {
>>                 },
>>                 .driver_data = surface3_vars,
>>         },
>> +       {
>> +               .ident = "Lenovo Ideapad Miix 310",
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "MIIX 310-10"),
>> +               },
>> +               .driver_data = lenovo_ideapad_miix_310_vars,
>> +       },
>>         {}
>>  };
>>
>> --
>> 2.39.1
>>
> 
> 

