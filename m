Return-Path: <linux-media+bounces-61518-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C3tAXvSBGr0PQIAu9opvQ
	(envelope-from <linux-media+bounces-61518-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:35:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0999353A0A3
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A57BF3009839
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB723B1034;
	Wed, 13 May 2026 19:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="tSF/mCi0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Rj7pRxqP"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6223B27C1;
	Wed, 13 May 2026 19:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700291; cv=none; b=kLAgqxc54VGx8tSX8Js7Z6f481icvsgainKmdgKQ3jpt6KaRMgs5Lt7zrc7ESB5RYpnzOuM3AhC9TwcbWQSXhQNUNENezBBPV21eDjz+n0QYZfCFN8XxL7h+d0nyVblu5jlTzIu8wKduaSeEmEWrkFvWNP2ZIG8Z5BnKjcqZ/2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700291; c=relaxed/simple;
	bh=+2QxdCE3XYf+k+gI6IkuBtxYakMbYuRFMqZ+MfwjblA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpzKIKSa1QwChk/hFyZPQdGEUKHG4jTIbRsB4S7BbzWYlgi6/M4Zi0TckwCQ1th5QB2+la93CqDm3zEHyKxEVOXqD0ZgNcaYmUguiTnXP+sf3cCHi9Uc61h8s5TDGsdljOdMXwGw8QmhdR4YEUnuyfZmNxJJwGmKCnPicLQqgYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=tSF/mCi0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Rj7pRxqP; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 0AFBFEC012D;
	Wed, 13 May 2026 15:24:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 13 May 2026 15:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778700288;
	 x=1778786688; bh=EyyxCJdYkagema2fQ27LfIFrsHe01PeuwInIxPvtBRQ=; b=
	tSF/mCi0XMOOm0WRf2iPDb4GHqnNs54p+rTO4bmnVsB8FMh2HurseJM1KKO+AkQ0
	2yovAUh2MNomF2tDUM3cdp5QJL2al7Ua6U+Uau1Hxbo8pUYd3hq3a+BM5am+eEt0
	2hZpn9lbDriX3wNz2J2cLTp4mcD++UHTWyxjc9died9gReJ+Uqx+ox13RfPEde5a
	7FmGu02l4RUIgs/nsFzGLzq6VloRouSEGV7BreZU6V+8zLqkkpYUbU3wNigFAXOy
	o9+Q4nUWHoNokWpDkvF4p/TzPG2UVNLVYBzVvqO5lcC6sfc7Fr0ys8mz0NhtB+QT
	m/7FK16gfYyZ9y2JtrVzzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778700288; x=
	1778786688; bh=EyyxCJdYkagema2fQ27LfIFrsHe01PeuwInIxPvtBRQ=; b=R
	j7pRxqPZtblpB+K15R3FWmxjAFSgRZ5kNb+XvDWi6k9DSu4SecTSmAzNgygYu8HI
	yC56Ju1+lK9yE81JbUK21qOwg/VFQI0xTDAD4EUKDFLAaIafR7SaALdem8NamnOU
	1XpxddQMfC+KkVQ2DAr40BJq3U8fZpZ680858Ubi5f+t3XwN/3O0MOUIlaGi5OjS
	0eTVL0hhuKm/Np9RpJsWticcmNragzMfuUjCG3m0k1n3gETynrBXAlBQZmo90ypJ
	/VQBz06RfgqWuZ9NbCe73iYtKteySBuFaXtJRFavWIA/C3cNng8Mfj031TWnYaSt
	RwcgfRBB9GVcGwCT8ijVQ==
X-ME-Sender: <xms:_88EanCgCLPmLqhhaMwdrQJ1C0WyCMiefyOrafKObZ8pkky9SpioNw>
    <xme:_88EaqHW3HlKmYcfLVRnXFnc5bbvG9f0tx3AZhJcA2FXNK5q5QKkIExxga_e4OBMq
    n_SQvI1BlbCez1uYfsfZYD-YpaGfTZKypn-b6gKhWmuPz4RjVdzAhc>
X-ME-Received: <xmr:_88EanBB7jm8wdLOlSUg6KntOoq6RgJOtlVe9rPw2CstCsk01In1vS4PmN63ExI7qocbkDuW7xMPmVQlmiPujurQs-7icYO8Ga3d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdehgeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:_88Eagl-8Vw6R0fBRGp9qMrVvl1ZqiTpEefxUXNSe8vLRbbDbq_mXg>
    <xmx:_88EatOXeOQMUo6S-Ny4zhot-B_N4qwoXCzViARgLmZU_Lfrg4Fzag>
    <xmx:_88Eal-uRmkyyoBRfcmQy00MJwPn7stetYRANDtggN11_0yF7z942A>
    <xmx:_88EanEBFgk-rY8iWeynjarNRz6ntPcnoe9X34PrWc-kSLuSaoo_FA>
    <xmx:ANAEagojRKO67q9O1gxHA0tusU_Zoo8bkHJRlMX_Np9sPaShtQiTNtN1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 May 2026 15:24:47 -0400 (EDT)
Date: Wed, 13 May 2026 21:24:46 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 06/11] media: renesas: vsp1: Use mutex scoped guards
Message-ID: <20260513192446.GI332351@ragnatech.se>
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260511235637.3468558-7-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511235637.3468558-7-laurent.pinchart+renesas@ideasonboard.com>
X-Rspamd-Queue-Id: 0999353A0A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,ideasonboard.com,bp.renesas.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61518-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,messagingengine.com:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim]
X-Rspamd-Action: no action

Hi Laurent,

Thanks for your work.

On 2026-05-12 02:56:30 +0300, Laurent Pinchart wrote:
> Replace remaining manual mutex locking and unlocking with scoped
> guards. This simplifies error paths and reduces the amount of code.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../media/platform/renesas/vsp1/vsp1_brx.c    |   7 +-
>  .../media/platform/renesas/vsp1/vsp1_drm.c    | 117 ++++++++----------
>  .../media/platform/renesas/vsp1/vsp1_entity.c |   8 +-
>  .../media/platform/renesas/vsp1/vsp1_hgo.c    |  10 +-
>  .../media/platform/renesas/vsp1/vsp1_hgt.c    |  16 +--
>  .../media/platform/renesas/vsp1/vsp1_video.c  |  60 ++++-----
>  6 files changed, 102 insertions(+), 116 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> index bd2672341386..325be30836d7 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> @@ -190,9 +190,10 @@ static int brx_get_selection(struct v4l2_subdev *subdev,
>  		if (!state)
>  			return -EINVAL;
>  
> -		mutex_lock(&brx->entity.lock);
> -		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
> -		mutex_unlock(&brx->entity.lock);
> +		scoped_guard(mutex, &brx->entity.lock) {
> +			sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
> +		}
> +
>  		return 0;
>  
>  	default:
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index 1439cf7bfb59..2b64d9b5a81c 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -675,43 +675,37 @@ int vsp1_du_enable(struct device *dev, unsigned int pipe_index,
>  		__func__, pipe_index, cfg->width, cfg->height,
>  		pipe->interlaced ? "i" : "");
>  
> -	mutex_lock(&vsp1->drm->lock);
> +	scoped_guard(mutex, &vsp1->drm->lock) {
> +		/* Setup formats through the pipeline. */
> +		ret = vsp1_du_pipeline_setup_inputs(vsp1, pipe);
> +		if (ret < 0)
> +			return ret;
>  
> -	/* Setup formats through the pipeline. */
> -	ret = vsp1_du_pipeline_setup_inputs(vsp1, pipe);
> -	if (ret < 0)
> -		goto unlock;
> +		ret = vsp1_du_pipeline_setup_output(vsp1, pipe);
> +		if (ret < 0)
> +			return ret;
>  
> -	ret = vsp1_du_pipeline_setup_output(vsp1, pipe);
> -	if (ret < 0)
> -		goto unlock;
> +		vsp1_pipeline_dump(pipe, "DU enable");
>  
> -	vsp1_pipeline_dump(pipe, "DU enable");
> +		/* Enable the VSP1. */
> +		ret = vsp1_device_get(vsp1);
> +		if (ret < 0)
> +			return ret;
>  
> -	/* Enable the VSP1. */
> -	ret = vsp1_device_get(vsp1);
> -	if (ret < 0)
> -		goto unlock;
> +		/*
> +		 * Register a callback to allow us to notify the DRM driver of frame
> +		 * completion events.
> +		 */
> +		drm_pipe->du_complete = cfg->callback;
> +		drm_pipe->du_private = cfg->callback_data;
>  
> -	/*
> -	 * Register a callback to allow us to notify the DRM driver of frame
> -	 * completion events.
> -	 */
> -	drm_pipe->du_complete = cfg->callback;
> -	drm_pipe->du_private = cfg->callback_data;
> +		/* Disable the display interrupts. */
> +		vsp1_write(vsp1, VI6_DISP_IRQ_STA(pipe_index), 0);
> +		vsp1_write(vsp1, VI6_DISP_IRQ_ENB(pipe_index), 0);
>  
> -	/* Disable the display interrupts. */
> -	vsp1_write(vsp1, VI6_DISP_IRQ_STA(pipe_index), 0);
> -	vsp1_write(vsp1, VI6_DISP_IRQ_ENB(pipe_index), 0);
> -
> -	/* Configure all entities in the pipeline. */
> -	vsp1_du_pipeline_configure(pipe);
> -
> -unlock:
> -	mutex_unlock(&vsp1->drm->lock);
> -
> -	if (ret < 0)
> -		return ret;
> +		/* Configure all entities in the pipeline. */
> +		vsp1_du_pipeline_configure(pipe);
> +	}
>  
>  	/* Start the pipeline. */
>  	spin_lock_irqsave(&pipe->irqlock, flags);
> @@ -739,7 +733,6 @@ int vsp1_du_disable(struct device *dev, unsigned int pipe_index)
>  	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
>  	struct vsp1_drm_pipeline *drm_pipe;
>  	struct vsp1_pipeline *pipe;
> -	struct vsp1_brx *brx;
>  	unsigned int i;
>  	int ret;
>  
> @@ -749,45 +742,43 @@ int vsp1_du_disable(struct device *dev, unsigned int pipe_index)
>  	drm_pipe = &vsp1->drm->pipe[pipe_index];
>  	pipe = &drm_pipe->pipe;
>  
> -	mutex_lock(&vsp1->drm->lock);
> +	scoped_guard(mutex, &vsp1->drm->lock) {
> +		struct vsp1_brx *brx = to_brx(&pipe->brx->subdev);
>  
> -	brx = to_brx(&pipe->brx->subdev);
> +		ret = vsp1_pipeline_stop(pipe);
> +		if (ret == -ETIMEDOUT)
> +			dev_err(vsp1->dev, "DRM pipeline stop timeout\n");
>  
> -	ret = vsp1_pipeline_stop(pipe);
> -	if (ret == -ETIMEDOUT)
> -		dev_err(vsp1->dev, "DRM pipeline stop timeout\n");
> +		for (i = 0; i < ARRAY_SIZE(pipe->inputs); ++i) {
> +			struct vsp1_rwpf *rpf = pipe->inputs[i];
>  
> -	for (i = 0; i < ARRAY_SIZE(pipe->inputs); ++i) {
> -		struct vsp1_rwpf *rpf = pipe->inputs[i];
> +			if (!rpf)
> +				continue;
>  
> -		if (!rpf)
> -			continue;
> +			/*
> +			 * Remove the RPF from the pipe and the list of BRx
> +			 * inputs.
> +			 */
> +			WARN_ON(!rpf->entity.pipe);
> +			rpf->entity.pipe = NULL;
> +			list_del(&rpf->entity.list_pipe);
> +			pipe->inputs[i] = NULL;
>  
> -		/*
> -		 * Remove the RPF from the pipe and the list of BRx
> -		 * inputs.
> -		 */
> -		WARN_ON(!rpf->entity.pipe);
> -		rpf->entity.pipe = NULL;
> -		list_del(&rpf->entity.list_pipe);
> -		pipe->inputs[i] = NULL;
> +			brx->inputs[rpf->brx_input].rpf = NULL;
> +		}
>  
> -		brx->inputs[rpf->brx_input].rpf = NULL;
> +		drm_pipe->du_complete = NULL;
> +		pipe->num_inputs = 0;
> +
> +		dev_dbg(vsp1->dev, "%s: pipe %u: releasing %s\n",
> +			__func__, pipe->lif->index,
> +			BRX_NAME(pipe->brx));
> +
> +		list_del(&pipe->brx->list_pipe);
> +		pipe->brx->pipe = NULL;
> +		pipe->brx = NULL;
>  	}
>  
> -	drm_pipe->du_complete = NULL;
> -	pipe->num_inputs = 0;
> -
> -	dev_dbg(vsp1->dev, "%s: pipe %u: releasing %s\n",
> -		__func__, pipe->lif->index,
> -		BRX_NAME(pipe->brx));
> -
> -	list_del(&pipe->brx->list_pipe);
> -	pipe->brx->pipe = NULL;
> -	pipe->brx = NULL;
> -
> -	mutex_unlock(&vsp1->drm->lock);
> -
>  	vsp1_dlm_reset(pipe->output->dlm);
>  	vsp1_device_put(vsp1);
>  
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> index 3820ba53b45f..2ae2a573f0de 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> @@ -216,10 +216,10 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
>  		if (!state)
>  			return -EINVAL;
>  
> -		mutex_lock(&entity->lock);
> -		format = v4l2_subdev_state_get_format(state, 0);
> -		code->code = format->code;
> -		mutex_unlock(&entity->lock);
> +		scoped_guard(mutex, &entity->lock) {
> +			format = v4l2_subdev_state_get_format(state, 0);
> +			code->code = format->code;
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
> index 2c8ce7175a4e..0ef512e3a94b 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
> @@ -153,11 +153,11 @@ static void hgo_configure_stream(struct vsp1_entity *entity,
>  		       (crop->width << VI6_HGO_SIZE_HSIZE_SHIFT) |
>  		       (crop->height << VI6_HGO_SIZE_VSIZE_SHIFT));
>  
> -	mutex_lock(hgo->ctrls.handler.lock);
> -	hgo->max_rgb = hgo->ctrls.max_rgb->cur.val;
> -	if (hgo->ctrls.num_bins)
> -		hgo->num_bins = hgo_num_bins[hgo->ctrls.num_bins->cur.val];
> -	mutex_unlock(hgo->ctrls.handler.lock);
> +	scoped_guard(mutex, hgo->ctrls.handler.lock) {
> +		hgo->max_rgb = hgo->ctrls.max_rgb->cur.val;
> +		if (hgo->ctrls.num_bins)
> +			hgo->num_bins = hgo_num_bins[hgo->ctrls.num_bins->cur.val];
> +	}
>  
>  	hratio = crop->width * 2 / compose->width / 3;
>  	vratio = crop->height * 2 / compose->height / 3;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
> index 858f330d44fa..78b5a9201c70 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
> @@ -152,15 +152,15 @@ static void hgt_configure_stream(struct vsp1_entity *entity,
>  		       (crop->width << VI6_HGT_SIZE_HSIZE_SHIFT) |
>  		       (crop->height << VI6_HGT_SIZE_VSIZE_SHIFT));
>  
> -	mutex_lock(hgt->ctrls.lock);
> -	for (i = 0; i < HGT_NUM_HUE_AREAS; ++i) {
> -		lower = hgt->hue_areas[i*2 + 0];
> -		upper = hgt->hue_areas[i*2 + 1];
> -		vsp1_hgt_write(hgt, dlb, VI6_HGT_HUE_AREA(i),
> -			       (lower << VI6_HGT_HUE_AREA_LOWER_SHIFT) |
> -			       (upper << VI6_HGT_HUE_AREA_UPPER_SHIFT));
> +	scoped_guard(mutex, hgt->ctrls.lock) {
> +		for (i = 0; i < HGT_NUM_HUE_AREAS; ++i) {
> +			lower = hgt->hue_areas[i*2 + 0];
> +			upper = hgt->hue_areas[i*2 + 1];
> +			vsp1_hgt_write(hgt, dlb, VI6_HGT_HUE_AREA(i),
> +				       (lower << VI6_HGT_HUE_AREA_LOWER_SHIFT) |
> +				       (upper << VI6_HGT_HUE_AREA_UPPER_SHIFT));
> +		}
>  	}
> -	mutex_unlock(hgt->ctrls.lock);
>  
>  	hratio = crop->width * 2 / compose->width / 3;
>  	vratio = crop->height * 2 / compose->height / 3;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> index 4cf2cc370416..138d4e08eee9 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -810,22 +810,21 @@ static int vsp1_video_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	unsigned long flags;
>  	int ret;
>  
> -	mutex_lock(&pipe->lock);
> -	if (pipe->stream_count == pipe->num_inputs) {
> -		ret = vsp1_video_setup_pipeline(pipe);
> -		if (ret < 0) {
> -			vsp1_video_release_buffers(video);
> -			vsp1_video_cleanup_pipeline(pipe);
> -			mutex_unlock(&pipe->lock);
> -			return ret;
> +	scoped_guard(mutex, &pipe->lock) {
> +		if (pipe->stream_count == pipe->num_inputs) {
> +			ret = vsp1_video_setup_pipeline(pipe);
> +			if (ret < 0) {
> +				vsp1_video_release_buffers(video);
> +				vsp1_video_cleanup_pipeline(pipe);
> +				return ret;
> +			}
> +
> +			start_pipeline = true;
>  		}
>  
> -		start_pipeline = true;
> +		pipe->stream_count++;
>  	}
>  
> -	pipe->stream_count++;
> -	mutex_unlock(&pipe->lock);
> -
>  	/*
>  	 * vsp1_pipeline_ready() is not sufficient to establish that all streams
>  	 * are prepared and the pipeline is configured, as multiple streams
> @@ -859,16 +858,17 @@ static void vsp1_video_stop_streaming(struct vb2_queue *vq)
>  	pipe->buffers_ready &= ~(1 << video->pipe_index);
>  	spin_unlock_irqrestore(&video->irqlock, flags);
>  
> -	mutex_lock(&pipe->lock);
> -	if (--pipe->stream_count == pipe->num_inputs) {
> -		/* Stop the pipeline. */
> -		ret = vsp1_pipeline_stop(pipe);
> -		if (ret == -ETIMEDOUT)
> -			dev_err(video->vsp1->dev, "pipeline stop timeout\n");
> +	scoped_guard(mutex, &pipe->lock) {
> +		if (--pipe->stream_count == pipe->num_inputs) {
> +			/* Stop the pipeline. */
> +			ret = vsp1_pipeline_stop(pipe);
> +			if (ret == -ETIMEDOUT)
> +				dev_err(video->vsp1->dev,
> +					"pipeline stop timeout\n");
>  
> -		vsp1_video_cleanup_pipeline(pipe);
> +			vsp1_video_cleanup_pipeline(pipe);
> +		}
>  	}
> -	mutex_unlock(&pipe->lock);
>  
>  	video_device_pipeline_stop(&video->video);
>  	vsp1_video_release_buffers(video);
> @@ -995,22 +995,16 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
>  	 * touching an entity in the pipeline can be activated or deactivated
>  	 * once streaming is started.
>  	 */
> -	mutex_lock(&mdev->graph_mutex);
> +	scoped_guard(mutex, &mdev->graph_mutex) {
> +		pipe = vsp1_video_pipeline_get(video);
> +		if (IS_ERR(pipe))
> +			return PTR_ERR(pipe);
>  
> -	pipe = vsp1_video_pipeline_get(video);
> -	if (IS_ERR(pipe)) {
> -		mutex_unlock(&mdev->graph_mutex);
> -		return PTR_ERR(pipe);
> +		ret = __video_device_pipeline_start(&video->video, &pipe->pipe);
> +		if (ret < 0)
> +			goto err_pipe;
>  	}
>  
> -	ret = __video_device_pipeline_start(&video->video, &pipe->pipe);
> -	if (ret < 0) {
> -		mutex_unlock(&mdev->graph_mutex);
> -		goto err_pipe;
> -	}
> -
> -	mutex_unlock(&mdev->graph_mutex);
> -
>  	/*
>  	 * Verify that the configured format matches the output of the connected
>  	 * subdev.
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 

-- 
Kind Regards,
Niklas Söderlund

