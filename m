Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0091A348E1F
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 11:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhCYKis (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 06:38:48 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:33165 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230177AbhCYKih (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 06:38:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PNNolDPRKUzyrPNNrlVJYl; Thu, 25 Mar 2021 11:38:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616668715; bh=v1+yMKVeRCYikKmsamG47BU3T7Lmm1Z+kKu75a4f0bI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KwmdUtFSGqcOWfnIVtymPONlLAQ+Gwwar0AIUKFEuYRs0+lKBJXs2adg8O3g0a+2s
         czl/6VmRIC+p+l22N2jjs/CqEHAXmP35L/tUFhdAUFiqiXr1BUif16W5BL/yh0oO0Z
         dbs+QEvACHq3z05IhWRZzdnZVvJ+Btl6/OnGEZTfvuVRWkbmW1IqHyQdfKOfnljufp
         2ihd1votp4f7zyRst1IDdyvJPSKh1Kb97rMYDGMEHFSx9GCe42xvofj8ZCOlZLb7yy
         RiRtFfe1dGQZPxxLv9dKqROitVDHZc0YjTWMKMZHLRREO0ySpcKhzwoUuPUH1pmOiI
         r1HHhmoaDXgYg==
Subject: Re: [PATCH] adv7604: support EDIDs up to 4 blocks
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <00882808-472a-d429-c565-a701da579ead@xs4all.nl>
 <YFxldF7Eb0eE6dVi@oden.dyn.berto.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d006b693-9add-cd48-fd94-b15e559f9ee2@xs4all.nl>
Date:   Thu, 25 Mar 2021 11:38:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFxldF7Eb0eE6dVi@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAdLr11NTUF+WbW9VcJfVzRNuQY+xpR2f81sVTlKZgHVomg7UgHH2or0LDz/oB2WD7V/j4/Cw9ivKcuxbrnyTlM7kzWWeWLwj0jSWji808ELW+XZxzoi
 TAJLBwTrS25DJ0BcJHZMb+BG3VgAfMPXc9kHrttvcqoNl1TRWAecx4qTQ8EaUiF6tTP688hf3sIKFaZ+8lmSsQXmU90W1rQUfAKqq3nqxVZ63QuaWr0I1JOa
 Yp9osPBbCK9DTEMwEQthBw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/03/2021 11:27, Niklas Söderlund wrote:
> Hi Hans,
> 
> Thanks for your work.
> 
> On 2021-03-24 08:11:28 +0100, Hans Verkuil wrote:
>> While the adv7604/11/12 hardware supported EDIDs up to 4 blocks, the
>> driver didn't. This patch adds support for this. It also improves support
>> for EDIDs that do not have a Source Physical Address: in that case the
>> spa location is set to the first byte of the second block, and the
>> 'physical address' is just the two bytes at that location. This is per
>> the suggestion in the adv76xx documentation for such EDIDs.
>>
>> Tested with an adv7604 and adv7612.
> 
> I tested this on my Koelsch together with it's two buddies [1] and [2] 
> to verify that my capture tests still worked. They did not and 
> unfortunately they crashed the kernel instead. A quick check suggests 
> this patch (which I had first in my stack of the 3 patches on-top of 
> media-tree [3]) was the source. Running directly on media-tree and 
> things work as before.
> 
> I managed to reduce the TC to not even having to have a HDMI video 
> source attached just running v4l2-compliance was enough. I tested it 
> using both the latest master of v4l-utils [4] and the one I had on the 
> system since earlier [5] with the same result.
> 
> arm ~ # v4l2-compliance --version
> v4l2-compliance 1.21.0-4752, 32 bits, 32-bit time_t
> v4l2-compliance SHA: 162d4e7221ca 2021-03-25 07:35:09
> 

<snip>

>> @@ -2327,15 +2334,25 @@ static int adv76xx_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
>>  				__func__, edid->pad, state->edid.present);
>>  		return 0;
>>  	}
>> -	if (edid->blocks > 2) {
>> -		edid->blocks = 2;
>> +	if (info->type == ADV7604 && edid->blocks > ADV76XX_MAX_EDID_BLOCKS) {

Urgh, remove 'info->type == ADV7604 && '. That fixes it.

It's a left-over from an older version of the patch that I forgot to remove.

Luckily v4l2-compliance tests with 256 blocks so this was caught. I should have
run v4l2-compliance myself :-(

I'll post a v2.

Regards,

	Hans

>> +		edid->blocks = ADV76XX_MAX_EDID_BLOCKS;
>>  		return -E2BIG;
>>  	}
