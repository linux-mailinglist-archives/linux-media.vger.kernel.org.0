Return-Path: <linux-media+bounces-56699-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGgVM34hwWmTQwQAu9opvQ
	(envelope-from <linux-media+bounces-56699-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:18:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB9D2F1120
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0848B3019836
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFAD366060;
	Mon, 23 Mar 2026 11:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VDqR1unu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC1638C2B8
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 11:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264247; cv=none; b=BnnovPliOlLHTZF5ZJnCQhSER5hU3dcjBY/gyLmPMmrvcNkE0mqQGftaNZ/+oLrQcCd0/NJUB/PTT2/X1qFGXjq32GxScZM+TEuiNuSMh5l8QsZidJ7sj4nW1unXPAIMdLREKxhLryz62dzwXWAf+T7CnrGKRmUFK8UIpYPin7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264247; c=relaxed/simple;
	bh=5R8/djPsY1Mv2N9GdBrcK1OgOtW4u7+3OKWE9REpgAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqeC+OJDq6AUkbkJj6E+5EGytSFWUMgLamAuKUgCVM6zcvj0Qel99A/RoFQKJ4enzjqfnAq86DTsxrtWEI5kW2XGTCxKSirwjDEADeauIbW5jAbG8vNEq6lNQCWYaNdW5sJViEQXzeq/kHbhwyvmoZ6kLRf2n1pgKoB8vSsw+CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VDqR1unu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 615D9591;
	Mon, 23 Mar 2026 12:09:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774264167;
	bh=5R8/djPsY1Mv2N9GdBrcK1OgOtW4u7+3OKWE9REpgAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VDqR1unua5+0ml52N/ZTUgZbzO5OvXkgcAI0NPleRTpLaC9qDJzmydH72soyWtx8V
	 41kSJ+TPdcJhIGxFKhXoCnJIvRwapIPe8V+RlXQPoCwOHIGLjYXWniRgUnXtTiqN3e
	 e3Xg48KldplSNQTEBNVjmP13T5ev3o0bUoo2tob8=
Date: Mon, 23 Mar 2026 13:10:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, David Heidelberg <david@ixit.cz>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 1/1] media: v4l2-subdev: Fail {enable,disable}_streams
 and s_streaming nicely
Message-ID: <20260323111042.GC1514659@killaraus.ideasonboard.com>
References: <20260323105655.743792-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323105655.743792-1-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56699-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid,ixit.cz:email]
X-Rspamd-Queue-Id: 6BB9D2F1120
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 12:56:55PM +0200, Sakari Ailus wrote:
> If a sub-device does not set enable_streams() and disable_streams() pad
> ops while it sets the s_stream() video op to
> v4l2_subdev_s_stream_helper(), enabling or disabling streaming either way
> on the sub-device will result calling v4l2_subdev_s_stream_helper() and
> v4l2_subdev_{enable,disable}_streams() recursively, exhausting the stack.
> Return -ENOIOCTLCMD in this case to handle the situation gracefully.

This is not a valid use case, right ? Can we WARN() ?

> Reported-by: David Heidelberg <david@ixit.cz>
> Fixes: b62949ddaa52 ("media: subdev: Support single-stream case in v4l2_subdev_enable/disable_streams()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
> 
> - Better patch description.
> 
>  drivers/media/v4l2-core/v4l2-subdev.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 831c69c958b8..f8ea4afc6cbb 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2334,11 +2334,13 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>  
>  	/* Fallback on .s_stream() if .enable_streams() isn't available. */
>  	use_s_stream = !v4l2_subdev_has_op(sd, pad, enable_streams);
> -
> -	if (!use_s_stream)
> +	if (!use_s_stream) {
>  		state = v4l2_subdev_lock_and_get_active_state(sd);
> -	else
> +	} else {
> +		if (!v4l2_subdev_has_op(sd, video, s_stream))
> +			return -ENOIOCTLCMD;
>  		state = NULL;
> +	}
>  
>  	/*
>  	 * Verify that the requested streams exist and that they are not
> @@ -2435,11 +2437,13 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>  
>  	/* Fallback on .s_stream() if .disable_streams() isn't available. */
>  	use_s_stream = !v4l2_subdev_has_op(sd, pad, disable_streams);
> -
> -	if (!use_s_stream)
> +	if (!use_s_stream) {
>  		state = v4l2_subdev_lock_and_get_active_state(sd);
> -	else
> +	} else {
> +		if (!v4l2_subdev_has_op(sd, video, s_stream))
> +			return -ENOIOCTLCMD;
>  		state = NULL;
> +	}
>  
>  	/*
>  	 * Verify that the requested streams exist and that they are not

-- 
Regards,

Laurent Pinchart

