Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081E04106EB
	for <lists+linux-media@lfdr.de>; Sat, 18 Sep 2021 15:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237067AbhIRNxU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Sep 2021 09:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237013AbhIRNxT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Sep 2021 09:53:19 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EA7C061757
        for <linux-media@vger.kernel.org>; Sat, 18 Sep 2021 06:51:56 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id h3so12556181pgb.7
        for <linux-media@vger.kernel.org>; Sat, 18 Sep 2021 06:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=miV8uugxK2l0+TxTl0bYFsYjBqHnegb6tYLIO2c+/pQ=;
        b=VKw24EWmI8tJCg4PHVON7yyfJEQYhqptyNWjyqSgsFi2IVS6iZif5B1uZsuSDvQJQx
         +SLIrVCrSDmIzh61Ekf1bB13WKURTAlrae0zpyW9LPkrZhrxOTmbsf6XQShfyz4Em/fS
         wf5x9/lw0kRW0qR2yJUr6fJ35kuYwP3X2e7dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=miV8uugxK2l0+TxTl0bYFsYjBqHnegb6tYLIO2c+/pQ=;
        b=fxnB5JiKHkkqsA4mTGFSDJqOm+bHlk97FPmyugcybaXnk0tVaUilMVIqFdovPST9jG
         TDy9wbkS1Ne/1OWbAAVEOLvcMP3XuXgXKlawCmHmAkR+2pil1cTbMn1fxO8Jjlz37EZI
         lNx7n9Hli+yekX3ssNf7CpXCxDmSLaVP1Y/+P9bx19EHcgAeHuCj0TBiSqq9nRBHgu/A
         SVaZNTA0VQGU4p26e+Cl0S/kMQYGr1A2cQ9rtSCeu3qm/nTroOfjcufAANuxIITvOGX4
         Bcm5gKG0TvvaKqnJP2Qvn2BBzVOaTp2B0CSZCQwxWuHD3vm2dsPPxcpLEugwO3QckUrY
         sbUg==
X-Gm-Message-State: AOAM530mHCTKg++oMVbCSc1V2FUi46dxjXHMfc1DEqGAsCJXmKjFEhb8
        fSfJy6DP1d55SpcprEPJstQoBA==
X-Google-Smtp-Source: ABdhPJyS2QSKmMpzTd7MmHyqFtqie45S/kXPdQTs6m3qND4U8eV1/DVEXDB+DPoyXL97BCM+ZzgQOA==
X-Received: by 2002:a63:2011:: with SMTP id g17mr14710533pgg.379.1631973115834;
        Sat, 18 Sep 2021 06:51:55 -0700 (PDT)
Received: from [127.0.0.1] (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id k29sm9351614pfp.200.2021.09.18.06.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 06:51:54 -0700 (PDT)
Date:   Sat, 18 Sep 2021 06:51:51 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Len Baker <len.baker@gmx.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
CC:     Colin Ian King <colin.king@canonical.com>,
        linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] net: mana: Prefer struct_size over open coded arithmetic
User-Agent: K-9 Mail for Android
In-Reply-To: <20210918132010.GA15999@titan>
References: <20210911102818.3804-1-len.baker@gmx.com> <20210918132010.GA15999@titan>
Message-ID: <D81D1EE2-92A0-42D5-9238-9B05E4BDE230@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On September 18, 2021 6:20:10 AM PDT, Len Baker <len=2Ebaker@gmx=2Ecom> wr=
ote:
>Hi,
>
>On Sat, Sep 11, 2021 at 12:28:18PM +0200, Len Baker wrote:
>> As noted in the "Deprecated Interfaces, Language Features, Attributes,
>> and Conventions" documentation [1], size calculations (especially
>> multiplication) should not be performed in memory allocator (or similar=
)
>> function arguments due to the risk of them overflowing=2E This could le=
ad
>> to values wrapping around and a smaller allocation being made than the
>> caller was expecting=2E Using those allocations could lead to linear
>> overflows of heap memory and other misbehaviors=2E
>>
>> So, use the struct_size() helper to do the arithmetic instead of the
>> argument "size + count * size" in the kzalloc() function=2E
>>
>> [1] https://www=2Ekernel=2Eorg/doc/html/v5=2E14/process/deprecated=2Eht=
ml#open-coded-arithmetic-in-allocator-arguments
>>
>> Signed-off-by: Len Baker <len=2Ebaker@gmx=2Ecom>
>> ---
>>  drivers/net/ethernet/microsoft/mana/hw_channel=2Ec | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/microsoft/mana/hw_channel=2Ec b/drive=
rs/net/ethernet/microsoft/mana/hw_channel=2Ec
>> index 1a923fd99990=2E=2E0efdc6c3c32a 100644
>> --- a/drivers/net/ethernet/microsoft/mana/hw_channel=2Ec
>> +++ b/drivers/net/ethernet/microsoft/mana/hw_channel=2Ec
>> @@ -398,9 +398,7 @@ static int mana_hwc_alloc_dma_buf(struct hw_channel=
_context *hwc, u16 q_depth,
>>  	int err;
>>  	u16 i;
>>
>> -	dma_buf =3D kzalloc(sizeof(*dma_buf) +
>> -			  q_depth * sizeof(struct hwc_work_request),
>> -			  GFP_KERNEL);
>> +	dma_buf =3D kzalloc(struct_size(dma_buf, reqs, q_depth), GFP_KERNEL);
>>  	if (!dma_buf)
>>  		return -ENOMEM;
>>
>> --
>> 2=2E25=2E1
>>
>
>I have received a email from the linux-media subsystem telling that this
>patch is not applicable=2E The email is the following:
>
>Hello,
>
>The following patch (submitted by you) has been updated in Patchwork:
>
> * linux-media: net: mana: Prefer struct_size over open coded arithmetic
>     - http://patchwork=2Elinuxtv=2Eorg/project/linux-media/patch/2021091=
1102818=2E3804-1-len=2Ebaker@gmx=2Ecom/
>     - for: Linux Media kernel patches
>    was: New
>    now: Not Applicable
>
>This email is a notification only - you do not need to respond=2E
>
>The question is: Why it is not applicable?=2E I have no received any bad =
comment
>and a "Reviewed-by:" tag from Haiyang Zhang=2E So, what is the reason for=
 the
>"Not Applicable" state?=2E

That is the "Media" subsystem patch tracker=2E The patch appears to be for=
 networking, so the Media tracker has marked it as "not applicable [to the =
media subsystem]"=2E

The CC list for this patch seems rather wide (media, dri)=2E I would have =
expected only netdev=2E Were you using scripts/get_maintainer=2Epl for gett=
ing addresses?

-Kees
