Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47342B71E7
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 23:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729498AbgKQW7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 17:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728777AbgKQW7e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 17:59:34 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E96C0613CF;
        Tue, 17 Nov 2020 14:59:33 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id p22so416764wmg.3;
        Tue, 17 Nov 2020 14:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zpVUFcKcpazRBQjDWd/8lZHZuRLZ1CRr09w7M6vNLNA=;
        b=Psm5ELe2/Nk1exiFuNIHfTQ+85NJx62LBsbVdjZoJxGWFVnyl/XJMWLmrnqOHrhAkn
         JbsDJGwHozno8b/l/AXRMPAqwnkPrC4zyHBOA1tg1J0DdRx62Qgvp7pkxBOKW+vrkAmd
         Cp8++RKgBBrsbILMks8FEZHTozYH1YKiunqxJ9P5sS7GJqS90zgkMyqj8uJbjoGCde/t
         QkSRVbm1TysmGSN/LH9e64R26p1oLJg2KyKmiUoioupXCdxRrYG7rfELOxUPO+5gorKc
         dbR8i49vPRPUgRgpOYJk289IRcpoSNqEqsyszvam84evUPNlyT8kWIqB85v2RElRBDXF
         Yh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zpVUFcKcpazRBQjDWd/8lZHZuRLZ1CRr09w7M6vNLNA=;
        b=pDd2KsO128c76xFPgcfL0S7wRF8wj88sIUG3WS1knCoAwT3RRnLMUaPHVdOnUZIl0b
         GtjvYMqFOpImOCohjL9PssZnTa3hraJXMkLfMLJ9sY6QGzSSWtI1x0E0jA+M/bj2r3sB
         6ywxyai/oz4WbMoKj3g0/M8bVb7ftP4h6TZgS0FenYU+8KoHNnKvnYPsAavo2o1THhw0
         pvdZAhXbNfiHv0B1zA+H/huyx5zHo2BrwX+Yw/3tc/s8RNI/KEXj3Vigtg4vPZOHSXA6
         6BR5TzU6oPgDPDoZDmIB+DbGBoaImFkH4OwG39T89tTJ4hmXd8yvsQnz7b2DW6AadlPk
         gjqg==
X-Gm-Message-State: AOAM531o27836TYINEiLYFXKdY+HQNpttAc4Cju/SL4e/dJe9nZpQ/64
        68M71wMEV4XILTOhecBOFYeXFQNWNqmUwgOm
X-Google-Smtp-Source: ABdhPJy8R7SrSe3icBO5IxNWCHeGer42ab9ytsz99KlGqjpXzr2TveT4+FH32GIzYTTufqQcDw8aEA==
X-Received: by 2002:a1c:9ad3:: with SMTP id c202mr1232699wme.43.1605653972486;
        Tue, 17 Nov 2020 14:59:32 -0800 (PST)
Received: from [192.168.1.211] ([2.31.225.98])
        by smtp.gmail.com with ESMTPSA id f23sm286747wmb.43.2020.11.17.14.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 14:59:31 -0800 (PST)
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Petr Mladek <pmladek@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tsuchiya Yuto <kitakar@gmail.com>
References: <20201029212930.GE15024@pendragon.ideasonboard.com>
 <20201029222215.GI4077@smile.fi.intel.com>
 <20201029225124.GI15024@pendragon.ideasonboard.com>
 <60b36af2-ad57-000b-76e4-379e1b58a3a0@gmail.com>
 <20201113162231.GO7524@pendragon.ideasonboard.com>
 <CAHp75VeGJKMeY-reNWgypVzJ6Myz5S2RXJPHqbPH5kzLYX3G4g@mail.gmail.com>
 <20201116085349.GA6540@pendragon.ideasonboard.com>
 <CAHp75Ve-O4u1B=dvC+HT-sg=YnoWSuV6kUkPmBSOx4w9OgoOoA@mail.gmail.com>
 <20201116141038.GJ6540@pendragon.ideasonboard.com>
 <3646e11c-a101-74e3-2eb4-7abf29937e9d@gmail.com>
 <20201116161636.GC4077@smile.fi.intel.com>
 <3976eac8-2a21-a619-1dba-85212ac4b4b1@gmail.com>
 <CAHp75VcEb373m=WjP5nPtEUMiiKga2_5w1YPB-T=VtvjaFh7Ww@mail.gmail.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <6dd605bb-baf7-c0d3-311a-1f4b134be406@gmail.com>
Date:   Tue, 17 Nov 2020 22:59:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcEb373m=WjP5nPtEUMiiKga2_5w1YPB-T=VtvjaFh7Ww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/11/2020 16:42, Andy Shevchenko wrote:
> On Tue, Nov 17, 2020 at 2:02 PM Dan Scally <djrscally@gmail.com> wrote:
>> On 16/11/2020 16:16, Andy Shevchenko wrote:
>>> On Mon, Nov 16, 2020 at 02:15:01PM +0000, Dan Scally wrote:
>>>> On 16/11/2020 14:10, Laurent Pinchart wrote:
>>>>> I thought we were looking for ACPI devices, not companion devices, in
>>>>> order to extract information from the DSDT and store it in a software
>>>>> node. I could very well be wrong though.
>>>> This is correct - the code to fetch the various resources we're looking
>>>> at all uses acpi_device. Whether using Andy's iterator suggestions or
>>>> previous bus_for_each_dev(&acpi_bus_type...) I'm just getting the
>>>> acpi_device via to_acpi_dev() and using that.
>>> If you try to get an I²C ore SPI device out of pure ACPI device (with given
>>> APCI _HID) you will fail. So, it's not correct. You are retrieving companion
>>> devices, while they are still in the struct acpi_device.
>>>
>>> And don't ask me, why it's so. I wasn't designed that and didn't affect any
>>> decision made there.
>> Well, in terms of the actual device we're getting, I don't think we're
>> fundamentally doing anything different between the methods...unless I'm
>> really mistaken.
>>
>>
>> Originally implementation was like:
>>
>>
>> const char *supported_devices[] = {
>>
>>         "OVTI2680",
>>
>> };
>>
>>
>> static int cio2_bridge_connect_supported_devices(void)
>>
>> {
>>
>>         struct acpi_device *adev;
>>
>>         int i;
>>
>>         for (i = 0; i < ARRAY_SIZE(supported_devices); i++) {
>>
>>                 adev =
>> acpi_dev_get_first_match_dev(supported_devices[i], NULL, -1);
>>
>> ...
>>
>> }
>>
>>
>> and acpi_dev_get_first_match_dev() likewise just returns adev via
>> to_acpi_device(dev).
>>
>>
>> So, maybe we don't need to do the iterating over all devices with
>> matching _HID at all, in which case it can be dropped, but if we're
>> doing it then I can't see that it's different to the original
>> implementation in terms of the struct acpi_device we're working with or
>> the route taken to get it.
>>
>>
>> Either way; ACPI maintainers asked to be CC'd on the next patchset
>> anyway, so they'll see what we're doing and be able to weigh in.
> Implementation wise the two approaches are quite similar for now, indeed.
> I would rather go with an iterator approach for a simple reason, EFI
> code already has something which may utilize iterators rather than
> using their home grown solution.
Alright - let's stick with that approach and leave the handling multiple
sensors of same model in then. That's the current state of the code
anyway, and it means it can be used elsewhere too.
