Return-Path: <linux-media+bounces-18011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBA7971D40
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 16:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3744E1F22BA3
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA1F1BBBFC;
	Mon,  9 Sep 2024 14:55:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CC91BBBEC
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 14:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893736; cv=none; b=ckHWzn0q9hhXELbEhil1USKxuA8OVwE+u8JnY5KNH7mb76WnFTlIfkOi1Ha1cLhwCEODC2d62SGY11tqXTmXSsT4S7HTmbb380Rivh4cp4NLp9CgRAMbOiTs8O4u25hpCPqc/g4+8sIzoenNeeLlevHOMX9+QV7RgjxjLN3SMQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893736; c=relaxed/simple;
	bh=VcGrLD3/cARqRjAjxbxUUI3S6vITjOHKcBt4lWGiF1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J99UOsXQj+VxTQoNsn21fPVIlnbAf8YTRqIfYGsq4K7/sYrDRrKnLnFshN2+XFubwThw09tCfe5KaPOlA8s8LPhnokRTyLyPqjLLKW1fbcHx9nJzIaiM8ygac9ebV1xlCKrNHKEbLu4CT4W43rrnYzJd0Q4zGKUNqM6GcOlVEAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F85BC4CEC5;
	Mon,  9 Sep 2024 14:55:33 +0000 (UTC)
Message-ID: <c95beba7-2506-4de2-9601-47348623dba0@xs4all.nl>
Date: Mon, 9 Sep 2024 16:55:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] media: rcar_drif.c: set lock before calling
 vb2_queue_init()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
 Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
 <31085af170e3cc9b4fe115d53a556ccf477751d3.1725285495.git.hverkuil-cisco@xs4all.nl>
 <20240909145146.GA27525@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240909145146.GA27525@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2024 16:51, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Mon, Sep 02, 2024 at 04:04:52PM +0200, Hans Verkuil wrote:
>> The vb2_queue_init() will expect the vb2_queue lock pointer to be set in
>> the future. So for those drivers that set the lock later, move it up to
>> before the vb2_queue_init() call.
> 
> The commit message doesn't match the change below, you're moving the
> lock down, not up.

Actually, I am moving it up, as in 'set earlier', but in this case it is
a bit confusing in the patch.

Regards,

	Hans

> 
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
>> Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> ---
>>  drivers/media/platform/renesas/rcar_drif.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
>> index f21d05054341..5d3109940ded 100644
>> --- a/drivers/media/platform/renesas/rcar_drif.c
>> +++ b/drivers/media/platform/renesas/rcar_drif.c
>> @@ -1071,7 +1071,6 @@ static int rcar_drif_sdr_register(struct rcar_drif_sdr *sdr)
>>  	sdr->vdev->release = video_device_release;
>>  	sdr->vdev->lock = &sdr->v4l2_mutex;
>>  	sdr->vdev->queue = &sdr->vb_queue;
>> -	sdr->vdev->queue->lock = &sdr->vb_queue_mutex;
>>  	sdr->vdev->ctrl_handler = &sdr->ctrl_hdl;
>>  	sdr->vdev->v4l2_dev = &sdr->v4l2_dev;
>>  	sdr->vdev->device_caps = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_TUNER |
>> @@ -1316,6 +1315,7 @@ static int rcar_drif_sdr_probe(struct rcar_drif_sdr *sdr)
>>  	sdr->vb_queue.ops = &rcar_drif_vb2_ops;
>>  	sdr->vb_queue.mem_ops = &vb2_vmalloc_memops;
>>  	sdr->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>> +	sdr->vb_queue.lock = &sdr->vb_queue_mutex;
>>  
>>  	/* Init videobuf2 queue */
>>  	ret = vb2_queue_init(&sdr->vb_queue);
> 


