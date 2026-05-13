Return-Path: <linux-media+bounces-61515-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCIUNbLOBGr0PQIAu9opvQ
	(envelope-from <linux-media+bounces-61515-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:19:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B44A539CC9
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D87A2303B839
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941883AD516;
	Wed, 13 May 2026 19:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="UUcrX97f";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KHVf0XrB"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C199638737B;
	Wed, 13 May 2026 19:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699592; cv=none; b=EEO41uYGrs5Stkf0cQFJE3U/qp/VqPUTvU3OgJzSlrd9nm+h3+qDDBEMmx3Q1B0vREM3bJZs34Pn4kJushg0EyIi+Pp5nbtkb9WZXOmmYTHw2+sbjR2h1n0bllPOGHcGv+5iVjTp93rN596tlgEwAZdWJ/CnfC5L6F8KM5buDD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699592; c=relaxed/simple;
	bh=k3tRNquu/ky2nDinmsHC37axJbctMMZt6furuyucWP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0Rs6glxRCiH5TX1KfPJM16JlZy3aL0XRtSIvx5uOohUmghYFUpMYY5xNnI3Bc1aZ7MLVOXG6otKIfzhPV5LSgfmqtEesoMFRuN9UTihxBKXTOn3OkWg3cCs3nkgQsY/tmm/mU9kuw9ppOmu0U7RAN12kDHYLCp5cEXkH5fDsZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=UUcrX97f; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KHVf0XrB; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id E8EAAEC00DF;
	Wed, 13 May 2026 15:13:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 13 May 2026 15:13:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778699590;
	 x=1778785990; bh=hFSkC2f1bbi8Np9MfeUj+ngXepPzDLqhURPaKLcijYU=; b=
	UUcrX97fZA1UnFEAmycSiJD5QSrHWKb7VNQyqqn0kDmchRoOU0B3VmM2q/kgmm2J
	Lz3uecegItmtiPliE1fXR155nRwaCTdHLdahlrcJhke7wZ5CQYA1YnmBqHSmOHz9
	xJkibz28g74SYJA4DsZ6CnzXPHSDT9t5D7AqejstCIXDVibG0IpTApjfRiB3NFAg
	DdWCqAot5en/IwnteNM+aYZYZYKfdoLS06LGvX/YsCvphe9gJEj6FUk5f9Dqs7QA
	+sdUz6i5FJvmK87Um79C+L0WO7KS+DdNoAMPa9n68RAEDCIsGQR5A1MoIxXEY7Ei
	Gg/8wMBolqCEXi6ziw+1eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778699590; x=
	1778785990; bh=hFSkC2f1bbi8Np9MfeUj+ngXepPzDLqhURPaKLcijYU=; b=K
	HVf0XrB0nw89Z/I0GUdu8d9GUwkw8LwiJBCjjEJso5glrCIlkSbonn14G85qcaTM
	TqZJH8+6kElPALcoWlCNM3MlxdD7mpWLW699nksrK2OkTZeL2N4NQ3V7FlZG2t3s
	jXujfiyuoM406Bgz1rIeddywntHG5QJDmKhUf0sP+8hpAKUOYEYR94TBCyaKeyYD
	1q0rdXGd6gy9VzN13srax4387sKkgXycbVNpgRGH/HgOiQtCIGWKe5lPQUDHe55H
	4iJURUgD7MnzeUzI0cdKBhIpgifsn08jXB2vHA5HTjA+xTV1oREVESFAo8JawB7Z
	GlpmwRqU/X1gvQUaEvI8A==
X-ME-Sender: <xms:Rs0Eau_rquKkp-yQw9UIYXU9yEY_4OQ-44btaUVmwlxamFh9rqjG3w>
    <xme:Rs0EarQV30yuaxzrHnsz2IEXZH7-EPQDN8zL5l7e095hh1dNuMAL4lZ-KgU_M-ztZ
    17eQeJ0q7O3tU-IZG1KMVtVJLOf580qIDClCxrF1VNrd--wtNfv9Q>
X-ME-Received: <xmr:Rs0EaocuErbSUvJnZsqAgbYISUCpd92v0qL18e52eHASY-CiLjRvj3Ya_JZvZ44SH5igFVi8Lfhkok5WLnH_lLk9yuCE9KcTyE0T>
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
X-ME-Proxy: <xmx:Rs0EatQadAIQoLQ6p3URumPtHRIO9nNjPJ8xLDxxbNCK2L1qcDCy6Q>
    <xmx:Rs0EakK8F0vWlEsIGaRPtbId82OH65flsGKVXYDfzEza9TSi6Ylg2Q>
    <xmx:Rs0EaqLrGO6stRQJ3-JSMK6ENsQ6tmCVnRhaEXCCKGHFdwgKSpMLzA>
    <xmx:Rs0EavhIaA14B9CFLAoShpDuzyu9R24KvUPBXAS8_bzMhlRV_ZYNUQ>
    <xmx:Rs0Ean1n61-pkY_YFf7D8UuuK-qI5fmiZkt9TQcijno7kyKRraGhuQDB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 May 2026 15:13:10 -0400 (EDT)
Date: Wed, 13 May 2026 21:13:09 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 04/11] drm: renesas: rz-du: Switch to new VSP API
Message-ID: <20260513191309.GG332351@ragnatech.se>
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260511235637.3468558-5-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511235637.3468558-5-laurent.pinchart+renesas@ideasonboard.com>
X-Rspamd-Queue-Id: 7B44A539CC9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,ideasonboard.com,bp.renesas.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61515-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim,ideasonboard.com:email]
X-Rspamd-Action: no action

Hi Laurent,

Thanks for your work.

On 2026-05-12 02:56:28 +0300, Laurent Pinchart wrote:
> The vsp1_du_setup_lif() function is deprecated. Use the new
> vsp1_du_enable() and vsp1_du_disable() functions instead.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Biju, I would like to merge this for v7.2 through the media tree instead
> of the DRM tree. Would that be OK with you, or do you expect conflicting
> changes to the rz-du driver for v7.2 ?
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> index bd486377f037..d5a1d36db2c1 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> @@ -55,12 +55,12 @@ void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
>  		.callback_data = crtc,
>  	};
>  
> -	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
> +	vsp1_du_enable(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
>  }
>  
>  void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
>  {
> -	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
> +	vsp1_du_disable(crtc->vsp->vsp, crtc->vsp_pipe);
>  }
>  
>  void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 

-- 
Kind Regards,
Niklas Söderlund

