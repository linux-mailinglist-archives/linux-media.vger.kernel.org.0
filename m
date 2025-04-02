Return-Path: <linux-media+bounces-29218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B87A78CDE
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 13:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2F701892C00
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 11:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB444236426;
	Wed,  2 Apr 2025 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="agl/j0a1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sRbaoxXk"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C093235C04;
	Wed,  2 Apr 2025 11:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743592101; cv=none; b=mncpQfGBEVySuRHlzKHYa+wus4u1BEnNzWp1zxFxmul9hKmpTEt28mqRoqriMnzeJh7gXntjvKK2t+A+Eu1va9knn4B5r+hfpSWmkEOU0I4RR8Tqeo57udAfvY6nXMnl9kl6dYqNMtKt/LBBUnPa6w18hZF/2coCwDqh4yDnwNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743592101; c=relaxed/simple;
	bh=HKfqbVXkrqYoDADqnzSr4ZoCUQ7AeIQ08aqyNWM3eE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mwado4g5824H/QV/D5poYIhWtRge70yxHiRBEpgwLleKSWeh44M9L6LdFlu6Z5Cnd3iG2ByLpwKpXrhQy+HF131KcqmxhVTp27PD2qTzdZE4KhHT0UbKdVNK08fwwyNGLO/DAzA84rbOuC523sbaZpWJgxlVXrgt32aHS5ztaus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=agl/j0a1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sRbaoxXk; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 91CDE13801AB;
	Wed,  2 Apr 2025 07:08:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 02 Apr 2025 07:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743592097;
	 x=1743678497; bh=Ouf7WtrjWGpMzdCGZJ9lrBNMXEzOzFrgjJ9gLCYWvEA=; b=
	agl/j0a1PX/lCSGQVcAtkE3CU2HpBZCM0iKwNQWyF+1L7Gd0I/wp963Ph9Sj8TSm
	LOdupGTBcitQMqlISNSiaQo2bhfTKnmehABE9Rr2HbHpA3qBTTDJ4N34P5Qwk0Gs
	cZG+RGJDLOkhzX5xmEfMKEshehFd2QEePnPcrDo27fOvoxSH5XHOm6fpwxa0YDGd
	c44q/HaAxlJ2LoJQE2ntxbKRtiwqsp0F5mSrTF4JtT3U048xHjk4Zx+VxsKGzVZ9
	idxucO4m3AbKbD90/r15LCXvhQ4yvKapkrzGsrmixXbuf7inFnmHm7+YB0sfo53E
	w8igjSW8FrA+VJMp0Ro2vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743592097; x=
	1743678497; bh=Ouf7WtrjWGpMzdCGZJ9lrBNMXEzOzFrgjJ9gLCYWvEA=; b=s
	RbaoxXkJVSDQs6/nIMJ4doPhufK9idHyP93bYu561GHnEnC5rFD22zkIuR+d5Dw2
	BWd81piggUR8cj4XcVEGSGaMr5jTURn5eH01W0PRCL8EaLpJwWezsw4kYQQgdeky
	tRBCGeOEmz4DLWP8A9epFN1G+6m6Gi4OlrtBf40Q0f3VeFXgIstCcCjBAQl7S+bo
	1Q12SboN7wCMdCfIZcM5h4C8gEtEwAThpjH6qhiKMspb8QlZ1QovERL9qX4+QVtD
	Vz+Ud2IoKopHRvfv5JDIN3h3ohnIQwcyiNwBF6VR262VZk6z2ooYkJK11XjG+kWD
	O7ufIWl3q73+DqCDw2RPg==
X-ME-Sender: <xms:oRrtZ-BGAIhNRql5CY9yJ2CESQpZrL1MHWTfTlD7RH7EaH_KkgC3WA>
    <xme:oRrtZ4iJQQYWqN1nv7CsJ5MIE5b0MhoMMlWqx2MlRz3L1D0WSFE63J4pjxdD7Hwro
    ua2hneR6IKkWtTdcdU>
X-ME-Received: <xmr:oRrtZxkXODxgY1UHTHGNNREJ0wFiLY0IlOUfnmrMg44qYDGdbZEEWoolf0X41BGGtRsml_fvesnBalkl2jdr1KkpZ6xr_Vc8hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeffkefgudekgefhhfejtedviedtgeetieekffeiudfhgeevteejvedtff
    dvkefftdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunh
    guodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepudeg
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepuggrvhgvrdhsthgvvhgvnhhsohhnsehrrghsphgsvghrrhihphhi
    rdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnh
    gvlhesphgvnhhguhhtrhhonhhigidruggv
X-ME-Proxy: <xmx:oRrtZ8y3kUaXm0J2e1u7JVHomKOZgwGjGct5edbOSJSHR7_XdZrTew>
    <xmx:oRrtZzROgItPEYMjOBd7KEdvasLCTFz7FBx-bRgkxswhNjGobMg8sw>
    <xmx:oRrtZ3agulw1u2vS2FGukfvGEQi7tYjhgWfUf5b018PzmgbMX9Ef4g>
    <xmx:oRrtZ8TnBdsQ7G9fqyv-f0f7Pf7l3tMQR5syr3XM5z-LwfHjTNM3fw>
    <xmx:oRrtZ4hP1ZBn4lJen8jpkS_B64EscbPQshQnu1XLeWcSgYJw7QvQ-O0Z>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Apr 2025 07:08:16 -0400 (EDT)
Date: Wed, 2 Apr 2025 13:08:15 +0200
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
Message-ID: <20250402110815.GM1240431@ragnatech.se>
References: <20250401145759.3253736-1-niklas.soderlund+renesas@ragnatech.se>
 <20250402-real-enthusiastic-ostrich-dcc243@krzk-bin>
 <20250402095749.GJ1240431@ragnatech.se>
 <32d36aba-9d7c-45f7-ab04-cb28ef31d159@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32d36aba-9d7c-45f7-ab04-cb28ef31d159@kernel.org>

On 2025-04-02 12:29:17 +0200, Krzysztof Kozlowski wrote:
> On 02/04/2025 11:57, Niklas Söderlund wrote:
> >>
> >>> Support four-lane operation") the driver errored out if not 2 lanes
> >>> where used, and after it if not 2 or 4 lanes where used.
> >>
> >> Then... fix the driver?
> >>
> >> This property describes hardware, not driver. Why current driver
> >> implementation, e.g. 1 year ago or now, would change the hardware (so
> >> the bindings)?
> > 
> > I agree, I thought that here we have a case where the bindings predate 
> > the standardisation. The driver do not match the bindings, in fact it 
> > breaks if the imx219 specific instructions are followed. So the risk of 
> > breaking stuff is likely low. And this was an opportunity to align the 
> > imx219 with video-interfaces.yaml.
> 
> I am sorry, but what breaks exactly?
> 
> Is the device supporting two and four lanes setups? If yes, then the
> binding is correct.

I understand that is the most correct reading, this should likely have 
been posted as an RFC.

The commit message states this was an attempt to see if it was possible 
to align the imx219 binding with the standard binding. The rational 
being that the imx219 bindings where created before we had common 
bindings for this and that the driver never worked with the imx219 
version of the standard bindings so likely there would be no users of 
it. Kind of like how similar bindings where rejected for IMX708 [1].

I will drop this patch, it was only a drive-by thing as I had to spend 
time fighting this when trying to use the device.

1.  https://lore.kernel.org/linux-media/949e3330-8c3d-6106-fbf8-cab820801cfc@kernel.org/

-- 
Kind Regards,
Niklas Söderlund

