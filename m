Return-Path: <linux-media+bounces-51868-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMy1KF00fWntQgIAu9opvQ
	(envelope-from <linux-media+bounces-51868-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 23:44:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD04BF355
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 23:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DD7630416DE
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 22:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3103A38A9D4;
	Fri, 30 Jan 2026 22:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fU6RJGSP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D5038A9BF;
	Fri, 30 Jan 2026 22:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769812992; cv=none; b=a2V6Y0gR1Wr/C3kCyqBY2VrRPO1JD6Ph9F+OWbsLI4n1hm3n32h9tnN2JujAVrlLbtDntopakMvOFzVoc30C98GpIrP6RqFyyTGUsg2lUTFhppkaV5en3u+FK0j7POlzkafK849pjMpn1kfNcIvcCumW6Kwf7KV0UxFDP+sbjm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769812992; c=relaxed/simple;
	bh=9vt/KWf0ClAcghSMvVKAo3o70Sm0WkeC1kfJnzEifBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFGnLg3sP/gFJ5AOy6kNsjSHMqGTUdqQ/3aPPFKPPypECUmLdCwQTgmQdjHiYEQM1xF3RPy9Ap9gd6zr4Pbp5mo6zFhT73Ml1jCyUL4mzTjdrhrdtsiVNfqprR+wO28gwQfI1Cc11VSfLpuacnzgIQsm+7wKrp2wKYPNjdtzsFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fU6RJGSP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 13E5F22F;
	Fri, 30 Jan 2026 23:42:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769812944;
	bh=9vt/KWf0ClAcghSMvVKAo3o70Sm0WkeC1kfJnzEifBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fU6RJGSPKIlbpF/tLhXT5lSMw2jEyLRVAx3JYazvkzQVZTjjn2nnLhtg9pPH303Po
	 CxdhqM9FawM8SJrtFHLdJKycX2jkGo2Fvr/DmWGqkVwiFP5bQh31do4Z3KpQQmDgB/
	 10n4n3cwuri0Wftc//KNpfdQzX63yw8c6YgLANII=
Date: Sat, 31 Jan 2026 00:43:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rockchip: rkcif: Add missing MUST_CONNECT flag to
 pads
Message-ID: <20260130224301.GS3374091@killaraus>
References: <20260129-rkcif-null-v1-1-90788ec347f5@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129-rkcif-null-v1-1-90788ec347f5@mainlining.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51868-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0AD04BF355
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 02:24:02PM +0700, Dang Huynh wrote:
> The pads missed checks for connected devices which may a null dereference
> when the stream is enabled.
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000020
> pc : rkcif_interface_enable_streams+0x48/0xf0
> lr : rkcif_interface_enable_streams+0x44/0xf0
> Call trace:
>  rkcif_interface_enable_streams+0x48/0xf0
>  v4l2_subdev_enable_streams+0x26c/0x3f0
>  rkcif_stream_start_streaming+0x140/0x278
>  vb2_start_streaming+0x74/0x188
>  vb2_core_streamon+0xe0/0x1d8
>  vb2_ioctl_streamon+0x60/0xa8
>  v4l_streamon+0x2c/0x40
>  __video_do_ioctl+0x34c/0x400
>  video_usercopy+0x2d0/0x800
>  video_ioctl2+0x20/0x60
>  v4l2_ioctl+0x48/0x78
> 
> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
> Fixes: 85411d17bee9 ("media: rockchip: rkcif: add abstraction for interface and crop blocks")
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
> The RKCIF driver missed MEDIA_PAD_FL_MUST_CONNECT, which causes a null
> dereference when the stream starts if the links are misconfigured.

The change looks fine,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'd like a review from Michael though.

> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-interface.c | 3 ++-
>  drivers/media/platform/rockchip/rkcif/rkcif-stream.c    | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> index 523103872b7a..414a9980cf2e 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> @@ -378,7 +378,8 @@ int rkcif_interface_register(struct rkcif_device *rkcif,
>  		snprintf(sd->name, sizeof(sd->name), "rkcif-mipi%d",
>  			 interface->index - RKCIF_MIPI_BASE);
>  
> -	pads[RKCIF_IF_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	pads[RKCIF_IF_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
> +					MEDIA_PAD_FL_MUST_CONNECT;
>  	pads[RKCIF_IF_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&sd->entity, RKCIF_IF_PAD_MAX, pads);
>  	if (ret)
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index e00010a91e8b..201542b55f00 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -555,7 +555,7 @@ int rkcif_stream_register(struct rkcif_device *rkcif,
>  	vdev->vfl_dir = VFL_DIR_RX;
>  	video_set_drvdata(vdev, stream);
>  
> -	stream->pad.flags = MEDIA_PAD_FL_SINK;
> +	stream->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
>  
>  	stream->pix.height = CIF_MIN_HEIGHT;
>  	stream->pix.width = CIF_MIN_WIDTH;
> 
> ---
> base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
> change-id: 20260129-rkcif-null-fbc0be41f81a

-- 
Regards,

Laurent Pinchart

