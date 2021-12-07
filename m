Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00E446C6D6
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 22:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241948AbhLGVpS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 16:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbhLGVpS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 16:45:18 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B367C061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 13:41:47 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m25-20020a7bcb99000000b0033aa12cdd33so2378612wmi.1
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 13:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=m7SBcgT6qnJ07efzq1500j94z4PnFQPJxjGBISzWxmM=;
        b=fRBZSZSn+84pe6kYSZUD8L5BCrdSAR8KB6QSYsTCluNujE+bVO1XlAodB4QBmeoaI/
         o18u0gK2Q8rYQkASVq0CQFEZa29F0Kd2N//GhKBGuyBhIi50SDzVGQx9FPKeAm0d2PUj
         qTRXglRPWyQ/9wHw6LV9Y4DtVmkrz5YDOolP+c0J+MoLE4LGpKgktf2fWvHvKa69bR6z
         shwtZWpckxpgH9hpzwOud+xkNjmeh3Sfr1SYuYV4JOgO4igX9XNUjmB/Rohj+3w9cQOu
         0zl8kzGhc/+5NGBj3ZDVAukjBWjhZcpIVYOSAkwwz2SHABXSYnTHA88/KfKf1sUWPDp1
         Gy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=m7SBcgT6qnJ07efzq1500j94z4PnFQPJxjGBISzWxmM=;
        b=d8vVfBSmOx0CFe82uyRe9s4tFjceRrPCJ01x0V03W9dHqXKsT+hPRxyDDvt6U2D2F2
         buDP3tdEBBR33e2dpWYNkxN2U9WEhIna1gsRXhpjUrY2ItcGLLuPTo1cKQ/yyW60ydHo
         pYt/cYxqUa2s838SV4p43LA89qpItbKJGVFja92BXWIlUZ4NiacHNWCkqmvUc0zljwmA
         mlenTOZUEUNEUc6U0rJypY3fJFCrmJltKwUWE6OywPhZ0Wz/nQ12UtkAueVUs2V1PjVV
         yMy9RqZXqjTNZQaUnmXB66t3lyME0KmjaTxOB9aT/6OW+HXtDhOBkaJwjRcyYffO7U6p
         GRBw==
X-Gm-Message-State: AOAM533B1HrhjAq70RY2qqVbko306KCOZfawCR4LF0304OQ8YTjt+LQd
        RigWglYQPRBP0qWJHS1xGnk=
X-Google-Smtp-Source: ABdhPJzmo6aMdvEYkyej66wYCSDkqSz+cD8aa1aLzWSCBXsJqfK8K+IENXaMMdMpMdA1+GXc/8256A==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr10460153wmj.169.1638913305651;
        Tue, 07 Dec 2021 13:41:45 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l15sm723598wme.47.2021.12.07.13.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 13:41:44 -0800 (PST)
Subject: Re: Kernel oops bisected to media: videobuf2: move cache_hints
 handling to allocators
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     mchehab+huawei@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <d0dcd227-0753-5e9d-f757-4819cc271d4f@gmail.com>
 <YZhq0o7p0dVWeueC@google.com>
 <d4be3ea9-5d41-0a19-c03c-4037d01d1b6a@xs4all.nl>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <17f34600-2717-d125-62ba-fd933b3b59f1@gmail.com>
Date:   Tue, 7 Dec 2021 21:41:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d4be3ea9-5d41-0a19-c03c-4037d01d1b6a@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 02/12/2021 11:15, Hans Verkuil wrote:
> Daniel: ping!
>
> On 20/11/2021 04:26, Sergey Senozhatsky wrote:
>> Hello,
>>
>> On (21/11/19 22:41), Daniel Scally wrote:
>>> Hi all
>>>
>>> I've been experiencing an oops trying to run libcamera's qcam util
>>> (which starts streaming on a camera sensor - the ov8865), which I
>>> bisected down to the patch cde513fd9b35: "media: videobuf2: move
>>> cache_hints handling to allocators"
>> Can you please check if you have these two patches in your tree:
>>
>> https://lore.kernel.org/lkml/20210928034634.333785-1-senozhatsky@chromium.org/raw
>> https://lore.kernel.org/all/20211101145355.533704-1-hdegoede@redhat.com/raw
>>
>> If not then please apply, this should fix the problems you're seeing.
>>
> I really like to know if the cause is indeed that you are missing two patches.


Apologies for the delayed response - I was indeed missing those patches
and, having added them, everything's working fine.

>
> Regards,
>
> 	Hans
