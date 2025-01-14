Return-Path: <linux-media+bounces-24728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D575A10F83
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 19:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 981B01884300
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 18:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E29207E0B;
	Tue, 14 Jan 2025 18:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mpXreZso"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D855149C57
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 18:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736877996; cv=none; b=nMMzyKMkyYz3GPm295Vi+eOYj2vT87op2rPmz5jeIXASempM110DFFEub0sJ4CCGQksSEYnHToY/fmXPHZoeBljiPKnjdgfirD/7tfcXup1k3k1yQN+DFJQQgAK1kH1LPn2g1aFSwTVOV56eZhhOb3+GF9e/k+Eh0ZT0YW83ZfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736877996; c=relaxed/simple;
	bh=oFA8Bte+/jkQD4brfivY+yKWgoulQtg3uxnEcPGJLKE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sNTeQ3rFUjnt1iWJ528pJPONWqSCW3xvPmQryOeOTMm+Nnn9r+oWEJYC4aLY257Jl4NcmaWdVIVjVp3UyaySwsstLsTcH9drEVZ7sE9M3/ppqtHIQeM9Ml7pZOAlcp3Z0zdKCKwK1dZTEiKjXYMzAEm9/j6BNPtFLyXKHcvsxRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mpXreZso; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736877992;
	bh=oFA8Bte+/jkQD4brfivY+yKWgoulQtg3uxnEcPGJLKE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mpXreZsoGMtPSap3oWeDYHu4UwM9I17f7SylVlA/C5f/R1wh/G710tOXFzBa0Y4rZ
	 j9Q1B1xQQ9e9Gm3DvjOXeknN6uyw428ZKY0Iel5/YI/N4nB7np3ScnPuaXnNnMM6FQ
	 yMckQPjyvpPdr7ZpAQjHQZDU7taglV3bKjWzWgFEvdvqb7ymTGtEju1R5wAXDFqje8
	 6p5QucjcXwroY2ENzqa3qDZDRapml45qwmmKflX8/UhiwZj3AWGeGv5NhThwEWRDJ3
	 depWfFyFT/NrEPpiEaoy2BQ6yMyJDYKawr/ZcFgyXYX2qlva8DaNct0FkQ9V/U0v8+
	 oA0+dhEZRa+Ug==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B194717E0E1C;
	Tue, 14 Jan 2025 19:06:30 +0100 (CET)
Message-ID: <eabac7fa115cd9334fef3d3a41cb0a855f3ae542.camel@collabora.com>
Subject: Re: Hantro H1 Encoding Upstreaming
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Daniel Almeida
	 <dwlsalmeida@gmail.com>, Adam Ford <aford173@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	ming.qian@oss.nxp.com, linux-media <linux-media@vger.kernel.org>, 
	linux-imx@nxmp.com, paulk@sys-base.io, Benjamin Gaignard
	 <benjamin.gaignard@collabora.com>, Gustavo Padovan <gus@collabora.com>
Date: Tue, 14 Jan 2025 13:06:29 -0500
In-Reply-To: <51173416-c185-47a8-b342-04d4ba2c3625@gmail.com>
References: 
	<CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
	 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
	 <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
	 <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
	 <A3476357-8D8D-4B82-8CAB-58370BECF575@gmail.com>
	 <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
	 <51173416-c185-47a8-b342-04d4ba2c3625@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrzej,

Le mardi 14 janvier 2025 à 19:01 +0100, Andrzej Pietrasiewicz a écrit :
> Hi,
> 
> 
> W dniu 14.01.2025 o 17:16, Nicolas Dufresne pisze:
> > Hi everyone,
> > 
> > despite Andrzej having left the community, we are not giving up on the encoder
> > work. In 2025, we aim at working more seriously on the V4L2 spec, as just
> 
> I'm glad you continue working on that. Can you define the "community" here?

Apologies if I have assumed, you had no interaction over Linux Media mailing
list since your departure from Collabora. It felt like you were not following
the list and not going to interact with Linux Media community anymore. Feel free
to adjust this statement and let us know if you'd like to follow-up on
something.

regards,
Nicolas

> 
> Regards,
> 
> Andrzej
> 
> > writing driver won't cut it. Each class of codecs needs a general workflow spec
> > similar to what we have already for stateful encoder/decoder and stateless
> > decoder.
> > 
> > - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-decoder.html
> > - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html
> > - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-stateless-decoder.html
> > 
> > It is on top of this, that for each codec we have to add controls (mostly
> > compound) specifics and details that suites stateless accelerators.
> > 
> >  From a community stand point, the most important focus is to write and agree on
> > spec and controls. Once we have that, vendors will be able to slowly move away
> > from their custom solution, and compete on actual hardware rather then
> > integration.
> > 
> > It is also time to start looking toward the future, since Hantro H1 is very
> > limited and ancient encoder. On same brand, if someone could work on VC8000E
> > shipped on IMX8M Plus, or Rockchip codecs, that will certainly help progress. We
> > can also get inspiration from many other stateless encoding APIs now, notably
> > VA, DXVA and Vulkan Video.
> > 
> > Of course, folks likes to know when this will happen, stateless decoders took 5
> > years from start to the first codec being merged, hopefully we don't beat that
> > record. I personally aim for producing work during the summer, and mostly focus
> > on the spec. Its obvious for me that testing on H1 with a GStreamer
> > implementation is the most productive, though I have strong interest in having
> > an ecosystem of drivers. A second userspace implementation, perhaps ffmpeg ?,
> > could also be useful.
> > 
> > If you'd like to take a bite, this is a good thread to discuss forward. Until
> > the summer, I planned to reach to Paul, who made this great presentation [1] at
> > FOSDEM last year and start moving the RFC into using these ideas. One of the
> > biggest discussion is rate control, it is clear to me that modern HW integrated
> > RC offloading, though some HW specific knobs or even firmware offloading, and
> > this is what Paul has been putting some thought into.
> > 
> > If decoders have progressed so much in quality in the last few years, it is
> > mostly before we have better ways to test them. It is also needed to start
> > thinking how do we want to test our encoders. The stateful scene is not all
> > green, with a very organic groth and difficult to unify set of encoders. And we
> > have no metric of how good or bad they are either.
> > 
> > regards,
> > Nicolas
> > 
> > Le lundi 13 janvier 2025 à 18:08 -0300, Daniel Almeida a écrit :
> > > +cc Nicolas
> > > 
> > > 
> > > Hey Adam,
> > > 
> > > 
> > > > 
> > > > Daniel,
> > > > 
> > > > Do you know if anyone will be picking up the H1 encoder?
> > > > 
> > > > adam
> > > > > 
> > > > > — Daniel
> > > > > 
> > > > 
> > > 
> > > I think my colleague Nicolas is the best person to answer this.
> > > 
> > > — Daniel
> > 
> 


