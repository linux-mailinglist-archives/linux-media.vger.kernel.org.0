Return-Path: <linux-media+bounces-29214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81838A78B99
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 11:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87B6A3AC703
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 09:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874ED23644F;
	Wed,  2 Apr 2025 09:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="r5HTYuj9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oo+BcD0S"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AF72356B5;
	Wed,  2 Apr 2025 09:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587877; cv=none; b=WuPXggaNRy6T71LobKuR53TK8XkK9Hbw63NNbG/DOttGo5c0o8WpDgg7Un7mPv1jAvawZK/1C1XO1QDHqiAbZM/byPrOJufgxU6RWjfO+fe9P5CbCj7Oe25Amd5USvWD7iYbofltwYKUjQxdm9dIluOSEFFzRN0J3okT6QrtTpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587877; c=relaxed/simple;
	bh=Wzmiam7fC2XrJAx0ApWPltrQIlXQu8gNNfucIjVSzrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ui3SFVqdZ3WY25x5rhGgN6mbTrgPHRL4OktVhLsHsmjjBwryhzCMZ215/lpJD0AVaNox2yyUIRV376kM/ykSEDheLWY9BwY44t0NCVoV+wDp5gKeLcJ+tTVMmmNXjRyXm8tkUSFRc52BTyfWa0kB1o4kVX4E2mMlibUED5uramM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=r5HTYuj9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oo+BcD0S; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 83CCE1140141;
	Wed,  2 Apr 2025 05:57:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 02 Apr 2025 05:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743587873;
	 x=1743674273; bh=rak6b2Fa/8kffSjsRHf56Le1CRC43LwC4W2VuTrqGwE=; b=
	r5HTYuj93IzPjwXpww5oC0WxIKuNrPueiuF75hPA6bFQ8YDPhtV544udfHIaCvty
	pVcAX8z5pGjl7fBYZo/Q5N/cao8YkUQMcsqy/pxRX/pi1l9AHXMoBFFyP6vb+KqB
	t33WXs5et3tq7RsuZWYkt6zu8tGfdDrVK/cadO+nXVfwqQ5vq8SXvaYg1q1flWQe
	1ELifkijWyUB4neEHuY1X3PhFJcJ+tNH70iPAllEkBHHhcfKsxqxBkbLdisQUDqr
	LxD1VSpWpYrRr7Ikz9SHY4dDQI+csnhZRGc64Yztjh8XkE4ArLUU0iKmsUcMdJXo
	6mnVsLfSUlsmCP/6TTZ2Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743587873; x=
	1743674273; bh=rak6b2Fa/8kffSjsRHf56Le1CRC43LwC4W2VuTrqGwE=; b=o
	o+BcD0S/UnhqG9r8DBpolomNhnM7ZzsU+CSqObWvIdInQ1doqScqh8/FQB6gxOku
	5tVLRR7+SIxtcjD1iwT6mKNfYc1VpM5ufHCTqfXK5AFTL/Uepa9p0VcVgbYSCWPM
	7jrQMt68xfuwjgBaBYpgpPr2aiw98MprwgFGybyDockFQdxm0hg0JfTkX6vcWEN2
	1NVpBl1/u/QKwGtmXRcEFR6ZjZsC/6rUYKIoN+T2dtK5hMEF/O2Fb6/LnRNl1/2g
	ki1LPzf+QseJJw3Acz7zsEU8616yD2Mb7fZx+B4JhjxjNxEa6WeoFl0L7AnqTV79
	LBx8udlQD9BUZ06LrbnFQ==
X-ME-Sender: <xms:IQrtZzrfM7sUGpPGhTzNGjp_jmtWO9GqMD-du44R5RJVw6zIBOObog>
    <xme:IQrtZ9pDEq3kCqz10OcNYIM-8FuIeZwETUI3ml6wseRrejtcalR0lCjroqwhrYMsz
    2kDeypO4EDhL_VdZmQ>
X-ME-Received: <xmr:IQrtZwMYFareqeYCCX0SPiUiMGDSP5NDr_Zao2IpTc0bAc8Qrg9oNd5-oLrMxqsCGPia0B1uYM7tEScMNvcP606hGzTS0nFBkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehff
    dtvdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvvgdrshhtvghvvg
    hnshhonhesrhgrshhpsggvrhhrhihpihdrtghomhdprhgtphhtthhopehmtghhvghhrggs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptgho
    nhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhi
    gidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:IQrtZ25XNWAt2JiLikQ61Hm1dbZeL42qEQtmpQJmZ0f2zRKZOyzDfg>
    <xmx:IQrtZy7S7hyJxtl1GdJ9fmuvJ-FkDS6-U29Ch9-MrgbQAsS7X0uzXQ>
    <xmx:IQrtZ-ht0wnqSzS4PM2T0kN7vyk6nCppkmtdosuCDXjuIN5yQbsrZQ>
    <xmx:IQrtZ07NQRhBWKqx3sLq7bPZFwHpNnl2ugGoielE2NNaBGMy9VxfCQ>
    <xmx:IQrtZ3IBkyDMLtbzpQVLWoLLTQ-kVmlWdREII44eNI7kh-f2HVSKGGJK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Apr 2025 05:57:52 -0400 (EDT)
Date: Wed, 2 Apr 2025 11:57:49 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: i2c: imx219: Remove redundant
 description of data-lanes
Message-ID: <20250402095749.GJ1240431@ragnatech.se>
References: <20250401145759.3253736-1-niklas.soderlund+renesas@ragnatech.se>
 <20250402-real-enthusiastic-ostrich-dcc243@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402-real-enthusiastic-ostrich-dcc243@krzk-bin>

Hi Krzysztof,

Thanks for your feedback.

On 2025-04-02 10:21:42 +0200, Krzysztof Kozlowski wrote:
> On Tue, Apr 01, 2025 at 04:57:58PM +0200, Niklas Söderlund wrote:
> > The bindings already reference video-interfaces.yaml in the endpoint
> > node, there is no need to duplicate the description of the data-lanes
> > property.
> > 
> >   An array of physical data lane indexes. Position of an entry determines
> >   the logical lane number, while the value of an entry indicates physical
> >   lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes = <1 2>;",
> >   assuming the clock lane is on hardware lane 0. If the hardware does not
> >   support lane reordering, monotonically incremented values shall be used
> >   from 0 or 1 onwards, depending on whether or not there is also a clock
> >   lane. This property is valid for serial busses only (e.g. MIPI CSI-2).
> 
> Please do not quote bindings in commit. It's never helpful.
> 
> > 
> > What the generic binding do not cover is the behavior if the property
> > would be omitted. But the imx219 driver have never agreed with the
> > description neither. Before commit ceddfd4493b3 ("media: i2c: imx219:
> 
> It did not have to agree. See discussion for v3 of patch adding this binding.

Thar discussion was in 2020, the common definition video-interfaces.yaml 
was merged in 2021 AFIK.

> 
> > Support four-lane operation") the driver errored out if not 2 lanes
> > where used, and after it if not 2 or 4 lanes where used.
> 
> Then... fix the driver?
> 
> This property describes hardware, not driver. Why current driver
> implementation, e.g. 1 year ago or now, would change the hardware (so
> the bindings)?

I agree, I thought that here we have a case where the bindings predate 
the standardisation. The driver do not match the bindings, in fact it 
breaks if the imx219 specific instructions are followed. So the risk of 
breaking stuff is likely low. And this was an opportunity to align the 
imx219 with video-interfaces.yaml.

I wasted time trying to use the imx219 bindings when bringing up a 
device, only wanted to try to help others avoid that.

> 
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > Hello,
> > 
> > The data-lanes property is a common property and the driver have always
> > operated as the common description, it seemed silly to break the driver
> > to adhere to odd specification, then to correct the bindings. However a
> > more correct solution would be to do the work on the driver of course.
> > 
> > This is just a drive-by fix in the hope of sparing others the time to
> > discover this oddity themself. This is only tested by using the bindings
> > themself and by 'make dt_binding_check'.
> > ---
> >  Documentation/devicetree/bindings/media/i2c/imx219.yaml | 9 ---------
> >  1 file changed, 9 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > index 07d088cf66e0..31beeb2be2ea 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > @@ -55,15 +55,6 @@ properties:
> >          unevaluatedProperties: false
> >  
> >          properties:
> > -          data-lanes:
> > -            description: |-
> > -              The sensor supports either two-lane, or four-lane operation.
> > -              If this property is omitted four-lane operation is assumed.
> > -              For two-lane operation the property must be set to <1 2>.
> > -            items:
> > -              - const: 1
> > -              - const: 2
> 
> So 1 lane is also fine? 8 lanes are as well? Previously lack of the
> property in DTS meant 4 lanes, now lack of property means anything.

Good point, if this patch where to be followed the data-lanes should be 
made a required property.

> 
> Best regards,
> Krzysztof
> 

-- 
Kind Regards,
Niklas Söderlund

