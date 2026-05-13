Return-Path: <linux-media+bounces-61514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC4LIUXQBGr0PQIAu9opvQ
	(envelope-from <linux-media+bounces-61514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:25:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F15539EA9
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ED4F300737D
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7913ACA45;
	Wed, 13 May 2026 19:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mOmLSYuV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rO5/iAd4"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E683B19D4;
	Wed, 13 May 2026 19:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699557; cv=none; b=nlYrZigyW67YGLHEQxzeWmpO6uZuIe9gDaJAUOjA7iW2GQNzS+Rw/ARx1/jx8ouFzzKi3oGHGzHWlQzPl9CCx34DwsrMPghOFS7/MdsvQUI0XEYZLcsAWQswHz/oFZDgvmrAkeCB41KZ+L7AW/ZBLVK1PCNAetzu3WTj79w2fK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699557; c=relaxed/simple;
	bh=87iR7z5ZygjWgw4k70KRp480uELj77LURdQ3phAq0B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQ44bQ5eMy9Od8Egzxj04CD9QCHwsbVbkgTp1Gjl+eQUGucSjLz878J7tjGOnYbllHyNrimjHQ3HA12a5JgLZnlP9vE7rr6o+v+OlgOA7ml1lMDBwcBky06xQ5NLS87BzBvUXgKKjwMIUCs5oxUPzTWbn0rce2+4poY57mriyT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mOmLSYuV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rO5/iAd4; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EFEC51400202;
	Wed, 13 May 2026 15:12:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 13 May 2026 15:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778699553;
	 x=1778785953; bh=q25iakKJmoiLl9H91Yu810a7GAJsYzUQnoytW7Rifzo=; b=
	mOmLSYuVf1SKMa+Hc049Tj0N5dPni9zcm/w1GpSfsSz15bbQzpTrFayarRKJS3g9
	w595BPWtz88ZW9QHRALbr/+U4yvjdmyffghfxnv/ubVfUSQ+cPlNCQunAaWY6t8N
	RXJciVOSsgiBCVZ/10PgC9wcoGV2udh5bQKSJs815dYR0m/NIlyxIdAKxyq3X/F+
	x1enye8PSM/iRrjZiHbPo+b+X2DMR0JkA+qBupZm0LyWmpS9kuOFV8cI44YjgEh7
	dqQzvgiOag0tkRp7rSIWW76QeTOmFZrt0zGfh/JJqTV85WjquP9IvhDJqEkOQCYG
	L190/VxzOL3zFyEOfgF+YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778699553; x=
	1778785953; bh=q25iakKJmoiLl9H91Yu810a7GAJsYzUQnoytW7Rifzo=; b=r
	O5/iAd49HVicS6gY7ZgkGBdMmny4vcZBR+Yl24ivbtDu8uQnxFOB6iEdLVBF/DL3
	jabUncjkYrjogSPRvnyJm4ms6XO7lwnxKvvpgK16J1A/Ld/3XXZQ6GsHWMxTRM+Q
	fRvj7/5ZEXYBLsgJF4TPJseCxOCL+l2Sv4+jEEgWX4o82hT9CjRD6NjfK/ieySoz
	8z6kinX40q0zqEW3tF0NfuRxzNHVp39YicoPh2NotmPpW/pe/BcnblGi7WHeaB97
	H34aHo9wKK9APcnhzSxVWiky0s03/ztDiy9XE1kt2d7p8qeWec85NEnzrsb212Q9
	Niv928dFfx5p+D57jwkRg==
X-ME-Sender: <xms:Ic0EaqL_VM7CR413NB8Cah9SPxYPheKo_kMRsRwW5Uc7Lkbtes5J8w>
    <xme:Ic0EautKANVu7hLK8E24SuhktluVRrxmnUM8zPfsL-FmAPinW6aSmUSCQcI6CGws7
    lM__d51CNnWjcGsJHjFL0t3-dLYzeCHefOMbXtsJ_bRZSpJC38J8Og>
X-ME-Received: <xmr:Ic0EavJAuUJcYhUGhhrV9yyedf8sSJ0bd6HwKoZ3AF2OT5xJUrx6cwoo1n9OzkuXJaTMaYLH5n49pjKEqZYUaUjEaoOvhnAm3bJC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdehgeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthdorhgvnhgvshgrshesihguvggr
    shhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhs
    rdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvsh
    grshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdr
    vhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepkh
    hivghrrghnrdgsihhnghhhrghmsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphht
    thhopegsihhjuhdruggrshdrjhiisegsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtth
    hopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehf
    fhiflhhlrdgthh
X-ME-Proxy: <xmx:Ic0EamMUx8SmCtBv4f2uoVmzCwXhUsVDiaAl8qOVAZhFXbYf2ELxPw>
    <xmx:Ic0EaiV4dqaJJ0BJ3GrreUd8SJ6vMTlsgiVOODIFY1ronnwy7MSDHQ>
    <xmx:Ic0EakndgAH46b1qoftMd2_ydxh8CkOvw0aOXtpiJ66Rn5tm5o65TQ>
    <xmx:Ic0EahM3uksMmAFkh5tFbCCGhHiJRgkXa0nSVFgs5TLvbhi2c1hI9A>
    <xmx:Ic0EapRKixxPUGevE0rM5GBiIVe3HLvZD5ukfV4aWKvrAP0L4YmrcwaX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 May 2026 15:12:33 -0400 (EDT)
Date: Wed, 13 May 2026 21:12:32 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 03/11] drm: renesas: rcar-du: Switch to new VSP API
Message-ID: <20260513191232.GF332351@ragnatech.se>
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260511235637.3468558-4-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511235637.3468558-4-laurent.pinchart+renesas@ideasonboard.com>
X-Rspamd-Queue-Id: D8F15539EA9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,ideasonboard.com,bp.renesas.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61514-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim,messagingengine.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Laurent,

Thanks for your work.

On 2026-05-12 02:56:27 +0300, Laurent Pinchart wrote:
> The vsp1_du_setup_lif() function is deprecated. Use the new
> vsp1_du_enable() and vsp1_du_disable() functions instead.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> index a4a49dcd8233..5cfb4d50bc67 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> @@ -87,12 +87,12 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
>  
>  	__rcar_du_plane_setup(crtc->group, &state);
>  
> -	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
> +	vsp1_du_enable(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
>  }
>  
>  void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
>  {
> -	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
> +	vsp1_du_disable(crtc->vsp->vsp, crtc->vsp_pipe);
>  }
>  
>  void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc)
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 

-- 
Kind Regards,
Niklas Söderlund

