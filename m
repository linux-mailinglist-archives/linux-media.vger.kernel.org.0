Return-Path: <linux-media+bounces-26395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1405A3C27C
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 15:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CEA53ACA2A
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273401E3DE5;
	Wed, 19 Feb 2025 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="YJH94Lef";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JyBrSKCq"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE61B15B543;
	Wed, 19 Feb 2025 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739976424; cv=none; b=W74D4ASkfjD7FrvBKgwnXSZ7R8fFQHir1ABM7x1WLt/AMh6EUQferbhC+pzFdtVaNroogfGK4XzrZFrunL/fnb7/RIuSklQFoFM600DikHoaR8f+ug9YQYA+3IKA+HXbarnR7Rn+rSavMDatWnaFl9wQ/udm+8cuMlG9tOa5v5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739976424; c=relaxed/simple;
	bh=K7uSvsIz3bGhDDo1lESv9gEROOp8VdeUQE/GdeQ4jsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWRzAd0av/tk4oPI92MloqnmYaZ6u/DFlD0W6zDH0/r/6AoqY1vvG5k75xuLcbLVYD0l7XyqEHOOJAxQnX8hmOJmo6+3hQdJOEKYSHlcUKjqiMicuIoeisLqc5HSxfVlh+VZfHVWrqSGXbkQOiWcBL5QgQpODYuiCIkc7s8kM08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=YJH94Lef; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JyBrSKCq; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 8500211401BD;
	Wed, 19 Feb 2025 09:47:01 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 19 Feb 2025 09:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739976421;
	 x=1740062821; bh=OgrRoIa2Ny8BJs7kVL+kwdmAubtr6zl3+rtP3kxTRmE=; b=
	YJH94Lefc5Lbm1FXA4XnPUBitMj8bZrIoabcgFfdswg+zC4J5C47bfku1P6iwiaQ
	7ZgNV5D6TJVHQYKDVUuLts7x/Zm6TibbWPOGmdL/+LqKOQYGzb3WM3Xvka0eVSSY
	RuESTVHifXDCYvzK4Gppi6u6Vqx5VWVgkbA+EMhPENfN/+pXWZfQvL7YNqZVhHZI
	4LmgV5BxxW1JPDenn6AGXdWBo90n/zY9cd+OYhCA6allPhohH+IYc8sdMhwraJpK
	sDmoMPiyWtCHB8aRiby4xeRaJp+XA8RZZXq3T+EfL7pSPmna9nm5wx06BV0mOlU5
	uQoWcr7j2gkXdPMIDGQ4Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739976421; x=
	1740062821; bh=OgrRoIa2Ny8BJs7kVL+kwdmAubtr6zl3+rtP3kxTRmE=; b=J
	yBrSKCqFGc096OT9EhzBqGSNt1FWWM8yHdMsc6CVicJGTkndFLjH8xpzQ2QWsmEJ
	eQs8hmsCJKh8Ibp5SwDrUUYz1SO9D4kJpBT3M6QhTs31dm607qJJKwr1mec7M23y
	61bMkViinFMX+VSataa+1AafzgxlD6xlahMxOPHIGQqTKgXv6I4S4AzivsZpAN32
	vzcClZcs1PGMebqOriZmSvcXmALVusu2Glwy7LdspUXZlnx5lzSupxj9cn7Sfh1m
	fQFZzdDcMi18Hw7cn7qACOH/UH4Q7ndrn82Va1+4UrE+KnDJmsizEizp+/omHzW9
	4vytRTgDEplt+h0iJ9jUQ==
X-ME-Sender: <xms:5e61Z8FBisri3lErdqDrSQ2nUAgCf8ImJm3BU_mShptbTntXkA_zsg>
    <xme:5e61Z1WB07fONoGUrCGvkFZgV_Bp0uZ9hHUE3bwo5jE6_YJLpdVecXv7opVqM95PV
    DzJUJsWmt_dLbuLl-c>
X-ME-Received: <xmr:5e61Z2LH_DLhQfm-M5UBH5cRmn3yfvkCA1SL6dkJagvNVlDyVYtF4VIhVOm9Es1k1jHBfvShNlOI__LtXA6XDk3fcaU6n74pwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigeehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvg
    hhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrghkrghrihdrrghilhhushes
    lhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgr
    shdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghh
    rggsodhhuhgrfigviheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgruhhrvghnth
    drphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehj
    rggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:5e61Z-Fc_t-rUXA135XXF_ksocZuVnJ-rxNBotNQrfzAMcuUWVAomw>
    <xmx:5e61ZyV2b-DIhYiYSmOi-k261T_UCls9SFLKyus8dXVtXwxVmRhc7w>
    <xmx:5e61ZxMonTSD8be6Kd7p6V8Qnc5WrJmwdsdrulgP5xOpbntc-QTO9g>
    <xmx:5e61Z52zDHddrfHlfXUrSpP_c9eWqUPcG458IqohAOFFAe8piQ1NYA>
    <xmx:5e61Z-R3WG87aDNwIaoMjeS7T985DdsAghEOmTpFNF6YYG6gBKcYRoXm>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Feb 2025 09:47:00 -0500 (EST)
Date: Wed, 19 Feb 2025 15:46:58 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 07/18] media: rcar-csi2: Fix typo
Message-ID: <20250219144658.GA515486@ragnatech.se>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
 <20250219-rcar-streams-v1-7-f1b93e370aab@ideasonboard.com>
 <20250219142459.GB512344@ragnatech.se>
 <458fd743-e6d6-475d-9da8-121c7d1a6bb4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <458fd743-e6d6-475d-9da8-121c7d1a6bb4@ideasonboard.com>

On 2025-02-19 16:36:27 +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 19/02/2025 16:24, Niklas Söderlund wrote:
> > Hi Tomi,
> > 
> > On 2025-02-19 15:49:01 +0200, Tomi Valkeinen wrote:
> > > Fix typo with variable name 'msps'.
> > 
> > FWIW, this is not a typo, C-PHY uses symbols per seconds, not bits per
> > second.
> 
> Hmm, but the code calls rcsi2_calc_mbps() and uses the returned value as
> msps. How can that be right, if it's symbols?

I don't recall all the details off hand, but IIRC it's just a naming 
thing in the specification. I'm fine with using either, just wanted to 
point out it was not a typo but intentional name.

> 
>  Tomi
> 
> > > 
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > ---
> > >   drivers/media/platform/renesas/rcar-csi2.c | 10 +++++-----
> > >   1 file changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > > index 845fb3e155f1..92697ea3df01 100644
> > > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > > @@ -1301,7 +1301,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
> > >   	const struct rcar_csi2_format *format;
> > >   	const struct v4l2_mbus_framefmt *fmt;
> > >   	unsigned int lanes;
> > > -	int msps;
> > > +	int mbps;
> > >   	int ret;
> > >   	/* Use the format on the sink pad to compute the receiver config. */
> > > @@ -1314,9 +1314,9 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
> > >   	if (ret)
> > >   		return ret;
> > > -	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> > > -	if (msps < 0)
> > > -		return msps;
> > > +	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> > > +	if (mbps < 0)
> > > +		return mbps;
> > >   	/* Reset LINK and PHY*/
> > >   	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
> > > @@ -1352,7 +1352,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
> > >   	rcsi2_write16(priv, V4H_PPI_RW_COMMON_CFG_REG, 0x0003);
> > >   	/* C-PHY settings */
> > > -	ret = rcsi2_c_phy_setting_v4h(priv, msps);
> > > +	ret = rcsi2_c_phy_setting_v4h(priv, mbps);
> > >   	if (ret)
> > >   		return ret;
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
Kind Regards,
Niklas Söderlund

