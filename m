Return-Path: <linux-media+bounces-61522-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFVXEOXTBGr0PQIAu9opvQ
	(envelope-from <linux-media+bounces-61522-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:41:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4068253A220
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D246C30069BB
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20233B7B76;
	Wed, 13 May 2026 19:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="i9tmdnos";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XEfQACeg"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD1F3B7B8E;
	Wed, 13 May 2026 19:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778701083; cv=none; b=XT6moJ8oqO8U9PO+S2e/EvzOhkYuTP1KL2J/uvfvRrQhWwnDSzsJRBjiDQHh8gh3PztXHf2en/oxXFSwwHPypkk+tOZKveH/6q4bha1Uw/Bbs/3O80zkIC+oxlXSm0YF5JKVXXKUjdWg4uKe7jxUJt7Ncg2EhkKSdCbtsFfxkzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778701083; c=relaxed/simple;
	bh=5Yci9E5HMxhSgay4e4NTpnBnuS/dzPjLS02cNWIEJQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g49+XspMn5peY30ThsTRvgLmmrvSEzXonGyaVb6abR5vqMbaUzYeYypo8bMWioxsRKYOQDGSraVO8TrJS3GfSw533w0sE3+cuA/zfVhodsJqegFM5EIZVEMlGr8L0RfPIiOMX8TyPwkc28S7H4lT9BVRH+/7rAAORpSTBOnGnNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=i9tmdnos; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XEfQACeg; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4AC9E14001FC;
	Wed, 13 May 2026 15:37:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 13 May 2026 15:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778701075;
	 x=1778787475; bh=wGLrKTZFbFtz28g83Fbb6opSBhXQm+Ur885sMoUpP6c=; b=
	i9tmdnosIswSUIw06Tt47s4/APoxq/qR9/VMnpu9MCbi44yohLBsopxYUGpuTZzD
	aRdtrqUfCeDtufybOp9tVHn5aApSmTEUus86bRfXt/mvET0dy63am7eKZ1gt17qF
	0qYElh9SY906/j05uK21MCohSiBFN7wrpHg7Fyr8/Go4Zyi+KyrgO9xOHtLvk6w5
	LTSFD26VmRozp9wWzIngO2NaP++g0y7mxRldopUjWGEsqcYlrFYRuIXOQFoZ13TG
	A6pYOI1TDzoHeT562UzNEjAtvuv6Wefs3Lt6izsfeGqdCl1uuqHSIdETjTkfBVZs
	jwkJsSmgdq+s/Ql4/FzllA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778701075; x=
	1778787475; bh=wGLrKTZFbFtz28g83Fbb6opSBhXQm+Ur885sMoUpP6c=; b=X
	EfQACegSCdZWpwMuMvijnjyP/HmoGyVaaW6nst7+RxP7O4hER8N2LASqCwuNDA7o
	iVm2LAntfQr74g2KJaBU5jccHZpi1IZ9Mdo8M3EWpDx72Ms9lBiE/ONc0ECt4NRk
	CqqhHmDMsRayyhtTQ2EPq9ljc5pup/yzj8mc8bbfBAXJIQ6Expw7viGBNr6F2Ftt
	6JFswvrOcuRF+YAAI6BfG/xOZVDoijbx+2rdQ/jtWnYXfXV3zdPLoAhPFHN5RtMj
	VxzOCk6R2+B6lFL7wQls23463WsHa9Y9xzqZZHAElclsq7fRJCTR4xJd2lQjAZDO
	gh23SCyjA7om1H0qxptXA==
X-ME-Sender: <xms:EtMEarX__VGm5kFHLBmROeuZcmtX0Y3t1t_mrn_7orphy5znPkI8cw>
    <xme:EtMEagJlikXzaZfyuhJ8IOU1OTlyqz8_EopTDcgGXeISXZROG76sHOSu7I-bkPLDM
    FtM6uIh1AVJ1mf6diLpeYfRU7ztTgIIL4xmYBWboT0yM32dO88UMaw>
X-ME-Received: <xmr:EtMEar0GK0BdE0nIzN6WIs1qOePJM4vQsRuRONgYyl0EE99qZVtRhdSZOjeCGVDHbVjTI9YyLewTS6ML6ZVB72an-m7awrNbgCSp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdehheduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:EtMEatKtEEfYFrL-CGXnJmQj462Wmp3EGFSJujpmgcTCEz8npKGC-g>
    <xmx:EtMEamiG-vOH81bt1ua3SdxTgfPx041Btl0RdsVBkoFlGRD1wIvZhQ>
    <xmx:EtMEatAhT-fOFdEAAdT4vPUoQwTxQ1BA8VxPM6nEmFDlsZTvLZ-Xuw>
    <xmx:EtMEao6ukrSClsEABnKSFmwnuRz-0hK7kvYSDhV1kdcTlFyrXqgMkA>
    <xmx:E9MEaouOj7DTnl6kJVYUNGfVn3L1O8vQ9woIMfPmUGzWfLlUm4xkca7f>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 May 2026 15:37:54 -0400 (EDT)
Date: Wed, 13 May 2026 21:37:53 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 08/11] media: renesas: vsp1: Use spinlock scoped guards
Message-ID: <20260513193753.GK332351@ragnatech.se>
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260511235637.3468558-9-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511235637.3468558-9-laurent.pinchart+renesas@ideasonboard.com>
X-Rspamd-Queue-Id: 4068253A220
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,ideasonboard.com,bp.renesas.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61522-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim]
X-Rspamd-Action: no action

Hi Laurent,

Thanks for your patch.

On 2026-05-12 02:56:32 +0300, Laurent Pinchart wrote:
> Replace remaining manual spinlock locking and unlocking with scoped
> guards. This simplifies error paths and reduces the amount of code.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>


> ---
>  .../media/platform/renesas/vsp1/vsp1_clu.c    | 15 +++--
>  drivers/media/platform/renesas/vsp1/vsp1_dl.c | 14 ++---
>  .../media/platform/renesas/vsp1/vsp1_drm.c    |  7 +--
>  .../media/platform/renesas/vsp1/vsp1_lut.c    | 15 +++--
>  .../media/platform/renesas/vsp1/vsp1_pipe.c   | 15 +++--
>  .../media/platform/renesas/vsp1/vsp1_video.c  | 59 ++++++++-----------
>  .../media/platform/renesas/vsp1/vsp1_wpf.c    |  9 ++-
>  7 files changed, 59 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_clu.c b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> index 04c466c4da81..a6e4bcab5101 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> @@ -53,9 +53,9 @@ static int clu_set_table(struct vsp1_clu *clu, struct v4l2_ctrl *ctrl)
>  	for (i = 0; i < CLU_SIZE; ++i)
>  		vsp1_dl_body_write(dlb, VI6_CLU_DATA, ctrl->p_new.p_u32[i]);
>  
> -	spin_lock_irq(&clu->lock);
> -	swap(clu->clu, dlb);
> -	spin_unlock_irq(&clu->lock);
> +	scoped_guard(spinlock_irq, &clu->lock) {
> +		swap(clu->clu, dlb);
> +	}
>  
>  	vsp1_dl_body_put(dlb);
>  	return 0;
> @@ -162,7 +162,6 @@ static void clu_configure_frame(struct vsp1_entity *entity,
>  {
>  	struct vsp1_clu *clu = to_clu(&entity->subdev);
>  	struct vsp1_dl_body *clu_dlb;
> -	unsigned long flags;
>  	u32 ctrl = VI6_CLU_CTRL_AAI | VI6_CLU_CTRL_MVS | VI6_CLU_CTRL_EN;
>  
>  	/* 2D mode can only be used with the YCbCr pixel encoding. */
> @@ -173,10 +172,10 @@ static void clu_configure_frame(struct vsp1_entity *entity,
>  
>  	vsp1_clu_write(clu, dlb, VI6_CLU_CTRL, ctrl);
>  
> -	spin_lock_irqsave(&clu->lock, flags);
> -	clu_dlb = clu->clu;
> -	clu->clu = NULL;
> -	spin_unlock_irqrestore(&clu->lock, flags);
> +	scoped_guard(spinlock_irqsave, &clu->lock) {
> +		clu_dlb = clu->clu;
> +		clu->clu = NULL;
> +	}
>  
>  	if (clu_dlb) {
>  		vsp1_dl_list_add_body(dl, clu_dlb);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> index 4a19ff1437b0..3dc74fed91dc 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> @@ -1064,17 +1064,15 @@ void vsp1_dlm_setup(struct vsp1_device *vsp1)
>  
>  void vsp1_dlm_reset(struct vsp1_dl_manager *dlm)
>  {
> -	unsigned long flags;
>  	size_t list_count;
>  
> -	spin_lock_irqsave(&dlm->lock, flags);
> +	scoped_guard(spinlock_irqsave, &dlm->lock) {
> +		__vsp1_dl_list_put(dlm->active);
> +		__vsp1_dl_list_put(dlm->queued);
> +		__vsp1_dl_list_put(dlm->pending);
>  
> -	__vsp1_dl_list_put(dlm->active);
> -	__vsp1_dl_list_put(dlm->queued);
> -	__vsp1_dl_list_put(dlm->pending);
> -
> -	list_count = list_count_nodes(&dlm->free);
> -	spin_unlock_irqrestore(&dlm->lock, flags);
> +		list_count = list_count_nodes(&dlm->free);
> +	}
>  
>  	WARN_ON_ONCE(list_count != dlm->list_count);
>  
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index 2b64d9b5a81c..f6fbd3475329 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -655,7 +655,6 @@ int vsp1_du_enable(struct device *dev, unsigned int pipe_index,
>  	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
>  	struct vsp1_drm_pipeline *drm_pipe;
>  	struct vsp1_pipeline *pipe;
> -	unsigned long flags;
>  	int ret;
>  
>  	if (pipe_index >= vsp1->info->lif_count)
> @@ -708,9 +707,9 @@ int vsp1_du_enable(struct device *dev, unsigned int pipe_index,
>  	}
>  
>  	/* Start the pipeline. */
> -	spin_lock_irqsave(&pipe->irqlock, flags);
> -	vsp1_pipeline_run(pipe);
> -	spin_unlock_irqrestore(&pipe->irqlock, flags);
> +	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
> +		vsp1_pipeline_run(pipe);
> +	}
>  
>  	dev_dbg(vsp1->dev, "%s: pipeline enabled\n", __func__);
>  
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lut.c b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> index 94bdedcc5c92..a22c31e17cb7 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> @@ -50,9 +50,9 @@ static int lut_set_table(struct vsp1_lut *lut, struct v4l2_ctrl *ctrl)
>  		vsp1_dl_body_write(dlb, VI6_LUT_TABLE + 4 * i,
>  				       ctrl->p_new.p_u32[i]);
>  
> -	spin_lock_irq(&lut->lock);
> -	swap(lut->lut, dlb);
> -	spin_unlock_irq(&lut->lock);
> +	scoped_guard(spinlock_irq, &lut->lock) {
> +		swap(lut->lut, dlb);
> +	}
>  
>  	vsp1_dl_body_put(dlb);
>  	return 0;
> @@ -132,12 +132,11 @@ static void lut_configure_frame(struct vsp1_entity *entity,
>  {
>  	struct vsp1_lut *lut = to_lut(&entity->subdev);
>  	struct vsp1_dl_body *lut_dlb;
> -	unsigned long flags;
>  
> -	spin_lock_irqsave(&lut->lock, flags);
> -	lut_dlb = lut->lut;
> -	lut->lut = NULL;
> -	spin_unlock_irqrestore(&lut->lock, flags);
> +	scoped_guard(spinlock_irqsave, &lut->lock) {
> +		lut_dlb = lut->lut;
> +		lut->lut = NULL;
> +	}
>  
>  	if (lut_dlb) {
>  		vsp1_dl_list_add_body(dl, lut_dlb);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index 924e87f91903..f9c7c75a7ad0 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -496,7 +496,6 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
>  {
>  	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
>  	struct vsp1_entity *entity;
> -	unsigned long flags;
>  	int ret;
>  
>  	if (pipe->lif) {
> @@ -510,16 +509,16 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
>  
>  		ret = vsp1_reset_wpf(vsp1, pipe->output->entity.index);
>  		if (ret == 0) {
> -			spin_lock_irqsave(&pipe->irqlock, flags);
> -			pipe->state = VSP1_PIPELINE_STOPPED;
> -			spin_unlock_irqrestore(&pipe->irqlock, flags);
> +			scoped_guard(spinlock_irqsave, &pipe->irqlock) {
> +				pipe->state = VSP1_PIPELINE_STOPPED;
> +			}
>  		}
>  	} else {
>  		/* Otherwise just request a stop and wait. */
> -		spin_lock_irqsave(&pipe->irqlock, flags);
> -		if (pipe->state == VSP1_PIPELINE_RUNNING)
> -			pipe->state = VSP1_PIPELINE_STOPPING;
> -		spin_unlock_irqrestore(&pipe->irqlock, flags);
> +		scoped_guard(spinlock_irqsave, &pipe->irqlock) {
> +			if (pipe->state == VSP1_PIPELINE_RUNNING)
> +				pipe->state = VSP1_PIPELINE_STOPPING;
> +		}
>  
>  		ret = wait_event_timeout(pipe->wq, vsp1_pipeline_stopped(pipe),
>  					 msecs_to_jiffies(500));
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> index 1e5d9e42cea0..b0eae54273a0 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -209,26 +209,21 @@ vsp1_video_complete_buffer(struct vsp1_video *video)
>  	struct vsp1_pipeline *pipe = video->rwpf->entity.pipe;
>  	struct vsp1_vb2_buffer *next = NULL;
>  	struct vsp1_vb2_buffer *done;
> -	unsigned long flags;
>  	unsigned int i;
>  
> -	spin_lock_irqsave(&video->irqlock, flags);
> +	scoped_guard(spinlock_irqsave, &video->irqlock) {
> +		if (list_empty(&video->irqqueue))
> +			return NULL;
>  
> -	if (list_empty(&video->irqqueue)) {
> -		spin_unlock_irqrestore(&video->irqlock, flags);
> -		return NULL;
> -	}
> -
> -	done = list_first_entry(&video->irqqueue,
> -				struct vsp1_vb2_buffer, queue);
> -
> -	list_del(&done->queue);
> -
> -	if (!list_empty(&video->irqqueue))
> -		next = list_first_entry(&video->irqqueue,
> +		done = list_first_entry(&video->irqqueue,
>  					struct vsp1_vb2_buffer, queue);
>  
> -	spin_unlock_irqrestore(&video->irqlock, flags);
> +		list_del(&done->queue);
> +
> +		if (!list_empty(&video->irqqueue))
> +			next = list_first_entry(&video->irqqueue,
> +						struct vsp1_vb2_buffer, queue);
> +	}
>  
>  	done->buf.sequence = pipe->sequence;
>  	done->buf.vb2_buf.timestamp = ktime_get_ns();
> @@ -656,13 +651,12 @@ static void vsp1_video_buffer_queue(struct vb2_buffer *vb)
>  	struct vsp1_video *video = vb2_get_drv_priv(vb->vb2_queue);
>  	struct vsp1_pipeline *pipe = video->rwpf->entity.pipe;
>  	struct vsp1_vb2_buffer *buf = to_vsp1_vb2_buffer(vbuf);
> -	unsigned long flags;
>  	bool empty;
>  
> -	spin_lock_irqsave(&video->irqlock, flags);
> -	empty = list_empty(&video->irqqueue);
> -	list_add_tail(&buf->queue, &video->irqqueue);
> -	spin_unlock_irqrestore(&video->irqlock, flags);
> +	scoped_guard(spinlock_irqsave, &video->irqlock) {
> +		empty = list_empty(&video->irqqueue);
> +		list_add_tail(&buf->queue, &video->irqqueue);
> +	}
>  
>  	if (!empty)
>  		return;
> @@ -843,16 +837,15 @@ static void vsp1_video_stop_streaming(struct vb2_queue *vq)
>  {
>  	struct vsp1_video *video = vb2_get_drv_priv(vq);
>  	struct vsp1_pipeline *pipe = video->rwpf->entity.pipe;
> -	unsigned long flags;
>  	int ret;
>  
>  	/*
>  	 * Clear the buffers ready flag to make sure the device won't be started
>  	 * by a QBUF on the video node on the other side of the pipeline.
>  	 */
> -	spin_lock_irqsave(&video->irqlock, flags);
> -	pipe->buffers_ready &= ~(1 << video->pipe_index);
> -	spin_unlock_irqrestore(&video->irqlock, flags);
> +	scoped_guard(spinlock_irqsave, &video->irqlock) {
> +		pipe->buffers_ready &= ~(1 << video->pipe_index);
> +	}
>  
>  	scoped_guard(mutex, &pipe->lock) {
>  		if (--pipe->stream_count == pipe->num_inputs) {
> @@ -1118,7 +1111,6 @@ static const struct media_entity_operations vsp1_video_media_ops = {
>  
>  void vsp1_video_suspend(struct vsp1_device *vsp1)
>  {
> -	unsigned long flags;
>  	unsigned int i;
>  	int ret;
>  
> @@ -1138,10 +1130,10 @@ void vsp1_video_suspend(struct vsp1_device *vsp1)
>  		if (pipe == NULL)
>  			continue;
>  
> -		spin_lock_irqsave(&pipe->irqlock, flags);
> -		if (pipe->state == VSP1_PIPELINE_RUNNING)
> -			pipe->state = VSP1_PIPELINE_STOPPING;
> -		spin_unlock_irqrestore(&pipe->irqlock, flags);
> +		scoped_guard(spinlock_irqsave, &pipe->irqlock) {
> +			if (pipe->state == VSP1_PIPELINE_RUNNING)
> +				pipe->state = VSP1_PIPELINE_STOPPING;
> +		}
>  	}
>  
>  	for (i = 0; i < vsp1->info->wpf_count; ++i) {
> @@ -1165,7 +1157,6 @@ void vsp1_video_suspend(struct vsp1_device *vsp1)
>  
>  void vsp1_video_resume(struct vsp1_device *vsp1)
>  {
> -	unsigned long flags;
>  	unsigned int i;
>  
>  	/* Resume all running pipelines. */
> @@ -1186,10 +1177,10 @@ void vsp1_video_resume(struct vsp1_device *vsp1)
>  		 */
>  		pipe->configured = false;
>  
> -		spin_lock_irqsave(&pipe->irqlock, flags);
> -		if (vsp1_pipeline_ready(pipe))
> -			vsp1_video_pipeline_run(pipe);
> -		spin_unlock_irqrestore(&pipe->irqlock, flags);
> +		scoped_guard(spinlock_irqsave, &pipe->irqlock) {
> +			if (vsp1_pipeline_ready(pipe))
> +				vsp1_video_pipeline_run(pipe);
> +		}
>  	}
>  }
>  
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> index 327c7457126f..0ec707d2913f 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> @@ -366,13 +366,12 @@ static void wpf_configure_frame(struct vsp1_entity *entity,
>  	const unsigned int mask = BIT(WPF_CTRL_VFLIP)
>  				| BIT(WPF_CTRL_HFLIP);
>  	struct vsp1_rwpf *wpf = to_rwpf(&entity->subdev);
> -	unsigned long flags;
>  	u32 outfmt;
>  
> -	spin_lock_irqsave(&wpf->flip.lock, flags);
> -	wpf->flip.active = (wpf->flip.active & ~mask)
> -			 | (wpf->flip.pending & mask);
> -	spin_unlock_irqrestore(&wpf->flip.lock, flags);
> +	scoped_guard(spinlock_irqsave, &wpf->flip.lock) {
> +		wpf->flip.active = (wpf->flip.active & ~mask)
> +				 | (wpf->flip.pending & mask);
> +	}
>  
>  	outfmt = (wpf->alpha << VI6_WPF_OUTFMT_PDV_SHIFT) | wpf->outfmt;
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 

-- 
Kind Regards,
Niklas Söderlund

