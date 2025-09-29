Return-Path: <linux-media+bounces-43362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CF5BAA969
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 22:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 154743A83BD
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 20:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4148C224B12;
	Mon, 29 Sep 2025 20:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GSvvZFf+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B2220FA81;
	Mon, 29 Sep 2025 20:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759177188; cv=none; b=soL6oKVfVIrFEBTad4DpWjYQJ+ienx01q+ooK64EMAM8Oo1TmRKX3IuOCOYL0EzYMy8jS8VCKN0pNmU6/lMHUfRN/KnFGW9sHMvRgmFlG792tAYEBDfCfV18wdlrJxTFxbF5ou3nj2x+AJZSCE2vgKT2hAZ8SlGYmKpRY3D3RTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759177188; c=relaxed/simple;
	bh=lNipjJdMAZ5qz+onvyG19IRxSPLNYrDlQ5cDfVAVHqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QzNj9cYZ1BGD1HPaVtqwxPhgT5sQ99M74Cz8pI9JqftaJuED3Fv0Bf1OGUo7kPOB50TNgN456WWIbOatMDeQzb+1RNq8gComAYpVvEO8uKUrluLUOgZq9vgdn7nENYj58DZIwnlZoCXPND7lpuP7mWRtoaGIe7quzx6j3FxukPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GSvvZFf+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 747513A4;
	Mon, 29 Sep 2025 22:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759177094;
	bh=lNipjJdMAZ5qz+onvyG19IRxSPLNYrDlQ5cDfVAVHqo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GSvvZFf+Mo1s7NAufXgp8Hb51XOl1pR26wWc9nyOnKOUWZre3A82F0olyG9kvISrb
	 xmhko4G9e5crXRTozX+da+1tFNN7bg7WNWPBCNv6pnbAMUt09dP012UJ7G3Nf+R1qm
	 ZauGaMe8ZdIliydsS9BVcKEadq/u+3e65mO8Ur08=
Message-ID: <54bfa9f3-33fc-4633-9091-95873d502146@ideasonboard.com>
Date: Mon, 29 Sep 2025 21:19:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rzg2l-cru: rework rzg2l_cru_fill_hw_slot()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart+renesas@ideasonboard.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org
References: <20250918-rzg2l-cru-v1-1-fe110fdb91e5@ideasonboard.com>
 <aNqu5LXUcQjx4H6w@tom-desktop>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <aNqu5LXUcQjx4H6w@tom-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tommaso

On 29/09/2025 17:08, Tommaso Merciai wrote:
> Hi Daniel,
> Thank you for your patch!
> 
> On Thu, Sep 18, 2025 at 01:08:55PM +0100, Daniel Scally wrote:
>> The current implementation of rzg2l_cru_fill_hw_slot() results in the
>> artificial loss of frames. At present whenever a frame-complete IRQ
>> is received the driver fills the hardware slot that was just written
>> to with the address of the next buffer in the driver's queue. If the
>> queue is empty, that hardware slot's address is set to the address of
>> the scratch buffer to enable the capture loop to keep running. There
>> is a minimum of a two-frame delay before that slot will be written to
>> however, and in the intervening period userspace may queue more
>> buffers which could be used.
>>
>> To resolve the issue rework rzg2l_cru_fill_hw_slot() so that it
>> iteratively fills all slots from the queue which currently do not
>> have a buffer assigned, until the queue is empty. The scratch
>> buffer is only resorted to in the event that the queue is empty and
>> the next slot that will be written to does not already have a buffer
>> assigned.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 63 +++++++++++-----------
>>   1 file changed, 32 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
>> index 941badc90ff55c5225644f88de1d70239eb3a247..9ffafb0239a7388104219b2b72eec9051db82078 100644
>> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
>> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
>> @@ -192,45 +192,47 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
>>   }
>>   
>>   /*
>> - * Moves a buffer from the queue to the HW slot. If no buffer is
>> - * available use the scratch buffer. The scratch buffer is never
>> - * returned to userspace, its only function is to enable the capture
>> - * loop to keep running.
>> + * Move as many buffers as possible from the queue to HW slots. If no buffer is
>> + * available and the next slot currently lacks one then use the scratch buffer.
>> + * The scratch buffer is never returned to userspace, its only function is to
>> + * enable the capture loop to keep running.
>>    */
>> -static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
>> +static void rzg2l_cru_fill_hw_slots(struct rzg2l_cru_dev *cru, int slot)
>>   {
>> -	struct vb2_v4l2_buffer *vbuf;
>> +	unsigned int from_slot = slot;
>>   	struct rzg2l_cru_buffer *buf;
>> +	struct vb2_v4l2_buffer *vbuf;
>>   	dma_addr_t phys_addr;
>>   
>> -	/* A already populated slot shall never be overwritten. */
>> -	if (WARN_ON(cru->queue_buf[slot]))
>> -		return;
>> -
>> -	dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
>> +	do {
>> +		if (cru->queue_buf[slot]) {
>> +			slot = (slot + 1) % cru->num_buf;
>> +			continue;
>> +		}
>>   
>> -	if (list_empty(&cru->buf_list)) {
>> -		cru->queue_buf[slot] = NULL;
>> -		phys_addr = cru->scratch_phys;
>> -	} else {
>> -		/* Keep track of buffer we give to HW */
>> -		buf = list_entry(cru->buf_list.next,
>> -				 struct rzg2l_cru_buffer, list);
>> -		vbuf = &buf->vb;
>> -		list_del_init(to_buf_list(vbuf));
>> -		cru->queue_buf[slot] = vbuf;
>> -
>> -		/* Setup DMA */
>> -		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
>> -	}
>> +		if (list_empty(&cru->buf_list)) {
>> +			if (slot == from_slot)
>> +				phys_addr = cru->scratch_phys;
>> +			else
>> +				return;
>> +		} else {
>> +			buf = list_first_entry(&cru->buf_list,
>> +					       struct rzg2l_cru_buffer, list);
>> +			vbuf = &buf->vb;
>> +			list_del_init(&buf->list);
>> +			cru->queue_buf[slot] = vbuf;
>> +			phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
>> +		}
>>   
>> -	rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
>> +		dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
>> +		rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
>> +		slot = (slot + 1) % cru->num_buf;
>> +	} while (slot != from_slot);
>>   }
>>   
>>   static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>>   {
>>   	const struct rzg2l_cru_info *info = cru->info;
>> -	unsigned int slot;
>>   	u32 amnaxiattr;
>>   
>>   	/*
>> @@ -239,8 +241,7 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>>   	 */
>>   	rzg2l_cru_write(cru, AMnMBVALID, AMnMBVALID_MBVALID(cru->num_buf - 1));
>>   
>> -	for (slot = 0; slot < cru->num_buf; slot++)
>> -		rzg2l_cru_fill_hw_slot(cru, slot);
>> +	rzg2l_cru_fill_hw_slots(cru, 0);
>>   
>>   	if (info->has_stride) {
>>   		u32 stride = cru->format.bytesperline;
>> @@ -652,7 +653,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>>   	cru->sequence++;
>>   
>>   	/* Prepare for next frame */
>> -	rzg2l_cru_fill_hw_slot(cru, slot);
>> +	rzg2l_cru_fill_hw_slots(cru, (slot + 1) % cru->num_buf);
>>   
>>   done:
>>   	spin_unlock_irqrestore(&cru->qlock, flags);
>> @@ -752,7 +753,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>>   		cru->sequence++;
>>   
>>   		/* Prepare for next frame */
>> -		rzg2l_cru_fill_hw_slot(cru, slot);
>> +		rzg2l_cru_fill_hw_slots(cru, (slot + 1) % cru->num_buf);
>>   	}
>>   
>>   	return IRQ_HANDLED;
>>
>> ---
>> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
>> change-id: 20250918-rzg2l-cru-0554a4352a70
>>
>> Best regards,
>> -- 
>> Daniel Scally <dan.scally@ideasonboard.com>
> 
> Not reviewed yet, sorry.

No problem :)

> 
> But testing on RZ/G3E I'm getting the following:
> 
> [  288.873715] rzg2l-cru 16000000.video: Invalid MB address 0xeacc3e00 (out of range)
> [  288.884665] rzg2l-cru 16000000.video: Invalid MB address 0xeae57e00 (out of range)
> [  288.967963] rzg2l-cru 16000000.video: Invalid MB address 0xe9957e00 (out of range)
> 
> Tested using:
> 
> media-ctl -d /dev/media0 --set-v4l2 '"ov5645 0-003c":0[fmt:UYVY8_2X8/1280x960@1/60 field:none]'
> media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:UYVY8_2X8/1280x960]'
> media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:UYVY8_2X8/1280x960]'
> 
> gst-launch-1.0 v4l2src device=/dev/video0 io-mode=dmabuf ! video/x-raw,format=UYVY,width=1280,height=960 !  videoconvert ! queue ! glimagesink sync=false
> 
> Let me gently know if I'm missing somenthing.

Ooh. I don't think you're missing anything...does it happen every time? Let me see if I can work out 
what would trigger that - thanks for testing!

Dan

> 
> Thanks & Regards,
> Tommaso
> 
> 
> 
>>


