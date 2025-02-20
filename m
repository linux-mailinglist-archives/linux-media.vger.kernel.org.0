Return-Path: <linux-media+bounces-26492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8261CA3DEA4
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A77D61883B32
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31811DE891;
	Thu, 20 Feb 2025 15:33:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636831D6DC8
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 15:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065612; cv=none; b=Z3i1sZI3pc7OX76vAXJKR6HIvV4mOCAFt1Kv7FSXwRppcTlnLxiwtf8YS1TXDjU1tS00ljJTKh13iGx/dezSXeHWtueO/E+yDBkM4KJlOvIJA5RuiJLkyRtsnP25BAsyaGL9V1MRBAFO1gQD6tNWUoRLVmVdea/uuzdXoXfU2lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065612; c=relaxed/simple;
	bh=d5roB80XOTedc6Wd/F/vUkl/qvWjr8sZv7nKpnWxsUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bmtj2YPv5xhPJeepemRK4nSMGqNo4OPO8luv8vjMxXR1EvFivu51t+8nlNfASZWyLJwlaR7oEPJUmMPvpi608nVb6bUkGOLfnLv8nEE0YEfc71P6FNVaOpF2nfTRpkF6RNGUAfDar/JYXAht8NY4jKlNRi+adxLlkODaX+0Cqaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6E8C4CED1;
	Thu, 20 Feb 2025 15:33:29 +0000 (UTC)
Message-ID: <0d8d204f-c9b1-4152-a041-10d21f94af56@xs4all.nl>
Date: Thu, 20 Feb 2025 16:33:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: rkisp1: Remove min_queued_buffers
Content-Language: en-US
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
 "open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 "open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
 Adam Pigg <adam@piggz.co.uk>
References: <20241029082117.55385-1-jacopo.mondi@ideasonboard.com>
 <tpdzxkug5gtive7h4tvl6jn5r7ybb3dby7ajfuwmzigphhlkin@geirq67p6dww>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <tpdzxkug5gtive7h4tvl6jn5r7ybb3dby7ajfuwmzigphhlkin@geirq67p6dww>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/20/25 15:22, Jacopo Mondi wrote:
> Hello
> 
> On Tue, Oct 29, 2024 at 09:21:16AM +0100, Jacopo Mondi wrote:
>> There apparently is no reason to require 3 queued buffers for RkISP1,
>> as the driver operates with a scratch buffer where data can be
>> directed to if there's no available buffer provided by userspace.
>>
>> Reduce the number of required buffers to 0 by removing the
>> initialization of min_queued_buffers, to allow applications to operate
>> by queueing capture buffers on-demand.
>>
>> Tested with libcamera, by operating with a single capture request. The
>> same request (and the associated capture buffer) gets recycled once
>> completed. This of course causes a frame rate drop but doesn't hinder
>> operations.
>>
>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> I just noticed v2 of this series:
> media: rkisp1: Reduce min_queued_buffers to 1
> 
> has been collected instead of this v3.
> 
> And I noticed because a user complained to me about this.
> 
> Now, I can provide an update based on the now merged v2, not a big
> deal, but this depresses me a bit as the discussion about
> implementing multi-commiter model is apparently (again) stalled.
> 
> I know, sh*t happens (TM) and hiccups are expected in the process,
> we all make mistakes and I'm not even sure through which path the
> patch has been collected, but I could have handled this one easily,
> and instead what we have is:
> 
> 1) an unhappy user that will likely have to wait for the next release
> 2) me having to send an additional (rather trivial) patch
> 3) Someone will have to review, collect, PR etc etc
> 
> (and I'm not even mentioning this patch is 3 lines)
> 
> Issues like this one seems to be considered a fact of life we decided
> is fine to live with, while every possible corner case of the proposed
> multi-committer model is analyzed with great concern like we're
> trading a perfect model for something that has to be equally perfect.
> 
> And while I agree the biggest reason for the proverbial v4l2 slow pace
> is the reviewers scarcity and the limited maintainers bandwidth, now
> that we have everything in place to reduce the system clogginess
> it still seems we're not all sold for it. I really don't get it, sorry.

The main gitlab blocker is that we need a merge bot. Ricardo said in the
last meeting that he hopes to have that in a month. The other blocker is
of course the gitlab freedesktop migration to another provider.

Without a merge bot even with just two committers Mauro and myself are
frequently stepping on each others toes, so that really is needed. Heck, if
I have two CI pipelines in flight, I'm stepping on my own toes! Hopefully a
merge bot should fix this issue.

Otherwise it is going quite well on the gitlab front.

The other is the "Document the new media-committer's model" series. I
think Laurent scared Mauro off with his last set of comments.

Regards,

	Hans

> 
> 
>> ---
>> v2->v3:
>> - Remove min_queued_buffers initialization
>>
>> v1->v2:
>> The first version of this patch set min_queued_buffers to 1, but setting it
>> to 0 doesn't compromise operations and it's even better as it allows application
>> to queue buffers to the capture devices on-demand. If a buffer is not provided
>> to the DMA engines, image data gets directed to the driver's internal scratch
>> buffer.
>> ---
>>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> index 2bddb4fa8a5c..2f0c610e74b9 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> @@ -35,8 +35,6 @@
>>  #define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
>>  #define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"
>>
>> -#define RKISP1_MIN_BUFFERS_NEEDED 3
>> -
>>  enum rkisp1_plane {
>>  	RKISP1_PLANE_Y	= 0,
>>  	RKISP1_PLANE_CB	= 1,
>> @@ -1563,7 +1561,6 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>>  	q->ops = &rkisp1_vb2_ops;
>>  	q->mem_ops = &vb2_dma_contig_memops;
>>  	q->buf_struct_size = sizeof(struct rkisp1_buffer);
>> -	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
>>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>  	q->lock = &node->vlock;
>>  	q->dev = cap->rkisp1->dev;
>> --
>> 2.47.0
>>
>>


