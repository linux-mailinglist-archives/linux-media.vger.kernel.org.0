Return-Path: <linux-media+bounces-60587-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNoKA0w0+2nfXgMAu9opvQ
	(envelope-from <linux-media+bounces-60587-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:30:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 731754DA37F
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52A7D3020101
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 12:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B200244BCAE;
	Wed,  6 May 2026 12:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Gd49NV3l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bt7hdVfH"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896193F54B4;
	Wed,  6 May 2026 12:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070599; cv=none; b=FoNPnM0bIqb+LKZif7poMn9SPkG8d9Y3Rq6nvwQxnPYgqY57JUXVn5yECN2bC2HD5uSz/lf/uka5AUFRyG8S11t0S4kbYPdZYCf9quIrOORgoeA4jqP3tLdp6c7FHPaPDwvX8XZ0KX2TfI99/ql23hGmzvBVehIJTOsv5uNPdII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070599; c=relaxed/simple;
	bh=VqhWrTFMLvjs7LAP949UYTaIyLgr2ay00iccigt0KRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwobVpjuA/pJ2IradNUtkGaaAS3VHbgiGgKw0im/bD/6FNYuZEM04T+6H4cBF0LaU/ZXWslhV31hLOHciG9z9I0J5gw5CwyW2mFLS6Ya827d06L6E4C9vGxz5V1IewwmMnYST3BATGwC72lX/6UVXsjHLzP48+cLmN1/60KgZQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Gd49NV3l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bt7hdVfH; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 99037EC00C6;
	Wed,  6 May 2026 08:29:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 06 May 2026 08:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778070596;
	 x=1778156996; bh=eBUekg/ebLyhts0l7tXIv6bSeEg129SMhLwez7XvD7U=; b=
	Gd49NV3ldnc55SguwBvg/mgiG6+lS+UBEqKL/64DUsASloOrC2rB/Ta2ouKlMYYC
	mb02SPJyXtvJv9fwkkfLo5q+omGELIpIvZBtUlN8vZc1Y4X2by1jpRA8ak3wBTNA
	k8SN60vtLaHQldJ/DV0fVOsR6jNbqT0mKIKn7m3uNr2gDQfjOAkPZco0LZmFMWer
	PmkEj2oDPVPffJMYD6KwSLNKKpT7xAMPENrxZBEHF71J7IfCFwu7+UmFJUB+bPL0
	0VUPII9KdQC0k7BgVnjp9mgIKJ0GGGxvGPMzFOAjnVxwWSbq5Y1LPjioWSP7WmjO
	uff1RDjXRI7mxaXyD3bLwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778070596; x=
	1778156996; bh=eBUekg/ebLyhts0l7tXIv6bSeEg129SMhLwez7XvD7U=; b=B
	t7hdVfHJHmC3rQmQ2JpdC7dZvtiyzBFpbYpZ3Eu3Tfkj5QeH8nJ4/PpRvRHfDhd3
	fXG6MwiuAPl88UfwtykYDIgfi2MRp6hS81/wHjdWOvBboudBEgMTwqF3+C36/wzy
	cqwTYtlDp/6eT16h5c4EoGMSdGrrkwU2iBesZmQe/RC1VjuSUDSvHLp6k7gswPg2
	dyD9PzTzwCrAs4XtxJaejSkx1K8f11QNWHeVOSqomcM66wl09KvedPqwNp1bfsjJ
	5TGWmxz7nCzD1L34/esXbMzzFvuAiJ1grw4bo58LtmavKJ+KNrtgl9Uotc6P7KXc
	Uo4Nbe+YoRL0jJ3l79qew==
X-ME-Sender: <xms:RDT7abTkgtxcx-haWdVLUHLWDj_DrB_5oQK0LSIT8zQN8mZeX6UfbQ>
    <xme:RDT7adPOxnwxedeTUST1TCt1onApZ6wWVnVR3AYn99x9k0DzZRPnsb-2ICXeE2zvD
    ev3omQsPjuEPjWtxXByj-b2URgMzjWUmivDP-0kZtQPZigdM_s4Fg>
X-ME-Received: <xmr:RDT7aRieAix16O02yGNxMP5U8ZDGu3dROr4tPdf27u81ECuo87Vpu66J1GApuCCNdP0A9rl8znM_HsryoRIDrxy2SmcxzeCniKUE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdegheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeffkefgudekgefh
    hfejtedviedtgeetieekffeiudfhgeevteejvedtffdvkefftdenucffohhmrghinhepkh
    gvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
    grthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepjh
    grihdrlhhuthhhrhgrodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdp
    rhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkuh
    hnihhnohhrihdrmhhorhhimhhothhordhggiesrhgvnhgvshgrshdrtghomhdprhgtphht
    thhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtg
    hpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdr
    tghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:RDT7aSnHEh1q6H_8MsXynIU4dHLYRkYJO7rtN_jR7bEHKEOAsHTd3g>
    <xmx:RDT7aVjbX9u1cxUTywQq-2xqvo44B515EMQNsquU4BenH_empGYChQ>
    <xmx:RDT7adF1djyb3-nRA2PJ7ppNKnLD7BlgwohUEREQexr8plt5vZaoDg>
    <xmx:RDT7afvHE2Mf-boGo04ElYDuaQ6B7HKIwbLKWNiyvvH0zv62lwYR5A>
    <xmx:RDT7adJhnT1SVy2SqBDSm02csxBJeCGuqRtmTVJaYZqg2Uxxjy_iSf5x>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 May 2026 08:29:55 -0400 (EDT)
Date: Wed, 6 May 2026 14:29:54 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v8 00/14] media: Add support for R-Car ISP using Dreamchip
 RPPX1 ISP
Message-ID: <20260506122954.GL683841@ragnatech.se>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUGo0G1ZjuXa=PA_2fa8JpU+z6gbp-Dh4FWPK69V4SvJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUGo0G1ZjuXa=PA_2fa8JpU+z6gbp-Dh4FWPK69V4SvJQ@mail.gmail.com>
X-Rspamd-Queue-Id: 731754DA37F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60587-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,linux-m68k.org:email,messagingengine.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Geert,

On 2026-05-06 14:19:28 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, 4 May 2026 at 03:08, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > This series adds support for two different devices that together enable
> > ISP support on Renesas R-Car Gen4 ISP processing. The first driver added
> > is for Dreamchip RPPX1 ISP, this device purely deals with image
> > processing algorithms, statistics and image conversion; but have no DMA
> > engines. The second driver is for the R-Car ISP CORE, this device
> > deals with DMA to/from the RPPX1 ISP and provides a V4L2 user-space
> > interface for the ISP.
> 
> Thanks for your series!
> 
> > This series depends on the ISP extensible statistics definitions
> > out-of-tree patches.
> 
> So that is:
>   1. "[PATCH v1 00/11] media: Add iMX95 neoisp driver"
>      https://lore.kernel.org/20260413160331.2611829-1-antoine.bouyer@nxp.com/
>      for v4l2_isp_block_header,
>   2. Jacopo's reply https://lore.kernel.org/aeHd0G_JDaROMWDd@zed/
>      for v4l2_isp_buffer_size.
> 
> However, that still leaves me with undefined struct v4l2_isp_block_type_info,
> and lore couldn't help in locating the patch series that adds it :-(

As Jacopo have kindly pointed out to me in private, this work was based 
on an early version of [2] that was not published, but as I found [1] I 
thought it was.

I will rebase this on [2] and address Jacopo's comments and repost.

> 
> Where can I find it? Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

