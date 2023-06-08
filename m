Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 900EE727A0A
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 10:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235496AbjFHIeV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 04:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232984AbjFHIeO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 04:34:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD4C269E
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 01:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686213209;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6WmgJiiB2u8woSFpdvZ/uxVeJDxRAQpKd9AvYFQONZs=;
        b=QywbLDLmnnEEo5uwRQ+d6n2FnyyBTilzxT0VYS/Dkb3wm4Xc1QiztbS4wB1VoOYzftaTGz
        rN5D02ueRrJFTvSqAGAZmObZo6tuYgbuRnK61jE5BmXaGUjoMu3ksPG4bReWUtkNGiowLQ
        sPW04+qBEHPAo6NdSevQOJqOpOYyD3U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-5JWdr0I7MbuflPjXIaITiA-1; Thu, 08 Jun 2023 04:33:28 -0400
X-MC-Unique: 5JWdr0I7MbuflPjXIaITiA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-516a17e29efso321313a12.1
        for <linux-media@vger.kernel.org>; Thu, 08 Jun 2023 01:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686213207; x=1688805207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6WmgJiiB2u8woSFpdvZ/uxVeJDxRAQpKd9AvYFQONZs=;
        b=CLU3SIhv4CCnQndE8c47o6blDiOHT7Jt6MjVVkSODuWq4SjMZEAOWDlNZL9NkIlgWD
         iqkAKVI8tkirR/eYhkRuLOGeBQttS80WiY52TIkk4PEHi9SOSi9aPCSNtwU8EDyKFuc8
         Ybj/0gvX3/HOtdo9bP0O+JlwgPrDvHR9CIbHVTok5k7MxTM0/ek25OIDpBggE/lWQUdv
         4FAG0ljfvLKATUMllx20HE4CT7T0rdLDN0a3Z3gchMRvRFlQzrqYvXufkotYjia8Jw0n
         x4Gtu1a3vL0x50kDAdznTE6mpC9yyjrmTqVmQKQOqyVHKDEpki+OurTNa0jdrSd61f3+
         N5fg==
X-Gm-Message-State: AC+VfDyR1U0ATtrYbT/FJxWglZDD3cmVuQ1fcCnShFiD8DWVZbNHNUY+
        cLrr3ocryPuQgVVfvmhrxiY7q+Aa8KAsDHZdt0Vd9iUrwQcl78jx9jpTK2bFFx/ASVQ9EiYwrmS
        LeWgfRZBQRd8tgy1dhNhefVmSKN2NEHM=
X-Received: by 2002:aa7:d798:0:b0:514:8d90:5eae with SMTP id s24-20020aa7d798000000b005148d905eaemr7695668edq.10.1686213206895;
        Thu, 08 Jun 2023 01:33:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/3TYVosq9Vkk9XsuP/bbTbwKNJMmJbqqmGF8XXA59BskcFPkPcJZQneF7WCc0m5WHLiJjVg==
X-Received: by 2002:aa7:d798:0:b0:514:8d90:5eae with SMTP id s24-20020aa7d798000000b005148d905eaemr7695658edq.10.1686213206626;
        Thu, 08 Jun 2023 01:33:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7d0cb000000b00514a97b6b80sm270922edo.78.2023.06.08.01.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 01:33:26 -0700 (PDT)
Message-ID: <6203f390-5d06-647a-426d-7671002aec96@redhat.com>
Date:   Thu, 8 Jun 2023 10:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <20230607181855.GM5058@pendragon.ideasonboard.com>
 <b558aac9-0a34-ecca-57b0-d132af8cdefb@redhat.com>
 <ZIDjgFtZ7qp6YYz1@smile.fi.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZIDjgFtZ7qp6YYz1@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 6/7/23 22:07, Andy Shevchenko wrote:
> On Wed, Jun 07, 2023 at 09:01:40PM +0200, Hans de Goede wrote:
>> On 6/7/23 20:18, Laurent Pinchart wrote:
>>> On Tue, Jun 06, 2023 at 06:58:06PM +0200, Hans de Goede wrote:
> 
> ...
> 
>>>> +		if (regs[i].delay_us)
>>>> +			fsleep(regs[i].delay_us);
>>>
>>> Do you have an immediate need for this ? If not, I'd drop support for
>>> the delay, and add it later when and if needed. It will be easier to
>>> discuss the API and use cases with a real user.
>>
>> This is a 1:1 mirror of regmap_multi_reg_write() note this uses
>> the existing struct reg_sequence delay_us field and the:
>>
>> 		if (regs[i].delay_us)
>> 			fsleep(regs[i].delay_us);
>>
>> is copied from the implementation of regmap_multi_reg_write()
> 
> Reading this I'm wondering if we can actually implement a regmap-cci inside
> drivers/base/regmap and use it. It might be that this is impossible, but can
> save us from repeating existing code I think.

Someone (you I believe?) already suggested this when discussing replacing
the ov_16bit_addr_reg_helpers.h . This is not possible because regmap
assumes a fixed register width for the device and this assumption is
all over the place in regmap.

The whole purpose of the CCI helpers is to provide a thin layer on top
to deal with different register widths while delegating everything else
to regmap.

Regards,

Hans


