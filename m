Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE46723D2E
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 11:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237441AbjFFJYE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 05:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbjFFJYD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 05:24:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DF8E55
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 02:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686043397;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R/HBlyIZo7CdZJvTEe5U8mNT5oLotniCeKkm4ow0MrE=;
        b=A7XK+QT1qBGpYgiCV1Nd9H1pdwkuNyG7M64nX2Miz0PnggGhnmtTLspuO3VYDTspPtSFXd
        Z/Eqt2nVzseYg/R2uAVnvM1/WNp9uety77jXQWIOj2ZUM9hVKoRjQxLC9lzPLL5CYFEOKW
        rm6SO59z+5w719o1FWtkpBee80MDvQg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-sSZjtjAANHGwF_g1SVvlnQ-1; Tue, 06 Jun 2023 05:23:16 -0400
X-MC-Unique: sSZjtjAANHGwF_g1SVvlnQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-514559574a9so7969034a12.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 02:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043395; x=1688635395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/HBlyIZo7CdZJvTEe5U8mNT5oLotniCeKkm4ow0MrE=;
        b=F/gq/x5h2sAudPFn/RczfnmFLzF3XL/X0pteklXdWc7Cv0ufh+SFbe+cco/HSX+x3+
         bs4MACNp4YksYQFz+vh6AL34/gE6XFi98IGIsiL/rcVVMSZHUYp1BesETtdZ8WBXpfnZ
         DOp+43yernWr5XrZEAqslcnJS4OeRnWg7GicIoyV76hoiCVfhWtQb3SO1vVp1PgPUkRw
         2pMwgMTQHw1v74awx2R4kmBH7h7CKwxE0DK+YLe435LQmNGeuTzxKtHNAYiiQ45A2Wn/
         m2kwyOQEI/6LLuNEa59MHAl9qdQDcE53oL4yA4n4shGMdxcUhcl4zyC2yh8rW4KElMKP
         1byw==
X-Gm-Message-State: AC+VfDz82EAmP8MUGI18SbviFP2C60rFYF2jV3OnLEMwL6h464MVyJ4d
        BOrcQYHgowkU1pHrl+3SPcoMWMf5aflvnac4zLPmZoNXuL9x4cd+m5rSrhm6Jjcib/UZILO12KI
        ycUMFzRLw+tjzrDMCfHQTGAb2AIX+iEo=
X-Received: by 2002:a05:6402:184d:b0:50b:7959:8b09 with SMTP id v13-20020a056402184d00b0050b79598b09mr1875665edy.15.1686043395037;
        Tue, 06 Jun 2023 02:23:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46s7yTl/UNP/gNkpOIeOGPXLeufV6GWS8Htq/ljAFSEZIUwDKqXD2mSEd+vMpuxHNg+WehKg==
X-Received: by 2002:a05:6402:184d:b0:50b:7959:8b09 with SMTP id v13-20020a056402184d00b0050b79598b09mr1875652edy.15.1686043394744;
        Tue, 06 Jun 2023 02:23:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id be21-20020a0564021a3500b00514b0f6a75esm4711432edb.97.2023.06.06.02.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:23:14 -0700 (PDT)
Message-ID: <b1cdf8b7-ae9b-a86d-5298-bd0cfa70f9cb@redhat.com>
Date:   Tue, 6 Jun 2023 11:23:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
Content-Language: en-US, nl
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfZN5M8LiP3nw0NT5p3WyJJJJm6w2OZKgm28b6aokzopQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI,

On 5/31/23 19:56, Andy Shevchenko wrote:
> On Wed, May 31, 2023 at 4:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> On some platforms, the imaging clock should be controlled by evaluating
>> specific clock device's _DSM method instead of setting gpio, so this
>> change register clock if no gpio based clock and then use the _DSM method
>> to enable and disable clock.
> 
> ...
> 
>> +       if (clk->ena_gpio)
>> +               gpiod_set_value_cansleep(clk->ena_gpio, 1);
>> +       else
>> +               skl_int3472_enable_clk_acpi_method(clk, 1);
> 
> Looking at this, can we avoid duplicative validation of the GPIO?
> Perhaps skl_int3472_enable_clk_acpi_method() can have embedded another
> check so they won't be called together?
> 
> ...
> 
>> +       if (clk->ena_gpio)
>> +               gpiod_set_value_cansleep(clk->ena_gpio, 0);
>> +       else
>> +               skl_int3472_enable_clk_acpi_method(clk, 0);
> 
> Ditto.

Ack, I've squashed a fix for this into this patch while merging it into
my review-hans branch.

Regards,

Hans


