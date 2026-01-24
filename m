Return-Path: <linux-media+bounces-51466-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL9WF9widWmyBAEAu9opvQ
	(envelope-from <linux-media+bounces-51466-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 20:51:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6667EC5D
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 20:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FAB230131E6
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 19:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8A5273D81;
	Sat, 24 Jan 2026 19:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Mc5IaiFO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rtTwXzXm"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2001400C;
	Sat, 24 Jan 2026 19:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769284293; cv=none; b=heonaTdqGBw22WiqeWp/wO7n4GEDlLmHVxgTjGSXu5MPd6DjdK3hitgBWWA7Cmg7E8LHL4P4T6ICFF0HAiBJ4KIxMaqAxenWzQRESMYAXYnkPzW9xHCex+lT59qfLT2ek6KhoFN/3yg4nK43SFlbqbr2Z+PaIdU0N3/7j9U+6hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769284293; c=relaxed/simple;
	bh=udc+SHMyguO389QZh/03errhFY5S4Rf/Pqx60x0N528=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBrh+pWvnMSJXJa7vf9T3d8719yozPSKK2L6cYZhB/b4f75v4/Vfz2GyG4TIsRvdeGpT0k1A20yYhiSkD2J5KQZymdd/OZcd5c+QPypY7PEgJt8NVoubDzjYYxzoABB/OGqLxMjBpcVYUxNoCLLiWFWXo5jdgjCjqlPjaSXlRS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Mc5IaiFO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rtTwXzXm; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 205D97A009F;
	Sat, 24 Jan 2026 14:51:31 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 24 Jan 2026 14:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1769284290;
	 x=1769370690; bh=1j1+jvHqM1iGXwq62AkzB7H8vp5SXsYHU3lMOmyoEgo=; b=
	Mc5IaiFOKCcECqzcg73QCAMQFrcI4YcLwWLcJzchS2xCuIor2ZW4DfD+w/jCJipj
	WIjC614ydbiGVj3QVgcA1HcSdXf3C/LbjHn09HgS5vLvh8F5JwCAQRw/9kAXk0Z1
	KQ20D3vXrSvrnHx0laR+eISAKlFAgi3m+niARKBITr7RJAb3zK5HQRpco/CyybXU
	s8dF0VvyvX7jvi4lsIi9sSXD/FIaD6H1UGZcG3n19gVYG5bDg2nfdjrOC4TtVuMw
	Lh2ItAfgHjcJ0AQz279sdirJ7U7gR+YGuSq50QUPuynuc2nUHnI1mc+uOtG0IzIz
	xEyJC877Ewmo/gB2aCuGYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769284290; x=
	1769370690; bh=1j1+jvHqM1iGXwq62AkzB7H8vp5SXsYHU3lMOmyoEgo=; b=r
	tTwXzXml1D4wOvpqjbRTf6Sa2A+Wo2r8mmClRyVR79Sh8w2rG56c+YiapKFVguiH
	EeuLvalbhzPifSj9zAHIW+tg0k73wQatVKEJQO+LiqwuZAWsVtCH7gxC2ygLvjNK
	U8SJilEyYs2S/lbZ8auiV9h5Q8XqPYnmdJ1Zgh2QF6CIPVuMqGlRlbyuG5XwS8d/
	jnH/h8+b/KKpR2NTMC5XpibSctwtMUD1l6HMBqBIrdTxHb/N29BPRmBmmxuis3Gc
	G1chViCkARadhe++0ccRWYC+7zoafmZld5VupBL2ENer0CEC3twWzp4sIFpFI9zi
	Pn7A8xlykbwNyNbzrztDA==
X-ME-Sender: <xms:wiJ1acZPqGKjtpiQ4Lq-8kFvAhVzW0hww7S1fLAM6QNqWm-v6qcC1Q>
    <xme:wiJ1adZS4FD7joTkac-es4gMbAzZAz5Fgjqy0bhcl41NTWiZ6BMygcbjettbL33Qm
    GwzQ4BeJCEe-PVrJG9emhAtFKudZYDiwiRyod6HD6HusZGlDu-gIg>
X-ME-Received: <xmr:wiJ1aRzy936Xdxcc6SGJ_NxrL2B1Up5DosWGbREb9ptHJTt4TCPSBB9-fRD_bnKWPRmjL8WGEnnLOnSulb0eY1EGUwmyJrs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduhedvkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpefftdegfeevfefguedtveevlefgleek
    uedvfeeggfefheefieejhedulefhjeekgfenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhmihdrvhgrlhhk
    vghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpth
    htohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdo
    rhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmh
    hmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehkihgvrhgrnhdrsghinh
    hghhgrmhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthht
    oheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:wiJ1aZdOWQ8C7B1im2MST8hgpYyUIiCdzonOXD0yQqEHb0mvL3hBiQ>
    <xmx:wiJ1aW7iULTBgZp6Zmw_1CIgRjsDsCfJ5QLD-CUlaLahA6o4ovASfA>
    <xmx:wiJ1aeLCv_W3QTZGYqJOTXrnHLNvX_AgzwArxChySIbe0p4tDAtkxQ>
    <xmx:wiJ1aexJY4dd1DsvhM1sX8CbBm2tS3GWbKp0_KS9QLgcxuzUat3lVg>
    <xmx:wiJ1acUBu_XYDd490Wxw5CEC9VyYsmEcXVaiRsqCKz-cwb-68QwEW2am>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 Jan 2026 14:51:30 -0500 (EST)
Date: Sat, 24 Jan 2026 20:51:29 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 0/5] media: rcar: Streams support preparation
Message-ID: <20260124195129.GC3395783@ragnatech.se>
References: <20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,ideasonboard.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51466-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,ideasonboard.com:email,messagingengine.com:dkim]
X-Rspamd-Queue-Id: EF6667EC5D
X-Rspamd-Action: no action

Hello Tomi,

On 2026-01-15 12:06:56 +0200, Tomi Valkeinen wrote:
> This series is a subset of the Renesas streams series, sent as a
> separate series per Niklas' request:

Thanks for splitting this out to it's own series. Lets hope we can 
progress faster getting streams in by doing it in smaller series.

> 
> https://lore.kernel.org/all/20251216-rcar-streams-v4-0-f28b4831cc67%40ideasonboard.com/
> 
> This subset contains the (hopefully) easy ones that can be merged
> already.
> 
> These patches should not change the driver's behavior.

I think they look good! I have tested the result on Gen3 (M3N) and Gen4 
(V4H) and noticed no regressions. For the whole series,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
>  Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> Tomi Valkeinen (5):
>       media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC
>       media: rcar-csi2: Improve FLD_FLD_EN macros
>       media: rcar-csi2: Move rcsi2_calc_mbps()
>       media: rcar-csi2: Simplify rcsi2_calc_mbps()
>       media: rcar-csi2: Optimize rcsi2_calc_mbps()
> 
>  drivers/media/platform/renesas/rcar-csi2.c      | 116 +++++++++++++-----------
>  drivers/media/platform/renesas/rcar-isp/csisp.c |  13 +--
>  2 files changed, 67 insertions(+), 62 deletions(-)
> ---
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> change-id: 20260115-rcar-streams-prep-1-1cc285538848
> 
> Best regards,
> -- 
> Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 

-- 
Kind Regards,
Niklas Söderlund

