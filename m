Return-Path: <linux-media+bounces-23558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A45B89F4821
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BBD11698F8
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 09:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA0C1DF254;
	Tue, 17 Dec 2024 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLQE7Wtm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6E11DB52D;
	Tue, 17 Dec 2024 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734429345; cv=none; b=ceRJazC1kaubpk5UXcXw4Mr/6DpZEpOnqjfJAWffVX02mesuOgwJQphSGAPvVRbB+jnaV/4VCsZV2dBRiwT78m06gjl7NZiHrhyNYgzoEX1I64TNUoMYSL6HGhcKbtuqzjaTvhstPhjME2nHhTn0j4frJ0TUnVoZFZ/56PG7Wh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734429345; c=relaxed/simple;
	bh=KHM7y70HQaog3e7Ndr6DxqdWD3flbUhpk65yvqTiil4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBeWAZtM3Ix36CVjkrf/fxssTgtDJdRT9j8Hx4pOoqpskk3bMsS+rqTdxkEVxY+4lTrR3ngd4ECkLEJlt23yODDMP3mZ91rKdpnDif9EPf5Qcx6qjgMGurS9X6kVjJQFb1OYukdAhamwYiyjWgXBjL6nJ9zFjXZxt2RwaGrAOPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLQE7Wtm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734429344; x=1765965344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KHM7y70HQaog3e7Ndr6DxqdWD3flbUhpk65yvqTiil4=;
  b=QLQE7WtmZB6kFzos4XfLPH1/8MP5G2JiHJJAzoWF5BggJwovNFmVH/Lw
   u9oMTG0Cb3smWNGnHCJZ13uoisbeVLlwd+6/GnWC7zcvaax4JCtclYNL9
   cHrKHZ6PkbmQG529cbCZo7w4OuKBDxQc0hCTrYNvCWPQKIrUfRWfnhPz4
   b24hyBF+fdcdCAMElDqY0CnT6yuGeqK+fiAjLYzHTPS/PUgwQMEYlbNyS
   okyLulB+Mdw/F/su8n7mnLDl2M2iIaW/kY24mRhJawE1Hh8qV89RjWz/Q
   rUCtTZtpaJmNIEHpuI5iHqd91xb53YAidYLFqA1xPqyfSKo6UVhA4AkbM
   w==;
X-CSE-ConnectionGUID: RrJa+dohRaOh3oKMmDoh6w==
X-CSE-MsgGUID: 8htIaf06RZ6A15NTtzwkWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34997310"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34997310"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 01:55:43 -0800
X-CSE-ConnectionGUID: 50/I6861QIqE5bS122JuSA==
X-CSE-MsgGUID: yp1YD35OR3G1r15f2Q6hJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="128297765"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 01:55:41 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B986011F775;
	Tue, 17 Dec 2024 11:55:37 +0200 (EET)
Date: Tue, 17 Dec 2024 09:55:37 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH v4 01/13] media: i2c: imx214: Use subdev active state
Message-ID: <Z2FKmSszfaj86WBV@kekkonen.localdomain>
References: <20241216-imx214-v4-0-8cbda160fbce@apitzsch.eu>
 <20241216-imx214-v4-1-8cbda160fbce@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216-imx214-v4-1-8cbda160fbce@apitzsch.eu>

Hi André,

On Mon, Dec 16, 2024 at 10:00:47PM +0100, André Apitzsch via B4 Relay wrote:
> @@ -604,34 +568,23 @@ static int imx214_set_format(struct v4l2_subdev *sd,
>  	struct v4l2_rect *__crop;
>  	const struct imx214_mode *mode;
>  
> -	mutex_lock(&imx214->mutex);
> -
> -	__crop = __imx214_get_pad_crop(imx214, sd_state, format->pad,
> -				       format->which);
> -
>  	mode = v4l2_find_nearest_size(imx214_modes,
>  				      ARRAY_SIZE(imx214_modes), width, height,
>  				      format->format.width,
>  				      format->format.height);
>  
> -	__crop->width = mode->width;
> -	__crop->height = mode->height;
> +	imx214_update_pad_format(imx214, mode, &format->format,
> +				 format->format.code);
> +	__format = v4l2_subdev_state_get_format(sd_state, 0);
>  
> -	__format = __imx214_get_pad_format(imx214, sd_state, format->pad,
> -					   format->which);
> -	__format->width = __crop->width;
> -	__format->height = __crop->height;
> -	__format->code = IMX214_MBUS_CODE;
> -	__format->field = V4L2_FIELD_NONE;
> -	__format->colorspace = V4L2_COLORSPACE_SRGB;
> -	__format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(__format->colorspace);
> -	__format->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> -				__format->colorspace, __format->ycbcr_enc);
> -	__format->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(__format->colorspace);
> +	*__format = format->format;
>  
> -	format->format = *__format;
> +	__crop = v4l2_subdev_state_get_crop(sd_state, 0);
> +	__crop->width = mode->width;
> +	__crop->height = mode->height;
>  
> -	mutex_unlock(&imx214->mutex);
> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		imx214->cur_mode = mode;

While the patch is a major improvement as of now, it'd be nice to get rid
of the cur_mode field. Could you instead obtai nthe mode using
v4l2_find_nearest_size()?

I'm fine with changing this in a new patch on top of the set.

-- 
Regards,

Sakari Ailus

