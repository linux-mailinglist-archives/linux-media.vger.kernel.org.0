Return-Path: <linux-media+bounces-7515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B347885D91
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B91DB245CB
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 16:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E2712B70;
	Thu, 21 Mar 2024 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nt3qCdY5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD7879C3
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711038930; cv=none; b=Zq/NawiAK2TrRp3rBqc077UIoAuU5wgrJPPAWrjYgApceXXfYB5QpeiKGJDo9MNGZB1v4/Jkr3N40w9W7qtx+PwYkTSNrT7/OJms2EHCNhxEtBi/wUue2yKGlCCTNrccd3b/8nCUauVe6aLQqH8nROSJftWkB2y82wXtTKsHiw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711038930; c=relaxed/simple;
	bh=Kmjva/AMJ0ruvqGUgwSplv1TBTmLol+ioqCPSVBOEAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FrXYiHgL3QVJy2T3XkWFXR8BpsNPiR5evZPNhBTlQckBhYNaiFWomA59vYfhhx/NQocoCDP+ygiuFkYwVxL5NsgbC7B6pN/UxoQuyOuCQQa+LtrCodCYfSPM5Tdy3EJ6iaStWQ9iHKTVo+6PUiNR//77OjQb98gCp5XGqcGqHgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Nt3qCdY5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F12797E9;
	Thu, 21 Mar 2024 17:34:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711038899;
	bh=Kmjva/AMJ0ruvqGUgwSplv1TBTmLol+ioqCPSVBOEAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nt3qCdY5F8TS8JoThxuoDaGtKjpQ70of96INem7adYPEey77wsHIwQtiNFXzIMpm0
	 3LFUfeZBw7C6wBvpM45yUAhpq7J28rQYi6ngga90p0te9lK2AURVctqJ3E6+8sNxhB
	 rkm/oXYFKREaM7UukqIFmQSv8cFgRHgfroQOf+34=
Date: Thu, 21 Mar 2024 18:35:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 18/38] media: ccs: No need to set streaming to false
 in power off
Message-ID: <20240321163524.GX8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-19-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-19-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:56AM +0200, Sakari Ailus wrote:
> Streaming will have been stopped by the sensor is powered off, and so
> sensor->streaming is also false already. Do not set it as part of the
> runtime suspend callback.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index e21287d50c15..671540a8ab6a 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1710,7 +1710,6 @@ static int ccs_power_off(struct device *dev)
>  	usleep_range(5000, 5000);
>  	regulator_bulk_disable(ARRAY_SIZE(ccs_regulators),
>  			       sensor->regulators);
> -	sensor->streaming = false;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

