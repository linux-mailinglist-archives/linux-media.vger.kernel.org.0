Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31B8739F70F
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 14:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbhFHMsT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 08:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232744AbhFHMsS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 08:48:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9363CC061574
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 05:46:25 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D5C23E6;
        Tue,  8 Jun 2021 14:46:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623156382;
        bh=9m0EqAgQT7YQAU3mAqeGXH3PSkRfp1efRdL1QVOAntY=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=cQMqysj0afk3H/ea27oieFh45qLyR++2FkCeTr201GqtpsQxPT/cd+f77W59zB8sh
         4LhALTLE8eZQlRiDbiEHftflYxT53O095PyiYbC9pkzwGP+uodvijhDFTJpya7RE+2
         KwJ+7OnzFr2DmulxixPpLXYtIRBrUMdP24alg0x0=
Subject: Re: [PATCH v3 32/38] media: ti-vpe: cal: use CSI-2 frame number
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-33-tomi.valkeinen@ideasonboard.com>
 <YLozAqLmoKnHzQEi@pendragon.ideasonboard.com>
 <ca4c24d2-4edc-5ba4-970c-381195545a00@ideasonboard.com>
 <YL4iKZv5YV3LllIK@pendragon.ideasonboard.com>
 <b28c71d4-e7b1-2f21-530b-a108cfe0c337@ideasonboard.com>
 <YL5OpCAmfrMUibXq@pendragon.ideasonboard.com>
 <d72d4f1e-19e1-8e9f-19da-469e88638653@ideasonboard.com>
Message-ID: <3721c31f-d2a4-6800-cb27-4bd47971d401@ideasonboard.com>
Date:   Tue, 8 Jun 2021 15:46:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d72d4f1e-19e1-8e9f-19da-469e88638653@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/06/2021 10:38, Tomi Valkeinen wrote:
> On 07/06/2021 19:51, Laurent Pinchart wrote:
>> Hi Tomi,
>>
>> On Mon, Jun 07, 2021 at 05:55:05PM +0300, Tomi Valkeinen wrote:
>>> On 07/06/2021 16:42, Laurent Pinchart wrote:
>>>> On Mon, Jun 07, 2021 at 03:39:45PM +0300, Tomi Valkeinen wrote:
>>>>> On 04/06/2021 17:04, Laurent Pinchart wrote:
>>>>>> On Mon, May 24, 2021 at 02:09:03PM +0300, Tomi Valkeinen wrote:
>>>>>>> The driver fills buf->vb.sequence with an increasing number which is
>>>>>>> incremented by the driver. This feels a bit pointless, as the 
>>>>>>> userspace
>>>>>>> could as well track that kind of number itself. Instead, lets use 
>>>>>>> the
>>>>>>
>>>>>> s/lets/let's/
>>>>>>
>>>>>>> frame number provided in the CSI-2 data from the sensor.
>>>>>>>
>>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>>>> ---
>>>>>>>     drivers/media/platform/ti-vpe/cal.c | 7 +++++--
>>>>>>>     drivers/media/platform/ti-vpe/cal.h | 1 -
>>>>>>>     2 files changed, 5 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/media/platform/ti-vpe/cal.c 
>>>>>>> b/drivers/media/platform/ti-vpe/cal.c
>>>>>>> index 888706187fd1..62c45add4efe 100644
>>>>>>> --- a/drivers/media/platform/ti-vpe/cal.c
>>>>>>> +++ b/drivers/media/platform/ti-vpe/cal.c
>>>>>>> @@ -493,7 +493,6 @@ void cal_ctx_unprepare(struct cal_ctx *ctx)
>>>>>>>     void cal_ctx_start(struct cal_ctx *ctx)
>>>>>>>     {
>>>>>>> -    ctx->sequence = 0;
>>>>>>>         ctx->dma.state = CAL_DMA_RUNNING;
>>>>>>>         /* Configure the CSI-2, pixel processing and write DMA 
>>>>>>> contexts. */
>>>>>>> @@ -586,6 +585,10 @@ static inline void cal_irq_wdma_start(struct 
>>>>>>> cal_ctx *ctx)
>>>>>>>     static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
>>>>>>>     {
>>>>>>>         struct cal_buffer *buf = NULL;
>>>>>>> +    u32 frame_num;
>>>>>>> +
>>>>>>> +    frame_num = cal_read(ctx->cal, 
>>>>>>> CAL_CSI2_STATUS(ctx->phy->instance,
>>>>>>> +                               ctx->csi2_ctx)) & 0xffff;
>>>>>>>         spin_lock(&ctx->dma.lock);
>>>>>>> @@ -607,7 +610,7 @@ static inline void cal_irq_wdma_end(struct 
>>>>>>> cal_ctx *ctx)
>>>>>>>         if (buf) {
>>>>>>>             buf->vb.vb2_buf.timestamp = ktime_get_ns();
>>>>>>>             buf->vb.field = ctx->v_fmt.fmt.pix.field;
>>>>>>> -        buf->vb.sequence = ctx->sequence++;
>>>>>>> +        buf->vb.sequence = frame_num;
>>>>>>
>>>>>> We'll need something a bit more complicated. The CSI-2 frame 
>>>>>> number is
>>>>>> not mandatory, and when used, it is a 16-bit number starting at 1 and
>>>>>> counting to an unspecified value larger than one, resetting to 1 
>>>>>> at the
>>>>>> end of the cycle. The V4L2 sequence number, on the other hand, is a
>>>>>> monotonic counter starting at 0 and wrapping only at 2^32-1. We 
>>>>>> should
>>>>>> thus keep a software sequence counter and
>>>>>>
>>>>>> - increase it by 1 if the frame number is zero
>>>>>> - increase it by frame_num - last_frame_num (with wrap-around of
>>>>>>      frame_num handled) otherwise
>>>>>
>>>>> Ok... I wonder if we need a new field for this, though. The problem I
>>>>> was solving when I changed this to use the CSI-2 frame-number was 
>>>>> how to
>>>>> associate a pixel frame and a metadata frame.
>>>>>
>>>>> Their CSI-2 frame-numbers match (as they are from the same original
>>>>> CSI-2 frame), so the userspace can use that to figure the matching
>>>>> frames. While the above method you suggest should give us identical
>>>>> sequence numbers for pixel and metadata, I think it's going a bit away
>>>>> from my intended purpose, and possibly risks ending up with different
>>>>> sequences for pixel and metadata.
>>>>
>>>> Why do you think they could get out of sync (assuming the sensor
>>>> supports frame numbers of course, if it always returns 0, that's not
>>>> usable for the purpose of synchronization).
>>>
>>> If there's a requirement that the sequence starts from 0, it doesn't
>>> work, as the pixel and metadata video capture may be started at
>>> different times. When pixel capture starts, the frame number could be 10
>>> and pixel sequence would be 0, but when metadata capture starts, the
>>> frame number could be 12, and pixel seq would thus be 2 and meta seq 0.
>>>
>>> But even if we allow the seq to start from the current frame number,
>>
>> Good point. I think we can allow starting at a non-zero value to handle
>> this.
>>
>>> this doesn't work if the frame number has wrapped between starting the
>>> pixel capture and starting the meta capture.
>>
>> The timestamp should be enough to handle this, the timestamp difference
>> between two wraparounds should be large enough to sync the two streams
>> without any risk.
> 
> Well, this still won't work, as CAL doesn't know when the sensor's frame 
> counter wraps. CAL can detect that the counter has wrapped, but it 
> doesn't know if some frames were missed. This leads to the two streams 
> getting out of sync.
> 
> I'll try to figure out if I can somehow handle the frame counter in a 
> shared manner, so that multiple streams that originate from the same 
> frame would always use the same sequence numbers for same frame numbers.

How about something like this:

commit 22fb554bd2b71fa6d245e2595424639bee0ed604
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date:   Tue Apr 13 11:20:41 2021 +0300

     media: ti-vpe: cal: use CSI-2 frame number
     
     The userspace needs a way to match received metadata buffers to pixel
     data buffers. The obvious way to do this is to use the CSI-2 frame
     number, as both the metadata and the pixel data have the same frame
     number as they come from the same frame.
     
     However, we don't have means to convey the frame number to userspace. We
     do have the 'sequence' field, which with a few tricks can be used for
     this purpose.
     
     To achieve this, track the frame number for each virtual channel and
     increase the sequence for each virtual channel by frame-number -
     previous-frame-number, also taking into account the eventual wrap of the
     CSI-2 frame number.
     
     This way we get a monotonically increasing sequence number which is
     common to all streams using the same virtual channel.
     
     Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 82392499e663..3ca629278fd4 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -801,6 +801,8 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
  	phy->cal = cal;
  	phy->instance = instance;
  
+	spin_lock_init(&phy->vc_lock);
+
  	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
  						(instance == 0) ?
  						"cal_rx_core0" :
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 7a92bb9429d4..0594e47a2c88 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -493,7 +493,22 @@ void cal_ctx_unprepare(struct cal_ctx *ctx)
  
  void cal_ctx_start(struct cal_ctx *ctx)
  {
-	ctx->sequence = 0;
+	struct cal_camerarx *phy = ctx->phy;
+
+	/*
+	 * Reset the frame number & sequence number, but only if the
+	 * virtual channel is not already in use.
+	 */
+
+	spin_lock(&phy->vc_lock);
+
+	if (phy->vc_enable_count[ctx->vc]++ == 0) {
+		phy->vc_frame_number[ctx->vc] = 0;
+		phy->vc_sequence[ctx->vc] = 0;
+	}
+
+	spin_unlock(&phy->vc_lock);
+
  	ctx->dma.state = CAL_DMA_RUNNING;
  
  	/* Configure the CSI-2, pixel processing and write DMA contexts. */
@@ -513,8 +528,15 @@ void cal_ctx_start(struct cal_ctx *ctx)
  
  void cal_ctx_stop(struct cal_ctx *ctx)
  {
+	struct cal_camerarx *phy = ctx->phy;
  	long timeout;
  
+	WARN_ON(phy->vc_enable_count[ctx->vc] == 0);
+
+	spin_lock(&phy->vc_lock);
+	phy->vc_enable_count[ctx->vc]--;
+	spin_unlock(&phy->vc_lock);
+
  	/*
  	 * Request DMA stop and wait until it completes. If completion times
  	 * out, forcefully disable the DMA.
@@ -586,7 +608,6 @@ static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
  static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
  {
  	struct cal_buffer *buf = NULL;
-
  	spin_lock(&ctx->dma.lock);
  
  	/* If the DMA context was stopping, it is now stopped. */
@@ -605,9 +626,28 @@ static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
  	spin_unlock(&ctx->dma.lock);
  
  	if (buf) {
+		struct cal_dev *cal = ctx->cal;
+		struct cal_camerarx *phy = ctx->phy;
+		u32 prev_frame_num, frame_num;
+		u8 vc = ctx->vc;
+
+		frame_num = cal_read(cal, CAL_CSI2_STATUS(ctx->phy->instance,
+							  ctx->csi2_ctx)) & 0xffff;
+
+		if (phy->vc_frame_number[vc] != frame_num) {
+			prev_frame_num = phy->vc_frame_number[vc];
+
+			if (prev_frame_num > frame_num)
+				prev_frame_num = 0;
+
+			phy->vc_sequence[vc] += frame_num - prev_frame_num;
+			phy->vc_frame_number[vc] = frame_num;
+		}
+
  		buf->vb.vb2_buf.timestamp = ktime_get_ns();
  		buf->vb.field = ctx->v_fmt.fmt.pix.field;
-		buf->vb.sequence = ctx->sequence++;
+		buf->vb.sequence = phy->vc_sequence[vc];
+
  		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
  	}
  }
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 400f95485d7c..309413e8a932 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -163,6 +163,12 @@ struct cal_camerarx {
  	struct v4l2_subdev	subdev;
  	struct media_pad	pads[2];
  	struct v4l2_mbus_framefmt	formats[2];
+
+	/* protects the vc_* fields below */
+	spinlock_t		vc_lock;
+	u8			vc_enable_count[4];
+	u8			vc_frame_number[4];
+	u32			vc_sequence[4];
  };
  
  struct cal_dev {
@@ -217,7 +223,6 @@ struct cal_ctx {
  	const struct cal_format_info	**active_fmt;
  	unsigned int		num_active_fmt;
  
-	unsigned int		sequence;
  	struct vb2_queue	vb_vidq;
  	u8			dma_ctx;
  	u8			cport;
