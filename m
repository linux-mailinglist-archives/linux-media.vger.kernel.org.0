Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCAF117D7B
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 03:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfLJCFc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 21:05:32 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46625 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbfLJCFc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 21:05:32 -0500
Received: by mail-lj1-f195.google.com with SMTP id z17so17910304ljk.13
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2019 18:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=3XtDBRQfUnDYoL13FCITda3QWOdDI1+jXBy3sZlq65o=;
        b=YX4uo6AKbAwZC4Mv410iMKqam71iZpznR9c+6Dw/THMLbG8t891MspUzWOPta9Wb2H
         ZSNk1xDDjdtI8wwhxP+DNqwaGnlb0Xd4c5nxkNXAteZ1RaC2+lGintl/fX1ix7W2dOnb
         eZEb3+YxxdX7dRt0/4gvWU+s1phcIXKMhTyI0bLRjSYZ2t2kHuP/Sg2EA5A6O7bmAkvb
         S0dRide/0WRCLeijrj5n66iRxL2Fu8LE8el8Jv39HG+kOkdvWFfYBhWJ4ffAuYsh/kGd
         TSBS003minji7K2rZOc6G9L8QZ+lOi+fOr5AZZKHgEStgn5NZVDEK7o/BGW8H82QZc+8
         yIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=3XtDBRQfUnDYoL13FCITda3QWOdDI1+jXBy3sZlq65o=;
        b=URMAKeivZkm+lPyFhDM9RE53rKd9S9qEGMPUCIBl+EPFEzAPqinwBuPExk8WyNNJnN
         MmXn4x/oPAn8yMUlOQP3Cmpo4y7EDl3gk2M9/pEC3M7mGEtprzI+kb2Lql6cYTxjJ9An
         qNc1jk+3udbeQwfprjH1NKLQrYayAHuYUFXejl4hN48lJkEQo984Nmmi++bng32ag6Xv
         bl/v4aY0VJVI1hxEjX+KGETwaG8mrW1Yxw+kx59GD8yVGeFxcnZqNeZzpG/uiSpQe3Rv
         hxNPGXkqZjtKi5HdhZAj3go9hjs8LOZu18AVQQh7mbpl+UYHf5ATxIp9jmOUV//oayd4
         yHgw==
X-Gm-Message-State: APjAAAUNv3fLfzSBMRLehbWDmnSDG12NoNcMHV3rnYSWh6xTcBZhpCIw
        MmPIm3NtzjBqpDTDsC9fqQUPI7KK+fE=
X-Google-Smtp-Source: APXvYqxJ6cMU+4KmOrBULQOyiORi1QHQdfthit1vM+8R6UXkbLV2mNCLZVnR8Gua84jQg+lcZ3vctw==
X-Received: by 2002:a2e:9755:: with SMTP id f21mr19117647ljj.23.1575943529220;
        Mon, 09 Dec 2019 18:05:29 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id r2sm562602lfn.13.2019.12.09.18.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 18:05:28 -0800 (PST)
Date:   Tue, 10 Dec 2019 03:05:27 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rcar-vin: Add support for V4L2_FIELD_SEQ_{TB,BT}
Message-ID: <20191210020527.GA12603@bigcity.dyn.berto.se>
References: <20191009222734.1911060-1-niklas.soderlund+renesas@ragnatech.se>
 <20191009222734.1911060-3-niklas.soderlund+renesas@ragnatech.se>
 <20191112115311.6f5xvxplqxfqkh5t@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191112115311.6f5xvxplqxfqkh5t@uno.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your feedback.

On 2019-11-12 12:53:11 +0100, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Thu, Oct 10, 2019 at 12:27:34AM +0200, Niklas Söderlund wrote:
> > The hardware does not support capturing the field types
> > V4L2_FIELD_SEQ_TB and V4L2_FIELD_SEQ_BT. To capture in these formats the
> > driver needs to adjust the offset of the capture buffer and capture
> > twice to each vb2 buffer.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-dma.c  | 57 ++++++++++++++++++---
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c |  7 ++-
> >  drivers/media/platform/rcar-vin/rcar-vin.h  | 19 +++++++
> >  3 files changed, 74 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > index a9fffadc268e96ba..c46f6e90627d45fd 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -534,7 +534,7 @@ static void rvin_crop_scale_comp_gen2(struct rvin_dev *vin)
> >
> >  	/* Set scaling coefficient */
> >  	crop_height = vin->crop.height;
> > -	if (V4L2_FIELD_IS_INTERLACED(vin->format.field))
> > +	if (V4L2_FIELD_HAS_BOTH(vin->format.field))
> >  		crop_height *= 2;
> 
> Below in this same function there is a check for IS_INTERLACED which
> has not been updated. It seems to be related to the post-clipping
> image height, which I'm not sure happens on the full frame or on the
> filed first. Could you confirm this was intentionally left out ?

Nice catch, that too should be updated to V4L2_FIELD_HAS_BOTH().

> 
> >
> >  	ys = 0;
> > @@ -625,6 +625,8 @@ static int rvin_setup(struct rvin_dev *vin)
> >  	case V4L2_FIELD_INTERLACED_BT:
> >  		vnmc = VNMC_IM_FULL | VNMC_FOC;
> >  		break;
> > +	case V4L2_FIELD_SEQ_TB:
> > +	case V4L2_FIELD_SEQ_BT:
> 
> Shouldn't you handle FOC depending on TB or BT ?

FOC only matters if we use the VIN to interlace the two fields. As VIN 
have no hardware support for BT/TB there is not much we can do with FOC.

> 
> >  	case V4L2_FIELD_NONE:
> >  		vnmc = VNMC_IM_ODD_EVEN;
> >  		progressive = true;
> > @@ -839,15 +841,23 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
> >  	struct rvin_buffer *buf;
> >  	struct vb2_v4l2_buffer *vbuf;
> >  	dma_addr_t phys_addr;
> > +	int prev;
> >
> >  	/* A already populated slot shall never be overwritten. */
> >  	if (WARN_ON(vin->buf_hw[slot].buffer != NULL))
> >  		return;
> >
> > -	vin_dbg(vin, "Filling HW slot: %d\n", slot);
> > +	prev = (slot == 0 ? HW_BUFFER_NUM : slot) - 1;
> >
> > -	if (list_empty(&vin->buf_list)) {
> > +	if (vin->buf_hw[prev].type == HALF_TOP) {
> > +		vbuf = vin->buf_hw[prev].buffer;
> > +		vin->buf_hw[slot].buffer = vbuf;
> > +		vin->buf_hw[slot].type = HALF_BOTTOM;
> > +		phys_addr = vin->buf_hw[prev].phys + vin->format.sizeimage /
> > +			(vin->format.pixelformat == V4L2_PIX_FMT_NV16 ? 4 : 2);
> 
> Shouldn't NV12 be handled as well ? in that case the sizeimage field
> is set to bytesperlin * height * 3 / 2, and should here be halved
> accordingly, doesn't it ?

You are right NV12 support have now landed upstream and should be 
handled here. But the halving of the sizeimage is just to find the start 
of the Y plane and not to undo the sizeimae callculation. Here the goal 
is to have the first half of the frame filled with Y plane (from two
captures to the same buffer) data and the second half the UV plane. Do 
do that we need to increase the phys offset + 1/4 while keeping the 
offset for the UV plane at 1/2 of output sizeimage.

> 
> 
> > +	} else if (list_empty(&vin->buf_list)) {
> >  		vin->buf_hw[slot].buffer = NULL;
> > +		vin->buf_hw[slot].type = FULL;
> >  		phys_addr = vin->scratch_phys;
> >  	} else {
> >  		/* Keep track of buffer we give to HW */
> > @@ -856,10 +866,18 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
> >  		list_del_init(to_buf_list(vbuf));
> >  		vin->buf_hw[slot].buffer = vbuf;
> >
> > +		vin->buf_hw[slot].type =
> > +			V4L2_FIELD_IS_SEQUENTIAL(vin->format.field) ?
> > +			HALF_TOP : FULL;
> > +
> >  		/* Setup DMA */
> >  		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> >  	}
> >
> > +	vin_dbg(vin, "Filling HW slot: %d type: %d buffer: %p\n",
> > +		slot, vin->buf_hw[slot].type, vin->buf_hw[slot].buffer);
> > +
> > +	vin->buf_hw[slot].phys = phys_addr;
> >  	rvin_set_slot_addr(vin, slot, phys_addr);
> >  }
> >
> > @@ -867,6 +885,11 @@ static int rvin_capture_start(struct rvin_dev *vin)
> >  {
> >  	int slot, ret;
> >
> > +	for (slot = 0; slot < HW_BUFFER_NUM; slot++) {
> > +		vin->buf_hw[slot].buffer = NULL;
> > +		vin->buf_hw[slot].type = FULL;
> > +	}
> > +
> >  	for (slot = 0; slot < HW_BUFFER_NUM; slot++)
> >  		rvin_fill_hw_slot(vin, slot);
> >
> > @@ -951,6 +974,16 @@ static irqreturn_t rvin_irq(int irq, void *data)
> >
> >  	/* Capture frame */
> >  	if (vin->buf_hw[slot].buffer) {
> > +		/*
> > +		 * Nothing to do but refill the hardware slot if
> > +		 * capture only filled first half of vb2 buffer.
> > +		 */
> > +		if (vin->buf_hw[slot].type == HALF_TOP) {
> > +			vin->buf_hw[slot].buffer = NULL;
> > +			rvin_fill_hw_slot(vin, slot);
> > +			goto done;
> > +		}
> > +
> >  		vin->buf_hw[slot].buffer->field =
> >  			rvin_get_active_field(vin, vnms);
> >  		vin->buf_hw[slot].buffer->sequence = vin->sequence;
> > @@ -978,14 +1011,22 @@ static void return_all_buffers(struct rvin_dev *vin,
> >  			       enum vb2_buffer_state state)
> >  {
> >  	struct rvin_buffer *buf, *node;
> > -	int i;
> > +	struct vb2_v4l2_buffer *freed[HW_BUFFER_NUM];
> > +	unsigned int i, n;
> >
> >  	for (i = 0; i < HW_BUFFER_NUM; i++) {
> > -		if (vin->buf_hw[i].buffer) {
> > -			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
> > -					state);
> > -			vin->buf_hw[i].buffer = NULL;
> > +		freed[i] = vin->buf_hw[i].buffer;
> > +		vin->buf_hw[i].buffer = NULL;
> > +
> > +		for (n = 0; n < i; n++) {
> > +			if (freed[i] == freed[n]) {
> > +				freed[i] = NULL;
> > +				break;
> > +			}
> 
> I'm not sure I get this...

The same buffer might exists in the vin->buf_hw array (once as top and 
once as bottom). We only wish to call vb2_buffer_done() once for each so 
we need this little dance to make sure we only call it once for each vb2 
buffer.

> 
> >  		}
> > +
> > +		if (freed[i])
> > +			vb2_buffer_done(&freed[i]->vb2_buf, state);
> >  	}
> >
> >  	list_for_each_entry_safe(buf, node, &vin->buf_list, list) {
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > index 9a9b89c0dc0b3be4..cbdb0a43aa439830 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -90,7 +90,10 @@ static u32 rvin_format_bytesperline(struct rvin_dev *vin,
> >  	if (WARN_ON(!fmt))
> >  		return -EINVAL;
> >
> > -	align = pix->pixelformat == V4L2_PIX_FMT_NV16 ? 0x20 : 0x10;
> > +	if (V4L2_FIELD_IS_SEQUENTIAL(pix->field))
> > +		align = 0x80;
> > +	else
> > +		align = pix->pixelformat == V4L2_PIX_FMT_NV16 ? 0x20 : 0x10;
> >
> >  	return ALIGN(pix->width, align) * fmt->bpp;
> >  }
> > @@ -118,6 +121,8 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
> >  	case V4L2_FIELD_INTERLACED_BT:
> >  	case V4L2_FIELD_INTERLACED:
> >  	case V4L2_FIELD_ALTERNATE:
> > +	case V4L2_FIELD_SEQ_TB:
> > +	case V4L2_FIELD_SEQ_BT:
> >  		break;
> >  	default:
> >  		pix->field = RVIN_DEFAULT_FIELD;
> > diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> > index 9031fe7f569b908e..8d48894bc49e4db6 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> > +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> > @@ -60,6 +60,23 @@ enum rvin_dma_state {
> >  	STOPPING,
> >  };
> >
> > +/**
> > + * enum rvin_buffer_type
> > + *
> > + * Describes how a buffer is given to the hardware. To be able
> > + * to capture SEQ_TB/BT it's needed to capture to the same vb2
> > + * buffer twice so the type of buffer needs to be kept.
> > + *
> > + * FULL - One capture fills the whole vb2 buffer
> > + * HALF_TOP- One capture fills the top half of the vb2 buffer
> 
> nit: HALF_TOP -

Thanks.

> 
> > + * HALF_BOTTOM - One capture fills the bottom half of the vb2 buffer
> 
> Isn't documentation generated for VIN ? I was about to suggest to
> prefix the enum members documentation with @ but I don't see any VIN
> documentation...

It's on my todo list to look into this.

> 
> Thanks
>    j
> 
> 
> > + */
> > +enum rvin_buffer_type {
> > +	FULL,
> > +	HALF_TOP,
> > +	HALF_BOTTOM,
> > +};
> > +
> >  /**
> >   * struct rvin_video_format - Data format stored in memory
> >   * @fourcc:	Pixelformat
> > @@ -204,6 +221,8 @@ struct rvin_dev {
> >  	spinlock_t qlock;
> >  	struct {
> >  		struct vb2_v4l2_buffer *buffer;
> > +		enum rvin_buffer_type type;
> > +		dma_addr_t phys;
> >  	} buf_hw[HW_BUFFER_NUM];
> >  	struct list_head buf_list;
> >  	unsigned int sequence;
> > --
> > 2.23.0
> >



-- 
Regards,
Niklas Söderlund
