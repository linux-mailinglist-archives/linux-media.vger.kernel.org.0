Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA782307805
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 15:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbhA1O1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 09:27:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbhA1O0s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 09:26:48 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5E5C0613D6
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 06:26:06 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id b17so3413433plz.6
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 06:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z7kqvyeMLdKmefmrsRuOiNzWs95rHzmAWApehWIZvbU=;
        b=kUXcyEUll4Sos7hXPsc4WW3FtQRlfqJTQ46JUCN7+Z8kfZmWvPZ/V1eXI8wszpXTAD
         FdRPlqnCCTzsCMcJoeY4Z1dj+VL/CJX0vhuzAIlCYbXCGzJolmzJ8yKAYr0Ywg/FifXx
         inTvJ1K5yVAjeNHUgo6u57u7AE6cn176WrEPSYlSdpqsTf0OUuSXVX38g3lndD2BLmpS
         R1eD+G3PL+IWzDleJk2PEcZ3R/9GEuRCe8aukWy+CCjMS47mmpCguLR0UjV6CfsJOBOP
         fg1WT0yfBCSQdCod4vwcftGKrusWjGaDtwG1qGCXLcEw7Kd+YWv43xL4Brnh1eETjkQZ
         YrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z7kqvyeMLdKmefmrsRuOiNzWs95rHzmAWApehWIZvbU=;
        b=F+79LAo8DWgVTAbTqHjVoo6UAo07drI8ygu8hUGouTkideef/d8zwJ4URnE4cPssSz
         uwJhXtarS9+Sq6UKmvJgMoDjDQmHprOY11i4kM8Sgf6ud+S2pdmK5FLY4N0M9YRrl26r
         3bFabtQ4qfl3RUjwqxvwWjqwZFxNEOXCXR5Ke1rmJTSSaxmLoG/VcfobB8OmywMA+DnZ
         msRNCDAZ8HyDzhGo7fSOWXNnnarMLMUuOQBvoZmF+cbW4cl9DMiB0sHrSgy+ESnYwsXq
         0JkhD6roUr+GmNxil+KoZt1Qf37HHaXMHK/2tSAJ3//sypnLYMDnl+cdeN8JbRdlf24F
         wRTg==
X-Gm-Message-State: AOAM531YiXEo9UKOo7UqveKj0VlnlwGIvWUH9a8bGFv2EL32X7HpEkur
        IEdXp1Bm07Ik+jFVjQfMsBuak4RqluM3hQm7999OSg==
X-Google-Smtp-Source: ABdhPJx+eqeR3gAs6wxz78K3LKIpQfzJbcd1pJ1H1dJmKLg8lttFsBNi4ViSEi6wnCCISU2VBYv3TVhzzsy1bmdB8v0=
X-Received: by 2002:a17:90a:d913:: with SMTP id c19mr11614350pjv.19.1611843966025;
 Thu, 28 Jan 2021 06:26:06 -0800 (PST)
MIME-Version: 1.0
References: <20210120120847.1505143-1-robert.foss@linaro.org>
In-Reply-To: <20210120120847.1505143-1-robert.foss@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 28 Jan 2021 15:25:54 +0100
Message-ID: <CAG3jFytO5N7u6URVVC_AHG9C9PAcFAX=8mv1SVRdi0SCoXz5Xw@mail.gmail.com>
Subject: Re: [PATCH v5] media: ov8856: Configure sensor for GRBG Bayer for all modes
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ping. I think this patch is ready to be merged.

On Wed, 20 Jan 2021 at 13:09, Robert Foss <robert.foss@linaro.org> wrote:
>
> The previously added modes 3264x2448 & 1632x1224 are actually
> configuring the sensor for BGGR mode, this is an issue since
> the mode that is exposed through V4L incorrectly is set as GRBG.
>
> This patch fixes the issue by moving the output crop window of
> internal sensor ISP uses by one row, which means that the Bayer
> pattern of the output is changed.
>
> From:
> row 1: B G B G B G ...
> row 2: G R G R G R ...
> row 3: B G B G B G ...
> ...
>
> To:
> row 2: G R G R G R ...
> row 3: B G B G B G ...
> ...
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Suggested-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>
> Changes since v1:
>  - Sakari: Added mode information to ov8856_mode struct
>  - Sakari: enum_mbus_code updated
>
> Changes since v2:
>  - Andrey: Switched approach to changing the sensor configuration
>    to yield identical Bayer modes for all modes
>
> Changes since v3:
>  - Andrey: Improve commit msg to explain Bayer shift better
>
> Changes since v4:
>  - Andrey: Fix typ-o
>  - Andrey: Add r-b
>
>
>  drivers/media/i2c/ov8856.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index 2f4ceaa80593..8a355135c7db 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -428,7 +428,7 @@ static const struct ov8856_reg mode_3264x2448_regs[] = {
>         {0x3810, 0x00},
>         {0x3811, 0x04},
>         {0x3812, 0x00},
> -       {0x3813, 0x02},
> +       {0x3813, 0x01},
>         {0x3814, 0x01},
>         {0x3815, 0x01},
>         {0x3816, 0x00},
> @@ -821,7 +821,7 @@ static const struct ov8856_reg mode_1632x1224_regs[] = {
>         {0x3810, 0x00},
>         {0x3811, 0x02},
>         {0x3812, 0x00},
> -       {0x3813, 0x02},
> +       {0x3813, 0x01},
>         {0x3814, 0x03},
>         {0x3815, 0x01},
>         {0x3816, 0x00},
> --
> 2.27.0
>
