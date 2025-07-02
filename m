Return-Path: <linux-media+bounces-36488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1897CAF0751
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 02:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F37B3B807F
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 00:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A5F17736;
	Wed,  2 Jul 2025 00:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u6JgwtPr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EB54A2D
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 00:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751416608; cv=none; b=OwSLcpGMCXcbCasQzc8qSVya8Cus5V/OPJRFmtIiur4kFo2ygaaVE5Mbp+b2Oz2ov49cLUMm30oGvp0IggzjYd4E9Gi3ViMMiFPruQ0kLq8zoLD7/aB4ID7Xb9/K+Ov2eDPyXBR1HAit48ko61uJ579iBcFL7qcAfu69I04yi/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751416608; c=relaxed/simple;
	bh=b1pGfcDMFG3jA4M8WM4KR+AVJWz5+uzc0VQZIXIFVww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAd/mtwFA00GswPZE12doPa88a/FndwGkf7c+dHAkByV/85Zc9aKl9pUstn0RvoJxXYGuBYtEO2xOa+nCqLkZjegFb67TJrfKdmr5dXsjGXq6vJu0wmUOlA8WG93mQQfQIegktP99vFZXDGQYuQO4+o9Uyq50qteIjkbZ+XexZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u6JgwtPr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C032719E3;
	Wed,  2 Jul 2025 02:36:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751416582;
	bh=b1pGfcDMFG3jA4M8WM4KR+AVJWz5+uzc0VQZIXIFVww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6JgwtPr2eETOyBAWbr5f7p9UF/X/mBU3ZS1XGbgfdFz91qF/RfAU0xTrUuOPzhhq
	 JI23ydpUP4amndxTvp4gIR4VFd+wTdv2UCEpeKh7Jr8vZhDsv2OnAH9RicasqwbJTw
	 V0eNrx6qv581RmbBpC1CX8Fe50NOtTSIeNhZZuVw=
Date: Wed, 2 Jul 2025 03:36:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 11/15] media: mt9m114: Update src pad sel and format
 when sink pad format changes
Message-ID: <20250702003617.GF17819@pendragon.ideasonboard.com>
References: <20250629205626.68341-1-hansg@kernel.org>
 <20250629205626.68341-12-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250629205626.68341-12-hansg@kernel.org>

Hi Hans,

Thank you for the patch.

On Sun, Jun 29, 2025 at 10:56:21PM +0200, Hans de Goede wrote:
> Call mt9m114_ifp_update_sel_and_src_fmt() on sink pad format changes to
> propagate these downstream.
> 
> This is necessary in 2 different scenarios:
> 
> 1. When passing through RAW10 bypassing the scaler then any sink pad format
> changes must be propagated to the crop/compose selections and to the src

s/src/source/

> pad format.
> 
> 2. When the scaler is active, then the crop-rectangle cannot be bigger then
> the sink pad format minus a 4 pixel border all around. If the sink format
> change reduces the size then things also needs to be propagated downstream.
> 
> Rather then adding extra code to check for these conditions, simply always
> propagate sink pad format changes downstream.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>  drivers/media/i2c/mt9m114.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index ef27780384f2..1f305bba180e 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -1871,6 +1871,8 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
>  		format->height = clamp(ALIGN(fmt->format.height, 8),
>  				       MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT,
>  				       MT9M114_PIXEL_ARRAY_HEIGHT);

Blank line here.

> +		/* Propagate changes downstream */

s/downstream/downstream./

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		mt9m114_ifp_update_sel_and_src_fmt(state);
>  	} else {
>  		const struct mt9m114_format_info *info;
>  

-- 
Regards,

Laurent Pinchart

