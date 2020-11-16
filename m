Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947642B4F17
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 19:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731650AbgKPSUh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 13:20:37 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40215 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731610AbgKPSUh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 13:20:37 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ej77khE3D6LFvej7BkRHt3; Mon, 16 Nov 2020 19:20:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605550833; bh=3bAXBmagXrExGOQ8s9KJrsJo4LCbTsrn0Cfs3EnFr6I=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FpspqOwtAFwz3wj3XyIVHaNVZrT9AE7nKAkV2WspmZzvElLROoM9KqwI4X7ngIQEE
         DS1hzLTE5iRWUl5CwGdjmn7QVD1PJC1XRN1fsAnyJByONA8ooq5zTDpM2oDdv0bwUz
         rthPqBCSBttpeHiEJtYTlVagppIGgYh/aO9DZvlqYlLyX/8ernZNSrbYWV5/nhqTTf
         dO5mkbWb+2yCcAslbbp9mmbpLZLNmyjCqPOcMb67OyKRrWsX6TJnUI68o5KQ2IxVlx
         GsPHpbl2iI+ibnvk/3hci4RdEs7mFkAVSY3779AbVCN2wcrPj8A5+zheokfejkfVd8
         Wm0MXmuF1st3w==
Subject: Re: [PATCH v2 06/19] media: doc: pixfmt-rgb: Clarify naming scheme
 for RGB formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
 <20201102224102.30292-7-laurent.pinchart@ideasonboard.com>
 <ae3848f7-9742-53d1-f476-03b4ded32073@xs4all.nl>
 <20201116172606.GS6540@pendragon.ideasonboard.com>
 <20201116173516.GU6540@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7523339c-5148-f052-56d0-35bdc6015893@xs4all.nl>
Date:   Mon, 16 Nov 2020 19:20:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201116173516.GU6540@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCUjKTZYe78TCYHg0LtZneYRPYW0CwO3+a7TOFfZock/X3yBYKP++3zxEYlBkJIo3MY2lC9gEgQ4LPwYxUuOeJLkEW1Q1lEx+a2S1ISrZ6sh4CpSsoat
 yKDfT2ATEwMOmoDuSfB75WmGEbwZv1LsWeWQI+dAosW4g+3d+CRtF5Uf9CbChME+6lxlqIBZi6VJBklSPt8wgKMni6TCrBdxQUs49PejrhXfN8cF1z3A8bcH
 8Gdz95Je+yMZHefcdKmnXJmfR2sDur92jqVdR1sJ0z+sGss7Il5UdWo7Mou5UOIYusg9pNcbl+ey98YlWt6Dqg3O4msqDSV1Qzc75jJ8V2cyWJdY1OZlUJAn
 ujDtQ5725vEeK6XcO29n30Vx9dbuaA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/11/2020 18:35, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Nov 16, 2020 at 07:26:07PM +0200, Laurent Pinchart wrote:
>> On Mon, Nov 16, 2020 at 12:51:19PM +0100, Hans Verkuil wrote:
>>> On 02/11/2020 23:40, Laurent Pinchart wrote:
>>>> The naming scheme for the RGB pixel formats has been developed
>>>> organically, and isn't consistent between formats stored in 1 or 2
>>>> bytes, and formats stored in 3 or 4 bytes. For the latter category, the
>>>> names use a components order convention that is the opposite of the
>>>> first category, and the opposite of DRM pixel formats. This has led to
>>>> lots of confusion in the past, and would really benefit from being
>>>> explained more precisely. Do so, which also prepares for the addition of
>>>> additional RGB pixels formats.
>>>>
>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> ---
>>>> Changes since v1:
>>>>
>>>> - Clarify padding and padding requirements
>>>> - Fix typo
>>>> ---
>>>>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 195 ++++++++++++------
>>>>  include/uapi/linux/videodev2.h                |   4 +-
>>>>  2 files changed, 140 insertions(+), 59 deletions(-)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>>>> index 5045895e85e1..405d6f032078 100644
>>>> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>>>> @@ -6,13 +6,62 @@
>>>>  RGB Formats
>>>>  ***********
>>>>  
>>>> -Description
>>>> -===========
>>>> +These formats encode each pixel as a triplet of RGB values. They are packed
>>>> +formats, meaning that the RGB values for one pixel are stored consecutively in
>>>> +memory and each pixel consumes an integer number of bytes. When the number of
>>>> +bits required to store a pixel is not aligned to a byte boundary, the data is
>>>> +padded with additional bits to fill the remaining byte.
>>>>  
>>>> -These formats are designed to match the pixel formats of typical PC
>>>> -graphics frame buffers. They occupy 8, 16, 24 or 32 bits per pixel.
>>>> -These are all packed-pixel formats, meaning all the data for a pixel lie
>>>> -next to each other in memory.
>>>> +The formats differ by the number of bits per RGB component (typically but not
>>>> +always the same for all components), the order of components in memory, and the
>>>> +presence of an alpha component or additional padding bits.
>>>> +
>>>> +The usage and value of the alpha bits in formats that support them (named ARGB
>>>> +or a permutation thereof, collectively referred to as alpha formats) depend on
>>>> +the device type and hardware operation. :ref:`Capture <capture>` devices
>>>> +(including capture queues of mem-to-mem devices) fill the alpha component in
>>>> +memory. When the device captures an alpha channel the alpha component will have
>>>> +a meaningful value. Otherwise, when the device doesn't capture an alpha channel
>>>> +but can set the alpha bit to a user-configurable value, the
>>>> +:ref:`V4L2_CID_ALPHA_COMPONENT <v4l2-alpha-component>` control is used to
>>>> +specify that alpha value, and the alpha component of all pixels will be set to
>>>> +the value specified by that control. Otherwise a corresponding format without
>>>> +an alpha component (XRGB or XBGR) must be used instead of an alpha format.
>>>> +
>>>> +:ref:`Output <output>` devices (including output queues of mem-to-mem devices
>>>> +and :ref:`video output overlay <osd>` devices) read the alpha component from
>>>> +memory. When the device processes the alpha channel the alpha component must be
>>>> +filled with meaningful values by applications. Otherwise a corresponding format
>>>> +without an alpha component (XRGB or XBGR) must be used instead of an alpha
>>>> +format.
>>>> +
>>>> +Formats that contain padding bits are named XRGB (or a permutation thereof).
>>>> +The padding bits contain undefined values and must be ignored by applications,
>>>> +devices and drivers, for both :ref:`capture` and :ref:`output` devices.
>>>> +
>>>> +.. note::
>>>> +
>>>> +   - In all the tables that follow, bit 7 is the most significant bit in a byte.
>>>> +   - 'r', 'g' and 'b' denote bits of the red, green and blue components
>>>> +     respectively. 'a' denotes bits of the alpha component (if supported by the
>>>> +     format), and '-' denotes padding bits.
>>>> +
>>>> +
>>>> +8 or 16 Bits Per Pixel
>>>> +======================
>>>> +
>>>> +These formats store an RGB triplet in one or two bytes. They are named based on
>>>> +the order of the RGB components as seen in a 8- or 16-bit word, which is then
>>>> +stored in memory in little endian byte order (unless otherwise noted by the
>>>> +presence of bit 31 in the 4CC value), and on the number of bits for each
>>>> +component. For instance, the RGB565 format stores a pixel in a 16-bit word
>>>> +[15:0] laid out at as [R\ :sub:`4` R\ :sub:`3` R\ :sub:`2` R\ :sub:`1`
>>>> +R\ :sub:`0` G\ :sub:`5` G\ :sub:`4` G\ :sub:`3` G\ :sub:`2` G\ :sub:`1`
>>>> +G\ :sub:`0` B\ :sub:`4` B\ :sub:`3` B\ :sub:`2` B\ :sub:`1` B\ :sub:`0`], and
>>>> +stored in memory in two bytes, [R\ :sub:`4` R\ :sub:`3` R\ :sub:`2` R\ :sub:`1`
>>>> +R\ :sub:`0` G\ :sub:`5` G\ :sub:`4` G\ :sub:`3`] followed by [G\ :sub:`2`
>>>> +G\ :sub:`1` G\ :sub:`0` B\ :sub:`4` B\ :sub:`3` B\ :sub:`2` B\ :sub:`1`
>>>> +B\ :sub:`0`].
>>>>  
>>>>  .. raw:: latex
>>>>  
>>>> @@ -20,10 +69,10 @@ next to each other in memory.
>>>>      \tiny
>>>>      \setlength{\tabcolsep}{2pt}
>>>>  
>>>> -.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
>>>> +.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
>>>>  
>>>>  
>>>> -.. flat-table:: RGB Image Formats
>>>> +.. flat-table:: RGB Formats With 8 or 16 Bits Per Pixel
>>>>      :header-rows:  2
>>>>      :stub-columns: 0
>>>>  
>>>> @@ -31,8 +80,6 @@ next to each other in memory.
>>>>        - Code
>>>>        - :cspan:`7` Byte 0 in memory
>>>>        - :cspan:`7` Byte 1
>>>> -      - :cspan:`7` Byte 2
>>>> -      - :cspan:`7` Byte 3
>>>>      * -
>>>>        -
>>>>        - 7
>>>> @@ -52,24 +99,6 @@ next to each other in memory.
>>>>        - 2
>>>>        - 1
>>>>        - 0
>>>> -
>>>> -      - 7
>>>> -      - 6
>>>> -      - 5
>>>> -      - 4
>>>> -      - 3
>>>> -      - 2
>>>> -      - 1
>>>> -      - 0
>>>> -
>>>> -      - 7
>>>> -      - 6
>>>> -      - 5
>>>> -      - 4
>>>> -      - 3
>>>> -      - 2
>>>> -      - 1
>>>> -      - 0
>>>>      * .. _V4L2-PIX-FMT-RGB332:
>>>>  
>>>>        - ``V4L2_PIX_FMT_RGB332``
>>>> @@ -544,6 +573,82 @@ next to each other in memory.
>>>>        - b\ :sub:`1`
>>>>        - b\ :sub:`0`
>>>>        -
>>>> +
>>>> +.. raw:: latex
>>>> +
>>>> +    \endgroup
>>>> +
>>>> +
>>>> +24 or 32 Bits Per Pixel
>>>
>>> Wouldn't it be better to call this "8 Bits Per Component"? Since we'll later get
>>> a section called "More Than 8 Bits Per Component".
>>
>> The previous section is named "8 and 16 bits per pixel", so there will
>> be a mismatch on one side or the other :-) I will change it here.
> 
> There's one issue though, V4L2_PIX_FMT_BGR666 has less than 8 bits per
> component. I can move it to the previous section (which should then be
> renamed to "less than 8 bits per component"), but it will be only format
> with more than two bytes in that table. Is that OK with you ?

That sounds good.

Regards,

	Hans
