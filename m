Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE70F19EB1
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 16:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbfEJOHm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 10:07:42 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:33147 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727521AbfEJOHk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 10:07:40 -0400
Received: from [IPv6:2001:983:e9a7:1:2dea:e21e:760a:b215] ([IPv6:2001:983:e9a7:1:2dea:e21e:760a:b215])
        by smtp-cloud9.xs4all.net with ESMTPA
        id P6BUhf94HsDWyP6BVhcq7O; Fri, 10 May 2019 16:07:37 +0200
Subject: Re: [PATCH v5 03/15] media: v4l2-common: Support custom
 imagesize/bytesperline in fill_pixfmt()
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20190503114719.28784-1-boris.brezillon@collabora.com>
 <20190503114719.28784-4-boris.brezillon@collabora.com>
 <0c5a648c-27a8-8195-8ad9-8cefb4369837@xs4all.nl>
 <20190510112847.GA4972@pendragon.ideasonboard.com>
 <c2d02ffb-5273-67a8-1a3a-c7268dc7bfb6@xs4all.nl>
 <20190510122411.GB4972@pendragon.ideasonboard.com>
 <f9ffc9ae-2c27-2883-7f62-9931597c8e75@xs4all.nl>
 <106a6aa5fe62cf5b18652b667d15bc8677790cad.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4e7f49b2-48ad-b504-5826-d993ba85e624@xs4all.nl>
Date:   Fri, 10 May 2019 16:07:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <106a6aa5fe62cf5b18652b667d15bc8677790cad.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfO6FoDNjsoODniI2jH1jwnFcVeqCrvtZuLfOif/DBTUuibcQ/7Cjf2dNxrIdV/Z3a+NAbDEXCAWuGPKlAg9nxB3N9531ex1lRHAPhMAp6iiszPLxHgx3
 iDEpM5DAwZy5myrO0kMGNQUl/K+qihnzOQbjh/+/7p5C6+v+GCtG/FR1AjQQLdES+BkcarQkb51+tcuFqkEzsiZYcYzbACcY5wP39TPWYQaDCMQmeDwycOYO
 KnJLA61VM0bo2D7ZASPb4VGUj413bMxSL09RxiAbyeEFc84ugIzkdG7PlzEd9Ztv3dvIMzq8NwRk3t5OUTKctf5FwmLr3wvzWgo7hu5t3/AkHzSY+pi8FhHP
 Q5bylaeUVVxr6EWvwhgNYA9BSr9wTDA09r47QCycF8H8/qvVj7LtRuJoWyPi6LZx9yUucWCPbcZok3q4NXEdujEyDWC5OHNPp/zF4FKGBLWHyxVhzuHJv1w7
 XkY3fYXOtKGI+2GUBDP0p5vXz66hLkJ9RNaZNL7wS9pbqiJJs+f1cvI4Y561BKDKrTugLgcWQm3qHipjZ3FzoaIwb2W/hEFRXRuwq1+DaYWYVSBrpMrP3USa
 ig2PT6N/3qXX6sdPxj488Z34UQF55aqYhzT1yYDdJyoDq9z62rbxelRe4PieUplAI3dccExNvOxjOEWE30ZMvH4qfRfabifKly8uzuUt6ctwRIKrhwBHyXye
 VqFcBahC0mYJdvl0hytS2bPb1uVYzsgBcMm17OuAhvyLKycUj8IZYwUBuLE1h7Pa88idyo21sKg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/10/19 3:51 PM, Nicolas Dufresne wrote:
> Le vendredi 10 mai 2019 à 14:30 +0200, Hans Verkuil a écrit :
>> On 5/10/19 2:24 PM, Laurent Pinchart wrote:
>>> Hi Hans,
>>>
>>> On Fri, May 10, 2019 at 02:17:32PM +0200, Hans Verkuil wrote:
>>>> On 5/10/19 1:28 PM, Laurent Pinchart wrote:
>>>>> On Fri, May 10, 2019 at 10:57:26AM +0200, Hans Verkuil wrote:
>>>>>> On 5/3/19 1:47 PM, Boris Brezillon wrote:
>>>>>>> Users can define custom sizeimage and bytesperline as long as they're
>>>>>>> big enough to store the amount of pixels required for a specific
>>>>>>> width/height under a specific format. Avoid overriding those fields in
>>>>>>> this case.
>>>>>>>
>>>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>>> ---
>>>>>>> Hello Hans,
>>>>>>>
>>>>>>> The sizeimage/bytesperline check on !MPLANE formats is still not 100%
>>>>>>> sure, as custom bytesperline might induce bigger sizeimage than what
>>>>>>> we calculate.
>>>>>>>
>>>>>>> I tried implementing something smarter taking the per-component plane
>>>>>>> bpp + hdiv param as we discussed the other day but decided to step
>>>>>>> back after realizing the per-component plane macro block might also
>>>>>>> differ at least in theory (not sure that's true in practice) and that
>>>>>>> has an impact on bytesperline too.
>>>>>>>
>>>>>>> Let me know how you want to handle that case.
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>> Boris
>>>>>>>
>>>>>>> Changes in v5:
>>>>>>> * New patch
>>>>>>> ---
>>>>>>>  drivers/media/v4l2-core/v4l2-common.c | 54 +++++++++++++++++++--------
>>>>>>>  1 file changed, 39 insertions(+), 15 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>>>>>>> index 3c6f5c115fc5..37bfc984a8b5 100644
>>>>>>> --- a/drivers/media/v4l2-core/v4l2-common.c
>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>>>>>>> @@ -563,9 +563,10 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
>>>>>>>  	pixfmt->num_planes = info->mem_planes;
>>>>>>>  
>>>>>>>  	if (info->mem_planes == 1) {
>>>>>>> +		u32 bytesperline, sizeimage = 0;
>>>>>>> +
>>>>>>>  		plane = &pixfmt->plane_fmt[0];
>>>>>>> -		plane->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
>>>>>>> -		plane->sizeimage = 0;
>>>>>>> +		bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
>>>>>>>  
>>>>>>>  		for (i = 0; i < info->comp_planes; i++) {
>>>>>>>  			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
>>>>>>> @@ -576,10 +577,17 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
>>>>>>>  			aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
>>>>>>>  			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
>>>>>>>  
>>>>>>> -			plane->sizeimage += info->bpp[i] *
>>>>>>> -				DIV_ROUND_UP(aligned_width, hdiv) *
>>>>>>> -				DIV_ROUND_UP(aligned_height, vdiv);
>>>>>>> +			sizeimage += info->bpp[i] *
>>>>>>> +				     DIV_ROUND_UP(aligned_width, hdiv) *
>>>>>>> +				     DIV_ROUND_UP(aligned_height, vdiv);
>>>>>>>  		}
>>>>>>> +
>>>>>>> +		/*
>>>>>>> +		 * The user might have specified custom sizeimage/bytesperline,
>>>>>>> +		 * only override them if they're not big enough.
>>>>>>> +		 */
>>>>>>> +		plane->sizeimage = max(sizeimage, plane->sizeimage);
>>>>>>> +		plane->bytesperline = max(bytesperline, plane->bytesperline);
>>>>>>
>>>>>> Let's just set bytesperline, ignoring the value the user supplied. There are very
>>>>>> few drivers that allow the user to set bytesperline anyway, so it's not a big deal
>>>>>> to drop support for that for now. We can add it back later.
>>>>>>
>>>>>> Just add a comment that a user-defined bytesperline value isn't currently supported.
>>>>>
>>>>> Kieran recently ran into an issue related to this, when sharing buffers
>>>>> between a CSI-2 receiver and an ISP. The ISP has alignment constraints
>>>>> in both the horizontal and vertical directions on the line stride and
>>>>> total image size. Out software framework currently allocates buffers
>>>>> from the CSI-2 receiver which doesn't have those constraints, and not
>>>>> being able to specify sizeimage is thus a problem.
>>>>
>>>> Not being able to specify sizeimage where? From userspace? Sorry, I don't
>>>> quite understand the specific issue here.
>>>
>>> Yes, from userspace.
>>
>> Ah, OK. But why not use CREATEBUFS? You can provide your own size when allocating
>> the buffers.
>>
>> Also note this patch: https://patchwork.linuxtv.org/patch/55656/
>>
>> Although this is specific for compressed formats.
> 
> While this work for compressed formats, it does not do anything for raw
> image horizontal padding. The importation bit of V4L2 is pretty
> difficult, so if we add helpers, we should load the way and simplify
> things for userspace rather then enforcing the existing difficulty.
> 
> I think from now own we should design with the mindset that a DMABuf
> that cannot be imported back into another driver due to software
> limitations is a useless waste of FD.

I agree, but I feel that this is part of the new fmt and streaming
ioctls project that Boris started. Doing further hacking of the existing API
is just complicating matters even more.

Creating new format ioctls that are much more flexible in describing image
formats (and closer to drm where possible) seems to be the right approach.

Hmmm... "waste of FD": Face Detection? File Descriptor? Probably not.

The urbandictionary doesn't help either: https://www.urbandictionary.com/define.php?term=FD

No idea what FD means :-), although I get the sentiment.

Regards,

	Hans
