Return-Path: <linux-media+bounces-26511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D8A3E1B3
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 18:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C79AB169895
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 17:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DE9211712;
	Thu, 20 Feb 2025 17:01:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7321DF754
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070867; cv=none; b=VEe79BTIKnNLhYBNR+t0ZjN0YDD/jhjsFZ/J3OZkhLujsWLisq/dDWI3w8ROJl1GKNy1843/i6KhpUPieuq07pSkBdDuBEBQLnzS2Im1cQjWK3G35lthludaD3gFBZdCXhGFpXjaeB+J45ySf0eUGWXOgxK8ATzkrrI5hKA0vNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070867; c=relaxed/simple;
	bh=kX6lCvm1zDrytt3Z7s1a8P19Mm7klQsM4LycPSs5Bns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UX3hljR3ErCjHbn6sm/MRQRw+m8xL7HUIZmgq/EcJR4FWs+km8YWvAJLaj5rZRpN6ugc5Mnt5lQ0PT9l4e6b1nUFefezOcWCrGWZJgO50dv45SpcopcnxS4oA02yq7lIBJxA+MkJwZy0j3IghiubFeAYDCQKRzbr9SuIzj1ryZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA46C4CED1;
	Thu, 20 Feb 2025 17:01:04 +0000 (UTC)
Message-ID: <ab0e29e5-a4a9-41fe-afec-a25c5b57a23e@xs4all.nl>
Date: Thu, 20 Feb 2025 18:01:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: rkisp1: Remove min_queued_buffers
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 "open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 "open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
 Adam Pigg <adam@piggz.co.uk>
References: <20241029082117.55385-1-jacopo.mondi@ideasonboard.com>
 <tpdzxkug5gtive7h4tvl6jn5r7ybb3dby7ajfuwmzigphhlkin@geirq67p6dww>
 <67af5601-922b-4683-9e5f-ccf4fd757dbb@xs4all.nl>
 <sw2x5l3o5zvlaufe7a4hfbwub3yrzsr3e5qgr6os6brcrpd3zp@2abh2jyru2yd>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <sw2x5l3o5zvlaufe7a4hfbwub3yrzsr3e5qgr6os6brcrpd3zp@2abh2jyru2yd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2025 17:27, Jacopo Mondi wrote:
> Hi Hans
> 
> On Thu, Feb 20, 2025 at 04:39:59PM +0100, Hans Verkuil wrote:
>> On 2/20/25 15:22, Jacopo Mondi wrote:
>>> Hello
>>>
>>> On Tue, Oct 29, 2024 at 09:21:16AM +0100, Jacopo Mondi wrote:
>>>> There apparently is no reason to require 3 queued buffers for RkISP1,
>>>> as the driver operates with a scratch buffer where data can be
>>>> directed to if there's no available buffer provided by userspace.
>>>>
>>>> Reduce the number of required buffers to 0 by removing the
>>>> initialization of min_queued_buffers, to allow applications to operate
>>>> by queueing capture buffers on-demand.
>>>>
>>>> Tested with libcamera, by operating with a single capture request. The
>>>> same request (and the associated capture buffer) gets recycled once
>>>> completed. This of course causes a frame rate drop but doesn't hinder
>>>> operations.
>>>>
>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>
>>> I just noticed v2 of this series:
>>> media: rkisp1: Reduce min_queued_buffers to 1
>>>
>>> has been collected instead of this v3.
>>
>> Did you mark your v2 as Superseded in patchwork when you posted the v3?
>> I marked your v1 and v2 as Superseded today when I was cleaning up patchwork,
>> so I know you didn't :-)
>>
>> When I post a new version I always mark the old one as Superseded, exactly
>> to prevent such things from happening.
>>
> 
>> Also, more people should help keep patchwork clean. I think I am usually the
>> person who is doing this, but this is a collective responsibility.
> 
> Yes, and it's a thankless job. So thank you.
> 
>>
>> Part of the job description for someone with commit rights is actually to
>> keep patchwork clean.
>>
> 
> Part of the motivation to do admin tasks around patch handling
> actually comes from a feeling of ownership and responsibility. If
> one is given trust and responsibilities then doing admin tasks just
> becomes part of what you do as you get through the day.
> 
> Don't get me wrong, this is not an excuse for being sluggish, but in
> the current process I'm not even sure if it's my responsibility to go
> through patchwork. In the end, right now, once I've sent a patch and
> replied to comments, then it's not "my business" anymore. Right ?
> Wrong ? Not sure, but I'm rather certain that if people is given
> ownership of something they will be motivated to care about it.

Let me put it this way: if active media developers who frequently post
patches would also update patchwork whenever they post new versions, then
maintainers would greatly appreciate it. It is not a requirement, though.
To be honest, I kind of expected you to do that already, but perhaps nobody
ever asked or mentioned it? You should be able to update the state of your
own patches in patchwork (although you might have to make an account first,
I'm not sure).

It is, however, a requirement for maintainers with delegation rights in
patchwork. Certainly for the area they maintain. Because if it isn't kept
up to date it becomes useless.

> 
> Anyway, I would like to use this little hiccups as an example of
> something that went wrong (for $reasons) in the current model, and
> which requires energies from both submitter and maintainers to be
> corrected. All the discussion we had have gone into depicting doomsday
> scenarios potentially caused by the new model, but I have the feeling
> maintainers themselves sometimes do not appreciate the burden the
> current process inflicts on them. That's why I'm a little surprised
> this taking so long, as the first ones that should want this happening
> are the people which are doing most of thankless and underappreciated
> housekeeping work that keeps the subsystem functional.

It definitely takes longer than expected. There were a lot of issues all
over the place that needed to be fixed. But there is no point in starting
this too soon and have it end up into chaos.

The CI in particular already greatly helps me: I don't need to go back to
the patch author as often as I used to to ask for changes caught by my
scripts, since now it has already been caught by the CI.

The lack of serializing merge requests is from a technical standpoint the
only blocker to enabling multiple committers.

Regards,

	Hans

> 
> Thank you!
> 
> 
>> Regards,
>>
>> 	Hans
>>
>>>
>>> And I noticed because a user complained to me about this.
>>>
>>> Now, I can provide an update based on the now merged v2, not a big
>>> deal, but this depresses me a bit as the discussion about
>>> implementing multi-commiter model is apparently (again) stalled.
>>>
>>> I know, sh*t happens (TM) and hiccups are expected in the process,
>>> we all make mistakes and I'm not even sure through which path the
>>> patch has been collected, but I could have handled this one easily,
>>> and instead what we have is:
>>>
>>> 1) an unhappy user that will likely have to wait for the next release
>>> 2) me having to send an additional (rather trivial) patch
>>> 3) Someone will have to review, collect, PR etc etc
>>>
>>> (and I'm not even mentioning this patch is 3 lines)
>>>
>>> Issues like this one seems to be considered a fact of life we decided
>>> is fine to live with, while every possible corner case of the proposed
>>> multi-committer model is analyzed with great concern like we're
>>> trading a perfect model for something that has to be equally perfect.
>>>
>>> And while I agree the biggest reason for the proverbial v4l2 slow pace
>>> is the reviewers scarcity and the limited maintainers bandwidth, now
>>> that we have everything in place to reduce the system clogginess
>>> it still seems we're not all sold for it. I really don't get it, sorry.
>>>
>>>
>>>> ---
>>>> v2->v3:
>>>> - Remove min_queued_buffers initialization
>>>>
>>>> v1->v2:
>>>> The first version of this patch set min_queued_buffers to 1, but setting it
>>>> to 0 doesn't compromise operations and it's even better as it allows application
>>>> to queue buffers to the capture devices on-demand. If a buffer is not provided
>>>> to the DMA engines, image data gets directed to the driver's internal scratch
>>>> buffer.
>>>> ---
>>>>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 3 ---
>>>>  1 file changed, 3 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>>> index 2bddb4fa8a5c..2f0c610e74b9 100644
>>>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>>> @@ -35,8 +35,6 @@
>>>>  #define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
>>>>  #define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"
>>>>
>>>> -#define RKISP1_MIN_BUFFERS_NEEDED 3
>>>> -
>>>>  enum rkisp1_plane {
>>>>  	RKISP1_PLANE_Y	= 0,
>>>>  	RKISP1_PLANE_CB	= 1,
>>>> @@ -1563,7 +1561,6 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>>>>  	q->ops = &rkisp1_vb2_ops;
>>>>  	q->mem_ops = &vb2_dma_contig_memops;
>>>>  	q->buf_struct_size = sizeof(struct rkisp1_buffer);
>>>> -	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
>>>>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>>>  	q->lock = &node->vlock;
>>>>  	q->dev = cap->rkisp1->dev;
>>>> --
>>>> 2.47.0
>>>>
>>>>
>>


