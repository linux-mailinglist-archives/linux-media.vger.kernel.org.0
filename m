Return-Path: <linux-media+bounces-34820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9C0ADA1D4
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 14:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53A4316EE81
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 12:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6F9265CDD;
	Sun, 15 Jun 2025 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iCMPqsmQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="njASP+B4"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB962040B3;
	Sun, 15 Jun 2025 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991724; cv=none; b=RwhH4nbEd/9K0CN6ldtaaTCvcU3nbgXfw57kDgbEpmDhx9klLhh0a2TbE4P8Ll6/oBQqS7TBA1FLDZM2ADsNOYQdjhNvJKyA9iG3eMOMY19Y8SvbEzJjKIyIaQF2/KbtJnjsi/0pxV4VrgDiycQ/la045wQz3kd06TEhe3R1au8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991724; c=relaxed/simple;
	bh=aTA7Dl+wn2+ju6AIysg5Xjus6Xp+ykN6/Zka/+gNOVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGWmXemEaBpv5xswWNVe/ut/NXzq1rqmZh7xpUhKfRns+6FxbWqCdQvmckp7AzfztBTPbowBky4nWUoiBrtztoABh9z3oH5hkYpSZ8v85y9BIt8HeaVExZ3IVX86SDRKrKjYuyf3rpzwSpDZoj2MFkBef0A3AkfHS85afcwhWig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iCMPqsmQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=njASP+B4; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 9F65E11400E3;
	Sun, 15 Jun 2025 08:48:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 15 Jun 2025 08:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749991721;
	 x=1750078121; bh=p9v3pOiNfDADnu3P/T1fDcLaZG19btIJZ//Tn08B5oc=; b=
	iCMPqsmQ4rBudKlKV+ta3Hpk8AfRnEy5FWAI+HkPQva/SOu3EAwYSmGb/zgyFR/M
	SNVJQ2x3NAhLbL69RRNTvLlHQyUOZrNYmY0dU9TcitMX4MX0ys59TBdPMgqp2H58
	esfaKSAjJV1zZ+28BWYfn8czCsyd2D8KukcfEbtxYUsmvFBpLMQl+NRGYvI/7F8s
	x3zwL7vm8xRs9XK1JjpzsIGMc3scKVm/17T9e2lxxkX92VaT2M5bvLv2S49Pvaq9
	S/quSENXPV9LqjHrUIbrB+trAMew3wEdgF2Ru4Zg0gfYUci+uSy/vbqVyL2UNvD9
	fmRLFMLLMIaFd5ivWnnyNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749991721; x=
	1750078121; bh=p9v3pOiNfDADnu3P/T1fDcLaZG19btIJZ//Tn08B5oc=; b=n
	jASP+B4zybvjJ7hYmQJ+QF+05RA5cgv+27ISF++NG9VbDGDFETxgZj0VcGp/5PAs
	V8XI4Ss4m3TFesZapbxyLY6YjA3ljeoRgH1S9qUaekTYeKtrEYZIjl1DiMjeAvxx
	MvZKI1S5FQ8l/35SRyH/F82cj0S/DnhqwxImxG8slJ3Dy9PSRqCDQ8XqIlhk+XyW
	1zVvudUS9K1zp8s/aAL27Vu3n3YUimlZ/eqrzSiXxybTTuMaWWKufJ88DHZvdgQx
	i7VTBUED+KIK+qqmbZSfaqVZd/REL4gR10GnJM4dysTkC4QOa+wkt0ue2h3KExLW
	ZjkDLvNBJxWY8ZiJsnu9w==
X-ME-Sender: <xms:KcFOaO94j3HsXnuweaVBHQC3-n9lOBPTWy_H9AmFjuTGewD8Y0T6DA>
    <xme:KcFOaOtTB0cyx0v4_yDTWQAZrURm5WUt1t0S86ny8BzE_UjwgCu4W794DBZoTtyMK
    QOHzDjxLmrXorV7tWA>
X-ME-Received: <xmr:KcFOaEA1iPFG7k0fx-aKHaaHn2Dh_L2uHiJYQDKEwo_qRDFw8hTH1V0YWSkOL8Z0gEvi2vEmy7tQu43oHxzOwZu7MKu3EobZgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvfeejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftd
    dvleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrd
    hsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    lhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprh
    gtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggv
    rhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepshgrkhgrrhhird
    grihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidq
    mhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:KcFOaGeYuRIiswLIM_nX2J_Ef4b2BY7fEtICDu8LvdPWkrsnbAjymg>
    <xmx:KcFOaDMyKsXlO1J3Vp4KJpbmdtUgdgAajQDo2ZEVWAa8-InpCV4smA>
    <xmx:KcFOaAnO-90biOAWbQoynnwOUQ5-7Lbjs5tBjA4XeS0MXKlJYeL4NQ>
    <xmx:KcFOaFthPPDpYX4uZ02iY9Zh42csqpDinwPOtYB_YL2n9an0XvitaA>
    <xmx:KcFOaFtGOhFgzEVATq-XNSRX8RfmUY0UzuuIezx2hHJ-wEWd3xMUzeF5>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Jun 2025 08:48:40 -0400 (EDT)
Date: Sun, 15 Jun 2025 14:48:39 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rcar-vin: Fold interrupt helpers into only
 callers
Message-ID: <20250615124839.GB1489213@ragnatech.se>
References: <20250614141545.2860860-1-niklas.soderlund+renesas@ragnatech.se>
 <20250614141545.2860860-2-niklas.soderlund+renesas@ragnatech.se>
 <20250614212314.GL10542@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250614212314.GL10542@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for your review time.

On 2025-06-15 00:23:14 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Sat, Jun 14, 2025 at 04:15:43PM +0200, Niklas Söderlund wrote:
> > The call sites using the interrupt helper functions have all been
> > reworked to only one for each. Fold echo of them into the only call
> > sites left.
> > 
> > While at it rename the variable holding the current interrupt status to
> > make the code easier to read.
> > 
> > There is no functional change.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../platform/renesas/rcar-vin/rcar-dma.c      | 27 +++++--------------
> >  1 file changed, 6 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > index 5c08ee2c9807..585b8b3dcfd8 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > @@ -912,21 +912,6 @@ static int rvin_setup(struct rvin_dev *vin)
> >  	return 0;
> >  }
> >  
> > -static void rvin_disable_interrupts(struct rvin_dev *vin)
> > -{
> > -	rvin_write(vin, 0, VNIE_REG);
> > -}
> > -
> > -static u32 rvin_get_interrupt_status(struct rvin_dev *vin)
> > -{
> > -	return rvin_read(vin, VNINTS_REG);
> > -}
> > -
> > -static void rvin_ack_interrupt(struct rvin_dev *vin)
> > -{
> > -	rvin_write(vin, rvin_read(vin, VNINTS_REG), VNINTS_REG);
> > -}
> > -
> >  static bool rvin_capture_active(struct rvin_dev *vin)
> >  {
> >  	return rvin_read(vin, VNMS_REG) & VNMS_CA;
> > @@ -1049,22 +1034,22 @@ static void rvin_capture_stop(struct rvin_dev *vin)
> >  static irqreturn_t rvin_irq(int irq, void *data)
> >  {
> >  	struct rvin_dev *vin = data;
> > -	u32 int_status, vnms;
> > +	u32 status, vnms;
> >  	int slot;
> >  	unsigned int handled = 0;
> >  	unsigned long flags;
> >  
> >  	spin_lock_irqsave(&vin->qlock, flags);
> >  
> > -	int_status = rvin_get_interrupt_status(vin);
> > -	if (!int_status)
> > +	status = rvin_read(vin, VNINTS_REG);
> > +	if (!status)
> >  		goto done;
> >  
> > -	rvin_ack_interrupt(vin);
> > +	rvin_write(vin, status, VNINTS_REG);
> 
> Actually there is a functional change here. Before this change, if an
> interrupt occured between reading VNINTS_REG in
> rvin_get_interrupt_status() and reading it again in
> rvin_ack_interrupt(), it would get lost. This patch fixes a possible
> bug.

Indeed, thanks for pointing it out. I will update the commit message to 
mention this.

> 
> With an updated commit message,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> >  	handled = 1;
> >  
> >  	/* Nothing to do if nothing was captured. */
> > -	if (!(int_status & VNINTS_FIS))
> > +	if (!(status & VNINTS_FIS))
> >  		goto done;
> >  
> >  	/* Nothing to do if not running. */
> > @@ -1417,7 +1402,7 @@ void rvin_stop_streaming(struct rvin_dev *vin)
> >  	rvin_set_stream(vin, 0);
> >  
> >  	/* disable interrupts */
> > -	rvin_disable_interrupts(vin);
> > +	rvin_write(vin, 0, VNIE_REG);
> >  
> >  	/* Return unprocessed buffers from hardware. */
> >  	for (unsigned int i = 0; i < HW_BUFFER_NUM; i++) {
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

