Return-Path: <linux-media+bounces-34644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07934AD7972
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 19:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C9453B1344
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 17:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103992BE7C8;
	Thu, 12 Jun 2025 17:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="P8MOdCSu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SflIqit1"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9D929DB97;
	Thu, 12 Jun 2025 17:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749750965; cv=none; b=hYrAShvIWB2XRl/U+zKiOdX5VZcTueKon7uJj6wr99QzHjXRxAIdfLAca6/UHVFZJST3JMaQq/dOsR2F+7Aua7O377odcG2eKgKKq5eGrT6wdwooB5Gp6gRMpfO+NferUetveNJeaIWeEzAXzU4hk4xfSdvKt5uCTobOzvLq8VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749750965; c=relaxed/simple;
	bh=7NbD5EzbriPvyz1s1i70hQjMMOxbxKhc7LyGfM9t5Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df09p68tbIJGPn2l3luQkjsQB1vvA9LqiOpFTwxsHVRF7dcWzyHHlpZYZ1U9b9Bpyv3+SofBKHA+g5JoaS6KZ63A/cCfrd5P7m2HnbCcN+CZDj+xeSaYN5LUXAKNjFcvru7+Ks4jfUpv7e0+Nq7DLzdbHnTIRCnAZXOAzx9tRXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=P8MOdCSu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SflIqit1; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id E4F721140271;
	Thu, 12 Jun 2025 13:56:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 12 Jun 2025 13:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749750960;
	 x=1749837360; bh=X3PFZfCUQBros9qPu/MsUt6kHpLBNUqRMh5dm9jEwls=; b=
	P8MOdCSuHwbMJgixB48KjbVFAS+s8PDDh9IOcIlJO3T1aESi6U8JIRz6R3PaG4qZ
	ZjYUoMogHTAfLAu9BwjPEdVmUkGdtFtyTEx5AwzZgPZ5A7xGuR57kF4p8+zNdj4D
	S7HnhBSrpNj+98B7I6pBc3pba9+08hqI6tL6OCSi8B7sezP9tQ13plCvBFYRQNmt
	9ZY4G5aHUpBvOIhR8bBazcdK/SrRt8zaxtLTv3EREnZSj/F2e2SsFRM4wsjHTWGv
	/Xm8MCp0MqNbSCBWTT7CAoNOLLT0W+7W1EQbLH0LTIbKZ5vDQm5Tainvmk6b4W17
	9Twjd+MfMzogLYucJIBTDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749750960; x=
	1749837360; bh=X3PFZfCUQBros9qPu/MsUt6kHpLBNUqRMh5dm9jEwls=; b=S
	flIqit1jgtdN9jNL5V9azAyOQv0hLnAOT+UvhFzAZyji1jY1ZbRvBCUguk5eUHop
	XXRdVLktD7Ma/7jqvXZ+3/aIofcFj7swqt/RKG7jVZwD4ug02iwGYXUnK+8lJaNR
	b7ePgoXjFnKOjDO1rSU19AeNUAl64rcLNj7GYqgQT7sZVvLEHbPfRsVw74ne+/oK
	nlUoCfTABoTQ5+n8d6tabiLHDpRIE3S3YKLU0lGtMfBtnCi00sBt5A3sj3ROshN/
	svkg1Z6pBuXSWSA9l447yB2wHNy7ZjDrpqv767eBspOOJuD2UH4KXAE+3e6m7PdG
	aUPdkfIIJWBYZshuH0EXQ==
X-ME-Sender: <xms:sBRLaL9KyTgPbQW55YDOp4fDhsB9dl1K73d720IfaJMoCUB4EMkMdA>
    <xme:sBRLaHuJ5tgPdaTTbAamGdfh_O81nSNMS4I0x0AbYkulzA-FSLXh-h1bpYsJFutSm
    M5KxT74Ziw4Ubh4iwg>
X-ME-Received: <xmr:sBRLaJBjcdhrhy5pe19p_7fBTCi7Tg-T7zyJ8htRCf7zJJWAeVmd9yXzL9alQCNo9YieAj3J1M6CWRQgKUMb82BeZCoAXZOI0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheejvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepkedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggv
    rghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrg
    hrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhm
    ohhnughiodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtth
    hopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkihgvrhgrnhdr
    sghinhhghhgrmhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtg
    hpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:sBRLaHcwXvWGhYMfbEbd9g-_HfFOIDjyTWPUlpdJtBXGcdiXac8eCQ>
    <xmx:sBRLaANRnTRYtJftVMEvA0cZM2TfTZH3QyM_0Bywh_Zkb3CXpM3UHg>
    <xmx:sBRLaJnMboe4Hr2wVI14q02Xpf41-L34LYNhcNkswJpXg6xbHEuzoA>
    <xmx:sBRLaKskqPMX4LKLnm3NXQ8MKwVMyArZOCJC5rb3mmMTjcq2JMTthg>
    <xmx:sBRLaKAhMYPOBUgpq7jU2J_Kaitf2TieF1xhDxnG7bAxlP8Mo-iz_F2e>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 13:55:59 -0400 (EDT)
Date: Thu, 12 Jun 2025 19:55:57 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: vsp1: Reset FCP for VSPX
Message-ID: <20250612175557.GJ330732@ragnatech.se>
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
 <20250609-vspx-reset-v1-3-9f17277ff1e2@ideasonboard.com>
 <20250611233611.GR24465@pendragon.ideasonboard.com>
 <6orphbs6syqu6oruppyln4kkepj42c775cs4nj4oygu4xitpx6@tlvab6mntrrx>
 <20250612101215.GE25137@pendragon.ideasonboard.com>
 <rkihvnry5yybz7bjcbanth4yq7svywicmbhksz4ity6buw52ff@tmxefdhvpgaf>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rkihvnry5yybz7bjcbanth4yq7svywicmbhksz4ity6buw52ff@tmxefdhvpgaf>

On 2025-06-12 12:20:13 +0200, Jacopo Mondi wrote:
> Hi Laurent
> 
> On Thu, Jun 12, 2025 at 01:12:15PM +0300, Laurent Pinchart wrote:
> > On Thu, Jun 12, 2025 at 11:48:49AM +0200, Jacopo Mondi wrote:
> > > On Thu, Jun 12, 2025 at 02:36:11AM +0300, Laurent Pinchart wrote:
> > > > On Mon, Jun 09, 2025 at 09:01:44PM +0200, Jacopo Mondi wrote:
> > > > > According section "62.3.7.1 "Operation Control Setting
> > > >
> > > > "According to"
> > > >
> > > > > IP set VSPX+FCPVX" of the R-Car Gen4 Hardware Manual, FCPX has to
> > > > > be reset when stopping the image processing.
> > > >
> > > > That's only when stopping "image process of VSPX+FCPVX immediately".
> > > > Note the "immediately", which involves resetting the VSP too. The code
> > > > below waits for the pipeline to stop at the end of the frame. Resetting
> > > > the FCP doesn't seem to be required in that case.
> > >
> > > True, we certainly don't
> > >
> > > 2. Set value 1 to VSPX register VI6_SRESET.SRST0. VSPX will invoke
> > >    termination process immediately.
> > >
> > > but rather wait for the last frame to complete before stopping the
> > > pipeline.
> > >
> > > Do you think this patch should be dropped ?
> >
> > I would say so, I don't think there's a need to reset the FCP when
> > waiting for the pipeline to stop normally. Or have you noticed issues
> > that this patch would solve ?
> >
> 
> Not really, this comes straight from the upporting of the FCPD reset.
> 
> We've been running with an older of this patch that wasn't actually
> resetting the FCP and we got no issues. At the same time Niklas has
> confirmed running with this version that actually resets the FCP
> doesn't introduce regressions.

I'm not up to snuff on the diff between the two sets. But from our 
discussion on IRC today I dropped all 3 patches from my testing branch 
and that broke my stress tests (after a few runs). I will keep these 
three patches in my ISP branch for now.

Just to be clear the stress tests where fine with the old version too, 
only dropping all 3 reset patches had an negative effect.

> 
> I'm fine dropping this patch indeed
> 
> > > > > Softawre reset the FCPX after the vsp1 pipe has stopped.
> > > >
> > > > s/Softawre/Software/
> > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > > > ---
> > > > >  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 7 +++++--
> > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > > > index a6e5e10f3ef275c1b081c3d957e6cf356332afce..c6f2417aabc479384012ab8ab99556029ede1f44 100644
> > > > > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > > > @@ -499,6 +499,7 @@ bool vsp1_pipeline_stopped(struct vsp1_pipeline *pipe)
> > > > >  int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> > > > >  {
> > > > >  	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
> > > > > +	u32 version = vsp1->version & VI6_IP_VERSION_MODEL_MASK;
> > > > >  	struct vsp1_entity *entity;
> > > > >  	unsigned long flags;
> > > > >  	int ret;
> > > > > @@ -515,8 +516,7 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> > > > >  			spin_unlock_irqrestore(&pipe->irqlock, flags);
> > > > >  		}
> > > > >
> > > > > -		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> > > > > -		    VI6_IP_VERSION_MODEL_VSPD_GEN3)
> > > > > +		if (version == VI6_IP_VERSION_MODEL_VSPD_GEN3)
> > > > >  			ret |= rcar_fcp_soft_reset(vsp1->fcp);
> > > > >
> > > > >  	} else {
> > > > > @@ -529,6 +529,9 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> > > > >  		ret = wait_event_timeout(pipe->wq, vsp1_pipeline_stopped(pipe),
> > > > >  					 msecs_to_jiffies(500));
> > > > >  		ret = ret == 0 ? -ETIMEDOUT : 0;
> > > > > +
> > > > > +		if (version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
> > > > > +			ret |= rcar_fcp_soft_reset(vsp1->fcp);
> > > > >  	}
> > > > >
> > > > >  	list_for_each_entry(entity, &pipe->entities, list_pipe) {
> >
> > --
> > Regards,
> >
> > Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

