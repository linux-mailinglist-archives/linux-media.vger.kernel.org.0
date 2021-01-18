Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A18A2FA9F9
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 20:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437212AbhARTTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 14:19:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437206AbhARTTb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 14:19:31 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD3AC061574
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 11:18:50 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id v24so18981282lfr.7
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 11:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1G++hlstE5EhL0NBi0mNuJgSYlqKjxYXBmRajyzuRok=;
        b=CIr2xOcp79UpmWJ/jyt/XIKvAFMFSeDmOt3iPj7fpsRRj78cq96vdOB6vPLauPdGVm
         GBP3+Vjinfw0cr4nZkCwhex4OS4nplF0EIHooHPh2gO6j0gI8t7NgQwes4HGNpz3YSVn
         RRtbowVP6LbaTCXeRXqhGTuA5Z35bbdn+8WxzBDNtRP4pecko6dZ9HaFS9L5dBI0NvYe
         rwwp4WYEXYk6Ih0sl28bOHIhOdx4U6uBv4UX7WGNKTbSR3L5E7WZlrXAmBhVHlPy9V3s
         tC/MkAHH8qS8md1C9b0bOPjtYV7FbbOiA5lg4xSrTSm9IL4otHBcQP9uLFHtTx3sZMFL
         XMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1G++hlstE5EhL0NBi0mNuJgSYlqKjxYXBmRajyzuRok=;
        b=IVxbhu4Un3PESlnwYSJt6fn4mW9xa8dZTffHFxWvtFJmVZkwQoX0Xgo0r0gX/RqSTJ
         vBRCDuubB8YLJhKzQb0yczLPZmgfPot4tQIc35wtWHxKfYdpixrK+dxeXhUxFNFi3PNe
         yH/MgdGODYDLdecdcV5EbMWRr1hD65dUYNyPrPBSSG+sGr6ACh/YGLXMk6VvjmVa9C2e
         GdMTM07IUZv6AhL4avPX/xgGQO9PWh0RKTExHUyI2blFdHy6Bayc7TucvYVztQ8FlpVA
         QRhpSg2hEKB8MMLNHNUwCEnF8v8uoiwgrigcPY3aT+HXCAu/lpxrgGxE732y/M/ZDXc6
         6L1g==
X-Gm-Message-State: AOAM531C8aABzLHUT3HlcNvjz7rxlLBWbtDgUi4lsqH7iwt5cnBdTJz0
        T8H+Xj7CokoxU+eGWcOJZ/Xmmw==
X-Google-Smtp-Source: ABdhPJxUgdKMu/r2+a09F5q+MudyKgnyRx2Z4mFWXK/y9jeHKBuRZ6u0z8GSceupre/DIB4pgM7OmA==
X-Received: by 2002:a19:a04:: with SMTP id 4mr266769lfk.30.1610997529211;
        Mon, 18 Jan 2021 11:18:49 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id g190sm1987837lfd.72.2021.01.18.11.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 11:18:48 -0800 (PST)
Subject: Re: [PATCH v4] media: ov8856: Configure sensor for GRBG Bayer for all
 modes
To:     Robert Foss <robert.foss@linaro.org>, dongchun.zhu@mediatek.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Tomasz Figa <tfiga@google.com>
References: <20210118190132.1045913-1-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <db76aedb-de5e-2040-1e1c-777848614a7f@linaro.org>
Date:   Mon, 18 Jan 2021 22:18:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210118190132.1045913-1-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Thanks for you patch!

Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>

On 18.01.2021 22:01, Robert Foss wrote:
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
> raw 3: B G B G B G ...
> ...
> 
> To:
> raw 2: G R G R G R ...
> raw 3: B G B G B G ...
> ...
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Suggested-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
> 
> Changes since v1:
>   - Sakari: Added mode information to ov8856_mode struct
>   - Sakari: enum_mbus_code updated
> 
> Changes since v2:
>   - Andrey: Switched approach to changing the sensor configuration
>     to yield identical Bayer modes for all modes
> 
> Changes since v3:
>   - Andrey: Improve commit msg to explain Bayer shift better
> 
>   drivers/media/i2c/ov8856.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index 2f4ceaa80593..8a355135c7db 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -428,7 +428,7 @@ static const struct ov8856_reg mode_3264x2448_regs[] = {
>   	{0x3810, 0x00},
>   	{0x3811, 0x04},
>   	{0x3812, 0x00},
> -	{0x3813, 0x02},
> +	{0x3813, 0x01},
>   	{0x3814, 0x01},
>   	{0x3815, 0x01},
>   	{0x3816, 0x00},
> @@ -821,7 +821,7 @@ static const struct ov8856_reg mode_1632x1224_regs[] = {
>   	{0x3810, 0x00},
>   	{0x3811, 0x02},
>   	{0x3812, 0x00},
> -	{0x3813, 0x02},
> +	{0x3813, 0x01},
>   	{0x3814, 0x03},
>   	{0x3815, 0x01},
>   	{0x3816, 0x00},
> 
