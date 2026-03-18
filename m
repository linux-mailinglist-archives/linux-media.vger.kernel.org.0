Return-Path: <linux-media+bounces-56219-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB8lOCHWummfcAIAu9opvQ
	(envelope-from <linux-media+bounces-56219-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 17:43:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEAB2BF7DF
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 17:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FA2830C4577
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 16:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60FC1DD889;
	Wed, 18 Mar 2026 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ey9Ehkpp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34AD221FCF;
	Wed, 18 Mar 2026 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850884; cv=none; b=s7+XXb0RzunXhYZm9HZPBxBLSDiwzh9xHNORfehkKMEA+R/tm/myTHKg1SWIPcWO/hYnJdsja3Bgw6r8Rl4p8gCHz6cw18bHFB87VNnHq83ZgehznaQkqGpftCMeV3wwG+E/xTgJALtR8nZ+uU+g0BFOEeXVZn6OVe0c5KmhyNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850884; c=relaxed/simple;
	bh=+/7HmAbTLEWQxzT1iYXgHC3WU6ZJuAnO7eqciwHqya4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRaPoNBajav+7Tf95H7YnpiD1YQuaukIIouCblleMA5d6eG4EZABKueQZwwg0dz6qd4l9Tfs3QcYs2GiYRefx6x8WskHC16PFWcfOxOeqr+/wyEkG0+/6+rKbKivVbJcjFm1b6tkKua6SALJc1k6gHby01IPXJ+g9ZS7ZrjP68Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ey9Ehkpp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DAAF4379;
	Wed, 18 Mar 2026 17:20:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773850807;
	bh=+/7HmAbTLEWQxzT1iYXgHC3WU6ZJuAnO7eqciwHqya4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ey9EhkppzTRSHZ9THfXCN+47D7vyAqXM02vpI6+9PUHz70rK6TlN/au0qSJtS7qNW
	 /XmylHELAwlASUq9iWauEfq+etOGWtSf2T0GvtURsoLpOWDdIhgvzPa3aEYEU+ENDx
	 SZDDTjsG2ROItSSFEVtsCxR7whsT6U8z17Pm3fis=
Date: Wed, 18 Mar 2026 18:21:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil+cisco@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	tomi.valkeinen+renesas@ideasonboard.com, kees@kernel.org,
	ethantidmore06@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: v4l2-subdev: Fix error check in
 v4l2_subdev_get_frame_desc_passthrough()
Message-ID: <20260318162118.GC633439@killaraus.ideasonboard.com>
References: <20260317072020.3876151-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317072020.3876151-1-nichen@iscas.ac.cn>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.intel.com,ideasonboard.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-56219-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 5FEAB2BF7DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Chen,

Thank you for the patch.

On Tue, Mar 17, 2026 at 03:20:20PM +0800, Chen Ni wrote:
> Use IS_ERR() and PTR_ERR() to properly handle the error return from
> media_pad_remote_pad_unique(), which returns ERR_PTR() on failure but
> never NULL. The previous code only checked for NULL, leading to invalid
> pointer dereference.
> 
> Detected by Smatch:
> drivers/media/v4l2-core/v4l2-subdev.c:2588 v4l2_subdev_get_frame_desc_passthrough() warn:
> 'remote_source_pad' is an error pointer or valid
> 
> drivers/media/v4l2-core/v4l2-subdev.c:2595 v4l2_subdev_get_frame_desc_passthrough() error:
> 'remote_source_pad' dereferencing possible ERR_PTR()
> 
> Fixes: a564839e630c ("media: subdev: Add v4l2_subdev_get_frame_desc_passthrough helper")
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Sakari, Hans, will you pick this patch up for v7.1 ?

> ---
> Changes in v3:
> - Remove the Reported-by tag due to missing Closes: URL
> 
> Changes in v2:
> - Added Smatch warning messages to commit message
> - Added Reported-by tag for Ethan Tidmore
> - Kept both Reviewed-by tags
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 9efd14d4026f..7cb17e0a5617 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2585,10 +2585,10 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  
>  			if (!have_source_fd) {
>  				remote_source_pad = media_pad_remote_pad_unique(local_sink_pad);
> -				if (!remote_source_pad) {
> +				if (IS_ERR(remote_source_pad)) {
>  					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
>  						local_sink_pad->index);
> -					ret = -EINVAL;
> +					ret = PTR_ERR(remote_source_pad);
>  					goto out_unlock;
>  				}
>  

-- 
Regards,

Laurent Pinchart

