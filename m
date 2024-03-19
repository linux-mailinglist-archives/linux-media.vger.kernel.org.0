Return-Path: <linux-media+bounces-7339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F401C880814
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 00:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30EEE1C224D7
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 23:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128A85F569;
	Tue, 19 Mar 2024 23:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="noo+pDI6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445481E532
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 23:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710890087; cv=none; b=GzDh6ZxYrrR245FLDHGMl4Zf8Q9Kw6ZB+WANO9xj9W3H2AYhQTyVENA0XnOcLEHh3FnddaG1rTX3WUjxRZ9IzdKPvBPU54quI07kuZMg8Z9N1K77v/6k4q55xDmY4Ef6dkSH5jJRzrzjKyJqNL2vd2H1jbaKc1DRJXE6vCAhUpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710890087; c=relaxed/simple;
	bh=jkzLVX+Z+syZVfPcKEQ01rl+LGQxityaK5kiFAQF1Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wo5uJHrG/vkuYXwsyrWuVmaOBUGzYKinvlE8c8DOjXLuIdb7Ep+doQJNqB4GYZOoWpFdnWBx4MOPY+Osv4eGCaluw8Qo+NAYXD00Ma1Wd8B6VTgHaGA4mQWR/AddqNqjkIpv3hYtv6b94GtzBvMt3ilZNhah4Y4JfnPgTGxRWPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=noo+pDI6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 169D5B1;
	Wed, 20 Mar 2024 00:14:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710890056;
	bh=jkzLVX+Z+syZVfPcKEQ01rl+LGQxityaK5kiFAQF1Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noo+pDI6bXL42UFH41+FRILzx3CkzFHnr7Dasi14q+YxgVhg7d5VtNAs2o8TJqN2/
	 HBTrcKeTxzyf25GPA4dBqCcyYFx/yfwIk9Odx7U+kJe/fU9Z4cpxMu3CtB+vUwG9p/
	 PM51tR2nNZtgFf2P9JWG57ntDHxUktBjp6dFSBCE=
Date: Wed, 20 Mar 2024 01:14:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 04/38] media: uapi: Document which mbus format fields
 are valid for metadata
Message-ID: <20240319231440.GI8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-5-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:42AM +0200, Sakari Ailus wrote:
> Now that metadata mbus formats have been added, it is necessary to define
> which fields in struct v4l2_mbus_format are applicable to them (not many).
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/uapi/linux/v4l2-mediabus.h | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
> index 6b07b73473b5..de1d6161bf62 100644
> --- a/include/uapi/linux/v4l2-mediabus.h
> +++ b/include/uapi/linux/v4l2-mediabus.h
> @@ -19,12 +19,18 @@
>   * @width:	image width
>   * @height:	image height
>   * @code:	data format code (from enum v4l2_mbus_pixelcode)
> - * @field:	used interlacing type (from enum v4l2_field)
> - * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
> - * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
> - * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
> - * @quantization: quantization of the data (from enum v4l2_quantization)
> - * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
> + * @field:	used interlacing type (from enum v4l2_field), zero on metadata
> + *		mbus codes

I would write "zero for metadata formats". Up to you.

Shouldn't you also update
Documentation/userspace-api/media/v4l/subdev-formats.rst ?

> + * @colorspace:	colorspace of the data (from enum v4l2_colorspace), zero on
> + *		metadata mbus codes
> + * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding), zero
> + *		on metadata mbus codes
> + * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding), zero on
> + *		metadata mbus codes
> + * @quantization: quantization of the data (from enum v4l2_quantization), zero
> + *		on metadata mbus codes
> + * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func), zero
> + *		on metadata mbus codes
>   * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
>   * @reserved:  reserved bytes that can be later used
>   */

-- 
Regards,

Laurent Pinchart

