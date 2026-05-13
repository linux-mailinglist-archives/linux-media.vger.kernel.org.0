Return-Path: <linux-media+bounces-61525-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Pw5LY/UBGqMPgIAu9opvQ
	(envelope-from <linux-media+bounces-61525-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:44:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CB553A2A1
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E70C1302A181
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A922A3B6BF0;
	Wed, 13 May 2026 19:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Zb3/J8Gq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fehknpLB"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9063ADB8F;
	Wed, 13 May 2026 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778701450; cv=none; b=WPYH/miAODZVp8KuE5uhFLHghXE1Esqqz7KfrI3up1n8jfwNR00cMvo2SD7DzU81M4/5put2yw8jnjAFFVI0pjMEyS6zS+3c7+lia5ZC728OjZK9MeAgNm1MAIlstVYV7hpZuvbGZnGJKnlvHY5faTkCoGEzmdtIJkjKCuUyxWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778701450; c=relaxed/simple;
	bh=2K1xPPBCBMNHnjB6nt9nYHVdac87B9FzXiHRzV6+3ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKj8fwc9ZsPn6ZUQu6ARqFwcioSwU+mrRS+P2bXz2lTo5n8D49f+B8bDKXzxW8qQGMiDC8AGprfwaCoX6JwxppboUqpsRYRK21iVqEjjRf+6HD8iXlz09ZptFOxKvgsEd4LmCdmr0SihA87m+1aHI8YWabMAaTV4pvHoH1TpoWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Zb3/J8Gq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fehknpLB; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D3D09140006E;
	Wed, 13 May 2026 15:44:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 13 May 2026 15:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778701447;
	 x=1778787847; bh=vq8AplGuZyE7KuVYiOXha2pA1P/pIeAOsJq+kKq4w+4=; b=
	Zb3/J8Gq/8zSYeRanwmBPSFsHZjwgyRNVu7twLGs3O5eNCO/7zPgsM6jgpOW/Lqx
	iY1zs+uYoBIlBouYZcU1aEaddmVBArGdaM1JsCZglWTg93zh0l3OuCvT2WQxFNUy
	npbJ93jgWhmSwssK1gcyXcJASU3KbcfajyqhrsI7s/UX6wrlZuNKLGSQKPKsrK1/
	TVC+Cud5LdUfX+mJxiyfT4fgH3AUvNiwqdNBwF1DVh0XTQ5b3XJTxBvjxh+FHkyn
	bn7mdiqDhAOXM5tc4d9MBbUNZa71uJ/hkC3pbilS5rmr6u1U6uV0W/cpzJucR7yy
	+TZRufNi2fSHhviSiJ2CfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778701447; x=
	1778787847; bh=vq8AplGuZyE7KuVYiOXha2pA1P/pIeAOsJq+kKq4w+4=; b=f
	ehknpLBOJv+ow/RrtKmrZebrmw8JgzeYhn7K3QgbWmiIF8e2Jwj878AGpiSuaymi
	wRFX+As/3sNHetQb+AhN+nPmVaRm2T1t01q/khthzDBjTDW3ErG0zmXbTfveo5zS
	Cr+vVdONgRfcjRIDhWHLAvZ5HuXRS06PGWYA0V9Z3x2KN+565AzKVnehFKzSGMrE
	xCBdVia8tUWbZcSIhAPM5/VZvr+ucMIol18yh81rr9Fe5V8pxGR3jxCORNu5BqnG
	7heSKn5q3T1oh1RooK9DxXBIjnJfOSfgWccheHOyXEij0g+jf7Y21J8/yiHeTQZ2
	o1IHIuPG1d9rhegfg/zmA==
X-ME-Sender: <xms:h9QEalkBNqR-oZTH-NOFrTkA7QaNh3SqTrw1m3lXjZbfh6Eihx1b5g>
    <xme:h9QEatZvDFRzEgHNQmwuHnpFP67U2gRwS8FrJrYcm0oaUmswqe2pPAxs69kM4NQjw
    BD9GtTMaJwnIlO1G4AQf9mUzKOj_s2luDOAPQLYowewAi4HlSGonzo>
X-ME-Received: <xmr:h9QEagEbtBZg9qZrnYocWVkXbAgg6_T1g5apN34jm209eA3Wa1m7CHiNkRa1We5-k4KEWvFvB1J5-Rl7-uifgF5LVCidUngxQdn0>
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
X-ME-Proxy: <xmx:h9QEasZmU26Rp4jroqQGWSTJG3TYnyElUrCnAW9ed04fw14IJozkig>
    <xmx:h9QEakx-frbMlqLb5-X2jW3faASm7_TD2RtebZz6Ji5NUVc4r8xWhQ>
    <xmx:h9QEauSFZog46_N5G6LcWv7B3IFXDNKFWwWPH-YxwYxAz_ggRLKKZg>
    <xmx:h9QEahJD4umhOBy5Pq_aQpUw_zUWmxlQh0MoydzcofYWMrLX5E5iaA>
    <xmx:h9QEat-HKxK0cRwJy2_T4ON9G21hMmoieOGYnc53AyKS_Hjf7vvSOA2g>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 May 2026 15:44:07 -0400 (EDT)
Date: Wed, 13 May 2026 21:44:05 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 09/11] media: renesas: vsp1: Simplify iteration over
 format arrays
Message-ID: <20260513194405.GL332351@ragnatech.se>
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260511235637.3468558-10-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511235637.3468558-10-laurent.pinchart+renesas@ideasonboard.com>
X-Rspamd-Queue-Id: 34CB553A2A1
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
	TAGGED_FROM(0.00)[bounces-61525-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Action: no action

Hi Laurent,

Thanks for your work.

On 2026-05-12 02:56:33 +0300, Laurent Pinchart wrote:
> Introduce a vsp1_for_each_format() macro to iterate over format arrays,
> to improve readability. No functional change intended.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../media/platform/renesas/vsp1/vsp1_pipe.c   | 36 ++++++-------------
>  1 file changed, 10 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index f9c7c75a7ad0..7197f2917417 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -229,6 +229,10 @@ static const struct vsp1_format_info vsp1_video_hsit_formats[] = {
>  	  1, { 32, 0, 0 }, false, false, 1, 1, false },
>  };
>  
> +#define vsp1_for_each_format(info, formats) \
> +	for (const struct vsp1_format_info *info = &formats[0]; \
> +	     info < formats + ARRAY_SIZE(formats); ++info)
> +
>  /**
>   * vsp1_get_format_info - Retrieve format information for a 4CC
>   * @vsp1: the VSP1 device
> @@ -240,30 +244,20 @@ static const struct vsp1_format_info vsp1_video_hsit_formats[] = {
>  const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
>  						    u32 fourcc)
>  {
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(vsp1_video_formats); ++i) {
> -		const struct vsp1_format_info *info = &vsp1_video_formats[i];
> -
> +	vsp1_for_each_format(info, vsp1_video_formats) {
>  		if (info->fourcc == fourcc)
>  			return info;
>  	}
>  
>  	if (vsp1->info->gen == 2) {
> -		for (i = 0; i < ARRAY_SIZE(vsp1_video_gen2_formats); ++i) {
> -			const struct vsp1_format_info *info =
> -				&vsp1_video_gen2_formats[i];
> -
> +		vsp1_for_each_format(info, vsp1_video_gen2_formats) {
>  			if (info->fourcc == fourcc)
>  				return info;
>  		}
>  	}
>  
>  	if (vsp1_feature(vsp1, VSP1_HAS_HSIT)) {
> -		for (i = 0; i < ARRAY_SIZE(vsp1_video_hsit_formats); ++i) {
> -			const struct vsp1_format_info *info =
> -				&vsp1_video_hsit_formats[i];
> -
> +		vsp1_for_each_format(info, vsp1_video_hsit_formats) {
>  			if (info->fourcc == fourcc)
>  				return info;
>  		}
> @@ -287,8 +281,6 @@ const struct vsp1_format_info *
>  vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
>  			      u32 code)
>  {
> -	unsigned int i;
> -
>  	if (!code) {
>  		if (index < ARRAY_SIZE(vsp1_video_formats))
>  			return &vsp1_video_formats[index];
> @@ -308,9 +300,7 @@ vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
>  		return NULL;
>  	}
>  
> -	for (i = 0; i < ARRAY_SIZE(vsp1_video_formats); ++i) {
> -		const struct vsp1_format_info *info = &vsp1_video_formats[i];
> -
> +	vsp1_for_each_format(info, vsp1_video_formats) {
>  		if (info->mbus == code) {
>  			if (!index)
>  				return info;
> @@ -319,10 +309,7 @@ vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
>  	}
>  
>  	if (vsp1->info->gen == 2) {
> -		for (i = 0; i < ARRAY_SIZE(vsp1_video_gen2_formats); ++i) {
> -			const struct vsp1_format_info *info =
> -				&vsp1_video_gen2_formats[i];
> -
> +		vsp1_for_each_format(info, vsp1_video_gen2_formats) {
>  			if (info->mbus == code) {
>  				if (!index)
>  					return info;
> @@ -332,10 +319,7 @@ vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
>  	}
>  
>  	if (vsp1_feature(vsp1, VSP1_HAS_HSIT)) {
> -		for (i = 0; i < ARRAY_SIZE(vsp1_video_hsit_formats); ++i) {
> -			const struct vsp1_format_info *info =
> -				&vsp1_video_hsit_formats[i];
> -
> +		vsp1_for_each_format(info, vsp1_video_hsit_formats) {
>  			if (info->mbus == code) {
>  				if (!index)
>  					return info;
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 

-- 
Kind Regards,
Niklas Söderlund

