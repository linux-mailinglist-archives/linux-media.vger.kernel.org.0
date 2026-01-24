Return-Path: <linux-media+bounces-51468-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TuGoESspdWmwBQEAu9opvQ
	(envelope-from <linux-media+bounces-51468-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 21:18:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C50C7ED82
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 21:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9593C300D95F
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 20:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A25E2236EE;
	Sat, 24 Jan 2026 20:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="euXY6PNu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EYNuh8Tm"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C0235972
	for <linux-media@vger.kernel.org>; Sat, 24 Jan 2026 20:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769285923; cv=none; b=ct9ZMx3kVD9IAjRPeXBXVTZ7vyfJLYf4tnnX1hSy1Y2LUwFNmV334kDZ1OMhfxre19PLXFzKCA4o0QYkz09P/s8tNd3upXEnybz55DUJJvzuc/QkD9jWdGDjoeFs/bC52FNI2SVJ2VWX0GQ5H2XCf3jXWgnq6LqiOL9ualhLHAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769285923; c=relaxed/simple;
	bh=SM/+2JfhCPDQxp/Lo5vvbCDSvMWD9ylrsYNeeqx8xM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryX8+4WmgTMQs8WDWLgMTRMhRxluA9Ta7c8R7yZBwz8RLVzy/0GruPWsK9ZBxudJ/hBe1AFL9zzE3dVxrVjhWAv6nXNXo3f80AM2UPD7hVR98aum2ks+jsGUWGbeByZ0/07pBS+djhoQlIUKU3syYPpfMepLlF7eEASslP+GTuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=euXY6PNu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EYNuh8Tm; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id A3D6D1D000E1;
	Sat, 24 Jan 2026 15:18:41 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 24 Jan 2026 15:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1769285921;
	 x=1769372321; bh=t3cfUujCFmjtowv7k/ordQhyt2vK+7WlxmHSya1vcT4=; b=
	euXY6PNupDp6HIfn0uYLi9ACIPk/KYrY5OBaeDeSa0ZX9kwZU2yArQyfARnip3aG
	/Zqrl0qQzf/AQQ1lVCmYFFE6F8ShuShSM4Zu7Uf9IjaWTYNfm7LtEMb0eHo+RNqU
	bBl6gNiVqkVaJqucLV3rIz3hB8Y+KB09LCr+rBEiFHYeZ1A1JjIGsIMGAHDENtRv
	FKrJtzc2qWjN7Tei1Z/MQYfNjalV65mI4EUyGeZyPQGJkMQuO8Mr9cnvg2pdk6cW
	n7m1wkDOpqWdvEvisoGOz/GTw3e8zKS99gnjKQxr3xGxvBNsuUGKcG+0NBJnS4fP
	DKO/vW7cW0hOwqVq0O9NwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769285921; x=
	1769372321; bh=t3cfUujCFmjtowv7k/ordQhyt2vK+7WlxmHSya1vcT4=; b=E
	YNuh8TmjYqB9OpL0KyEnruae/0lyOoEhWB22ifdKn7XOxkelAfAjwVEXdGSurZgw
	ila+fscfmbPTKHzsCQX+V9Xh7lRr2ZsZU4/Q0Yu5f5g1Bw2mblq+LIyyiw6pF8bH
	97+xYj0jeM1/7l8Vk65dq29v5nIuhUDeafTbvpErgHVWNYsdiz2z9O5njUZPu3lq
	xFhN4R0MQKz5h3VeKnDOL3qkvONymIhiHDaM/yk5sKjOPK0Zqb9YAENKmlDyk1w2
	QQ0JPRhb5+FsCzFkJM5+vewQSaKrM4SYx4olWJISstMoRmcfZSw5z8qFIw+/I19l
	JzZnZ7WLAZMHe8IE/axkQ==
X-ME-Sender: <xms:ISl1aQFw73bWGf0cUz5Wa-LEAyyuaf9BBXAU5JCPWlAtqtNhPwIdMw>
    <xme:ISl1aREaSsq4rFWN3muccLz4mHiZOp4Wvi7abHTXbvJuwh-YBYvnIsGWEQz72ujz7
    ZdfzpNo4IdFb30kDXaejZWQS6Zc_gXpkD4sT3dpPQ3tcg-YFa6hOg>
X-ME-Received: <xmr:ISl1adPaBeVZkm-Q0FVnVyx3aKrD4UxKpyDIEyepf1aKHdW_L6Fw46gsN2UAhoZQyZxxkPNU5eHENhhaImSzfeJpEePGo60>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduhedvkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdp
    rhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrh
    gurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:ISl1aQE_LYX4BY1ZRcuELdzoErd2_zo48hmXbBa-2RkHHo0XOBEs5w>
    <xmx:ISl1aUPDnbtf-33mcrKtu-x8cJVMTLGjaFa9m-Qu6BvzfCI_7LjA5A>
    <xmx:ISl1aR8WjR4z_nw8MdDu3rsLSCEGo4-nj03g9JH7BWbq2sHu0l4Cog>
    <xmx:ISl1aQRTcHiR8fxj3cRO4L5q4dEhIbnHgXQFRpukjVDvTsFPgj3D6Q>
    <xmx:ISl1adpw_t_bMoix-1hzt28yPqLA-uhNUEwzoIp-Jqe2LoRhUJfJodOX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 Jan 2026 15:18:40 -0500 (EST)
Date: Sat, 24 Jan 2026 21:18:39 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [raw2rgbpnm,PATCH] Add support for all RAW memory layouts
Message-ID: <20260124201839.GD3395783@ragnatech.se>
References: <20250511154659.778725-1-niklas.soderlund@ragnatech.se>
 <20260122092004.GA239742@killaraus>
 <20260122092834.GC2316109@ragnatech.se>
 <aXIZx1S7Q0f77VCB@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXIZx1S7Q0f77VCB@kekkonen.localdomain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-51468-lists,linux-media=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,ragnatech.se:mid,ragnatech.se:dkim]
X-Rspamd-Queue-Id: 8C50C7ED82
X-Rspamd-Action: no action

Hej Sakari,

On 2026-01-22 14:36:23 +0200, Sakari Ailus wrote:
> Hej Niklas,
> 
> On Thu, Jan 22, 2026 at 10:28:34AM +0100, Niklas Söderlund wrote:
> > Hi Laurent,
> > 
> > On 2026-01-22 11:20:04 +0200, Laurent Pinchart wrote:
> > > Hi Niklas,
> > > 
> > > I know this has been merged already, but it only came to my attention
> > > now.
> > > 
> > > On Sun, May 11, 2025 at 05:46:59PM +0200, Niklas Söderlund wrote:
> > > > Convert all supported RAW input images to GRBG memory layout before
> > > > feeding it to the RAW to RGB conversion algorithms. This way all layouts
> > > > can produced good colors in the output image.
> > > 
> > > I don't think the result will be accurate. It does produce better
> > > colours, but all liens and columns in the output image end up being
> > > swapped in groups of two. I would have kept printing a warning message.
> > 
> > Thinking about it now, yes having kept or updated the warning message to 
> > make the user aware of the result not being pixel perfect would likely 
> > have been a good idea.
> 
> Kunde du skicka en lappa för detta? :-)

Javisst!

> 
> -- 
> Med trevliga hälsningar,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund

