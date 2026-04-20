Return-Path: <linux-media+bounces-59183-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOG0Fi6g5mmyywEAu9opvQ
	(envelope-from <linux-media+bounces-59183-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 23:52:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD2143462C
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 23:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79C4A3006D6A
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 21:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB9D3B961D;
	Mon, 20 Apr 2026 21:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CiMuZyjb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9E9258EC2
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 21:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776721958; cv=none; b=fLCNBkZXTNDSO6vvWraf9wjgRCORZKLrnWt/TZ0YVIolwBefd3pkmiuPIvkYHGdh92whntA6wxvJMOfj49eXOx0P/dBz8FSNTGSpVyL4XY5lE9QTGF5htN27l8BZou9+cFXLCBCC76QgODJxOTDV4sp2K2V1uhXCBbed1SmJdto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776721958; c=relaxed/simple;
	bh=IlxkQ7byhbZcpiL5h0Kn3n7v6cR3ECbTkJ8f3+GJ0wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1fOFee9GeJhQykrnG3GNclZPZDsdSCUz2HWsPJ3TBCdvrpRaxdlsimSzIBflWRECTa3YhWFS84KEdvShc+P9riESEEgQzptMLFNEqKZdkJ5WMQGCPgGv6snbf/WRmauXwZP/IBrZ4V5A8bGQyYlATDIgMODyIBz3d+EQo/N93c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CiMuZyjb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DCE772451;
	Mon, 20 Apr 2026 23:50:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776721851;
	bh=IlxkQ7byhbZcpiL5h0Kn3n7v6cR3ECbTkJ8f3+GJ0wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CiMuZyjbL8gtdDvNORhR0J2QYDfH4iV8/DS/EplEkAT+IM3Z0FpBKDW317b2gopkZ
	 o3URj340qT5dNhm6MrHzNz9bowu+FqF2fgA5ATdZxE0aJDYd2QMCfR0Vt311ayF2n+
	 Kl2u0xQGoRAjY306bDNFlMLQ9/0yXalThKuCDlqc=
Date: Tue, 21 Apr 2026 00:52:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH] drivers: media: remove V4L2_FL_USES_V4L2_FH
Message-ID: <20260420215226.GA2360857@killaraus.ideasonboard.com>
References: <20260420142917.652245-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420142917.652245-1-oneukum@suse.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59183-lists,linux-media=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 5CD2143462C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oliver,

Thank you for the patch.

On Mon, Apr 20, 2026 at 04:29:17PM +0200, Oliver Neukum wrote:
> As usage of the feature is mandatory there is no point
> in keeping the flag for it.

The point of the flag is to make sure all drivers call v4l2_fh_init()
(directly our by using the v4l2_fh_open() helper), as part of the
transition towards making this mandatory. This was merged in v6.18. As
I haven't heard of any regression, I assume all commonly used drivers
have been properly converted. Less commonly used drivers, however, may
not have been tested correctly. If we drop this flag now we'll crash
instead of returning an error. I feel we should keep the safeguard for a
while still, ideally replacing it with a mechanism that ensures all
drivers use the V4L2 fh API.

> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 8 --------
>  drivers/media/v4l2-core/v4l2-fh.c  | 1 -
>  include/media/v4l2-dev.h           | 5 -----
>  3 files changed, 14 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 6ce623a1245a..5db1461d2159 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -431,14 +431,6 @@ static int v4l2_open(struct inode *inode, struct file *filp)
>  	}
>  
>  	ret = vdev->fops->open(filp);
> -	if (ret)
> -		goto done;
> -
> -	/* All drivers must use v4l2_fh. */
> -	if (WARN_ON(!test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags))) {
> -		vdev->fops->release(filp);
> -		ret = -ENODEV;
> -	}
>  
>  done:
>  	if (vdev->dev_debug & V4L2_DEV_DEBUG_FOP)
> diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
> index b184bed8aca9..8741e623bd17 100644
> --- a/drivers/media/v4l2-core/v4l2-fh.c
> +++ b/drivers/media/v4l2-core/v4l2-fh.c
> @@ -24,7 +24,6 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
>  	/* Inherit from video_device. May be overridden by the driver. */
>  	fh->ctrl_handler = vdev->ctrl_handler;
>  	INIT_LIST_HEAD(&fh->list);
> -	set_bit(V4L2_FL_USES_V4L2_FH, &fh->vdev->flags);
>  	/*
>  	 * determine_valid_ioctls() does not know if struct v4l2_fh
>  	 * is used by this driver, but here we do. So enable the
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index 2e0f6d2e6a78..7201f7787ce0 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -71,10 +71,6 @@ struct dentry;
>   *	indicates that a &struct video_device is registered.
>   *	Drivers can clear this flag if they want to block all future
>   *	device access. It is cleared by video_unregister_device.
> - * @V4L2_FL_USES_V4L2_FH:
> - *	indicates that file->private_data points to &struct v4l2_fh.
> - *	This flag is set by the core when v4l2_fh_init() is called.
> - *	All drivers must use it.
>   * @V4L2_FL_QUIRK_INVERTED_CROP:
>   *	some old M2M drivers use g/s_crop/cropcap incorrectly: crop and
>   *	compose are swapped. If this flag is set, then the selection
> @@ -92,7 +88,6 @@ struct dentry;
>   */
>  enum v4l2_video_device_flags {
>  	V4L2_FL_REGISTERED		= 0,
> -	V4L2_FL_USES_V4L2_FH		= 1,
>  	V4L2_FL_QUIRK_INVERTED_CROP	= 2,
>  	V4L2_FL_SUBDEV_RO_DEVNODE	= 3,
>  };

-- 
Regards,

Laurent Pinchart

