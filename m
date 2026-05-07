Return-Path: <linux-media+bounces-60815-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOKmOMua/Gk6RwAAu9opvQ
	(envelope-from <linux-media+bounces-60815-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:59:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 438014E9BF3
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E703C303988B
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B283FA5C8;
	Thu,  7 May 2026 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rWTVjPNT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D06A3F1676
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162155; cv=none; b=BXzVa+NyH4x+vEI5YNYM6Rn7pFYKtbFngvavLDTltqiaTKHrJQJBpGlTJ1ZK3FMFxvNPE+8O6J5Mi/tPggmQTS4wNLOjQECqhkekgb1nCH0uqIDOztYp5QjF7y6Aj/cPlO2gSayzyS2kEjbmQ/aPQL6Fa4U1qUhtyWTlCVqJYA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162155; c=relaxed/simple;
	bh=D2CqLNCBvuH092JgC/5E4e8pPw4mrmtnYBetARoYRrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eestyD6CJOgoL979A/MXH8TPCgN9OkXoejL9tlpDupLQbvEAE29mh3NhLOCeM5dBNK8i0YQEkOQpCWEZPdnPSjST+QItU/T+MISCqncnU3dX5AZSbySuyFdEUM9MSy5IZh1iVqBfqRGPI37fjg2GnvpzvYBe3CcraAfthDAD2TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rWTVjPNT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0ECC09CE;
	Thu,  7 May 2026 15:55:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778162149;
	bh=D2CqLNCBvuH092JgC/5E4e8pPw4mrmtnYBetARoYRrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWTVjPNTrlVwlbMPOc7siyvmbPcrp8eIZxnT3QOTC/A8KUEuWpiB+mLDhVNbRjv9F
	 VSJFA3dPAypZJei8vfYGR9Z9LLvOT/rYZtTil/a3l0VF+Gnuht/Y3vpuuomKW5Zz6V
	 /JhQXBhSYstZFtkzFMGvZEWFvAtVH3+ueKpIq90k=
Date: Thu, 7 May 2026 16:55:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, paulk@sys-base.io,
	mchehab@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 2/3] media: sun6i-csi: capture: Implement
 vidioc_enum_framesizes
Message-ID: <20260507135551.GG1938994@killaraus.ideasonboard.com>
References: <20260217064050.18388-1-arash.golgol@gmail.com>
 <20260217064050.18388-3-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217064050.18388-3-arash.golgol@gmail.com>
X-Rspamd-Queue-Id: 438014E9BF3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-60815-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 10:10:49AM +0330, Arash Golgol wrote:
> Report the stepwise frame size range supported by the CSI capture
> hardware for the pixel formats exposed by the driver.
> 
> The hardware does not perform scaling and accepts any even width and
> height within the reported limits.
> 
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index a21a146fb02a..dd06d4c116e0 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -738,6 +738,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
>  	return 0;
>  }
>  
> +static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
> +					     struct v4l2_frmsizeenum *fsize)
> +{
> +	if (fsize->index)
> +		return -EINVAL;
> +
> +	/* Only accept format in map table. */
> +	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
> +		return -EINVAL;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
> +	fsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
> +	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
> +	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
> +	fsize->stepwise.step_width = 2;
> +	fsize->stepwise.step_height = 2;
> +
> +	return 0;
> +}
> +
>  static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
>  				   struct v4l2_format *format)
>  {
> @@ -805,6 +826,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
>  	.vidioc_querycap		= sun6i_csi_capture_querycap,
>  
>  	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
> +	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesize,
>  	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
>  	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
>  	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,

-- 
Regards,

Laurent Pinchart

