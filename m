Return-Path: <linux-media+bounces-20567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BB69B5E95
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 10:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BDA71C21083
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 09:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044DD1CCEC2;
	Wed, 30 Oct 2024 09:19:14 +0000 (UTC)
X-Original-To: linux-media@vger.Kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903041E1C0F
	for <linux-media@vger.Kernel.org>; Wed, 30 Oct 2024 09:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730279953; cv=none; b=YVCZ57kD7N7TLCo3MCd6HJOWE3Ox0e+Cg/iLUXVlKIQIY8y8N1uQuWm+rdPgvoqEhJjANP8bj+re2lS8chJuYo8NumB7O/TsmajQxDeUaq2ocIGvV7oriEH5f4kS+0+UDQ0ZvvNvymN2YdbcfMm4zT4CYPo74T0YtewL3j31v0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730279953; c=relaxed/simple;
	bh=iJ3l1Kuard0SUHZQeiqsEfUH03d4hLPgDWLA8PBYh7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C1AE85t3XB6C8O5RGs9PFcMhHIRJVz5bQs/XHUgXeMk7gil1N5B2qPJXPFccOeJBMgkCV0QeCtghqID22wJhOhlamAjy5ADdnOwrmNG/6mcGYiuW0iys2PhoytCZj/JidY0yRJDxSY/GXUq4JtBGTdKQsli4uLM+3OkrhS32Ubg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B4DC4CEE4;
	Wed, 30 Oct 2024 09:19:10 +0000 (UTC)
Message-ID: <12913e54-9343-42ab-ab1e-a33656e640af@xs4all.nl>
Date: Wed, 30 Oct 2024 10:19:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ming.qian@oss.nxp.com
Cc: linux-media@vger.Kernel.org, tfiga@chromium.org, ribalda@chromium.org,
 yunkec@google.com, xiahong.bao@nxp.com, ming.zhou@nxp.com,
 eagle.zhou@nxp.com, tao.jiang_2@nxp.com, ming.qian@nxp.com
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
 <20241030024307.1114787-3-ming.qian@oss.nxp.com>
 <20241030090330.GS22600@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241030090330.GS22600@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/10/2024 10:03, Laurent Pinchart wrote:
> On Wed, Oct 30, 2024 at 11:43:06AM +0900, ming.qian@oss.nxp.com wrote:
>> From: Yunke Cao <yunkec@google.com>
>>
>> Tested with VIVID
>>
>>  ./v4l2-ctl -C rect -d 0
>> rect: 300x400@200x100
>>
>>  ./v4l2-ctl -c rect=1000x2000@0x0
>>  ./v4l2-ctl -C rect -d 0
>> rect: 1000x2000@0x0
>>
>> Signed-off-by: Yunke Cao <yunkec@google.com>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>>  utils/v4l2-ctl/v4l2-ctl-common.cpp | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>> index 40667575fcc7..538e1951cf81 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>> @@ -614,6 +614,10 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
>>  		case V4L2_CTRL_TYPE_AREA:
>>  			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
>>  			break;
>> +		case V4L2_CTRL_TYPE_RECT:
>> +			printf("%ux%u@%dx%d", ctrl.p_rect->width, ctrl.p_rect->height,
> 
> I find this notation ambiguous, it's not immediately clear when reading
> 10x10@20x20 if we're looking at a 10x10 rectangle positioned at (20,20)
> or the other way around. media-ctl use (20,20)/10x10 which I think would
> be a better notation.

Good point, I agree.

Ming Qian, can you also update patch 1/4 of the kernel patch series to
use the same formatting when logging the V4L2_CTRL_TYPE_RECT value?

Regards,

	Hans

> 
>> +			       ctrl.p_rect->left, ctrl.p_rect->top);
>> +			break;
>>  		default:
>>  			printf("unsupported payload type");
>>  			break;
>> @@ -702,6 +706,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
>>  	case V4L2_CTRL_TYPE_AREA:
>>  		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
>>  		break;
>> +	case V4L2_CTRL_TYPE_RECT:
>> +		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
>> +		break;
>>  	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>  		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
>>  		break;
>> @@ -1279,6 +1286,11 @@ void common_set(cv4l_fd &_fd)
>>  					sscanf(set_ctrl.second.c_str(), "%ux%u",
>>  					       &ctrl.p_area->width, &ctrl.p_area->height);
>>  					break;
>> +				case V4L2_CTRL_TYPE_RECT:
>> +					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
>> +					       &ctrl.p_rect->width, &ctrl.p_rect->height,
>> +					       &ctrl.p_rect->left, &ctrl.p_rect->top);
>> +					break;
>>  				default:
>>  					fprintf(stderr, "%s: unsupported payload type\n",
>>  							qc.name);
> 


