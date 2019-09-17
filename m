Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA0B5B4593
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 04:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391977AbfIQCmm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 22:42:42 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:45089 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728470AbfIQCmm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 22:42:42 -0400
Received: by mail-io1-f65.google.com with SMTP id f12so3842696iog.12
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2019 19:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2Wl6obJ2QcdqwebrUsBa63QXWC5RCUfFV7IoOn2Y6ks=;
        b=AVIBQ75Fe0Muk7Kro+HRBd9acd/TcmFSpKrAm21T7nRalgmecRgqOV098heI5zDGM3
         dgnI3auvF0WjVYo0AF4/fojMIKm9+vJmCOFuPEkUojCxQnCXRtzPQ4f3GObDsqtAioMy
         /WBKTY7tLL7CY5KMwQpOsRaQdPBN+RXxAuvlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2Wl6obJ2QcdqwebrUsBa63QXWC5RCUfFV7IoOn2Y6ks=;
        b=Tv4/sqz30YOZzamP7ImNg7ZoyipffQDzS0IlbU66VktpjEYTxumTJj54neXwH0L6S4
         JtOvuNrl/sD3G6Z8PmCjmXk0ylmul5+U9W4vRE5NvSM2BkLqHfNssNEseUVvMZpvt4LN
         u+PLOmEOCCRlDZD5zjQMBia47YWJ9KPQ0UkOZkIV+qEF5R4CijDAV9ZCgajVmnL7BUpL
         q2X8AacFeqiWdYlzTdnpcH6k84JIbiAt0ESrzl/5i0Dk7QqGYWvZ3rJB0DoonAawzS8r
         CnP94jocIoqU9Ck6jb7wUQHp1W5+baaYHb0HlQR3bJJCxKSeHCryT2wEryDCglrWPTKA
         rqbA==
X-Gm-Message-State: APjAAAU90Q/zxxRXZF5YhchmJSQjAflhagtkMSWzXU+X+OOXU2WcN2Ua
        A2+n6hkuAW5lglQK53HOITIW8g==
X-Google-Smtp-Source: APXvYqyHJ+7FhSr+7dVYl/OVtVSZqbVBdlGqR0cFlnoQV8AMgCxphQ4oQyT8mUNq2wjv7GBivgJNyg==
X-Received: by 2002:a6b:9107:: with SMTP id t7mr900685iod.150.1568688161845;
        Mon, 16 Sep 2019 19:42:41 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id v13sm457996iot.50.2019.09.16.19.42.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Sep 2019 19:42:41 -0700 (PDT)
Subject: Re: [PATCH v4 3/5] vimc: move duplicated IS_SRC and IS_SINK to common
 header
To:     Helen Koike <helen.koike@collabora.com>, mchehab@kernel.org,
        andrealmeid@collabora.com, dafna.hirschfeld@collabora.com,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1567822792.git.skhan@linuxfoundation.org>
 <8dbc93c2a7291d942d2d37491833444d77316211.1567822793.git.skhan@linuxfoundation.org>
 <cac58f55-6d0f-d69f-6bba-474eedb0f80e@collabora.com>
 <124fe9af-5540-770e-d124-99e2b3b4e39a@linuxfoundation.org>
 <431c6d0a-724b-1b78-685c-95bfa8f5c39e@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <e74cdc8d-f138-0343-cc37-510404b497b9@linuxfoundation.org>
Date:   Mon, 16 Sep 2019 20:42:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <431c6d0a-724b-1b78-685c-95bfa8f5c39e@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/16/19 4:42 AM, Helen Koike wrote:
> 
> 
> On 9/15/19 8:52 PM, Shuah Khan wrote:
>> On 9/15/19 1:25 PM, Helen Koike wrote:
>>> Hi Shuah,
>>>
>>> On 9/6/19 11:42 PM, Shuah Khan wrote:
>>>> Move duplicated IS_SRC and IS_SINK dfines to common header. Rename
>>>> them to VIMC_IS_SRC and VIM_IS_SINK.
>>>>
>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>> ---
>>>>    drivers/media/platform/vimc/vimc-common.h  |  4 ++++
>>>>    drivers/media/platform/vimc/vimc-debayer.c | 11 ++++-------
>>>>    drivers/media/platform/vimc/vimc-scaler.c  |  8 +++-----
>>>>    3 files changed, 11 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
>>>> index 87ee84f78322..236412ad7548 100644
>>>> --- a/drivers/media/platform/vimc/vimc-common.h
>>>> +++ b/drivers/media/platform/vimc/vimc-common.h
>>>> @@ -27,6 +27,10 @@
>>>>      #define VIMC_FRAME_INDEX(lin, col, width, bpp) ((lin * width + col) * bpp)
>>>>    +/* Source and sink pad checks */
>>>> +#define VIMC_IS_SRC(pad)    (pad)
>>>> +#define VIMC_IS_SINK(pad)    (!(pad))
>>>
>>> This is true now, but it might not be true in the future.
>>> In the output video device (that was sent by André but not yet upstream) for instance, only have a single
>>> source pad (which I suppose the index will be 0), and this macro won't be true.
>>>
>>
>>> Maybe we could check pad flags in sd->entity->pads[index].flags ?
>>>
>>
>> I think this change should be done in André's patch?
> 
> Could be yes, making it generic since the start would be nice,
> but I don't mind updating this latter when needed.

Let's go with that then. This way we can get this series in and then
we can clean this up in André's patch.

> 
> Then:
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>
> 
>>

thanks,
-- Shuah

