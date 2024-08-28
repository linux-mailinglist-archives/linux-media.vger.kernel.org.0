Return-Path: <linux-media+bounces-16999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 029F6962437
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B3AD1F2419B
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 10:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923A716B3BD;
	Wed, 28 Aug 2024 10:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="H/eYA8a2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gC0rr+y4"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DC416B397;
	Wed, 28 Aug 2024 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724839268; cv=none; b=WmyLi8dEquVvesdjb2Sfxuv+6RGjUU/tKz59IJ8uK9awakxMpockvgZ/5BqzM/o4iTzQlG+T+vG9wQjMWNm0Tq/lV+2MulEW2Mf8k6NcGMwhNh+KV9Ojf7TR0jSvpMx6d2bSBbiRx5dMu0lRa/V/OWOb35KdZO2Oue/2ECWef/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724839268; c=relaxed/simple;
	bh=8fdA/oV0dJqjR2rGwVBFlurrqI58vxGheATP1fSUlpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyESDmXsV22/P6Lr8HBNm/Wn9L1V8PSMzYuTjBR5e9KPRnR6W2bfehfZk9qnjT2bryCsuIrsYTZykOeJ/1Oxf3VXDckeeCmIIYA/HM1Qza73pDQd+HH0sQ1Wxk9ZzLBg5H1FjLVViv1CnC/EBTrqzF+wcGSUNjFF4x0geKZkEfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=H/eYA8a2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gC0rr+y4; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal [10.202.2.42])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 8D9FA1151C30;
	Wed, 28 Aug 2024 06:01:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 28 Aug 2024 06:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724839263;
	 x=1724925663; bh=NBqnZzi1F+okywetM/SrREQCf28mzsMEj909ko5upYQ=; b=
	H/eYA8a2Mf+GjWEtGSkA3+Ti0iybHTtrVLOtoycORNcib3lFFLTa5K/3ZMRpmeyD
	eP+p8wftjyGfUWemuh6aIuJyI+/vbbkYLPj0E+yvIUAhgLg+G+YTjXe5VHe75ttg
	qROiRfacfGveoMUyNcy6BD/qy3g/GO/QKyWCiq3zyuKXwahFilpAQuF6YPIrK9eu
	G0xVq/onrfS7YhV3p1Ux4YRumJ3GwwqrtxdUfZUHAKKKWRdDwsAAv3wPyKR4jP1z
	V4tOnmi/5lIOBAHPPfdKUZZMCSrOO7J4cYAu5nu5pQ2oLEE63dyidGIDqTN6PXTT
	L8hbssHd1kmNDCf10CRFFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724839263; x=
	1724925663; bh=NBqnZzi1F+okywetM/SrREQCf28mzsMEj909ko5upYQ=; b=g
	C0rr+y46nC8gFuy0U6JzBd2nZys9bq2101ex0IOMgU2E2FK05ftXTSL26XGW4zmm
	pZvvPkVW9pYxiHk3cySjvcykqvk/HmrW3qytVt6QxG+lbRPomY0PzKFzY7mTAcDq
	L8aWcua7knYaRB9aWt9mdB/vzKJAd7Z0puwso9nGG5UmOFSr/XoUqbP5udkktXPg
	0vyswtWTKpCx0q3P7/0n5B3/O1BGeZzzxkdIIWAQhstK7KKOvT7eq/mT4jKLe5QA
	pLN0vHRaLbNSsYcTZb0Dl8Aog2TlvEBI+Qhjxi8/aJz/co49ZBGkLA4V30yAH/E9
	/iDUTI3VnaKvOQcWzrZYg==
X-ME-Sender: <xms:X_XOZi7Jt07r330jUaEmWCedZCjFMwuOj8t8XNciUzpgt-Rx8i31aQ>
    <xme:X_XOZr4YXkXVr5cnMK0SBRw4t7LOjNqdzlATTNiiHRCsz7Hhajmocs2TMcl_cAhWu
    qB7nK0jw2EV6g-geBI>
X-ME-Received: <xmr:X_XOZheV0507dudNSiEvl2GYEa22YhNbp7c84IlorLSxJaXVJLV-kvwqQP09Aq9AcVbZCe24DAq71ACX28Pe5oILtE_qV7ULbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefvddgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeffkefgudekgefhhfejtedviedtgeetieekffeiudfhgeevteejvedtffdvke
    fftdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguod
    hrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddtpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehjuhhlihgvnhdrmhgrshhsohhtsegtoh
    hllhgrsghorhgrrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrh
    iikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrth
    hiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlihhsthhsrdhl
    ihhnuhigrdguvghv
X-ME-Proxy: <xmx:X_XOZvKQIPPZdDMAZPtS2LPhke_CQA92kO4wvRh9uSH4s2gVaV8FoQ>
    <xmx:X_XOZmLncn6GdAvgEBp-VCDbj9nmTfKXCE_-ZLOrtbLRTupwF16yCA>
    <xmx:X_XOZgwtDd7PUXBeKmxpqZ8LUyWTBVYW101Pb6IkOqs1hF9r1w9p7w>
    <xmx:X_XOZqKHwsMrDegHq_EjpabzhH2Drfvi97jmS_vTSrulCvsjIAKeIA>
    <xmx:X_XOZjAWyikZtdo0410Twb6k1oADGHx4sv1uwnm6WO6ELaDb81zMlNEz>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Aug 2024 06:01:02 -0400 (EDT)
Date: Wed, 28 Aug 2024 12:00:59 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
Message-ID: <20240828100059.GJ2636928@fsdn.se>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
 <d3bb906b-9182-4b3a-b8d7-f54de4a4893d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3bb906b-9182-4b3a-b8d7-f54de4a4893d@collabora.com>

Hi Julien,

On 2024-08-28 11:41:51 +0200, Julien Massot wrote:
> Hi Niklas,
> 
> On 8/27/24 3:18 PM, Niklas Söderlund wrote:
> > The MAX96724 is almost identical to the MAX96712 and can be supported by
> > the same driver, add support for it.
> > 
> > For the staging driver which only supports patter generation the big
> > difference is that the datasheet (rev 4) for MAX96724 do not describe
> > the DEBUG_EXTRA register, which is at offset 0x0009 on MAX96712. It's
> > not clear if this register is removed or moved to a different offset.
> > What is known is writing to register 0x0009 have no effect on MAX96724.
> > 
> > This makes it impossible to increase the test pattern clock frequency
> > from 25 MHz to 75Mhz on MAX96724. To be able to get a stable test
> > pattern the DPLL frequency have to be increase instead to compensate for
> > this. The frequency selected is found by experimentation as the MAX96724
> > datasheet is much sparser then what's available for MAX96712.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v1
> > - Group in series together with binding.
> > ---
> >   drivers/staging/media/max96712/max96712.c | 26 ++++++++++++++++++-----
> >   1 file changed, 21 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> > index 6bdbccbee05a..6bd02276c413 100644
> > --- a/drivers/staging/media/max96712/max96712.c
> > +++ b/drivers/staging/media/max96712/max96712.c
> > @@ -17,8 +17,10 @@
> >   #include <media/v4l2-subdev.h>
> >   #define MAX96712_ID 0x20
> > +#define MAX96724_ID 0xA7
> I sent some comments on the first serie about the device revision register.
> 
> https://patchwork.kernel.org/project/linux-media/patch/20240527133410.1690169-1-niklas.soderlund+renesas@ragnatech.se/
> 
> Can you fix them in your next patch version ?

Thanks for pointing that out. I missed them as they where in a reply 
where we where discussing the Debug Extra register, my bad will fix.

> 
> Regards,
> -- 
> Julien

-- 
Kind Regards,
Niklas Söderlund

