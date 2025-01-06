Return-Path: <linux-media+bounces-24270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB959A02361
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 11:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 786CB18855A0
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 10:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC891DC046;
	Mon,  6 Jan 2025 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fhkELyKD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aKR9J02t"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695CA1DBB2E;
	Mon,  6 Jan 2025 10:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160457; cv=none; b=ByXP3G0ekUyDbKkw96qDrkwF+gk9QyNl2ufF7QuPYChQxqnjvhnksE8FPREIneMTr/YodOr+iPjYWLQxTZDJnVEevP/enFJNMXYrnRYIIXOyEA4cPJYi9NxMexJEHubRlFzym5ME+j3t+bqH7WuG/UxFV+8lNNuxuiRWcZSVHIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160457; c=relaxed/simple;
	bh=pauVwHkPUDWnLFjApC3jO5pFmZAY2Zy/EjWaIyymjwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrcwoSAnYY16TXHV8BuF1qNOH+Gv1MaZwLtZr+bbcuOaav52cAl8KPtxoJ5M/PyA/4aLbW/0CIAzk2MSc4yOA1kImh/2THzuoLtETqBzCNE5WVYVB6NK+ZDArfSJX16O555pboDcCBwRgt5X2NdEw3+O1nPQ4CGtbLi7VNwXPtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fhkELyKD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aKR9J02t; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 07DE5114011B;
	Mon,  6 Jan 2025 05:47:34 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 06 Jan 2025 05:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736160453;
	 x=1736246853; bh=MZlsCOgaBICMMHEAiSMnPwaYurf7rVQAJWKgp5mkatI=; b=
	fhkELyKD0SVkTrUj9UI/nJHEHR3EoAFfTrw3uGCgnfFaE+hnqodoVyHvJUH+TLY/
	j7Off7H4aYkx5vXYO2TuA/haSxZc6tKtwg+91C1ERD3+NDNxrBpmvaTaKsDjDLuw
	m/yKiPPUsG9jcSYYrb2oWO+pUA8kFoDdAn9sQy98JXpmlzkDtU0aLaPsHLG6LBh7
	G1NZUKsY6ine60eHfaH7ORQpQV5tYlVVif/C+i43VY1DXAPzZH16yvCVo7TOwAxm
	UeYUYY/SnFI63SoMj5e/tPCaMdt5tRP0A+bVw/A8wLlFpOCMefIqAEjWYVw+kjtd
	WDNlayJ1bICNN7UPdvZW9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736160453; x=
	1736246853; bh=MZlsCOgaBICMMHEAiSMnPwaYurf7rVQAJWKgp5mkatI=; b=a
	KR9J02tjdEU0xE4OK4ampotH7mUwvD3FD6Q7Dw9DrwwWiz2XB1u1HstIFB/l5Aki
	qX+nDZJR8xLJj04fIXglFNZznE7sQKh6zqoyc0ObOdNL2s2ivFwk1L1oxcGcQHv7
	dvXH9WQELyvFCA6ixE9dBEYNMaeIHKsDvzc1VPgY5zkBtgWxdb0lFtJCLM1hmzfs
	QrZNvyrjKqB5ewwFLeX/iLMX4Ft9u6YRvGVV+a2csS+0kJPniCMcTyHPv/W0DZw7
	0PpNn+bJjq/rvwdPBk/sBR2qnNMTOT4064oEveB9i3RFKFrfaDKDJr59CMZckGax
	Pnios/7eb/Xn25SA/nVPQ==
X-ME-Sender: <xms:xLR7Z8xjm60QxQI_0CflB50tlM_5uBLwq6qiyQhvIfg2DkLo3cJn_Q>
    <xme:xLR7ZwTi2LZX41aUDGqOj3FOXbYwkBuAOpr9EXcZwrSnCKyVc5W8z9L9ONDUE1RwF
    IfGEu4gOMLGi7-Luzs>
X-ME-Received: <xmr:xLR7Z-UreICVBpqiP8LIHpbP7JIOcuM24Gq7R5fGXr4JLtTqMiMjb4LSEocX2iQGMeGTZkTw-3KE1qylmujbp2R-1YPyXy-SqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegtddgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    ghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepshgrkhgrrhhird
    grihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgr
    sgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghh
    rghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmh
    gvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:xLR7Z6jamfx4ZlcNpBz9vMRlKSFB55pnxjkGjTkcwyLuMCGZQPpetw>
    <xmx:xLR7Z-DNGEcO3JFFIv2UV9XeyIerHN5glNyy7HSpB8JnpUg0Y9GmeQ>
    <xmx:xLR7Z7KE7Rl_17667gQf8n_j-3xXldB3Jyx1ZYCIxwPmztiarkOF7A>
    <xmx:xLR7Z1D9DpL7XsWkVh0d-57o73_wfpBZEp1GS47nzkuzD5_38bS6hA>
    <xmx:xbR7Z_Inlo8K5QAiDcJq0cMdPo-tpd8yDVlAsdJ_tyHXas7B3SyFmOSp>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jan 2025 05:47:32 -0500 (EST)
Date: Mon, 6 Jan 2025 11:47:30 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: white-hawk-csi-dsi: Define
 CSI-2 data line orders
Message-ID: <20250106104730.GB2766897@ragnatech.se>
References: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
 <20241121134108.2029925-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWqS=zURzutDsCqChSGia35JZpVuDY=njrCBEKP-6=eXw@mail.gmail.com>
 <20250104121700.GF808684@ragnatech.se>
 <CAMuHMdWxmMXe7dhFNGmr90AkRovW-Pov_0DA8-=RgDa9j_FWiQ@mail.gmail.com>
 <20250106100232.GA2766897@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250106100232.GA2766897@ragnatech.se>

On 2025-01-06 11:02:36 +0100, Niklas Söderlund wrote:
> > Note that it's getting a bit late for the alternatives, as I plan to 
> > send
> > my PRs for soc today, or tomorrow the latest.
> 
> Thanks for letting us know. As we all are slowly wakening from the 
> holiday season maybe the best alternative is to go with option 2, 
> numerical values to avoid the issue? Then in next cycle follow up with 
> using the defines?

I have now sent a patch for option 2 and I will send a follow up patch 
once -rc1 is out to use the defines instead of numericals. Thanks for 
your help!

-- 
Kind Regards,
Niklas Söderlund

