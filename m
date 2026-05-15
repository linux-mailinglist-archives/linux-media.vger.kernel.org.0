Return-Path: <linux-media+bounces-61776-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCz6GpBkB2q90wIAu9opvQ
	(envelope-from <linux-media+bounces-61776-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 20:23:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7107155619B
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 20:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD7783002B5B
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 18:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7267430C15C;
	Fri, 15 May 2026 18:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="TwthyoUw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lPpd7RjK"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF3E30C164;
	Fri, 15 May 2026 18:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778869373; cv=none; b=BSUqwGVp7a9O4pCg8xcY5LwvT3FCNQrvWu+qtDhxRlVPYIqVKR8Rtp1HQJTK9K/UtH8SzipxQ2iWpT6OKXiOYSO82aeNa4d3ushQ+ScXfgdEZy6/hRFe9YVKCMKbCXdKfb2ocyZY/DbpPDYKAKdtw/nvJ9T+SEcObBs4gpQaoOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778869373; c=relaxed/simple;
	bh=sNlSIf1IjfJ/jHElr8cixtA/xamo9i8mQq6uyw2nNvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBNQz36nsvlv+NuO33sHh1DvcRhcxpSZEhREIftrjg0rL4VDRppQPQV6aUZ/TVNjxjpkqRILyDQJqqWDb90Pog56utHw1r5oJEwbrEZ2KvM6rKH3ARYLFiisngIfgdMLhfpbOu/BX9Mv+oeX0AQaTdiifpm7W+XqUw5MDzg4N9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=TwthyoUw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lPpd7RjK; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id D351AEC00A9;
	Fri, 15 May 2026 14:22:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 15 May 2026 14:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778869369;
	 x=1778955769; bh=Rgvm0AHYeyqQLpGC941C8SJBD5loh32g+DAha5MN7SE=; b=
	TwthyoUwtwDsmWqR82NbUXt3ZbKybt9CbUh6kTqT6FdaajKErYErLDGpWFJcG9Tp
	McASbdSMe5hNNAv68UewpAiAI2M3/Nf95gu4hcQ03+WEfrA7SLfgfyFy5gUOkHSA
	7QS8WqxCEJq82rlCLPxoNnliIbrNndBZHsWRLmHcaFTUsIenxxaQSbBDKAPZcKgR
	0zU5EJVuBL5LFRjwKK6jq04OgdntL+5qckRbSOEw8Fu+nhhwu5Hlely9beIWWbmM
	6PtSYc1ONS6QJgpWcxZ7MnOOThX7DhWAx6uTyOTH3Ww25KhyVcdKsDPdHffmWEwy
	cQZpW7FLRlvHVW5kOSkMRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778869369; x=
	1778955769; bh=Rgvm0AHYeyqQLpGC941C8SJBD5loh32g+DAha5MN7SE=; b=l
	Ppd7RjKZRCf0JOJfoHdxgYl0Hk0nWtFGbW0MfvG717YFxYmaKdaxWEoQ2u6uSy0W
	FDL39ihATZ2HqxmGg3V0oV6PQuJMwbtAd/Ivb5QO3I1rXUOdGdF2PlGeUxml9coR
	6kcY/+l3odG+6CYqkTr43tBn5IzxoZD27DiCKnOt25Nvdk1th+Qz2RZDoTGwB+jB
	JNgZPRIawHiSOxBd5bv2o84QYFZ5dqlgCO4psRX1vot/8gBh2SnhyWvyBGJo7NPE
	6QMeQmEljo+skKPJKIUZCRuiu7ogLfPUAbJWqZqLoFgL7i3sscnpgFaiASg923pG
	vUJiSOOTiLPk5mduHEmvA==
X-ME-Sender: <xms:eWQHavXTtaI2J2Zu5beRm01dnfVHRRDGdpdhZ4m69CelCuPvhTPDig>
    <xme:eWQHavsutKpMw08uhlu-ynZCwQ8KV-isO4FeYe7L9-yNC2mc2mrRdgpMTTywn3g8c
    hPlg0eBvxb0YC485TXtZpMgg4QCQ3c0GhFvrqW1GyIr0nxxt2C_Zy0>
X-ME-Received: <xmr:eWQHaq6Q6lMIJwzVVLFlm3ZfI3oFnPT_VdtNl3IVT5iKNjkzFVwijpUqX4dh6jqbEuZoEOezOF0RDPg1e5woMDZi3JBbW3V36Arx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeduudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtgho
    mhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    gurghnrdhstggrlhhlhiesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohep
    khgvkhgvrdhlihesrghmlhhoghhitgdrtghomhdprhgtphhtthhopegrnhhtohhinhgvrd
    gsohhuhigvrhesnhigphdrtghomhdprhgtphhtthhopehjrghirdhluhhthhhrrgesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheprhhisggrlhgurgestghhrhhomh
    hiuhhmrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggv
    rghsohhnsghorghrugdrtghomhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslh
    hinhhugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:eWQHaqRsrg9myDW6AV4UZmkZhGBIBMG39dnkE5ba_U82Q0UWHP8Y1Q>
    <xmx:eWQHalu7_z4A7gLG8LLE60uGVCgynAgJyHK5wNlTLhYwl3NoT8XP0Q>
    <xmx:eWQHak8niJzo7STg0J_gg_4XHX5RT5aaQ4Ojj2hU-xPc9ZVQ1tzt_g>
    <xmx:eWQHamzBB1FN4vYpdtVIX0vTJB9yUqeMwUO0qxATim_K-ZXLUqCEQQ>
    <xmx:eWQHakxueuyGOxX6cK3VIiyTkvMDPulMUuctW08LX1AQI69EcqswXpXN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 May 2026 14:22:49 -0400 (EDT)
Date: Fri, 15 May 2026 20:22:47 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Antoine Bouyer <antoine.bouyer@nxp.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] media: v4l2-isp: Add per-block validation callback
Message-ID: <20260515182247.GT332351@ragnatech.se>
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <20260505-extensible-stats-v1-4-e16f326b8dad@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505-extensible-stats-v1-4-e16f326b8dad@ideasonboard.com>
X-Rspamd-Queue-Id: 7107155619B
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
	TAGGED_FROM(0.00)[bounces-61776-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,messagingengine.com:dkim]
X-Rspamd-Action: no action

Hello Jacopo,

Thanks for your work.

On 2026-05-05 16:12:15 +0200, Jacopo Mondi wrote:
> Drivers are expected to provide to the helper function
> v4l2_isp_params_validate_buffer() a list of 'struct
> v4l2_isp_params_block_type_info' entries, one for each supported ISP block.
> 
> The type 'struct v4l2_isp_params_block_type_info' so far only contained the
> expected block size for the core framework to validate the declared block
> size against the expected one.
> 
> For some blocks, drivers might want to implement more precise per-block
> validations. Add a function pointer member to 'struct
> v4l2_isp_params_block_type_info' to allow drivers to register a callback
> and call it from the core framework during validation.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

This is a neat idea!

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/v4l2-core/v4l2-isp.c |  4 ++++
>  include/media/v4l2-isp.h           | 11 ++++++++---
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
> index 29831f7032e9..10760659f8a3 100644
> --- a/drivers/media/v4l2-core/v4l2-isp.c
> +++ b/drivers/media/v4l2-core/v4l2-isp.c
> @@ -114,6 +114,10 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
>  			return -EINVAL;
>  		}
>  
> +		if (type_info->block_validate &&
> +		    type_info->block_validate(dev, block))
> +			return -EINVAL;
> +
>  		block_offset += block->size;
>  		buffer_size -= block->size;
>  	}
> diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
> index d70ed6b431e7..1f35a52f978a 100644
> --- a/include/media/v4l2-isp.h
> +++ b/include/media/v4l2-isp.h
> @@ -55,17 +55,22 @@ int v4l2_isp_params_validate_buffer_size(struct device *dev,
>  /**
>   * struct v4l2_isp_params_block_type_info - V4L2 ISP per-block-type info
>   * @size: the block type expected size
> + * @block_validate: driver's callback to implement per-block validation
>   *
>   * The v4l2_isp_params_block_type_info collects information of the ISP
> - * configuration block types for validation purposes. It currently only contains
> - * the expected block type size.
> + * configuration block types for validation purposes. It contains the expected
> + * block type size and a function pointer where drivers can register a callback
> + * for additional per-block validation purposes. The validation function is
> + * expected to return 0 on success or a negative error number for errors.
>   *
>   * Drivers shall prepare a list of block type info, indexed by block type, one
>   * for each supported ISP block type and correctly populate them with the
> - * expected block type size.
> + * expected block type size and the optional callback.
>   */
>  struct v4l2_isp_params_block_type_info {
>  	size_t size;
> +	int (*block_validate)(struct device *dev,
> +			      const struct v4l2_isp_block_header *block);
>  };
>  
>  /**
> 
> -- 
> 2.53.0
> 

-- 
Kind Regards,
Niklas Söderlund

