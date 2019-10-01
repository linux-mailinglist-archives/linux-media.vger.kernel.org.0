Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 764D4C2FDA
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 11:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729912AbfJAJRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 05:17:03 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:46155 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727957AbfJAJRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Oct 2019 05:17:03 -0400
Received: from [IPv6:2001:420:44c1:2577:10df:bfa0:cde1:e23a] ([IPv6:2001:420:44c1:2577:10df:bfa0:cde1:e23a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id FEHCil0qw9D4hFEHGiQrP3; Tue, 01 Oct 2019 11:17:02 +0200
Subject: Re: [PATCH v2] edid-decode: Avoid division by zero
To:     Breno Leitao <leitao@debian.org>
Cc:     linux-media@vger.kernel.org
References: <cc88ca6d-5608-5381-74b9-008c2a32afb3@debian.org>
 <ca1fd80c-02d1-f793-0906-239f020eac65@xs4all.nl>
 <e9bae40c-9a2c-067b-d547-cd1f1a528e25@debian.org>
 <3f362e23-7cf9-e93b-8c88-b7b6c5197230@xs4all.nl>
 <94eae8a9-54bb-8110-b6b8-ef4bca2e7fc8@debian.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <45b50c7f-a1ea-89a7-8484-a7332244944d@xs4all.nl>
Date:   Tue, 1 Oct 2019 11:16:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <94eae8a9-54bb-8110-b6b8-ef4bca2e7fc8@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAYhiS3n/4Oe8yTaGKQpEuvScBqC50wYs9WBd1uAFyYGe0W0AVOVAExFnq6u/o0SyN+FdeHr+EU9O4mrDyX4hzOjGxv50QpSnGt5JmXqg9ZLAcpnhJko
 s78Cxyx6htFa15AQeZwe80Gc1mvMSv+PJKqooRTvKlWnMIQ+JzSB4x8AlscsE6PSb3oCCTinh4JPOfn/j1n0hOduUcutm5o94Qe3/KTXoLfr4zBccF1pGZPt
 l4g5uwHBSj3m87chG170ltFvvy3ckKReJHIAILVsYYmxh+O7rA8sVshvrY3EeXBlJR/kuEi7ZzdMF6xc4IVzn+5jsp0aYnG4yKRvyDDsFbw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/1/19 11:15 AM, Breno Leitao wrote:
> Hi Hans,
> 
> On 01/10/2019 09:39, Hans Verkuil wrote:
>> On 10/1/19 10:10 AM, Breno Leitao wrote:
>>> There are some weird monitors that returns invalid data, as zeroed
>>> Horizontal/Vertical Active/Blanking.
>>
>> Do you have an EDID that does this? I'd like to add it to the collection
>> of EDIDs in edid-decode.
> 
> Yes, This is an example. Is this what you want?
> 
> # cat /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-HDMI-A-1/edid | hexdump
> 0000000 ff00 ffff ffff 00ff 8f15 4600 72f0 0000
> 0000010 171e 0301 6680 7839 602a a19d 4954 269b
> 0000020 470f 234a 0008 c081 4081 8081 0095 00b3
> 0000030 c0d1 c08b 0101 3a02 1880 3871 402d 2c58
> 0000040 0045 3dfa 0032 1e00 2166 aa56 0051 301e
> 0000050 8f46 0033 3dfa 0032 1e00 0000 fd00 3000
> 0000060 1f3e 0f50 0a00 2020 2020 2020 0000 fe00
> 0000070 3100 3242 3343 3050 3430 3035 200a a101
> 0000080 0302 401b 1647 0431 0119 1803 0923 0707
> 0000090 0183 0000 0366 000c 0020 0180 001d 2e7c
> 00000a0 a090 1a60 401e 2030 0036 0ba2 0032 1a00
> 00000b0 0000 f700 0a00 ca00 60e0 0000 0000 0000
> 00000c0 0000 0000 fc00 4500 4f4c 4520 3454 3036
> 00000d0 4c30 2020 0000 0000 0000 0000 0000 0000
> 00000e0 0000 0000 0000 0000 0000 0000 0000 0000
> 00000f0 0000 0000 0000 0000 0000 0000 0000 c100
> 0000100

Yes, that's fine. What is the brand/model of the display?

Regards,

	Hans

> 
>>
>> Some more nitpicks below:
>>
>>>
>>> This causes edid-decode to crash with a division by zero exception. This simple
>>> patch avoids so, checking for the divisor before proceeding.
>>>
>>> Signed-off-by: Breno Leitao <leitao@debian.org>
>>> ---
>>>  edid-decode.c | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/edid-decode.c b/edid-decode.c
>>> index 7442f8a..b932179 100644
>>> --- a/edid-decode.c
>>> +++ b/edid-decode.c
>>> @@ -1022,6 +1022,16 @@ static int detailed_block(const unsigned char *x, int in_extension)
>>>  		break;
>>>  	}
>>>  
>>> +	if (!ha || !hbl || !va || !vbl) {
>>> +		printf("Invalid Detailing Timings:\n"
>>
>> Detailing -> Detailed
>>
>>> +		       "Horizontal Active %4d\n"
>>> +		       "Horizontal Blanking %4d\n"
>>
>> This can be a bit more concise:
>>
>> 			"Horizontal Active/Blanking: %d/%d\n"
>>
>>> +		       "Vertical Active %4d\n"
>>> +		       "Vertical Blanking %4d\n",
>>
>> Ditto.
> 
> Ok, let me change it and send a v3.
> 

