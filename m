Return-Path: <linux-media+bounces-51616-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLKhM66EeGmqqgEAu9opvQ
	(envelope-from <linux-media+bounces-51616-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 10:26:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB991AC0
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 10:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AFCB3017C27
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 09:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BF22DB7B5;
	Tue, 27 Jan 2026 09:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JcvwXJcB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eXPVl2CE"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC1A2DAFB4;
	Tue, 27 Jan 2026 09:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505926; cv=none; b=bz6RvMmhos+usD39K2VB8z/tVlCC9EIG/yLVP14HNq/yP/gH3gCQIjFeuSizD8wdkqEr41HLtQ5cEr1FZHpdTxELKhvJqAUqqqlq3je0xkA16pN4nFPkwPpq2vXGnhXP7a2WeLfc/rwqgGTXHrGwH9yWoQDz9b1hHQc3IxnD4xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505926; c=relaxed/simple;
	bh=4uZOQExB7Kh+y9IhhRujsk7E6W9q79jvd4nThNHsm5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOG52qHA+i9FFTB05dpjeDR1yvm5DxfyQXuQmEq3FDjKF1MNcSEEpv0v0+QBlwYJj1uJe0meTiHP7t8eYG3O8kpf2RNCae5ASiEMoBp/sI9OyqAZPM2HDzhKHB8sX7MjgR8mHVHyEWU1xtItFxJGNrzUzoycss1M0LtSjiAHocw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JcvwXJcB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eXPVl2CE; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id E21201D001C9;
	Tue, 27 Jan 2026 04:25:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 27 Jan 2026 04:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769505922;
	 x=1769592322; bh=3TwL/hl4eNVbqtZyQvcpQoQvEIT4/Vej02qJ3FuxI0c=; b=
	JcvwXJcBAE2OTbYYo94QY894OjvEQxoOcgoy39Va5j+gF2wbg4KelYXvOyQdXdqh
	R/3wGkZ+YSrdgaTkAWc5tgRJVA5elEU2oqSJQTaAiq4ZY7B+xI0aBBLXlZQ4Dgnx
	r5svVOM3qU2utXKpredi+Zv5yU++vGz7wu/Y1WvivO8B1yjl4MccWDRX8rkPjWmY
	xnf8DI8c/V9gHTk5AjLOxcCmlkErCTjRi3C6WxoyY0P1z/eI7MClmOfnKnN0cO0A
	4dKSFn5/7YHjGOzGUKhN0uEc4sIHth3sB6QIi2ZJvOIT7xNk49mLECCBSN+Psiru
	mPfQanSykr6pl9s748OWKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769505922; x=
	1769592322; bh=3TwL/hl4eNVbqtZyQvcpQoQvEIT4/Vej02qJ3FuxI0c=; b=e
	XPVl2CExWBjWDMRWowyR97A8K4KCwsnGBcPz4dlPQAdUlt9AU4JuOE2NWpGx8DqV
	NqMU7eGOjBvmQ/mOMYD3fVPintnbHSMOkcIygygIoIyjxQNj/yD1eLkdfdmWhnnB
	/qnova0rqZFuyZBg3R9TSwY87Agzbo7eT01UQH0ZEYyPnHUpxJ4Yjjp9+cMurDgu
	pDT/gARgct8geIxTxl/41w7iwymtWYTVr0y2ZwOQW12XAwvqygYsNKwwyb0/0tAH
	282VsG2jD2RCbyHiGmo1mlOStJ2uta6nzlxsDxHhyWiXZW+tIT5TxNd5xMIRKBGH
	6jdu85llUzMMrYc7bZ5OA==
X-ME-Sender: <xms:goR4aToI9bq11PRXRZ4bCbIgq6MkTofZ-J20UwOHhUivY4KZT2kSEw>
    <xme:goR4aV2tomNKpCeHu0CAPQIIlBRWheLBdQ9quBoCCfgHjKIjcADMwsed9Hc9VNX9U
    _dI1xe4QDP2utwvzUkuSIPpQcvOQLc3eEVg5U_AmQmNDoGNf0x2Ckk>
X-ME-Received: <xmr:goR4abwgPJUZx9rYbHVowfODMP6bT-DS87ANv4zBIKyYsPi2m7OHGec4jwgzFq3QteieOVO6YXwNTz7HLbOCCg6d4DsrLss>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedtudeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:goR4aRheyyfQpQ07PD59Vu2s4z5buXK1NT9yIWBERQyE7OH3R9lbqw>
    <xmx:goR4aerjji31xyW3VK-4g1QQJgYdSjJQa9qP2-jjyVUqZi-VjsnLLQ>
    <xmx:goR4aYgZOMUJa2f6FMync1Juc_eLocVmrThyGKuavgiaXlhLHmWUKQ>
    <xmx:goR4aQMq_qjuSatP_W_I4joQp9g_P3bfI4Manh3FhHY6Vbsj6c6xnA>
    <xmx:goR4aS_7wKpiYxECtziNgc74MjkPlSLsglqhjxtIHWoh9YjgNhIH-gTK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jan 2026 04:25:21 -0500 (EST)
Date: Tue, 27 Jan 2026 10:25:19 +0100
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
Message-ID: <20260127092519.GC3751370@ragnatech.se>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
 <20251231095739.GA3091492@ragnatech.se>
 <9878845f-c403-492c-a673-90c91472ecc2@ideasonboard.com>
 <20260126193929.GB3751370@ragnatech.se>
 <4d1556bc-7a57-407a-a124-a83accc7afc8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d1556bc-7a57-407a-a124-a83accc7afc8@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51616-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 36BB991AC0
X-Rspamd-Action: no action

Hi Tomi,

On 2026-01-27 10:59:21 +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 26/01/2026 21:39, Niklas Söderlund wrote:
> > Hi Tomi,
> > 
> > Thanks for digging in this.
> > 
> > On 2026-01-26 16:01:36 +0200, Tomi Valkeinen wrote:
> >> Hi,
> >>
> >> On 31/12/2025 11:57, Niklas Söderlund wrote:
> >>> Hi Tomi,
> >>>
> >>> Thanks for your persistent work on this series!
> >>>
> >>> On 2025-12-16 17:18:17 +0200, Tomi Valkeinen wrote:
> >>>> Add streams support to Renesas rcar platform driver.
> >>>>
> >>>> The series keaps compatibility with the current upstream for a single
> >>>> stream use case. However, in upstream there's a limited custom
> >>>> multi-stream support implemented to the rcar driver, which will be
> >>>> replaced with the upstream's Streams API.
> >>>>
> >>>> I have tested this series on Sparrow-Hawk board, with a few different
> >>>> setups:
> >>>>
> >>>> IMX219 connected to the CSI0 connector
> >>>> - The following patches applied to my test branch in addition to this
> >>>>   series:
> >>>>   1) The v4l2_subdev_get_frame_desc_passthrough dependency
> >>>>   2) Revert of commit e7376745ad5c8548e31d9ea58adfb5a847e017a4 ("media:
> >>>>      rcar-vin: Fix stride setting for RAW8 formats"), as that commit
> >>>>      breaks RAW8
> >>>
> >>> That is so odd, I do grab RAW8 on V4H with a IMX219. In what way is do 
> >>> you see RAW8 breaking?
> >> I think I found it. It's broken for all formats and resolutions, based
> >> on luck:
> >>
> >> VNIS_REG has the lowest 4 bits always 0. From the doc: "These bits
> >> specify the width of the transfer destination memory in 16-pixel
> >> unit."
> >>
> >> We do nothing to comply with that.
> > 
> > Yes we do, but maybe not enough?
> > 
> > In rvin_format_bytesperline() we align for this, we even consider the 
> > special cases for NV12 and NV16.
> > 
> > The value written to VNIS_REG is vin->format.bytesperline / fmt->bpp, 
> > and the value writen to vin->format.bytesperline is ALIGN(pix->width, 
> > align) * fmt->bpp. And for all formats (not NV12 or NV16) is 0x10, so we 
> > do align it to the 16-pixel unit no?
> > 
> > Maybe their is a corner case I have missed or maybe I'm missing some 
> > other angle? And I agree adding and removing the fmt->bpp multiplier is 
> > not the best here. As we have finally moved this driver to media graph 
> > only there are lots of areas things can be cleaned up and improved as we 
> > no longer need to consider all that Gen2 special cases. I bet this can 
> > likely be cleaned up.
> Right, but if we have the stride / 2 code in, we will get strides not
> aligned to 16 bytes unless the bytesperline happened to be aligned to 32
> bytes.
> 
> I sent "[PATCH] media: renesas: vin: Fix RAW8 (again)". I still don't
> understand exactly how the RAW8 processing goes in the hardware, but
> afaics the stride / 2 is required, I cannot get any proper images
> without that. The documentation doesn't really describe it so I'm not
> totally content with all this.
> 
> Anyway, please test the new patch on your end, perhaps we'll finally
> have a conclusion on the RAW8 =).

Reading the comments in that patch and the documentation and I now see 
the other way the docs could be interpreted :-) I agree that if it works 
(I'm sure it does) it also satisfy the documentation. I will give it a 
spin and reply in that patch. It would indeed be super to solve this 
correctly, thanks for your efforts!

> 
>  Tomi
> 

-- 
Kind Regards,
Niklas Söderlund

