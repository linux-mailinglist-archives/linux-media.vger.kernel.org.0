Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F57F326C77
	for <lists+linux-media@lfdr.de>; Sat, 27 Feb 2021 10:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbhB0JPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Feb 2021 04:15:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbhB0JPj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Feb 2021 04:15:39 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E766EC06174A;
        Sat, 27 Feb 2021 01:14:58 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id y12so485127ljj.12;
        Sat, 27 Feb 2021 01:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rFn3WZXquuWhJU4qu+ClIPvji0Vi9A60lu/mbJJHGK0=;
        b=PpqZWET30mB6ohRaAsLn8uBfFQFKXMjj/+gAF8bJmLlOt5L6QEf8EE3zJIRqpo1rHW
         4pvjVFar0d7IZY6Aox8gdLYsuBG5twI6RQnEecBLmzcMcN3OzvopA5kGdBIF9DPST+C+
         o+m821BNmiOyUZswIkQsiX5vLctqgqRe1+Up0T46jjW/2J+MgQXo7U4H+uaKsgjWo8Nj
         xsDwD+1jkTRqXAiRomSufeqBE9uHHDYEGmtiZ2aJ362Iu2ReXcSxM3q5MlAYuZuqs43l
         6rPVKQw2KgohXOGfZJdNHpFHTw2cDNtr70DuOcFE9rgXdthjJgNBdRJev5W33/uhcYEg
         r5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rFn3WZXquuWhJU4qu+ClIPvji0Vi9A60lu/mbJJHGK0=;
        b=HG//b4U4g9tWdObP/Y+gWOFHKKnrxfcItCBNavqUTqBn41w/jzx2yzcRO6tglrtmjm
         rKgYmZCF1E6qOU3P2GhThC1Oh8hruDrlsNRcp3VBW4quV+Yyp2/wrK0JHGkurHUMYswU
         xrQDiblFOhEebJKfdmQMspTVQWIAYdlHvzPh9OwPngKDPPmu5r2SdW6fRfTKY1OtO5pn
         Rh0+CUINdkjz7IqftbdnlDWun8MS1JSeGiBkwqCLOd8sWYgSUA99GgUDoxNjCTXtPGbI
         9CIUY8lzshUUDdlGzNsCWLubLxZz3c+V5eM4I/4QYQ1MjAgu7j04Ie9tcB6LwJ+arJOG
         E0Pw==
X-Gm-Message-State: AOAM531+J74/limwoDVbC6d2hlOlvg+g+aFq0eSvzGT/C+RKQT5xnyuA
        7jnnuJ5ZXLeuQ1j75fUaKIv3rCDIWWo=
X-Google-Smtp-Source: ABdhPJzxHxyqZoK5YJNYJWF2+bNis5ySHfsDPBXcyUgRz7RW03QWtHc5QRPqs4W9O3qdpTDQRBoN0A==
X-Received: by 2002:a2e:9143:: with SMTP id q3mr1090486ljg.283.1614417297367;
        Sat, 27 Feb 2021 01:14:57 -0800 (PST)
Received: from [192.168.1.100] ([178.176.75.167])
        by smtp.gmail.com with ESMTPSA id h27sm1674574lfp.120.2021.02.27.01.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Feb 2021 01:14:56 -0800 (PST)
Subject: Re: [PATCH 1/2] list: Add list_is_null() to check if a list_head has
 been initialized
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20210226224938.18166-1-laurent.pinchart@ideasonboard.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <5272a97f-b221-82f0-f1ee-10eccd05fc09@gmail.com>
Date:   Sat, 27 Feb 2021 12:14:55 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226224938.18166-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

On 27.02.2021 1:49, Laurent Pinchart wrote:

> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> The new function checks if the list_head prev and next pointers are
> NULL, in order to see if a list_head that has been zeroed when allocated
> has been initialized with INIT_LIST_HEAD() or added to a list.

    So zeroed or initialized/added? :-)

> This can be used in cleanup functions that want to support being safely
> called when an object has not been initialized, to return immediately.
> In most cases other fields of the object can be checked for this
> purpose, but in some cases a list_head field is the only option.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   include/linux/list.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/include/linux/list.h b/include/linux/list.h
> index 85c92555e31f..e4fc6954de3b 100644
> --- a/include/linux/list.h
> +++ b/include/linux/list.h
> @@ -29,6 +29,19 @@ static inline void INIT_LIST_HEAD(struct list_head *list)
>   	list->prev = list;
>   }
>   
> +/**
> + * list_is_null - check if a list_head has been initialized
> + * @list: the list
> + *
> + * Check if the list_head prev and next pointers are NULL. This is useful to
> + * see if a list_head that has been zeroed when allocated has been initialized
> + * with INIT_LIST_HEAD() or added to a list.

    So zeroed or initialized/added? :-)

> + */
> +static inline bool list_is_null(struct list_head *list)
> +{
> +	return list->prev == NULL && list->next == NULL;

    Maybe instead:

	return !list->prev && !list->next;

[...]

MBR, Sergei
