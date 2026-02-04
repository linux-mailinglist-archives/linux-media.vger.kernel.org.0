Return-Path: <linux-media+bounces-52206-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GlaNgh4g2mFmwMAu9opvQ
	(envelope-from <linux-media+bounces-52206-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 17:47:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57744EA72B
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 17:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8FAE303E4AC
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 16:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD9731BC94;
	Wed,  4 Feb 2026 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SiHcPyGf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A212F6160;
	Wed,  4 Feb 2026 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223439; cv=none; b=n0rlvGjVRPGLtpucpjLTgNzMOyBPVK3DjbZe19/3L0JHbGzO4sZVZNcZdU3bso4RGnn5fDcFI9D+5db1/yaZpgSDzY/Vtpsivd0XqPxsfwYZk3JiloGipWtcNV//BwqgIStF+isjvQITovM+EiQZuyNIo7xsTWPvTeoCSq51seQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223439; c=relaxed/simple;
	bh=qldJ6sgrNVhQ6+tMXyVzxSoNgaT7hsfl7eFw2SC7SYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JImd/q1T0XxS4ozZVzQN6zZfzjxhKVJw5HKwtFHAYRP4DZEYbyXCsA96rl84ENBpNtghpwAbJ/fITk86AYgH/gqjLDES3nnSI9RzfCRreahkdgMSofyfc1FbcTmwwK9XTM1qcxw/Fng6SktlgtctbeLDzoN7YWpMtxOiwBS9Ts8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SiHcPyGf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 88E73593;
	Wed,  4 Feb 2026 17:43:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770223395;
	bh=qldJ6sgrNVhQ6+tMXyVzxSoNgaT7hsfl7eFw2SC7SYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SiHcPyGf0AEpN8eWR17GhmL1DwNCRD7xM0HnZ15NDAzsVpgnO5N9uwJTLJkHgTEvc
	 o+rq9bafM9vx45FqFPuBhhDISq38Z0LN64vyUwhwJwWmEobPKoHpWVxFRFofKFh5C1
	 uS6hMnz87sngNVI0SPpXjgaFfAKmszYC7YkK9lYE=
Date: Wed, 4 Feb 2026 18:43:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dafna@fastmail.com, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/6] media: rkisp1-resizer: Add YUV source formats to
 resizer
Message-ID: <20260204164356.GC170964@killaraus>
References: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
 <20260204112506.3706049-2-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204112506.3706049-2-isaac.scott@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52206-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,fastmail.com,kernel.org,sntech.de,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 57744EA72B
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 11:25:01AM +0000, Isaac Scott wrote:
> To be able to use YUV bypass, YUV formats need to be available on the
> source pad of the rkisp1 resizer. Add them.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c     | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> index 8e6b753d3081..e72b76ab078c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> @@ -23,11 +23,26 @@ struct rkisp1_rsz_yuv_mbus_info {
>  };
>  
>  static const struct rkisp1_rsz_yuv_mbus_info rkisp1_rsz_yuv_src_formats[] = {
> +	{
> +		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8, /* YUV422 */
> +		.hdiv		= 1,
> +		.vdiv		= 1,
> +	},
> +	{
> +		.mbus_code	= MEDIA_BUS_FMT_VYUY8_2X8, /* YUV422 */
> +		.hdiv		= 1,
> +		.vdiv		= 1,
> +	},
>  	{
>  		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8, /* YUV422 */
>  		.hdiv		= 2,
>  		.vdiv		= 1,
>  	},
> +	{
> +		.mbus_code	= MEDIA_BUS_FMT_YVYU8_2X8, /* YUV422 */
> +		.hdiv		= 1,

Shouldn't hdiv be 2 for all those new formats ?

But overall, I don't think those formats are needed. I would be very
surprised if the resizer used different YUV orders on its output bus.
Can't you use MEDIA_BUS_FMT_YUYV8_2X8 unconditionally ?

> +		.vdiv		= 1,
> +	},
>  	{
>  		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1_5X8, /* YUV420 */
>  		.hdiv		= 2,

-- 
Regards,

Laurent Pinchart

