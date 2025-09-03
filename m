Return-Path: <linux-media+bounces-41710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE88CB423D7
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6F015828A1
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DEC202F70;
	Wed,  3 Sep 2025 14:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bPxC5ePM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D5rJZeau"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA89F1F1921;
	Wed,  3 Sep 2025 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756910147; cv=none; b=W1yMe7/Sg/NCIlaPGJkHR+KvBlfKHTIOOy6QOPPMT/OD6jptStJQyYqmHyYYF3ZRy67WpkUcXdDgiTG4qeQuCuxFjB6NmNB6Bb8Ki5IK1RficPNLXbiAMBH69G4/xLVYHbSIZumDJ/tK5NtxTIRsQOVoDjPSlS77lXw9FYZ4O1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756910147; c=relaxed/simple;
	bh=qh06aM/D1zEAo5SMTFqvDu3eMrZnBJcz0WhukWIuW/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssi6YWc9OhtRe67W2PedlD6yA3CdZ55Pg8fDVW1lEqZK1a6bj9qsYnAFhl9yBYT12075UhpcYIdp0MEjmQ9sjHkGGSpOFcc6k9uDZeYyr9LJ7Wj1hmE2CIdduRpNn+9BR6vp8r0vOErC70smbTFU4p6/DtU6/383ribPOy9jLCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bPxC5ePM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D5rJZeau; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 9756E1D00367;
	Wed,  3 Sep 2025 10:35:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 03 Sep 2025 10:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756910143;
	 x=1756996543; bh=z+hK2FP2aheJNxk80O7ie5ji+zK7A/NzM8F5e45IKzw=; b=
	bPxC5ePMU3fkUzjWf80lKsZVUNoRTiEsBIeNGNF0z7XJtb03qabLd3h3/2xFY1eU
	C7531Ljoh9gP5ejaWj0pkmPJLFOQDun91FEID36TGj5KeJI3ubwJpKuM2e1UHOXu
	4xFl3BE+yZ5Rlo2bocMkprtSngjTTT5UCwLV/3IR/H1H27Z2Yr88FeAv4ZIiEVAp
	RaP2ApOZQw3OoFGuiwZfFvcTWbVzcCwsan3q+pPpPpDqRxeJs0cIVsNnY514HdTQ
	W29fdJgNzQX5pCJb63FxcZSfCRiVt1yeoTqJA6JZ27wd68WcteOHfMrCwDghhBZg
	nJKNhEln8R8PVjqJ39kEkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756910143; x=
	1756996543; bh=z+hK2FP2aheJNxk80O7ie5ji+zK7A/NzM8F5e45IKzw=; b=D
	5rJZeaurQyhkRvWU1V8b+C1uuDqbwStpW2hCEL7nMWjtVeNdajrAk8FizRKkvpTR
	c+rWej8fUVs+tzaKpHLOHB5FO0st4jX6cqDkJpj3Mzh15R0kvANjmRWpMCPhU8Fh
	lgdGPBg4A6vkPNhKeuWUuevF4OWXDdVcb377HRkyhw5FhwDYUjdCoeZV/daytwjs
	z/9u8loStoMkfq+ka0X2e1WJ50EhaD4st2ThpCZTiXV3dO4gfIXAGk1WpBnKSs16
	AVqLc1KVZ+NaZwVpmq25cEcPsIUhWOeoKB3Gq09VCqo+sbUNeaDMDIWykbSk3EW0
	/878LBoJuY5/UrlyDA7oQ==
X-ME-Sender: <xms:P1K4aK2LrB2GrgiokMXjoat6MHqsSC7XPi_8BHo9PhSPY3c_ZgL0Yg>
    <xme:P1K4aA67Jbnlf81XyLU17C8kbsC9VjVMCxZMbrM_EDO5qhlcIy4evb5Lb7mWFVN8n
    I8LQ9T_ZT4gWHHqvLc>
X-ME-Received: <xmr:P1K4aL-YVKJDzWdC65T1TdHlK9LNG4t5fPehe8Re5lIO6eS1gj4AAJmye08UIcIroDTWowKQDPFefCduaJB2qOk6_7Lui_0eFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefgedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffejgfef
    udfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehhvhgvrhhkuhhilhdotghishgtohes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprh
    gtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgv
    rhhkuhhilhesgihsgegrlhhlrdhnlhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntg
    hhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidq
    mhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:P1K4aPX-LgW7IR0kVaysa1-gyRXGKT9INkUONy04PnBrMur8I-L1aA>
    <xmx:P1K4aGqnV3xbgS1JoOxo7NIrF2M3UnOARpi_qySI06vjfH14yH0rSA>
    <xmx:P1K4aBlCAIerOytAOSdcZDcI4kpFeQWX9_K_6VPBUT_iTD84hIH8Ew>
    <xmx:P1K4aG24c8jyOCecCQUlD8APdi9esfedkTO4Q2q2Zgh1ngyXXl7PDQ>
    <xmx:P1K4aNYdOG5ee62GACrOrFUnSAncJ9T97DBV1M34x27ohP75LdqPEHQb>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Sep 2025 10:35:42 -0400 (EDT)
Date: Wed, 3 Sep 2025 16:35:39 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/11] media: adv7180: Improve the control over
 decoder power
Message-ID: <20250903143539.GA1207681@ragnatech.se>
References: <20250828160654.1467762-1-niklas.soderlund+renesas@ragnatech.se>
 <80d191a0-d978-4909-a0f2-d25cd9757d55@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80d191a0-d978-4909-a0f2-d25cd9757d55@kernel.org>

Hi Hans,

Thanks for your review effort!

On 2025-09-03 10:46:11 +0200, Hans Verkuil wrote:
> On 28/08/2025 18:06, Niklas Söderlund wrote:
> > Hello,
> > 
> > This series started as an effort to fix issues with querystd. To do that
> > it turned out the whole drivers design around how it controls the power
> > to the video decoder block inside the chip had to be reworked. As a
> > bonus this works removes the now deprecated .s_power callback from
> > adv7180.
> > 
> > The adv7180 drivers comes from a time before media controller and all
> > operation callbacks are, more or less, designed around the concept that
> > a video device is the only user-space facing API. In that world a vdev
> > would attached the subdevice, call .s_power and then perform format
> > configuration using the other operation callbacks and then start
> > streaming with .s_stream. Needles to say this mode of operation don't
> > work well with media controller where the subdevices itself have a
> > user-space API exposed thru a subdev device.
> > 
> > The initial problem I tried to solve (querystd) was that it stopped
> > functioning as expected after the subdev had been used to stream once
> > (.s_power(1), .s_power(0)). As it turns out different variants of the
> > adv7180 device have different reset beaver for if its video decoder
> > block is left running or powered off. On my device it was left running
> > so querystd functioned the first time, but not after the video decoder
> > had been switched off once by .s_power(0).
> > 
> > I first tried to fix this by introducing proper PM handling in the
> > driver to be able to remove the .s_power callback. I quickly learnt the
> > power on/off logic happening in the driver had noting to do with
> > controlling power to the chip itself, but to control if the chips video
> > decoder block was turned off.
> > 
> > When this block is powered on the device process video data, if there is
> > a video source else it free runs. However when the block is turned off
> > the device can still be configured, in fact some configuration requires
> > it to be off.
> > 
> > For this reason I dropped the effort to add proper PM handling and
> > treated the decoder power as a stream on/off switch. I still think
> > proper PM handling would be beneficial for this driver but to not
> > explode this already large series I left that for another time. Solving
> > the issue around .s_power will make that work easier as well as other
> > task such as converting to the v4l2_subdev active state API.
> > 
> > Patch 1/11 just moves code around to make the consecutive changes easier
> > to read. Patch 2/11 fix a locking issues when suspending the device.
> > Patch 3/11 and 4/11 improves the locking design to prepare to improve
> > the driver.
> > 
> > Patch 5/11 make sure the device controls are always programmed after the
> > device have been reset, fixing a possible issue when the device where
> > resumed from system sleep.
> > 
> > Patches 6/11, 7/11 and 8/11 is the real change where the .s_power
> > callback is reworked to fit the design of .s_stream instead.
> > 
> > And finally patch 9/11, 10/11 and 11/11 removes programming of the
> > device from operation callbacks and solves the issue with querystd.
> > 
> > The work is tested on R-Car M2 together with a ADV7180 device.
> > 
> > See individual patches for changelog.
> 
> This series looks good to me, other than the one typo and the
> control handler kAPI issue, but that can be done in a follow-up
> series.
> 
> If you want I can take this series, let me know.

Thanks for pointing out the improvement in the kAPI, I agree with it.  
But as you point out I can do that in follow up work so I would be happy 
if you would take this series. Can you correct the typo while applying, 
or would you prefer I send an undated series?

> 
> Regards,
> 
> 	Hans
> 
> > 
> > Niklas Söderlund (11):
> >   media: adv7180: Move adv7180_set_power() and init_device()
> >   media: adv7180: Add missing lock in suspend callback
> >   media: adv7180: Move state mutex handling outside init_device()
> >   media: adv7180: Use v4l2-ctrls core to handle s_ctrl locking
> >   media: adv7180: Setup controls every time the device is reset
> >   media: adv7180: Power down decoder when configuring the device
> >   media: adv7180: Split device initialization and reset
> >   media: adv7180: Remove the s_power callback
> >   media: adv7180: Do not write format to device in set_fmt
> >   media: adv7180: Only validate format in s_std
> >   media: adv7180: Only validate format in querystd
> > 
> >  drivers/media/i2c/adv7180.c | 338 +++++++++++++++++++-----------------
> >  1 file changed, 174 insertions(+), 164 deletions(-)
> > 
> 

-- 
Kind Regards,
Niklas Söderlund

