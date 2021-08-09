Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9B73E458D
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 14:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234619AbhHIMZB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 08:25:01 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:44697 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234427AbhHIMZB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Aug 2021 08:25:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id D4Kam0SlS4SnAD4KdmmQxg; Mon, 09 Aug 2021 14:24:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628511879; bh=3vq+9eH7UxGkewfqTZcB/0eIabyMat+z1MNydjDtZmc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pU+3sKfOnfvGCUbFnVip8Vgjxlbf/z2fA+9GSZmRh85IHDqa7sjPlbjDKWe3NtjGG
         tIIV3o/pMkaoShFMJniwIdOb1ogBDXfbWNaz5tWtBxugGf6ZkT3BvwNMCa7YuuIuei
         bmGhihW/AiCfTg0zhWsAD6DUHCGdkbL+wZW/M5P4MrO1B1sWgMPvCJ97mxD3wYVkyV
         OedPmwP8h8uieVQ32RgeiIF5eCQaVpBD4RpX1aNZHfzmj0NlTYkP7pBTl6zz6Npk+7
         gUSF7Sewcw9wLQC4Dsf2V1rlHt0SU5/FzQz+D43OwT1i/tgGwCZC/n6pFLMX2hrUKT
         WqpyTH5ZFvM9A==
Subject: Re: [PATCH v4 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS
 control
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     David Plowman <david.plowman@raspberrypi.com>,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210809093448.4461-1-david.plowman@raspberrypi.com>
 <20210809093448.4461-2-david.plowman@raspberrypi.com>
 <21527f47-3c9e-55e2-3973-bfd0ebc91c2e@xs4all.nl>
 <YREdXF2XhR6WA+50@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <54c13814-634d-b0db-1e8c-965dbb45fa0f@xs4all.nl>
Date:   Mon, 9 Aug 2021 14:24:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YREdXF2XhR6WA+50@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOFjDSG52U8e8LJVZcamcHUd9V3If0YMTFfdUtB6uenou6pRqY5Q/g4URamhuTxCAwUSrwKPuzvqu9vIuq9kTkCPYDrWqMg0VP+7Zfecn3/Lgz70rNo3
 kAs2PRMguDzl1UHS8hRr74LMaMEG2uOOupGzvgNSoMvB5pPyhfmGHUVxDyNjMX+uSCHHh8C+M2aexSoz1hq23yVPOsGXOirrf6h7cfEhogQBN2J4xvTkxXDZ
 59Lp1Gb1cQkceMc/3+adfhqBmIc3l5w5DjrukLKIozJNbfF5uhmMxEFIzNennQT5ENHfv2Rri1r1jKuezb26jm7/k+3agsl/b4XvaH8+Gktd8zF8cCUpzglN
 l3lAQ1uVxIg1P8ZrJtFCm7+mq8vw+D415wDOuDbDvGCAztQl6QI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/08/2021 14:19, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Aug 09, 2021 at 01:05:00PM +0200, Hans Verkuil wrote:
>> On 09/08/2021 11:34, David Plowman wrote:
>>> We add a new control V4L2_CID_NOTIFY_GAINS which allows the sensor to
>>> be notified what gains will be applied to the different colour
>>> channels by subsequent processing (such as by an ISP), even though the
>>> sensor will not apply any of these gains itself.
>>>
>>> For Bayer sensors this will be an array control taking 4 values which
>>> are the 4 gains arranged in the fixed order B, Gb, Gr and R,
>>> irrespective of the exact Bayer order of the sensor itself.
>>>
>>> The units are in all cases linear with the default value indicating a
>>> gain of exactly 1.
>>
>> So a value of 2 means a gain of 2? Or are these fixed point values? How do
>> I represent a gain of 1.5?
> 
> No, the default value corresponds to a x1.0 gain, but it's not 1. If the
> default is, let's say, 128, then x2.0 will be 256.

Ah, now I get it. Perhaps a small example of this in the documentation patch will
help clarify this.

> 
>>> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
>>> ---
>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
>>>  include/uapi/linux/v4l2-controls.h        | 1 +
>>>  2 files changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> index 421300e13a41..f87053c83249 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> @@ -1107,6 +1107,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>  	case V4L2_CID_TEST_PATTERN_GREENR:	return "Green (Red) Pixel Value";
>>>  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
>>>  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
>>> +	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
>>>  
>>>  	/* Image processing controls */
>>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>>
>> Since this is a standard control, it should also be configured correctly in
>> v4l2_ctrl_fill().
>>
>> Instead of an array, would a compound control (aka a struct) be better? Then you can
>> explicitly have field names g, gb, gr and r.
>>
>> Is there a specific reason we want an array instead of that? I'm not opposed, but
>> I'd like to see a rationale for that.
> 
> Bayer ia only one of the possible CFA patterns for sensors. With a
> structure containing named b, gb, gr and r fields, we wouldn't be able
> to support, for instance, RGBW filters. It's not clear at this point
> what other CFA patterns will be seen in sensors that require this
> feature, but an array control will be able to more easily support these
> use cases.

OK. It is probably a good idea to mention this in the commit log at least.

Regards,

	Hans

> 
>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>> index 5532b5f68493..133e20444939 100644
>>> --- a/include/uapi/linux/v4l2-controls.h
>>> +++ b/include/uapi/linux/v4l2-controls.h
>>> @@ -1118,6 +1118,7 @@ enum v4l2_jpeg_chroma_subsampling {
>>>  #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
>>>  #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
>>>  #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
>>> +#define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
>>>  
>>>  
>>>  /* Image processing controls */
> 

