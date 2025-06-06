Return-Path: <linux-media+bounces-34227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBFEAD0188
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 13:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F31B917A008
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 11:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36142882CD;
	Fri,  6 Jun 2025 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dMmpMXM0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="guoFBF++"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611F42066CE;
	Fri,  6 Jun 2025 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211041; cv=none; b=jtJm9g8zAnw/DV5CFOe3Ce759iEGq6yQmbAddCvaKxGp8P8x0loQzOPk6LebPkipubU7nglfmpsg4ItOJ2AJCwoot3YazsHPk0I5bagwn5nbSP6vuMdbG9qpaHK9kg5oe6Bpmo2RR+gHZekKQrcUaCFqX+SOPBJiAB+tteixmwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211041; c=relaxed/simple;
	bh=6SnHxI2JKl16yipLOTOGGoMllM4FJTxy50H3Uci/G/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TifDW1Unw2vjlVs1LbGPNDkhupLNPaz4o0qFZSreI+KgRido4w7BPJueAckNSSM18tI9dhGwVXd1eSaLq/hYCtm0HeK2CD6kJMMYcI0eloqjoYNYk3LQY1qMai2xfvIKo093cfqdgUxmbHsYoEITAiifESxiWmlUqjwjh1gouZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dMmpMXM0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=guoFBF++; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EC89625400D9;
	Fri,  6 Jun 2025 07:57:15 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 06 Jun 2025 07:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749211035;
	 x=1749297435; bh=mIkTtxOr8QfFxj+OIKJs+Ps3eXERA25AWZDUc/dDVSI=; b=
	dMmpMXM09sda4f+A88mkTcZshfigGOcQr775NG/5QoYApY59G4Rtl6pzoVRJruqI
	g+xW3zfX2FH3q5UDXPRjFqmEuuMyucFf02sBX0SIQpYwyFB3Hm236gDDTFPi4xTw
	156sQyeW1wKJ/qjpuXNdEJdsekcsE9hWQnFBGnuGOALVkh7Twr7HYudHfRa4wI54
	vzcT60sm6qCYSc2l2Ahvclgmvf8lMmgbm9pfyezq1ukaHZahpiMFfAw6aU5vgJlQ
	x6jN9aoRdcr3wihGWenQ6f7gcO7J4ZiSWebe92FgxOtQxwbxKfaeJrrJc6zUZhkz
	CRRK8PaO4ZXQVeo8BoD40Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749211035; x=
	1749297435; bh=mIkTtxOr8QfFxj+OIKJs+Ps3eXERA25AWZDUc/dDVSI=; b=g
	uoFBF++VmBaBPn8MJrbH/aB18M3Dn6mDjltdMrSbi/NbVY51mT4Y4m9BuN+5HBc4
	c+PFpVATuseNLrtFT6zsAvQQUnhgGQ5hQ81nFe4wMGaVD6ISDtz8cJjjxFlkbmjx
	Qjk1+cPwNKRxh77dm3C0gpCQMiU9aZURW80b/Rssa9PGBQkGtgq22YS++qARJb2D
	4+tzyjOaKQxqn8RnQXMvYSrKzokVsckuY4JoKXIQ1INxwPfwF1/FnkZA1P0+mEnO
	ubwzKwgHYx2K/7hpI/I/8cn7CLgLkUJIqSScLMkuItAviIR6a9uBCo+wlmrZHYvc
	q7eln88d/E/fRWBaBc68Q==
X-ME-Sender: <xms:m9dCaOJ2aqejU-h8SlCb0CsFtZuLq5R6gUh-_kkpMVX8cdZpNLzDdw>
    <xme:m9dCaGLGccsI9NephMHwzKPfQQ70z5ZAMV8XU65V20fL8YceJRAIHeHfEL0gwjxTH
    e52JtvLTS-4zOFVHnY>
X-ME-Received: <xmr:m9dCaOvbZa0pmKDeFCFsXTxrXeO8zTT6ALTJsU-02JehiPFIECNxpufl0ZOSctX9_Ue75eq7BKs9AOYarTG02c31VwIojJAoxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhh
    grsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehl
    ihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghs
    qdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgvhhgr
    sgdohhhurgifvghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrd
    hpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgr
    tghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:m9dCaDYxeyPUglb6vz8EPEjZwAXolLfhoDerNSBvFF7ox5c0rYSBJA>
    <xmx:m9dCaFY8tjc73AXMFhRnWstejThMa4PD2U7Lsz2JQdSvorWUuKP6gw>
    <xmx:m9dCaPCQ-yZm3GBmJsM1rKyMg4ePJGEjK_OgIft3nj_rXs5Z7InM1w>
    <xmx:m9dCaLbnMc12IKfrEzV_WB3kjP2BR7yBTQcr1yREu0Cb8qnQGDhd6A>
    <xmx:m9dCaGgbiG9iQxQ-1w9NMPxi3l--Q7f2-61lA3NR8fniFn-0XEkhjSjK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 07:57:15 -0400 (EDT)
Date: Fri, 6 Jun 2025 13:57:12 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 01/15] media: rcar-csi2: Use the pad version of
 v4l2_get_link_freq()
Message-ID: <20250606115712.GA2756718@ragnatech.se>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-1-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-rcar-streams-v3-1-026655df7138@ideasonboard.com>

Hi Tomi,

Thanks for your work.

On 2025-05-30 16:50:30 +0300, Tomi Valkeinen wrote:
> Use the new version of v4l2_get_link_freq() which supports media_pad as
> a parameter.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 9979de4f6ef1..ddbdde23c122 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -954,6 +954,7 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
>  static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
>  			   unsigned int lanes)
>  {
> +	struct media_pad *remote_pad;
>  	struct v4l2_subdev *source;
>  	s64 freq;
>  	u64 mbps;
> @@ -962,8 +963,9 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
>  		return -ENODEV;
>  
>  	source = priv->remote;
> +	remote_pad = &source->entity.pads[priv->remote_pad];
>  
> -	freq = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
> +	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
>  	if (freq < 0) {
>  		int ret = (int)freq;
>  
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

