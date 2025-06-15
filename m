Return-Path: <linux-media+bounces-34819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 633D7ADA1D0
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 14:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 757D316EEF2
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 12:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFCE265607;
	Sun, 15 Jun 2025 12:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iIL6rCTG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LjpX9/Zd"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8CF25569;
	Sun, 15 Jun 2025 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991680; cv=none; b=HEtWn/1NKk/DuvQafY/Mjs+plPGUxLE+HQU59erPeoyb2e2y4xW0p2V5ueZvjNP5A2atRsXtovuaYw+dEKOhZAycyYrsImov/J4saFcXtcVoL2bNTtD7wC/5u/86CFiBN4Pzfnpc4QRzAhifj/QW/0ouPzpO2BODeWILFkg8VRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991680; c=relaxed/simple;
	bh=Rhp1jB0FpUddCCN9b9k2gL4QbNG+6YQIdZclEh3dUPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3PhW7LMTpOfh3X/3wH6orB5rLgZnID8/n+EwgwAMe4K5pe4YhEzQYu1WWP7HoGgAp7KKU5+TqpoDMpKDuI9NXlpZn8z75Q4pv6TS8TvAHRb+/M3IduaHKSbf6IvoCJqSLH/wvdXydnNX8kK6AI4Q4GT9DnKilOQmfplNMGjKpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iIL6rCTG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LjpX9/Zd; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B6C2C25400AB;
	Sun, 15 Jun 2025 08:47:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 15 Jun 2025 08:47:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749991675;
	 x=1750078075; bh=OlHHnBizE2s8w5KDZRQRxRSHdf15wwRZpqno8wm/fBk=; b=
	iIL6rCTG63DWJXb06P8f3oHNi/93jUJlvkcMsRobf1/HK0QL+TKyaBCAJ9GdIl8m
	JuhSrzU0cYXdJdKL3851JvDVUaPcfRxRoMIk9DIYJ2Mmqh/B7eMSM0tpfgbYnxla
	n5s1cCOH4pmZ+/VNRJF33Jf8kyu9bljaGis3PHF4IfIPoPcaWwkdyPShZBk76XSc
	tpeem02NOllwav6UiTh22Re9e3Z8jT82tDJnWEmd4cBIYg8yviy3FYdGm4RbL2DN
	OjwIypSUh7GXlBqLaFy0oz8lNP695KTgKSP92OfBnYQVMAcomu4S8ux/5IIV4Nco
	XzLS0eLHxFYYydQesIA00w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749991675; x=
	1750078075; bh=OlHHnBizE2s8w5KDZRQRxRSHdf15wwRZpqno8wm/fBk=; b=L
	jpX9/ZdOOtpCEDj1BByT/lTsIUBrbWlMpBXI/V52I9NEvX0ckwPLMAFnDWdJjMsL
	gvKg9y5IntUSScAVAUWZ6rZu4NKHUvG/DmbbuTX/74h0Th3TGPtFgulLqZXQAWrk
	Sjb7dSRHNwBt71AgBLpRcHX2/SDfNreDeJBPZ1TmLQAtpP74tu2vm7TWbSkeQ676
	l0e1jW1yx2oeH8JviCTz20rooSAFbLKmwzh3RWkoq00fqyCUx/CPfkG+PtFArSsO
	4ro36XN7iUzxT8O9Gjig8nWcopmEm6FaI6dQMR0trW0y4Ri8ZU0dk8wAvxDYWZUg
	wVQBQsLjMOzBVNoVXw7ug==
X-ME-Sender: <xms:-sBOaBMqqtrxJ0p48YQwhcGxUsfb5HDpyek05o351ALoypMUvrQBaQ>
    <xme:-sBOaD8Yu4eS4vlYa6XeC44edo_xFPZFQi_zwhIRKlwJhPFrKsZVPsRMsEem3xoVe
    d2kz52Pwbrcgf9H9Dw>
X-ME-Received: <xmr:-sBOaARF5tUljR1gN4UrS3T4YDTFBTRgoA3Ys8R6A2SyVeA6RONuhwXQCCEk9fHMvZLmd5rJQjkBusD4iej6OqGnEk6UcoGzTw>
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
X-ME-Proxy: <xmx:-sBOaNtmoFEk1IrMsQUxnjnNu1o9AJ3FA2-b3fo0x0LrZYgsqjdfrA>
    <xmx:-sBOaJdR3NWNarX6FAv5ge28jyRH81magFTBoyGHJQ5l6YgG1NP_gQ>
    <xmx:-sBOaJ0DN6pqDIi45dy4RiG74EfX9h9zNCNSmrqSDAXDGr4DPljxDQ>
    <xmx:-sBOaF8pBdT7OGrfIcZCMzMk_J6r9rHSeICFua7iCRwhZeYBPOxQTw>
    <xmx:-8BOaA_cJUMM4h87raNM1XdaO5Jim-naTbQyXfpm_rRbvrootu6xeLDt>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Jun 2025 08:47:54 -0400 (EDT)
Date: Sun, 15 Jun 2025 14:47:52 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: rcar-vin: Check for correct capture interrupt
 event
Message-ID: <20250615124752.GA1489213@ragnatech.se>
References: <20250614141545.2860860-1-niklas.soderlund+renesas@ragnatech.se>
 <20250614141545.2860860-3-niklas.soderlund+renesas@ragnatech.se>
 <20250614213213.GM10542@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250614213213.GM10542@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for your review!

On 2025-06-15 00:32:13 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Sat, Jun 14, 2025 at 04:15:44PM +0200, Niklas Söderlund wrote:
> > Depending on if the capture session deals with fields or whole frames
> > interrupts can be generated at an end of field, or end of frame event.
> > The interrupt mask is setup to generate an interrupt on one of the two
> > events depending on what is needed when the VIN is started. The end of
> > field bit is set in both cases so controlling the mask that generates an
> > interrupt have been enough to control the two use-cases.
> > 
> > Before extending the interrupt handler to deal with other types of
> > interrupt events it is needs to extended to "capture complete" check for
> > correct the use-case in operation. Without this the simplification in
> > the handler can result in corrupted frames when the mask on what type of
> > events can generate an interrupt generated can no longer be assumed to
> > only be an "capture complete" event.
> > 
> > Which bit is checked matches which bit is enabled at configuration time
> > as which event can generate an interrupt for "capture complete". There
> > is no functional change.
> > 
> > While at it switch to use the BIT() macro to describe the bit positions
> > for the interrupt functions.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > index 585b8b3dcfd8..85e44a00e0fc 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > @@ -115,11 +115,12 @@
> >  #define VNFC_S_FRAME		(1 << 0)
> >  
> >  /* Video n Interrupt Enable Register bits */
> > -#define VNIE_FIE		(1 << 4)
> > -#define VNIE_EFE		(1 << 1)
> > +#define VNIE_FIE		BIT(4)
> > +#define VNIE_EFE		BIT(1)
> >  
> >  /* Video n Interrupt Status Register bits */
> > -#define VNINTS_FIS		(1 << 4)
> > +#define VNINTS_FIS		BIT(4)
> > +#define VNINTS_EFS		BIT(1)
> >  
> >  /* Video n Data Mode Register bits */
> >  #define VNDMR_A8BIT(n)		(((n) & 0xff) << 24)
> > @@ -1034,7 +1035,7 @@ static void rvin_capture_stop(struct rvin_dev *vin)
> >  static irqreturn_t rvin_irq(int irq, void *data)
> >  {
> >  	struct rvin_dev *vin = data;
> > -	u32 status, vnms;
> > +	u32 capture, status, vnms;
> >  	int slot;
> >  	unsigned int handled = 0;
> >  	unsigned long flags;
> > @@ -1049,7 +1050,10 @@ static irqreturn_t rvin_irq(int irq, void *data)
> >  	handled = 1;
> >  
> >  	/* Nothing to do if nothing was captured. */
> > -	if (!(status & VNINTS_FIS))
> > +	capture = vin->format.field == V4L2_FIELD_NONE ||
> > +		vin->format.field == V4L2_FIELD_ALTERNATE ?
> > +		VNINTS_FIS : VNINTS_EFS;
> 
> I would find
> 
> 	capture = vin->format.field == V4L2_FIELD_NONE ||
> 		  vin->format.field == V4L2_FIELD_ALTERNATE
> 		? VNINTS_FIS : VNINTS_EFS;
> 
> easier to read, but it could be just me.

I agree it's easier to read, but my auto style checker for the file will 
not allow it. And if I make one exception from my format rules I fear 
the file will soon turn wild. The whole construct is ugly and I hope to 
be able to remove it all together in follow up work.

> 
> Do I read it correctly that you use the "Field Interrupt" with
> V4L2_FIELD_NONE ? That seems a bit weird to me, but maybe I don't get
> how the hardware operates.

I agree it's odd, and likely can be improved upon. But it mirrors what 
is done in the capture setup routine. The "Field Interrupt" is enabled 
for NONE and ALTERNATE, and the "End Frame Interrupt" is used for the 
other cases. See the 'progressive' variable in rvin_setup().

The historical reason for this oddity is that VIN placed to much logic 
in the kernel driver that should have been up to user-space, specially 
for Gen2. In this case if the video source was providing ALTERNATE then 
VIN would automatically default to INTERLACED the output. Some of this 
have been reworked and fixed over the years, and a lot of it is finally 
fixed in the Gen2 MC series on the list.

That work is however not a dependency of this work, and I feel like a 
broken record, but I have started work to refactor this and make it 
right. That work is however based on the Gen2 MC series as this allows 
me to add proper tests for all of this that covers all the different 
generations.

I did not want this series to depend on the cleanups and potentially 
grew to yet another large series that fix lots of unrelated things. I 
hope it's OK we live with this oddity a little while longer so we can 
address it properly as a separate thing.

> 
> > +	if (!(status & capture))
> >  		goto done;
> >  
> >  	/* Nothing to do if not running. */
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

