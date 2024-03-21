Return-Path: <linux-media+bounces-7517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39479885E29
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96F162825BC
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 16:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1500138499;
	Thu, 21 Mar 2024 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B2AZ6pHn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5C4137C29
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 16:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711039069; cv=none; b=nd3wU2gIEfpggpKmx9DjWlTr1mRSBo8nNYwHAfiajoH5WaBqCyQCdBc6ILNbOWPD9qhfB82gki1riaxlN+TC8rIKaFPp5oHYs/s3p1G4z9Y5S8HN+6HCLrbjohQL+cOsbwByBZrId4pABFYhJqtyNLtNk7h5bPBGN9EEuOMqTeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711039069; c=relaxed/simple;
	bh=ZIjpiB8iQkxC/UPBa8vNjI058D/Ytff5Kh0XYI/y1Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ap2iyGKfO+nhVPrNSKT6567GJ5Br6j7ePniittFL2Ol2DrHiJ8WXJDPMxfalgxSTBh+MDO1NdOWN8sNrfxv3w7WrSkqW8xgnW1sNkrqomcTyECR8BV9vC/7S5NMXRb+AzzJS10DAPwdzzyel6ZPAWJ74YmH/nkEtFaWJSMfOGTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B2AZ6pHn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47FFA7E9;
	Thu, 21 Mar 2024 17:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711039037;
	bh=ZIjpiB8iQkxC/UPBa8vNjI058D/Ytff5Kh0XYI/y1Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2AZ6pHn5DmEKSBuFJUMkdXzIjY78Pl72LD9a4IlcLp9iv8zZR3ZsISR+lPW8qRVB
	 +5KV5MMUKd6wqqi1B9FmLemc8JWUYFxVzSR9Wm0GpHrOQPZQdYKVE6bQK8opV1gZww
	 py4qI/vqRIhwi08xC+TwXkv2i22HrhMudf6X8fJ4=
Date: Thu, 21 Mar 2024 18:37:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 21/38] media: ccs: Move ccs_validate_csi_data_format up
Message-ID: <20240321163742.GB9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-22-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-22-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:59AM +0200, Sakari Ailus wrote:
> ccs_validate_csi_data_format() will soon be needed elsewhere, above its
> current location. Move it up.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 0cd8ee957655..0efbc63534bc 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1979,6 +1979,20 @@ static int ccs_post_streamoff(struct v4l2_subdev *subdev)
>  	return pm_runtime_put(&client->dev);
>  }
>  
> +static const struct ccs_csi_data_format
> +*ccs_validate_csi_data_format(struct ccs_sensor *sensor, u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
> +		if (sensor->mbus_frame_fmts & (1 << i) &&
> +		    ccs_csi_data_formats[i].code == code)
> +			return &ccs_csi_data_formats[i];
> +	}
> +
> +	return sensor->csi_format;
> +}
> +
>  static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
>  			      struct v4l2_subdev_state *sd_state,
>  			      struct v4l2_subdev_mbus_code_enum *code)
> @@ -2114,20 +2128,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>  	}
>  }
>  
> -static const struct ccs_csi_data_format
> -*ccs_validate_csi_data_format(struct ccs_sensor *sensor, u32 code)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
> -		if (sensor->mbus_frame_fmts & (1 << i) &&
> -		    ccs_csi_data_formats[i].code == code)
> -			return &ccs_csi_data_formats[i];
> -	}
> -
> -	return sensor->csi_format;
> -}
> -
>  static int ccs_set_format_source(struct v4l2_subdev *subdev,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_format *fmt)

-- 
Regards,

Laurent Pinchart

