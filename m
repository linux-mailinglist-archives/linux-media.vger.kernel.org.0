Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F40F638029
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 21:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiKXU1m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 15:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKXU1k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 15:27:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB76B70C4
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 12:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669321606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g836Pwh04KdPl1iusSx+/s+xIxjZe5aKBl7TxwY+QmI=;
        b=VQ4eBzSSkS8USeOD+CraKdWb+ZdlbTMIGGwacU182FV0AIUG7GOk3HDISXng0Riexq6k+6
        Uh6c/qHTob24+strrjbiuPDrPC+dgs/IonyuLeNol0Ns0REsxCcoeCHQ2jyz4FmNg1cBLx
        PUpT40l/cREf0Tor+Sz7LiKkQ6273SI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-9-0o-JhyYXOTaIO_3FgJ6B2g-1; Thu, 24 Nov 2022 15:26:45 -0500
X-MC-Unique: 0o-JhyYXOTaIO_3FgJ6B2g-1
Received: by mail-ed1-f69.google.com with SMTP id c9-20020a05640227c900b00463de74bc15so1406302ede.13
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 12:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g836Pwh04KdPl1iusSx+/s+xIxjZe5aKBl7TxwY+QmI=;
        b=DAuLloHhfiPYV+DJpLb+DKnyD4DICYBBDhmiswQx7c29SsBXKQ784dsBVgl3rvKF5m
         uFuYVonLGI0aG+jNLZuaUn4pvNCiLEC5i6Yz+z/qu/5/i8Lgh0JeU3dPrCTHNfzonB6X
         nADSyLfXn4OD6BnWFIS2q29xK2gq70tQn+zEw7XGc66kGaTj8CJa7d07ctjGAD/F/iEa
         MAxvhfFK4ttXowKKAcc0NuX6hGR9DrN7+LQZfoBWJb/rZF+NBIgj/bI4ZPfzQqzlum86
         fT5/Vvhvw3X7VTxamnhoMwlmpbVDgXnQ2r0V3DKKAzI4yuKKqgkE5iAy4x5wjQWyFLoM
         5nLA==
X-Gm-Message-State: ANoB5plNpfV+Q8O60zCXy4UiK+pGW2J3vQNasjQouO3ibPOvii9b+SyM
        Oi7i4Kphh5OHRZqaltVk+oWYZMfNdPPE3cByADSSnNEs2q4czd20+KUh9zF9BRIi7YCe7AD8EOv
        XljsdRWobTvb2INfIPJT9tu0=
X-Received: by 2002:a17:906:660e:b0:78d:b43c:81be with SMTP id b14-20020a170906660e00b0078db43c81bemr19593495ejp.600.1669321603915;
        Thu, 24 Nov 2022 12:26:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf52tYSctc81EuskerMxiOFFkAKKiNynC2MCz2INKH0VwxX+naz+qLW1TmtjAoiWwrBNJ9g73Q==
X-Received: by 2002:a17:906:660e:b0:78d:b43c:81be with SMTP id b14-20020a170906660e00b0078db43c81bemr19593485ejp.600.1669321603696;
        Thu, 24 Nov 2022 12:26:43 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id sg43-20020a170907a42b00b0073d81b0882asm801202ejc.7.2022.11.24.12.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 12:26:43 -0800 (PST)
Message-ID: <8da77836-c53b-8468-13ee-dc02eabfc8a5@redhat.com>
Date:   Thu, 24 Nov 2022 21:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/3] platform/x86: int3472/discrete: Get the polarity from
 the _DSM entry
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <20221124200007.390901-3-hdegoede@redhat.com>
 <CAHp75VcgRN=3O7cYsxVxcJ6PuSpDuZAs3ex0rhedaE94DBwBzg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcgRN=3O7cYsxVxcJ6PuSpDuZAs3ex0rhedaE94DBwBzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/24/22 21:13, Andy Shevchenko wrote:
> On Thu, Nov 24, 2022 at 10:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The out of tree IPU6 driver has moved to also using the in kernel INT3472
>> code for doing power-ctrl rather then doing their own thing (good!).
>>
>> On IPU6 the polarity is encoded in the _DSM entry rather then being
>> hardcoded to GPIO_ACTIVE_LOW.
>>
>> Using the _DSM entry for this on IPU3 leads to regressions, so only
>> use the _DSM entry for this on non IPU3 devices.
>>
>> Note there is a whole bunch of PCI-ids for the IPU6 which is why
>> the check is for the IPU3-CIO2, because the CIO2 there has a unique
>> PCI-id which can be used for this.
> 
> ...
> 
>> +/* IPU3 vs IPU6 needs to be handled differently */
>> +#define IPU3_CIO2_PCI_ID                               0x9d32
> 
> If it makes more than a single driver, perhaps pci_ids.h is a good
> place to keep it there?

Yes, I've added a note to my TODO to clean this up in a follow-up
patch (the pci-ids.h maintainers want to see multiple users of
an id before accepting new ids in there).

> 
> ...
> 
>> +       dev_dbg(int3472->dev, "%s %s pin %d active-%s\n", func,
>> +               agpio->resource_source.string_ptr, agpio->pin_table[0],
> 
>> +               (polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
> 
> Parentheses are not needed, right?

Right, but I prefer to use them in conditional statements like these,
because I personally find that they make things easier to read.

Regards,

Hans


