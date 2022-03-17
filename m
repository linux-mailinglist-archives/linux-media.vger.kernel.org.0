Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515224DC1D0
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 09:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbiCQItr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 04:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbiCQItq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 04:49:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F89985AA
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 01:48:29 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C0C8493;
        Thu, 17 Mar 2022 09:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647506907;
        bh=1xdCjiMa7eQUwnO1bmMkl05IrkQXViISmnJ3x64txXE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=G458mr0f1XBRtvTnP0twKppgLkXt0zELnDU0Ma8hGckKdzwx+DGetEdvWegd/Z8yj
         9w8hFXxuPNYr6QDRYSc5pzuzVMhdFoVxnqAvqC5ZStS+H3EIboHpstgq26cWZyspvA
         647K0tqhDGr2JQxWgEJ6yUdiZNi0dTW6Dm4glGEA=
Message-ID: <e8ed7ed9-ee8f-db74-cc64-d758e79d57a2@ideasonboard.com>
Date:   Thu, 17 Mar 2022 10:48:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 26/36] media: subdev: add stream based configuration
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-27-tomi.valkeinen@ideasonboard.com>
 <20220316095905.cbqz4lihcrfrbpv6@uno.localdomain>
 <616883b2-a85f-de61-31a0-91b514f61bf4@ideasonboard.com>
 <20220317083830.x7tusv2goldsumzv@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220317083830.x7tusv2goldsumzv@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/03/2022 10:38, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Thu, Mar 17, 2022 at 10:01:47AM +0200, Tomi Valkeinen wrote:
>> On 16/03/2022 11:59, Jacopo Mondi wrote:
>>> Hi Tomi
>>>
>>> On Tue, Mar 01, 2022 at 06:11:46PM +0200, Tomi Valkeinen wrote:
>>>> Add support to manage configurations (format, crop, compose) per stream,
>>>> instead of per pad. This is accomplished with data structures that hold
>>>> an array of all subdev's stream configurations.
>>>>
>>>> The number of streams can vary at runtime based on routing. Every time
>>>> the routing is changed, the stream configurations need to be
>>>> re-initialized.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> ---
>>>>    .../v4l/vidioc-subdev-enum-frame-interval.rst |   5 +-
>>>>    .../v4l/vidioc-subdev-enum-frame-size.rst     |   5 +-
>>>>    .../v4l/vidioc-subdev-enum-mbus-code.rst      |   5 +-
>>>>    .../media/v4l/vidioc-subdev-g-crop.rst        |   5 +-
>>>>    .../media/v4l/vidioc-subdev-g-fmt.rst         |   5 +-
>>>>    .../v4l/vidioc-subdev-g-frame-interval.rst    |   5 +-
>>>>    .../media/v4l/vidioc-subdev-g-selection.rst   |   5 +-
>>>>    drivers/media/v4l2-core/v4l2-subdev.c         | 129 ++++++++++++++++--
>>>>    include/media/v4l2-subdev.h                   |  48 +++++++
>>>>    include/uapi/linux/v4l2-subdev.h              |  28 +++-
>>>>    10 files changed, 218 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
>>>> index 3703943b412f..8def4c05d3da 100644
>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
>>>> @@ -92,7 +92,10 @@ multiple pads of the same sub-device is not defined.
>>>>          - Frame intervals to be enumerated, from enum
>>>>    	:ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
>>>>        * - __u32
>>>> -      - ``reserved``\ [8]
>>>> +      - ``stream``
>>>> +      - Stream identifier.
>>>> +    * - __u32
>>>> +      - ``reserved``\ [7]
>>>
>>> Does VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL (as well as
>>> VIDIOC_SUBDEV_G_FRAME_INTERVAL) need to be stream-aware ?
>>>
>>> What is the semantic of the stream identifiers for IOCTLs that seem to
>>> control a paramter which is global to the subdev ? Isn't the stream semantic
>>> required to be specified in the IOCTL documentation and not just added
>>> to the list of fields ?
>>
>> Why would it be global to the subdev? struct v4l2_subdev_frame_interval_enum
>> already has 'pad' field, so it operates on that pad. With streams, each
>> stream in a pad may have different characteristics, (similarly to different
>> pads in non-stream case), so it feels logical to me to add the 'stream'
>> field.
>>
> 
> I understand a device with multiple output interfaces can decide to
> clock out frames at different speeds due to some bus configuration
> parameters. But I have an hard time immagine a device that can clock
> out frames at different rates on the same bus.

I see your point, but doesn't the viability depend on the bus and 
protocol? A sensor could send pixel frames 60 fps, but metadata only at 
10 fps. Or a HD picture 10 fps, and a low res picture 60 fps. All it 
needs is a bus that can interleave the streams seamlessly.

  Tomi
