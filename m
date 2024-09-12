Return-Path: <linux-media+bounces-18189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0459766D8
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 12:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC8E01C2109C
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 10:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4F119F435;
	Thu, 12 Sep 2024 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vHxMN3d2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD7619EEA1;
	Thu, 12 Sep 2024 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726137893; cv=none; b=ETRD9F4M7ldcDmliwD7W2eOwNwsY+9UCITryoOIJzXhZklEWTexQtA/sOM/XL559S53tGG83OGOeftx/aZik8fJsT5++MTUqyhWiDoz657PzESWeCWl+nssNY+Z+FhkcyfUK5pzK62Uc3LdFAWQ7Uz1KgUh4VlPcg2ShiVveOQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726137893; c=relaxed/simple;
	bh=jjbftjjtTuAp38jbVsvvLl79JQ/h74xrNwLgMrHZgrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fh2P5d/CgOSb1kzVGsoORfV+6wTWgdFoAf0cEcLnqJvLd8wNr/OS9dQmBzg8JyC0p2yIWUCdM7oOF1B3cKuu+8wzs3DrUbwC0EUKjzIXpy7mPzRtfgmIoNSMUDD77KV638Iyxf7Wef/nSKPbNZnNlx75AwFNmQUhFZ/z4jKbDjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vHxMN3d2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AE8D5B3;
	Thu, 12 Sep 2024 12:43:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726137805;
	bh=jjbftjjtTuAp38jbVsvvLl79JQ/h74xrNwLgMrHZgrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHxMN3d2aEGCogzbvjcvMM4xhMSfBBrH7bF2cOUISH4UcokEdCuIMePkidg8fy1pE
	 IzsH4GX6T6YY1oeJaz0tiQQYqXD6ZGtdpnYcDzN394PH28NBEfPAHSXfNmeXAFGRNO
	 eNkqGxZ1Wqvc63UZ1agBkmE7cgXy5XtDQMswx6nQ=
Date: Thu, 12 Sep 2024 13:44:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: linuxfancy@googlegroups.com, sakari.ailus@linux.intel.com,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: max96714: add HAS_EVENTS subdev flag
Message-ID: <20240912104409.GA25276@pendragon.ideasonboard.com>
References: <20240910134428.795273-1-tomm.merciai@gmail.com>
 <20240910134428.795273-2-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910134428.795273-2-tomm.merciai@gmail.com>

Hi Tommaso,

On Tue, Sep 10, 2024 at 03:44:27PM +0200, Tommaso Merciai wrote:
> Controls can be exposed to userspace via a v4l-subdevX device, and
> userspace has to be able to subscribe to control events so that it is
> notified when the control changes value. Add missing HAS_EVENTS flag.

How is this supposed to work, given that the driver doesn't implement
.subscribe_event() ?

> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> ---
>  drivers/media/i2c/max96714.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
> index 159753b13777..94b1bc000e48 100644
> --- a/drivers/media/i2c/max96714.c
> +++ b/drivers/media/i2c/max96714.c
> @@ -602,7 +602,8 @@ static int max96714_create_subdev(struct max96714_priv *priv)
>  		goto err_free_ctrl;
>  	}
>  
> -	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
>  	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>  	priv->sd.entity.ops = &max96714_entity_ops;
>  

-- 
Regards,

Laurent Pinchart

