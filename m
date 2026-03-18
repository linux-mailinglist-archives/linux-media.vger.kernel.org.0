Return-Path: <linux-media+bounces-56223-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFCqATvgumk3cwIAu9opvQ
	(envelope-from <linux-media+bounces-56223-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 18:26:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE242C0394
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 18:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EEC4327649E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 16:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DB9402B90;
	Wed, 18 Mar 2026 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OChzYNyC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C283B7B76;
	Wed, 18 Mar 2026 16:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851133; cv=none; b=qCQAlHcmiTAi3nFlpeeAoBWpDOazOvl7rrs949BiN4wy/+G4eRx1wJvPa1wiD76E5WDHb04dTk2HeUmAnsASHiUMHPUY6QZShi8Ssp8pCljQ/IpEYAapUMGorz29JnU7DAqs3TIgN04DlA2jLob2+BZhCtQJhxpKiwoObps/3yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851133; c=relaxed/simple;
	bh=Nkpha0qlqSFLzXXyWaDpdsimdKYN3sJq9jg2KEqZn+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2HD/8EH4ZTZBk+UBnrglUG0ISZ0iFxehtMsauwrxQwe0QI0pTiQJZd3A6k5l84XA0k1AiojhdRL5qHjv46A5EQHsu0IzaznZwmtmutvzEmp0MfnymMNhFYVoGvaCDqHffHFJXh6jzQJ6JeeFFnf75GmOYUJUxCzMXB5fa3qeUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OChzYNyC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C6A03379;
	Wed, 18 Mar 2026 17:24:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773851055;
	bh=Nkpha0qlqSFLzXXyWaDpdsimdKYN3sJq9jg2KEqZn+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OChzYNyC9V4EMwx8E5gG4Au0EDSeQGbduj51l/MgmchXmC5VkhCIelfTfq6pnNB48
	 8YoYKacnKlwVmmgSh/T1DAFCFDkkhdolH1hGntlYqps/6vWNDX69S0OYVw3FJ1vIaK
	 mVOIKgqCtA4gqJZ6ZfxumSC4vmSTP+BLw2WT6Hw0=
Date: Wed, 18 Mar 2026 18:25:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v2 2/3] media: subdev: Minor
 v4l2_subdev_get_frame_desc_passthrough() cleanups
Message-ID: <20260318162526.GE633439@killaraus.ideasonboard.com>
References: <20260317-frame-desc-passthrough-impro-v2-0-0c93b437d85d@ideasonboard.com>
 <20260317-frame-desc-passthrough-impro-v2-2-0c93b437d85d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317-frame-desc-passthrough-impro-v2-2-0c93b437d85d@ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56223-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 5EE242C0394
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tomi,

Thank you for the patch.

On Tue, Mar 17, 2026 at 02:09:41PM +0200, Tomi Valkeinen wrote:
> Minor code cleanups, no functional change.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 9efd14d4026f..2757378c628a 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2549,14 +2549,13 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  					   unsigned int pad,
>  					   struct v4l2_mbus_frame_desc *fd)
>  {
> -	const struct media_pad *pads = sd->entity.pads;
>  	struct media_pad *local_sink_pad;
>  	struct v4l2_subdev_route *route;
>  	struct v4l2_subdev_state *state;
>  	struct device *dev = sd->dev;
>  	int ret = 0;
>  
> -	if (WARN_ON(!(pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
> +	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
>  		return -EINVAL;
>  
>  	state = v4l2_subdev_lock_and_get_active_state(sd);
> @@ -2577,7 +2576,6 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  			struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
>  			struct media_pad *remote_source_pad;
>  			struct v4l2_subdev *remote_sd;
> -			unsigned int i;
>  
>  			if (route->source_pad != pad ||
>  			    route->sink_pad != local_sink_pad->index)
> @@ -2622,7 +2620,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  				}
>  			}
>  
> -			for (i = 0; i < source_fd.num_entries; i++) {
> +			for (unsigned int i = 0; i < source_fd.num_entries; i++) {
>  				if (source_fd.entry[i].stream == route->sink_stream) {
>  					source_entry = &source_fd.entry[i];
>  					break;
> @@ -2630,7 +2628,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  			}
>  
>  			if (!source_entry) {
> -				dev_dbg(sd->dev,
> +				dev_dbg(dev,
>  					"Failed to find stream %u from source frame desc\n",
>  					route->sink_stream);
>  				ret = -EPIPE;
> @@ -2638,7 +2636,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  			}
>  
>  			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
> -				dev_dbg(sd->dev, "Frame desc entry limit reached\n");
> +				dev_dbg(dev, "Frame desc entry limit reached\n");
>  				ret = -ENOSPC;
>  				goto out_unlock;
>  			}
> 

-- 
Regards,

Laurent Pinchart

