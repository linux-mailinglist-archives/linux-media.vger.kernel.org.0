Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C2C296C7C
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 12:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461897AbgJWKGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 06:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S375511AbgJWKGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 06:06:47 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256B8C0613CE;
        Fri, 23 Oct 2020 03:06:47 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id b8so1171871wrn.0;
        Fri, 23 Oct 2020 03:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vnLEsIugy8xvXNIclSLGmg9kD79KDDOLfFWkcv4TaQc=;
        b=lOjsCttsCFyyDUBvPgzPaxUcMJgYsZ/Ajjuetws2BVUupHwxjs9hGbjjETkeWoT+Um
         p/KLxVU0geT3Y3EQR/I/p6qReUM5vMrpNp1K/5xNd+8yOwijtGFvKp0D8a5b5AiExxIK
         tavp1YmjobGxvzms97xHk+L2HaY8Xo8rDYpW2W/bfMfWGx+hk7J+DqFcaz9NG/Kzcezx
         K1ff2+tzaLibcx/dDbSWP9E46EeNVyRo8/FrcSSrjyfxjWdcjLhYcWm53/CtCFivji9b
         d64UOEkoXk7ozCXIaD+63kX+VyurcKGSi7B53Tplm2JUwDC7ysZTZ9wiI/6+837BhJi6
         6C9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vnLEsIugy8xvXNIclSLGmg9kD79KDDOLfFWkcv4TaQc=;
        b=qVTXOP3d9K2RuHYSGcoI2j/6rND2GpCSKSOJ2dF3ltoSkduQUE1HG7WUlaQxWQdou3
         GD2gzYAhXRUpMBh0rZ+vAyvyKF7tW3msrrFm7T99LNBG+8tTUAMTL3sNSfflizkksjGH
         m4KvhiZxKWWNgjO0q9X7/zuvTcjbRMfIrF5oDut7gf+plK03Qh61iImeRHfwHtpOUoY8
         elaS6GtOvtTsXMBhV91r3X6u8aY5ZwEsmDp+su5vDJhQZtidghN73C9rAPabSz2XsYlM
         ROyPXiKVpQyl28MdxZDVxkdyedA0rL5fNz+0u8qh6tj4Q48Z6wluYd3h3tGVeR1XpiDc
         b5pg==
X-Gm-Message-State: AOAM532kA7xVsyB6EQJfqSTBZ4YEzhWGru/uLglOe6+KXncKBSkAbQBU
        SqTS6WbjpIp3ihPigY0cqxQ=
X-Google-Smtp-Source: ABdhPJz1JG9KVkORqq8eqDUXADMExrfVwprOEXfolaGwV93DhhrfuWMZJ8viUOSZULXy5vb6s5SMHw==
X-Received: by 2002:adf:e88a:: with SMTP id d10mr1871052wrm.247.1603447605898;
        Fri, 23 Oct 2020 03:06:45 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.56])
        by smtp.gmail.com with ESMTPSA id x1sm2167817wrl.41.2020.10.23.03.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 03:06:45 -0700 (PDT)
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linus.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
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
        Tsuchiya Yuto <kitakar@gmail.com>, dan.carpenter@oracle.org
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
 <20201020094113.GG4077@smile.fi.intel.com>
 <4ce5b55f-f492-2b52-5571-86ee346db795@gmail.com>
 <CAHp75VfhxL2iyp_sNwmDyCG6-6bE5QZYd3Ubp=egZhTCcB=jgg@mail.gmail.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <dad23c89-b162-6905-72a6-5184d7407274@gmail.com>
Date:   Fri, 23 Oct 2020 11:06:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfhxL2iyp_sNwmDyCG6-6bE5QZYd3Ubp=egZhTCcB=jgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/10/2020 14:40, Andy Shevchenko wrote:
> On Thu, Oct 22, 2020 at 3:59 PM Daniel Scally <djrscally@gmail.com> wrote:
>> On 20/10/2020 10:41, Andy Shevchenko wrote:
> ...
>
>>>> +static const char * const port_names[] = {
>>>> +    "port0", "port1", "port2", "port3"
>>> + comma.
>> I think 4 ports is the maximum for CIO2 device, so this shouldn't ever
>> get extended?
> It's better for at least teaching purposes (if anybody takes this
> driver as an example for anything) if you have really believe that no
> new generation will have more than that.

Yeah fair point - it's added


>>>> +    if (is_software_node(dev_fwnode(&pci_dev->dev)))
>>> Can we use the same check as for _build call above?
>> And just set a flag in struct cio2? sure.
> I meant can we use exact conditional w/o any additional flags added?
Oh I see. Erm...I can't think of a way to do that immediately; checking
for the fwnode graph's presence will of course pass if it's defined in
ACPI too. Let me think about it
