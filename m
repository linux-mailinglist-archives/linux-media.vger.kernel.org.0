Return-Path: <linux-media+bounces-14849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 361A492D16A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 14:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D51531F26090
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 12:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F3E189F26;
	Wed, 10 Jul 2024 12:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OvdopPOV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCEE19149C;
	Wed, 10 Jul 2024 12:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720613900; cv=none; b=Ibzi5byjLDKdaVn8B3y3FUmjjiwzJggUmft0g95m8HdPNUtkrMvaA/PzL8SpgCyIvcJ7P0v1x/MKjS8nUOtG5jUVqtJJLI0AjxKgrxRbT/S+Ps9TpErRPMJStg4INJfZ73KhCVZVWHZ1BskJ3b3s4QhjjbB5hzTB/Awn8AcpwSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720613900; c=relaxed/simple;
	bh=UaALKAhizkPi26oCPRRmhN5wnJTAan+Gn4CYyUmIUTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtIZM5xxkA1c+3SlHyAcohkB7zqlIYc1+xUQrcGKtcuavy+5MuVsojdVxk6acxMEjstCIoTR9suqvsE2TPUVbHsf1v84Cajc1N4F/p3hTBUq5DggfGsxHoFooT2fFoCaIknr1yAW5F8JZK0QnkjTW6Z7sLNX9XMDJPCi1/Cq8OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OvdopPOV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C6A511D1;
	Wed, 10 Jul 2024 14:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720613862;
	bh=UaALKAhizkPi26oCPRRmhN5wnJTAan+Gn4CYyUmIUTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OvdopPOVqYPNLf5GpNHvOFJdiuLVH4ArNalyBS5JurHx7C0LGj4KCeJsn4GnlMH4B
	 6BWfGOtibKqVyzWXPFGHeO4dthFnub+nThqAYSkjYdyfpst/d9GKp9rjjk8yteqOHU
	 0x1+eEvimhdKVNyiG5O1StJOrGl0w2f218Mw0uS0=
Date: Wed, 10 Jul 2024 14:18:11 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang <mingjia.zhang@mediatek.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Keith Zhao <keith.zhao@starfivetech.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 10/14] staging: media: starfive: Add V4L2_CAP_IO_MC
 capability
Message-ID: <y4rmftogfbsvs76juvrs6px7qlyqjxesg6wqupnrxiys7droea@rrwnc3nsrohr>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-11-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709083824.430473-11-changhuang.liang@starfivetech.com>

Hi Changhuang

On Tue, Jul 09, 2024 at 01:38:20AM GMT, Changhuang Liang wrote:
> Add V4L2_CAP_IO_MC capabality for video device. User space can enumerate
> formats by mbus code.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/staging/media/starfive/camss/stf-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
> index 2203605ec9c7..8c6c45d8b7a1 100644
> --- a/drivers/staging/media/starfive/camss/stf-video.c
> +++ b/drivers/staging/media/starfive/camss/stf-video.c
> @@ -668,7 +668,7 @@ int stf_video_register(struct stfcamss_video *video,
>  	}
>
>  	vdev->fops = &stf_vid_fops;
> -	vdev->device_caps |= V4L2_CAP_STREAMING;
> +	vdev->device_caps |= V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;

Does this set the flag for the stat node as well ? Not that it hurts
but filtering on mbus code where only METADATA_FIXED is allowed
doesn't make much sense ?

Same for the parameters node

>  	vdev->entity.ops = &stf_media_ops;
>  	vdev->vfl_dir = VFL_DIR_RX;
>  	vdev->release = stf_video_release;
> --
> 2.25.1
>
>

