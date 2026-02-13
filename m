Return-Path: <linux-media+bounces-52697-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ap7QIcLbjmlDFgEAu9opvQ
	(envelope-from <linux-media+bounces-52697-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:07:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2736133CC7
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7F0430488E7
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 08:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D147531A046;
	Fri, 13 Feb 2026 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A/cP7Ldv"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103FE2D97A5;
	Fri, 13 Feb 2026 08:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970012; cv=none; b=s+UypHmkI3NNx6Opz63CqNcva7o1k6cauKCeaZPkx/eNWJoEUzMdWCShJQB291wMMWLzbMLgC4ys6lew7LjgcKuAOwYsi4cG+pf/csZ/MmvAW7ZabbsSrkNHQ6MSWG2ooyPZLCpJwnkMhJ5QSOP+2ix1eLBlg5zAIF4Q9zhiiDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970012; c=relaxed/simple;
	bh=tH0syY3v/uxveu3JwxMQ/PACY/0hnlHWEcq3zpvDCXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B8dpI6NdKtIvmnhMXaaRZXHz7cfdrfyqu/9swwSNG9hP8yptqhQazOqx+8HSc8KfsXVCGXT2eVcz4ClGTOD958XrzfrthAShHPevfGZcZ9i7IsbEeaLftOyqMMYVmeFH7B9qNxXtcV6lwZWddpAcMRicbJ2KBBL9vgf2yLXovEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A/cP7Ldv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770970009;
	bh=tH0syY3v/uxveu3JwxMQ/PACY/0hnlHWEcq3zpvDCXs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A/cP7Ldv745uuMlhry8MPypFUcisg4l611yN90R+c7fxcxaIaKYbthTdvdgLayTub
	 kVJYnkW74gBgM/mQn7/lLf4GMzU4PPzcYpZ5xcZGT/Q75SQKQuiU4tT/YXFfMhoZMQ
	 RJf+VasZ5fszTz6tNJibRqjhSlxcIR7Oo6+aAvbxPWNhf/Iqc3QH/tdVVSYqbDmFYK
	 tKiuWZp3yVWQPRLlBBc3EVxkI9zeyh4FqFphygetkfqzbHdNQ8S7q/stTKHjrAjP/x
	 ctT4ZWwQVCRR+2EYe0CmSPfBGKxAwnlj9UcPgxnwcdDvyOYKcP7cjjhs7lH3leyLFx
	 IC64udm52M3Jg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8726F17E1301;
	Fri, 13 Feb 2026 09:06:48 +0100 (CET)
Message-ID: <9bb4eced-5710-49ac-99cf-fa0b1d1459b1@collabora.com>
Date: Fri, 13 Feb 2026 09:06:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rockchip: rkcif: Add missing MUST_CONNECT flag to
 pads
To: Dang Huynh <dang.huynh@mainlining.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260129-rkcif-null-v1-1-90788ec347f5@mainlining.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260129-rkcif-null-v1-1-90788ec347f5@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52697-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email,mainlining.org:email]
X-Rspamd-Queue-Id: D2736133CC7
X-Rspamd-Action: no action

Hi Dang,

Thanks for the patch -- and sorry for the late reply.

On 1/29/26 08:24, Dang Huynh wrote:
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

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
> The RKCIF driver missed MEDIA_PAD_FL_MUST_CONNECT, which causes a null
> dereference when the stream starts if the links are misconfigured.
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
> 
> Best regards,


