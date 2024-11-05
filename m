Return-Path: <linux-media+bounces-20900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7619BC887
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 10:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A014728396D
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35151AC429;
	Tue,  5 Nov 2024 09:01:36 +0000 (UTC)
X-Original-To: linux-media@vger.Kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A940210FB
	for <linux-media@vger.Kernel.org>; Tue,  5 Nov 2024 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730797296; cv=none; b=Gyx1ZtOOxJu68fU3xOGQ5Cp3JVwIeqLrMwelC1zd2j0w9iNUrvfOA1+dySObi88/1q6Id9v1Sbw45k6cswmOH94ej5kIAcELkHL5ICZIrbrlIvRG0/awHd3LM84CcKyW4Wv2iVcmBJeiFoevJpPORPeEmgNAjKoWKCPGV2Psy3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730797296; c=relaxed/simple;
	bh=BFxqxfWltMElTwU70YTKtbsmFlJLq/gBC2Dmcpgt9r0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQKI2OvgPEx4GEmeyV7z+OLE+1mkZUj72zyr+FLcAru/B/wyU05PvZrqqr2VK/YPdp9EyLryJdK/m+BqVq8LH49+KmT2bXF8J7hQHwjx609Al48xBBYvRi00EdmGwbAsBvPO4SflT1hxMgv1K0BVBIgXqJDbYyVIGMZjA9+Sxyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0882EC4CECF;
	Tue,  5 Nov 2024 09:01:33 +0000 (UTC)
Message-ID: <d2d2d4c0-1fdd-41d4-a4ad-b5a1f0673b23@xs4all.nl>
Date: Tue, 5 Nov 2024 10:01:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.Kernel.org,
 tfiga@chromium.org, ribalda@chromium.org, yunkec@google.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@nxp.com
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
 <20241030024307.1114787-3-ming.qian@oss.nxp.com>
 <20241030090330.GS22600@pendragon.ideasonboard.com>
 <12913e54-9343-42ab-ab1e-a33656e640af@xs4all.nl>
 <81b3dcb1-3c3a-41bc-895b-05657191b980@oss.nxp.com>
 <20241031093403.GA2473@pendragon.ideasonboard.com>
 <aeff111c-caac-425a-8152-a90ae04980ae@oss.nxp.com>
 <20241031100920.GC2473@pendragon.ideasonboard.com>
 <8c5f9e10-538d-4dd8-a9ad-f81a5bb08185@oss.nxp.com>
 <d7818bb6-ffd8-41a7-bb2b-90ed20b44e40@xs4all.nl>
 <20241105085125.GH27775@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241105085125.GH27775@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/11/2024 09:51, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Tue, Nov 05, 2024 at 09:30:43AM +0100, Hans Verkuil wrote:
>> On 04/11/2024 02:24, Ming Qian(OSS) wrote:
>>> On 2024/10/31 18:09, Laurent Pinchart wrote:
>>>> On Thu, Oct 31, 2024 at 05:46:49PM +0800, Ming Qian(OSS) wrote:
>>>>> On 2024/10/31 17:34, Laurent Pinchart wrote:
>>>>>> On Thu, Oct 31, 2024 at 05:19:02PM +0800, Ming Qian(OSS) wrote:
>>>>>>> On 2024/10/30 17:19, Hans Verkuil wrote:
>>>>>>>> On 30/10/2024 10:03, Laurent Pinchart wrote:
>>>>>>>>> On Wed, Oct 30, 2024 at 11:43:06AM +0900, ming.qian@oss.nxp.com wrote:
>>>>>>>>>> From: Yunke Cao <yunkec@google.com>
>>>>>>>>>>
>>>>>>>>>> Tested with VIVID
>>>>>>>>>>
>>>>>>>>>>     ./v4l2-ctl -C rect -d 0
>>>>>>>>>> rect: 300x400@200x100
>>>>>>>>>>
>>>>>>>>>>     ./v4l2-ctl -c rect=1000x2000@0x0
>>>>>>>>>>     ./v4l2-ctl -C rect -d 0
>>>>>>>>>> rect: 1000x2000@0x0
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Yunke Cao <yunkec@google.com>
>>>>>>>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>>>>>>>> ---
>>>>>>>>>>     utils/v4l2-ctl/v4l2-ctl-common.cpp | 12 ++++++++++++
>>>>>>>>>>     1 file changed, 12 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>>>>>>>> index 40667575fcc7..538e1951cf81 100644
>>>>>>>>>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>>>>>>>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>>>>>>>> @@ -614,6 +614,10 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
>>>>>>>>>>     		case V4L2_CTRL_TYPE_AREA:
>>>>>>>>>>     			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
>>>>>>>>>>     			break;
>>>>>>>>>> +		case V4L2_CTRL_TYPE_RECT:
>>>>>>>>>> +			printf("%ux%u@%dx%d", ctrl.p_rect->width, ctrl.p_rect->height,
>>>>>>>>>
>>>>>>>>> I find this notation ambiguous, it's not immediately clear when reading
>>>>>>>>> 10x10@20x20 if we're looking at a 10x10 rectangle positioned at (20,20)
>>>>>>>>> or the other way around. media-ctl use (20,20)/10x10 which I think would
>>>>>>>>> be a better notation.
>>>>>>>>
>>>>>>>> Good point, I agree.
>>>>>>>>
>>>>>>>> Ming Qian, can you also update patch 1/4 of the kernel patch series to
>>>>>>>> use the same formatting when logging the V4L2_CTRL_TYPE_RECT value?
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>>
>>>>>>>> 	Hans
>>>>>>>
>>>>>>> There is a issue in v4l2-utils, that ',' is the ending flag in
>>>>>>> v4l_getsubopt(), then I can't set the rect control,
>>>>>>> for example:
>>>>>>>
>>>>>>> $v4l2-ctl -d 0 -c rect="(0,0)/1000x2000"
>>>>>>> control '0)/1000x2000' without '='
>>>>>>
>>>>>> The should be fixable in v4l_getsubopt().
>>>>>>
>>>>>
>>>>> I can see the following comments of v4l_getsubopt(),
>>>>>
>>>>>      Parse comma separated suboption from *OPTIONP and match against
>>>>>      strings in TOKENS.
>>>>>
>>>>> I am not sure if we can change it.
>>>>
>>>> I think we can improve quotes handling by considering quoted substrings
>>>> as a single value, ignoring commas. Hans any opinion ?
>>
>> I think commas are hard to parse. Note that v4l_getsubopt is normally a
>> #define for getsubopt from glibc. So you can't change the behavior of
>> that function.
> 
> Can't we ? Isn't it an internal function ?

No. It's there when it is compiled for systems without glibc.

But I guess we can just use our copy all the time.

> 
>> I propose this format for parsing instead:
>>
>> widthxheight@(top;left)
>>
>> e.g.: 1000x2000@(0;0)
>>
>> According to this:
>> https://www.dr-aart.nl/Geometry-coordinates.html
>>
>> the ';' is the separator in countries where a decimal comma is used
>> instead of a decimal point.
>>
>> I prefer to have the position after the size of the rectangle, for two
>> reasons: it feels more natural to talk about a 'rectangle of size S at position
>> P', and it also makes it possible to allow a variant where only the size
>> is given and the position will default to (0;0). I.e., we can support
>> parsing either "widthxheight" or "widthxheight@(top;left)".
>>
>> However, logging rectangles in the kernel should use a comma instead of a
>> semicolon. Inside v4l-utils just consistently use the semicolon.
>>
>> What do you think, Laurent?
> 
> We have a precedent of using (x,y)/WxH , both in the kernel and in
> media-ctl. Breaking that with another syntax would cause trouble,
> especially having different syntaxes between media-ctl and v4l2-ctl.
> Think about the shell scripts that would need to convert from one syntax
> to another for instance. I would very strongly like to avoid that.

Have we used that notation in the kernel? Where?

I will admit that I am not a fan of the media-ctl notation, I think it is
weird. I think WxH@(x,y) is much more natural. But if v4l_getsubopt can be
adapted for this, then I'm fine with it.

Regards,

	Hans

> 
>>> How about omitting the commas between the brackets when parsing subopt?
>>>
>>>
>>>>>>>>>> +			       ctrl.p_rect->left, ctrl.p_rect->top);
>>>>>>>>>> +			break;
>>>>>>>>>>     		default:
>>>>>>>>>>     			printf("unsupported payload type");
>>>>>>>>>>     			break;
>>>>>>>>>> @@ -702,6 +706,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
>>>>>>>>>>     	case V4L2_CTRL_TYPE_AREA:
>>>>>>>>>>     		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
>>>>>>>>>>     		break;
>>>>>>>>>> +	case V4L2_CTRL_TYPE_RECT:
>>>>>>>>>> +		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
>>>>>>>>>> +		break;
>>>>>>>>>>     	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>>>>>>>>>     		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
>>>>>>>>>>     		break;
>>>>>>>>>> @@ -1279,6 +1286,11 @@ void common_set(cv4l_fd &_fd)
>>>>>>>>>>     					sscanf(set_ctrl.second.c_str(), "%ux%u",
>>>>>>>>>>     					       &ctrl.p_area->width, &ctrl.p_area->height);
>>>>>>>>>>     					break;
>>>>>>>>>> +				case V4L2_CTRL_TYPE_RECT:
>>>>>>>>>> +					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
>>>>>>>>>> +					       &ctrl.p_rect->width, &ctrl.p_rect->height,
>>>>>>>>>> +					       &ctrl.p_rect->left, &ctrl.p_rect->top);
>>>>>>>>>> +					break;
>>>>>>>>>>     				default:
>>>>>>>>>>     					fprintf(stderr, "%s: unsupported payload type\n",
>>>>>>>>>>     							qc.name);
> 


