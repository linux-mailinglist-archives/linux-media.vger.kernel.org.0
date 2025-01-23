Return-Path: <linux-media+bounces-25199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4CA1A386
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 12:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25BB516D8C4
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 11:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A4720E6FC;
	Thu, 23 Jan 2025 11:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="c8tO6/7T";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UR+6U+5q"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ACB20E6F1;
	Thu, 23 Jan 2025 11:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632767; cv=none; b=TlTOy7wNdP7gU4sb2c95bKL5LlQFgGDwAHAzNrpKrW6ngiVr26eurESU3oL7ts9qS/3wHq0feSZ9RL6UQdLew4VmPuPpOkoQyVkTOGt4wXhtxyqHoVWZg4vgAmv6F7guQCiLP/NjDtYC5j/VNnh4E6YeEvptQRkU5HQxlAx2n8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632767; c=relaxed/simple;
	bh=p2gHTfXm2KZIagU0xRbRWTgTTjSK3ZdcpCtZbsHUX4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xvk9Oa/TjNtcUh9fDr0lsx5fdPOthKFcx+e37IRdzu7kQErMSkHL1KuW5sfRTuuy87UYSd5pzo6UpWcDDtePyPDpcjGlY40RUuVarM24WY6AlBxGbCY9Hop/332dr3a2k/A3yhD35kENi876LR6SZA+dvBm8I+j5yU9IIVGZ3hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=c8tO6/7T; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UR+6U+5q; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8097C254018F;
	Thu, 23 Jan 2025 06:45:59 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 23 Jan 2025 06:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737632759;
	 x=1737719159; bh=OV52CXtA9Mn9pl9P/tIMuFALFpRSQLfNRGrEzKRhM2k=; b=
	c8tO6/7TdaLaRAHK7A56eBnAhK4uMqHifXsoIVroFwynAEyrqjlry5NeXpqjfGGI
	2RvjE2EsniO3EtbW63C1iIytSFCM3xmBLeKS9jBH4W16NzcdOPPmituiXeGtUcfc
	uNXJdxrC+IcFHOAwDkihD4auJ+1v6gUW5uqZzKtD4hWLJheFtDYHarwDlfj1Sz4j
	IWEu94Sh8o1lTu6YmCCbPAzRs4oU0eTzbpGyXw0CSgc++4PiaxI0tEs+RrBqV+2G
	Ihjq77tuf5Kybr8+5kQLuC9vn/u6JhPGK6ECdzp4LktJp1+i3xBKhHpagkqNZmfP
	5KkEsIcLsCDq5ovPvUenxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737632759; x=
	1737719159; bh=OV52CXtA9Mn9pl9P/tIMuFALFpRSQLfNRGrEzKRhM2k=; b=U
	R+6U+5qrnWiJkagrVYqud2N5C/Y7tnvbp9kYLqT0X+TC7kb4SHcxaS1tdA2LN3qk
	w43QllaOkiAIwlk66/H+xT5gpQxJwza8SwSa5QR6ffuJidgiK+btNOElAcwpErz/
	TdUTkvLAYJKIk8qNT8CcWWaA18wnP35hgka+zqq7FUq5HltRwKKF2uCuibp8dV7X
	fhdYDrT+RKi+EHie0j4tzXZmDFD523JJiMoUBopX0Odzr3rRaXpaBL42kKD6qVNw
	nM69kWlkPjcVQzT6Df8uOPSmk/1VXgp6V27K5o4x8e3tZcnMMMkTHGP/uXucKVGn
	n64cXtzekVllLgeNSbULw==
X-ME-Sender: <xms:9iuSZ_Dqf19utgroQe0KsGzMSsQxhhq8xZQ5FgfZyXrzq6XCnXRClg>
    <xme:9iuSZ1jEwJPC_yVbXCISHHLLUxMOFf4iWbogjOjh42f4DC3JvcR4J3Wg294ldDPqt
    eDhZfR6jx4lZ_xZkUg>
X-ME-Received: <xmr:9iuSZ6kB-2HUeBKUQY1Ujwg5rn880rLJXOIm51QMLn-ByfE2fqehbkyJPHoA-t6TQxqZ74HJRmEjc2OPVk6UUKbtVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftd
    dvleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrd
    hsvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    thhomhhirdhvrghlkhgvihhnvghnodhrvghnvghsrghssehiuggvrghsohhnsghorghrug
    drtghomhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgv
    lhdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:9iuSZxz3DJa-HFM9_EJJ9I9GzGUEUnzOSDPOvPaUZtflniDGXFnGDA>
    <xmx:9iuSZ0QjnNtY2mGAOssGfgAambtongUyf2FP-YWe9H5xAmBMN9dQCQ>
    <xmx:9iuSZ0a4wMT6aKpuexq_EcR-aEkIFroYWcVbPYZugOwMWYSqT0CyLw>
    <xmx:9iuSZ1TrwvJABtMBiSJ2xcN3O5HlwwykKbYR4bmEvCuSgNskKKSUbQ>
    <xmx:9yuSZ5J9-WhLy8_9noL_-ckILEk5oQJPc8EOzq1FoDMnetc8Rgdic4-4>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 06:45:58 -0500 (EST)
Date: Thu, 23 Jan 2025 12:45:56 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/5] media: rcar-vin: Remove superfluous starting state
Message-ID: <20250123114556.GB2085710@ragnatech.se>
References: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
 <20250122165353.1273739-4-niklas.soderlund+renesas@ragnatech.se>
 <d8d2b38a-3ab3-451b-80c7-ad9150f37675@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8d2b38a-3ab3-451b-80c7-ad9150f37675@ideasonboard.com>

Ho Tomi,

On 2025-01-23 09:24:07 +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 22/01/2025 18:53, Niklas Söderlund wrote:
> > The STARTING state is superfluous and can be replaced with a check of
> > the sequence counter. The design idea is that the first buffer returned
> > from the driver have to come from the first hardware buffer slot.
> > Failing this the first 3 buffers queued to the device can be returned
> > out-of-order.
> > 
> > But it's much clearer to check the sequence counter to only return the
> > first buffer if it comes from hardware slot 0 then it is to carry around
> > an extra state just for this. Remove the unneeded state and replace it
> > with a simpler check.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >   drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 5 ++---
> >   drivers/media/platform/renesas/rcar-vin/rcar-vin.h | 2 --
> >   2 files changed, 2 insertions(+), 5 deletions(-)
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> I don't understand the feature, though =). Why does the first buffer have to
> come from slot 0?

The VIN have 3 slots it can use when streaming in continues mode. The 
usual operation is that it starts with slot 0 for the first capture, 
then moves to slot 1, slot 2, slot 0, etc.

It was observed on that sometimes the first capture interrupt we get 
comes from a slot other then 0. In that case up to the 3 first frames 
returned from the device are out-of-order and that is not good. This 
check is to check for that seldom trigged condition and drop 1 or 2 
frames when starting capture in order for it to sync so buffers are 
always returned in the order they where queued.

IIRC this issue was only ever observed on Gen2 after the system had been 
suspended and then resumed. But I can't recall if the VIN had to be 
streaming at suspend time for this issue to have a chance to hit.

> 
>  Tomi
> 
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > index a16adc6fd4dc..ba55ccf648de 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > @@ -1064,7 +1064,7 @@ static int rvin_capture_start(struct rvin_dev *vin)
> >   	/* Continuous Frame Capture Mode */
> >   	rvin_write(vin, VNFC_C_FRAME, VNFC_REG);
> > -	vin->state = STARTING;
> > +	vin->state = RUNNING;
> >   	return 0;
> >   }
> > @@ -1120,14 +1120,13 @@ static irqreturn_t rvin_irq(int irq, void *data)
> >   	 * To hand buffers back in a known order to userspace start
> >   	 * to capture first from slot 0.
> >   	 */
> > -	if (vin->state == STARTING) {
> > +	if (!vin->sequence) {
> >   		if (slot != 0) {
> >   			vin_dbg(vin, "Starting sync slot: %d\n", slot);
> >   			goto done;
> >   		}
> >   		vin_dbg(vin, "Capture start synced!\n");
> > -		vin->state = RUNNING;
> >   	}
> >   	/* Capture frame */
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> > index 4cb25d8bbf32..f13ef379d095 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> > @@ -64,13 +64,11 @@ enum rvin_isp_id {
> >   /**
> >    * enum rvin_dma_state - DMA states
> >    * @STOPPED:   No operation in progress
> > - * @STARTING:  Capture starting up
> >    * @RUNNING:   Operation in progress have buffers
> >    * @STOPPING:  Stopping operation
> >    */
> >   enum rvin_dma_state {
> >   	STOPPED = 0,
> > -	STARTING,
> >   	RUNNING,
> >   	STOPPING,
> >   };
> 

-- 
Kind Regards,
Niklas Söderlund

