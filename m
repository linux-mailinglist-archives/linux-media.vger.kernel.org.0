Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2007724418
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 15:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236448AbjFFNPY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 09:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238329AbjFFNOy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 09:14:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6EEF10EC
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686057233;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OhakQxI0/+wVOifMvRrCQ2C86ieS9Fk42SAnLKoOJS0=;
        b=DSydZbAlPOOgV4bN2afettAULxc8R0xYRdbAZJ5BNxFs2VAV9aU/IecU4+NMGaqtHwO6Nz
        StnvITCxzivYjhbxTi53FycR5P5yFZ6paSWC4vEiQE4HaYhq1/mEGOD9ZoMoUc58v+1OV3
        hm0DtZafTcB254VmFcj+swQa7bcw4Yc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-LhD0-7AAMkqkSPyMdFOepQ-1; Tue, 06 Jun 2023 09:13:51 -0400
X-MC-Unique: LhD0-7AAMkqkSPyMdFOepQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5128dcbdfc1so3871472a12.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 06:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057230; x=1688649230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhakQxI0/+wVOifMvRrCQ2C86ieS9Fk42SAnLKoOJS0=;
        b=jQs4+2iBHKtzyr3HWWw722PirutqQFvCvCkDePePyYAzgk7LW8Y7nQ7cLsTbrAN4zL
         +7Vq1QhsMQ4Kqsn/2oBSK3pLMK5Bx+hJkpXz+zmKEBFNXvs2LtmUPVSBzIOyvOcr0YnO
         xiHzaervF1y0r/ggCduSZVoTXlW7XDrE7yuJIG87vUQ0T7ibPL+LI2y4fJydwjuPBDa1
         C4f4GsteuM0YncpR9KHzz6mhhiQ/JRKYbW1+f3wFB8lpxXAENXzMqvnRZ6igwj4maT5p
         Ekgsv6zmfVSMDLydXffOGEB0bweH3VM98U6FS2j4rDgw2mn7DGlnvvVRA6SMkebM3OIe
         ZYPQ==
X-Gm-Message-State: AC+VfDzvcwyro0utJSmuNMMvwO9qwwVgNLxO8B/HnKDZCNwTT3IEBz07
        k/av1Sleok9IPJFdGmkbW3h7LRmzXm/LfqsXGQuAi/N6BceDr/k3tK4bkM4VFb1RjYQuQ7WSSZS
        Nf4XYuvOlsZxfOb7PelkcqQizpxgn5+E=
X-Received: by 2002:aa7:d450:0:b0:50d:dba8:c64a with SMTP id q16-20020aa7d450000000b0050ddba8c64amr1709367edr.18.1686057230481;
        Tue, 06 Jun 2023 06:13:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7McBg9VQUYWeSOZVbIWOPZyxGdNTYK1Q3mZYZhEhdxxefi8b52zqqxYqTGnusqSnJN5VChgg==
X-Received: by 2002:aa7:d450:0:b0:50d:dba8:c64a with SMTP id q16-20020aa7d450000000b0050ddba8c64amr1709341edr.18.1686057230158;
        Tue, 06 Jun 2023 06:13:50 -0700 (PDT)
Received: from [192.168.43.127] ([109.38.131.166])
        by smtp.gmail.com with ESMTPSA id n14-20020a056402514e00b0051495ce23absm5123394edd.10.2023.06.06.06.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 06:13:49 -0700 (PDT)
Message-ID: <5d38e467-d3f9-1d7b-84e7-e107e048cb01@redhat.com>
Date:   Tue, 6 Jun 2023 15:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        bingbu.cao@linux.intel.com, platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        Hao Yao <hao.yao@intel.com>
References: <20230531134429.171337-1-hdegoede@redhat.com>
 <CAHp75VfZN5M8LiP3nw0NT5p3WyJJJJm6w2OZKgm28b6aokzopQ@mail.gmail.com>
 <b1cdf8b7-ae9b-a86d-5298-bd0cfa70f9cb@redhat.com>
 <CAHp75Vc7fq=PK5vN5Ya6yMRG3VCFhfwBVobxsSKYwKUyWnDq3g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vc7fq=PK5vN5Ya6yMRG3VCFhfwBVobxsSKYwKUyWnDq3g@mail.gmail.com>
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

Hi,

On 6/6/23 13:26, Andy Shevchenko wrote:
> On Tue, Jun 6, 2023 at 12:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 5/31/23 19:56, Andy Shevchenko wrote:
>>> On Wed, May 31, 2023 at 4:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>> +       if (clk->ena_gpio)
>>>> +               gpiod_set_value_cansleep(clk->ena_gpio, 1);
>>>> +       else
>>>> +               skl_int3472_enable_clk_acpi_method(clk, 1);
>>>
>>> Looking at this, can we avoid duplicative validation of the GPIO?
>>> Perhaps skl_int3472_enable_clk_acpi_method() can have embedded another
>>> check so they won't be called together?
>>>
>>> ...
>>>
>>>> +       if (clk->ena_gpio)
>>>> +               gpiod_set_value_cansleep(clk->ena_gpio, 0);
>>>> +       else
>>>> +               skl_int3472_enable_clk_acpi_method(clk, 0);
>>>
>>> Ditto.
>>
>> Ack, I've squashed a fix for this into this patch while merging it into
>> my review-hans branch.
> 
> Now you have two different checks for the same, I would suggest that
> you switch to check clk->cl in the skl_int3472_enable_clk()
> as it's done in the skl_int3472_register_dsm_clock() instead of GPIO.
> Other way around is also possible but it seems to me that checking for
> clock existence has better guarantees than just checking for GPIO
> availability.

Hmm, you mean the:

        if (int3472->clock.cl)
                return 0; /* A GPIO controlled clk has already been registered */

Check in skl_int3472_register_dsm_clock() ? That matches with / aligns with
this check:

        if (int3472->clock.cl)
                return -EBUSY;

in skl_int3472_register_gpio_clock().

To me it seems sensible to align the checks for "a clk has already been
registered" up this way.

Regards,

Hans




