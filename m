Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D0540C42C
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 13:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237236AbhIOLLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 07:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237548AbhIOLLc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 07:11:32 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE7AC061574
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 04:10:13 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QSnomNW1IcSrkQSnpmyt0l; Wed, 15 Sep 2021 13:10:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631704209; bh=TmRXfcf9w5tstsOxgzgQPbsExq5/o8ZSD2vkjhS2/0Y=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=M+Kc2mj8US7mXs0Et4AiyzWOc6v568lK8FYE9oeofGkGoXogwcYRniLkoUknTMrtr
         ytfbfbkVKmdZm6OLHSuN4IufIqy8KUP2uwo/pmgjTfOvfPnzzJP1tOj4TWRFbdWzvv
         bxVnze5GCUw8s5S92nUtF/E6GkRs7fH6K/UG0UlbpS9US0GIS+Uk+cggaqL4AQ8oSm
         11u5OktM6MpMlOddxphF2wGQTARQrRt+QaHEx6ixjqgVDL4903mUOVIvXofesQL4oW
         Grio4vMFbGRWkkBgJx4+dpF4T6EHC59B3qiv9P58vzx37kqKLixr8m81N3yhM7xdxf
         yt4sC/KdQOivA==
Subject: Re: [PATCH 05/11] edid-decode: fix standard timing vertical pixels
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     joevt <joevt@shaw.ca>
Cc:     linux-media@vger.kernel.org
References: <20210914121129.51451-1-joevt@shaw.ca>
 <20210914121129.51451-6-joevt@shaw.ca>
 <075b28bd-35a0-5acb-3cc2-383c8533c031@xs4all.nl>
Message-ID: <95b0735e-da3a-09d4-78fd-c36db5791912@xs4all.nl>
Date:   Wed, 15 Sep 2021 13:10:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <075b28bd-35a0-5acb-3cc2-383c8533c031@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDtCCyhwUBRmpUsgDb6jzrotCwM/phGCdaiIvGQGf0WzmIJQYpqfUx7FENfdD1+SkGWapciVlORVKPFfNebSnx2eLvjV6XE8vZwtMp7YNHLq1axUMKX+
 xL7U9gIsdJHCjeXsjKI533sj5i0UCW4kpvYWNmspupM2c3yTaA4XOO3NtSkW9AUY9SQNmdSDn+PuCBnU9YLJ9J8SvNHTUpO69xDFuyhQnNP3NDUsiBgeDgBi
 eItu3hz30lqzpVyLK7c9NAGLKNiQINPWCqbGAgHVhPJjwZvI0h7TjthqTTS6RovyLVKTrHTsDKICoOok23YQbw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/09/2021 12:08, Hans Verkuil wrote:
> On 14/09/2021 14:11, joevt wrote:
>> Don't do ceiling to nearest 8 pixels for active vertical lines. See examples elo-4600l-hdmi and kogan-kaled24144f-hdmi.
>>
>> Section 3.9 and 3.10.3.6 of EDID 1.4 does not say vertical lines must be a multiple of 8.  This line of code appears to have been added to satisfy the 3rd example in VTB-EXT spec but that example has an incorrect HAP indicator decimal value so it cannot be trusted. Also, all 3 examples have an incorrect vertical refresh value as noted in parse-vtb-ext-block.cpp. The VESA DMT spec has the following examples that are not a multiple of 8 lines which support this change:
>> 1400x1050 4:3
>> 1440x900 16:10
>> 1600x900 16:9
>> 1680x1050 16:10
>>
>> Signed-off-by: Joe van Tunen <joevt@shaw.ca>
>> ---
>>  parse-base-block.cpp | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/parse-base-block.cpp b/parse-base-block.cpp
>> index e2901a6..32d2079 100644
>> --- a/parse-base-block.cpp
>> +++ b/parse-base-block.cpp
>> @@ -573,7 +573,6 @@ void edid_state::print_standard_timing(const char *prefix, unsigned char b1, uns
>>  		break;
>>  	}
>>  	vact = (double)hact * vratio / hratio;
>> -	vact = 8 * ((vact + 7) / 8);
> 
> I need to look closer at this. I think it was added to help with 1360x768, which without
> this line maps to 1360x765.
> 
> I'll get back to you on this.

I did some more reading on this, and appendix D of the EDID 1.4 spec
says this (D-8):

"If calculated aspect ratio is not 16 : 10 AR, 4 : 3 AR, 5 : 4 AR or 16 : 9 AR
 what timing description should be used?"

"Ref.: Section 3.9 (E-EDID Standard Release A, Revision 2)
 The Standard Timings Identification code may not be used to
 identify timings which do not match one of these standard aspect
 ratios. Support for such timings must be indicated elsewhere,
 e.g., by use of a Detailed Timing Descriptor."

So you are correct with your change, but I think it would make
sense to add a new check:

// See also Ref. D-8 in the EDID-1.4 spec
if (vact & 1)
	warn("Standard Timing %ux%u has a dubious odd vertical resolution.\n", hact, vact);

So that way an attempt to use ST to describe 1360x768 will result in a warning.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>  	refresh = (b2 & 0x3f) + 60;
>>  
>>  	formula.hact = hact;
>>
> 

