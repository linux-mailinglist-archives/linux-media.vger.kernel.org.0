Return-Path: <linux-media+bounces-24244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1310A01445
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 13:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA40D188461F
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 12:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5345C1953BB;
	Sat,  4 Jan 2025 12:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cTJxcCFZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Kj1u2oTU"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9E31C6B4;
	Sat,  4 Jan 2025 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735993028; cv=none; b=kIT/mBYicKYvNxMp0UYyXgTJH+zFStMiW6U+isnNdYknFoiY8ka9O7tPVfxtUBP8n7LBsh5nFtcUvbC3Y3A9XJz5JB4XKOHMnjeQKRfT9KQ03EVK5Uj4KZ+xp6z7YuHdUdU7KhscvheYKLoMwgfT6WQWM9D3nUqT/wt1P6RDSGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735993028; c=relaxed/simple;
	bh=nzLsC49a7ezLLhHwHH3aykDJkZfd8qgg6IsgB2XUF3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMhcOHPhTkG3Zeb44bQxZYziVuwOCleaV7bCrXIMK/hDgT3Ss8xXaqPfjdoH2OTwgOPVuCK91nyCSV5OaBZgWqDybb/w9d4d8PG8vMHogsmVKQBDMnO43dp66As05d+DxLs8QPxqXJ4IuyBFo2YBgNOaSgzprTR617dqj6o2AFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cTJxcCFZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Kj1u2oTU; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id B09CB1140198;
	Sat,  4 Jan 2025 07:17:04 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 04 Jan 2025 07:17:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1735993024;
	 x=1736079424; bh=ydRMRC5sukqcVXq7NeTrGn3Yt8Z8JWUbqZOa1AQ+niM=; b=
	cTJxcCFZ8ME94m16B4rRoAZM6QkNa2YtCUD+5ONliE2BoMoLw/BpTgNQrJ9pNiL0
	tW4LB54A/4U93gugCf/mhInOiazIe3eaXBDmElZuG60mdqDgtgYt+wZfhh/zZ3qY
	5IUOGvsjPwVwffh3DEq81IXLPlSphtpPhzHFSw/hQQEDahPW6kJ81Puv0LxyZODi
	YpPQw4pqVa/1KAGPS2laJ7nab65sc/WHBYTYzm/DcxUFGL/jUtfEg3cgU7gW3pbw
	jq4arWnPpdN/xjyHJzDYovSzzPq1229IvfEho7hRaV0bGzbR92wSsQ+VVj3eW4sX
	9XpsiOF3/v4Gc21PZcD8AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735993024; x=
	1736079424; bh=ydRMRC5sukqcVXq7NeTrGn3Yt8Z8JWUbqZOa1AQ+niM=; b=K
	j1u2oTUALCfY+mCJSUym6VZQjfCOYeJ7IZeZxs+1Do8Et7lkQKTYdNXSmJXG9aQW
	5nwiwMFznUuEYHhfz0tbk//PkE+Pj6Zo3mgnud/k13gLYPrzkMaXjXVAskVbYlP/
	1mccQSaaXVQ1MPvZfWXjO2dONtu8G+X2fe5nL8uFY463x/5eCPpWoHcrZDtynwI5
	fQU2SV/1HdH0W/tNFka2UvP/i5cDne9qfZ1uIy7hAuJEKuAnc2I9UnzY02ymzkp+
	/7gja8uVqji+7Srnk2kqTpG6t2zxaQjmQf3RoOOKQCKxOTibDOytwbBZaS0TWEiW
	IZGnhUQF65X48YUGuVwXA==
X-ME-Sender: <xms:vyZ5Z4T34wNyN6Q2hf3vVTwRL9vYIv28SSEBhSEmqY4QOSVbMrISdw>
    <xme:vyZ5Z1wXF2blUI2vRXDxzEQPtPfLNrfMP9ywoz04B18ifYJ6PgZAmwR8Q6ZZ1FjrF
    PTXxQiQz_Rxbp7S-P8>
X-ME-Received: <xmr:vyZ5Z13yAX9eh-Nm70GbYwjtmF1YE6NLI99CS_-vxaQtf4gIjkWYnHvtc0XD4JSGMB2cwj5sCOAM0NM-bf_tdaPQcFR88NTlFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefiedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    ghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepshgrkhgrrhhird
    grihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgr
    sgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghh
    rghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmh
    gvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:vyZ5Z8ArMyy1Ny6ehsESFxlVsDECJpRRo4PCJOQbr0Qny4NdgpG8xg>
    <xmx:vyZ5ZxjlW9yIWzHWCbBKuwvurglFsRSh4uSpSPQVswxpiL4InCI4XQ>
    <xmx:vyZ5Z4q3-uVvAeqfErzC2AyVQKk4lSXAXVFpTmkUXWDcRBQqsX8Skw>
    <xmx:vyZ5Z0ize34LKsSOdZqruGV0gxz1_WgfvW-Rilk0TDVKiTrC4S3L3w>
    <xmx:wCZ5Z8rANYNiFs-1i0vDf-LTHDhmAxqkPOTNoxgEhuxq9sBIS25kMQ85>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Jan 2025 07:17:03 -0500 (EST)
Date: Sat, 4 Jan 2025 13:17:00 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: white-hawk-csi-dsi: Define
 CSI-2 data line orders
Message-ID: <20250104121700.GF808684@ragnatech.se>
References: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
 <20241121134108.2029925-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWqS=zURzutDsCqChSGia35JZpVuDY=njrCBEKP-6=eXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWqS=zURzutDsCqChSGia35JZpVuDY=njrCBEKP-6=eXw@mail.gmail.com>

Hi Geert,

Thanks for your feedback.

On 2024-12-27 14:22:31 +0100, Geert Uytterhoeven wrote:
> Hi Niklas, Sakari, Mauro,
> 
> On Thu, Nov 21, 2024 at 2:41 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The second CSI-2 C-PHY data-lane have a different line order (BCA) then
> > the two other data-lanes (ABC) for both connected CSI-2 receivers,
> > describe this in the device tree.
> >
> > This have worked in the past as the R-Car CSI-2 driver did not have
> 
> has
> 
> > documentation for the line order configuration and a magic value was
> > written to the register for this specific setup. Now the registers
> > involved are documented and the hardware description as well as the
> > driver needs to be corrected.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
> > @@ -21,6 +21,9 @@ csi40_in: endpoint {
> >                                 bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
> >                                 clock-lanes = <0>;
> >                                 data-lanes = <1 2 3>;
> > +                               line-orders = <MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC
> > +                                              MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BCA
> > +                                              MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC>;
> >                                 remote-endpoint = <&max96712_out0>;
> >                         };
> >                 };
> > @@ -41,6 +44,9 @@ csi41_in: endpoint {
> >                                 bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
> >                                 clock-lanes = <0>;
> >                                 data-lanes = <1 2 3>;
> > +                               line-orders = <MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC
> > +                                              MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BCA
> > +                                              MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC>;
> >                                 remote-endpoint = <&max96712_out1>;
> >                         };
> >                 };
> 
> Using the MEDIA_BUS_CSI2_CPHY_LINE_ORDER_* definitions has a hard
> dependency on commit 91a7088096a49eb4 ("media: dt-bindings: Add property
> to describe CSI-2 C-PHY line orders") in media/master, hence I cannot
> take this patch in renesas-devel until that dependency is resolved.
> 
> However, according to the cover letter, commit 573b4adddbd22baf ("media:
> v4l: fwnode: Parse MiPI DisCo for C-PHY line-orders") in media/master
> causes a regression in the absence of the line-orders properties
> (which I had missed before, unfortunately).
> So I think it is best if this patch goes in through the media tree,
> which already has the prerequisites and the regression:
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Alternatively, I can:
>   1. Cherry-pick commit 91a7088096a49eb4 first,
>   2. Replace the MEDIA_BUS_CSI2_CPHY_LINE_ORDER_* definitions by
>      their numerical values.
> 
> Please let me know if you prefer option 1 or 2.
> Thanks!

My preference would be for this patch to go thru the media tree with 
your tags to create the least churn, if Sakari is OK with that ofc.

If not I leave it up to Sakari which option is most preferable to him, 
I'm OK with both alternatives.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

