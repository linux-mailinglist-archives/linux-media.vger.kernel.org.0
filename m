Return-Path: <linux-media+bounces-36742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C607AF83EA
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 850364E6BC0
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01262D3A6A;
	Thu,  3 Jul 2025 22:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="DY13JS76";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gt+zbbLB"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B8728688E;
	Thu,  3 Jul 2025 22:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751583106; cv=none; b=KuuzIf58bKFk+lS2AQ+mCrGAaPy3tnIEq4sFs0rBorSbeEBogYZ/VPKX9b7cxsE//gnamDRemy2soBuo9esniupPQBycjRg9tzb6xUW5ng58Wmwj6dCPqilldpjkI6oT95Him+mTq7M5GfAWhLIlMyCTcwPEjcULqfokkjoSL/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751583106; c=relaxed/simple;
	bh=MZnnwxaciUdBrmqlRWTjHDM4sGkiYPAat51MIDk31ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIIGtYQ0jzSZ8FziwHIKUUWJfWXt/3H4fF4b/4s46djdsPip5+XL5I7HXZirvCD+1w6jcyz7MKT6umiV6V1lPAEE3VwjGu5S63JotVQpQ8Yxht5p9h9B6YERJAC57TixrCUcFJcN0b4eCAzgERFkFA2k8cYGB8vwRKeavoSDZ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=DY13JS76; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gt+zbbLB; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 2AA63EC07CE;
	Thu,  3 Jul 2025 18:51:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 03 Jul 2025 18:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751583102;
	 x=1751669502; bh=vwKwpcZzbLR2mSDIACokLetzlaFyYMoU1XaQ9ANcpVM=; b=
	DY13JS763x5abtxEFXQ0bdT6kRz9eeWKXB6FHlQpyztRclN2JTdd2izIaZfuTVas
	C3W4f5BH6RapawIdCVZhO3S0w4sxmFOi3n4ZI1UVLUmCn2oAHVSThu/CklicHQAx
	6EAc7kxsrLRiLgtVU1rk8qPa5OqzvJERgSLRsPSKxRnHzq04lyNDgP/K5+d/lk0Q
	D4mnlMzqKLvr1gHOt5/FSRkdgf6DeAOiUCnGKsX/++x3uKOZfm8jfh+ia30c0nwM
	1tcfId7qEZ7aPIuppsCEzqsIiJtUk/CiQpz8OkSc5mSHkRRQ3ZQNxUlghcLVaqul
	P9L9I2TvP3PELSMFVt6a9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751583102; x=
	1751669502; bh=vwKwpcZzbLR2mSDIACokLetzlaFyYMoU1XaQ9ANcpVM=; b=g
	t+zbbLBVv6svSFhAf1XMk4C5MQfTQJ6BQ5exqgr0xsshTV5c2Hrqdsqo470uLFf4
	pVCLAene4BcdPf+4N2TKFpiu/bs9M8ym+CYAJB0+1dEK5IISK8NktmaeaGwWjAy7
	8aYF8fK2QiJAdUVA/8LYc2scqYQJUXTlb8q/jP6VCtqhlJjpiJgTo50JBcBICNH3
	Q37EqB0sBD6mziWD4iy1REmBEHsI4yyI/oqBmBECCPXzM+LkHujepkN9+FerofAU
	qOln4fgQRxIwqhAF7plRTX5ieA3aB5bnFblx7OIrPpvtFQIJWlwUbo7YkExJUZWW
	ARsSH7b83u0MbCPdISBqg==
X-ME-Sender: <xms:fQlnaDbWCs5UOOUU4AZTMOGwjAf9ZNza-Z0t7kqv_nxNu4QjvAd0kw>
    <xme:fQlnaCbVzwx4DqjzcPmP5cbYePMZpNiFqUaJx5AWsDKm5NUSurhqtk1ad4v7-ZV2I
    LnjzpwTcxxHjGdzk7Y>
X-ME-Received: <xmr:fQlnaF89Zph3yH9w4gtfvFGqoIS6lZjnYXU3ZgblEMZeC8JZZZp6o7EMi4oiDqBLLRUDksuKnMYnyEL2lNeWY8ELHwthDaPFkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfffjefg
    fedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepie
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgr
    rhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghrshesmhgvth
    grfhhoohdruggvpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohephhhvvghrkhhuihhlseigshegrghllhdrnhhlpdhrtghpthhtoheplhhinh
    hugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:fQlnaJrnIvlX3JPPbLy-sAW4vPGzftIMpqEdGUe1igiEhWMUeHmqlg>
    <xmx:fQlnaOq8LLqGxRtZF2IPva90M31Q2pKlPrHxRAOqr3e9T6PVvMJPkw>
    <xmx:fQlnaPRHZQvSVxcBATP3DlK0B8MXk9fl0pWtR7jKliXIYlb84CFwuw>
    <xmx:fQlnaGpsUjicL5sakuMCEcdfOG3oksMQfxCTwEvCbN01vBaN5Tt2jA>
    <xmx:fglnaATZ2HuYa-NFr_j9f8SOHH14z2t-qL8-6FoEaUwFym46gkenXz-i>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 18:51:41 -0400 (EDT)
Date: Fri, 4 Jul 2025 00:51:39 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 02/11] media: adv7180: Add missing lock in suspend
 callback
Message-ID: <20250703225139.GC3900914@ragnatech.se>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
 <20250703205223.2810806-3-niklas.soderlund+renesas@ragnatech.se>
 <20250703224326.GD3798@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703224326.GD3798@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for your feedback.

On 2025-07-04 01:43:26 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Thu, Jul 03, 2025 at 10:52:14PM +0200, Niklas Söderlund wrote:
> > The adv7180_set_power() utilizes adv7180_write() which in turn requires
> > the state mutex to be held, take it before calling adv7180_set_power()
> > to avoid tripping a lockdep_assert_held().
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/i2c/adv7180.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> > index 2519bc53333c..0c5511a7667d 100644
> > --- a/drivers/media/i2c/adv7180.c
> > +++ b/drivers/media/i2c/adv7180.c
> > @@ -1565,6 +1565,8 @@ static int adv7180_suspend(struct device *dev)
> >  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >  	struct adv7180_state *state = to_state(sd);
> >  
> > +	guard(mutex)(&state->mutex);
> > +
> >  	return adv7180_set_power(state, false);
> 
> Doesn't adv7180_resume() suffer from the same issue ? And how about
> adv7180_set_pad_format() ?

They do. But they will be fixed / reworked in later commits in the 
series. So it seems a but of churn to add a guard in this commit only to 
remove it later ;-)

> 
> >  }
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

