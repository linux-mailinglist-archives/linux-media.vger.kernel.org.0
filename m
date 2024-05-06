Return-Path: <linux-media+bounces-10920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CF28BD4E4
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 20:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BECA628282A
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 18:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E214158DCE;
	Mon,  6 May 2024 18:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lbJ4kV0C"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CE315886A
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 18:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715021461; cv=none; b=Kelieq4BUSCJZqa+TK5sZK11qHxvcBJi2U40XzKTuj1MsXsG+phoNCEc0NdfFreFwHt8GyjrEdeuGC04gLEHXTPh90JOwAHLmDvEmngjawO22vVxH0b7nEz/dKDoziHT1hVLU6Im1nQwsPCfTtep3XLL1HAudiVJdp4mHXbz+yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715021461; c=relaxed/simple;
	bh=Qfb3OBgdA5Ja7Imv9gDYMlCF1nu4qBk048AIEDP2R3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjqylwOfDDAvZI/NZWiVeORvegxdTVYMsFxww+Rp5/DEyyrKi7wBlZqiO2OovZGF0i+q7Re1hNL5z3hYT+W0dbGJ3WtYlDU1nMqPvsgqQx5Io4GSI2ORM61GHf+nmv4rO9CapRk+15ChPqyUgmbU4f95rOASefqcvo9NB83Ukww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lbJ4kV0C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22DA7114D;
	Mon,  6 May 2024 20:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715021456;
	bh=Qfb3OBgdA5Ja7Imv9gDYMlCF1nu4qBk048AIEDP2R3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lbJ4kV0Cczu+iaXzmAZkdP+BhAauNYZoIopygPDuZVxOwQ0VMojAbcUc1GBbI1bXS
	 vHNynzh8Ht9knlB7FaaEju78uVm+ETKaFZ7TqDaljpSMBY7ODlphE3f06iHVZOCix1
	 utUPCsAu+Tt3Aro+Hh2s5zTuAtgSOKKOE7WD4vno=
Date: Mon, 6 May 2024 21:50:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: niklas.soderlund+renesas@ragnatech.se,
	kieran.bingham+renesas@ideasonboard.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: max9271: Ignore read error in s_stream
Message-ID: <20240506185050.GA26689@pendragon.ideasonboard.com>
References: <20240506144947.85253-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240506144947.85253-1-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, May 06, 2024 at 04:49:46PM +0200, Jacopo Mondi wrote:
> In order to start streaming, the serializer's SEREN bit has to
> be asserted and the video link enabled. In order for the video
> link to be enabled correctly a valid pixel clock has to be
> detected between the serializer and the connected image sensor.
> 
> The pixel clock detection is performed by reading register 0x15 but the
> first attempt to read the register value sporadically fails resulting in
> a error in the stream start procedure.
> 
> As the error is not fatal, and the pixel detection procedure will abort
> anyway after 10 msec if no valid pixel clock is detected, continue
> instead of failing immediately if the register read fails.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> ---
> When running 4 cameras at a time, the first register read on the first started
> camera fails pretty often. I here decided to ignore the error and go for another
> read attempt, but issuing a simple "i2c_smbus_read_reg()" (as we do in the wakup
> function) before the actual register read resolves the issue in the same way.
> 
> I've not been able to find in the datasheet any mention of a "ping to wakeup"
> requirement before enabling the video channel, but this change make capturing
> from 4 RDACM20 camera pretty reliable.

I'm OK with that. In parallel, it would be nice to try and ask the
vendor (assuming they would still provide support for GMSL).

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> 
>  drivers/media/i2c/max9271.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> index ff86c8c4ea61..e339dff3986d 100644
> --- a/drivers/media/i2c/max9271.c
> +++ b/drivers/media/i2c/max9271.c
> @@ -66,8 +66,10 @@ static int max9271_pclk_detect(struct max9271_device *dev)
> 
>  	for (i = 0; i < 100; i++) {
>  		ret = max9271_read(dev, 0x15);
> -		if (ret < 0)
> -			return ret;
> +		if (ret < 0) {
> +			usleep_range(50, 100);
> +			continue;
> +		}
> 
>  		if (ret & MAX9271_PCLKDET)
>  			return 0;

-- 
Regards,

Laurent Pinchart

