Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373FF691E15
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 12:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbjBJLUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 06:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbjBJLUY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 06:20:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6F81BAFF
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 03:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676027974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EWATG1nfwrnPGpKg4h6TUPJK2jBZUl8fDKwJ15Mnkpc=;
        b=MFhbz0C9wvVp64ixMUVSwptvc+KxaBBlvPF/KgZ6AccMnzhOdWFLrLxirurZrYVASL3dp8
        YVOx0rHm9BPQYWsqMOJlngPQqHENluRkNfSfK5YF+L+3b6rqL1Kbe7SeZ6G1OOKgZs2RzO
        +sJCtsaO8eaqkV16QfuctA2I2sr8X04=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-zr4OSUs2O2KaS7KoHj7ayg-1; Fri, 10 Feb 2023 06:19:33 -0500
X-MC-Unique: zr4OSUs2O2KaS7KoHj7ayg-1
Received: by mail-ed1-f69.google.com with SMTP id bq13-20020a056402214d00b004a25d8d7593so3347390edb.0
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 03:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWATG1nfwrnPGpKg4h6TUPJK2jBZUl8fDKwJ15Mnkpc=;
        b=kI7Uj/f3ZwrCMemluddk/N/F4miPxlhShmanZghaodMoOgQd+ewXfGuLZ9RZvf2M67
         fVfP+o1XHSl+DUOOnuR147x54m1ilLuFsQIeKGd55UitUB1PElnUNv9VC4sTc9tGD62I
         kgcz8SGdrRsdnpPSVFyY1ts4hAPQSiG87tVEUEBxnKVNZJxIKRjCYwYNMpt7aSniyqC0
         tFt+6l/M1NNQhZAeOxH5pZZ13pWDgcZeYs6ff+EyPZ3m/XNN+Q/cI1HS0+bea6gXEJ1o
         zLAcr7EAXDl5NwhzpU55lhalozCBmTpsXird++7FeuS0dL7+Am513E0RSs01aA38DOLO
         WmrA==
X-Gm-Message-State: AO0yUKXira1o2H0uPiQZoreQtkmNXndz/HGfHZTElsGzMqy+7DWj7JvG
        JPBeycYBY9dYYZf9+HHmw+sADJ3CWyjTSQ5Z4lk4SrOeOvA+lIyCMFUIkGzM0d+BZkShV6w+ChG
        gMZLldIm98ekrY+RcdCvGrB0=
X-Received: by 2002:a17:906:720f:b0:8aa:9a03:356a with SMTP id m15-20020a170906720f00b008aa9a03356amr12441720ejk.49.1676027972269;
        Fri, 10 Feb 2023 03:19:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8BdTKIVQ9XX8/YtvA5BvLBEJsaLojUbZ+czHrocqNl+jkt6XJ2UWpNuUuaDt2McpyxXgh5mA==
X-Received: by 2002:a17:906:720f:b0:8aa:9a03:356a with SMTP id m15-20020a170906720f00b008aa9a03356amr12441706ejk.49.1676027972072;
        Fri, 10 Feb 2023 03:19:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906859800b0088c224bf5b5sm2244999ejx.148.2023.02.10.03.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:19:31 -0800 (PST)
Message-ID: <974597c0-1614-97d5-d933-e52bb1a062ab@redhat.com>
Date:   Fri, 10 Feb 2023 12:19:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <Y+YamxehIUdF5aU7@kekkonen.localdomain>
 <Y+Ycf4SpMaUfdR5m@pendragon.ideasonboard.com>
 <Y+Yg217HSEi4c+mP@kekkonen.localdomain> <Y+YiNyC7TeOEn/Hi@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y+YiNyC7TeOEn/Hi@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2/10/23 11:53, Andy Shevchenko wrote:
> On Fri, Feb 10, 2023 at 12:47:55PM +0200, Sakari Ailus wrote:
>> On Fri, Feb 10, 2023 at 12:29:19PM +0200, Laurent Pinchart wrote:
>>> On Fri, Feb 10, 2023 at 12:21:15PM +0200, Sakari Ailus wrote:
>>>> On Thu, Feb 09, 2023 at 06:11:12PM +0200, Laurent Pinchart wrote:
> 
> ...
> 
>>>> I took a look at this some time ago, too, and current regmap API is a poor
>>>> fit for CCI devices. CCI works on top of e.g. both I²C and I3C so something
>>>> on top of regmap is a better approach indeed.
>>>
>>> I'm confused, is regmap a poor fit, or a better approach ?
>>
>> I'm proposing having something on top of regmap, but not changing regmap
>> itself.
> 
> I don't understand why we can't change regmap? regmap has a facility called
> regmap bus which we can provide specifically for these types of devices. What's
> wrong to see it done?

It is fairly easy to layer the few 16 and 24 bit register accesses over
a standard regmap with 16 bit reg-address and 8 bit reg-data width using
regmap_bulk_write() to still do the write in e.g. a single i2c-transfer.

So if we want regmap for underlying physical layer independence, e.g.
spi / i2c / i3c. we can just use standard regmap with a 
cci_write_reg helper on top.

I think that would be the most KISS solution here. One thing to also keep
in mind is the amount of work necessary to convert existing sensor drivers.
Also keeping in mind that it is not just the in tree sensor drivers, but
also all out of tree sensor drivers which I have seen use similar constructs.

Requiring drivers to have a list / array of structs of all used register
addresses + specifying the width per register address is not going to scale
very poorly wrt converting all the code out there and I'm afraid that
letting regmap somehow deal with the register-width issue is going to
require something like this.

Regards,

Hans


