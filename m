Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E55F2EF107
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 12:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbhAHLBM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 06:01:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbhAHLBM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 06:01:12 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC041C0612F6
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 03:00:31 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ga15so14006551ejb.4
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 03:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Un39CzzMCo3lTlEmgJEWmuQlsbm6EVcAyFjjs6nG5l8=;
        b=FDv/fFTAz/6EP5VbWUtAFYrBdkexsCN9SbE49oRBeXXvr224o8TKNhxiZy3WmnNM6H
         gzs30dzycJ6AXBWqKAc+kqjgLc6EWEDOeDHAdRjxfzuGHgQ21UQda+fW+yRxi8l7nDtV
         QMId2pymYNOEePO0ymYu50Ta4uCEyOgEfIFopEV1a5LgPC9wnuS1+e//gTQjC2CwgTMS
         dmSlWpeQqgL5+odXAzVdFRMa0GO+Xfzo/vUZfsf60rGxgvmjglDEWYBUzeLCbFEHznrG
         LAHKXZ1KLnSM54irh31NrYqrX8PsWlb07JZxwQNbojY+q9yjCwxMPYb4HXZF6CagOaXF
         K2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Un39CzzMCo3lTlEmgJEWmuQlsbm6EVcAyFjjs6nG5l8=;
        b=oOurbbwUK/SAyYgcTBGRlVQYVowXI2iJ/I4eeUdQiEtAwfgoBCdCiGaZLfqnPVg7Yx
         mBO6o7zzhd7EqpcSeLc/qA1NZPMmyU2F/3HEjWsePj0WeGOiXrjpZuvD8BxsuH8b315s
         t1TkwscL/zxplTAZAUFuFoGlmqWdhVPcuR4GCFe0ljl9A7WCoxovfzjdzrAKTtweio5v
         4QAUYVT7QE0Cg9F+9G98cHgOztnA8D+p3AvDc1hTzgiXppACSGeoPYxQwlDX14NZnwo0
         Jnj0m7tnPkWVERssdOBUAa6dPs0U1hUi8ePVRitqWUDchTLMx+FpdPgY/vO4JP1e8nC/
         ctZA==
X-Gm-Message-State: AOAM530dXI1QXmHs6lWbqL6JO9I124atfYpWKjN3yzkMbMNJ69ZEpxYu
        gJ2986LgzcCBBTrg5cSejY14Yll2xGAe5113
X-Google-Smtp-Source: ABdhPJx4jvkbUAoYJ5NGaZwcxtMh0OxFuT1wsKEqxOAT8tiA8j2mUaPu5c9pQV1juLK4EqdAka6VTg==
X-Received: by 2002:a17:906:2984:: with SMTP id x4mr2294911eje.239.1610103630464;
        Fri, 08 Jan 2021 03:00:30 -0800 (PST)
Received: from kontron.lan (2001-1ae9-1e8-b200-9c26-b1f7-3f54-fb94.ip6.tmcz.cz. [2001:1ae9:1e8:b200:9c26:b1f7:3f54:fb94])
        by smtp.gmail.com with ESMTPSA id o10sm3389098eju.89.2021.01.08.03.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jan 2021 03:00:29 -0800 (PST)
Subject: Re: [PATCH 0/6] Remove last users of v4l2-clk and remove v4l2-clk
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210104165739.116404-1-ezequiel@collabora.com>
 <59dcd2fd-79db-fdd1-820b-5d3c5ea6446a@gmail.com>
 <3bec40b9d5b9af50c069357cc41ad0a401e5615a.camel@collabora.com>
From:   Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <84055855-d84a-70e2-a9ce-88166147bc8e@gmail.com>
Date:   Fri, 8 Jan 2021 12:04:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3bec40b9d5b9af50c069357cc41ad0a401e5615a.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: cs
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne 06. 01. 21 v 15:24 Ezequiel Garcia napsal(a):
> Hi Petr,
> 
> On Tue, 2021-01-05 at 17:08 +0100, Petr Cvek wrote:
>> I don't have a working magician setup at the moment, so I can only test the compilation (which works).
>>
> 
> Thanks for the testing! Does that mean I can take your Tested-by ?

Well it was just a compilation and I don't know ov6650 nor mt9m111. And I may have some time in the next month to try it on the real device.


> 
>> Petr
>>
>> Dne 04. 01. 21 v 17:57 Ezequiel Garcia napsal(a):
>>> The V4L2 temporary clock helper API is used by just one last capture
>>> driver, pxa-camera, which registers a dummy clock; and then by just
>>> a few sensor drivers, consuming clocks through the v4l2-clk API.
>>>
>>> It's possible to convert these few last users, and so remove
>>> the v4l2-clk API, which hasn't been used for a few years.
>>>
>>> The sensor drivers are already using the CCF API,
>>> which v4l2-clk API uses as fallback.
>>>
>>> To convert the pxa-camera driver, a fixed-rate clock
>>> is registered for the mach-based platforms that still exist,
>>> for mt9m111 to work (the only sensor that PXA currently
>>> registers).
>>>
>>> Ezequiel Garcia (6):
>>>   media: mach-pxa: Register the camera sensor fixed-rate clock
>>>   media: pxa_camera: Drop the v4l2-clk clock register
>>>   media: ov9640: Use the generic clock framework
>>>   media: mt9m111: Use the generic clock framework
>>>   media: ov6650: Use the generic clock framework
>>>   media: Remove the legacy v4l2-clk API
>>>
>>>  .../driver-api/media/v4l2-clocks.rst          |  31 --
>>>  Documentation/driver-api/media/v4l2-core.rst  |   1 -
>>>  arch/arm/mach-pxa/devices.c                   |   8 +
>>>  drivers/media/i2c/mt9m111.c                   |  17 +-
>>>  drivers/media/i2c/ov6650.c                    |  26 +-
>>>  drivers/media/i2c/ov9640.c                    |  15 +-
>>>  drivers/media/i2c/ov9640.h                    |   4 +-
>>>  drivers/media/platform/pxa_camera.c           |  30 +-
>>>  drivers/media/v4l2-core/Makefile              |   2 +-
>>>  drivers/media/v4l2-core/v4l2-clk.c            | 321 ------------------
>>>  include/media/v4l2-clk.h                      |  73 ----
>>>  11 files changed, 37 insertions(+), 491 deletions(-)
>>>  delete mode 100644 Documentation/driver-api/media/v4l2-clocks.rst
>>>  delete mode 100644 drivers/media/v4l2-core/v4l2-clk.c
>>>  delete mode 100644 include/media/v4l2-clk.h
>>>
> 
> 
