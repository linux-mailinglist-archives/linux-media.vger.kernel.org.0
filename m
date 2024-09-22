Return-Path: <linux-media+bounces-18435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B9397E0D8
	for <lists+linux-media@lfdr.de>; Sun, 22 Sep 2024 12:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 277002814C3
	for <lists+linux-media@lfdr.de>; Sun, 22 Sep 2024 10:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D9E149E03;
	Sun, 22 Sep 2024 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="EueiuIlz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a4uQ9P9p"
X-Original-To: linux-media@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B924524D7;
	Sun, 22 Sep 2024 10:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727000127; cv=none; b=pDfOC6XEDGnRH2EnFzWWjgGQGws8BIKxyr9aGiWsHWpe8YBg3dsgzSXdJkQdRtFK5HHo2zM5p9ZmHYivhHaGeYvAfQV2CkCRHN1W85QruOS+nz+eLrXKJ9hND/TYbBUN+iGqGVfBis0sE9KkisvdVJdJdjqeTcO0BZJTcg8gygc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727000127; c=relaxed/simple;
	bh=o1laS0iBNe7sZJ2IkaOVgaenqSTEu3eJl+BG4qqQvyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNCR7X4vmNylUZ/zEJJbP+29LnWF630fFQaYslzOiXqKKzh9pN5n4Nn0XKDV9qJSc+n3lDcnhEFkrFaOrKpSMZxifBuThXXlCsIENll/Rgt3Gh62vcgJ6+C0sDQL5QRYEpIS++r08tX52am56WrC3jATzPypWiyBOdKANxraO5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=EueiuIlz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a4uQ9P9p; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 7274413802E8;
	Sun, 22 Sep 2024 06:15:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sun, 22 Sep 2024 06:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727000122;
	 x=1727086522; bh=z3lbEBj7Hn2s5ZLm0g8ZucXx9EFzxLsl8v8/hMTPYTA=; b=
	EueiuIlzEqXC/HuTT4YJR6uW6W0RF5jeP1pt/5NtgA3mHkJffAT06sq7ZXWj6tE0
	3UE/kNlbFYeoPEF7vME9u6FkmejuLmKcAHQQARFKzQcfg51SpDcfkdRuiDBbhnXV
	m6tD4lLCYX00y2SmpBbQ2J7Q6Y3dpbeR1s3prUS9XGosyYk/P/qDBhFBfSWJ6f/n
	PPAXOeSuxMK5/eV2y5AGha9PUhgUaiVJy2f/zWuqauxKtnQVi4m+Sg2tjZcT6fou
	kxDfFWzfQaytj8+yGaGLe4g7dISYJVKvYlN3c87APUoxJFEuvBBVAeEGHYu37Hzo
	KKovOmo4crU67+igrRKm4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727000122; x=
	1727086522; bh=z3lbEBj7Hn2s5ZLm0g8ZucXx9EFzxLsl8v8/hMTPYTA=; b=a
	4uQ9P9pLwxohNrVy8IYw7QFArMLxkhAPgfhXX0iI96KOOF5IOE9HK0ddktmewCOU
	eXAoJeDO9X5GHakoTr367Ar4Mc66Ey47cQqVTLWsGzKFWuFk1MU3Agunt+hW4llJ
	ePozVk94Z/dGCVgu5nMBi2fW5j0YR7SX+Zmd2tO3E+z1oweOzaUp6TdKCKfPyI6X
	htG7uXZzF2lAMYx9XATdESOh135yOmuWEmy4H+khgwAAsxE7wGtLtU2ABnLJK1tK
	lEaV9PDv3l5T8CVEKNat2LucYzlFl4/ihljUNcoDIN2ajlPun9K7kgtMORpMJXeh
	oIXWvuTm6i+hF6L8OqRcw==
X-ME-Sender: <xms:Oe7vZg6Ke4jBOF5549ojEMHJduRLwdBJMGn1i-F2g3V-RjT77iPiGw>
    <xme:Oe7vZh54gMvHnCGnJqqO87RGIzVvwDL5LAGI-batwUqGI-3WChqjesNWfNe8R-mFQ
    22QkYpocdIXbDrSZGY>
X-ME-Received: <xmr:Oe7vZvdwpshLx7ilN3i3Oto1Jvty7G0GDe1zdtJG5J0wjT0QkZedqbfRC1KbIsZB5Y9ffr__OsJS_WBkcSPaYPysodqUHLNLuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeljedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuihhlqdgtihhstghoseigshegrghllhdr
    nhhlpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhn
    sghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghi
    nhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:Oe7vZlJv85IEj4KTLckYocqJeIJ_tydFAnYp_FuinpQy2tyI276qGw>
    <xmx:Oe7vZkLWhT8rWUi0OxMnK66Eg8dXhe9yLBAAEdPmSfl-JnFcqrh_jA>
    <xmx:Oe7vZmwiOoxBis7-WOdCY6dLexmWNhrjwfrtQXFQpcz4c6L3tznVrg>
    <xmx:Oe7vZoJB28V-IvYFC9G4QEoBq54wEuQWcl3sQjpavhi8ob4cetVriA>
    <xmx:Ou7vZpUI64SHGm_GRIMM7XPXKH0El4ZaZVw6C-OIOGjvlVY585djA0gM>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Sep 2024 06:15:21 -0400 (EDT)
Date: Sun, 22 Sep 2024 12:15:19 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/4] media: renesas: Use state cleanup macros
Message-ID: <20240922101519.GA3490560@ragnatech.se>
References: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
 <20240917-scoped-state-v1-3-b8ba3fbe5952@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240917-scoped-state-v1-3-b8ba3fbe5952@ideasonboard.com>

Hi Tomi,

Thanks for your work. I like the scoped management.

On 2024-09-17 17:09:31 +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Use the new subdev state cleanup macros.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c            | 14 ++++----------
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c |  9 ++++-----
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c   |  9 ++-------
>  3 files changed, 10 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index c419ddb4c5a2..03ef6566271f 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1163,27 +1163,24 @@ static void rcsi2_stop(struct rcar_csi2 *priv)
>  static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	struct v4l2_subdev_state *state;
>  	int ret = 0;
>  
>  	if (!priv->remote)
>  		return -ENODEV;
>  
> -	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
> +	CLASS(v4l2_subdev_lock_and_get_active_state, state)(&priv->subdev);
>  
>  	if (enable && priv->stream_count == 0) {
>  		ret = rcsi2_start(priv, state);
>  		if (ret)
> -			goto out;
> +			return ret;

As ret is now only used in this branch maybe we can move the declaration 
of it here? At least I think you should remove the assignment to 0 above 
as that behavior is not needed anymore but, at lest to me, keeping it 
indicates there is an intent in initializing it.

With that fixed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

>  	} else if (!enable && priv->stream_count == 1) {
>  		rcsi2_stop(priv);
>  	}
>  
>  	priv->stream_count += enable ? 1 : -1;
> -out:
> -	v4l2_subdev_unlock_state(state);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> @@ -1274,18 +1271,15 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
>  
>  static irqreturn_t rcsi2_irq_thread(int irq, void *data)
>  {
> -	struct v4l2_subdev_state *state;
>  	struct rcar_csi2 *priv = data;
>  
> -	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
> +	CLASS(v4l2_subdev_lock_and_get_active_state, state)(&priv->subdev);
>  
>  	rcsi2_stop(priv);
>  	usleep_range(1000, 2000);
>  	if (rcsi2_start(priv, state))
>  		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
>  
> -	v4l2_subdev_unlock_state(state);
> -
>  	return IRQ_HANDLED;
>  }
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index e68fcdaea207..63b846f3e468 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -238,7 +238,6 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
>  	struct v4l2_subdev *source = csi2->remote_source;
>  	const struct rzg2l_csi2_format *format;
>  	const struct v4l2_mbus_framefmt *fmt;
> -	struct v4l2_subdev_state *state;
>  	struct v4l2_ctrl *ctrl;
>  	u64 mbps;
>  
> @@ -250,10 +249,10 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
>  		return -EINVAL;
>  	}
>  
> -	state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
> -	fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
> -	format = rzg2l_csi2_code_to_fmt(fmt->code);
> -	v4l2_subdev_unlock_state(state);
> +	scoped_v4l2_subdev_lock_and_get_active_state(&csi2->subdev) {
> +		fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
> +		format = rzg2l_csi2_code_to_fmt(fmt->code);
> +	}
>  
>  	/*
>  	 * Calculate hsfreq in Mbps
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index ac8ebae4ed07..0b9e8a7cf22a 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -36,14 +36,9 @@ static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int c
>  
>  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
>  {
> -	struct v4l2_subdev_state *state;
> -	struct v4l2_mbus_framefmt *fmt;
> +	CLASS(v4l2_subdev_lock_and_get_active_state, state)(&cru->ip.subdev);
>  
> -	state = v4l2_subdev_lock_and_get_active_state(&cru->ip.subdev);
> -	fmt = v4l2_subdev_state_get_format(state, 1);
> -	v4l2_subdev_unlock_state(state);
> -
> -	return fmt;
> +	return v4l2_subdev_state_get_format(state, 1);
>  }
>  
>  static int rzg2l_cru_ip_s_stream(struct v4l2_subdev *sd, int enable)
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

