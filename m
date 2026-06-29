Return-Path: <linux-media+bounces-65854-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uNQHBsAjQmp80wkAu9opvQ
	(envelope-from <linux-media+bounces-65854-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:50:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4817B6D72AB
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:50:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=rM9Vrckt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65854-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65854-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6650231E7F7A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F402F3E024F;
	Mon, 29 Jun 2026 07:40:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDC13C8728;
	Mon, 29 Jun 2026 07:39:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718801; cv=none; b=rH9+By25MRkVPsfVwuDNtI8sGfYNA1BeKmIUKe+Y8GxjULD0mKdc3y5yZcGfUhqflbd7vTxw1skVbKfDE5pLB8PPxJKG986BQQWXENX6YCrzAqEwXflE0LZlwBsfz5c84W3ZQeZc9cs71hbVR/s6d2GFb0WBBDaaXUa2rHeBcgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718801; c=relaxed/simple;
	bh=iZ+bTxB6BAzrgby2gB7z3ltOwLFcZlpSnkzPDuT05bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4cOXuq5y7t51AHTbJ+Jecn5Qegmj4mqsk11vRKkNtoqCKm0FmrnPn6YTh+ho3wVBGr9ZhwpMm5DR/JNCbxrtag9nP4qf64YWErdexDu7SJGFdMN/cMeEkiFdhPNb+DLqJ5d7uBBjzDKnaElSVVdfugtP5cwfIwlYyHJm5Abymk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rM9Vrckt; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-109-113-0-8.net.vodafone.it [109.113.0.8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7F6C324;
	Mon, 29 Jun 2026 09:39:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782718751;
	bh=iZ+bTxB6BAzrgby2gB7z3ltOwLFcZlpSnkzPDuT05bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rM9Vrcktsu89Lza2eRZsdUez8zKvXaqK3QGi8maFYs6Z/uAMC6b1vG7j4siQtujql
	 wHT8BM+tbRIvYLrNKW9VK85Mh7dcS0mLSfgZmk19T9gmT68rgytTFkVc3jNHW6Bm29
	 FbU0RlLFx5CFCJQgcfU7JkrBv2Gnzd7Fn/uy9N0w=
Date: Mon, 29 Jun 2026 09:39:49 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix double mutex_destroy on capture dev
 register error
Message-ID: <akIhCZqfi6o7tYqJ@zed>
References: <20260628050503.16048-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260628050503.16048-1-devnexen@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devnexen@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65854-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4817B6D72AB

Hi David

On Sun, Jun 28, 2026 at 06:05:03AM +0100, David Carlier wrote:
> In mali_c55_register_cap_dev(), a failure of media_entity_pads_init()
> destroys cap_dev->lock inline and then jumps to err_destroy_mutex, which
> destroys the same mutex a second time. The switch default case just above
> already handles this correctly by jumping straight to the label without an
> inline destroy.
>
> Drop the inline mutex_destroy() and rely on the err_destroy_mutex label,
> so the mutex is destroyed exactly once on every error path.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")

Calling mutex_destroy() twice should be harmless, I don't think this
qualfies as a fix ?

And in any case, remember to Cc: stable whenever you send a Fixes.

> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-capture.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
> index 7aaa5c3f7..ff0155302 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
> @@ -857,10 +857,8 @@ static int mali_c55_register_cap_dev(struct mali_c55 *mali_c55,
>
>  	cap_dev->pad.flags = MEDIA_PAD_FL_SINK;
>  	ret = media_entity_pads_init(&cap_dev->vdev.entity, 1, &cap_dev->pad);
> -	if (ret) {
> -		mutex_destroy(&cap_dev->lock);
> +	if (ret)
>  		goto err_destroy_mutex;
> -	}

Indeed!
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>  	vb2q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>  	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
> --
> 2.53.0
>
>

