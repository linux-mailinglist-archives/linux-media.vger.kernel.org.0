Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3ED466234
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 12:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346342AbhLBLYZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 06:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346312AbhLBLYY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 06:24:24 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23D6C06174A
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 03:21:01 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id s13so58940515wrb.3
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 03:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CRKy2kOor8DQEobWSSUF12yvepWWekGAAYF08gWNgC0=;
        b=dDTTFI6a5q/CyOktOk8rLQ7O5bfULYTJsiBo07kxvMBphpWU7esVLdi31Yfb5urC2T
         Ykom2AdFTXSj545qRFRI9CJH63vofGJs58tXFPGIlybv+JjZdxYucPi98N0V2fFz8Bqc
         z4Ap0bmt55X2FDbY1x6HzO/885YZcrz8XSMTj3gXojX4p461t/YknKeKuU+SZIs0vSr8
         a01xeRN4frlhHrASrCdAu4rvwHCRbFdTNK/L6L3sxCYp6AqDEGi9qIdXWZmQsmC7UVao
         I/a6CnyinxdVCMX91iHTvlbatZ6sr3aEXPYpuqwh9scYL5n4bUY/ECS0EUn85qohDanV
         vG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CRKy2kOor8DQEobWSSUF12yvepWWekGAAYF08gWNgC0=;
        b=TTJyPzS1PVtUlzXIl0ZH5vEFNJoor4YaxhUUJlsyvRZeuikfe6ZmTw6CSlMECWipmV
         1/pUBxbV42B6xDS41Zed6ZQhhSymqk9ntIfjU+OCSgdllk6zsP/mWJx5ZthjlGJqzi7K
         B0/mTvKXZrjAPiotcUAaYWxFSFTP18ULnFU8tPQjxxQgWVhy0M8tdo3w+2GJANhjQ35i
         A1+uaCE8QTa6iXF5p9ZE6Rl5BKkSaWzto9YAMcqTucLoNBPzKHh4ynqwa3FYZa5pyC2D
         k4a6aSRCTK8lV1xKDr/+EK+DY1KktMC7F1yyij3gBWIOGBSYF8mbXpYZ+kBOkZclw/tw
         9ffQ==
X-Gm-Message-State: AOAM533Deap22vT6hQfHGueQVcYgCpbHNFCQ3TtTD1QwqQyqUGZmc2ZI
        XUzge9eKgIs200qk4jY/ROQ=
X-Google-Smtp-Source: ABdhPJwUKFpiDxyKAwy53R4kbHDF0h+0zXQyMP6ocijhrNKcGyEwAGf0HQggQFncIMb03n0bEGg5Eg==
X-Received: by 2002:adf:fb4f:: with SMTP id c15mr14014551wrs.507.1638444060521;
        Thu, 02 Dec 2021 03:21:00 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id a10sm1953912wmq.27.2021.12.02.03.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 03:21:00 -0800 (PST)
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
Message-ID: <8dc4414d-af47-d92f-e255-ccc07fc96b42@gmail.com>
Date:   Thu, 2 Dec 2021 11:20:59 +0000
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

Hello

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


I'm sorry, I missed this. I'll check it asap and let you know.

>
> Regards,
>
> 	Hans
