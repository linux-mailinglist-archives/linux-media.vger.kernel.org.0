Return-Path: <linux-media+bounces-20890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BA09BC808
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88FCFB220B2
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E941CEAA3;
	Tue,  5 Nov 2024 08:30:48 +0000 (UTC)
X-Original-To: linux-media@vger.Kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A81F19047D
	for <linux-media@vger.Kernel.org>; Tue,  5 Nov 2024 08:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730795447; cv=none; b=WnMi/hCZJ3aLnUei4H3OmzrkppP2hdDhz0ml8IyZpAoWu9joUpQgM67DS3bzCMejOgLHqTvoIUud7PXglL8QyyGHIpRdOytxMKa3tMBB0gWtGWYjrCkEJV70qfgpx0fZGa2YO+9BTZ8mEfhTQuAWqEvdBDoWfP2kNL2+9melOl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730795447; c=relaxed/simple;
	bh=nUpPxsFJsFFS/e56LCVuDFPzROKtmnSwlma1DL1jft8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6zyavDhmpZJok+7i0pLToqb7wqOAhPm74gkTZkbGGM+d96aAVdHuVSATh0L/eVBOPK/fiHv9h4jyEtAD7EtkpnuYYAPDVbk+F5tEWzWHR1Kz83BtdKB4RuHv1Yd5acm9R393+o3SwY3Ox+5v832G78DuK1piKDbMn5usb2Z7Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B1CC4CECF;
	Tue,  5 Nov 2024 08:30:44 +0000 (UTC)
Message-ID: <d7818bb6-ffd8-41a7-bb2b-90ed20b44e40@xs4all.nl>
Date: Tue, 5 Nov 2024 09:30:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.Kernel.org, tfiga@chromium.org, ribalda@chromium.org,
 yunkec@google.com, xiahong.bao@nxp.com, ming.zhou@nxp.com,
 eagle.zhou@nxp.com, tao.jiang_2@nxp.com, ming.qian@nxp.com
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
 <20241030024307.1114787-3-ming.qian@oss.nxp.com>
 <20241030090330.GS22600@pendragon.ideasonboard.com>
 <12913e54-9343-42ab-ab1e-a33656e640af@xs4all.nl>
 <81b3dcb1-3c3a-41bc-895b-05657191b980@oss.nxp.com>
 <20241031093403.GA2473@pendragon.ideasonboard.com>
 <aeff111c-caac-425a-8152-a90ae04980ae@oss.nxp.com>
 <20241031100920.GC2473@pendragon.ideasonboard.com>
 <8c5f9e10-538d-4dd8-a9ad-f81a5bb08185@oss.nxp.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <8c5f9e10-538d-4dd8-a9ad-f81a5bb08185@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2024 02:24, Ming Qian(OSS) wrote:
> Hi Laurent and Hans,
> 
> On 2024/10/31 18:09, Laurent Pinchart wrote:
>> On Thu, Oct 31, 2024 at 05:46:49PM +0800, Ming Qian(OSS) wrote:
>>> On 2024/10/31 17:34, Laurent Pinchart wrote:
>>>> On Thu, Oct 31, 2024 at 05:19:02PM +0800, Ming Qian(OSS) wrote:
>>>>> On 2024/10/30 17:19, Hans Verkuil wrote:
>>>>>> On 30/10/2024 10:03, Laurent Pinchart wrote:
>>>>>>> On Wed, Oct 30, 2024 at 11:43:06AM +0900, ming.qian@oss.nxp.com wrote:
>>>>>>>> From: Yunke Cao <yunkec@google.com>
>>>>>>>>
>>>>>>>> Tested with VIVID
>>>>>>>>
>>>>>>>>     ./v4l2-ctl -C rect -d 0
>>>>>>>> rect: 300x400@200x100
>>>>>>>>
>>>>>>>>     ./v4l2-ctl -c rect=1000x2000@0x0
>>>>>>>>     ./v4l2-ctl -C rect -d 0
>>>>>>>> rect: 1000x2000@0x0
>>>>>>>>
>>>>>>>> Signed-off-by: Yunke Cao <yunkec@google.com>
>>>>>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>>>>>> ---
>>>>>>>>     utils/v4l2-ctl/v4l2-ctl-common.cpp | 12 ++++++++++++
>>>>>>>>     1 file changed, 12 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>>>>>> index 40667575fcc7..538e1951cf81 100644
>>>>>>>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>>>>>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>>>>>> @@ -614,6 +614,10 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
>>>>>>>>     		case V4L2_CTRL_TYPE_AREA:
>>>>>>>>     			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
>>>>>>>>     			break;
>>>>>>>> +		case V4L2_CTRL_TYPE_RECT:
>>>>>>>> +			printf("%ux%u@%dx%d", ctrl.p_rect->width, ctrl.p_rect->height,
>>>>>>>
>>>>>>> I find this notation ambiguous, it's not immediately clear when reading
>>>>>>> 10x10@20x20 if we're looking at a 10x10 rectangle positioned at (20,20)
>>>>>>> or the other way around. media-ctl use (20,20)/10x10 which I think would
>>>>>>> be a better notation.
>>>>>>
>>>>>> Good point, I agree.
>>>>>>
>>>>>> Ming Qian, can you also update patch 1/4 of the kernel patch series to
>>>>>> use the same formatting when logging the V4L2_CTRL_TYPE_RECT value?
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> 	Hans
>>>>>
>>>>> There is a issue in v4l2-utils, that ',' is the ending flag in
>>>>> v4l_getsubopt(), then I can't set the rect control,
>>>>> for example:
>>>>>
>>>>> $v4l2-ctl -d 0 -c rect="(0,0)/1000x2000"
>>>>> control '0)/1000x2000' without '='
>>>>
>>>> The should be fixable in v4l_getsubopt().
>>>>
>>>
>>> I can see the following comments of v4l_getsubopt(),
>>>
>>>      Parse comma separated suboption from *OPTIONP and match against
>>>      strings in TOKENS.
>>>
>>> I am not sure if we can change it.
>>
>> I think we can improve quotes handling by considering quoted substrings
>> as a single value, ignoring commas. Hans any opinion ?

I think commas are hard to parse. Note that v4l_getsubopt is normally a
#define for getsubopt from glibc. So you can't change the behavior of
that function.

I propose this format for parsing instead:

widthxheight@(top;left)

e.g.: 1000x2000@(0;0)

According to this:
https://www.dr-aart.nl/Geometry-coordinates.html

the ';' is the separator in countries where a decimal comma is used
instead of a decimal point.

I prefer to have the position after the size of the rectangle, for two
reasons: it feels more natural to talk about a 'rectangle of size S at position
P', and it also makes it possible to allow a variant where only the size
is given and the position will default to (0;0). I.e., we can support
parsing either "widthxheight" or "widthxheight@(top;left)".

However, logging rectangles in the kernel should use a comma instead of a
semicolon. Inside v4l-utils just consistently use the semicolon.

What do you think, Laurent?

Regards,

	Hans

>>
> 
> How about omitting the commas between the brackets when parsing subopt?
> 
> 
>>>>>>>> +			       ctrl.p_rect->left, ctrl.p_rect->top);
>>>>>>>> +			break;
>>>>>>>>     		default:
>>>>>>>>     			printf("unsupported payload type");
>>>>>>>>     			break;
>>>>>>>> @@ -702,6 +706,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
>>>>>>>>     	case V4L2_CTRL_TYPE_AREA:
>>>>>>>>     		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
>>>>>>>>     		break;
>>>>>>>> +	case V4L2_CTRL_TYPE_RECT:
>>>>>>>> +		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
>>>>>>>> +		break;
>>>>>>>>     	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>>>>>>>     		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
>>>>>>>>     		break;
>>>>>>>> @@ -1279,6 +1286,11 @@ void common_set(cv4l_fd &_fd)
>>>>>>>>     					sscanf(set_ctrl.second.c_str(), "%ux%u",
>>>>>>>>     					       &ctrl.p_area->width, &ctrl.p_area->height);
>>>>>>>>     					break;
>>>>>>>> +				case V4L2_CTRL_TYPE_RECT:
>>>>>>>> +					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
>>>>>>>> +					       &ctrl.p_rect->width, &ctrl.p_rect->height,
>>>>>>>> +					       &ctrl.p_rect->left, &ctrl.p_rect->top);
>>>>>>>> +					break;
>>>>>>>>     				default:
>>>>>>>>     					fprintf(stderr, "%s: unsupported payload type\n",
>>>>>>>>     							qc.name);
>>


