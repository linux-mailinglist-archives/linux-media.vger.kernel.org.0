Return-Path: <linux-media+bounces-56246-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAAVIyERu2nGegIAu9opvQ
	(envelope-from <linux-media+bounces-56246-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:54:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9EC2C2B9F
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65F0A305B476
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEE937186B;
	Wed, 18 Mar 2026 20:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C92OREUL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E65D361DB6;
	Wed, 18 Mar 2026 20:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773867280; cv=none; b=s38UB/4RM1Zf6QrfdjT07yt3yNqkdVRuDq8V1I5lj0npwTDglyw9E4rOX7WJMItl9YbpJRptsKls/AU2SrkjZx7Tt/OyieqeJTNDYuqlMKXnK9UV1RJb+hFLqnnSG+gdogURm6i6B4PK9SIn4GdXA8s3ZI1DLzPbfCKnMnaQmow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773867280; c=relaxed/simple;
	bh=F+wGJ+iNBPvI3rbEfUEToNBBeFlt0PHRup7YCDEb3NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVQON9rvyfHV/YrTHq/5qbhFzBzY/ki1Dfi3Of1Sa07QlwijReHMdS7fM+v7LJkgTwBqeockNAzR0zn1VR4/M6lks94YdsjAuoYxpsNuf8NWlB4h5vpxUC9TWAdSekevYig1Ahu5uU5/F35kOd3cUzJ3s8NLv7VCwd3av9tByrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C92OREUL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 122F0379;
	Wed, 18 Mar 2026 21:53:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773867204;
	bh=F+wGJ+iNBPvI3rbEfUEToNBBeFlt0PHRup7YCDEb3NI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C92OREULGlzg5DaWFQPxFqwRKpX/kwJovL0Z6WCJ5kFNBH1KXfwkwAdM/wu1/Vh1Q
	 onfVY7NgPrd2sV+W8JqPVBt6siXl5JmEr7oDDTlyrGoCaWRVLRWuLW/+dnxJsIaQmw
	 ysjG4u+hevIEtnDC02qDetxtxWTT68rTXI34W/sY=
Date: Wed, 18 Mar 2026 22:54:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v5 03/10] media: rcar-csi2: Move
 {enable|disable}_streams() calls
Message-ID: <20260318205435.GG716464@killaraus.ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-3-3e6c957d7567@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311-rcar-streams-v5-3-3e6c957d7567@ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56246-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: EB9EC2C2B9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:53:16PM +0200, Tomi Valkeinen wrote:
> With multiple streams the operation to enable the CSI-2 hardware and to
> call {enable|disable}_streams() on upstream subdev will need to be
> handled separately.
> 
> Prepare for that by moving {enable|disable}_streams() calls out from
> rcsi2_start() and rcsi2_stop().
> 
> On Gen3, a side effect of this change is that if the sink side devices
> call .enable_streams() on rcar-csi2 multiple times, the second call will
> fail. This is because we always use stream ID 0, so the second call
> would attempt to enable the same stream again, leading to an error. In
> other words, a normal single-stream setup continues to work, but trying
> to use the current driver's custom VC based routing will fail.

I assume this gets addressed later in the series.

> 
> On Gen4, this doesn't matter as the rcar-isp behaves in a similar way as
> described above, and thus rcar-csi2 will only get a single
> .enable_streams() call.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 7305cc4a04cb..158fa447e668 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1822,20 +1822,12 @@ static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
>  		return ret;
>  	}
>  
> -	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> -					 BIT_ULL(0));
> -	if (ret) {
> -		rcsi2_enter_standby(priv);
> -		return ret;
> -	}
> -
>  	return 0;
>  }
>  
>  static void rcsi2_stop(struct rcar_csi2 *priv)
>  {
>  	rcsi2_enter_standby(priv);
> -	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
>  }
>  
>  static int rcsi2_enable_streams(struct v4l2_subdev *sd,
> @@ -1857,6 +1849,14 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
>  			return ret;
>  	}
>  
> +	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> +					 BIT_ULL(0));
> +	if (ret) {
> +		if (priv->stream_count == 0)
> +			rcsi2_stop(priv);
> +		return ret;
> +	}
> +
>  	priv->stream_count += 1;
>  
>  	return ret;
> @@ -1867,7 +1867,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
>  				 u32 source_pad, u64 source_streams_mask)
>  {
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	int ret = 0;
> +	int ret;
>  
>  	if (source_streams_mask != 1)
>  		return -EINVAL;
> @@ -1878,9 +1878,14 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
>  	if (priv->stream_count == 1)
>  		rcsi2_stop(priv);
>  
> +	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
> +					  BIT_ULL(0));
> +	if (ret)
> +		return ret;
> +
>  	priv->stream_count -= 1;
>  
> -	return ret;
> +	return 0;
>  }

rcsi2_irq_thread() also calls rcsi2_stop(), followed by rcsi2_start().
This is to handle errors reported by the AFIFO_OF, ERRSOTHS and
ERRSOTSYNCHS interrupts. If the source isn't restarted, such an attempt
to recover from errors will likely fail. On the other hand, restarting
the source will likely not lead to great results either.

Error handling was introduced in

commit 4ab44ff0841b9a825f9875623d24809d29e37a10
Author: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Date:   Thu Apr 11 16:30:58 2019 -0400

    media: rcar-csi2: restart CSI-2 link if error is detected

    Restart the CSI-2 link if the CSI-2 receiver detects an error during
    reception. The driver did nothing when a link error happened and the
    data flow simply stopped without the user knowing why.

    Change the driver to try and recover from errors by restarting the link
    and informing the user that something is not right. For obvious reasons
    it's not possible to recover from all errors (video source disconnected
    for example) but in such cases the user is at least informed of the
    error and the same behavior of the stopped data flow is retained.

Niklas, do you recall anything about the errors you saw ?

>  
>  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> 

-- 
Regards,

Laurent Pinchart

