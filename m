Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA4A3C9C6E
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 12:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241203AbhGOKL7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 06:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbhGOKL7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 06:11:59 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545C7C06175F;
        Thu, 15 Jul 2021 03:09:05 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l6so3391069wmq.0;
        Thu, 15 Jul 2021 03:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ArNEv92wpJjOpuiUUnJ9dc8Ev4Ao9K4Yo2lmqmDUjAY=;
        b=j7OZ1YQjiJjTCMP21/AxjrTnskBbm7hsQ3yvCd0/LEj1Cc5onE5Eh368sab0XG3NUu
         CykLYPZ0s9VUtYXhpn2RZ4i6cywg9Uz+BCHNQwr9zQdLHnwY6q3g6JzfNLKbkw2eHUDn
         gfOsp58ueKxUDKe+XsCUAiBo1mJUFbkFFXsVgHx7oNGHv5hXcXNHkRSlRnKYoNQIr+//
         XqcvUfOWJIdcUkiMMsywfm+k0Ay2IuCTzJA610C9F9PvVikoZOfR61BcbNN5Sgyfn0Ds
         KVKitKu57nirupubueY52ouVsgB/HL6bNOfKquGJTU+D67MX/INcQfqfVtOBJTyHpzXc
         io+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ArNEv92wpJjOpuiUUnJ9dc8Ev4Ao9K4Yo2lmqmDUjAY=;
        b=SSvgKq2EzF9rztZnZUhOWrAA2E1cRWTVVypjqsrHiGia3sg4hgGw4zpIANR4CUtLEc
         FlOIzbJSMWSDHnOmWVtJ4nv/zkW2XZlnVCqCQsDTlD/k9+Kgzf4Tx+hIDJEOZbBrQ6CH
         PmccqYpyv1l3qc2KPzARFVjMNHyW+rebfjE/lIErJwX1o56cBRMTdqP8l/PWpjebfoFj
         PwldjC01YYoKShJNTlVi5IOb+b0luMmCcx9cKIhUtih3u81k6aaQk3swf++YALC/nMPH
         qOvngdQEQNW42AjPGmWwTN7I9TiEw+kPPi6LZ9sr5+O9RTvfu5hSuvZxSjAJcowE+hi1
         CZcQ==
X-Gm-Message-State: AOAM531KD9Dae7dd/XC5NmTwssVPAAP7RqSsCeO5Xc61MpFVxmeoBDLo
        DknYFNCFDaXE0VsKaiiMrRrfF3xJQQd9
X-Google-Smtp-Source: ABdhPJwT7o32oTBrDj4gfyVWGLagOuRNpwm0RwfDe+dcYpvv5/uMZcCjwzaQFh08dDMVzYdn0pCU8w==
X-Received: by 2002:a05:600c:2290:: with SMTP id 16mr3726091wmf.32.1626343743811;
        Thu, 15 Jul 2021 03:09:03 -0700 (PDT)
Received: from [192.168.200.247] (ip5b429fd6.dynamic.kabel-deutschland.de. [91.66.159.214])
        by smtp.gmail.com with ESMTPSA id j12sm6102550wrq.83.2021.07.15.03.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 03:09:03 -0700 (PDT)
Subject: Re: [PATCH v2 01/12] dt-bindings: mfd: syscon: add Rockchip
 RK3036/RK3228 qos compatibles
To:     =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-2-knaerzche@gmail.com> <20210601154651.GE2159518@dell>
 <3527273.z0yIoBN5P9@diego>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <78b492b8-55c4-dfbd-cda6-f78c4b8557b0@gmail.com>
Date:   Thu, 15 Jul 2021 12:09:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3527273.z0yIoBN5P9@diego>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lee, Heiko,

Am 11.07.21 um 13:55 schrieb Heiko Stübner:
> Hi Lee,
>
> Am Dienstag, 1. Juni 2021, 17:46:51 CEST schrieb Lee Jones:
>> On Thu, 27 May 2021, Alex Bee wrote:
>>
>>> Document Rockchip RK3036/RK3228 qos compatibles
>>>
>>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>>> ---
>>>
>>>   Changes in v2:
>>>   - collect Reviewed tag
>>>
>>>   Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>>>   1 file changed, 2 insertions(+)
>> Applied, thanks.
> not sure if I'm missing something, but this patch wasn't part of your 5.14?
> And I also don't see it in your for-mfd-next branch. Did it get lost somewhere?

I can't find this patch in neihter the mentioned trees nor in 5.14-rc1.

Lee, could you queue it for rc2, please?

Thanks,

Alex

> Thanks
> Heiko
>
>
