Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C487D50DA45
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 09:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239672AbiDYHlg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 03:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238286AbiDYHld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 03:41:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8C512AE3;
        Mon, 25 Apr 2022 00:38:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 787F3612F4;
        Mon, 25 Apr 2022 07:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE90C385A4;
        Mon, 25 Apr 2022 07:38:24 +0000 (UTC)
Message-ID: <44c597b0-17f8-97cb-7922-7beff59c0b16@xs4all.nl>
Date:   Mon, 25 Apr 2022 09:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 6/9] media: uapi: Add a control for DW100 driver
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>, mchehab@kernel.org,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
 <20220328141309.177611-7-xavier.roumegue@oss.nxp.com>
 <dba106ac-cee1-2493-13c7-ad9aef556a49@xs4all.nl>
 <YmZJhI291wruvjlt@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <YmZJhI291wruvjlt@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/04/2022 09:11, Laurent Pinchart wrote:
> On Mon, Apr 25, 2022 at 08:57:07AM +0200, Hans Verkuil wrote:
>> On 28/03/2022 16:13, Xavier Roumegue wrote:
>>> The DW100 driver gets the dewarping mapping as a binary blob from the
>>> userspace application through a custom control.
>>> The blob format is hardware specific so create a dedicated control for
>>> this purpose.
>>>
>>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>>> ---
>>>  Documentation/userspace-api/media/drivers/dw100.rst | 12 ++++++++++++
>>>  include/uapi/linux/dw100.h                          | 11 +++++++++++
>>>  2 files changed, 23 insertions(+)
>>>  create mode 100644 include/uapi/linux/dw100.h
>>>
>>> diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
>>> index 4cd55c75628e..f6d684cadf26 100644
>>> --- a/Documentation/userspace-api/media/drivers/dw100.rst
>>> +++ b/Documentation/userspace-api/media/drivers/dw100.rst
>>> @@ -20,4 +20,16 @@ match the expected size inherited from the destination image resolution.
>>>  More details on the DW100 hardware operations can be found in
>>>  *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
>>>  
>>> +The Vivante DW100 m2m driver implements the following driver-specific control:
>>> +
>>> +``V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (integer)``
>>
>> (integer) -> (__u32 array)
>>
>> But should this be a __u32 array at all? Wouldn't a __u16 array make more sense?
>>
>>> +    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
>>> +    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
>>> +    dynamic array. The image is divided into many small 16x16 blocks. If the
>>> +    width of the image is not divisible by 16, the size of the rightmost block
>>> +    is the remainder. 
>>
>> Isn't the same true for the height?
>>
>> The dewarping map only saves the vertex coordinates of the
>>> +    block. The dewarping grid map is comprised of vertex coordinates for x and y.
>>> +    Each x, y coordinate register uses 16 bits (UQ12.4) to record the coordinate
>>
>> As mentioned before, UQ12.4 is not necessarily a standard notation. 'unsigned 12.4
>> fixed point' is better, but you also need to specify exactly where the bits are
>> stored inside the __u16. I.e.: 'the integer part is stored in the 12 most significant
>> bits, and the fractional part is stored in the 4 least significant bits of the __u16.'
> 
> Isn't that implied ? I've never seen fixed-point numbers stored the
> other way around.

True, perhaps that's overkill.

> 
> Regarding the Q notation, while it was coined by TI, I think it's
> widespread enough to be used here. I don't mind much though.

I had to look it up :-)

That might say more about me, though...

I think the key phrase that is missing here is "fixed point".

Regards,

	Hans

> 
>>> +    address, with the Y coordinate in the upper bits and X in the lower bits.
>>
>> And with a __u16 array this becomes: 'The array contains pairs of X, Y coordinates.'
>> Or something along those lines.
>>
>>> +
>>>  .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
>>> diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
>>> new file mode 100644
>>> index 000000000000..7fdcf2bf42e5
>>> --- /dev/null
>>> +++ b/include/uapi/linux/dw100.h
>>> @@ -0,0 +1,11 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>>> +/* Copyright 2022 NXP */
>>> +
>>> +#ifndef __UAPI_DW100_H__
>>> +#define __UAPI_DW100_H__
>>> +
>>> +#include <linux/v4l2-controls.h>
>>> +
>>
>> Add a comment referring to the Documentation/userspace-api/media/drivers/dw100.rst
>> documentation so users of this control know where to find the associated
>> documentation.
>>
>>> +#define V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (V4L2_CID_USER_DW100_BASE + 1)
>>> +
>>> +#endif
> 

