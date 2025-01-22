Return-Path: <linux-media+bounces-25112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F41F4A18E33
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 10:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D9AD16B8CD
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 09:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232D320FAAB;
	Wed, 22 Jan 2025 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VfxmbDgs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="v5mhfF8Y"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB117C220;
	Wed, 22 Jan 2025 09:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737537695; cv=none; b=bdEQb+lNna7u3Ikmpf1XrgyMMGlj8xKTchpV1s5VBx1X4DggrwjPV8UJa4I2lVxtIhiG0TUdC4I1+pasChwuunIgsutO4Ld6ibMiXizCvz/+igfcuQr1o/pidK0SEDFXUri9bNerop4LIKwIKoGqGfS3XZbLExn0kXisfHOivGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737537695; c=relaxed/simple;
	bh=ozWJCN1uoYVZqjJXEPWnGZ5tZMU83lypa4rlWSuUeP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGx9c/evNsYCpWvtFRTHMmOzSUGB3+J3HcZlIdqgKN1MZnPybMdBx7ZXg8JA5kJxEIp5ls3qz1WmM4vTXKKfIzxlc09o7jjrYQVf0rUhftta9hZa2+ZgrG5EZXOloAixWcpDHILGNYAnyZvbdQoO0IpmWV9cbuSBILPo7Rku1XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VfxmbDgs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=v5mhfF8Y; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CD80425401C6;
	Wed, 22 Jan 2025 04:21:31 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 22 Jan 2025 04:21:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737537691;
	 x=1737624091; bh=5ZDFhUFtU/VhN4MQ2FPwBfXLjAGGiS3SNLoYmIme9Ac=; b=
	VfxmbDgseLvhZIi9CESW0KlH6woZBSki6dK1+w12CD9kY173nnYUm6iL+1OWpTwH
	sQ3uNKTTaS+ftx2ESnS/j5mmFuuIBkGhmmRVjCv9qlWKnwtyvykNHroRP976oT69
	mCk0ocHS2rIj6e3byGVDXga2XG7CxdKaLial/j0irCBP2EyrnpoCq+9yZss56d9V
	NJskc3kPNc+VFbuQsT2ltk9qPJBCdd9WkKEpQI5Bjm2rBrx6y6zGp3E0OaLlRHWG
	gCZqjBxF1KDlt8k4mxrCiU9plhQhT6TNJGLXvoLQxIvWTeKeitKjMgzfqWAnURNt
	iJWEv2dEgw6iUXPTcJkOKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737537691; x=
	1737624091; bh=5ZDFhUFtU/VhN4MQ2FPwBfXLjAGGiS3SNLoYmIme9Ac=; b=v
	5mhfF8YZM9U2dQ8gOd5lIaRIxS+KkrT1Iszds1MF+TVLYWoCY+W3VB8iH9DOoKuF
	pehEpiZfQdaIKwF6x9yTTaAs7phYr2niQCtLpUpp3zVK8hlWaYuClF+6fvaVqN0t
	CAzdLEDO3xaCz7btHl+Slt6Iy6EWzNvip4b8QdeKhMXG6ddBVeX3z58ehYz9mpG9
	0lbwHzRuedXld77gw0zPnHLUVjrf0OTNw2HdASD7wAsZEcmBeQpHNqEFsznzx8Ci
	s688JZmeoxn+MtlbZB1RYd0vYO1m7cl7SRkklNMnHpPeCHJUaT9EFhh2BcLDmHjV
	v11HppFfS7uKP1rJ1P6hA==
X-ME-Sender: <xms:m7iQZzEmt2gW5PSQUWzyMv07l4MDbFQPqlcWQgqmXw2_oipwFX-U4A>
    <xme:m7iQZwVlbR3ZDdwiWMAVbm8ojR9qCPoweImpLR6hUxPPCeV6VfGa6OrW__f8OrNrA
    gENcEhCjPWZQITROYs>
X-ME-Received: <xmr:m7iQZ1LZUj6YGsIMQuFr-UaG2BYRBUxgGV8BJ3Jxu7hJ381cyBynDIc-5O48JtbkqgveNtaDRGJi8JDBaBY1pq24t_YCdEMKvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedguddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvg
    hhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrsh
    dqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:m7iQZxGgAbG4zJEi_CaDtzjfvcj7Ugk9UHTJwP4SiImzOPhaK28FAg>
    <xmx:m7iQZ5UxcF3e08_3yCGY5yLbphAaN4Qv-reWuUM3u2rPMdaX-g1D0Q>
    <xmx:m7iQZ8OWkwFQfwOv5IVqBGHat6WfbLKNYrUlxe8qdlN5_TL7cZhfTw>
    <xmx:m7iQZ430q83G4GHwNMV4EsOjjqOAPqEL62T38EDzruSKoRpJzzRqFA>
    <xmx:m7iQZ3fkrOifxsJzuzi6OKCh_Wmpf3HMan05v9FHqTcZ-dzovj10witA>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jan 2025 04:21:30 -0500 (EST)
Date: Wed, 22 Jan 2025 10:21:28 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] media: rcar: Minor cleanups and improvements
Message-ID: <20250122092128.GB3436806@ragnatech.se>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
 <20250121212448.GA3302176@ragnatech.se>
 <a0e38115-87c7-4145-b9d0-fb8f8ea1fcf7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0e38115-87c7-4145-b9d0-fb8f8ea1fcf7@ideasonboard.com>

On 2025-01-22 10:02:59 +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 21/01/2025 23:24, Niklas Söderlund wrote:
> > Hi Tomi,
> > 
> > Thanks for a great cleanup series!
> > 
> > On 2025-01-20 15:10:33 +0200, Tomi Valkeinen wrote:
> > > I've started looking at multi-stream support, and came up with these
> > > while working towards streams.
> > > 
> > >   Tomi
> > > 
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > 
> > I have tested this in Gen2, Gen3 and Gen4 without noticing any
> > regressions. The log is now spammed with the helpful suggestion that the
> > CSI-2 TX subdevices shall implement V4L2_CID_LINK_FREQ control. This is
> > annoying but out of scope for this series, but would be nice at some
> > point.
> > 
> >    [   37.421531] v4l2_get_link_freq: Link frequency estimated using pixel rate: result might be inaccurate
> >    [   37.430991] v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver
> 
> Which drivers need fixing? The staging max96712 is one (there seems to be a
> TODO there about it), and adv748x? I'm not going to work on that right now,
> but just collecting the details.

Indeed adv748x is the other driver needing work here. The problem as I 
recall it is that V4L2_CID_LINK_FREQ is a menu control, and adv748x 
selects it link freq based on what it is outputting. But it's been some 
time since I looked at this, maybe I recall incorrectly.

> 
> > For the whole series,
> > 
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks!
> 
>  Tomi
> 

-- 
Kind Regards,
Niklas Söderlund

