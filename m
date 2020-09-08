Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586D4260EE3
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 11:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbgIHJkQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 05:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728798AbgIHJkP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 05:40:15 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD63EC061573
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 02:40:14 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id z9so16474625wmk.1
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zRCxWpcI0mZIwCPZ4RCKhu2QK+Tf1G8AWOmFOM9iPro=;
        b=JKkkamlkJQwdcSYmvC7ArQt5gWC19BaBK3bc7z338KtEK2573v7QCclO2z5gy6DX0N
         i55mhEXmRAgRti1QqgQMHr3G63D4X6j0mei+5yjFaNEIRmlJP/NFBl2HG1YuC8Q+vJ4z
         T2Dii++QAxgwVKVav10xJDZfK1Oo7XsZU/I4CJCZBfd1aew9WW6jdu9fYLBnahTLQt0n
         YLzzcsB750fk3NHAHG7vXz99EzLZZSywjxD93nyWj/b1zQm2x9QrBo0+5XAPfiM7VXG/
         vWSBDlMwXz1SI+S1WbQ5d7GC743X/j68/8cCh7eZeVSFnjPmkNr4UIT03VUzBX7osAQJ
         aCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zRCxWpcI0mZIwCPZ4RCKhu2QK+Tf1G8AWOmFOM9iPro=;
        b=C8Xe2xuuhxLNR4RbxGYoIq0uKGpY3hz+aqKp8I8yy26NeKusNczhjhH2eZZv5I7cA+
         1NoRxmvMfjEdbhZf2I0NgbBqNq+8poMcLFZpXWng4hlp83hA89gWjVPhSodeyNTFMGzS
         8awUpVIoA30FbiJcARKsaiKn6GAhujnJQL4XAzP/DzW/B2BCoErp58Juy8Fx6Xuir+oS
         Zoosmh5IhSUGEjwtGC1kzTWeb+FTtJHh1a0/UtM4SEY7dwZTwXh35o0xGZ23ypICes6b
         5bpEUqEQiONaRCU81FdDdHk60gaWNbJfBasK9nCQDdjbz/aysGAEmgI+GuZnfPgYCdGP
         C1dg==
X-Gm-Message-State: AOAM533YcEb7eyMLXl8mc1RQHw5rTJgzk6+xXXdmiY7N3E5man4DqfdD
        QYZ0YAuZHgIu3ParD2gWXw4=
X-Google-Smtp-Source: ABdhPJzSf9zI0rFEjPmhWjgiPZA6CfeUTK2g9Udbi/ImIqJWKul/1eTl9kPQ72QpWjy0srFRbFq6BQ==
X-Received: by 2002:a1c:a9c2:: with SMTP id s185mr3607508wme.100.1599558010545;
        Tue, 08 Sep 2020 02:40:10 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id b194sm34318156wmd.42.2020.09.08.02.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 02:40:10 -0700 (PDT)
Subject: Re: cio2 ipu3 module to automatically connect sensors via swnodes
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        kitakar@gmail.com, jorhand@linux.microsoft.com,
        andriy.shevchenko@linux.intel.com
References: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
 <20200908080326.GB27352@paasikivi.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <5614b37e-c263-c9e7-fe5b-a523401c58e2@gmail.com>
Date:   Tue, 8 Sep 2020 10:40:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908080326.GB27352@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari - thanks for the reply

On 08/09/2020 09:03, Sakari Ailus wrote:
> On ACPI systems regulators and clocks as well as GPIOs to some extent are
> controlled by AML code in the DSDT and SSDT. There are different ways this
> can be implemented though. It may be that the PMIC in this case is
> controlled entirely from the AML code without the need for a driver.
>
> This might be the case here. It should be possible to figure this out from
> the DSDT and SSDT tables.

Ah - that's interesting, thanks. I'll delve into the SSDT and DSDT 
tables and see if I can spot that happening. Presumably it is the case 
though, as like I say it seems to be working fine without any 
intervention by our sensor drivers.

> If you do not change how the regulators in the PMIC are controlled I'd
> think it's very, very unlikely you'd be able to fry the sensors.
Very reassuring!
> The GPIOs there I'd expect to be reset GPIOs, one for each sensor.
> Interesting that they are not handled by ACPI in this case. FWIW, the
> tps68470 driver is present also in the upstream kernel.
Yeah we found the tps68470 gpio driver (actually andriy pointed it out I 
think) - it seems that the pins _provided_ by that driver don't actually 
have any affect when toggled though, only the ones allocated to the PMIC 
in its _CRM seem to turn the sensors on/off when toggled (at least, 
switching those off is the only thing that stops the sensor from 
appearing in i2cdetect). The pins from the PMIC's _CRM seem to just be 
system GPIO pins, controllable with `gpioset gpiochip0` for example. For 
the most part we've been controlling them in the sensor drivers by 
evaluating the sensor's _DEP entry in ACPI to get to the PMIC's 
acpi_device. That does seem a little hackish though, and it's definitely 
pretty ugly.
