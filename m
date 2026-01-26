Return-Path: <linux-media+bounces-51589-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Fs+D7PDd2nckgEAu9opvQ
	(envelope-from <linux-media+bounces-51589-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 20:42:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 941078CB28
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 20:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1CEC3033F9F
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 19:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2FB2868A9;
	Mon, 26 Jan 2026 19:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="BxCiu/QJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uNEfCxao"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA8283FE2;
	Mon, 26 Jan 2026 19:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769456375; cv=none; b=K7GlRMAm9IZ6ucNdUnkja+hhWYGlDsFWRsVEZwFCHQW6ynEGWOQ/8nWVHoGqeFoVVjSDYTnKT2bcfBYsupZceLCRb8YwDtRTHhJR7eZfCU4bItauLN9+SJmxeHwoH4GbKaeQSRHE/aZCqsc8cPXy2x83SOlBBSYBMEPKqj7w8mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769456375; c=relaxed/simple;
	bh=nYYL8O9zQPabbyC6Vgp2CslTQEc9YVsXAoqFYnuzC6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ushoq3+VnCr2DpMHlpO31qGz7eibQVaq+nY6IQ0/EALJsvSsrBuq9qTXZea3Ia8qGff6WBI8qeLhoDMoxMWftzucvG+Bz/FF+QNiu3q1A7XWG7rRn7VGJM88ojZdyafba0dUA4Rd8Ixxq7QyyjRKpcV57pmVcWNu07/GEi0nEFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=BxCiu/QJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uNEfCxao; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id D0E4F1D000B8;
	Mon, 26 Jan 2026 14:39:32 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 26 Jan 2026 14:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1769456372;
	 x=1769542772; bh=ApT/fwFNRvGjeYzf4B5FFOaefArM3ka1bdOWIt/W1IA=; b=
	BxCiu/QJeJrrSb5IXu6KGKs+ca+VPhAMbKWfjSgR8P9dVILl8/MJ/kfFzDSTS54G
	Jv3ytLjiD9H+q0mdp4vpsw2QfNYGBRTGxZE1565ZHT9OD3gMq+SS+QP249iOSV+Q
	etAFxSvQ1UVeryB/Dyq3/1dQ9G8+RH+FLb2n/aJRfEdqLMfWHYv40N+5esPlhbAa
	eqC9ololzAPFwB9wQ8jlX8/t2Reom4B0M3CJjtY3/bQpW6gAdRjwQQ9SvsMrbLW4
	28z26LmsRmfVkOFXEroHkWKtyVpoOM3JvTtR8zNYYnWfWH8w2jr3pssaFIc5bNcs
	ZCQCwbwJ8hTkbsqDd3WVXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769456372; x=
	1769542772; bh=ApT/fwFNRvGjeYzf4B5FFOaefArM3ka1bdOWIt/W1IA=; b=u
	NEfCxaoxXgQyVTGztnuRR9KbllN0SzG6NNYJlepGChM+xerobt939YaVE5FGs+uA
	szRNScwxY9ux+zVhPvu57ZIEVLiQGO+nbZzQhG1CQAr56Gc9KUeU4EmRZEgoOzh8
	/4czxoJOcDytXAdb2NodxeIRuEayPGGb2/s42WKlCSpjZN4k9Lx7OTPYSIj7bbZa
	TIANXvkoPlTSsG236KjwOXIsi20WdRayyiFimtWXMRtruCKosY8RKP7zIQhFmiiE
	puANtWhZlmbLL9mTUdUTOFJ7aDlbtGc98svfXzYPqkG+GBqvwQtQUrfrLGedwi+v
	b19RY3mNnnLktNrwOM5jw==
X-ME-Sender: <xms:9MJ3aamNXxulKXhu_8hZC1PKQGVCBxVjnbvlIF9IJtOBT9PF74sqBg>
    <xme:9MJ3aaA3M2mHvTrby147-_MtLe-KT_LA5QP4HUh-6DHS6SwZAAwAyS443YvofxT6R
    7beX5ctmdmg0d6--BajbnH7zC8jnX138h2IVW68YVOEcsQ_1DQcnyYI>
X-ME-Received: <xmr:9MJ3aUMxw19S1zrh8MdhP_vqZ2jchrUGg0L-NUCPPlAgwuJFBGOmmaaH5OGRYQw-082qurL5WRZRqq22xehR_rJpgBz5ngU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheekheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvghsrghssehiuggvrghs
    ohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdr
    tghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghhrggsodhhuhgrfigviheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiug
    gvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihes
    ihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:9MJ3aZOxmgpbbSWyGtxSVrsjlbkQUwx-PO3u_VZCGLCZSNlcze57SA>
    <xmx:9MJ3aUnxOaTi8T9muaLGBMns9QJt4dcdoYqkYriuy03BykAasl8qqA>
    <xmx:9MJ3afskpK92c7RKOzS0gabBkxSmn08iaaTBCeASlzW9cQ6wGjLgGw>
    <xmx:9MJ3afpbTNO3DusDQ8AxE5Ar9tz_3YiHZFNRjtcuWE4b3i6E8XqzMw>
    <xmx:9MJ3adZ8B-g1rt3RR9lU1IY_LIKzaZ_ngGdfMS1K0OVCn4QrzM24eJmX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jan 2026 14:39:31 -0500 (EST)
Date: Mon, 26 Jan 2026 20:39:29 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 00/15] media: rcar: Streams support
Message-ID: <20260126193929.GB3751370@ragnatech.se>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
 <20251231095739.GA3091492@ragnatech.se>
 <9878845f-c403-492c-a673-90c91472ecc2@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9878845f-c403-492c-a673-90c91472ecc2@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51589-lists,linux-media=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,ragnatech.se:mid,ragnatech.se:dkim]
X-Rspamd-Queue-Id: 941078CB28
X-Rspamd-Action: no action

Hi Tomi,

Thanks for digging in this.

On 2026-01-26 16:01:36 +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 31/12/2025 11:57, Niklas Söderlund wrote:
> > Hi Tomi,
> > 
> > Thanks for your persistent work on this series!
> > 
> > On 2025-12-16 17:18:17 +0200, Tomi Valkeinen wrote:
> >> Add streams support to Renesas rcar platform driver.
> >>
> >> The series keaps compatibility with the current upstream for a single
> >> stream use case. However, in upstream there's a limited custom
> >> multi-stream support implemented to the rcar driver, which will be
> >> replaced with the upstream's Streams API.
> >>
> >> I have tested this series on Sparrow-Hawk board, with a few different
> >> setups:
> >>
> >> IMX219 connected to the CSI0 connector
> >> - The following patches applied to my test branch in addition to this
> >>   series:
> >>   1) The v4l2_subdev_get_frame_desc_passthrough dependency
> >>   2) Revert of commit e7376745ad5c8548e31d9ea58adfb5a847e017a4 ("media:
> >>      rcar-vin: Fix stride setting for RAW8 formats"), as that commit
> >>      breaks RAW8
> > 
> > That is so odd, I do grab RAW8 on V4H with a IMX219. In what way is do 
> > you see RAW8 breaking?
> I think I found it. It's broken for all formats and resolutions, based
> on luck:
> 
> VNIS_REG has the lowest 4 bits always 0. From the doc: "These bits
> specify the width of the transfer destination memory in 16-pixel
> unit."
> 
> We do nothing to comply with that.

Yes we do, but maybe not enough?

In rvin_format_bytesperline() we align for this, we even consider the 
special cases for NV12 and NV16.

The value written to VNIS_REG is vin->format.bytesperline / fmt->bpp, 
and the value writen to vin->format.bytesperline is ALIGN(pix->width, 
align) * fmt->bpp. And for all formats (not NV12 or NV16) is 0x10, so we 
do align it to the 16-pixel unit no?

Maybe their is a corner case I have missed or maybe I'm missing some 
other angle? And I agree adding and removing the fmt->bpp multiplier is 
not the best here. As we have finally moved this driver to media graph 
only there are lots of areas things can be cleaned up and improved as we 
no longer need to consider all that Gen2 special cases. I bet this can 
likely be cleaned up.

> 
>  Tomi
> 

-- 
Kind Regards,
Niklas Söderlund

