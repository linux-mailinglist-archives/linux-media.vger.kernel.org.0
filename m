Return-Path: <linux-media+bounces-57720-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPZ9N3R1y2k3HwYAu9opvQ
	(envelope-from <linux-media+bounces-57720-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:19:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD32364FCD
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC5CB306122B
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB3A25771;
	Tue, 31 Mar 2026 07:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PibbcXpG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC11394496;
	Tue, 31 Mar 2026 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941519; cv=none; b=QKvlhKLy8H6De/3j7gvcIuHoiit3hyBdEze7tTVfRdrLQbCdqSMedeUNyEDfBOngyCCgFruIOEzsB2Qfx/ODONjTNsvRXoZWxFsy40gc71c+hOKb+UpeYWIxnX1LMSrhN4cUAyvJu2IWzbNvvX49RUMlKanTJDscEuW2a/HMlfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941519; c=relaxed/simple;
	bh=qGnjwap8EWUZmGqir0nNNUxY8H03wxKvsMLL8af1toQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQDheqZSgqPYdXIvIzIT31duhkaOQKhRzork6Gi4CGBeGQKUY0Flxm7HZDtf5teQwmrWF6ZoQvqI04jpmug9rhiWN2YRikPPy9Er0+GBJp6ysdFrDGXqlbhF7ovGVeoxKIRKSyTUf/YTeU9kTSOflouGPI80oStdVO6MvBU1ajo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PibbcXpG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42CE4156F;
	Tue, 31 Mar 2026 09:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774941433;
	bh=qGnjwap8EWUZmGqir0nNNUxY8H03wxKvsMLL8af1toQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PibbcXpGkfCwOSEaGevA5PmgQHnFICqk/RJxtbuVNxf7AqTNeV0eq7IJ6TrCcFMVH
	 evAWCj6Y/Ihm6vvAznc3JGlA2BzeMWROgkkl6gyMlmgqSQSIjQbWdusiMPdupKn7ln
	 gW0usRljcFfJy2WigPkw5PaTfxpZmAf7+WC+3pNM=
Date: Tue, 31 Mar 2026 09:18:32 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	"jacopo.mondi" <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "dan.scally" <dan.scally@ideasonboard.com>, 
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH 03/14] media: rzg2l-cru: Modernize spin_lock usage with
 cleanup.h
Message-ID: <actzkO0E01pcKlDE@zed>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-3-3b7d0430f538@ideasonboard.com>
 <acpamLH3xqP72ffE@tom-desktop>
 <TY3PR01MB1134607F4DCD0CC01345D8C368652A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB1134607F4DCD0CC01345D8C368652A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57720-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kernel.org,linux.intel.com,protonmail.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,protonmail.com:email]
X-Rspamd-Queue-Id: 6BD32364FCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju

On Mon, Mar 30, 2026 at 11:41:52AM +0000, Biju Das wrote:
> Hi Jacopo,
>
> > -----Original Message-----
> > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Sent: 30 March 2026 12:12
> > To: jacopo.mondi <jacopo.mondi@ideasonboard.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>; Biju Das <biju.das.jz@bp.renesas.com>; Hans Verkuil
> > <hverkuil+cisco@kernel.org>; Sakari Ailus <sakari.ailus@linux.intel.com>; dan.scally
> > <dan.scally@ideasonboard.com>; Barnabás Pőcze <pobrn@protonmail.com>; Prabhakar Mahadev Lad
> > <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > Subject: Re: [PATCH 03/14] media: rzg2l-cru: Modernize spin_lock usage with cleanup.h
> >
> > Hi Jacopo,
> > Thanks for your patch.
> >
> > On Fri, Mar 27, 2026 at 06:10:08PM +0100, Jacopo Mondi wrote:
> > > From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > >
> > > Use more modern constructs from cleanup.h to express the locking
> > > sequences in the rzg2l driver.
> >
> >
> > Looks good to me.
> >
> > Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > Kind Regards,
> > Tommaso
> >
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > ---
> > >  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 32
> > > +++++++---------------
> > >  1 file changed, 10 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index 98b6afbc708d..2d7ac9f37291 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -11,6 +11,7 @@
> > >   * Copyright (C) 2008 Magnus Damm
> > >   */
> > >
> > > +#include <linux/cleanup.h>
>
>
> Not sure, asper comment from [1]
>
> The spinlock guards should come from spinlock.h

Oh you're right. spinlock.h provides the correct definitions for that
lock class using the constructs from cleanup.h.

I'll drop the include, thanks!

>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/drivers&id=9fd2170d70178faa0427adaa9d2dfdbfa231d1b7
>
> Cheers,
> Biju
>
> > >  #include <linux/clk.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/pm_runtime.h>
> > > @@ -110,10 +111,10 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
> > >  				  enum vb2_buffer_state state)
> > >  {
> > >  	struct rzg2l_cru_buffer *buf, *node;
> > > -	unsigned long flags;
> > >  	unsigned int i;
> > >
> > > -	spin_lock_irqsave(&cru->qlock, flags);
> > > +	guard(spinlock_irqsave)(&cru->qlock);
> > > +
> > >  	for (i = 0; i < cru->num_buf; i++) {
> > >  		if (cru->queue_buf[i]) {
> > >  			vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
> > > @@ -126,7 +127,6 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
> > >  		vb2_buffer_done(&buf->vb.vb2_buf, state);
> > >  		list_del(&buf->list);
> > >  	}
> > > -	spin_unlock_irqrestore(&cru->qlock, flags);
> > >  }
> > >
> > >  static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int
> > > *nbuffers, @@ -165,13 +165,9 @@ static void
> > > rzg2l_cru_buffer_queue(struct vb2_buffer *vb)  {
> > >  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > >  	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vb->vb2_queue);
> > > -	unsigned long flags;
> > > -
> > > -	spin_lock_irqsave(&cru->qlock, flags);
> > >
> > > +	guard(spinlock_irqsave)(&cru->qlock);
> > >  	list_add_tail(to_buf_list(vbuf), &cru->buf_list);
> > > -
> > > -	spin_unlock_irqrestore(&cru->qlock, flags);
> > >  }
> > >
> > >  static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru, @@
> > > -465,7 +461,6 @@ void rzg2l_cru_disable_interrupts(struct
> > > rzg2l_cru_dev *cru)  int rzg2l_cru_start_image_processing(struct
> > > rzg2l_cru_dev *cru)  {
> > >  	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
> > > -	unsigned long flags;
> > >  	u8 csi_vc;
> > >  	int ret;
> > >
> > > @@ -475,7 +470,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> > >  	csi_vc = ret;
> > >  	cru->svc_channel = csi_vc;
> > >
> > > -	spin_lock_irqsave(&cru->qlock, flags);
> > > +	guard(spinlock_irqsave)(&cru->qlock);
> > >
> > >  	/* Select a video input */
> > >  	rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0)); @@ -492,7 +487,6
> > > @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> > >  	/* Initialize image convert */
> > >  	ret = rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
> > >  	if (ret) {
> > > -		spin_unlock_irqrestore(&cru->qlock, flags);
> > >  		return ret;
> > >  	}
> > >
> > > @@ -502,8 +496,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> > >  	/* Enable image processing reception */
> > >  	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
> > >
> > > -	spin_unlock_irqrestore(&cru->qlock, flags);
> > > -
> > >  	return 0;
> > >  }
> > >
> > > @@ -573,16 +565,15 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
> > > {
> > >  	struct rzg2l_cru_dev *cru = data;
> > >  	unsigned int handled = 0;
> > > -	unsigned long flags;
> > >  	u32 irq_status;
> > >  	u32 amnmbs;
> > >  	int slot;
> > >
> > > -	spin_lock_irqsave(&cru->qlock, flags);
> > > +	guard(spinlock_irqsave)(&cru->qlock);
> > >
> > >  	irq_status = rzg2l_cru_read(cru, CRUnINTS);
> > >  	if (!irq_status)
> > > -		goto done;
> > > +		return IRQ_RETVAL(handled);
> > >
> > >  	handled = 1;
> > >
> > > @@ -591,14 +582,14 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
> > >  	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> > >  	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
> > >  		dev_dbg(cru->dev, "IRQ while state stopped\n");
> > > -		goto done;
> > > +		return IRQ_RETVAL(handled);
> > >  	}
> > >
> > >  	/* Increase stop retries if capture status is 'RZG2L_CRU_DMA_STOPPING' */
> > >  	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> > >  		if (irq_status & CRUnINTS_SFS)
> > >  			dev_dbg(cru->dev, "IRQ while state stopping\n");
> > > -		goto done;
> > > +		return IRQ_RETVAL(handled);
> > >  	}
> > >
> > >  	/* Prepare for capture and update state */ @@ -621,7 +612,7 @@
> > > irqreturn_t rzg2l_cru_irq(int irq, void *data)
> > >  	if (cru->state == RZG2L_CRU_DMA_STARTING) {
> > >  		if (slot != 0) {
> > >  			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> > > -			goto done;
> > > +			return IRQ_RETVAL(handled);
> > >  		}
> > >
> > >  		dev_dbg(cru->dev, "Capture start synced!\n"); @@ -646,9 +637,6 @@
> > > irqreturn_t rzg2l_cru_irq(int irq, void *data)
> > >  	/* Prepare for next frame */
> > >  	rzg2l_cru_fill_hw_slot(cru, slot);
> > >
> > > -done:
> > > -	spin_unlock_irqrestore(&cru->qlock, flags);
> > > -
> > >  	return IRQ_RETVAL(handled);
> > >  }
> > >
> > >
> > > --
> > > 2.53.0
> > >
>

