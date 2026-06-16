Return-Path: <linux-media+bounces-65034-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZwYtD69VMWoWhAUAu9opvQ
	(envelope-from <linux-media+bounces-65034-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:54:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD54690230
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:54:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=RiITLjdJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65034-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65034-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34D8931C59CA
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B24349CDE;
	Tue, 16 Jun 2026 13:50:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E472E7376;
	Tue, 16 Jun 2026 13:50:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617848; cv=none; b=Io1nnCQMQbjTVxvqAQ9m2N+BL9zpCKf9P9cKj7Pg+ZRFfVHdKjuc8KmKGN8hYxnjAY/IUk4taoMlk+6Y3XW6WMuvOvUiq6f6wOc/QmgUXsOe9wjXW09CnLzQY41vQjL3i9UJvwUCzzk7RShvOn52IPymcJNxhVmqIvFSv88vweA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617848; c=relaxed/simple;
	bh=AQKow0+x6QHmPVa5Tlph5jPa0ECUpffmLvCQXMJS8bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Utz6st5dot6ClKrsfZlrBCx8TO3xTkgnZHK5Khd1WFNlyvsCNS2q09ipX+CY7vZqhXs0UWMH9mlgkdGSWzkYbebPDyA3w69keihrA87nJKfsn1DHBl7PmURjgcRKDjREFLzFpJlylTrFQXB9PmMM8o8Ap9BdKXXBDyLsvn4a/QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RiITLjdJ; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92CCD8FA;
	Tue, 16 Jun 2026 15:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781617812;
	bh=AQKow0+x6QHmPVa5Tlph5jPa0ECUpffmLvCQXMJS8bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RiITLjdJF6TrhpgO3wxb0FcLZcoSW5KtD0sthY52xtI98yFitkWq3m3pzZC+TF7Do
	 Qat5XZ9qTD/9h6OD9ymXUpw4xNasACkPY1ehbfqlopn7KXltGQAb9pAWQw3Y/fFYCS
	 D1tllUla/jXnCoieV8Ah+Gmf802YLmQ3jYMAyh0g=
Date: Tue, 16 Jun 2026 16:50:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-core: Fix Use-After-Free in
 v4l2_subdev_get_fwnode_pad_1_to_1
Message-ID: <20260616135044.GJ2984510@killaraus.ideasonboard.com>
References: <20260616092516.46339-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616092516.46339-1-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-65034-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BAD54690230

On Tue, Jun 16, 2026 at 02:55:16PM +0530, Biren Pandya wrote:
> v4l2_subdev_get_fwnode_pad_1_to_1() drops the fwnode reference via
> fwnode_handle_put() before passing it to device_match_fwnode(). This
> creates a Use-After-Free vulnerability. If the freed memory is instantly
> reallocated by SLUB, the pointer comparison could accidentally match
> the wrong pad or trigger a KASAN panic.

There's no vulnerability in practice. The code change is still worth it
in my opinion, but the commit message needs an update.

> Fix this by using the __free(fwnode_handle) scoped guard. This safely
> binds the fwnode lifecycle to the function scope, holding the reference
> during the match and releasing it automatically upon return.
> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 831c69c958b8..e6b133ef7850 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -7,7 +7,7 @@
>   * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>   *	    Sakari Ailus <sakari.ailus@iki.fi>
>   */
> -
> +#include <linux/cleanup.h>
>  #include <linux/export.h>
>  #include <linux/ioctl.h>
>  #include <linux/leds.h>
> @@ -1243,7 +1243,7 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
>  int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
>  				      struct fwnode_endpoint *endpoint)
>  {
> -	struct fwnode_handle *fwnode;
> +	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
>  	struct v4l2_subdev *sd;
>  
>  	if (!is_media_entity_v4l2_subdev(entity))
> @@ -1252,7 +1252,6 @@ int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
>  	sd = media_entity_to_v4l2_subdev(entity);
>  
>  	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);

The recommended usage is to declare the variable where initialized:

	struct fwnode_handle *fwnode __free(fwnode_handle) =
		fwnode_graph_get_port_parent(endpoint->local_fwnode);

> -	fwnode_handle_put(fwnode);
>  
>  	if (device_match_fwnode(sd->dev, fwnode))
>  		return endpoint->port;

-- 
Regards,

Laurent Pinchart

