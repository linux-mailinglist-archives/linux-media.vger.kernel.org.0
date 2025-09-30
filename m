Return-Path: <linux-media+bounces-43413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C10BABEDC
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 09:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACCB01C5EEB
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 07:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C39B2C0F87;
	Tue, 30 Sep 2025 07:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IWDOL2pu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243F22C236D
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759219063; cv=none; b=jzx1mfcYX7B5iBH0NN6qrQ7632oIUqycTmcs+G0U376Z4fvo53PKqVk+3BFHPGiS+mBIVx43MB/efobjKjq/SCySWpCqDVHc7MtioCEV2eCJDm8/wetBQR8lDo8q75Yt8WzcxmcTRzlFUtv04ys0X1gzEKVjlyRVgK4ZDJ5n3lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759219063; c=relaxed/simple;
	bh=kB+p77tp8oe/fZNGeJVDnoSxpAdrCxogKfsHYbY1fSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVMN/6xknPoLzk1FFXJbjDxmG1FpRMfqpZMvsP612h/5TAXwRZyuRRpGXSS0eAl+PX9DE0eB/ceOKI98mF1CtjOaLGsu63lVbdj3nVO25U51VVoMDutBC1ES5PI9L5PiuU1UVwJ8j7WmhX7SpzjD13V7sy/2/yNBnu/Pt7Xz+Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IWDOL2pu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EB1D42B;
	Tue, 30 Sep 2025 09:56:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759218971;
	bh=kB+p77tp8oe/fZNGeJVDnoSxpAdrCxogKfsHYbY1fSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IWDOL2puheWwFabajEGkVHPFjJCy0jLj0IdaUpwhUARzNb9luvx7WIPSLDyfNQKXt
	 x92ksSFNBsXBDgW7vQKNGJJeew82pOAeybvBYUX/5AMbAJQq5l5kz1BanJe7GPvS+l
	 qYG+cMFO1YOlXe6g5MzSLBj9pTvNv7yncjzE8nLQ=
Date: Tue, 30 Sep 2025 09:57:35 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, laurent.pinchart+renesas@ideasonboard.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, tommaso.merciai.xr@bp.renesas.com, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH] media: rzg2l-cru: rework rzg2l_cru_fill_hw_slot()
Message-ID: <rf5tw5nebq5xnromtldxssnypz3gnpwzrieegnjjkuhrgdm2rm@jcoapowqbbup>
References: <20250918-rzg2l-cru-v1-1-fe110fdb91e5@ideasonboard.com>
 <52izfy5bkkw732n55q4ykrb65cwnot3lw4xtqt6lhjpwnfcuzr@wxrixkgezcz3>
 <c8d4f303-0bfc-43f5-96e3-24f30790d3af@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c8d4f303-0bfc-43f5-96e3-24f30790d3af@ideasonboard.com>

Hi Dan

On Mon, Sep 29, 2025 at 09:43:44PM +0100, Dan Scally wrote:
> Hi Jacopo - thanks for the comments
>
> On 29/09/2025 19:18, Jacopo Mondi wrote:
> > Hi Dan
> >
> > On Thu, Sep 18, 2025 at 01:08:55PM +0100, Daniel Scally wrote:
> > > The current implementation of rzg2l_cru_fill_hw_slot() results in the
> > > artificial loss of frames. At present whenever a frame-complete IRQ
> > > is received the driver fills the hardware slot that was just written
> > > to with the address of the next buffer in the driver's queue. If the
> > > queue is empty, that hardware slot's address is set to the address of
> > > the scratch buffer to enable the capture loop to keep running. There
> > > is a minimum of a two-frame delay before that slot will be written to
> > > however, and in the intervening period userspace may queue more
> > > buffers which could be used.
> >
> > As I understand it the driver uses three slots by default.
> > The hardware circles through them.
> >
> > The current implementation of rzg3e_cru_irq() (because I presume
> > you're using that variant) finds the last used slot with
> > rzg3e_cru_get_current_slot() and the re-programs it with the address
> > of the next buffer provided by userspace. The other version of the
> > interrupt handler rzg2l_cru_irq() does the same, using a register not
> > present in the g3e version.
> >
> > This means that if we hit an underrun, we waste a frame even if in
> > between two frame interrupts userspace has queued something.
> >
> > Something like
> >
> > X = programmed
> > O = scratch
> >
> > Starting condition:
> >
> > Slot #    0   1   2
> >          +---+---+---+
> >          | X | X |X |
> >          +---+---+---+
> >
> > 0 completes and there are no buffers in queue
> > Slot 0 gets programmed with the scratch buffer addrs
> >
> > Slot #    0   1   2
> >          +---+---+---+
> >          | O | X |X |
> >          +---+---+---+
> >
> > 1 completes and there are buffers in queue now
> > 1 gets programmed with a new valid address, 0 stays to the
> > the scratch buffer
> >
> > Slot #    0   1   2
> >          +---+---+---+
> >          | O | X'|X |
> >          +---+---+---+
> >
> > So yeah, it seems possible for some frames to be dropped if userspace
> > doesn't keep up!
>
> Yes that's my understanding exactly.
>
> >
> > >
> > > To resolve the issue rework rzg2l_cru_fill_hw_slot() so that it
> > > iteratively fills all slots from the queue which currently do not
> > > have a buffer assigned, until the queue is empty. The scratch
> >
> > Ok, I was a bit confused by this. You use "slots from the queue"
> > and "queue is empty" but these are two different queues possibily..
> >
> > Should "slots from the queue" be just "slots" maybe ?
>
> Err, I mean it uses buffers from the queue to fill the slots until the queue
> is empty...does that make it clearer?

I don't know, it's certainly me but:

fills all slots from the queue which currently do not have a buffer
assigned, until the queue is empty.

I don't know if "which currently do not have a buffer assigned" refers
to the slots or to the queue (I have read the patch and familiarized
with slots, so I now know it refers to slots), as well as I didn't get
from "fills all slots from the queue" where the queue of slots lived.

Up to you anyway, it's certainly my poor English here.
>
> >
> > > buffer is only resorted to in the event that the queue is empty and
> > > the next slot that will be written to does not already have a buffer
> > > assigned.
> > >
> > > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > ---
> > >   .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 63 +++++++++++-----------
> > >   1 file changed, 32 insertions(+), 31 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index 941badc90ff55c5225644f88de1d70239eb3a247..9ffafb0239a7388104219b2b72eec9051db82078 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -192,45 +192,47 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
> > >   }
> > >
> > >   /*
> > > - * Moves a buffer from the queue to the HW slot. If no buffer is
> > > - * available use the scratch buffer. The scratch buffer is never
> > > - * returned to userspace, its only function is to enable the capture
> > > - * loop to keep running.
> > > + * Move as many buffers as possible from the queue to HW slots. If no buffer is
> >
> > I wonder if we should try to exauhst the buffers queue or care about
> > the next available one only. After all the next interrupts will take
> > care of it, and if we prequeue all buffers then we'll have to return
> > them in order when streaming is stopped (I didn't check if this how
> > this is handled tbh).
>
> Yeah...the same thought occurred to me. I suppose that the benefit would be
> with a really high frame-rate; because we're writing the addresses of the
> next buffers a couple of frames in advance, there's less risk of the
> hardware attempting to write to an slot that hasn't been programmed with a
> buffer yet if the driver takes longer to write that address than the camera
> takes to send the next frame? I don't know how much of a risk that is though
> really.
>

The fact we have multiple slots indeed suggests the idea is to
pre-program as much as we could. I think it won't bring any actual
benefit as we get an irq every frame and we do address
calculations and programming anyhow. However, makes sense to try to
program all slots available (more relevant if/when the num_buf gets
increased I guess). Just be sure that all pre-programmed buffers,
removed from the cru->buf_list list here are correctly returned to
userspace when streaming is stopped (vb2 should be loud an warn if
that doesn't happen though). It might be difficult to simulate a
situation where more than two buffers are pre-programmed with just
three slots though ?

> >
> >
> > > + * available and the next slot currently lacks one then use the scratch buffer.
> > > + * The scratch buffer is never returned to userspace, its only function is to
> > > + * enable the capture loop to keep running.
> > >    */
> > > -static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
> > > +static void rzg2l_cru_fill_hw_slots(struct rzg2l_cru_dev *cru, int slot)
> >
> >
> > Now both rzg2l_cru_irq() and rzg3e_cru_irq() call this function as
> >
> > 		rzg2l_cru_fill_hw_slots(cru, (slot + 1) % cru->num_buf);
> >
> > the "slot" parameters indicate the one which the hardware is currently
> > writing to, right ?
>
> From the call-sites, "slot" is the slot that the hardware is currently
> writing to. "(slot + 1) % cru->num_buf" is "the next slot", so the effect is
> to tell rzg2l_cru_fill_hw_slots() to start filling hw slots with buffer
> addresses from the queue, starting from the next slot that the hardware will
> write to.

This is not my understanding

RZ/G2L:

        /* Prepare for capture and update state */
	amnmbs = rzg2l_cru_read(cru, AMnMBS);
	slot = amnmbs & AMnMBS_MBSTS;

	/*
	 * AMnMBS.MBSTS indicates the destination of Memory Bank (MB).
	 * Recalculate to get the current transfer complete MB.
	 */
	if (slot == 0)
		slot = cru->num_buf - 1;
	else
		slot--;

The AMnMBS_MBSTS register reads as
"Indicates which memory bank the image data is being transferred to"

We're handling the EFE (frame end) interrupt but I haven't found in
the documentation where MBSTS is updted though. The fact the code
offsets it by one makes me thing it has been updated when we receive
the interrupt and that it is offset by 1 to indicate the "slot where
frames have been captured to"

RZ/G3E is a bit more complex

Starting from the fact the driver enables FS/FE interrupts but I don't
really understand which one is handled in rzg3e_cru_irq(). Then there
is no register to know the current active slot but the driver has
rzg3e_cru_get_current_slot() which in my understanding calculates the
just completed slot. In this case it is not offset by 1 as in the g2l
version.


>
> >
> > >   {
> > > -	struct vb2_v4l2_buffer *vbuf;
> > > +	unsigned int from_slot = slot;
> >
> > If the above is true you can start from the next one already,
> > if "slot" is the one in use
>
> Not sure I follow that I'm afraid.

If 'slot' in the irq handlers is the just completed one, then 'slot +
1' received from this function is the currently active one. You can
here start inspecting slots from the next one as the current one in
use shouldn't be touched

Simply

	unsigned int from_slot = slot + 1;

>
> >
> > >   	struct rzg2l_cru_buffer *buf;
> > > +	struct vb2_v4l2_buffer *vbuf;
> > >   	dma_addr_t phys_addr;
> > >
> > > -	/* A already populated slot shall never be overwritten. */
> > > -	if (WARN_ON(cru->queue_buf[slot]))
> > > -		return;
> > > -
> > > -	dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
> > > +	do {
> >
> > I know it's safe here, but do {} while() always scare me a bit, as
> > they can easily escape and spin forever.
>
> Hah - pretty sure that's the first time I've ever actually written one!
>
> >
> > What about
> >          for (unsigned int next_slot = (slot + 1) % num_buf;
> >               next_slot != slot; next_slot = (next_slot + 1) % num_buf)) {
> >
> >          }
> >
> > untested :)
> Looks fine to me too, and I'm happy to switch.
>
> >
> > > +		if (cru->queue_buf[slot]) {
> > > +			slot = (slot + 1) % cru->num_buf;
> > > +			continue;
> > > +		}
> > >
> > > -	if (list_empty(&cru->buf_list)) {
> >
> > The buf_list is accessed without locking. This in only called from irq
> > context and before streaming, so it shouldn't be a problem in
> > practice
>
> Indeed, and in the interrupt handlers cru->qlock is held.
>

Yeah, the handlers lock the spinlock for the whole duration of the
interrupt for no real reason if it only serves to protect the buffer
queue. The locking in this driver would benefit an audit, but not for
this patch.

> >
> > > -		cru->queue_buf[slot] = NULL;
> > > -		phys_addr = cru->scratch_phys;
> > > -	} else {
> > > -		/* Keep track of buffer we give to HW */
> > > -		buf = list_entry(cru->buf_list.next,
> > > -				 struct rzg2l_cru_buffer, list);
> > > -		vbuf = &buf->vb;
> > > -		list_del_init(to_buf_list(vbuf));
> > > -		cru->queue_buf[slot] = vbuf;
> > > -
> > > -		/* Setup DMA */
> > > -		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> > > -	}
> > > +		if (list_empty(&cru->buf_list)) {
> > > +			if (slot == from_slot)
> > > +				phys_addr = cru->scratch_phys;
> >
> > I might have missed where cru->queue_buf[slot] is reset to NULL..
>
> In the interrupt handlers, before they call rzg2l_cru_fill_hw_slots()

But that's for the current slot only, if you set any slot to scratch
buffers you should set the corresponding entry to NULL here as well ?

>
> >
> > > +			else
> > > +				return;
> >
> > I guess you can return unconditonally here. if list_empty() we have
> > nothing more to do
>
> Er no we still need to call rzg2l_cru_set_slot_addr() to write the address
> of the scratch buffer to hardware.
>

Right right, see below

> >
> > > +		} else {
> > > +			buf = list_first_entry(&cru->buf_list,
> > > +					       struct rzg2l_cru_buffer, list);
> >
> > You could use list_first_entry_or_null() in place of list_empty()
> > before and avoid a double lookup
>
> Good point; thank you!
>
> >
> > > +			vbuf = &buf->vb;
> > > +			list_del_init(&buf->list);
> > > +			cru->queue_buf[slot] = vbuf;
> > > +			phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> > > +		}
> > >
> > > -	rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
> > > +		dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
> > > +		rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
> > > +		slot = (slot + 1) % cru->num_buf;
> > > +	} while (slot != from_slot);
> >
> >
> > This feels easier to me
> >
> > 	for (unsigned int next_slot = (slot + 1) % cru->num_buf;
> > 	     next_slot != slot; next_slot = (next_slot + 1) % cru->num_buf) {
> >
> > 		/* An already populated slot shall never be overwritten. */
> > 		if (cru->queue_buf[slot])
> > 			continue;
> >
> > 		buf = list_first_entry_or_null(&cru->buf_list,
> > 					       struct rzg2l_cru_buffer, list);
> > 		if (!buf) {
> > 			phys_addr = cru->scratch_phys;
> > 			cru->queue_buf[slot] = NULL;
> >
> > 			return;
> > 		}
>
> I think here ...
>
> 	} else {
> 		vbuf = &buf->vb;
> 		list_del_init(&buf->list);
> 		cru->queue_buf[slot] = vbuf;
> 		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> 	}

I would:

 		buf = list_first_entry_or_null(&cru->buf_list,
 					       struct rzg2l_cru_buffer, list);
 		if (!buf) {
 			phys_addr = cru->scratch_phys;
 			cru->queue_buf[slot] = NULL;
                        rzg2l_cru_set_slot_addr(cru, slot, phys_addr);

 			return;
 		}

 		vbuf = &buf->vb;
 		list_del_init(&buf->list);
 		cru->queue_buf[slot] = vbuf;
 		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
                rzg2l_cru_set_slot_addr(cru, slot, phys_addr);



> }
>
> And then yeah that looks good to me - I'll switch to that.
>
> Thanks
> Dan
>         >
> > 		vbuf = &buf->vb;
> > 		list_del_init(&buf->list);
> > 		cru->queue_buf[slot] = vbuf;
> > 		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> > 		rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
> >       }
> >
> > What do you think ?
> >
> > >   }
> > >
> > >   static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > >   {
> > >   	const struct rzg2l_cru_info *info = cru->info;
> > > -	unsigned int slot;
> > >   	u32 amnaxiattr;
> > >
> > >   	/*
> > > @@ -239,8 +241,7 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > >   	 */
> > >   	rzg2l_cru_write(cru, AMnMBVALID, AMnMBVALID_MBVALID(cru->num_buf - 1));
> > >
> > > -	for (slot = 0; slot < cru->num_buf; slot++)
> > > -		rzg2l_cru_fill_hw_slot(cru, slot);
> > > +	rzg2l_cru_fill_hw_slots(cru, 0);
> > >
> > >   	if (info->has_stride) {
> > >   		u32 stride = cru->format.bytesperline;
> > > @@ -652,7 +653,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
> > >   	cru->sequence++;
> > >
> > >   	/* Prepare for next frame */
> > > -	rzg2l_cru_fill_hw_slot(cru, slot);
> > > +	rzg2l_cru_fill_hw_slots(cru, (slot + 1) % cru->num_buf);
> > >
> > >   done:
> > >   	spin_unlock_irqrestore(&cru->qlock, flags);
> > > @@ -752,7 +753,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
> > >   		cru->sequence++;
> > >
> > >   		/* Prepare for next frame */
> > > -		rzg2l_cru_fill_hw_slot(cru, slot);
> > > +		rzg2l_cru_fill_hw_slots(cru, (slot + 1) % cru->num_buf);
> > >   	}
> > >
> > >   	return IRQ_HANDLED;
> > >
> > > ---
> > > base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> > > change-id: 20250918-rzg2l-cru-0554a4352a70
> > >
> > > Best regards,
> > > --
> > > Daniel Scally <dan.scally@ideasonboard.com>
> > >
> > >
>
>
>
>

