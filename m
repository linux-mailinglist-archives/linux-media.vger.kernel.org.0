Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622181AD726
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 09:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728784AbgDQHNL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 03:13:11 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:49429 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728338AbgDQHNL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 03:13:11 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PLBRjhcQ27xncPLBUj9bdc; Fri, 17 Apr 2020 09:13:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587107588; bh=7A9nLcia1LTQQnCsS4rI0eQ9VqtTh9jnzZLLP/L7WgU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ixqsTta+Blg5whCW14hkBHjlaPTYNu62mQiiQMosMRuYg9rjklRv3pORM4lE0tHKh
         PIxGCbTWx4kuj6v5HiqLT5CFqg1bD4mqpSh0+3eiuSFL4X/a0L9s4p1f3fcjhXmU/9
         0NX3Io8FLqn8FN29A/pv1r9peVutAqiPhxBri1JHDeyJBhVu9u/jRSL/vFYAqHpslK
         5nSQ6yAa/WmTfRKf3sV4wDw3BHG37MgFz3P5TRqGCrXttm1er3WGVfDaIZKqlrB0lh
         LYrPKho11cBFOaYL7yNnRNkkKkloS0MgOUd9hC+AULSK4SAeyHnvdZK4alEQtuU59g
         /KiR+B8lGdS7Q==
Subject: Re: [PATCH] media: imx: utils: Default colorspace to SRGB
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200325173456.21455-1-slongerbeam@gmail.com>
 <9cea8cb9-b127-6ff0-a240-be338e081eaa@xs4all.nl>
 <11327092-e06c-a739-cbd2-ef44177fbc6a@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cd3ec24e-30e3-cc4e-0175-f3417cb82a80@xs4all.nl>
Date:   Fri, 17 Apr 2020 09:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <11327092-e06c-a739-cbd2-ef44177fbc6a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAnxTzfkgR4FKV+/n/m/voJfStwKiEL9lQ2x1AI59BFWHSFvjIcl+jJiIRrT5APdAhW5OYXeiONv6Dkdca/Sprbigh9iZTC4rxI6quqJUomKkaYp30OR
 ChrbqHsF2AqhGSHwzK5upQ7JdfvpBJ0GGSNiUXCxpRYRtRXga8gpozhReqDRM2NysvU59wUSchhBXua9uFQuyG786p82E2aM7Bh6U+rSXAEeUkKDOMPAsyKh
 yrDGCf4K+itFrT8ZnHMgrsUlEVl2RyHfbomAODe6RYn6hRYviu9PmNmUPWM+riw3ZxCEp14aMKHpDT/6YsCWhg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/04/2020 19:10, Steve Longerbeam wrote:
> Hi Hans,
> 
> On 4/16/20 3:52 AM, Hans Verkuil wrote:
>> Hi Steve,
>>
>> On 25/03/2020 18:34, Steve Longerbeam wrote:
>>> The function init_mbus_colorimetry() is used to initialize the imx
>>> subdevice mbus colorimetry to some sane defaults when the subdevice is
>>> registered. Currently it guesses at a colorspace based on the passed
>>> mbus pixel format. If the format is RGB, it chooses colorspace
>>> V4L2_COLORSPACE_SRGB, and if the format is YUV, it chooses
>>> V4L2_COLORSPACE_SMPTE170M.
>>>
>>> While that might be a good guess, it's not necessarily true that a RGB
>>> pixel format encoding uses a SRGB colorspace, or that a YUV encoding
>>> uses a SMPTE170M colorspace. Instead of making this dubious guess,
>>> just default the colorspace to SRGB.
>>>
>>> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
>>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>>> ---
>>>   drivers/staging/media/imx/imx-media-utils.c | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
>>> index fae981698c49..8344675bfd05 100644
>>> --- a/drivers/staging/media/imx/imx-media-utils.c
>>> +++ b/drivers/staging/media/imx/imx-media-utils.c
>>> @@ -236,8 +236,7 @@ static const struct imx_media_pixfmt ipu_rgb_formats[] = {
>>>   static void init_mbus_colorimetry(struct v4l2_mbus_framefmt *mbus,
>>>   				  const struct imx_media_pixfmt *fmt)
>>>   {
>>> -	mbus->colorspace = (fmt->cs == IPUV3_COLORSPACE_RGB) ?
>>> -		V4L2_COLORSPACE_SRGB : V4L2_COLORSPACE_SMPTE170M;
>>> +	mbus->colorspace = V4L2_COLORSPACE_SRGB;
>>>   	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
>>>   	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
>>>   	mbus->quantization =
>> The quantization is probably wrong as well since it checks fmt->cs.
>> The first argument should just be 'true'.
> 
> I don't think so. The default quantization depends in part on whether 
> the pixel format is RGB or YUV, which is the reason for passing boolean 
> (fmt->cs == IPUV3_COLORSPACE_RGB) as the first argument.

Ah yes, that's true. Sorry for the noise.

Regards,

	Hans

> 
> I realize "fmt->cs" is a misnomer, but it is borrowing from earlier 
> misnomers, i.e. the 'enum ipu_color_space' enumerations. Fixing those 
> names would touch lots of imx driver code.
> 
> 
>>
>> In any case, this patch no longer applies after the imx utils patch series.
> 
> Ok, I'll re-submit after the utils patch series is merged.
> 
> Steve
> 

