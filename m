Return-Path: <linux-media+bounces-60305-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIIuIJ+e+GnHxAIAu9opvQ
	(envelope-from <linux-media+bounces-60305-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 15:26:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB424BDDD8
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 15:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FDF8303EB6A
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 13:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4583D9DB5;
	Mon,  4 May 2026 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u+gbxfDK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CD93C456D
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900939; cv=none; b=GDo2wCruO3UxVLNSs7RgNTIGM/EsKj/yegFSKgXuWWaGY/kMNbU3jwmW6ymirHKixkGEnmShf8Eb9iUMLUZo1iCJEdwaLbW62CtOEYgMzF7QGoSPxV2qDiyQuONRt/G90bFmSgfnzZ6wKdV6LNkSEDufCTcbfLCjQT+tjBY6kLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900939; c=relaxed/simple;
	bh=W3CN97qP6afD4yAvPDQST1Pd9/ZzjfuD1DjcKlTqkzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khPEsIhKtHH+VCNzXm76d2JSZAcVwj6hrBKCq+wCAP9R+0u6DB6Hts0CeOIaRfVmC2ZSN8hOF+wO0I7fH5FLyjcI4DSBvUkx+foVex9EGEFi2R7EbD3dhsQ9/K8oyBRbiX75jr2BCzWfqSG8dHpRIKqL0i9OdHcQWfQGEk+GeSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u+gbxfDK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BE399C;
	Mon,  4 May 2026 15:22:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777900934;
	bh=W3CN97qP6afD4yAvPDQST1Pd9/ZzjfuD1DjcKlTqkzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+gbxfDKkGiuuV+daWhi8gI1qOtijL4wzs0GPGpCb+uQNvvkgJSDHp9Sq7vVudwL6
	 f6tiy5OoHVRXO/7q3goROJRY+3KaIn+akk34GFMAYfilvYSRc8Kb63lwtNdOX4sDKo
	 jL79G/MFo5uBLiC7ZUR0JvohkO7nxa3UnaZ7ZDXY=
Date: Mon, 4 May 2026 16:22:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, David Heidelberg <david@ixit.cz>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 1/1] media: v4l2-subdev: Fail {enable,disable}_streams
 and s_streaming nicely
Message-ID: <20260504132214.GA1371451@killaraus.ideasonboard.com>
References: <20260504123503.417044-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504123503.417044-1-sakari.ailus@linux.intel.com>
X-Rspamd-Queue-Id: 1CB424BDDD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60305-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]

On Mon, May 04, 2026 at 03:35:03PM +0300, Sakari Ailus wrote:
> If a sub-device does not set enable_streams() and disable_streams() pad
> ops while it sets the s_stream() video op to
> v4l2_subdev_s_stream_helper(), enabling or disabling streaming either way
> on the sub-device will result calling v4l2_subdev_s_stream_helper() and
> v4l2_subdev_{enable,disable}_streams() recursively, exhausting the stack.
> Return -ENOIOCTLCMD in this case to handle the situation gracefully.
> 
> Reported-by: David Heidelberg <david@ixit.cz>
> Fixes: b62949ddaa52 ("media: subdev: Support single-stream case in v4l2_subdev_enable/disable_streams()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v2:
> 
> - Move the check, with checking the pad ops, to
>   v4l2_subdev_s_stream_helper().
> 
>  drivers/media/v4l2-core/v4l2-subdev.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 831c69c958b8..3b726f044d3f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2504,6 +2504,10 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
>  	u64 source_mask = 0;
>  	int pad_index = -1;
>  
> +	if (WARN_ON_ONCE(!v4l2_subdev_has_op(sd, pad, enable_streams) ||
> +			 !v4l2_subdev_has_op(sd, pad, disable_streams)))

Is this indicates a clear bug, I would use WARN_ON() instead of
WARN_ON_ONCE(). Up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +		return -ENOIOCTLCMD;
> +
>  	/*
>  	 * Find the source pad. This helper is meant for subdevs that have a
>  	 * single source pad, so failures shouldn't happen, but catch them

-- 
Regards,

Laurent Pinchart

