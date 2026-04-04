Return-Path: <linux-media+bounces-58050-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGYlF47/0GlUDQcAu9opvQ
	(envelope-from <linux-media+bounces-58050-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 14:09:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB1F39B02D
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 14:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AA03300B747
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2026 12:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2D6321445;
	Sat,  4 Apr 2026 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VMFvgWSv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KpQ0Q3s5"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D282F6562;
	Sat,  4 Apr 2026 12:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775304586; cv=none; b=XsUiWyb4VAuWAadi7qMXoJjCZg5acbas8JnovtdubFgOr4DY288RGOPj6m271UPnxtVeuC3w3anl4IdMfdnIIaJpJmROnBZcL/WzqXgqiyvAKuB2Yp1sKT3CTgOvkyHVhBeu1FzVV/vfLtcY0GpxNB5UFYEF7i+pCF7NWd3RLBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775304586; c=relaxed/simple;
	bh=wNt65IOJGsjl0V1voOlBfiuTWkix5sksSPGfgDtXqtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZolcyvpKGZD+B4DL5mLtx0MAPYUlGaUpuO0G3AHHm95qDC7mnNV4qsmyQe9AahrEydXqd/4+h0Vkm+/UupxmFWEqElsUwozZmsbRufN2WUWswZ2kvDUbzDjkH4dz0iQv/zVFN+lb/A1xWfv8uvifeHUbjY1d3kFndsUENwdZaUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VMFvgWSv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KpQ0Q3s5; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 8FB5F1D0010D;
	Sat,  4 Apr 2026 08:09:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 04 Apr 2026 08:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775304582;
	 x=1775390982; bh=pdYgqd6+LuMQt0E2NzJc2Dy5dskIfMKLiKWUQqIXvsI=; b=
	VMFvgWSvU9x9qYMPlpPGJtsB5PE8qHRqd4rRc1s0AUj9YRiL02RovbEYgUFPeyHk
	pdXLCnguOooZhtFH3ZI1uIbXXRyBfp9SYWaiy5e1rC9Ud9kZ+/WPK1GyNmPjnpyF
	o+4QE6PALi23/YWSscA+3/uzAPIZgyohjKKlemhfZcqVX1a90kcrqKEQdqkJfA4W
	HphL+ZwHdob+EVBlLGe6/SqAl8Q0P9Tob7RJOJJog17/jOVfR0xWY5q6CIeBNyvn
	jgqjR25GhIDidt6iPCxOpL/TGJ0srVKKNsRPyK0JNwfPX7m/18s3a/L78k7iaHuN
	4TgkjCOIjRQD+3CSEx8F0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775304582; x=
	1775390982; bh=pdYgqd6+LuMQt0E2NzJc2Dy5dskIfMKLiKWUQqIXvsI=; b=K
	pQ0Q3s5J733dDSiTBC4wNIOnp8ResE+/C9O4X9Ft39QH+plii4hOmzax7rCNWXbj
	ZNBCQ3p3I9TspQpo7MV5CtiO4tjDn7eg/XzAx+CZHfCnpw00utmpCdwqderNpwwZ
	lgYbsSXl7wsVcJq9Djo+bG0M4QvXK14B7UHH9+j0dR5j2j3TG52SK7mUsDvb5WdX
	AgXGNFI3U6ftZd4GFnAunxB18XYVMTuHW3Z/vRhupP3vdIDJngVhqWnTAycevoO/
	nQ06aBK4DN6ZQCs0B02Cihhf5KsHWHzNv+7Gm2m2eIfu1TyTwIonjowoOknmAXGd
	4CIlhr65e7hJ3ZNNT7VYw==
X-ME-Sender: <xms:hf_QaYsns9ZKwBvJy_qBbdoIBQry-ScZ3IyhLcuIgA2cSVqLN6pkww>
    <xme:hf_QaSCfvtXoiRXc6QynVIgit7Ri0BRA0o1OQuzs2X5HcV84DNI1SRvVwUm8mAwgN
    oX6yjm4lYcr6dm9xywQh5jzgNL-qFnR-LZmwuL4u-YBBp3nhcgMAA>
X-ME-Received: <xmr:hf_QaYO5RioAAtftHxEiv1YAHNcplswjQq9yAd3vk2vv-Gty5bJ1ZP9K7Wv7aW9xN6FFMzDXOe6R59QyCM_H8e70KdaS4AnMp3zK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudekudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvghsrghssehiuggvrghsohhn
    sghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghhrggsodhhuhgrfigviheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrg
    hsohhnsghorghrugdrtghomhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihgu
    vggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:hf_QaSCwAVppJ31ZdNJzHv8WDgpke6LLvuViCazK6qL8JODokYa-8w>
    <xmx:hf_QaZ6VklDpKnR6kqv8cWHdhiNe8jDkcvIoZ1Zkx5etE9lBSDpUQg>
    <xmx:hf_Qac4fgMtOvntjQjiGss0Z2uZgtpUnaVloS41D38clW8T6S404cg>
    <xmx:hf_QabQHyUsL52uTPM0rYdkTv-5wvpqlTvUwxQQHu9ptZszll9HgxQ>
    <xmx:hv_QaUYa1hwL7ASicnNx-TmUIK1uRFsJScbNNdWKgut03DgTkX4ToGzr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Apr 2026 08:09:41 -0400 (EDT)
Date: Sat, 4 Apr 2026 14:09:39 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v5 01/10] media: rcar-vin: Link VINs on Gen3 to a single
 channel on each CSI-2
Message-ID: <20260404120939.GB1525575@ragnatech.se>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-1-3e6c957d7567@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311-rcar-streams-v5-1-3e6c957d7567@ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-58050-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CEB1F39B02D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tomi,

Thanks for your work.

On 2026-03-11 15:53:14 +0200, Tomi Valkeinen wrote:
> The stream routing will be fully configurable when we add full streams
> support to the rcar pipeline. Thus there is no need for the user to be
> able to link VINs to different CSI-2 channels. In fact, allowing e.g.
> VIN0 to be connected to CSI-2 channel 3 would be wrong, as the hardware
> doesn't allow that.
> 
> Change rvin_csi2_create_link() so that it creates media links only
> between matching VINs and CSI-2 channels (VIN0 - channel 0, VIN1 -
> channel 1, etc.).
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I think you should break this out of the streams series so we can merge 
it before streams are enabled by default in the API.

> ---
>  .../media/platform/renesas/rcar-vin/rcar-core.c    | 27 ++++++++++++----------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index c8d564aa1eba..2fcea715101c 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -673,23 +673,26 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
>  	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
>  	struct media_entity *sink = &group->vin[id]->vdev.entity;
>  	struct media_pad *sink_pad = &sink->pads[0];
> +	struct media_pad *source_pad;
> +	unsigned int source_idx;
>  	unsigned int channel;
> -	int ret;
>  
> -	for (channel = 0; channel < 4; channel++) {
> -		unsigned int source_idx = rvin_group_csi_channel_to_pad(channel);
> -		struct media_pad *source_pad = &source->pads[source_idx];
> +	/*
> +	 * The channels from CSI-2 blocks and the VIN groups have a set of
> +	 * hardcoded routing options to choose from. We only support the routing
> +	 * where all VINs in a group are connected to the same CSI-2 block,
> +	 * and the Nth VIN in the group is connected to the Nth CSI-2 channel.
> +	 */
>  
> -		/* Skip if link already exists. */
> -		if (media_entity_find_link(source_pad, sink_pad))
> -			continue;
> +	channel = id % 4;
> +	source_idx = rvin_group_csi_channel_to_pad(channel);
> +	source_pad = &source->pads[source_idx];
>  
> -		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
> -		if (ret)
> -			return ret;
> -	}
> +	/* Skip if link already exists. */
> +	if (media_entity_find_link(source_pad, sink_pad))
> +		return 0;
>  
> -	return 0;
> +	return media_create_pad_link(source, source_idx, sink, 0, 0);
>  }
>  
>  static int rvin_parallel_setup_links(struct rvin_group *group)
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

