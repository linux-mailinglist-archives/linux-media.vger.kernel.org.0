Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0754365852
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhDTMEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:04:47 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35421 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230118AbhDTMEq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:04:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Yp6wlXcgL8K3KYp6zlzVd5; Tue, 20 Apr 2021 14:04:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618920253; bh=hOjRdcVj/vhC8QEJJK2RYHYHr0CLQHqjNWi1pVmSYoA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fAPcB6T9UvBNirxHTMGn2rs0Rehy/FF3+NYIYI8wmk2pkMSpWBKuOicdnnYA922S7
         RTfZ4cH+c0uNOHIZC/54UEX6jTJjiY0xVB6lXWCLXIYJSmGF0Fyu97UGTvvE1sHjrr
         XZDf5XPFyl2ZN0H+Tpi0+RqN72kHLve/BcxBSEefg/N+urHtM3C3SQCoua1lKD0AgX
         bI+JeayI4U/Wtv0ebtQfP7VLt2YavfSMJOBRUn7fSXpbQuUwsHfDVSSTpzJ6ZAKfzR
         tE/8y76g+cOWGx4V639I9TVLBnbpk8mLXw+zznxkSNv3YB0mxhJAfAd1ddvnxfyW4/
         ZvHaGKr9vv8cQ==
Subject: Re: [PATCH] media: atomisp: silence "dubious: !x | !y" warning
To:     Ashish Kalra <eashishkalra@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20210417153627.GA50228@ashish-NUC8i5BEH>
 <20210417205613.5c1aac74@coco.lan> <20210418012648.GA4821@ashish-NUC8i5BEH>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5abf96ba-b73f-005f-f489-81c6e3a57648@xs4all.nl>
Date:   Tue, 20 Apr 2021 14:04:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210418012648.GA4821@ashish-NUC8i5BEH>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCeDK+lIdYygSjSbwF3EraPHGthWBShAeXh/SHt0WbKm2m9F0LVGg2KktfY9PnncxcIPo5bQ/KhijIl50OKsO6rMgwQHUf/kbpoHmMNuRWeuPPiSHvY9
 ZRK48KJNCB+vSkr6Yo1TMgUjL5dhyxNCsAYsth61/Yf1HqKSj57PcdcQc4GD1Vr2q+Ig8CL6iwpFdFSpsz0u5g9Ua+lo30bxOV4gdxs1COPsRhYQVPH1hbRe
 0FR7lq4R+SUDfes9sVxblffz45fKlHE711XuBukD9LIEjfPO691IguUK7JMMGNqyT+s/ApoN8vkeo724vgI/xiAmmpy3ic6WEJ9n6HNHqbEn4c/t0lOie/XY
 NxbAQwM7ie2+BPRhnLgQ3LFsry8ng6SCNAx3taeOsZyWP9A2x7S5VX98q9hBcuN5dAzh7fDK
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ashish,

On 18/04/2021 03:26, Ashish Kalra wrote:
> On Sat, Apr 17, 2021 at 08:56:13PM +0200, Mauro Carvalho Chehab wrote:
>> Em Sat, 17 Apr 2021 21:06:27 +0530
>> Ashish Kalra <eashishkalra@gmail.com> escreveu:
>>
>>> Upon running sparse, "warning: dubious: !x | !y" is brought to notice
>>> for this file.  Logical and bitwise OR are basically the same in this
>>> context so it doesn't cause a runtime bug.  But let's change it to
>>> logical OR to make it cleaner and silence the Sparse warning.
>>>
>>> Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
>>> ---
>>>  .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
>>> index 358cb7d2cd4c..3b850bb2d39d 100644
>>> --- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
>>> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
>>> @@ -58,7 +58,7 @@ sh_css_vf_downscale_log2(
>>>  	unsigned int ds_log2 = 0;
>>>  	unsigned int out_width;
>>>  
>>> -	if ((!out_info) | (!vf_info))
>>> +	if ((!out_info) || (!vf_info))
>>
>>
>> While here, please get rid of the unneeded parenthesis:
>>
>> 	if (!out_info || !vf_info)
>>
>>
>>>  		return -EINVAL;
>>>  
>>>  	out_width = out_info->res.width;
>>
>>
>>
>> Thanks,
>> Mauro
> Updated Patch as per your feedback

Please don't post patches as an attachment. Just post it inline as you did the
first time, but with Subject prefix [PATCHv2].

Thanks!

	Hans
