Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD96F186C67
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 14:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731360AbgCPNpJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 09:45:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48902 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731128AbgCPNpJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 09:45:09 -0400
Received: from [IPv6:2003:cb:8701:9100:60ee:cf5c:40c0:ec5a] (p200300CB8701910060EECF5C40C0EC5A.dip0.t-ipconnect.de [IPv6:2003:cb:8701:9100:60ee:cf5c:40c0:ec5a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B52AC2946FE;
        Mon, 16 Mar 2020 13:45:07 +0000 (GMT)
Subject: Re: [PATCH] media: v4l2-common: Add BGR666 to v4l2_format_info
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
References: <20200316070123.2434-1-dafna.hirschfeld@collabora.com>
 <20200316072214.GA16123@pendragon.ideasonboard.com>
 <31efd58f-1ab1-d3d0-e4b9-ea9072e608fa@collabora.com>
 <20200316081516.GK4732@pendragon.ideasonboard.com>
 <401a9aca-f61f-d818-28dc-0e4cf7c2ac20@collabora.com>
 <20200316100036.GR4732@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <ca5838da-d18c-1bef-e1b2-bfa13bf79ad3@collabora.com>
Date:   Mon, 16 Mar 2020 14:45:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316100036.GR4732@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 16.03.20 11:00, Laurent Pinchart wrote:
> Hi Dafna,
> 
> On Mon, Mar 16, 2020 at 09:59:56AM +0100, Dafna Hirschfeld wrote:
>> On 16.03.20 09:15, Laurent Pinchart wrote:
>>> On Mon, Mar 16, 2020 at 09:07:16AM +0100, Dafna Hirschfeld wrote:
>>>> On 16.03.20 08:22, Laurent Pinchart wrote:
>>>>> On Mon, Mar 16, 2020 at 08:01:23AM +0100, Dafna Hirschfeld wrote:
>>>>>> Add V4L2_PIX_FMT_BGR666 to the format table.
>>>>>>
>>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>>> ---
>>>>>> Hi,
>>>>>> BGR66 is needed for the rkisp1 driver.
>>>>>> Currently it crashes since the call to
>>>>>> v4l2_format_info returns NULL.
>>>>>>
>>>>>>     drivers/media/v4l2-core/v4l2-common.c | 1 +
>>>>>>     1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>>>>>> index d0e5ebc736f9..d7f82b2aa22f 100644
>>>>>> --- a/drivers/media/v4l2-core/v4l2-common.c
>>>>>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>>>>>> @@ -253,6 +253,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>>>>>     		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>>>     		{ .format = V4L2_PIX_FMT_RGB565,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>>>     		{ .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>>> +		{ .format = V4L2_PIX_FMT_BGR666,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>>
>>>>> Isn't BGR666 stored in 3 bytes per pixel ?
>>>>
>>>> Hi, I also discussed it with Helen. From the documentation we
>>>> understood that it uses 4 bytes and the last one is empty.
>>>> https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/pixfmt-rgb.html
>>>
>>> Would you then also understand V4L2_PIX_FMT_RGB565 to use 4 bytes with
>>> the last 2 bytes empty ? :-)
>>
>> hmm, the formats between BGR24 and XRGB32 in the docs table have vertical lines crossing all 4 bytes so we understood that they are all 4 bytes. Isn't it?
>> Format RGB565 doesn't have does vertical lines on the last two bytes which means it uses 2. At least that is what we understood.
> 
> I stand corrected, looking at the drivers implementing
> V4L2_PIX_FMT_BGR666, they all handle it as a 32bpp format.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>>> I agree that the documentation is somehow ambiguous and should be fixed.
>>> Patches are welcome ;-)
> 
> I think adding explicit '-' or 'x' in the cells that contain "don't
> care" bits would help avoiding confusion.

sure, I'll do that

> 
>>>>>>     
>>>>>>     		/* YUV packed formats */
>>>>>>     		{ .format = V4L2_PIX_FMT_YUYV,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> 
