Return-Path: <linux-media+bounces-7312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8823A87FE7F
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 14:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FD0F1F228D1
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 13:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730C27FBBB;
	Tue, 19 Mar 2024 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axbfzDnT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF965A782
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 13:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854343; cv=none; b=eRpMNe6ntBog5d+bz27RxVh9B1M5oLudf2kFjbTz4VdJYGguBS6KIT3y0qsVhz9ZC4TdW6+5FiqY4QYt68iXBrDnfQVF/Tgi34t9z2hyd4R5BRypxkh2CMM7qaCRFFz5KicoWt9qDay9MSO8t+Kx89UuGcejya88GFmp0wQIWyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854343; c=relaxed/simple;
	bh=rARRdeOKBEZX2TOpBedtbkqYIxMyYTzRWIKofZPveCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjOw0qYEsVnz2ikSi6mS/LnDWABoN0xmYmJEzLU8IxBI6Y7XAxueKokuS2wm32wB8UNnv4MmYr7bVMvuKSqklhgy7o8ELS8rGTfR0/AQNS2GnlQf671TQHr1NfQnzAhPMmx5+tvi2t7VQdTbu00snteJY0vSZFBLF00jdnCCsoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axbfzDnT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710854342; x=1742390342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rARRdeOKBEZX2TOpBedtbkqYIxMyYTzRWIKofZPveCc=;
  b=axbfzDnTy2/Qw1rLvRg/GvcAKJlr/1v669fpQVc/sjuvnBIXkJBUmb3X
   5l63akr/T8wptCwKL+bmIlfFTqRSfoOg9y8f6cJekadAnK52HENuVfi9w
   AbBu09E9itM/+D97BmCVhwz52Ezqz0Nwo5wdPPZ+KE31stCM7V9aiC/q3
   yaSWyNtK0+Lwc9sgL/ItaQTMAjPuOdY0rowv2POtvuJ9gFmVLoDbWqGz7
   Qrpu1fF3nDIcbmPFgtkuJzQf+Lt6PLVK2I9K40tAHdUtMxG7QMW1YUwoU
   8xzNuLMTWIIOUZ4VE0SvY2tlnLAFVCRswaY1Uu+CSPNiH1QZslbJEPXTC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5845083"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5845083"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 06:19:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="36945275"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 06:18:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 28F8111F853;
	Tue, 19 Mar 2024 15:18:56 +0200 (EET)
Date: Tue, 19 Mar 2024 13:18:56 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
	hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 35/38] media: ov2740: Add support for embedded data
Message-ID: <ZfmQwCFOPp9oOiuY@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-36-sakari.ailus@linux.intel.com>
 <ca64e301-5507-4bb7-8ebe-2c30e8800709@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca64e301-5507-4bb7-8ebe-2c30e8800709@collabora.com>

Hi Julien,

Thanks for the review.

On Thu, Mar 14, 2024 at 09:24:48AM +0100, Julien Massot wrote:
> Hi Sakari,
> 
> On 3/13/24 08:25, Sakari Ailus wrote:
> > Add support for embedded data. This introduces two internal pads for pixel
> > and embedded data streams. As the driver supports a single mode only,
> > there's no need for backward compatibility in mode selection.
> > 
> > The embedded data is configured to be placed before the image data whereas
> > after the image data is the default.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/media/i2c/ov2740.c | 150 +++++++++++++++++++++++++++++++++----
> >   1 file changed, 137 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> > index df57f0096e98..7488b2535071 100644
> > --- a/drivers/media/i2c/ov2740.c
> > +++ b/drivers/media/i2c/ov2740.c
> > @@ -11,6 +11,7 @@
> >   #include <linux/pm_runtime.h>
> >   #include <linux/nvmem-provider.h>
> >   #include <linux/regmap.h>
> > +#include <media/mipi-csi2.h>
> >   #include <media/v4l2-ctrls.h>
> >   #include <media/v4l2-device.h>
> >   #include <media/v4l2-fwnode.h>
> > @@ -71,11 +72,31 @@
> >   #define OV2740_REG_ISP_CTRL00		0x5000
> >   /* ISP CTRL01 */
> >   #define OV2740_REG_ISP_CTRL01		0x5001
> > +
> > +/* Embedded data line location control */
> > +#define OV2740_REG_EMBEDDED_FLAG	0x5a08
> > +#define OV2740_EMBEDDED_FLAG_FOOTER	BIT(2) /* otherwise it's in header */
> > +#define OV2740_EMBEDDED_FLAG_MYSTERY	BIT(1)
> >   /* Customer Addresses: 0x7010 - 0x710F */
> >   #define CUSTOMER_USE_OTP_SIZE		0x100
> >   /* OTP registers from sensor */
> >   #define OV2740_REG_OTP_CUSTOMER		0x7010
> > +enum {
> > +	OV2740_PAD_SOURCE,
> > +	OV2740_PAD_PIXEL,
> > +	OV2740_PAD_META,
> > +	OV2740_NUM_PADS,
> > +};
> > +
> > +enum {
> > +	OV2740_STREAM_PIXEL,
> > +	OV2740_STREAM_META,
> > +};
> > +
> > +#define OV2740_META_WIDTH		100U /* 97 bytes of actual data */
> > +#define OV2740_META_HEIGHT		1U
> > +
> >   struct nvm_data {
> >   	struct nvmem_device *nvmem;
> >   	struct regmap *regmap;
> > @@ -513,7 +534,7 @@ static const struct ov2740_mode supported_modes_180mhz[] = {
> >   struct ov2740 {
> >   	struct v4l2_subdev sd;
> > -	struct media_pad pad;
> > +	struct media_pad pads[OV2740_NUM_PADS];
> >   	struct v4l2_ctrl_handler ctrl_handler;
> >   	/* V4L2 Controls */
> > @@ -976,6 +997,11 @@ static int ov2740_enable_streams(struct v4l2_subdev *sd,
> >   	if (ret)
> >   		goto out_pm_put;
> > +	ret = ov2740_write_reg(ov2740, OV2740_REG_EMBEDDED_FLAG, 1,
> > +			       OV2740_EMBEDDED_FLAG_MYSTERY);
> > +	if (ret)
> > +		return ret;
> > +
> >   	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
> >   			       OV2740_MODE_STREAMING);
> >   	if (ret) {
> > @@ -1013,23 +1039,49 @@ static int ov2740_disable_streams(struct v4l2_subdev *sd,
> >   	return ret;
> >   }
> > -static int ov2740_set_format(struct v4l2_subdev *sd,
> > -			     struct v4l2_subdev_state *sd_state,
> > -			     struct v4l2_subdev_format *fmt)
> > +static int __ov2740_set_format(struct v4l2_subdev *sd,
> > +			       struct v4l2_subdev_state *sd_state,
> > +			       struct v4l2_mbus_framefmt *format,
> > +			       enum v4l2_subdev_format_whence which,
> > +			       unsigned int pad, unsigned int stream)
> >   {
> > +	struct v4l2_mbus_framefmt *src_pix_fmt, *src_meta_fmt, *pix_fmt,
> > +		*meta_fmt;
> >   	struct ov2740 *ov2740 = to_ov2740(sd);
> >   	const struct ov2740_mode *mode;
> >   	s32 vblank_def, h_blank;
> > +	/*
> > +	 * Allow setting format on internal pixel pad as well as the source
> > +	 * pad's pixel stream (for compatibility).
> > +	 */
> > +	if (pad == OV2740_PAD_SOURCE || pad == OV2740_PAD_META ||
> > +	    stream == OV2740_STREAM_META) {
> This is equivalent to
> if (pad != OV2740_PAD_PIXEL)
> Correct me if I'm wrong but this code doesn't allow to set the format on the
> source pad.

Good point. I put that to the comment but somehow failed to align the code
with the statement.

> 
> Should it be:
> if ((pad == OV2740_PAD_SOURCE && stream == OV2740_STREAM_META) ||
> 	pad == OV2740_PAD_META) {

This seems better indeed!

> 
> 
> > +		*format = *v4l2_subdev_state_get_format(sd_state, pad, stream);
> > +		return 0;
> > +	}
> > +
> > +	pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_PIXEL, 0);
> > +	meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_META, 0);
> > +	src_pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
> > +						   OV2740_STREAM_PIXEL);
> > +	src_meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
> > +						    OV2740_STREAM_META);
> > +
> >   	mode = v4l2_find_nearest_size(ov2740->supported_modes,
> >   				      ov2740->supported_modes_count,
> >   				      width, height,
> > -				      fmt->format.width, fmt->format.height);
> > +				      format->width, format->height);
> > +	ov2740_update_pad_format(mode, pix_fmt);
> > +	*format = *src_pix_fmt = *pix_fmt;
> > -	ov2740_update_pad_format(mode, &fmt->format);
> > -	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> > +	meta_fmt->code = MEDIA_BUS_FMT_OV2740_EMBEDDED;
> > +	meta_fmt->width = OV2740_META_WIDTH;
> > +	meta_fmt->height = OV2740_META_HEIGHT;
> > +	*src_meta_fmt = *meta_fmt;
> > +	src_meta_fmt->code = MEDIA_BUS_FMT_META_10;
> > -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > +	if (which == V4L2_SUBDEV_FORMAT_TRY)
> >   		return 0;
> >   	ov2740->cur_mode = mode;

-- 
Kind regards,

Sakari Ailus

