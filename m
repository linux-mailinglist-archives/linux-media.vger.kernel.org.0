Return-Path: <linux-media+bounces-34996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA3DADB8D8
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 20:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B04887A4415
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1519289807;
	Mon, 16 Jun 2025 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BlhZFtev"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C86C1A4E9D;
	Mon, 16 Jun 2025 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750098530; cv=none; b=CVcyuY4Bpbci5rRM0hFmQnfRcFqYHDddR5miZWj7wGs/JtL5mUJX2Q2SO5LNclhIABoC3auV0HtV//O+rpfNXt0uzSGinvaNepxQ7E6s4oiu83YTR7RhkJ+EYbS0lBKL0rcMz2xk0RauzYrI7xYKRogB4qw6i66jdllpvrGFwAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750098530; c=relaxed/simple;
	bh=Klc9wyXwyphIipCnkKssAeWvA5G1dzV3dvSoAOnf8Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MURLhYyaZ1oPUbPog5+tnQBdKZCnAmvnh5oIvPrAWzqo8Xk0IxkASfHh6EZLoOGAoWIh+V/anwExeatdUdZUSWaG1B5e6pitWDB3fe60s9mzCUtCpBOKazQVeiy40Lmn6BOvyiwftrk5KHHORX8lVzQHuXzk7kJuP+gF5TXoWNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BlhZFtev; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04012C6D;
	Mon, 16 Jun 2025 20:28:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750098515;
	bh=Klc9wyXwyphIipCnkKssAeWvA5G1dzV3dvSoAOnf8Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BlhZFtevqNTaZiaID5jvfGnCno/Z575MvbzmLopVSL2I0NsNKeeT9mODs2K2q9o/P
	 sxdtaBYkk478VYiuvjoa3pSS1x+JxFN9QNmZi7zQCtMjbV5Hm0C45zyirIQlZaiMR/
	 ccaJ8pE92UErehtJnGYNNvFLGTmfnfA+zshtEa/Y=
Date: Mon, 16 Jun 2025 21:28:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rcar-vin: Fold interrupt helpers into only
 callers
Message-ID: <20250616182830.GB12825@pendragon.ideasonboard.com>
References: <20250614141545.2860860-1-niklas.soderlund+renesas@ragnatech.se>
 <20250614141545.2860860-2-niklas.soderlund+renesas@ragnatech.se>
 <20250614212314.GL10542@pendragon.ideasonboard.com>
 <20250615124839.GB1489213@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250615124839.GB1489213@ragnatech.se>

On Sun, Jun 15, 2025 at 02:48:39PM +0200, Niklas Söderlund wrote:
> On 2025-06-15 00:23:14 +0300, Laurent Pinchart wrote:
> > On Sat, Jun 14, 2025 at 04:15:43PM +0200, Niklas Söderlund wrote:
> > > The call sites using the interrupt helper functions have all been
> > > reworked to only one for each. Fold echo of them into the only call
> > > sites left.
> > > 
> > > While at it rename the variable holding the current interrupt status to
> > > make the code easier to read.
> > > 
> > > There is no functional change.
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  .../platform/renesas/rcar-vin/rcar-dma.c      | 27 +++++--------------
> > >  1 file changed, 6 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > index 5c08ee2c9807..585b8b3dcfd8 100644
> > > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > > @@ -912,21 +912,6 @@ static int rvin_setup(struct rvin_dev *vin)
> > >  	return 0;
> > >  }
> > >  
> > > -static void rvin_disable_interrupts(struct rvin_dev *vin)
> > > -{
> > > -	rvin_write(vin, 0, VNIE_REG);
> > > -}
> > > -
> > > -static u32 rvin_get_interrupt_status(struct rvin_dev *vin)
> > > -{
> > > -	return rvin_read(vin, VNINTS_REG);
> > > -}
> > > -
> > > -static void rvin_ack_interrupt(struct rvin_dev *vin)
> > > -{
> > > -	rvin_write(vin, rvin_read(vin, VNINTS_REG), VNINTS_REG);
> > > -}
> > > -
> > >  static bool rvin_capture_active(struct rvin_dev *vin)
> > >  {
> > >  	return rvin_read(vin, VNMS_REG) & VNMS_CA;
> > > @@ -1049,22 +1034,22 @@ static void rvin_capture_stop(struct rvin_dev *vin)
> > >  static irqreturn_t rvin_irq(int irq, void *data)
> > >  {
> > >  	struct rvin_dev *vin = data;
> > > -	u32 int_status, vnms;
> > > +	u32 status, vnms;
> > >  	int slot;
> > >  	unsigned int handled = 0;
> > >  	unsigned long flags;
> > >  
> > >  	spin_lock_irqsave(&vin->qlock, flags);
> > >  
> > > -	int_status = rvin_get_interrupt_status(vin);
> > > -	if (!int_status)
> > > +	status = rvin_read(vin, VNINTS_REG);
> > > +	if (!status)
> > >  		goto done;
> > >  
> > > -	rvin_ack_interrupt(vin);
> > > +	rvin_write(vin, status, VNINTS_REG);
> > 
> > Actually there is a functional change here. Before this change, if an
> > interrupt occured between reading VNINTS_REG in
> > rvin_get_interrupt_status() and reading it again in
> > rvin_ack_interrupt(), it would get lost. This patch fixes a possible
> > bug.
> 
> Indeed, thanks for pointing it out. I will update the commit message to 
> mention this.

Let me make a proposal.

---
The call sites using the interrupt helper functions have all been
reworked to only one for each. Fold echo of them into the only call
sites left.

This fixes a possible interrupt loss in case an interrupt occurs between
reading VNINTS_REG in rvin_get_interrupt_status() and reading it again
in rvin_ack_interrupt().

While at it rename the variable holding the current interrupt status to
make the code easier to read.
---

Feel free to add a Fixes: tag if applicable (and a Cc:
stable@vger.kernel.org in that case).

> > With an updated commit message,
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > >  	handled = 1;
> > >  
> > >  	/* Nothing to do if nothing was captured. */
> > > -	if (!(int_status & VNINTS_FIS))
> > > +	if (!(status & VNINTS_FIS))
> > >  		goto done;
> > >  
> > >  	/* Nothing to do if not running. */
> > > @@ -1417,7 +1402,7 @@ void rvin_stop_streaming(struct rvin_dev *vin)
> > >  	rvin_set_stream(vin, 0);
> > >  
> > >  	/* disable interrupts */
> > > -	rvin_disable_interrupts(vin);
> > > +	rvin_write(vin, 0, VNIE_REG);
> > >  
> > >  	/* Return unprocessed buffers from hardware. */
> > >  	for (unsigned int i = 0; i < HW_BUFFER_NUM; i++) {

-- 
Regards,

Laurent Pinchart

