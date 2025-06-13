Return-Path: <linux-media+bounces-34761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB370AD8EF4
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 16:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 627A13BF3A6
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 14:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A682E2EFB;
	Fri, 13 Jun 2025 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Fv+OdKjR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GNeBvGHC"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95E82DA765;
	Fri, 13 Jun 2025 14:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823487; cv=none; b=WWv5pqFbvxskSepBIyKkWpriwbRj72hutnONwU4ScB3NR9pShZ2Aw/eJKko8dH3rdZncmy5IeAcvJiXDr2pkQeLYbMOyw19z2PGpxdZEgV/Go6eNrXLJP7WGUd2J1AA26oWEboR6BohE3z2jz+WcqPEicp8uuyyP4KOab1GbHuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823487; c=relaxed/simple;
	bh=2hxJ7qEIE7r9hFXsvLpAWoKA4Zc1cnBsxLkdIxPPwb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHO6RVKZyi+BlT6nromU/3KlLS3JcK4KLG2KY7/ULMY6Zu5w5/+H4oGGDSWdshnyouuhvecZp10ZSeD4vlymaNDUsfWqqQ9TQyP98GaQqpsYj0L3vdVknIZrizOMSuSlb+J/p2ko2c+biBpeEFi0ewGHFJc6O/S1uUjPufjFPvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Fv+OdKjR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GNeBvGHC; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B16351140147;
	Fri, 13 Jun 2025 10:04:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 13 Jun 2025 10:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749823483;
	 x=1749909883; bh=WyQ5l6EDsMrgKluxLlz5WVKUiBDNL0Kmy4SuhX7iZDE=; b=
	Fv+OdKjREnznJ04PT3c3NedqQUscKr6x5VLRriMLrUaAY2l4rtCUZcZyk5ShdMHF
	Iqcp/F1zNSUrLYgDty39SYy6WcqULwyn1cxlKc8LgP2qA3XIzxVcAacg50R88Hd3
	6gUawbXzotmq163RVN0VEAlTa1DSBFaHmC4PKJanE1eVTy5kyK8rQdwrrHvx4Bqg
	JfruQGuK9V0FeJLHP0MMbOQN0EKyBYjQPkVmkqL/mdizs8rB2AxV7eUxZsCQVZPs
	jrs0XaTtOudzIrNoI1/n5agb8o0UDge9UjOHUd080Ps5dgAugSwta8Qs5TGwMFdh
	9ixguKw7JMZeW7NgPlffzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749823483; x=
	1749909883; bh=WyQ5l6EDsMrgKluxLlz5WVKUiBDNL0Kmy4SuhX7iZDE=; b=G
	NeBvGHCEdzGidg8VhRFgYTdUrz4vKjlMG7IqkMgAJH5l3gfMy72tHqWSb8v0uklF
	eowl8YqFRcisdRt9lrsHO3bOjPNYm7WuXfwOMN4pdBnHtPlKHM//YW9UyUcoMw3/
	fCIKIxXrrwS0U8awLyqHFWEvXV2xUpNW3FgDdRaTnybZVtWfe2G2oXFyOUaZ3PCe
	nPEU9zm6Q+TZwaZdo5KEWEXZOioWDjXDSc2RpRQoK4cGoLy/WyFYyXdXOA0MhEo9
	rR5NS4F0HudHAoVk0L/uUkdhwp2TIvAn7rjqlXGRPrXm8yQjZ/8nyhRPxFnlcYaZ
	L8ROxzqgh2iEzLwWubVig==
X-ME-Sender: <xms:-y9MaKccJXGB8rplx029slwhzdgk5rfzakgWaEx1D0jP106m6YRNOQ>
    <xme:-y9MaENZdQjzgZZ6colUFlY5jYB0macH4TpP3gEIYgZGNKKiI5woqxdMiMKT-REeV
    RkuW78IPXdCF0voks0>
X-ME-Received: <xmr:-y9MaLiLTWPOQlcivGI3VgkjbltKgSVEnk0VZ7P3eFIE61PPbHdeeKQUk76Q50XmLxAPD0g3easWY8aDM4HLZm-cXSZ0VtSdyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukedugecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:-y9MaH85D5ZLUZlmVx1rsAStnZLPeopHyf5kLEuTisOAfihfJLEeLA>
    <xmx:-y9MaGtZe_G9ZonZP7dviP4CjRxxCu_b4G9u6gFzB0rTwTXtv1W-Fw>
    <xmx:-y9MaOHQZV1aKZsFDm0sFAxBj4Vkr3atKx06Js4hgKT5aEqGpRTGIQ>
    <xmx:-y9MaFOnDV6GyNA-wCTzppwRtP7OuXoH2Oe7F9T2SfDUEdT7T3dtag>
    <xmx:-y9MaMjX-6ubaKe7yk_hhmqcdCDQbnMsincUAMAkUWwDzj9KFStToQPl>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 10:04:43 -0400 (EDT)
Date: Fri, 13 Jun 2025 16:04:41 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: vsp1: Reset FCP for VSPX
Message-ID: <20250613140441.GE1002387@ragnatech.se>
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
 <20250609-vspx-reset-v1-3-9f17277ff1e2@ideasonboard.com>
 <20250611233611.GR24465@pendragon.ideasonboard.com>
 <6orphbs6syqu6oruppyln4kkepj42c775cs4nj4oygu4xitpx6@tlvab6mntrrx>
 <20250612101215.GE25137@pendragon.ideasonboard.com>
 <rkihvnry5yybz7bjcbanth4yq7svywicmbhksz4ity6buw52ff@tmxefdhvpgaf>
 <20250612175557.GJ330732@ragnatech.se>
 <fssiugndu73bou62wdmcwp6vwu47ribr6evfzfrdm6el4qgatn@ngpnfy3qaogw>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fssiugndu73bou62wdmcwp6vwu47ribr6evfzfrdm6el4qgatn@ngpnfy3qaogw>

On 2025-06-12 20:05:57 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Thu, Jun 12, 2025 at 07:55:57PM +0200, Niklas Söderlund wrote:
> > On 2025-06-12 12:20:13 +0200, Jacopo Mondi wrote:
> > > Hi Laurent
> > >
> > > On Thu, Jun 12, 2025 at 01:12:15PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Jun 12, 2025 at 11:48:49AM +0200, Jacopo Mondi wrote:
> > > > > On Thu, Jun 12, 2025 at 02:36:11AM +0300, Laurent Pinchart wrote:
> > > > > > On Mon, Jun 09, 2025 at 09:01:44PM +0200, Jacopo Mondi wrote:
> > > > > > > According section "62.3.7.1 "Operation Control Setting
> > > > > >
> > > > > > "According to"
> > > > > >
> > > > > > > IP set VSPX+FCPVX" of the R-Car Gen4 Hardware Manual, FCPX has to
> > > > > > > be reset when stopping the image processing.
> > > > > >
> > > > > > That's only when stopping "image process of VSPX+FCPVX immediately".
> > > > > > Note the "immediately", which involves resetting the VSP too. The code
> > > > > > below waits for the pipeline to stop at the end of the frame. Resetting
> > > > > > the FCP doesn't seem to be required in that case.
> > > > >
> > > > > True, we certainly don't
> > > > >
> > > > > 2. Set value 1 to VSPX register VI6_SRESET.SRST0. VSPX will invoke
> > > > >    termination process immediately.
> > > > >
> > > > > but rather wait for the last frame to complete before stopping the
> > > > > pipeline.
> > > > >
> > > > > Do you think this patch should be dropped ?
> > > >
> > > > I would say so, I don't think there's a need to reset the FCP when
> > > > waiting for the pipeline to stop normally. Or have you noticed issues
> > > > that this patch would solve ?
> > > >
> > >
> > > Not really, this comes straight from the upporting of the FCPD reset.
> > >
> > > We've been running with an older of this patch that wasn't actually
> > > resetting the FCP and we got no issues. At the same time Niklas has
> > > confirmed running with this version that actually resets the FCP
> > > doesn't introduce regressions.
> >
> > I'm not up to snuff on the diff between the two sets. But from our
> > discussion on IRC today I dropped all 3 patches from my testing branch
> > and that broke my stress tests (after a few runs). I will keep these
> > three patches in my ISP branch for now.
> 
> Oh! That wasn't expected
> 
> The patch you were carring in your branch before this set
> (commit 93aab3f241dbff9af838af0b46f5a31fa6240b68 in your tree)
> didn't reset the FCPX for VSPX as far as I understand (and I have
> verified it by testing iirc).
> 
> The FCPX reset was guarded (in that patch) by
> 
>         if (pipe->lif)
> 
> and the VSPX pipe doesn't have a LIF, no reset was ever performed..

Indeed. I spent the day running more tests as and found it the fail I 
mentioned was in my tests. They timed out the yavta process did not 
terminate quickly enough after the last buffer was captured.

Running with this (or the old set) reduces this stop time, why I don't 
know. But what is clear is running without these patches is OK and 
everything functions as expected. Sorry for the noise.

> 
> 
> >
> > Just to be clear the stress tests where fine with the old version too,
> > only dropping all 3 reset patches had an negative effect.
> >
> > >
> > > I'm fine dropping this patch indeed
> > >
> > > > > > > Softawre reset the FCPX after the vsp1 pipe has stopped.
> > > > > >
> > > > > > s/Softawre/Software/
> > > > > >
> > > > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > > > > > ---
> > > > > > >  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 7 +++++--
> > > > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > > > > > index a6e5e10f3ef275c1b081c3d957e6cf356332afce..c6f2417aabc479384012ab8ab99556029ede1f44 100644
> > > > > > > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > > > > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > > > > > @@ -499,6 +499,7 @@ bool vsp1_pipeline_stopped(struct vsp1_pipeline *pipe)
> > > > > > >  int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> > > > > > >  {
> > > > > > >  	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
> > > > > > > +	u32 version = vsp1->version & VI6_IP_VERSION_MODEL_MASK;
> > > > > > >  	struct vsp1_entity *entity;
> > > > > > >  	unsigned long flags;
> > > > > > >  	int ret;
> > > > > > > @@ -515,8 +516,7 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> > > > > > >  			spin_unlock_irqrestore(&pipe->irqlock, flags);
> > > > > > >  		}
> > > > > > >
> > > > > > > -		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> > > > > > > -		    VI6_IP_VERSION_MODEL_VSPD_GEN3)
> > > > > > > +		if (version == VI6_IP_VERSION_MODEL_VSPD_GEN3)
> > > > > > >  			ret |= rcar_fcp_soft_reset(vsp1->fcp);
> > > > > > >
> > > > > > >  	} else {
> > > > > > > @@ -529,6 +529,9 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> > > > > > >  		ret = wait_event_timeout(pipe->wq, vsp1_pipeline_stopped(pipe),
> > > > > > >  					 msecs_to_jiffies(500));
> > > > > > >  		ret = ret == 0 ? -ETIMEDOUT : 0;
> > > > > > > +
> > > > > > > +		if (version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
> > > > > > > +			ret |= rcar_fcp_soft_reset(vsp1->fcp);
> > > > > > >  	}
> > > > > > >
> > > > > > >  	list_for_each_entry(entity, &pipe->entities, list_pipe) {
> > > >
> > > > --
> > > > Regards,
> > > >
> > > > Laurent Pinchart
> >
> > --
> > Kind Regards,
> > Niklas Söderlund

-- 
Kind Regards,
Niklas Söderlund

