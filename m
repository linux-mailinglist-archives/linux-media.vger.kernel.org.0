Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED1030485A
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388675AbhAZFpZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:45:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbhAYODO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 09:03:14 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FEDC061574;
        Mon, 25 Jan 2021 06:02:13 -0800 (PST)
Received: from [IPv6:2804:214:81d7:a6cc:f83c:66c3:4225:e59d] (unknown [IPv6:2804:214:81d7:a6cc:f83c:66c3:4225:e59d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 211021F452BD;
        Mon, 25 Jan 2021 14:02:09 +0000 (GMT)
Subject: Re: [PATCH] media: doc: pixfmt-yuv: Fix 4:4:4 subsampling info
From:   Helen Koike <helen.koike@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        hans.verkuil@cisco.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org
References: <20210122182723.327438-1-helen.koike@collabora.com>
 <YAvyu6AvEmZy6WRq@pendragon.ideasonboard.com>
 <7f650d51-d419-53cc-0ad1-b241a10ab801@collabora.com>
Message-ID: <9468d3e1-ac8b-8de7-5632-1da9119c992e@collabora.com>
Date:   Mon, 25 Jan 2021 11:02:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <7f650d51-d419-53cc-0ad1-b241a10ab801@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/25/21 10:57 AM, Helen Koike wrote:
> 
> 
> On 1/23/21 6:56 AM, Laurent Pinchart wrote:
>> Hi Helen,
>>
>> Thank you for the patch.
>>
>> On Fri, Jan 22, 2021 at 03:27:23PM -0300, Helen Koike wrote:
>>> YUV 4:4:4 is not subsampled, fix this in the docs.
>>>
>>> Fixes: da785536e007 ("media: doc: pixfmt-yuv: Move all semi-planar YUV formats to common file")
>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>> ---
>>>  Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>>> index 7d4d39201a3f..bcb4ef24c334 100644
>>> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>>> @@ -396,8 +396,8 @@ number of lines as the luma plane.
>>>  NV24 and NV42
>>>  -------------
>>>  
>>> -Semi-planar YUV 4:4:4 formats. The chroma plane is subsampled by 2 in the
>>> -horizontal direction. Chroma lines contain half the number of pixels and the
>>> +Semi-planar YUV 4:4:4 formats. No sub-sampling.
>>
>> "The chroma plane is not subsampled." ?
> 
> Ack.
> 
>>
>>> +Chroma lines contain the same number of pixels and the
>>>  same number of bytes as luma lines, and the chroma plane contains the same
>>>  number of lines as the luma plane.
>>
>> That's not quite right, the chroma lines contain twice the number of
>> pixels and bytes, as there's one Cb and one Cr value in the chroma line
>> for each Y value in the luma line.

Actually, it is the same number o pixels, but twice the number o bytes.
Since a trio (YCbCr) compose a pixel.

At least this is how I understand comparing the logic of the text description
of NV16 YUV4:2:2.

Regards,
Helen

>>
>>
>> Maybe the text could be reflowed ?
>>
> 
> Ack.
> 
> I'll submit v2 updating the text.
> 
> Thanks,
> Helen
> 
