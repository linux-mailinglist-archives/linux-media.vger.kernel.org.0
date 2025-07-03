Return-Path: <linux-media+bounces-36744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 917AAAF83FE
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 01:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F047F1C47F31
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 23:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A761E2D8790;
	Thu,  3 Jul 2025 23:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="IE7yLZoD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RqQ1140r"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B732D876F;
	Thu,  3 Jul 2025 23:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584031; cv=none; b=XBBd6T46CFw1SAJnIHlMu7EVUjCuhN//Q54OrkTVKeah00RnrCB2qv2ERf2DTE8hBQboGgJ3UY3bchk4CDr0ddWAaGSjOksVMsClyIJ1HJh7QukU0gdZ0uT5ZYUf1zXUOaWj929a9D47AEBPrkMA0cF474EEt2pf/aI5Ohpa20I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584031; c=relaxed/simple;
	bh=mnxVAiYMJQMIm8jdcJ/oJDHhnwhxqsyPzHygx+PbNIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzni4Ns+CR3Hivy1MFPop6S07au8DiYZjYpMg6LebAjJeizLpzW5VtXDOowAszCZHgmUD6XgBe1yMLPAPeJJixAaH7fMXG/9XXo1teYPWTL3lo9RG1No9x3In6F77C1Rx9pIEZe90X3NJXQPVk5cozTGl1aRM5Mo3uQFqQjm93o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=IE7yLZoD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RqQ1140r; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id C294AEC0F00;
	Thu,  3 Jul 2025 19:07:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 03 Jul 2025 19:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751584028;
	 x=1751670428; bh=9we0LwGTNneyV+gBLoEe2GIWPMmI6sKZ8doAJia7peQ=; b=
	IE7yLZoDXNnPx727NePg9WZgaRxM2uzd/pxLVQ3anW6kfgoSQk55gi2Lad9KaU78
	YhrNTBqzS4KtFRPDg+Ns/Lzvek18llLDpIrqufPmhntu4JGP9UamOzLJTS0heO4K
	fzDO5ES1h51sndqXVx0tCgO08jRbUPs7TOI2/VH5PlqNbaqCnJ25NVQlLqrz+3/j
	q9sMqyXuv0mP2mrjbAqx+YplH8D9uSbQv85+fim7LHoNHVRPaaGx6Rq8HADoHsds
	/oPVlgBU581IMtJc3S347Pjx58XWiXnFI1Bsy9JRANGuZShz0EBJuB0Yog08XJkp
	qdcED4AvMyf1PCLCJdDxhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751584028; x=
	1751670428; bh=9we0LwGTNneyV+gBLoEe2GIWPMmI6sKZ8doAJia7peQ=; b=R
	qQ1140ryFmhb3ku1SApEOtrDV9DLQHb2djS5ymnxlQtrU70aKWTW24GyFVhubTfB
	knOmbZ4kCBZYq7BCmiWkN/d7FzxocX5ZeAL9hM7413xc1mwi/QRIJhXoWLlU/Ht7
	WM9WIUETzJZykBMITty0EW1j4uwnj4smUB6rt/u4Whh44BZYOnOg3lE+VEymKF1T
	awP/CvvWQDOZnAm42VW4ECbiI4dh57ljynGknsS5/W7DcLtZ2Sr5ddbkAm1MelNe
	wqYPyXVkSCoE2d1As8GwtFawlwcN4hNlHQt46KmS2aV2RjBffCyE0HdrvROgqarN
	mdRuKzpXyCzY1SyEBrmnQ==
X-ME-Sender: <xms:HA1naHVi6khiNvkBHvoLbIlf40xomyL5DmzCR7gH4G44hJ5026eKOg>
    <xme:HA1naPklEyK09gjW0VpxuISPfFnslP1hnT9ccZmb5ygkWXOzGVPg9gaCMHlpjC5AN
    JYWpzvz9diai7n33vo>
X-ME-Received: <xmr:HA1naDY5MZ1AKNxtNQk1akBzsv63K8hy6n6VO2Sf0EMoUV1OleSnxqA8_PeXR-2wP4lb17wDIoK09pJjfOoQjc-rDFDc_bKnyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvudehhecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:HA1naCVMB_4l9IV44l0bHoXUNARxpYe8stfV4z2SUT1G2P8aFBQN3g>
    <xmx:HA1naBlu5DuK3Tmhcmjw4I57SeAL6riRGU1IbjJczcL9Kdwb2zOK0g>
    <xmx:HA1naPfyH2nBctdIUoEnDlTwpt1hWWaj9MwZIDZScSJhplmiQumXJw>
    <xmx:HA1naLHuNRfMHAd9wgjlz2wlfgqmMxyr371zbiWnDrg9j2Z6sSmpaQ>
    <xmx:HA1naFMW-KVXd6QdOpI24dM7tgub0uxEeHg0OpF3ISMH36Z9h4PLrqdZ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 19:07:07 -0400 (EDT)
Date: Fri, 4 Jul 2025 01:07:05 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 02/11] media: adv7180: Add missing lock in suspend
 callback
Message-ID: <20250703230705.GD3900914@ragnatech.se>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
 <20250703205223.2810806-3-niklas.soderlund+renesas@ragnatech.se>
 <20250703224326.GD3798@pendragon.ideasonboard.com>
 <20250703225139.GC3900914@ragnatech.se>
 <20250703230601.GG16835@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703230601.GG16835@pendragon.ideasonboard.com>

On 2025-07-04 02:06:01 +0300, Laurent Pinchart wrote:
> On Fri, Jul 04, 2025 at 12:51:39AM +0200, Niklas Söderlund wrote:
> > On 2025-07-04 01:43:26 +0300, Laurent Pinchart wrote:
> > > On Thu, Jul 03, 2025 at 10:52:14PM +0200, Niklas Söderlund wrote:
> > > > The adv7180_set_power() utilizes adv7180_write() which in turn requires
> > > > the state mutex to be held, take it before calling adv7180_set_power()
> > > > to avoid tripping a lockdep_assert_held().
> > > > 
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > > >  drivers/media/i2c/adv7180.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> > > > index 2519bc53333c..0c5511a7667d 100644
> > > > --- a/drivers/media/i2c/adv7180.c
> > > > +++ b/drivers/media/i2c/adv7180.c
> > > > @@ -1565,6 +1565,8 @@ static int adv7180_suspend(struct device *dev)
> > > >  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > >  	struct adv7180_state *state = to_state(sd);
> > > >  
> > > > +	guard(mutex)(&state->mutex);
> > > > +
> > > >  	return adv7180_set_power(state, false);
> > > 
> > > Doesn't adv7180_resume() suffer from the same issue ? And how about
> > > adv7180_set_pad_format() ?
> > 
> > They do. But they will be fixed / reworked in later commits in the 
> > series. So it seems a but of churn to add a guard in this commit only to 
> > remove it later ;-)
> 
> It's a small churn :-) It would make the patch less confusing.

Ack, will fix for v2.

> 
> > > >  }
> > > >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

