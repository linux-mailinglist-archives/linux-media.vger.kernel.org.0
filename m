Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAD59631144
	for <lists+linux-media@lfdr.de>; Sat, 19 Nov 2022 23:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbiKSWlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Nov 2022 17:41:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234291AbiKSWlg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Nov 2022 17:41:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE2910B51
        for <linux-media@vger.kernel.org>; Sat, 19 Nov 2022 14:41:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FB36749;
        Sat, 19 Nov 2022 23:41:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668897693;
        bh=oIK/hunOfTd+jHNagwuMJayGs2NQvoTUfIHeXhHiekQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GpwYdY3ocrx1vLP9y9NYkUrhjD6641oGR0HjrHFGhY/Szp0wl66qUvMXQHnhIp1hR
         UBFvg4AILVm4a1OYcJlaqC3Fw3mAYnnOVTtj1r4sJG3eLZFSPZ4GBH9e8ZdAS/VSuF
         OZ9l5+6+gfdl3VPe2XxsdL5Dy5ZJ8380MBd9i0tQ=
Date:   Sun, 20 Nov 2022 00:41:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH v3] media: imx: imx7-media-csi: Add support for
 fast-tracking queued buffers
Message-ID: <Y3lbjVA21uLmdk1c@pendragon.ideasonboard.com>
References: <20220908083739.11586-1-laurent.pinchart@ideasonboard.com>
 <Y3dOStq8TLxtROR0@pyrite.rasen.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y3dOStq8TLxtROR0@pyrite.rasen.tech>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Fri, Nov 18, 2022 at 06:20:10PM +0900, Paul Elder wrote:
> Gentle ping

Thanks for the ping. This patch is now part of a pull request for v6.2:
https://patchwork.linuxtv.org/project/linux-media/patch/Y3lbLjxTe1P5TJsm@pendragon.ideasonboard.com/

> On Thu, Sep 08, 2022 at 11:37:39AM +0300, Laurent Pinchart wrote:
> > From: Paul Elder <paul.elder@ideasonboard.com>
> > 
> > The CSI hardware compatible with this driver handles buffers using a
> > ping-pong mechanism with two sets of destination addresses. Normally,
> > when an interrupt comes in to signal the completion of one buffer, say
> > FB1, it assigns the next buffer in the queue to the next FB1, and the
> > hardware starts to capture into FB2 in the meantime.
> > 
> > In a buffer underrun situation, in the above example without loss of
> > generality, if a new buffer is queued before the interrupt for FB1 comes
> > in, we can program the buffer into FB2 (which is programmed with a dummy
> > buffer, as there is a buffer underrun).
> > 
> > This of course races with the interrupt that signals FB1 completion, as
> > once that interrupt comes in, we are no longer guaranteed that the
> > programming of FB2 was in time and must assume it was too late. This
> > race is resolved partly by locking the programming of FB2. If it came
> > after the interrupt for FB1, then the variable that is used to determine
> > which FB to program would have been swapped by the interrupt handler.
> > 
> > This alone isn't sufficient, however, because the interrupt could still
> > be generated (thus the hardware starts capturing into the other fb)
> > while the fast-tracking routine has the irq lock. Thus, after
> > programming the fb register to fast-track the buffer, the isr also must
> > be checked to confirm that an interrupt didn't come in the meantime. If
> > it has, we must assume that programming the register for the
> > fast-tracked buffer was not in time, and queue the buffer normally.
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v2:
> > 
> > - Update comments
> > 
> > Changes since v1:
> > 
> > - Fix the potential race condition where the interrupt comes in while
> >   the fast tracking routine has the irqlock
> > - Change return value from int to bool
> > ---
> >  drivers/staging/media/imx/imx7-media-csi.c | 76 ++++++++++++++++++++++
> >  1 file changed, 76 insertions(+)
> > 
> > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> > index a0553c24cce4..ac35cbc16e73 100644
> > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > @@ -1296,12 +1296,88 @@ static int imx7_csi_video_buf_prepare(struct vb2_buffer *vb)
> >  	return 0;
> >  }
> >  
> > +static bool imx7_csi_fast_track_buffer(struct imx7_csi *csi,
> > +				       struct imx7_csi_vb2_buffer *buf)
> > +{
> > +	unsigned long flags;
> > +	dma_addr_t phys;
> > +	int buf_num;
> > +	u32 isr;
> > +
> > +	if (!csi->is_streaming)
> > +		return false;
> > +
> > +	phys = vb2_dma_contig_plane_dma_addr(&buf->vbuf.vb2_buf, 0);
> > +
> > +	/*
> > +	 * buf_num holds the framebuffer ID of the most recently (*not* the
> > +	 * next anticipated) triggered interrupt. Without loss of generality,
> > +	 * if buf_num is 0, the hardware is capturing to FB2. If FB1 has been
> > +	 * programmed with a dummy buffer (as indicated by active_vb2_buf[0]
> > +	 * being NULL), then we can fast-track the new buffer by programming
> > +	 * its address in FB1 before the hardware completes FB2, instead of
> > +	 * adding it to the buffer queue and incurring a delay of one
> > +	 * additional frame.
> > +	 *
> > +	 * The irqlock prevents races with the interrupt handler that updates
> > +	 * buf_num when it programs the next buffer, but we can still race with
> > +	 * the hardware if we program the buffer in FB1 just after the hardware
> > +	 * completes FB2 and switches to FB1 and before buf_num can be updated
> > +	 * by the interrupt handler for FB2.  The fast-tracked buffer would
> > +	 * then be ignored by the hardware while the driver would think it has
> > +	 * successfully been processed.
> > +	 *
> > +	 * To avoid this problem, if we can't avoid the race, we can detect
> > +	 * that we have lost it by checking, after programming the buffer in
> > +	 * FB1, if the interrupt flag indicating completion of FB2 has been
> > +	 * raised. If that is not the case, fast-tracking succeeded, and we can
> > +	 * update active_vb2_buf[0]. Otherwise, we may or may not have lost the
> > +	 * race (as the interrupt flag may have been raised just after
> > +	 * programming FB1 and before we read the interrupt status register),
> > +	 * and we need to assume the worst case of a race loss and queue the
> > +	 * buffer through the slow path.
> > +	 */
> > +
> > +	spin_lock_irqsave(&csi->irqlock, flags);
> > +
> > +	buf_num = csi->buf_num;
> > +	if (csi->active_vb2_buf[buf_num]) {
> > +		spin_unlock_irqrestore(&csi->irqlock, flags);
> > +		return false;
> > +	}
> > +
> > +	imx7_csi_update_buf(csi, phys, buf_num);
> > +
> > +	isr = imx7_csi_reg_read(csi, CSI_CSISR);
> > +	if (isr & (buf_num ? BIT_DMA_TSF_DONE_FB1 : BIT_DMA_TSF_DONE_FB2)) {
> > +		/*
> > +		 * The interrupt for the /other/ FB just came (the isr hasn't
> > +		 * run yet though, because we have the lock here); we can't be
> > +		 * sure we've programmed buf_num FB in time, so queue the buffer
> > +		 * to the buffer queue normally. No need to undo writing the FB
> > +		 * register, since we won't return it as active_vb2_buf is NULL,
> > +		 * so it's okay to potentially write it to both FB1 and FB2;
> > +		 * only the one where it was queued normally will be returned.
> > +		 */
> > +		spin_unlock_irqrestore(&csi->irqlock, flags);
> > +		return false;
> > +	}
> > +
> > +	csi->active_vb2_buf[buf_num] = buf;
> > +
> > +	spin_unlock_irqrestore(&csi->irqlock, flags);
> > +	return true;
> > +}
> > +
> >  static void imx7_csi_video_buf_queue(struct vb2_buffer *vb)
> >  {
> >  	struct imx7_csi *csi = vb2_get_drv_priv(vb->vb2_queue);
> >  	struct imx7_csi_vb2_buffer *buf = to_imx7_csi_vb2_buffer(vb);
> >  	unsigned long flags;
> >  
> > +	if (imx7_csi_fast_track_buffer(csi, buf))
> > +		return;
> > +
> >  	spin_lock_irqsave(&csi->q_lock, flags);
> >  
> >  	list_add_tail(&buf->list, &csi->ready_q);

-- 
Regards,

Laurent Pinchart
