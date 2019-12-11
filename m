Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEAA11A9DB
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 12:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbfLKL2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 06:28:21 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41135 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfLKL2U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 06:28:20 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so16369520lfp.8
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2019 03:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=T5sktuIISRm6ZZvKoozJxL+dEAmOqziDFJXtFnzJEw0=;
        b=KFWGmYgdKjci6cbCKEGlJhb7x1KwzHHrphcdxVvbieI3D1r6x/CeXvBKGH7fLaKRRl
         NBRqsG4uTM03IYlYXX5+yHY9nSmeKsKVhDghXi1dDw0s56JxvvIYdnowqeeDqJzgs7CK
         MzqR51mL8hbixkN0w3lH+FNhn1vF56Nw4HCb1v2kCVR7e+j03q+2BhKhQf6Wy+T9edQh
         XNn0xvOPgCy8knkQUg6SzV8XKSG+o5hHAsLGxX06MDTdQt8tBochBtV5zT67uNfi66rW
         q5y1WYMYze9M9f/Cj7u1jYeG6hEE/OccUoQYL5Aj2X5WKTIQg2RRXz5ZmwcMlWDL+uib
         mL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=T5sktuIISRm6ZZvKoozJxL+dEAmOqziDFJXtFnzJEw0=;
        b=FL6yNgEwATsLy7gaAEnfzrUa3FIsxahxtO4VRSpSHh09DeP2suytick99dX3s7vREb
         qE+mRnbY70JD9JjYtzSgiNG6qjimpuNjxiMpyWw6K25NLnLZNAWsTXLLc51ZLWo9lK0s
         /CGIwOt7x5O/5x250Djv9rCR6C9fZQszxecsAq1AH3N1D+CxtAorXqoQz9zq8clIb6/X
         18PMbyvhD91ocd+N0UN6qx4a/FheHyA7fA4kAEVpeAL1TWYxPg+KIvfhJ3DaisHP7drR
         icNiW/OUOewTw5GcHkzOZtAmZ6J+690r1kasxarPX09/e0lP8ewmd5f5SLKFyDMXybor
         58MA==
X-Gm-Message-State: APjAAAXBmZ7j7zoKd822KvmHj2R1NOD1Vd/PRwZgLSZivyrN58pwmP4e
        hPnOXIKdN8kX8ZbwU2UgMCkLHrj0+ic=
X-Google-Smtp-Source: APXvYqzDuzF8wqqNP4PECKsoJ/1AmvLv4OAJGfwc+cdSjzDPQIe75dra2S0mgfc8A5TjIsOnt7tFGQ==
X-Received: by 2002:ac2:5635:: with SMTP id b21mr1823510lff.127.1576063697807;
        Wed, 11 Dec 2019 03:28:17 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id u16sm1109280lfi.36.2019.12.11.03.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 03:28:16 -0800 (PST)
Date:   Wed, 11 Dec 2019 12:28:16 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rcar-vin: Move hardware buffer tracking to own
 struct
Message-ID: <20191211112816.GC6956@bigcity.dyn.berto.se>
References: <20191210020559.170594-1-niklas.soderlund+renesas@ragnatech.se>
 <20191210020559.170594-2-niklas.soderlund+renesas@ragnatech.se>
 <20191211094411.kub2m6qhxtjoxalc@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191211094411.kub2m6qhxtjoxalc@uno.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your feedback.

On 2019-12-11 10:44:11 +0100, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Tue, Dec 10, 2019 at 03:05:58AM +0100, Niklas Söderlund wrote:
> > To support SEQ_TB/BT not all buffers given to the hardware will be
> > equal, the driver needs to keep track of different buffer types. Move
> > the tracking of buffers given to hardware into a struct so additional
> > tracking fields can be associated with each buffer.
> >
> 
> This change alone does not make sense by itself. I cannot judge if
> it's a good idea or not if not looking at 2/2. Why have you kept it
> separate ?

That's why they are grouped in a series and not sent as two separate 
patches. I split things as I would like to review them. If there is a 
rename of a variable or other no functional change that takes up a lot 
of screen space I will split it out into it's own patch and make it 
clear that's all that's in there and then follow up with the series real 
change. I find this allows for a better review of the real change in the 
series as the preparation step is quiet uninteresting.

> 
> Thanks
>    j
> 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-dma.c | 27 +++++++++++-----------
> >  drivers/media/platform/rcar-vin/rcar-vin.h |  9 ++++----
> >  2 files changed, 19 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > index cf9029efeb0450cb..cd1778977b2ba56e 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -844,20 +844,20 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
> >  	dma_addr_t phys_addr;
> >
> >  	/* A already populated slot shall never be overwritten. */
> > -	if (WARN_ON(vin->queue_buf[slot] != NULL))
> > +	if (WARN_ON(vin->buf_hw[slot].buffer != NULL))
> >  		return;
> >
> >  	vin_dbg(vin, "Filling HW slot: %d\n", slot);
> >
> >  	if (list_empty(&vin->buf_list)) {
> > -		vin->queue_buf[slot] = NULL;
> > +		vin->buf_hw[slot].buffer = NULL;
> >  		phys_addr = vin->scratch_phys;
> >  	} else {
> >  		/* Keep track of buffer we give to HW */
> >  		buf = list_entry(vin->buf_list.next, struct rvin_buffer, list);
> >  		vbuf = &buf->vb;
> >  		list_del_init(to_buf_list(vbuf));
> > -		vin->queue_buf[slot] = vbuf;
> > +		vin->buf_hw[slot].buffer = vbuf;
> >
> >  		/* Setup DMA */
> >  		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> > @@ -953,13 +953,14 @@ static irqreturn_t rvin_irq(int irq, void *data)
> >  	}
> >
> >  	/* Capture frame */
> > -	if (vin->queue_buf[slot]) {
> > -		vin->queue_buf[slot]->field = rvin_get_active_field(vin, vnms);
> > -		vin->queue_buf[slot]->sequence = vin->sequence;
> > -		vin->queue_buf[slot]->vb2_buf.timestamp = ktime_get_ns();
> > -		vb2_buffer_done(&vin->queue_buf[slot]->vb2_buf,
> > +	if (vin->buf_hw[slot].buffer) {
> > +		vin->buf_hw[slot].buffer->field =
> > +			rvin_get_active_field(vin, vnms);
> > +		vin->buf_hw[slot].buffer->sequence = vin->sequence;
> > +		vin->buf_hw[slot].buffer->vb2_buf.timestamp = ktime_get_ns();
> > +		vb2_buffer_done(&vin->buf_hw[slot].buffer->vb2_buf,
> >  				VB2_BUF_STATE_DONE);
> > -		vin->queue_buf[slot] = NULL;
> > +		vin->buf_hw[slot].buffer = NULL;
> >  	} else {
> >  		/* Scratch buffer was used, dropping frame. */
> >  		vin_dbg(vin, "Dropping frame %u\n", vin->sequence);
> > @@ -983,10 +984,10 @@ static void return_all_buffers(struct rvin_dev *vin,
> >  	int i;
> >
> >  	for (i = 0; i < HW_BUFFER_NUM; i++) {
> > -		if (vin->queue_buf[i]) {
> > -			vb2_buffer_done(&vin->queue_buf[i]->vb2_buf,
> > +		if (vin->buf_hw[i].buffer) {
> > +			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
> >  					state);
> > -			vin->queue_buf[i] = NULL;
> > +			vin->buf_hw[i].buffer = NULL;
> >  		}
> >  	}
> >
> > @@ -1291,7 +1292,7 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
> >  	vin->state = STOPPED;
> >
> >  	for (i = 0; i < HW_BUFFER_NUM; i++)
> > -		vin->queue_buf[i] = NULL;
> > +		vin->buf_hw[i].buffer = NULL;
> >
> >  	/* buffer queue */
> >  	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> > diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> > index a36b0824f81d171d..0aa904a4af5b0a97 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> > +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> > @@ -164,9 +164,8 @@ struct rvin_info {
> >   * @scratch:		cpu address for scratch buffer
> >   * @scratch_phys:	physical address of the scratch buffer
> >   *
> > - * @qlock:		protects @queue_buf, @buf_list, @sequence
> > - *			@state
> > - * @queue_buf:		Keeps track of buffers given to HW slot
> > + * @qlock:		protects @buf_hw, @buf_list, @sequence and @state
> > + * @buf_hw:		Keeps track of buffers given to HW slot
> >   * @buf_list:		list of queued buffers
> >   * @sequence:		V4L2 buffers sequence number
> >   * @state:		keeps track of operation state
> > @@ -205,7 +204,9 @@ struct rvin_dev {
> >  	dma_addr_t scratch_phys;
> >
> >  	spinlock_t qlock;
> > -	struct vb2_v4l2_buffer *queue_buf[HW_BUFFER_NUM];
> > +	struct {
> > +		struct vb2_v4l2_buffer *buffer;
> > +	} buf_hw[HW_BUFFER_NUM];
> >  	struct list_head buf_list;
> >  	unsigned int sequence;
> >  	enum rvin_dma_state state;
> > --
> > 2.24.0
> >



-- 
Regards,
Niklas Söderlund
