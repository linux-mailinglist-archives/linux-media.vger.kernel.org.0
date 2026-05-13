Return-Path: <linux-media+bounces-61520-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PtlMDXRBGr0PQIAu9opvQ
	(envelope-from <linux-media+bounces-61520-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:29:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E93D539F4E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E71AB302A1BB
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4463B52FF;
	Wed, 13 May 2026 19:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="K03akZj5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ayNgYVAt"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990A53911A8;
	Wed, 13 May 2026 19:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700592; cv=none; b=UmQ1Rl2RBeZj8GCfeHXaXVbDD7ISxL1KTc/6EUo4Y4MALK1BBjaKqsfxjqglpT+zN9DkmLWia2PmXD39eGsYvyM6gq6oOTflwSV7yku9iM2dqqdl79jZwbcDj6YgwtTeb/NjvS+lyXyRkTjKrcmP5kBJ/FvjjlM4MyOVbx4SiI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700592; c=relaxed/simple;
	bh=wK1RYSXv+psaHWoBl6/DUI6tkif65yKqFm9rEulFbnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUzQlL8JfAL151MsODW7dVA4+yhzI8/VlZBlwCm2XaeAnHAz1tLC4pPtyhk8QYaYNpo7Y5br7wzaghhu3PGmzxDyDolmSk4jNmfKUoTLurYQ9VOSptHwQB9gbN/N+kykNUwAvqHfc1n4Jlo2yoRl7JuscZdLF0U0neIKSF3JiwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=K03akZj5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ayNgYVAt; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E02381400174;
	Wed, 13 May 2026 15:29:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 13 May 2026 15:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778700589;
	 x=1778786989; bh=CdMuDRPLzXXsMqTH2LrTi+iM4eaNqLP7/cvENwR3dWU=; b=
	K03akZj5ujSx0qZ8Mrw/yEzL0yAF0JJ4LbMrQzmZePrsxkjCoEXrjyOSc4BoBazU
	9GjaJz2F3N+k9cKFixMPLvxYGDw0VhTeQ+UGlc8AR/lLiq3blQlrlJvcnEyZiRVP
	MQ8BvRZJGrnJC64ri/jrvff0UhCDweDo8l7XVSvh35PN5nnKl0NZVJlVHbsG3rZE
	o4alx++rwIFux29czvo9mEh6z9kyS3cb4Bq812Cc/XejxsOOQpb/qf+hg11if6xr
	bIBDMD9k7YjnLYGZwKm451la1/L60djZvKDy/lhB5sxeeZzbvXFZHxrAYo66F9Np
	SFWrkwba5eITKInP9Kf94w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778700589; x=
	1778786989; bh=CdMuDRPLzXXsMqTH2LrTi+iM4eaNqLP7/cvENwR3dWU=; b=a
	yNgYVAtL+funpZEQ//UxLPA3VfVolGPF0lqlGtzHIidtEMrtPPIuunwSgnzR/1XB
	6gKHFoOMgqk30KHOXi9mNymSP57q4mmLslydkHdRbtS2UvKl2FKsoojh4O899Xxm
	pdxt1/8ZPbQyY7idjjDCy/SEovhI/7q8B+ZzO2pboePOKbEUMEuvhCjnmpXEPxAv
	A2Cms19Mt/plCg796UyEu6MXMG8dyBkgThyeVuXNw7cWZuy0zKWc24dDfEH3hWY9
	eq3ETBxw9XHTo0YgriSRSiE+USHSORwY9THGsatWDrpsoeL8M3HoWBdpSpmR+14n
	WjxMQAahVhaXZKbcRlLFw==
X-ME-Sender: <xms:LdEEapdu2k0S6nZmHdyL_ezK-MzoPi5zAj1D3OZito2EC2R3W62oPQ>
    <xme:LdEEajynXMJRMEL0rNt2RwIsvXaFJmpsLgVl2nvgn3S_GaG73Snuhl03aWJN1Hagc
    xylv2oarBC56JyU1qYzwo6zv_R30LUoHxYkm_ONxMUkhEI7_jVPfG0>
X-ME-Received: <xmr:LdEEam9Vqaa98jedMMF0Jth83azjJyCIRgvM6yJMllISTXpJ4i4c1XzNVzm9Qn0wO50uS6X_0E5G_uSM7PCyaFfJGL693iR9LFr8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdehgeelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:LdEEapwbpE02ZqmDWmH1NeP6BOARPXuLsPmfn2ql7LZjomLCgyPE6Q>
    <xmx:LdEEamrBm5fS65StbDQ546uYwOj0j1bucs_f7HenJ-aYGhWTV6-rTQ>
    <xmx:LdEEaqoN0Y_MRXJMdp2XSd3r20W6jvM_Tnvz8EJ5NOecIl0A5it1zg>
    <xmx:LdEEamD2wab-x3cL4pY3HgrDvS-p8wADw8FcCRjjSG67o6JnkrwrNg>
    <xmx:LdEEagUyEpKPaxfHVDbYykTuEjp3g6ncNDFYT4E8XN6GSsok6b2uphhm>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 May 2026 15:29:49 -0400 (EDT)
Date: Wed, 13 May 2026 21:29:48 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 07/11] media: renesas: vsp1: Use spinlock guards
Message-ID: <20260513192948.GJ332351@ragnatech.se>
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260511235637.3468558-8-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511235637.3468558-8-laurent.pinchart+renesas@ideasonboard.com>
X-Rspamd-Queue-Id: 3E93D539F4E
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
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,ideasonboard.com,bp.renesas.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61520-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim,messagingengine.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Laurent,

Thanks for your patch.

On 2026-05-12 02:56:31 +0300, Laurent Pinchart wrote:
> Replace manual spinlock locking and unlocking with guards. This
> simplifies error paths and reduces the amount of code. Limit the changes
> to locations where the guard covers until the end of the function to
> ease review. Scoped guards will be introduced separately.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_dl.c | 49 ++++++-------------
>  .../media/platform/renesas/vsp1/vsp1_histo.c  | 20 +++-----
>  .../media/platform/renesas/vsp1/vsp1_pipe.c   |  9 +---
>  .../media/platform/renesas/vsp1/vsp1_video.c  | 14 ++----
>  .../media/platform/renesas/vsp1/vsp1_wpf.c    |  4 +-
>  5 files changed, 31 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> index 6c5578d9d2de..4a19ff1437b0 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> @@ -336,9 +336,8 @@ void vsp1_dl_body_pool_destroy(struct vsp1_dl_body_pool *pool)
>  struct vsp1_dl_body *vsp1_dl_body_get(struct vsp1_dl_body_pool *pool)
>  {
>  	struct vsp1_dl_body *dlb = NULL;
> -	unsigned long flags;
>  
> -	spin_lock_irqsave(&pool->lock, flags);
> +	guard(spinlock_irqsave)(&pool->lock);
>  
>  	if (!list_empty(&pool->free)) {
>  		dlb = list_first_entry(&pool->free, struct vsp1_dl_body, free);
> @@ -346,8 +345,6 @@ struct vsp1_dl_body *vsp1_dl_body_get(struct vsp1_dl_body_pool *pool)
>  		refcount_set(&dlb->refcnt, 1);
>  	}
>  
> -	spin_unlock_irqrestore(&pool->lock, flags);
> -
>  	return dlb;
>  }
>  
> @@ -359,8 +356,6 @@ struct vsp1_dl_body *vsp1_dl_body_get(struct vsp1_dl_body_pool *pool)
>   */
>  void vsp1_dl_body_put(struct vsp1_dl_body *dlb)
>  {
> -	unsigned long flags;
> -
>  	if (!dlb)
>  		return;
>  
> @@ -369,9 +364,9 @@ void vsp1_dl_body_put(struct vsp1_dl_body *dlb)
>  
>  	dlb->num_entries = 0;
>  
> -	spin_lock_irqsave(&dlb->pool->lock, flags);
> +	guard(spinlock_irqsave)(&dlb->pool->lock);
> +
>  	list_add_tail(&dlb->free, &dlb->pool->free);
> -	spin_unlock_irqrestore(&dlb->pool->lock, flags);
>  }
>  
>  /**
> @@ -493,9 +488,8 @@ static
>  struct vsp1_dl_ext_cmd *vsp1_dl_ext_cmd_get(struct vsp1_dl_cmd_pool *pool)
>  {
>  	struct vsp1_dl_ext_cmd *cmd = NULL;
> -	unsigned long flags;
>  
> -	spin_lock_irqsave(&pool->lock, flags);
> +	guard(spinlock_irqsave)(&pool->lock);
>  
>  	if (!list_empty(&pool->free)) {
>  		cmd = list_first_entry(&pool->free, struct vsp1_dl_ext_cmd,
> @@ -503,24 +497,20 @@ struct vsp1_dl_ext_cmd *vsp1_dl_ext_cmd_get(struct vsp1_dl_cmd_pool *pool)
>  		list_del(&cmd->free);
>  	}
>  
> -	spin_unlock_irqrestore(&pool->lock, flags);
> -
>  	return cmd;
>  }
>  
>  static void vsp1_dl_ext_cmd_put(struct vsp1_dl_ext_cmd *cmd)
>  {
> -	unsigned long flags;
> -
>  	if (!cmd)
>  		return;
>  
>  	/* Reset flags, these mark data usage. */
>  	cmd->flags = 0;
>  
> -	spin_lock_irqsave(&cmd->pool->lock, flags);
> +	guard(spinlock_irqsave)(&cmd->pool->lock);
> +
>  	list_add_tail(&cmd->free, &cmd->pool->free);
> -	spin_unlock_irqrestore(&cmd->pool->lock, flags);
>  }
>  
>  static void vsp1_dl_ext_cmd_pool_destroy(struct vsp1_dl_cmd_pool *pool)
> @@ -611,11 +601,10 @@ static void vsp1_dl_list_free(struct vsp1_dl_list *dl)
>  struct vsp1_dl_list *vsp1_dl_list_get(struct vsp1_dl_manager *dlm)
>  {
>  	struct vsp1_dl_list *dl = NULL;
> -	unsigned long flags;
>  
>  	lockdep_assert_not_held(&dlm->lock);
>  
> -	spin_lock_irqsave(&dlm->lock, flags);
> +	guard(spinlock_irqsave)(&dlm->lock);
>  
>  	if (!list_empty(&dlm->free)) {
>  		dl = list_first_entry(&dlm->free, struct vsp1_dl_list, list);
> @@ -629,8 +618,6 @@ struct vsp1_dl_list *vsp1_dl_list_get(struct vsp1_dl_manager *dlm)
>  		dl->allocated = true;
>  	}
>  
> -	spin_unlock_irqrestore(&dlm->lock, flags);
> -
>  	return dl;
>  }
>  
> @@ -690,14 +677,12 @@ static void __vsp1_dl_list_put(struct vsp1_dl_list *dl)
>   */
>  void vsp1_dl_list_put(struct vsp1_dl_list *dl)
>  {
> -	unsigned long flags;
> -
>  	if (!dl)
>  		return;
>  
> -	spin_lock_irqsave(&dl->dlm->lock, flags);
> +	guard(spinlock_irqsave)(&dl->dlm->lock);
> +
>  	__vsp1_dl_list_put(dl);
> -	spin_unlock_irqrestore(&dl->dlm->lock, flags);
>  }
>  
>  /**
> @@ -937,7 +922,6 @@ void vsp1_dl_list_commit(struct vsp1_dl_list *dl, unsigned int dl_flags)
>  {
>  	struct vsp1_dl_manager *dlm = dl->dlm;
>  	struct vsp1_dl_list *dl_next;
> -	unsigned long flags;
>  
>  	/* Fill the header for the head and chained display lists. */
>  	vsp1_dl_list_fill_header(dl, list_empty(&dl->chain));
> @@ -950,14 +934,12 @@ void vsp1_dl_list_commit(struct vsp1_dl_list *dl, unsigned int dl_flags)
>  
>  	dl->flags = dl_flags & ~VSP1_DL_FRAME_END_COMPLETED;
>  
> -	spin_lock_irqsave(&dlm->lock, flags);
> +	guard(spinlock_irqsave)(&dlm->lock);
>  
>  	if (dlm->singleshot)
>  		vsp1_dl_list_commit_singleshot(dl);
>  	else
>  		vsp1_dl_list_commit_continuous(dl);
> -
> -	spin_unlock_irqrestore(&dlm->lock, flags);
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -991,7 +973,7 @@ unsigned int vsp1_dlm_irq_frame_end(struct vsp1_dl_manager *dlm)
>  	u32 status = vsp1_read(vsp1, VI6_STATUS);
>  	unsigned int flags = 0;
>  
> -	spin_lock(&dlm->lock);
> +	guard(spinlock)(&dlm->lock);
>  
>  	/*
>  	 * The mem-to-mem pipelines work in single-shot mode. No new display
> @@ -1001,7 +983,7 @@ unsigned int vsp1_dlm_irq_frame_end(struct vsp1_dl_manager *dlm)
>  		__vsp1_dl_list_put(dlm->active);
>  		dlm->active = NULL;
>  		flags |= VSP1_DL_FRAME_END_COMPLETED;
> -		goto done;
> +		return flags;
>  	}
>  
>  	/*
> @@ -1011,7 +993,7 @@ unsigned int vsp1_dlm_irq_frame_end(struct vsp1_dl_manager *dlm)
>  	 * and retry.
>  	 */
>  	if (vsp1_dl_list_hw_update_pending(dlm))
> -		goto done;
> +		return flags;
>  
>  	/*
>  	 * Progressive streams report only TOP fields. If we have a BOTTOM
> @@ -1019,7 +1001,7 @@ unsigned int vsp1_dlm_irq_frame_end(struct vsp1_dl_manager *dlm)
>  	 * next frame end interrupt.
>  	 */
>  	if (status & VI6_STATUS_FLD_STD(dlm->index))
> -		goto done;
> +		return flags;
>  
>  	/*
>  	 * If the active display list has the writeback flag set, the frame
> @@ -1058,9 +1040,6 @@ unsigned int vsp1_dlm_irq_frame_end(struct vsp1_dl_manager *dlm)
>  		dlm->pending = NULL;
>  	}
>  
> -done:
> -	spin_unlock(&dlm->lock);
> -
>  	return flags;
>  }
>  
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> index 72f6ef2fdc4f..97dbfb93abe9 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> @@ -35,20 +35,18 @@ to_vsp1_histogram_buffer(struct vb2_v4l2_buffer *vbuf)
>  struct vsp1_histogram_buffer *
>  vsp1_histogram_buffer_get(struct vsp1_histogram *histo)
>  {
> -	struct vsp1_histogram_buffer *buf = NULL;
> +	struct vsp1_histogram_buffer *buf;
>  
> -	spin_lock(&histo->irqlock);
> +	guard(spinlock)(&histo->irqlock);
>  
>  	if (list_empty(&histo->irqqueue))
> -		goto done;
> +		return NULL;
>  
>  	buf = list_first_entry(&histo->irqqueue, struct vsp1_histogram_buffer,
>  			       queue);
>  	list_del(&buf->queue);
>  	histo->readout = true;
>  
> -done:
> -	spin_unlock(&histo->irqlock);
>  	return buf;
>  }
>  
> @@ -68,10 +66,10 @@ void vsp1_histogram_buffer_complete(struct vsp1_histogram *histo,
>  	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, size);
>  	vb2_buffer_done(&buf->buf.vb2_buf, VB2_BUF_STATE_DONE);
>  
> -	spin_lock(&histo->irqlock);
> +	guard(spinlock)(&histo->irqlock);
> +
>  	histo->readout = false;
>  	wake_up(&histo->wait_queue);
> -	spin_unlock(&histo->irqlock);
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -123,9 +121,9 @@ static void histo_buffer_queue(struct vb2_buffer *vb)
>  	struct vsp1_histogram *histo = vb2_get_drv_priv(vb->vb2_queue);
>  	struct vsp1_histogram_buffer *buf = to_vsp1_histogram_buffer(vbuf);
>  
> -	spin_lock_irq(&histo->irqlock);
> +	guard(spinlock_irq)(&histo->irqlock);
> +
>  	list_add_tail(&buf->queue, &histo->irqqueue);
> -	spin_unlock_irq(&histo->irqlock);
>  }
>  
>  static int histo_start_streaming(struct vb2_queue *vq, unsigned int count)
> @@ -138,7 +136,7 @@ static void histo_stop_streaming(struct vb2_queue *vq)
>  	struct vsp1_histogram *histo = vb2_get_drv_priv(vq);
>  	struct vsp1_histogram_buffer *buffer;
>  
> -	spin_lock_irq(&histo->irqlock);
> +	guard(spinlock_irq)(&histo->irqlock);
>  
>  	/* Remove all buffers from the IRQ queue. */
>  	list_for_each_entry(buffer, &histo->irqqueue, queue)
> @@ -147,8 +145,6 @@ static void histo_stop_streaming(struct vb2_queue *vq)
>  
>  	/* Wait for the buffer being read out (if any) to complete. */
>  	wait_event_lock_irq(histo->wait_queue, !histo->readout, histo->irqlock);
> -
> -	spin_unlock_irq(&histo->irqlock);
>  }
>  
>  static const struct vb2_ops histo_video_queue_qops = {
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index aaec1aa15091..924e87f91903 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -487,14 +487,9 @@ void vsp1_pipeline_run(struct vsp1_pipeline *pipe)
>  
>  bool vsp1_pipeline_stopped(struct vsp1_pipeline *pipe)
>  {
> -	unsigned long flags;
> -	bool stopped;
> +	guard(spinlock_irqsave)(&pipe->irqlock);
>  
> -	spin_lock_irqsave(&pipe->irqlock, flags);
> -	stopped = pipe->state == VSP1_PIPELINE_STOPPED;
> -	spin_unlock_irqrestore(&pipe->irqlock, flags);
> -
> -	return stopped;
> +	return pipe->state == VSP1_PIPELINE_STOPPED;
>  }
>  
>  int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> index 138d4e08eee9..1e5d9e42cea0 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -667,7 +667,7 @@ static void vsp1_video_buffer_queue(struct vb2_buffer *vb)
>  	if (!empty)
>  		return;
>  
> -	spin_lock_irqsave(&pipe->irqlock, flags);
> +	guard(spinlock_irqsave)(&pipe->irqlock);
>  
>  	video->rwpf->mem = buf->mem;
>  	pipe->buffers_ready |= 1 << video->pipe_index;
> @@ -675,8 +675,6 @@ static void vsp1_video_buffer_queue(struct vb2_buffer *vb)
>  	if (vb2_start_streaming_called(&video->queue) &&
>  	    vsp1_pipeline_ready(pipe))
>  		vsp1_video_pipeline_run(pipe);
> -
> -	spin_unlock_irqrestore(&pipe->irqlock, flags);
>  }
>  
>  static int vsp1_video_pipeline_setup_partitions(struct vsp1_pipeline *pipe)
> @@ -778,14 +776,13 @@ static int vsp1_video_setup_pipeline(struct vsp1_pipeline *pipe)
>  static void vsp1_video_release_buffers(struct vsp1_video *video)
>  {
>  	struct vsp1_vb2_buffer *buffer;
> -	unsigned long flags;
>  
>  	/* Remove all buffers from the IRQ queue. */
> -	spin_lock_irqsave(&video->irqlock, flags);
> +	guard(spinlock_irqsave)(&video->irqlock);
> +
>  	list_for_each_entry(buffer, &video->irqqueue, queue)
>  		vb2_buffer_done(&buffer->buf.vb2_buf, VB2_BUF_STATE_ERROR);
>  	INIT_LIST_HEAD(&video->irqqueue);
> -	spin_unlock_irqrestore(&video->irqlock, flags);
>  }
>  
>  static void vsp1_video_cleanup_pipeline(struct vsp1_pipeline *pipe)
> @@ -807,7 +804,6 @@ static int vsp1_video_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	struct vsp1_video *video = vb2_get_drv_priv(vq);
>  	struct vsp1_pipeline *pipe = video->rwpf->entity.pipe;
>  	bool start_pipeline = false;
> -	unsigned long flags;
>  	int ret;
>  
>  	scoped_guard(mutex, &pipe->lock) {
> @@ -835,10 +831,10 @@ static int vsp1_video_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (!start_pipeline)
>  		return 0;
>  
> -	spin_lock_irqsave(&pipe->irqlock, flags);
> +	guard(spinlock_irqsave)(&pipe->irqlock);
> +
>  	if (vsp1_pipeline_ready(pipe))
>  		vsp1_video_pipeline_run(pipe);
> -	spin_unlock_irqrestore(&pipe->irqlock, flags);
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> index e7ed3c8e9e90..327c7457126f 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> @@ -111,9 +111,9 @@ static int vsp1_wpf_s_ctrl(struct v4l2_ctrl *ctrl)
>  	if (rotation == 180 || rotation == 270)
>  		flip ^= BIT(WPF_CTRL_VFLIP) | BIT(WPF_CTRL_HFLIP);
>  
> -	spin_lock_irq(&wpf->flip.lock);
> +	guard(spinlock_irq)(&wpf->flip.lock);
> +
>  	wpf->flip.pending = flip;
> -	spin_unlock_irq(&wpf->flip.lock);
>  
>  	return 0;
>  }
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 

-- 
Kind Regards,
Niklas Söderlund

