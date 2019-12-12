Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA6D911CCB8
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 13:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729069AbfLLMCO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 07:02:14 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:57371 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729043AbfLLMCO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 07:02:14 -0500
Received: from [IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65]
 ([IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fNAYiZIm6GyJwfNAZiy0h9; Thu, 12 Dec 2019 13:02:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576152132; bh=grA3mrY/IXTuR/bHnsfsFfTSA8BCPNcViLc0fRgFSEg=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nzEPxu/XiAq6xqJTEPtu2DMyFeL+3oKzznjfS8x4FT/5JQvyJe0A1cdg52/aYtQje
         Q28MS1eZ97eJ2uG0m5TG7zFtGiD5VwDcEzvhRbV19ST4l0c8kRotbI94BHivZy8UBY
         Y7yWuKKaX0PsLD4qBdn5bfYJNC4WJXSXFOsSios8DGvU7P8nfX/fgwQMyEPT0fSg1P
         PvsgHSBA/JZe4yikXFhnQ+cJPgCsD6PcsqpH3kJ74VOTxg7d1gcbH4qUudjqoKmSaV
         4jCvItG9+5UaRbH0H38fvOK6XOqSvcheujlc2B51AZBo6LD0NVxVagx2ujgm0i+6ls
         CONsICQSvGD0Q==
Subject: Re: [PATCH v11 00/11] Rockchip ISP Driver
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com, tfiga@chromium.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, kernel@collabora.com,
        linux-media@vger.kernel.org, jacob-chen@iotwrt.com,
        zhengsq@rock-chips.com
References: <20191114051242.14651-1-helen.koike@collabora.com>
 <996a9b6a-0e45-d627-9263-539c22e5f1c0@xs4all.nl>
 <7fd4bf99fd6316da8acaf0a27b6845bedbf4b25f.camel@collabora.com>
 <eafffc6f-061e-65ab-079b-b2bd613d61cb@xs4all.nl>
Message-ID: <20f99f0e-dfec-f6c0-eeb3-7561018f32e9@xs4all.nl>
Date:   Thu, 12 Dec 2019 13:02:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <eafffc6f-061e-65ab-079b-b2bd613d61cb@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMDfu7petJydGdzuJyylr5ZiNog40vMypqvfQw7ZVz48j+cgXHx/cTeFqN1/hiF8DSXEOpCJ20WY7E5a94cB1D2PZi7ML8XhkxMVMy0iR4SJQ4vKxJKi
 ftB/XN39JhQEUYBc8BqlxhyoQuxxXMDZIwBgwdBCeW1iR27+uOELF8KpcwgxwC3YpRMZCXHyBUlXOlsmilsvxlZ+tUPadvpHrZMXa0fbpTJN1NQ3Gfhb4C8g
 Ey9971QU/1aNWS6qs55K9REyFymqQcD+MCjep1VvsImgMFileSAM1UvR1WvQ0UQSwCKiuv/5JpKWQyObfLI9YHJqOnlCMVkwado7cwy3VaqW7/tZ/kWL+bN4
 vD42oWtQwV4mxkcNc1FkEdzle+uDb0YzHHrsz0otltr7IWNTGAI1Hst8Gozocr63Czju4gGbtp7oIDByGPBe83x2ZgI09gn/gc28vBtdfs/oaoBnHS6cnaEC
 E7+SsuD1fZi95WxWXfUtazbaT6MH5cDsJU9m3cEylYYAQqSlrUF5zYkDcsdo4TCXAM84dpoB344aucpHrv7M9QvnpsLqzVUZISK7wYM1Lo9Hb8MDDXlmwL4r
 xIi7vcXizDuJhzNTp5BfrFPDWCXJs8SR1jKhutFfQ2+XMd1OCUg9k17FyR+3gLw1z+uCGGqbDD9pyEWcqul0IBR0PWOrbFOLrI01v1XO+DyZ9ZoXMrCZM3/D
 kT+0Y0OCCd5k4pu6X7fCGA81kV5oK8daXF0zIbPFhTfhBc/37ACc7L2orLrRPLcVsdB+ZOHB9LiaHg0OCH78xdxF8K2JtKLfQaIQqCP5SQxxPi8Nh8TIZCrm
 2GA9v6FZ5YAaldkVTokUB1wwSMdC+8vMdIYnb18vTMQmRcwMomQoHjPl+lZXwGI7bj0CGM1R/OUDogkUdk3xRQJIAaTy+HUtshdELy+I7KHCWAxUjSv5gf3f
 tanncCiL1byhYkycQwgkjxEWtnc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen, Ezequiel,

The merge window is open, so you want to get this in, then please post a v12
with the few remaining items addressed so that I can merge it.

Regards,

	Hans

On 11/19/19 9:30 AM, Hans Verkuil wrote:
> On 11/18/19 7:52 PM, Ezequiel Garcia wrote:
>> Hi Hans,
>>
>> Thanks for taking care of this.
>>
>> On Thu, 2019-11-14 at 09:42 +0100, Hans Verkuil wrote:
>>> On 11/14/19 6:12 AM, Helen Koike wrote:
>>>> Hello,
>>>>
>>>> This series adds the Rockchip Image Signal Processing Unit v1 driver to
>>>> staging.
>>>>
>>>> The main reason to be in staging is that people are already using it from the
>>>> mailing list (including libcamera), and having it in mainline makes the workflow
>>>> easier. Also, it is easier for other people to contribute back (with code
>>>> or testing the driver).
>>>>
>>>> We plan to actively work on this driver to get it our of staging.
>>>>
>>>> This patchset is also available at:
>>>> https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v11
>>>>
>>>> Libcamera patched to work with this version:
>>>> https://gitlab.collabora.com/koike/libcamera
>>>> (also sent to the mailing list)
>>>>
>>>> The major difference in v11 are:
>>>> - Fixed compiling warnings found with W=1
>>>> - Fixed checkpatch errors
>>>> - Add clock-names values in dt-bindings
>>>
>>> Looking at checkpatch I see a few remaining issues that I believe should be
>>> fixed before merging this:
>>>
>>> CHECK: spinlock_t definition without comment
>>> #575: FILE: drivers/staging/media/rkisp1/isp_stats.h:43:
>>> +       spinlock_t irq_lock;
>>>
>>> CHECK: struct mutex definition without comment
>>> #581: FILE: drivers/staging/media/rkisp1/isp_stats.h:49:
>>> +       struct mutex wq_lock;
>>>
>>> CHECK: spinlock_t definition without comment
>>> #1648: FILE: drivers/staging/media/rkisp1/isp_params.h:25:
>>> +       spinlock_t config_lock;
>>>
>>> CHECK: spinlock_t definition without comment
>>> #2058: FILE: drivers/staging/media/rkisp1/capture.h:145:
>>> +       spinlock_t vbq_lock;
>>>
>>
>> I'd rather merge this as-is, adding a TODO entry stating
>> we need to revisit locking specifically, because I'd like
>> to take a close look at these spinlocks/mutex,
>> instead of just addding comments for then.
> 
> Fair enough! Just as long as it is mentioned somewhere.
> 
>>
>>> Once this is done together with the Jacob Chen email clarification
>>> it is ready to be merged for v5.6.
>>>
>>
>> I'll find out more about this.
> 
> Thanks!
> 
> Remember that we are in the code freeze until v5.5-rc1 is released,
> so you have time to make more adjustments if you want to.
> 
> Regards,
> 
> 	Hans
> 
>>
>>> It passes all the sparse/smatch tests, so that's very good.
>>>
>>
>> Great!
>>
>> Thanks,
>> Ezequiel
>>
> 

