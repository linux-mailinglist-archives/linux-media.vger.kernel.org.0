Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2EE96388B0
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 12:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiKYLYX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 06:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiKYLYV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 06:24:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3FA1CB23
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669375402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1W54hcOYwQvNSGU/DWgYShiQT5PFWJLNqLmIUjt2ABk=;
        b=aSNWXT85hAkLsbHGySjECM5MyLlJeCXjA5oOJKGLUd0hO+Hb8uBQT+MHcfAdQXV4AsJaDb
        wfXYjMwz27AQ2oeVkVNlJD/NR2LGlDm876LG/urWCHXPkhRrNDnTGWD0l9uWvjwe5ZxjM3
        6DIPQt5XD1lGlw/jpOtpskmBYNiURis=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-410-gLXGCnQVMYu9bOJdKPsq7g-1; Fri, 25 Nov 2022 06:23:21 -0500
X-MC-Unique: gLXGCnQVMYu9bOJdKPsq7g-1
Received: by mail-ej1-f72.google.com with SMTP id jg27-20020a170907971b00b007ad9892f5f6so2149006ejc.7
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1W54hcOYwQvNSGU/DWgYShiQT5PFWJLNqLmIUjt2ABk=;
        b=satfgdl1hxJg1o9wyf89E8jCyRXmHSYAKyK7EOY0aDzmkD5smgW7Po+madRUIMqwOm
         Xxyw/H1tGluGTvGtEG3qHmokQ/amQs1GbvKiRcbOQJhRnyjt+6LFrfC6aQkkOI4r4DaE
         0FTVYFpV/CI6bFLjtfRzXkjjSl/RD6QVQUOlV81kQ6SDBQKLqLoN4+EMZZ1vKnOgg7c1
         +nqFpw1M8jOPhhisDPooecUYTaIRzwZnbL2Vi8VzPspbUScN50eA+w86l/68/CPZDesD
         bOtgaVkIR3zjzzti6E5hprUmIK3Y2hNq6DYzAAchwEDSbeORIDFZbkDdruF+ugf/qWmG
         y9TQ==
X-Gm-Message-State: ANoB5pl947dmafn6WM6/so7YI9F4E1Rjdj/fFQGCfDXORtsLOAjJhCpy
        dA4W98rYNtzrVzhPM4pgPib19OZa3+whW9xHXhHg2qF5Otx+RCOSoyT0MqxRqZ6Pgclrnc1SQj4
        zQKVHp365MthLpdH1cY59oS4=
X-Received: by 2002:a05:6402:3892:b0:454:cbef:c161 with SMTP id fd18-20020a056402389200b00454cbefc161mr16652366edb.365.1669375400028;
        Fri, 25 Nov 2022 03:23:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5McVwAstzhvJ1cpuDCSrLzZrwl4wuQujsxFXM04i7QwYi0yysUnKXOmFMQ9RSj1UxGFQ82iA==
X-Received: by 2002:a05:6402:3892:b0:454:cbef:c161 with SMTP id fd18-20020a056402389200b00454cbefc161mr16652353edb.365.1669375399857;
        Fri, 25 Nov 2022 03:23:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id o5-20020a170906768500b007ad96726c42sm1461842ejm.91.2022.11.25.03.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 03:23:19 -0800 (PST)
Message-ID: <8f736a26-9942-4fda-0237-313da5bf9c6b@redhat.com>
Date:   Fri, 25 Nov 2022 12:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
Content-Language: en-US, nl
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
 <Y4Cf5tLWsBDTndei@pendragon.ideasonboard.com>
 <Y4ChnCHkV9RufccT@smile.fi.intel.com>
 <aa42a60b-fe34-a418-3ada-af55f260592e@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aa42a60b-fe34-a418-3ada-af55f260592e@ideasonboard.com>
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

On 11/25/22 12:11, Dan Scally wrote:
> 
> On 25/11/2022 11:06, Andy Shevchenko wrote:
>> On Fri, Nov 25, 2022 at 12:58:46PM +0200, Laurent Pinchart wrote:
>>> On Fri, Nov 25, 2022 at 10:17:17AM +0000, Dan Scally wrote:
>> ...
>>
>>> Can the LED framework be used without having the LED exposed to
>>> userspace ?
>> I believe the correct question here is "can the states of some leds be
>> read-only from user perspective" (this way any changes into led subsystems
>> looks less intrusive, esp. taking into account that subsystem is de facto
>> unmaintained).
>>
> 
> I think the answer to that is yes:
> 
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/leds/led-class.c#L47

Interesting, I did not know that. But what is the added value of
using the LED subsytem then for a simple only on/off LED driven
by a GPIO?

One of the challenges with using LED triggers for the privacy led,
is that we need at least 2 triggers: "camera-front" and "camera-back"
and then somehow to let what ever code sets the triggers know if
it is dealing with the front or back sensor.

Where as with GPIO-s we *bind* them to the sensor i2c_client so if
we just have the sensor-driver look for an optional GPIO called
"privacy-led" then we don't have this how to we bind the LED to
the sensor problem; and if we drop the sysfs interface I fail to
see the value in using the LED subsystem for GPIO a driven LED.

Also see my other reply for a proposal to be able to share the
code dealing with this between sensor drivers (and also remove
some other gpio/clk/regulator boilerplate from sensor drivers).

Regards,

Hans


