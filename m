Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6C23459C3
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 09:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhCWIeE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 04:34:04 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:42657 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229931AbhCWIdm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 04:33:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id OcTqlum2ZUzyrOcTtlOlYx; Tue, 23 Mar 2021 09:33:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616488421; bh=3WdTv7gH9X2GqDwHP2rLXWrtNkf2DfZqVnprN4/VC9w=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ftu+IbRoAyxEeQCtHq8RvoUwixdP94vKvgky5Tc88oFfrHn7vWaW0w8XEvClg+i01
         ApN4/JSW5VXpk7/DzZG1GaXoDuJlRXYEw6FzqHWZT4jKEb8j0c1Ibfz74egt8Ya8Xq
         CvpLki7PMt/LmSZbYV475m62un+Zv1//40nWbbT/ccZ4Yy9CAIedxvwKq5jTWnT1Y7
         Rqqltn2NOBc38962eXkyDvITHucBJrvKr36vchcG4MH12swUhkJPry2IUVnt6/0P2z
         sNyOCb/goXWAUMj8pnza9Q2LNuB+dFMAVLuCowhD8WN5J+TgAh/YlLJOqOcX2TTn9g
         Z5psy1Z0p3S7g==
Subject: Re: [PATCH] allegro-dvt/nal-h264.h: fix kernel-doc: hdr -> hrd
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <03e0ce22-1ebe-24f4-0f49-f4c41ae8f598@xs4all.nl>
 <20210323075258.GC31778@pengutronix.de>
 <fc54c78a-997e-f1e6-aca4-9f0453579d1a@xs4all.nl>
 <20210323082338.GD31778@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8fb4ccef-fdee-7257-01a2-e9fbaed96579@xs4all.nl>
Date:   Tue, 23 Mar 2021 09:33:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323082338.GD31778@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMxu/ONJrVcFGFNjtSq3whHGJga9I1H6K4sw9oQ6gDr9mpJpLjrRKUd7C5QVDrlGP0BM8NFxaRCjcCYOnzYcPh7Mme3gNXaAL/mbGRGdpp5Ufzdp8jPp
 BMePsT511kjsEWMl12nh8jQKnJkPk58uwXkfy5kvTl5gb/t5irxw7/wlKajFHhb5HSwNCsHcDnS2tvLtRCFAvCzuOU60GjoUMm5ACeqZp1SRoVrKCNhPp3c7
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/03/2021 09:23, Michael Tretter wrote:
> Hi Hans,
> 
> On Tue, 23 Mar 2021 08:57:53 +0100, Hans Verkuil wrote:
>> On 23/03/2021 08:52, Michael Tretter wrote:
>>> On Tue, 23 Mar 2021 08:49:13 +0100, Hans Verkuil wrote:
>>>> Give typo in kernel-doc documentation: hdr -> hrd
>>>>
>>>> Fixes this warning:
>>>>
>>>> drivers/media/platform/allegro-dvt/nal-h264.h:33: warning: expecting prototype for struct nal_h264_hdr_parameters. Prototype was for struct
>>>> nal_h264_hrd_parameters instead
>>>>
>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>
>>> Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
>>
>> Since you made the mistake of replying :-) I want to point out that the allegro headers
>> produce a large number of kernel-doc warnings since none of the parameters are documented.
> 
> :)
> 
>>
>> You can look at the daily build log for all the warnings, but I've copied them below as
>> well.
>>
>> I think you should either document it all, or change /** to /*.
> 
> IMO documenting the parameters is rather pointless, because they are straight
> copies from the specifications and the documentation would be "see H264
> specification" for every single one of them. I guess, I'll go for changing /**
> to /*.
> 
> Actually, I thought about using the sps/pps structs defined in
> include/media/v4l2-ctrls.h. I was not convinced, because these are userspace
> facing API. Are the sps/pps definitions something, that would help other
> drivers, too, or should we rather avoid global definitions to discourage
> sps/pps parsing/generation in drivers?

There is nothing wrong with using v4l2_ctrl_h264_sps/pps in your driver
instead of your own structs.

Just note that these structs are now part of the uAPI, so can't be changed.

If you need allegro specific data as well, then you might be better off
keeping your own structs.

I'm not sure what you mean with your last question. If a driver needs to do
sps/pps parsing/generation, then why would it matter if it uses global or local
definitions? It still has to do it, right? And having reusable code might help
others.

Regards,

	Hans

> 
> Michael
> 

