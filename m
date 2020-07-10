Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9571721B71E
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 15:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgGJNvG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 09:51:06 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53791 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726496AbgGJNvF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 09:51:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ttQZjnQQ0JcNHttQdjs9GC; Fri, 10 Jul 2020 15:51:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594389063; bh=R5hYtohruIKhl3XDgcqW64CjgVYva1o/gfQHf1KFFBA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=oWe2ngTlb5gHbFVcaK6kM6Ovb7CcWU70BzNIiXCuwfBLXX7aeUKjkYcmO1+BGvQGn
         tWHHnL4c5G3/808j+eTZWEdwgR92VevsuX5alzV3yr+oVXgzQG/Pq8O2dt9NMHD20v
         6K0FmPOLsW1hRpIoGX1wuxi8QCF1tbcZBBVgU7cT8d0NlYXAOzmWiUIyQNnXGhfEGJ
         utLP3gQ16rZ6E3REFzq1hElhrkTVqX9FeVUJTpL0x5slC9u1dGWcwVc+8u3zwvSJBe
         62QNLGlIZEJn6/sRww06cNlcrOxnjg1EZ54MEc01gnfDGr6oI4e8aZM833mMeRyiTk
         l2sk+SFVLKyuA==
Subject: Re: [PATCH 1/2] v4l2-compliance: Add version command
To:     paul.elder@ideasonboard.com
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
References: <20200710131813.452513-1-paul.elder@ideasonboard.com>
 <20200710132536.GX5964@pendragon.ideasonboard.com>
 <3b0dd8f8-00b0-2a94-f040-c9619a99e201@xs4all.nl>
 <20200710134416.GG66701@pyrite.rasen.tech>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e0fcae18-9b89-aa98-20b6-713e69297357@xs4all.nl>
Date:   Fri, 10 Jul 2020 15:50:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200710134416.GG66701@pyrite.rasen.tech>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfELSYx53ZZ0xs1OKD7wiNwhG0ZJvBfi+xw3YhQTqUl62kVqD6aARMVcQWxXtf4fwfidiTFjU1ycCrtVUAGPu4eSJF/XxfHK9L5NoACeUWUOtoTGIGJIW
 +RKXwO+Wvihq47WfIKqFiuBqiB+hhok26pdtSz6xx6Ady1KydwiMi8OtQrqykzpcQsP2xiYqau3Ylk/FSGYDfzImJ+7BP1eiP9MYb7yuK7YI1YwNgms6EA2c
 3ep62INskelo7H4Rs/UZ3mLHFYDCS2TH3iLPbQfYcTI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/07/2020 15:44, paul.elder@ideasonboard.com wrote:
> On Fri, Jul 10, 2020 at 03:33:25PM +0200, Hans Verkuil wrote:
>> On 10/07/2020 15:25, Laurent Pinchart wrote:
>>> Hi Paul,
>>>
>>> Thank you for the patch.
>>>
>>> On Fri, Jul 10, 2020 at 10:18:12PM +0900, Paul Elder wrote:
>>>> Add a --version option to v4l2-compliance to retrieve the version of
>>>> v4l2-compliance.
>>>>
>>>> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>>>> ---
>>>>  utils/v4l2-compliance/v4l2-compliance.cpp | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
>>>> index 4b45f110..72b9768f 100644
>>>> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
>>>> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
>>>> @@ -79,6 +79,7 @@ enum Option {
>>>>  	OptMediaBusInfo = 'z',
>>>>  	OptStreamFrom = 128,
>>>>  	OptStreamFromHdr,
>>>> +	OptVersion,
>>>>  	OptLast = 256
>>>>  };
>>>>  
>>>> @@ -153,9 +154,15 @@ static struct option long_options[] = {
>>>>  	{"stream-all-formats", optional_argument, 0, OptStreamAllFormats},
>>>>  	{"stream-all-io", no_argument, 0, OptStreamAllIO},
>>>>  	{"stream-all-color", required_argument, 0, OptStreamAllColorTest},
>>>> +	{"version", no_argument, 0, OptVersion},
>>>>  	{0, 0, 0, 0}
>>>>  };
>>>>  
>>>> +static void version()
>>>> +{
>>>> +	printf("v4l2-compliance " PACKAGE_VERSION "\n");
>>>
>>> Is it enough to rely on the v4l-utils package version, or should we add
>>> a git commit count as well ? The traditional version number will make it
>>> difficult to test for features added between two released versions.
> 
> Yeah, it might be useful.
> 
>> If you add a version option, then v4l2-compliance should also show the SHA.
>> It's already available (grep for SHA), so easy enough to add here.
> 
> Oh yeah we could use that.
> 
>> Also, if you add --version here, then it really should be added to most
>> other utils as well (certainly media-ctl and cec-follower/ctl/compliance).
> 
> Okay, I can add that.
> 
> For v4l2-ctl and the other tools, would it be better like:
> 
> v4l2-ctl 1.21.0-deadbeef
> 
> Or like what v4l2-compliance has:
> 
> v4l2-compliance SHA: 3b22ab02b960e4d1e90618e9fce9b7c8a80d814a, 64 bits, 64-bit time_t
> 
> v4l2-compliance 1.21.0

The SHA is only necessary for the compliance tests (v4l2/cec-compliance).
It's not needed for the others. The PACKAGE_VERSION is fine for non-compliance
utilities.

For v4l2/cec-compliance I would like to see this output:

v4l2-compliance 1.21.0
v4l2-compliance SHA: 3b22ab02b960e4d1e90618e9fce9b7c8a80d814a, 64 bits, 64-bit time_t

cec-compliance 1.21.0
cec-compliance SHA: 3b22ab02b960e4d1e90618e9fce9b7c8a80d814a

The SHA may not be available, in that case show "not available".

Regards,

	Hans

> 
> 
> 
> 
> 
> Thanks,
> 
> Paul
> 
>>>> +}
>>>> +
>>>>  static void usage()
>>>>  {
>>>>  	printf("Usage:\n");
>>>> @@ -244,6 +251,7 @@ static void usage()
>>>>  	printf("  -P, --no-progress  Turn off progress messages.\n");
>>>>  	printf("  -T, --trace        Trace all called ioctls.\n");
>>>>  	printf("  -v, --verbose      Turn on verbose reporting.\n");
>>>> +	printf("  --version          Show version information.\n");
>>>>  #ifndef NO_LIBV4L2
>>>>  	printf("  -w, --wrapper      Use the libv4l2 wrapper library.\n");
>>>>  #endif
>>>> @@ -1664,6 +1672,9 @@ int main(int argc, char **argv)
>>>>  		case OptNoProgress:
>>>>  			no_progress = true;
>>>>  			break;
>>>> +		case OptVersion:
>>>> +			version();
>>>> +			std::exit(EXIT_SUCCESS);
>>>>  		case ':':
>>>>  			fprintf(stderr, "Option `%s' requires a value\n",
>>>>  				argv[optind]);
>>>
>>

