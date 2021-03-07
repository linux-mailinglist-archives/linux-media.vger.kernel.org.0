Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8040C330269
	for <lists+linux-media@lfdr.de>; Sun,  7 Mar 2021 16:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbhCGPB4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Mar 2021 10:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbhCGPBl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Mar 2021 10:01:41 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71791C06174A;
        Sun,  7 Mar 2021 07:01:25 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id d20so6941034qkc.2;
        Sun, 07 Mar 2021 07:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=46vCz7CfUCFIn/m2H9yto8aNGcrPawa6iiLpciLXN0U=;
        b=F+kAzAZK+20INUa6bnKXPtHbzAwVRfJkhLtEKD+8OEFv2IF3rKt80DjJCIhiv5XJHr
         AAOcOKV/Y3VtpPX4HpcUqCq527Yw6Sal6swNImvhAbW8N6u4ct7fJy3QgvekqMNG8IUi
         YlQ+aSXT9laMvb2NJVR0XKMRxN3j3yV2pBorypdoG3Qf6zyh4YrJkO9NEeNtaErS8LND
         TzwXch/VqPx/NWrkPv6ul/do4vnswtXHQ8sz2CwWo76eFKdXvVk0Y90/0twdXQ3S3WN9
         w/PCk0P0mam4oTHvKRNu//Jnw1Q7W1/nE2WCwC2s9fd49xTzNqhVNfrEQKsnptLFsPEZ
         181A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=46vCz7CfUCFIn/m2H9yto8aNGcrPawa6iiLpciLXN0U=;
        b=pL7SOI0zek3h+JcvohX6I+ndX5mXfDN7A9fWtT5Qz72MytB0Xiq4TRG0YErlxlBRcd
         JBbFOsGaHLaAUzFqgu+2lKsUPiO1eayAEz9y3I0uCKgLMD9kh3Y0zu2R0B8BIN9Y10Rc
         6E5rQEvoLUXJlwuNatVG9wzW+Y7xN+aIr6oRb+4NStuzw2tSYEGoyDPzbJhGOk9P0olE
         ZzBXXVz38koN5Jrwe0w0z6/0aY2JaCgFPyOCR6sxMELmbWMPpRZ00ZDeRwPXEGPmq/hj
         PORfHjfLLWwt8xZYe5r3n8nzRiqvRuP44OzVA5x1ly8zH5YMgMTO76V4LCa5S1mbBM2S
         gO9A==
X-Gm-Message-State: AOAM531lIawLc+CHjGYhHOhjs5ju+7jOmQ//hqhzDTMtuVCF92S++iwo
        TH0B1gggZ6Dy0qxx+H33AxE=
X-Google-Smtp-Source: ABdhPJyyBbCNzos6uuP4SdUHmi8HeqBoZRC2bJSE1lF+4mPFQIcsLQjD1Ix2a3qf8aE7t8MOczVuUQ==
X-Received: by 2002:a37:a48a:: with SMTP id n132mr16351782qke.359.1615129284132;
        Sun, 07 Mar 2021 07:01:24 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:9d72:75bc:e42b:f19e? ([2804:14d:72b1:8920:9d72:75bc:e42b:f19e])
        by smtp.gmail.com with ESMTPSA id d68sm221435qkf.93.2021.03.07.07.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Mar 2021 07:01:23 -0800 (PST)
Subject: Re: [PATCH] media:vidtv: remove duplicate include in vidtv_psi
To:     menglong8.dong@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhang Yunkai <zhang.yunkai@zte.com.cn>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210306113255.217387-1-zhang.yunkai@zte.com.cn>
From:   Daniel Almeida <dwlsalmeida@gmail.com>
Message-ID: <e86addd1-a7b5-0caa-7613-76cddd353c9c@gmail.com>
Date:   Sun, 7 Mar 2021 12:01:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210306113255.217387-1-zhang.yunkai@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 06/03/2021 08:32, menglong8.dong@gmail.com wrote:
> From: Zhang Yunkai <zhang.yunkai@zte.com.cn>
> 
> 'string.h' included in 'vidtv_psi.c' is duplicated.
> 
> Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
> ---
>   drivers/media/test-drivers/vidtv/vidtv_psi.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> index 47ed7907db8d..c11ac8dca73d 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> @@ -19,7 +19,6 @@
>   #include <linux/ratelimit.h>
>   #include <linux/slab.h>
>   #include <linux/string.h>
> -#include <linux/string.h>
>   #include <linux/time.h>
>   #include <linux/types.h>
>   
> 

Acked-by: Daniel Almeida <dwlsalmeida@gmail.com>
