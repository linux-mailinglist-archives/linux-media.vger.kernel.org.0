Return-Path: <linux-media+bounces-23865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2EC9F9178
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBF7D1886F22
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28571C5798;
	Fri, 20 Dec 2024 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="eKwh3xhP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EEtcuSZ8"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6403E1C07CD;
	Fri, 20 Dec 2024 11:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694676; cv=none; b=P2pwnZqhk39YrGcqMDA+Ouq8KhHDUvGAblR1pQBAJSrYPS8SMiDkvGe9ZuAZNKIQ5sIp48FClDKGqnEun82Cbg/FDMj8FjC7S7N1a3eW0ZZVNDqrCR4C5Korew/2FUsSQHG/P9dFWrP5DfhAWwF07rAIp9yGiy1r87Uuqm9cd3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694676; c=relaxed/simple;
	bh=wuFGPhy9WZm5f+oeGzkf9TvXfz8DDZ7jl9+zKUXcsV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrL0q3/fIfiUHE6kv1HBabFTzVWK5u/x/mGComQAkyF5J7DtS0hzG9sQk+eQ6vbakQ1JsAfSgXGfsZxpNyHt39bsL5eM1lhekyboqshBcum/JhiXtel3csVUo9oc+5xVULoacpM61RYD2MD1PMFVcBSnFBBBjJmu5PX9iQgmJV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=eKwh3xhP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EEtcuSZ8; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 45B4711401CE;
	Fri, 20 Dec 2024 06:37:52 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 20 Dec 2024 06:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734694672;
	 x=1734781072; bh=Di6cLCqCm7jZ3LW3UbdfOWR9Pp66Myiu4Q6HCa2mYtE=; b=
	eKwh3xhPzBsXhhJkUgGMjQnNVb6LyXtPGMdpbJX4Kz+Dp5jdM+7AE8u1iuVM7pjh
	0YpjPTaxayCvCJc8XKm1LNq+4tBGJ3CmTRV2duUEsJEjFJRl+jojS3jxRhs3WJhg
	Yaajafbt8Xc4EtzGuWGRcdI/710F4kmI1wI0QppbCsnDaQeAix3MxAgSiaiP7WGE
	Yj//vq97PmW3MbCF2pbsJwENgCQZh8B7OUJsWVxUCE5YOFEj9f/HXzLEVLaYjDgx
	oJcGG3YS7nNBiy6kTzGbM4zutRPU6F6QAPi31h+6JzjKqpgfLLPMYPF08gv1KtUk
	WT8OjHeUmFa64NWQOAc+6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734694672; x=
	1734781072; bh=Di6cLCqCm7jZ3LW3UbdfOWR9Pp66Myiu4Q6HCa2mYtE=; b=E
	EtcuSZ8qf7F5CYw2Zsml5RgdLYQE/c14CrbzZokU+Yi5j0zNmAsw2sljtCUAifWp
	62VwpVe2afqFjpoyUlbebJaTGFr5ObOir/YFampzlMXCmM3vx3UdTlc2r41xwxrQ
	aMcw87AJsRu2vwKKRfdGCLsGqgEEhlpW498CcxWz4qoEViYZveWOXgmtVKSyddoB
	jk/UIeMV8SuzAj7B/Vw4guQ6Z/tkNHMyeqmht/nabsB3XCaKs3BK2eZt+Ba+fqul
	EoclyzgfPOuoXUFf8FGPdYAFSDj9k/f6l+NnIpNe8gYygFj2rQUyZAlQGQ3lg8+e
	WCYv4+IBlVzE8Lh3GnjXg==
X-ME-Sender: <xms:D1dlZyclykfNHfvPTl1w0KwKd5l40U6VMdyo1TD7hl1hge7CwPNq7Q>
    <xme:D1dlZ8P3XIiZ2ZkAvQCGpiFWyW1EtpqFGZyeaH9gE_iW1-KqhM-KPD4_U30OrvsVm
    Nuk6w0SYiqK4IlbPzY>
X-ME-Received: <xmr:D1dlZzgIUw_NL657y0sCKLEpVRK4yCrpdQXUQSQe-Fkb8s2C2yP9BUUeX3XFKc-pf1JFtWqnC8CMQ5j1j1KxLOM2NPHbsLASPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtvddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeeipdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehlrghurhgvnhhtihhurdhprghltghuseho
    shhsrdhngihprdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrd
    guvghv
X-ME-Proxy: <xmx:D1dlZ_87QIjQlUrlFUPegIhB1iLC8uxDckPLNPBDccWlOsJcsvAE4w>
    <xmx:D1dlZ-tpmGYMzk0LJVKLPTOXJI8K1inRB28zQDvXmYRLnh1g4ZfUTQ>
    <xmx:D1dlZ2HXmI0PVYnNwyyINDr-ECsnrrNyawwd3Sqw6r8jjaeFOC53AQ>
    <xmx:D1dlZ9NrnrnQSO4pNFxdsuG3MnWnWDCsoOACmj83YhuMTYE9Il3QJQ>
    <xmx:EFdlZygit-_Ny0hBi8YsBdsHVAeT_y4-cR3CkMA_oYetTFCzOt1_sXQ1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Dec 2024 06:37:51 -0500 (EST)
Date: Fri, 20 Dec 2024 12:37:49 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/3] staging: media: max96712: fix typo
Message-ID: <20241220113749.GC3634024@ragnatech.se>
References: <20241220104939.503547-1-laurentiu.palcu@oss.nxp.com>
 <20241220104939.503547-2-laurentiu.palcu@oss.nxp.com>
 <20241220105934.GB3634024@ragnatech.se>
 <km7kpbkmdzkkuta2jlr4eql437mfkpv7oeeub4iajqex3na4vr@hqyapkdocyzp>
 <skhr66jhvuaostv6w7dbddynpcqrmjsghelyp7lp73keqwar4b@nzfdlmrw4ts5>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <skhr66jhvuaostv6w7dbddynpcqrmjsghelyp7lp73keqwar4b@nzfdlmrw4ts5>

On 2024-12-20 13:23:37 +0200, Laurentiu Palcu wrote:
> ok, I figured it out... I had 'format' set in my ~/.gitconfig to
> us-ascii. :/ My bad after all. :)
> 
> Thanks for the heads-up.

No worries, thanks for figuring it out.

> 
> Do you think it's worth sending this patch-set again to fix that? I
> suppose it could also be fixed before pushing...

I see no harm in resending, you could collect my R-b on 2/3 as well.

> 
> Thanks,
> Laurentiu
> 
> On Fri, Dec 20, 2024 at 01:09:59PM +0200, Laurentiu Palcu wrote:
> > Hi Niklas,
> > 
> > On Fri, Dec 20, 2024 at 11:59:34AM +0100, Niklas Söderlund wrote:
> > > Hi Laurentiu,
> > > 
> > > On 2024-12-20 12:49:36 +0200, Laurentiu Palcu wrote:
> > > > Fix a typo in VS_LOW expression.
> > > > 
> > > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > > Reviewed-by: Niklas S??derlund <niklas.soderlund+renesas@ragnatech.se>
> > > 
> > > I think your mail setup mangled my döts ;-) The Content-Type header for 
> > > this mail is set to 'text/plain; charset="us-ascii"' while the patch is 
> > > likely utf-8 encoded. Same in patch 3/3.
> > 
> > Sorry about that. I didn't mean to mess-up your name... :/ Apparently,
> > this how 'git format-patch' generated the patch header:
> > 
> > ===
> > From 19c513feb2003dff89c28ef9e54c0e06929efb0a Mon Sep 17 00:00:00 2001
> > From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > Date: Thu, 19 Dec 2024 09:28:54 +0000
> > Subject: [PATCH v2 1/3] staging: media: max96712: fix typo
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=UTF-8
> > Content-Transfer-Encoding: 8bit
> > Content-Type: text/plain; charset="us-ascii"
> > ===
> > 
> > It looks like it generated 2 Content-Type lines. And the last one
> > took precedence... 
> > 
> > Looks like a git bug?!? I'm no expert in this area though.
> > 
> > Thanks,
> > Laurentiu
> > 
> > > 
> > > > ---
> > > >  drivers/staging/media/max96712/max96712.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> > > > index 0751b2e048958..5228f9ec60859 100644
> > > > --- a/drivers/staging/media/max96712/max96712.c
> > > > +++ b/drivers/staging/media/max96712/max96712.c
> > > > @@ -182,7 +182,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
> > > >  	max96712_write_bulk_value(priv, 0x1052, 0, 3);
> > > >  	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
> > > >  	max96712_write_bulk_value(priv, 0x1058,
> > > > -				  (v_active + v_fp + + v_bp) * h_tot, 3);
> > > > +				  (v_active + v_fp + v_bp) * h_tot, 3);
> > > >  	max96712_write_bulk_value(priv, 0x105b, 0, 3);
> > > >  	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
> > > >  	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > Kind Regards,
> > > Niklas Söderlund

-- 
Kind Regards,
Niklas Söderlund

