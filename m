Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C1963D386
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 11:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235747AbiK3Kh7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 05:37:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234392AbiK3Kh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 05:37:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5696C45A33
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 02:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669804630;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y5HIAjpAp5xsN/moTRJ8czbrJfueHAQeSYkPRAVcZmQ=;
        b=LL7UhEOOjW3Fc8FL9TeXBFPNwdFFO6XRRvnQb1z7e8au/LcOKO9jE9XZml0pM85Dj+zY4x
        6t8nCK7wqAjK+KMVomp6LBEBvpcDyIwJi5a7w4wmhcG+1RxqMcb4IedxVq4p8LJ0gugsyg
        A9ZuEmEot8xCW98Goc3+cX37qDwjpXY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-520-ISeDHI0jPpaquZ1lt-A42g-1; Wed, 30 Nov 2022 05:37:08 -0500
X-MC-Unique: ISeDHI0jPpaquZ1lt-A42g-1
Received: by mail-ed1-f70.google.com with SMTP id w4-20020a05640234c400b004631f8923baso9586406edc.5
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 02:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5HIAjpAp5xsN/moTRJ8czbrJfueHAQeSYkPRAVcZmQ=;
        b=TTNOsZVkMXEQfz19Fh9lDm31LXtPF7VpzoJbQtL6vg65ErW0WnNQ8q3yWh75hondIJ
         bVWe+iqk/wID44xwjZnKDg1aZ49FMW5PkPar3vFYNuxxfy+B91h8UHWa6o9JMShzVw93
         0sLLzgk783otQkbNemGz44tjNjWAi2VKiQ/aT/pz4Cqu757zOpQZbOReF2IJAEIoV2kD
         a+Gjk4//KI61+vt1irUuGzB9Pv8Rj4lTESDc6zdjiJRj3oUdHqqdzdYp4BEqhbZOinG2
         z2RJ7/+BCzMMCEVSRrNs0ZwD1RD0Gpr8UaQ2nRc14A+ZRKF/9+igyYq3HJCWfE6HmzpI
         qMUA==
X-Gm-Message-State: ANoB5pnBqI6MFJmPBrr5Hk+ho8KpTE89JiMiC6F8LfKPDqTSp3T6mNUJ
        LJIs29exXiqMQZje9n/ligAaW0iOloEZy6D0L6zQqlp0jScCduvT14KYb9DXPtkcaTCwHwut8OE
        GwR2V2902XVhsDp/PZAvhgAc=
X-Received: by 2002:a05:6402:541a:b0:463:be84:5283 with SMTP id ev26-20020a056402541a00b00463be845283mr13883408edb.7.1669804627657;
        Wed, 30 Nov 2022 02:37:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5fnArATidH5FgS9m+AnofKa5JXZVqzu7DndjOqOBNztVqRwGyBjIcz414kEfdg3WyU9S3HXg==
X-Received: by 2002:a05:6402:541a:b0:463:be84:5283 with SMTP id ev26-20020a056402541a00b00463be845283mr13883389edb.7.1669804627479;
        Wed, 30 Nov 2022 02:37:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906310100b0073ae9ba9ba8sm501503ejx.3.2022.11.30.02.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 02:37:06 -0800 (PST)
Message-ID: <181622c7-afc9-6493-5815-237728a26e77@redhat.com>
Date:   Wed, 30 Nov 2022 11:37:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/6] platform/x86: int3472/discrete: Refactor GPIO to
 sensor mapping
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-3-hdegoede@redhat.com>
 <CAHp75Vc8BrXBnkvRgWk=hD9gHd5_Yd7fjJRsVA+G2+D2x1Ozbw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vc8BrXBnkvRgWk=hD9gHd5_Yd7fjJRsVA+G2+D2x1Ozbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/30/22 10:49, Andy Shevchenko wrote:
> On Wed, Nov 30, 2022 at 1:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Add a helper function to map the type returned by the _DSM
>> method to a function name + the default polarity for that function.
>>
>> And fold the INT3472_GPIO_TYPE_RESET and INT3472_GPIO_TYPE_POWERDOWN
>> cases into a single generic case.
>>
>> This is a preparation patch for further GPIO mapping changes.
> 
> ...
> 
>> +       switch (type) {
>> +       case INT3472_GPIO_TYPE_RESET:
>> +               *func = "reset";
>> +               *polarity = GPIO_ACTIVE_LOW;
>> +               break;
>> +       case INT3472_GPIO_TYPE_POWERDOWN:
>> +               *func = "powerdown";
>> +               *polarity = GPIO_ACTIVE_LOW;
>> +               break;
>> +       case INT3472_GPIO_TYPE_CLK_ENABLE:
>> +               *func = "clk-enable";
>> +               *polarity = GPIO_ACTIVE_HIGH;
>> +               break;
>> +       case INT3472_GPIO_TYPE_PRIVACY_LED:
>> +               *func = "privacy-led";
>> +               *polarity = GPIO_ACTIVE_HIGH;
>> +               break;
>> +       case INT3472_GPIO_TYPE_POWER_ENABLE:
>> +               *func = "power-enable";
>> +               *polarity = GPIO_ACTIVE_HIGH;
>> +               break;
>> +       default:
>> +               *func = "unknown";
>> +               *polarity = GPIO_ACTIVE_HIGH;
> 
> A nit-pick: In long term maintenance it's always good to have a break
> statement even in the default case.

Ack, I'll add this when merging this (unless there are other / bigger
reasons for a v2).

Regards,

Hans

