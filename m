Return-Path: <linux-media+bounces-3849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD54831796
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 11:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65A2E28865B
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 10:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C6623746;
	Thu, 18 Jan 2024 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EbpbwwF3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1737422F0B
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 10:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705575532; cv=none; b=ul2mNHJ0wLXhfGhCwRH6yuTGR0vgN8P7TWdU6zZfkA4enVi7e96nWAJAuxeYgNgoeZJWDqMa+8G8tgU712mb2wzhzfMP73fA7PTLhykrRPYoh8W5BC0lWP8UfgNXuCrkjsBEmqaFxcgUkRSX5d1X15VfOGdbxZzK4x1CiffglBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705575532; c=relaxed/simple;
	bh=CBz5HH5hcMrMzsMg3B/yX+y6xe0GYR91iVWBPUXFNxk=;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=mrpQIiy+erI8wWz1l+H8A4iRrHqMm4gqX2TWatUH0V/8NEyy3nFcZ/C3sTnnWvKT5uEmOAsErZlab8wz1op80FY5xBErNncI5lZZiwyNGyHPZqQ4DmV4jv4Ka4CHcxwsrY9YHtaG0lrB+wXDUqKVBAfasehItnvr9Z01TtYr61I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EbpbwwF3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1756674;
	Thu, 18 Jan 2024 11:57:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705575458;
	bh=CBz5HH5hcMrMzsMg3B/yX+y6xe0GYR91iVWBPUXFNxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EbpbwwF3Jza1fcqcWNgU5iGMtyy9TIaLREaSop6aql+2IFjwKJgNcf+UGlm93le+U
	 0bJFC8tAI6cloz55RyILff9n6+/5eZq5yQuq3dqDibmGflpzlSwetO5DjEm22QZj+t
	 jrrRwqHBsgKLKe7lVDnQcCX7Oz611bHiTWKBHyZ4=
Message-ID: <9350d6aa-08c6-4349-8039-a324db7f3267@ideasonboard.com>
Date: Thu, 18 Jan 2024 10:58:44 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] v4l2-ctl: Add --try-routing option
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 tomi.valkeinen@ideasonboard.com
References: <20240117130805.939312-1-dan.scally@ideasonboard.com>
 <20240117132150.GF4860@pendragon.ideasonboard.com>
 <b02a0566-d736-4479-ba81-3e6fa823e2cb@ideasonboard.com>
 <20240118104857.GK4860@pendragon.ideasonboard.com>
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20240118104857.GK4860@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Laurent

On 18/01/2024 10:48, Laurent Pinchart wrote:
> Hi Dan,
>
> On Thu, Jan 18, 2024 at 10:27:45AM +0000, Dan Scally wrote:
>> On 17/01/2024 13:21, Laurent Pinchart wrote:
>>> On Wed, Jan 17, 2024 at 01:08:04PM +0000, Daniel Scally wrote:
>>>> v4l2-ctl's --list-subdev-mbus-codes option sets the which flag to
>>>> V4L2_SUBDEV_FORMAT_TRY, which is an entirely reasonable choice, but
>>>> means it's currently impossible to list mbus codes for pads that are
>>>> only part of inactive routes as the --set-routing option sets ACTIVE
>>>> routing rather than TRY.
>>>>
>>>> Add a --try-routing option that has identical functionality to the
>>>> existing --set-routing but which uses the TRY format instead.
>>> I don't think this will help fixing your problem. They TRY context is
>>> local to the file handle, v4l2-ctl will never seen the TRY routes you
>>> set here.
>> It sees them provided you use both functions in the same run of the program. So for example this
>> won't work because the file is closed in between the two:
>>
>> v4l2-ctl -d /dev/v4l-subdev2 --try-routing "0/0->1/0[0],2/0->1/0[1]"
>>
>> v4l2-ctl -d /dev/v4l-subdev2 --list-subdev-mbus-codes pad=2
>>
>>
>> But this works just fine, because it's kept open throughout:
>>
>>
>> v4l2-ctl -d /dev/v4l-subdev2 --try-routing "0/0->1/0[0],2/0->1/0[1]" --list-subdev-mbus-codes pad=2
> You're absolutely right. For some reason I thought this was for
> media-ctl... I need to wake up before reviewing patches.
>
> The only thing that bothers me a bit is that I think it would have been
> nicer to add an option to select the TRY state globally instead of
> ACTIVE, but as we already have --try-subdev-fmt and
> --try-subdev-selection, I suppose I already missed the opportunity.
Yes I agree a global --try or --state=try or something would have been nice.
>
>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> ---
>>>>    utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 11 +++++++----
>>>>    utils/v4l2-ctl/v4l2-ctl.cpp        |  1 +
>>>>    utils/v4l2-ctl/v4l2-ctl.h          |  1 +
>>>>    3 files changed, 9 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
>>>> index 86e6c689..48b79288 100644
>>>> --- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
>>>> +++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
>>>> @@ -96,7 +96,8 @@ void subdev_usage()
>>>>    	       "  --set-subdev-fps pad=<pad>,stream=<stream>,fps=<fps> (for testing only, otherwise use media-ctl)\n"
>>>>    	       "                     set the frame rate [VIDIOC_SUBDEV_S_FRAME_INTERVAL]\n"
>>>>    	       "  --get-routing      Print the route topology\n"
>>>> -	       "  --set-routing <routes>\n"
>>>> +	       "  --set-routing      (for testing only, otherwise use media-ctl)\n"
>>>> +	       "  --try-routing <routes>\n"
>>>>    	       "                     Comma-separated list of route descriptors to setup\n"
>>>>    	       "\n"
>>>>    	       "Routes are defined as\n"
>>>> @@ -458,14 +459,16 @@ void subdev_cmd(int ch, char *optarg)
>>>>    			}
>>>>    		}
>>>>    		break;
>>>> -	case OptSetRouting: {
>>>> +	case OptSetRouting:
>>>> +	case OptTryRouting: {
>>>>    		struct v4l2_subdev_route *r;
>>>>    		char *end, *ref, *tok;
>>>>    		unsigned int flags;
>>>>    
>>>>    		memset(&routing, 0, sizeof(routing));
>>>>    		memset(routes, 0, sizeof(routes[0]) * NUM_ROUTES_MAX);
>>>> -		routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>>> +		routing.which = ch == OptSetRouting ? V4L2_SUBDEV_FORMAT_ACTIVE :
>>>> +				      V4L2_SUBDEV_FORMAT_TRY;
>>>>    		routing.num_routes = 0;
>>>>    		routing.routes = (__u64)routes;
>>>>    
>>>> @@ -683,7 +686,7 @@ void subdev_set(cv4l_fd &_fd)
>>>>    					fival.interval.denominator, fival.interval.numerator);
>>>>    		}
>>>>    	}
>>>> -	if (options[OptSetRouting]) {
>>>> +	if (options[OptSetRouting] || options[OptTryRouting]) {
>>>>    		if (!_fd.has_streams()) {
>>>>    			printf("Streams API not supported.\n");
>>>>    			return;
>>>> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
>>>> index e195ad8e..f9121284 100644
>>>> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
>>>> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
>>>> @@ -65,6 +65,7 @@ static struct option long_options[] = {
>>>>    	{"set-fmt-video-out", required_argument, nullptr, OptSetVideoOutFormat},
>>>>    	{"try-fmt-video-out", required_argument, nullptr, OptTryVideoOutFormat},
>>>>    	{"get-routing", no_argument, 0, OptGetRouting},
>>>> +	{"try-routing", required_argument, 0, OptTryRouting},
>>>>    	{"set-routing", required_argument, 0, OptSetRouting},
> I'd put try after set, like you do above.
>
>>>>    	{"help", no_argument, nullptr, OptHelp},
>>>>    	{"help-tuner", no_argument, nullptr, OptHelpTuner},
>>>> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
>>>> index cc7f1184..6382619c 100644
>>>> --- a/utils/v4l2-ctl/v4l2-ctl.h
>>>> +++ b/utils/v4l2-ctl/v4l2-ctl.h
>>>> @@ -193,6 +193,7 @@ enum Option {
>>>>    	OptShowEdid,
>>>>    	OptFixEdidChecksums,
>>>>    	OptGetRouting,
>>>> +	OptTryRouting,
> Same here. With that,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Thanks!
>
> I can push this patch with those small changes if you're fine with that.
That's absolutely fine by me.
>
>>>>    	OptSetRouting,
>>>>    	OptFreqSeek,
>>>>    	OptEncoderCmd,

