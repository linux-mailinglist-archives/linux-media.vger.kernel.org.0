Return-Path: <linux-media+bounces-61530-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKsZDbrfBGpDQAIAu9opvQ
	(envelope-from <linux-media+bounces-61530-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 22:31:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638653A7AB
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 22:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 945E3301F9DC
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048762E0901;
	Wed, 13 May 2026 20:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gRvW0KzB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QsxjluoI"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E373134CF;
	Wed, 13 May 2026 20:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704304; cv=none; b=sAplYaPWvcUZWyDh6M29nWCT670QbzReWJK/payS+oeMUqprsiFeJVO6Res5QUIeym5iSJ2DaG8hLBHhSQDwzIQ9VlrzFThDftZ+XtMsiBvThARFcEH+qylHD1Gp7OFsR44ey1KeRJrZU0GeSX07sv35vHxGNQxGAgC4uWK9uwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704304; c=relaxed/simple;
	bh=i5DS3r9qRSwvlvyvJfwsMe/bZGzxB7AQ1gA9SdNrH04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+rzWfe4u3nVCy1Dl5NWdS3yFs1XlaCGXn0RpYgWuVGWPFXdhWor60Z50nMu0CgQqwC5o0eC3bxnPhBpOJrKPeKoOv7aQKIlIX0Pc1zqjsXF5xbs3jQe5LYBaxNK8DhW3AHjHx+RiOFKqHdWC6TklCSIscS69CWWw/oMiCzyLw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gRvW0KzB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QsxjluoI; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id C3F14EC0183;
	Wed, 13 May 2026 16:31:42 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 13 May 2026 16:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778704302;
	 x=1778790702; bh=lli9ZPyy82yRz3bDLmc4Yvy+5kmt8dvbijiAE1NqGLQ=; b=
	gRvW0KzBI01BHTwOXcYfWcK2tykh69e2Hs2gVrIbSSQkCjKb1ovLsIITYETuiGax
	awOITSQEf93FWq7OZRTjBw6Y2diVuCpsoAJ5oowpCpgXhDeQPfrFz1DAgPMnsByb
	uPgNwexgLP7OkjViz5yNO18mrCJvcKJvtJjZt68W2FiQ96EFP6ZDvcB2r4NzvbRq
	0Ek1C/cnSoW4XaXE/aZZjDsEtMWVR3Qt74XKU1774XVTBHD4wE7QNoAbzOE55TZr
	mnpwTDAvBaQ8hlw/o5wAwb43f688HZ+2JTXiASPhF0TOJP7tiXhP4P8l33g9/drD
	iwutbUmAd3R6IHVSiuh5gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778704302; x=
	1778790702; bh=lli9ZPyy82yRz3bDLmc4Yvy+5kmt8dvbijiAE1NqGLQ=; b=Q
	sxjluoIxV9jD+FegyBvE/Kau0niAls2lpEBtotWxWR7Q7wdMVwU4I++oAHKXVrZW
	1X/Wm66tONL35lkNsXwpsSgQA7Jh7+laZkwWULLCurGIPpU8+SnbKygukDFjso8s
	jWV3tNH2j+ZwIpQbGbtNJi8LRaPI+mH22vaePwukXw4w8dJiU954cGL8FF0dA7NW
	dbLKYn0ae9Fym/TidEWj7TSIuNnMu4xJHUcokEYtFJGkrMN6xVAXcbjVtJtCQvyD
	vG7TVoubE4vEQHgwng9kWNUmvgKfTooDeEXd23vtI/8oGikWEtWZANINluD0n63d
	OyMVa25g+EzECUZt4xVMg==
X-ME-Sender: <xms:rt8EatIGaYOz7_vUAB34kQBciJIiCor8lo5RHoZYy5pvo6aGVg1jwA>
    <xme:rt8Eak3MFilurBwTP7JSHE_DfvxfBKY7E4jf6BK39b09BCdAJO6yr4Lt50pPkibeG
    VSnqj2Ttq_i-8IuP503mblL1t5EpbuBrSII7acTveV8mGYg5vkDClU>
X-ME-Received: <xmr:rt8EaiIss0fNXIjsn7jPUOR02FIV2Ke-3sVJx9zzXYjFuqqUFn-Qsb4HtAevJa-YF5gIikThqlVl7CJ_E3ZusV6l8CldxJYwc6LI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdehiedvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:rt8EanguZgj9mvv7gLlwujqxYS_VbsprgfCd0dwBD9k0Omqr1-IJKQ>
    <xmx:rt8EaqAQ5CBdvzGtujH715HuxSfHRYpDaip9HYAcdQOUJqjehATORQ>
    <xmx:rt8Eah49S4_L3Pg33m8riozymWa-zkLqXNUPjN_VzIeUhoYiO7lqxg>
    <xmx:rt8EanEKDLoDY9TM2i0srQacvrQSpXlHo2Cs6tVh1WIxHzy80FY8Tg>
    <xmx:rt8EaoCST7pLUSOpP8kE2Fg2idGgS_jIa26XF116cUD9SoRQa-0qshoF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 May 2026 16:31:41 -0400 (EDT)
Date: Wed, 13 May 2026 22:31:40 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 11/11] media: renesas: vsp1: Drop deprecated
 vsp1_du_setup_lif() function
Message-ID: <20260513203140.GN332351@ragnatech.se>
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260511235637.3468558-12-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511235637.3468558-12-laurent.pinchart+renesas@ideasonboard.com>
X-Rspamd-Queue-Id: 8638653A7AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,ideasonboard.com,bp.renesas.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61530-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim,ideasonboard.com:email,messagingengine.com:dkim]
X-Rspamd-Action: no action

Hi Laurent,

Nice series!

On 2026-05-12 02:56:35 +0300, Laurent Pinchart wrote:
> The vsp1_du_setup_lif() is deprecated and its last users are gone. Drop
> it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  include/media/vsp1.h | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> index d2085cdb7fcb..98089e0a4385 100644
> --- a/include/media/vsp1.h
> +++ b/include/media/vsp1.h
> @@ -48,15 +48,6 @@ int vsp1_du_enable(struct device *dev, unsigned int pipe_index,
>  		   const struct vsp1_du_lif_config *cfg);
>  int vsp1_du_disable(struct device *dev, unsigned int pipe_index);
>  
> -static inline int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> -				    const struct vsp1_du_lif_config *cfg)
> -{
> -	if (cfg)
> -		return vsp1_du_enable(dev, pipe_index, cfg);
> -	else
> -		return vsp1_du_disable(dev, pipe_index);
> -}
> -
>  /**
>   * struct vsp1_du_atomic_config - VSP atomic configuration parameters
>   * @pixelformat: plane pixel format (V4L2 4CC)
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 

-- 
Kind Regards,
Niklas Söderlund

