Return-Path: <linux-media+bounces-61509-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPWSG9PMBGrMPAIAu9opvQ
	(envelope-from <linux-media+bounces-61509-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:11:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C16539A87
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2B8D305D9CB
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0C43B0ADD;
	Wed, 13 May 2026 19:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ol0wKIf/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EHKq4Vqp"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2C218E025;
	Wed, 13 May 2026 19:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699279; cv=none; b=kgdsL+0eRoF8x0uT9Qj9SY3lm29Q0tQCOGEi4DLoWd8Nv1IKmI6Umwy+E3FpXJJLt5rf5X+DnZHNwi44sPmYorj6SBvbjRoY36alkGtyv2cuhynW3gh1wmv6tJZuo1aN/2kpsp1RTFqAI0MMhVnqgGla7glVHmUpIO8jCm6BPi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699279; c=relaxed/simple;
	bh=9dyW0i1uEyQbY20h8QmZQNdlAA8PYklMtMjKAtEbdO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAf61v5jCqz8rSMTY9RjjZ6QIJxyE667VTZ+f8ZzhOR+SsbKH1h9Ku18cVvf2eJr6PjPxu75wcl9yHS8jTNc+EPtQD9vI75p5yKvt5jIXHsHyGGMrtA/VKr3Wh17dkf+UGBC8La8mEv+avi3cmKMZciQGnkNtXl9MXThxdUCz8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ol0wKIf/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EHKq4Vqp; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id B21E6EC0237;
	Wed, 13 May 2026 15:07:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 13 May 2026 15:07:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778699276;
	 x=1778785676; bh=Pdi+Fsgqu8rY3Pf5OyrhZJWHhF8X8iBfSSYCAuxhxlg=; b=
	ol0wKIf/gpMAtWYrv44KmJAKVKUzOIlDDb86vUCuYBUz9XctmJOaZz03kXdf2hhI
	KwSreF7bKTWCEjnFLoCr9JErM3rsiY+R0MxfG1Z6oXWXkKoJXgsBKgoSmBr5YxqF
	iaxZOdHc73YshYrQtL7MHdZJ2zFs6zXQVBczH+pOFDS6s76MzAngvibxlb0KQdST
	5Bl/Sz3i7JeGKIyK++ahs0+N8wGi2Ssl3HILAwA9GCgKqvRicYTMIdLe4eKXyVab
	wdfg/StyOqZW0uHMfb4Z82+Dli7ZYoNoPlkTKL1UAcT492fZ2ow5wzvKFwE6ee2a
	YI9TKVxPafbdq3AouV9Iyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778699276; x=
	1778785676; bh=Pdi+Fsgqu8rY3Pf5OyrhZJWHhF8X8iBfSSYCAuxhxlg=; b=E
	HKq4VqpPyeIumW7itoOq9YLD5zxZ/r/c1P4V7+c3salqwsICZ4ph7aCUCggpk+wC
	bm3GImR/HdWYqqxFP0Ov65JhAJb5qpNOH/SwYOwLP/wyNvQzcqm3EhgbfOk005Nj
	nbAGDrtLfxQu/ZdoNnSvAWnhuibkTiue7ZVffnveBJpeOE+uXeqxKjnf2VFXOx+Q
	+tvQXVjZcISHS9N/d2t8oCcdc5pDZlxdcYd+T6+kdb006hx0Udh6cIR23mKSIiyg
	r97efbS6SOtVPYA7dLgTtGI6AgihK3JT4H0Ci8OfJyTPyrh+eQAusX2/S/iB+Fq9
	ZnK/IblXI6Tp2FGvcNBBQ==
X-ME-Sender: <xms:C8wEaujnYTHeuiHQEQFeS-vTr3QlFaSOlql8-X2mtvLYH6dGfxlKCA>
    <xme:C8wEakmNnarw3p7kFILhaCQEakXPzZfdFF0WggZXtqHWlVRXnXOfspx78GenOJIBR
    OESoBy2qOoFshd7__5TcOMM1Z8GgW_uaNTdvIpJ0Z3RgXHAT2FWboY>
X-ME-Received: <xmr:C8wEavpFotMsX-M3tAdfCZjyh-ftFkAgflVetkaR55Di61zWZgoR_XESHIiRnT7QAoUO610LMSOb3AdtPzC_wmyNvCioxj5IFhUX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdehgeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepphhrrggshhgrkhgrrhdrtghsvghnghhgsehgmhgrihhlrdgtohhmpdhr
    tghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtodhrvghnvghsrghssehiuggvrg
    hsohhnsghorghrugdrtghomhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvg
    hnodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehm
    tghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvg
    hsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhm
    rghilhdrtghomhdprhgtphhtthhopehhvhgvrhhkuhhilheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:C8wEaoKl9BQLrMmL5ZghS-xDrgWeWDowyfHlIb_lAOrUFh_6_7AE7A>
    <xmx:C8wEajBgsX4iiPR2LVd3zZrdoFldgF7CAAsODVjSwDJB1PEyU6vGPw>
    <xmx:C8wEai5gl2sAZnhhJXQ45kKy8R7sCJXuki8g3rUwQIpbhFYYoGsTTQ>
    <xmx:C8wEanGFRC6LLGjA23CAZKcTCEYPYMdrhIBYubNrE7moOuiURqjXdQ>
    <xmx:DMwEamEYXBrxGJGl7pC6hWx1rJl4ywUbIDK9qIrZvtmwkzph3ObMZC-z>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 May 2026 15:07:55 -0400 (EDT)
Date: Wed, 13 May 2026 21:07:52 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Enable NV12 support for RZ/G2H
Message-ID: <20260513190752.GC332351@ragnatech.se>
References: <20260512202931.1051379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512202931.1051379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Queue-Id: F3C16539A87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-61509-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim,renesas.com:email,messagingengine.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello Prabhakar,

Thanks for your work.

On 2026-05-12 21:29:31 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The Renesas RZ/G2H (R8A774E1) SoC supports outputting NV12 format, but
> this capability is currently not advertised by the driver.
> 
> Set the .nv12 flag to true in the rcar_info_r8a774e1 structure to enable
> support for this format.
> 
> Fixes: fe98df32bd9e4 ("media: rcar-vin: Enable support for R8A774E1")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index c8d564aa1eba..e16b33096fd2 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -925,6 +925,7 @@ static const struct rvin_group_route rcar_info_r8a774e1_routes[] = {
>  
>  static const struct rvin_info rcar_info_r8a774e1 = {
>  	.model = RCAR_GEN3,
> +	.nv12 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a774e1_routes,
> -- 
> 2.54.0
> 

-- 
Kind Regards,
Niklas Söderlund

