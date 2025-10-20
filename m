Return-Path: <linux-media+bounces-45074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB83BF3349
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 21:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C45B23A80D1
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 19:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4877D3148BB;
	Mon, 20 Oct 2025 19:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Map30f33"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9F32C0268;
	Mon, 20 Oct 2025 19:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760988586; cv=none; b=TrzvKlzmwLc+9Ljj1JnN3PHR3bF7EQfU0nZmqIV6r9i3Y4ILu/kChdXZ9A8r8Rn1IIKq3/ZVoPOTDGoD5HlBr1IXKWrJCmNRe9+KjTALmmnPHMUtwuSnEtbZKJajOPwRBQhamZXm+eo3iCEjhZ+VPOdd+6PpQcLPFbK5mlq4SYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760988586; c=relaxed/simple;
	bh=24pjMusfqXK/ZFMzf4J8378emXyJcIaZpRhLK2I3LBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r7nfRu4AqcsQPoZqbY6+1E3AKUXeIyK8/U5j0Uj8gkx7vQ9rSkc1Do9i5CFxaaIS5wM01VjtSA+T5fPYnazZAtGt3xGZ0h5Z05APp23lOGgZwt8VDGiCYBbuQned8zL/ZHpg0KrMBaouTbEDmGG4tlChoG1Ctd//IA7zYtfjJJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Map30f33; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59KJTV4p3067010;
	Mon, 20 Oct 2025 14:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760988571;
	bh=qyKwmzguvn8OepZ+GiGPYMTWq6LubaMtWkC4xy/16sM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Map30f33dLThJqzVXeWjXysLeX/Hx0HaGFLJft2cTd8MRDYBDvXpsxI4yWdQpzdiR
	 CyBV3HPIOZN5xxhWN8etz3g8qbew8lofJZdEj+BLmA2KY3j/xfTxAD97PJbTXWS9lO
	 tO5UZuCp2FixFWKm1DKSnKJ/pZQ93QSomOgKvDLE=
Received: from DFLE205.ent.ti.com (dfle205.ent.ti.com [10.64.6.63])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59KJTVuC660754
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Oct 2025 14:29:31 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Oct
 2025 14:29:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 20 Oct 2025 14:29:31 -0500
Received: from [10.247.21.203] (lt5cg2132ltw.dhcp.ti.com [10.247.21.203])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59KJTVHx2494367;
	Mon, 20 Oct 2025 14:29:31 -0500
Message-ID: <e8ca48e2-264d-462b-89a6-0c788a58ce77@ti.com>
Date: Mon, 20 Oct 2025 14:29:31 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: chips-media: wave5: Fix Hang in Encoder
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Nas Chung
	<nas.chung@chipsnmedia.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Mauro
 Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Darren Etheridge <detheridge@ti.com>
References: <20251020173332.2271145-1-b-brnich@ti.com>
 <351e25ea533c440e3fa5131fe44796f66bc4ff82.camel@collabora.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <351e25ea533c440e3fa5131fe44796f66bc4ff82.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Nicolas,

On 10/20/2025 1:41 PM, Nicolas Dufresne wrote:
> Hi Brandon,
> 
> 
> Le lundi 20 octobre 2025 à 12:33 -0500, Brandon Brnich a écrit :
>> Wave5 encoder driver only changed states to PIC_RUN in start streaming by
>> making the assumption that VIDIOC STREAMON call has already been called.
>> In frameworks like FFMPEG, this condition has not been met when in the
>> start streaming function resulting in the application hanging. Therefore,
>> job_ready and device_run need to be extended to have support for this case.
> 
> I'm afraid you will have to rework that commit message in V2, I could not make
> much sense out of it. See comments below, but by spliting your patch, it might
> get easier to explain what you are trying to fix.

Understood, I provide a better explanation in next patch. I can see how 
some of the below can be confusing.

> 
>>
>> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
>> ---
>>   .../chips-media/wave5/wave5-vpu-enc.c         | 74 +++++++++++++------
>>   1 file changed, 51 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
>> index a02853d42d61..3a3b585ceb8e 100644
>> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
>> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
>> @@ -705,6 +705,11 @@ static int wave5_vpu_enc_encoder_cmd(struct file *file, void *fh, struct v4l2_en
>>   
>>   		m2m_ctx->last_src_buf = v4l2_m2m_last_src_buf(m2m_ctx);
>>   		m2m_ctx->is_draining = true;
>> +
>> +		if (v4l2_m2m_num_dst_bufs_ready(m2m_ctx) > 0) {
> 
> Its job_ready callback and framework task to check this, I think you can go
> directly to try to schedule.
> 
>> +			dev_dbg(inst->dev->dev, "Forcing job run for draining\n");
>> +			v4l2_m2m_try_schedule(m2m_ctx);
> 
> This is fair, and the decoder does the same. Though, it has nothing to do with
> the transition from OPEN -> SEQ_INIT -> PIC_RUN. Do this in its own commit with
> its own explanation.

Understood

> 
>> +		}
>>   		break;
>>   	case V4L2_ENC_CMD_START:
>>   		break;
>> @@ -1411,6 +1416,34 @@ static int prepare_fb(struct vpu_instance *inst)
>>   	return ret;
>>   }
>>   
>> +static int wave5_vpu_enc_prepare_cap_seq(struct vpu_instance *inst)
>> +{
> 
> Factor-out in its own commit, with a message this is preparation work and with
> no function changes. Its really hard to review code that moves around and may
> have changes in it.

Might not be important to do anymore if your suggestions on the 
conditional at the bottom of this patch work. I only moved this code to 
it's own function since I updated device_run to have capability to 
support the same state change if it was not achieved in start_streaming.

> 
>> +	int ret = 0;
>> +
>> +	ret = initialize_sequence(inst);
>> +	if (ret) {
>> +		dev_warn(inst->dev->dev, "Sequence not found: %d\n", ret);
>> +		return ret;
>> +	}
>> +	ret = switch_state(inst, VPU_INST_STATE_INIT_SEQ);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * The sequence must be analyzed first to calculate the proper
>> +	 * size of the auxiliary buffers.
>> +	 */
>> +	ret = prepare_fb(inst);
>> +	if (ret) {
>> +		dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = switch_state(inst, VPU_INST_STATE_PIC_RUN);
>> +
>> +	return ret;
>> +}
>> +
>>   static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count)
>>   {
>>   	struct vpu_instance *inst = vb2_get_drv_priv(q);
>> @@ -1453,27 +1486,8 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
>>   		if (ret)
>>   			goto return_buffers;
>>   	}
>> -	if (inst->state == VPU_INST_STATE_OPEN && m2m_ctx->cap_q_ctx.q.streaming) {
>> -		ret = initialize_sequence(inst);
>> -		if (ret) {
>> -			dev_warn(inst->dev->dev, "Sequence not found: %d\n", ret);
>> -			goto return_buffers;
>> -		}
>> -		ret = switch_state(inst, VPU_INST_STATE_INIT_SEQ);
>> -		if (ret)
>> -			goto return_buffers;
>> -		/*
>> -		 * The sequence must be analyzed first to calculate the proper
>> -		 * size of the auxiliary buffers.
>> -		 */
>> -		ret = prepare_fb(inst);
>> -		if (ret) {
>> -			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
>> -			goto return_buffers;
>> -		}
>> -
>> -		ret = switch_state(inst, VPU_INST_STATE_PIC_RUN);
>> -	}
>> +	if (inst->state == VPU_INST_STATE_OPEN && m2m_ctx->cap_q_ctx.q.streaming)
>> +		ret = wave5_vpu_enc_prepare_cap_seq(inst);
>>   	if (ret)
>>   		goto return_buffers;
>>   
>> @@ -1598,6 +1612,14 @@ static void wave5_vpu_enc_device_run(void *priv)
>>   
>>   	pm_runtime_resume_and_get(inst->dev->dev);
>>   	switch (inst->state) {
>> +	case VPU_INST_STATE_OPEN:
>> +		ret = wave5_vpu_enc_prepare_cap_seq(inst);
>> +		if (ret) {
>> +			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
>> +			switch_state(inst, VPU_INST_STATE_STOP);
>> +			break;
>> +		}
>> +		fallthrough;
>>   	case VPU_INST_STATE_PIC_RUN:
>>   		ret = start_encode(inst, &fail_res);
>>   		if (ret) {
>> @@ -1633,6 +1655,12 @@ static int wave5_vpu_enc_job_ready(void *priv)
>>   	case VPU_INST_STATE_NONE:
>>   		dev_dbg(inst->dev->dev, "Encoder must be open to start queueing M2M jobs!\n");
>>   		return false;
>> +	case VPU_INST_STATE_OPEN:
>> +		if (wave5_vpu_both_queues_are_streaming(inst)) {
>> +			dev_dbg(inst->dev->dev, "Both queues have been turned on now, M2M job can occur\n");
>> +			return true;
>> +		}
>> +		return false;
>>   	case VPU_INST_STATE_PIC_RUN:
>>   		if (m2m_ctx->is_draining || v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
>>   			dev_dbg(inst->dev->dev, "Encoder ready for a job, state: %s\n",
>> @@ -1642,9 +1670,9 @@ static int wave5_vpu_enc_job_ready(void *priv)
>>   		fallthrough;
>>   	default:
>>   		dev_dbg(inst->dev->dev,
>> -			"Encoder not ready for a job, state: %s, %s draining, %d src bufs ready\n",
>> +			"Encoder not ready for a job, state: %s, %s draining, %d src bufs ready, %d dst bufs ready\n",
>>   			state_to_str(inst->state), m2m_ctx->is_draining ? "is" : "is not",
>> -			v4l2_m2m_num_src_bufs_ready(m2m_ctx));
>> +			v4l2_m2m_num_src_bufs_ready(m2m_ctx), v4l2_m2m_num_dst_bufs_ready(m2m_ctx));
>>   		break;
>>   	}
>>   	return false;
> 
> Perhaps its going to be clear with proper commit message, but I'm still not
> clear how you can endup with both queues streaming without two calls to
> wave5_vpu_enc_start_streaming(). I don't deny the condition might be broken
> then, but the intent is for this code to bring the driver to PIC_RUN on the
> second call.>
>  From VPU_INST_STATE_NONE:
> 
> Case 1:
>     STREAMON(CAP)
>     	- bring it to OPEN state

Wouldn't this be the no-op and cause no state change? VPU only goes to 
OPEN when start_streaming is called on the OUTPUT plane.

>     STREAMON(OUT)
>     	- Initialize the sequence and prepare the FB
>     	- Leaving with PIC_RUN state

So this state would be opening and leaving in state OPEN, but since CAP 
was called first, it should be streaming so check would happen.

> 
> 
> Case 2:
>     STREAMON(OUT)
>     	- no-op
This would put into state open.

>     STREAMON(CAP)
>     	- To OPEN

It would already be in state open since STREAMON(OUT) put it there.

>     	- To INIT_SEQ
>     	- To PIC_RUN
Then the above two don't happen due to below condition failing.

>     
> 
> So in case 2, the code fails this condition:
> 
> 	if (inst->state == VPU_INST_STATE_OPEN && m2m_ctx->cap_q_ctx.q.streaming) {>
> 
> Basically type == CAP, and vb2 won't be setting the .streaming state before this
> function returns. A possible solution would be:
> 
> 	if (inst->state == VPU_INST_STATE_OPEN &&
> 	    (m2m_ctx->cap_q_ctx.q.streaming || type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)) {

I can test this and I'm sure it will work because this would force it to 
enter that code block to regardless on the 2nd start_streaming case. 
This appears to be the cleaner solution without messing around with the 
state's in job_ready and device_run. So this patch becomes much simpler. 
I will split into two: 1. updating this conditional (assuming it works) 
and 2. updating cmd_stop to go directly to try_schedule. Both patches 
with better commit messages.

Best,
Brandon

> 
> cheers,
> Nicolas


