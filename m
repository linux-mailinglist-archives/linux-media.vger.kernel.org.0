Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF93368F48
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 11:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbhDWJWj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 05:22:39 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:43771 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229456AbhDWJWi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 05:22:38 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Zs0bl016nvTEDZs0elcmaK; Fri, 23 Apr 2021 11:22:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619169721; bh=4i33cPq5YRlrGpo3f6T0iY7nVs8xwHxqgZTcEaiRlys=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VcdX/Zz6wZ64cvFSuzuAlo9UFk+M6yQ3OCgXaTotMPNTW7MkbmioqFoz1CnCbDH2y
         GBodOuefqbocRUS73rET96GqNq7TgAQhG91Eq48Nc9YUVTkuPGUw8/erAMlKFyo29i
         Wx1cj3hsj6wuBY4Y6lU2Oh0cb4i7yt9UcaTUtXwTJAxlZNeNEzWdqh2sXh/TlfW+Y2
         t5jMvFDDW74An57jEksIFtSl9tUQrAltAGG76H5YH9Pf2XNu0XGrCIkWm1WBPEvtLc
         KfWJ9cIZ3+yDLeX07krnawJqcPxwlLrZkVMpwThl+/G2M6R1FRrMLxS9iY6kdjKIVP
         JGqIIPNlbppLw==
Subject: Re: [Outreachy kernel] [PATCH v3] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
References: <20210421123718.GA4597@focaruja>
 <alpine.DEB.2.22.394.2104211507280.9436@hadrien>
 <7aeac7041a6f6d7b3d8563f0d0bf0a4d31f379b0.camel@gmail.com>
 <alpine.DEB.2.22.394.2104211555040.9436@hadrien>
 <16dd7a16a8cc69aa0f81dd6bf47f09e878c71a6b.camel@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d2cfc472-d3ac-fd47-aa0c-ed6414f671fc@xs4all.nl>
Date:   Fri, 23 Apr 2021 11:21:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <16dd7a16a8cc69aa0f81dd6bf47f09e878c71a6b.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFg8zDW66Qc5exL+94pEGtwkZUK5dwl/4XxeSs55yNAO6xWqR6mWZzZxIkspH6Guqm1cswU2CpzcvkW9A+Itu/Bl/G1ivMjMGof/wUNYGzQtggjQOKdD
 obs180G+1O3b2etGFhbUHB+9hIIy9IpLRm1KGjB+IFYEX2//A7j1AAoYjs0zP2zOiHJfu+VPF4wMM64vlgEPsfkoSDC9qFB0LaEtdVkiLX6vxL2XXXew46Vz
 nPvtdKhi3hEtq/mRlErtXYL8Wa2zBj0IQsFx/+FG6oeXstucdzue3EnvdVuCK13FklJQLnyUxdGtnWkI997RQtVU7hGjbY6V41xpb1B+ECdokuS4+tELyAED
 s95knAHpKcFaxpF74A8ZxQ+uvn9MCeZ8Kc/p1GFsuMqPMVNd3BM0fvOnG5rbYVsr7usBd7gkY1ewUxE3+DbkaF+UXW294gY5FFRO4GfkTRtkaV0aYDThbfne
 oou6K0Vt0T1IeGPYXVF4F2g2aq/gdUHzKiaua8cD3KVo3qvKOackHxrUM0dHige6M5CwD86WL0C+htyu
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/04/2021 16:21, Aline Santana Cordeiro wrote:
> Em qua, 2021-04-21 às 15:56 +0200, Julia Lawall escreveu:
>>
>>
>> On Wed, 21 Apr 2021, Aline Santana Cordeiro wrote:
>>
>>> Em qua, 2021-04-21 às 15:08 +0200, Julia Lawall escreveu:
>>>>
>>>>
>>>> On Wed, 21 Apr 2021, Aline Santana Cordeiro wrote:
>>>>
>>>>> Change line break to avoid an open parenthesis at the end of
>>>>> the
>>>>> line.
>>>>> It consequently removed spaces at the start of the subsequent
>>>>> line.
>>>>
>>>> The message is hard to understand.  There are a lot of singular
>>>> nouns, but
>>>> actually there are two changes.  Which change is being described
>>>> by
>>>> the
>>>> above message?  What does "It" refer to?
>>>>
>>>> julia
>>>
>>> Checkpatch indicated two problems with this function declaration:
>>> 1) The line ending with an open parenthesis, and
>>> 2) The following line - with the function parameters - has spaces
>>> in
>>> its identation.
>>>
>>> When I changed the line break to put the function name and its
>>> parameter in the following line, both checkpath checks were
>>> eliminated.
>>>
>>> So, the main change was the line break and, also, the line break
>>> (it)
>>> removed the space in the following line.
>>>
>>> Is it better to change the message and explain only about the line
>>> break?
>>
>> The message should explain about the whole patch.  So if you change
>> two
>> things, it should be clear that what you are saying covers both of
>> them.
> 
> Ok, I can do that. In the commit message I described just one issue
> because it is only one patch, I didn't want it to look like I was
> changing different issues in just one patch.
> 
>>
>> But it seems that Matthew doesn't think that the line break is a good
>> idea
>> anyway.
> 
> Yes, I'm sending this email to Matthew too, because I don't know
> exactly how to proceed as Hans asked me to made some corrections too. 
> I've made these changes because checkpatch has indicated and with this
> line break, checkpatch does not indicate any check or warning anymore.
> But I can undo that too, I just don't know what I'm supposed to do with
> so many opposite opinions. 

As one of the media maintainers I can say that in this case the preference
would be to split it up in two lines. It's one of those areas where
different maintainers have different opinions.

Just keep in mind that this is all nitpicking and normally we probably
wouldn't bother with this at all, but it is a good exercise to learn
about patches and contributing :-)

Regards,

	Hans

> 
> 
> Thank you all,
> Aline 
>>
>> julia
>>
>>>
>>> Thank you,
>>> Aline
>>>>
>>>>
>>>>> Both issues detected by checkpatch.pl.
>>>>>
>>>>> Signed-off-by: Aline Santana Cordeiro <
>>>>> alinesantanacordeiro@gmail.com>
>>>>> ---
>>>>>
>>>>> Changes since v2:
>>>>>  - Insert a space between the function type and pointer
>>>>>
>>>>> Changes since v1:
>>>>>  - Keep the pointer with the function return type
>>>>>    instead of left it with the function name
>>>>>
>>>>>  drivers/staging/media/atomisp/pci/atomisp_cmd.h | 10 +++++----
>>>>> -
>>>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
>>>>> b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
>>>>> index 1c0d464..639eca3 100644
>>>>> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
>>>>> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
>>>>> @@ -75,8 +75,8 @@ void atomisp_wdt(struct timer_list *t);
>>>>>  void atomisp_setup_flash(struct atomisp_sub_device *asd);
>>>>>  irqreturn_t atomisp_isr(int irq, void *dev);
>>>>>  irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
>>>>> -const struct atomisp_format_bridge
>>>>> *get_atomisp_format_bridge_from_mbus(
>>>>> -    u32 mbus_code);
>>>>> +const struct atomisp_format_bridge *
>>>>> +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
>>>>>  bool atomisp_is_mbuscode_raw(uint32_t code);
>>>>>  int atomisp_get_frame_pgnr(struct atomisp_device *isp,
>>>>>                            const struct ia_css_frame *frame,
>>>>> u32
>>>>> *p_pgnr);
>>>>> @@ -381,9 +381,9 @@ enum mipi_port_id __get_mipi_port(struct
>>>>> atomisp_device *isp,
>>>>>
>>>>>  bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe);
>>>>>
>>>>> -void atomisp_apply_css_parameters(
>>>>> -    struct atomisp_sub_device *asd,
>>>>> -    struct atomisp_css_params *css_param);
>>>>> +void atomisp_apply_css_parameters(struct atomisp_sub_device
>>>>> *asd,
>>>>> +                                 struct atomisp_css_params
>>>>> *css_param);
>>>>> +
>>>>>  void atomisp_free_css_parameters(struct atomisp_css_params
>>>>> *css_param);
>>>>>
>>>>>  void atomisp_handle_parameter_and_buffer(struct
>>>>> atomisp_video_pipe
>>>>> *pipe);
>>>>> --
>>>>> 2.7.4
>>>>>
>>>>> --
>>>>> You received this message because you are subscribed to the
>>>>> Google
>>>>> Groups "outreachy-kernel" group.
>>>>> To unsubscribe from this group and stop receiving emails from
>>>>> it,
>>>>> send an email to outreachy-kernel+unsubscribe@googlegroups.com.
>>>>> To view this discussion on the web visit
>>>>> https://groups.google.com/d/msgid/outreachy-kernel/20210421123718.GA4597%40focaruja
>>>>> .
>>>>>
>>>
>>>
>>> --
>>> You received this message because you are subscribed to the Google
>>> Groups "outreachy-kernel" group.
>>> To unsubscribe from this group and stop receiving emails from it,
>>> send an email to outreachy-kernel+unsubscribe@googlegroups.com.
>>> To view this discussion on the web visit    
>>> https://groups.google.com/d/msgid/outreachy-kernel/7aeac7041a6f6d7b3d8563f0d0bf0a4d31f379b0.camel%40gmail.com
>>> .
> 
> 

