Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260282EAF9D
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 17:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbhAEQF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 11:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbhAEQF3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 11:05:29 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B55DC061574
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 08:04:49 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id ce23so532247ejb.8
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 08:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0CgS+kCgd4dLgBriIsTwKPjdzyys2aenK8AUWl4yZts=;
        b=okTn1YUZcRZyEp6jUymriIkwYtM0Z0ayh4ZHYXTmceus5TIhZS4oSZDwbOy1ks/wO1
         bypPCoK802bKTCD+fzBZ0CEl7RE9S39z+y2PBG+NRVzoGzE/9foIWwXA+BYEuici2Xw8
         XigUfSRGMYnxUeShWVVVu1KRBjiMSMKQQ2fBqvVqbgAcdEm1J6QbMT3rlRC/qdfXuCCe
         x8NIxRBPTLBMNXyNT9V4A7baEEqve4KKnUMEnm0S0jrQrR1Ja4WVM8tJxgZr8cHRmZI0
         pWVYyaDuH4UicbqRZ+NB7DqnEJ2bp6RyCL50FH4xz5BxWSgCCMWhPh4BmZCw1RdZR4yw
         plag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0CgS+kCgd4dLgBriIsTwKPjdzyys2aenK8AUWl4yZts=;
        b=XdVuvjfGAnTXfGV5wntHLqIo3xrYCQ8kjFBQ8YO8ogWMI4icFd25N4AYAC/cP2/Zax
         QaSel0zu4VbbSKXtQvliI8penkLIVbJKv0924Um+Yb22HHUBo9Y7ASKmwxpFVNRI8R5z
         SpaxK4KXyUZtwMhayXL3Bda5AioMYxQ8SwPsQAZfHo+QUc4d50JQXwOJJzai8cQ6PRXi
         SYE/6pnYOFkyr9aIvRO2eC8X5qpwsD6DQTXhs2FsBicqq+loaTW4cvmRLsmJWPMIegwH
         6Hqe7insGOrN0CcXGF/XzniQKeVh3oWmlVO/NkfgSaVaDVmg28rhQWLMmTB4DDXUOQYm
         4REA==
X-Gm-Message-State: AOAM5302d2AhybSUixypktC1mABfRtsafCXc1AdYccOP/Ub1ZULG8bhg
        nhdwdfhxV2uIf/kGvF/8uJE=
X-Google-Smtp-Source: ABdhPJwkzlWrC/ohK57WI9zeCH/U1GUIj92bX2ICDdHEiIo6WJUBmckQqSmByVflq7fOypDNFQWuIA==
X-Received: by 2002:a17:906:7f11:: with SMTP id d17mr70162656ejr.534.1609862688029;
        Tue, 05 Jan 2021 08:04:48 -0800 (PST)
Received: from kontron.lan (2001-1ae9-1e8-b200-9c26-b1f7-3f54-fb94.ip6.tmcz.cz. [2001:1ae9:1e8:b200:9c26:b1f7:3f54:fb94])
        by smtp.gmail.com with ESMTPSA id u16sm46054580eds.10.2021.01.05.08.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jan 2021 08:04:47 -0800 (PST)
Subject: Re: [PATCH 0/6] Remove last users of v4l2-clk and remove v4l2-clk
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210104165739.116404-1-ezequiel@collabora.com>
From:   Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <59dcd2fd-79db-fdd1-820b-5d3c5ea6446a@gmail.com>
Date:   Tue, 5 Jan 2021 17:08:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104165739.116404-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: cs
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I don't have a working magician setup at the moment, so I can only test the compilation (which works).

Petr

Dne 04. 01. 21 v 17:57 Ezequiel Garcia napsal(a):
> The V4L2 temporary clock helper API is used by just one last capture
> driver, pxa-camera, which registers a dummy clock; and then by just
> a few sensor drivers, consuming clocks through the v4l2-clk API.
> 
> It's possible to convert these few last users, and so remove
> the v4l2-clk API, which hasn't been used for a few years.
> 
> The sensor drivers are already using the CCF API,
> which v4l2-clk API uses as fallback.
> 
> To convert the pxa-camera driver, a fixed-rate clock
> is registered for the mach-based platforms that still exist,
> for mt9m111 to work (the only sensor that PXA currently
> registers).
> 
> Ezequiel Garcia (6):
>   media: mach-pxa: Register the camera sensor fixed-rate clock
>   media: pxa_camera: Drop the v4l2-clk clock register
>   media: ov9640: Use the generic clock framework
>   media: mt9m111: Use the generic clock framework
>   media: ov6650: Use the generic clock framework
>   media: Remove the legacy v4l2-clk API
> 
>  .../driver-api/media/v4l2-clocks.rst          |  31 --
>  Documentation/driver-api/media/v4l2-core.rst  |   1 -
>  arch/arm/mach-pxa/devices.c                   |   8 +
>  drivers/media/i2c/mt9m111.c                   |  17 +-
>  drivers/media/i2c/ov6650.c                    |  26 +-
>  drivers/media/i2c/ov9640.c                    |  15 +-
>  drivers/media/i2c/ov9640.h                    |   4 +-
>  drivers/media/platform/pxa_camera.c           |  30 +-
>  drivers/media/v4l2-core/Makefile              |   2 +-
>  drivers/media/v4l2-core/v4l2-clk.c            | 321 ------------------
>  include/media/v4l2-clk.h                      |  73 ----
>  11 files changed, 37 insertions(+), 491 deletions(-)
>  delete mode 100644 Documentation/driver-api/media/v4l2-clocks.rst
>  delete mode 100644 drivers/media/v4l2-core/v4l2-clk.c
>  delete mode 100644 include/media/v4l2-clk.h
> 
