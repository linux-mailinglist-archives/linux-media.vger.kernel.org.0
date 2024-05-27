Return-Path: <linux-media+bounces-11923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EE58CFCA8
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 11:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F371B2031E
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 09:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FB113A3E7;
	Mon, 27 May 2024 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="c6A9Vi+m";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RjUdz2qn"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD5B8BF0;
	Mon, 27 May 2024 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801584; cv=none; b=bz5it7Uf1mdq8/o3erNAebdcx6uQKlPcc/qGR2zQLx/b7LNaHNm4mA3g7R+yZxIzYYgJiDjofnM5FODl74kuBnR2gFo7ITguxhEIUECaoMYsiR91ac8c6C0JiWRWf2VnQIxIWQFpzDyb3mIce9FbNmUScM+AUpbB4ID2aMj+Ms0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801584; c=relaxed/simple;
	bh=f/ZO/5SheuJ39tBbAq0V9Icin85f9j7EK3xhw6RHGOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9WRJB4Ex0c+HZMB/eo4ZB5hIqp9Hk81WP2cN8c5iBbN6DyAN3ufa/TLNE9tFDNbqilS2vI/mLrzbQztugGv5ZRP5/IMJo0s3xzhH5zoHuIdT+uTjWydP8yuM9yBA9Jqh8aChWMzKS2hk7Zwwbopb49AvIUq5loIeOkIUN97SfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=c6A9Vi+m; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RjUdz2qn; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 1E5B611400AC;
	Mon, 27 May 2024 05:19:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 27 May 2024 05:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716801580;
	 x=1716887980; bh=RsvTN0MTkk+SPrmFN4sVD6AmnEFU2PQA8SihEAjv5yw=; b=
	c6A9Vi+mt7Ogtl+5BO0uGjahRsK/DZj/gL9pbmlDgXo5OD6IN07tW1poD83++Kcf
	vaEn8yVKj3RYBX7yGOmie7+YaTbSbYLFOxXE88OhJjqhKgD/e6ieHNDU8ELPay2X
	spCAyRxuCBqWdyYmlSJEuHUgu4gj5xG+qA3GP5IlmL+Yn0MfJJnXD6My2frlF5NT
	dLPX3oojh7VZQc/oOe/XL4dUs6Uga4fMFuORFnzdowA3vBk8qyZohBLDp07s+pve
	p/RGXzGw5pKrrCTiZVOOx/aeQDH1TUWZkAVsCsPanzVJkj+PDlVAww78u8CyTog8
	enbJER7S51Rqf+jIdruh2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716801580; x=
	1716887980; bh=RsvTN0MTkk+SPrmFN4sVD6AmnEFU2PQA8SihEAjv5yw=; b=R
	jUdz2qn8Abxh83QmoFliGkUzfqE+ACdOF+dmhFfUzuSpvyDbgG7jNwBIow2JrMGs
	DJXDiuhCXMBd0M082+ku4JOOWkL35eTDBwdB9ua+tehLgU6XqwUoH/2SGDWMOY9I
	LIuzdNgtB0b2qGNgKBf+WsqP+HjOb0QvmDrhoRmaQHES6RPfedcL0RqXiZ5mAmos
	vYcqizsAFp3VVEbLNEGwnXacFnjUjnnalEx//ZpZ2TUwmTK+awQGrAMGSzKl1rR0
	FVyAW+1ZyelPmmYsNyha0i61emaxcR/quN5jVLCaeyOW1YVdUryoz2dKfZDrvyEJ
	aqxurort2PweneDJ9u9Lw==
X-ME-Sender: <xms:K1BUZkun3sKFiSEgcecTF9Wv6b7BwJ1iwgass-PBqpMjLqK1XVOFXw>
    <xme:K1BUZhe5NI5D7JH7eCHUQjAtG95U0g74qxz-DFxJI--GBVkFoMIc61m8vQIlxakO6
    1XDnEgHFrQbo5_UC6I>
X-ME-Received: <xmr:K1BUZvzQUXXwNt_Mmw-HwYvRjZSwJekMuuJ5meBsW9Pj5nYeyeDSGlOhdJhQJuwrcrQhagG84RGVHjj8_IrVanb17qaIGjs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrgh
    hnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeeuveeiieehkeehheekfeehheel
    hedvveethfejteefkedvhfeluefhgfdvfedujeenucffohhmrghinhepmhhiphhirdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:K1BUZnPPy-rjfDNqAS-jzWw6J6SkU3JEosX8GYwwZ-I5wTBi37osmw>
    <xmx:K1BUZk9qcEnTtnUz5tqgqZPVhDqlU1as6yJCClmP1ZIizboSkeei_w>
    <xmx:K1BUZvXZGkiwCJlwh-3KTSupfjl2fvQTULGRfXvKHKR8qx59K03MlA>
    <xmx:K1BUZtd8uqkNuH8CFObh1rjw1eDx_X4rQG04ZqI8PnfCdCEQ-u-Ilg>
    <xmx:LFBUZvayj3IQN80RHL12xCQkKVun9kOYZrBn-17436BTKkDEjjXfgrEd>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 05:19:39 -0400 (EDT)
Date: Mon, 27 May 2024 11:19:38 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC] dt-bindings: media: video-interfaces: How to describe
 physical lanes for CSI-2 C-PHY
Message-ID: <20240527091938.GH1900917@fsdn.se>
References: <20240525220747.GD1900917@ragnatech.se>
 <ZlQoJtxXBqrwI8_U@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZlQoJtxXBqrwI8_U@kekkonen.localdomain>

Hej Sakari,

On 2024-05-27 06:28:54 +0000, Sakari Ailus wrote:
> Hejssan Niklas,
> 
> On Sun, May 26, 2024 at 12:07:47AM +0200, Niklas Söderlund wrote:
> > 1. We could add a new generic property to fulfill the 'lane-polarities' 
> >    function for C-PHY, 'lane-polarities-mipi-cphy'. That would only be 
> >    valid for C-PHY buses.
> > 
> >    The structure would be the same as for lane-polarities but the items 
> >    enum would allow a value from 0-5 for each entry in the array. And we 
> >    could define mappings in dt-bindings/media/video-interfaces.h to 
> >    allow names in DTS, MEDIA_BUS_CSI2_CPHY_{ABC,CBA,ACB,CAB,BAC,BCA}?
> > 
> >    This feels wrong as we already have 'lane-polarities' and it is used 
> >    for CSI-2 D-PHY configurations already.
> 
> Could you add a property for this called "line-orders" with matching data
> line order in MIPI DisCo for Imaging specification
> <URL:https://www.mipi.org/specifications/mipi-disco-imaging>?

Thanks for this document! I looked for the C-PHY specification when 
trying to figure this out. But as that is not public I gave up on trying 
to use MIPI as a resource to work on MIPI stuff ;-)

Your suggestion for a line-orders property with the values described in 
the port properties section of is a good way forward, thanks!

> 
> The polarity isn't a right term here as it's not a differential pair as on
> D-PHY.
> 
> -- 
> Hälsningar,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund

