Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2892E45EADE
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 10:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376623AbhKZKBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 05:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376668AbhKZJ7S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 04:59:18 -0500
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D31AC0613BE;
        Fri, 26 Nov 2021 01:51:14 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qXskmvVhfCMnAqXsnm454V; Fri, 26 Nov 2021 10:51:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637920272; bh=wwzI3VoyEYmtBsgGNBifRdMLW2LyrKs+jO1kug593yM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dgg6f34bbn691bofe96KM0Pg4dPnTiyMy9mS+z5eERFVjygMOr3Ii1g9a6cioVisI
         8Mg7/1FQoWoQSmuDS6WvrsPcRXA+K/btrTcmswOTQMkY+BYkEAo/T+VvTWPQTeIDbg
         RjPrRdeIz6unTxnUuVRDpaqUULZsMJswU53z9d/02amA7aLpz3PcSSG53tmYWas7hk
         kJEWsevU9sPMpgzytxg0/zmRsweJ73maQHsBH7j3Zquwj4vRtrbO2OZ7Yv8RLCD+QC
         MF5EaEzfCD6fQFU09xwJodegDARr2V0kwjWKzOOOKM2WsuUai1kwqHG9sXydcL4x4y
         cEm2D2VJ/FcoQ==
Subject: Re: [PATCH v5 00/10] add aspeed-jpeg support for aspeed-video
To:     Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com,
        mchehab@kernel.org, joel@jms.id.au, andrew@aj.id.au,
        sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
 <5ab806d1-e407-1fa4-83ec-93ebe8df7db4@xs4all.nl>
 <b6ba49f3-a9ed-f5e6-959c-309db8cce7f6@aspeedtech.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6e0da74e-ddce-3c94-42a1-f98833489d60@xs4all.nl>
Date:   Fri, 26 Nov 2021 10:51:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b6ba49f3-a9ed-f5e6-959c-309db8cce7f6@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfB0UtWbHxvwAoex8UP08tXClqJfplYH9f0YmKmIDGbgQ8hYJJ32UphAtCJIOorIMwEyq5qqwAxNa0izrTaL3Nx6kGIE19Ztp78bpjBjnOrczpnZ0w23W
 VliKrgY1zmR35rJUqweLeURxvzzGZFzKqWEZiuCf1VlVvqpKBzPQCmmCr24lHPIvWHyiqGzTEFoMwSts/ol/YMOb8JyxB5dSFFRdG+i/w5Ph0qQgHkYssaNA
 IFNxGKFNgOyCNfzDyP4X1RwbIMaosacxCqnY2RShMsb1GzzQLcQgnX5wSesk7/9Qksp2suqtWH4t0fjYyYkTWxOaylEzvGTC4N4NKMv/4JzbsWCRP3qHrdh0
 fo+aAVNyh5BqaoqWwhT3bDBsfjuc+zwnlV4NFvooFuqFhBoonu+9X/Dt3K4/NertOYr750DiHnAiUuwBMeGTlBv3U+qthz0ELf29+a58PemOkyJ/QY6t7Rix
 65zZV8Rg7dakVvWVyQHWouIjfMlxlNWTBM5Pf4GwXmAU3PNHFckjgvtryEvMDrH8SnICSXb0pCD9gimTp/+dMDp469BfGzY5xbzEmMU1ze2iHnqvGYTq7/qp
 toPLbBX2iAqOQ90uyiVLYt4Pg1J8DuAOR+okXK3BxH91HkY7PPUgbvV+xxaIasjBvLkn5g/b9miY+eBG1QXxx8wk
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/11/2021 09:17, Jammy Huang wrote:
> Hi Hans,
> 
> Please refer to Page 132, 'Video stream data format – ASPEED mode compression' of
> https://github.com/AspeedTech-BMC/openbmc/releases/download/v07.02/SDK_User_Guide_v07.02.pdf
> 
> Is above information enough??

Hmm, close. It would need some additional information, possibly documented in the source
code:

- What is the Frame Header? (the doc just says that it is different, but not what it actually is)
- What is the EOI code? Is it equal to 'FEND'? (not quite clear to me)

I think the documentation looks sufficient once those two items are addressed.

> Or maybe we can postpone this series until the source code for this format ready.
> I think I can accomplish it by the end of this year.

That's quite soon, so perhaps that would be the best approach. That way you also
know exactly what information is missing from the SDK User Guide, and if that is
documented, then this format can be used in the kernel.

But several of the patches in the series are independent of the new jpeg format,
so it might be useful to get those in first.

Regards,

	Hans

> 
> On 2021/11/25 下午 10:31, Hans Verkuil wrote:
>> Hi Jammy,
>>
>> I suggest posting a v3 that moves the patches that deal with the
>> Aspeed JPEG format to the end of the series. That way I can easily
>> merge the patches up to that point, and the Aspeed JPEG support can
>> be handled separately.
>>
>> I'm not sure if it can be merged without that format being documented,
>> either in pixfmt-reserved.rst, by implementing support for it in
>> libv4lconvert from v4l-utils, or by providing a URL to some other
>> publicly available source code. We really don't like adding pixel
>> formats that cannot be interpreted by someone without access to the
>> datasheets.
>>
>> Regards,
>>
>> 	Hans
>>
>> On 18/11/2021 08:40, Jammy Huang wrote:
>>> The aim of this series is to add aspeed-jpeg support for aspeed-video
>>> driver.
>>>
>>> To achieve this major goal some refactors are included.
>>>
>>> In the last, debugfs information is also updated per this change.
>>>
>>> Changes in v5:
>>>   - Use model data to tell different soc
>>>
>>> Changes in v4:
>>>   - Add definition for the Aspeed JPEG format
>>>   - Reserve controls for ASPEED
>>>   - Use s_fmt to update format rather than new control
>>>   - Update aspeed hq quality range, 1 ~ 12
>>>
>>>
>>> Jammy Huang (10):
>>>    media: aspeed: move err-handling together to the bottom
>>>    media: aspeed: use v4l2_info/v4l2_warn/v4l2_dbg for log
>>>    media: aspeed: add more debug log messages
>>>    media: aspeed: refactor to gather format/compress settings
>>>    media: v4l: Add definition for the Aspeed JPEG format
>>>    media: v4l2-ctrls: Reserve controls for ASPEED
>>>    media: aspeed: use model-data
>>>    media: aspeed: Support aspeed mode to reduce compressed data
>>>    media: aspeed: add comments and macro
>>>    media: aspeed: Extend debug message
>>>
>>>   .../media/uapi/v4l/pixfmt-reserved.rst        |  12 +
>>>   drivers/media/platform/aspeed-video.c         | 534 ++++++++++++++----
>>>   drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>>>   include/uapi/linux/aspeed-video.h             |  15 +
>>>   include/uapi/linux/v4l2-controls.h            |   5 +
>>>   include/uapi/linux/videodev2.h                |   1 +
>>>   6 files changed, 467 insertions(+), 101 deletions(-)
>>>   create mode 100644 include/uapi/linux/aspeed-video.h
>>>

