Return-Path: <linux-media+bounces-61775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAxTIshlB2qE1gIAu9opvQ
	(envelope-from <linux-media+bounces-61775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 20:28:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C4F556359
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 20:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF869311F776
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 18:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8329A30C14A;
	Fri, 15 May 2026 18:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="CnVQwm8C";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="saDUxoaG"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0824F7983;
	Fri, 15 May 2026 18:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778869271; cv=none; b=gkHtzZjZGT/8F2tANHmIPNi1wkerD2wQueTWS9KFU8jTIAlVyyCB+739Y+xpt80ZIXaKG82lZhVi3F99nhY3adBt2Vkymi1955ZzreQgMZ/jrjME63rHFM3mVqYI56l246ZnxgfCAbamFsev6sl7kgDZ/hBBjwbZTFfk+YQ4cxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778869271; c=relaxed/simple;
	bh=A8LZ16C0PLsxZDw23ckMUuOiS308P78uhsVPGJh0Fyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inAd/GoM+lRJMg+GSRc/JlkuSVEBWH3T6A56s5s/BX4EI+Lz9svTUM7fjPJ75j+kWmTifkdeAsM705Z1mQQbqWyK8z7147T7Z7S9Np/1IwORU4bp7FExpot8eXiAcU0O3YuQ0n1eG/iA3gOHuQN3CVtGqLwOws4WLidY4Jhacu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=CnVQwm8C; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=saDUxoaG; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 55324EC017B;
	Fri, 15 May 2026 14:21:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 15 May 2026 14:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778869267;
	 x=1778955667; bh=W6cx5qdD+edCzHAver+1C0mROrlIvuy+t8PF26O1fow=; b=
	CnVQwm8C5VeH3NHL5xsLPR4aYX8G6e/XxJpLJU1ydLjgFNrMvOirRe6sn4AB73aD
	DO97dPWooCkbWBi7O9vxO1q+61C1i8Il4bGXVU+I5M3EHnMNHrV/LqhPK2Z+wYYf
	e7eQyRApbk/az6UjLY5uiJUNv5IokgDwa3DanzJw9TUOLBBN7fX2tTzRfWjX/duH
	Fox6Mbwd+Sti/LwjhNiXd8bPRLz1W5UxjDnnnE5T0hQZ49k6oMr9yOseAUR8ML/G
	B9EwoNP9O5fsL/2SHtJHIieH+7SwVhMZrPnRb7MMb4OtMfe9bUXY6umot37dncHA
	r6HQuiw0kegvlJbBY6Pj9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778869267; x=
	1778955667; bh=W6cx5qdD+edCzHAver+1C0mROrlIvuy+t8PF26O1fow=; b=s
	aDUxoaG3ka+wD3rWXqQPWRUfJsohKTyD2Li3PKUducsFlrvFMw7Oez6l2zvj+UHQ
	xPv7t+YjzMOayDMHxdSf2wUTJeBb+PqAPQUWgG0plCD5h6ex4rBRZJ08gYWahgZE
	gR5MGjiUAevcZkphHNkwdXJgWKz+8HLVDuxni33QiMLwIFafXyN8t+rcMja5rxuf
	Ert3zsdIc2VxZf4TbuNsq8PIN0P6n7AYykxhNO43GHHphwAAKqGXh8FLLFCy5kfx
	rsJBSyr+kzJhgxUPgGwf6geYfJ/JwmM41KS+ChjkRJfGH39lpSD47fsxwRyrf+5a
	mG8WqHIGI1JMMPRdwvzAw==
X-ME-Sender: <xms:E2QHaqjgKAwIu27N41-bGEoVI1MQZaVQwQePEBbZisd9_b_aECyrhw>
    <xme:E2QHajJpHd2Zyd84lA3mEsvNUHXaLS3UeMMq_Rr8wwbGnbc-BpcPvXz_vgr37rfEa
    d9myDxYFBVSZlBZ72-6tz30CuCzVxtb78OxcOBGPB8IgZi6GjqAZQ>
X-ME-Received: <xmr:E2QHahnEubFHfLEj79GhYzExrQ0Inx-MS2d1w_OpHgtwkaUtY_KebjRn345i4umTOf36uglXB_ytTRj9-KovZ4TxClbK8VHJNdJJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeduuddtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:E2QHajNzvVmVBMSKs60VZB6eowtx-Uf9PNxyKv5CbzmWXuHgmpTU4A>
    <xmx:E2QHaj4AHlUmS1fUYzJeragHX1lP8ATAwDr9ZHAeu8tCH3mHC-rCgw>
    <xmx:E2QHavZtk5SDH6URdXvAVZ4sZ7m-EiQqbXeo3Xabeu8_mbJ_H3N_pg>
    <xmx:E2QHaofgQgPcj3srU0ai3AG6rf3edchdVHxVAVxiUBY44QACUKESng>
    <xmx:E2QHai_poTbwv92dzW8Qbazj2APdD_L-BjLNatwrwwrdIFLz8G-SieLD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 May 2026 14:21:06 -0400 (EDT)
Date: Fri, 15 May 2026 20:21:05 +0200
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
Subject: Re: [PATCH 3/6] media: v4l2-isp: Rename v4l2_isp_params_buffer_size
Message-ID: <20260515182105.GS332351@ragnatech.se>
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <20260505-extensible-stats-v1-3-e16f326b8dad@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505-extensible-stats-v1-3-e16f326b8dad@ideasonboard.com>
X-Rspamd-Queue-Id: E1C4F556359
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
	TAGGED_FROM(0.00)[bounces-61775-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim]
X-Rspamd-Action: no action

Hello Jacopo,

Thanks for your patch.

On 2026-05-05 16:12:14 +0200, Jacopo Mondi wrote:
> Rename v4l2_isp_params_buffer_size() to v4l2_isp_buffer_size() to
> support statistics.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../media/platform/arm/mali-c55/mali-c55-params.c  | 12 ++++++------
>  include/media/v4l2-isp.h                           | 22 +++++++++++++---------
>  2 files changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index de0e9d898db7..dc483f0322d6 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -487,7 +487,7 @@ static int mali_c55_params_g_fmt_meta_out(struct file *file, void *fh,
>  {
>  	static const struct v4l2_meta_format mfmt = {
>  		.dataformat = V4L2_META_FMT_MALI_C55_PARAMS,
> -		.buffersize = v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
> +		.buffersize = v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
>  	};
>  
>  	f->fmt.meta = mfmt;
> @@ -540,13 +540,13 @@ mali_c55_params_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
>  	if (*num_planes && *num_planes > 1)
>  		return -EINVAL;
>  
> -	if (sizes[0] && sizes[0] < v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE))
> +	if (sizes[0] && sizes[0] < v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE))
>  		return -EINVAL;
>  
>  	*num_planes = 1;
>  
>  	if (!sizes[0])
> -		sizes[0] = v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
> +		sizes[0] = v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
>  
>  	return 0;
>  }
> @@ -556,7 +556,7 @@ static int mali_c55_params_buf_init(struct vb2_buffer *vb)
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>  	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
>  
> -	buf->config = kvmalloc(v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
> +	buf->config = kvmalloc(v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
>  			       GFP_KERNEL);
>  	if (!buf->config)
>  		return -ENOMEM;
> @@ -583,7 +583,7 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
>  	int ret;
>  
>  	ret = v4l2_isp_params_validate_buffer_size(mali_c55->dev, vb,
> -			v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
> +			v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
>  	if (ret)
>  		return ret;
>  
> @@ -593,7 +593,7 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
>  	 * changed to the buffer content whilst the driver processes it.
>  	 */
>  
> -	memcpy(buf->config, config, v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
> +	memcpy(buf->config, config, v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
>  
>  	return v4l2_isp_params_validate_buffer(mali_c55->dev, vb, buf->config,
>  					       mali_c55_params_block_types_info,
> diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
> index f3a6d0edcb24..d70ed6b431e7 100644
> --- a/include/media/v4l2-isp.h
> +++ b/include/media/v4l2-isp.h
> @@ -15,17 +15,21 @@ struct device;
>  struct vb2_buffer;
>  
>  /**
> - * v4l2_isp_params_buffer_size - Calculate size of v4l2_isp_params_buffer
> - * @max_params_size: The total size of the ISP configuration blocks
> + * v4l2_isp_buffer_size - Calculate size of v4l2_isp_buffer
> + * @max_size: The total size of the ISP configuration or statistics blocks
> + *
> + * Users of v4l2-isp will have differing sized data arrays for parameters and
> + * statistics, depending on their specific blocks. Drivers need to be able to
> + * calculate the appropriate size of the buffer to accommodate all ISP blocks
> + * supported by the platform. This macro provides a convenient tool for the
> + * calculation.
> + *
> + * The intended users of this function are drivers initializing the size
> + * of their metadata (parameters and statistics) buffers.
>   *
> - * Users of the v4l2 extensible parameters will have differing sized data arrays
> - * depending on their specific parameter buffers. Drivers and userspace will
> - * need to be able to calculate the appropriate size of the struct to
> - * accommodate all ISP configuration blocks provided by the platform.
> - * This macro provides a convenient tool for the calculation.
>   */
> -#define v4l2_isp_params_buffer_size(max_params_size) \
> -	(offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
> +#define v4l2_isp_buffer_size(max_size)			\
> +	(offsetof(struct v4l2_isp_buffer, data) + (max_size))
>  
>  /**
>   * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
> 
> -- 
> 2.53.0
> 

-- 
Kind Regards,
Niklas Söderlund

