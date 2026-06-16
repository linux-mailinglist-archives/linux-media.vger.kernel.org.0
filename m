Return-Path: <linux-media+bounces-65035-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RxpPCNdWMWpyhAUAu9opvQ
	(envelope-from <linux-media+bounces-65035-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:59:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F40A6902BA
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:59:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="k4E/iYqv";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65035-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65035-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 757E4326E48D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F54351C14;
	Tue, 16 Jun 2026 13:54:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD66A2C027C;
	Tue, 16 Jun 2026 13:54:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618085; cv=none; b=TLnCv9jTfMuF/l4wtTkSAS2GEgqX4tiZ0Pt9xpRS+pmMtsxSXRR1AobtRNYuv2sXjsafICzffBAfyC21/4oyf/CKUZjr8Sm4+FlXjzjsOE7RD7gjJcB3LLbnqvfsrB9o7o//TyAI9RJ9flKEtkIoBba98KMs97F5KnsUogNBA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618085; c=relaxed/simple;
	bh=+MW+vQ5nA7GsZAVZWO1TUU2Fot68OlKs00yA0Jiy+Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATHNyoaJm83FULWeqQOGgga5bvd/gcHX+BDZUTDjZ2DlXU+p7HYbCXxvb7OfrdXtAgSkO7HaEeFuk7R61pDV4Sl2HBX33O6wfB+RwsXTfnTtM+fz3zHyq9m1Tl3fLIqedqTOyCcZZRuzGPkSR4NFQbQtNa9eytSSWNsXXXEsIqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k4E/iYqv; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA49C1E6;
	Tue, 16 Jun 2026 15:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781618049;
	bh=+MW+vQ5nA7GsZAVZWO1TUU2Fot68OlKs00yA0Jiy+Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k4E/iYqv7lu2x0g2DaN7ey859+FONqudRA1398uzZeWZzAirhiuP81yNVZd/N6/Aj
	 +axR1Gtn7NRycdZAE0x4H/VP7+i4bVZK2a4/RQkpFT77WpHtb8Vnn/1rCnYPCCxIIt
	 LbYqvJVn/pCVTKMYKuEf9hRF4mx1Ts/VtpFmiD+8=
Date: Tue, 16 Jun 2026 16:54:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Fix Use-After-Free risk in fwnode
 pad matching
Message-ID: <20260616135441.GK2984510@killaraus.ideasonboard.com>
References: <20260616063754.42163-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616063754.42163-1-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65035-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:from_mime,killaraus.ideasonboard.com:mid,iki.fi:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F40A6902BA

On Tue, Jun 16, 2026 at 12:07:54PM +0530, Biren Pandya wrote:
> In v4l2_subdev_get_fwnode_pad_1_to_1(), fwnode_handle_put() is called immediately after fetching the endpoint's parent node. However, the pointer is subsequently passed into device_match_fwnode().
> 
> While device_match_fwnode() only performs a pointer comparison and does not dereference the pointer, passing a dangling pointer is a Use-After-Free violation. If the memory allocator immediately reuses the freed fwnode address for another node, the comparison will yield a false positive. Furthermore, static analysis and KASAN strictly flag passing dangling pointers to functions.
> 
> Fix this by replacing the manual fwnode_handle_put() with the __free(fwnode_handle) scoped guard, which guarantees the reference is safely held for the remainder of the function scope.
> 
> Fixes: 8fe784b9abb2 ("media: v4l2-subdev: add v4l2_subdev_get_fwnode_pad_1_to_1")

Why did you send a new version of this patch
(https://lore.kernel.org/linux-media/20260616092516.46339-1-birenpandya@gmail.com/)
that doesn't identify itself as v2, doesn't include any changelog, and
without replying to this version to tell it's superseded ?

> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 831c69c958b8..24c95082ded5 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -8,6 +8,7 @@
>   *	    Sakari Ailus <sakari.ailus@iki.fi>
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/export.h>
>  #include <linux/ioctl.h>
>  #include <linux/leds.h>
> @@ -1243,7 +1244,6 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
>  int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
>  				      struct fwnode_endpoint *endpoint)
>  {
> -	struct fwnode_handle *fwnode;
>  	struct v4l2_subdev *sd;
>  
>  	if (!is_media_entity_v4l2_subdev(entity))
> @@ -1251,8 +1251,8 @@ int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
>  
>  	sd = media_entity_to_v4l2_subdev(entity);
>  
> -	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);
> -	fwnode_handle_put(fwnode);
> +	struct fwnode_handle *fwnode __free(fwnode_handle) =
> +		fwnode_graph_get_port_parent(endpoint->local_fwnode);
>  
>  	if (device_match_fwnode(sd->dev, fwnode))
>  		return endpoint->port;

-- 
Regards,

Laurent Pinchart

