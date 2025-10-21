Return-Path: <linux-media+bounces-45129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AC1BF6EBA
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 15:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90FC5543534
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 13:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9757B33893D;
	Tue, 21 Oct 2025 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtFjfpN9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A72426E6F4
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761054775; cv=none; b=b4n8j87L6USzySvIfzBNBlezUbrSMjK1BJXsWR8/fOirzZI+NjpCRaw0vUk1+dOYbRvKIcUlkOcn6izcqiHoxa25cZNaoHesAcFOML5s8V9jKmt5v0KLxPWA+/dXh9yng6eawjIWPa6oNiWfVe3J0U5TvW2LnAuIy0/PC6QYuK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761054775; c=relaxed/simple;
	bh=cwZjBBenfUtFPeKFm/iGpiyM9sJn2Rg31Is/s4b1J10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUAF6ZDDLtjtdKINRtym5OSO7838RX6LJbzq7JSZ8cYBk3krhf6xAmoOOGnb2LcVy/rhU2gCuHEmJcDviQ2q2xz5WZPDQdMrkxKZ05qiZpDZTYNj/nov3Ksw0Cw/Pwd2g0+zN1Ez2qoL8orhcOJeU8bPywc46G2jyP8wm4qzTXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtFjfpN9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761054773; x=1792590773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cwZjBBenfUtFPeKFm/iGpiyM9sJn2Rg31Is/s4b1J10=;
  b=YtFjfpN9H0spFxqX8NW6T4dYcmUqD1h0DZB2E6qQvWPydhBI82B3h4KF
   KI0sYNzqoGUN8f7tRjF1oIBZP1RjFcyMsyACy/GE0qw9nlc4+yXLzfJkU
   1Phx+HxaWONDGtMlxO5isyWoI+gSJ+X7HahcueD++zkJ3pFNyQ6tVAgxa
   Yuhq3ppZpfyu5KXmTirA/ZojZWur+Rp/xIAHRRcS8R+usPmHzurzLTn5v
   ex880bUKdqJccNG5vVNFbT4+6pQxpXeuHMXS6m4ZUXRSTx5gBozgTl0yy
   NXRHBwKFNIBPdEcydz4CsLgNa6nIXe8acxeQNXhqB5OqwOfxQ5esqcYpE
   Q==;
X-CSE-ConnectionGUID: +jN3bzSlQHqCKLH+1s8Afg==
X-CSE-MsgGUID: vAbAJXy2SUGq+MKoqZkCZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62210262"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="62210262"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 06:52:53 -0700
X-CSE-ConnectionGUID: i0y0oVcPQvOf+NHCndyh4w==
X-CSE-MsgGUID: BMssAAZvTBKJxgDfMIdL9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="188882273"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.215])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 06:52:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 86D8B121E5D;
	Tue, 21 Oct 2025 16:52:48 +0300 (EEST)
Date: Tue, 21 Oct 2025 16:52:48 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ipu6: isys: Add support for monochrome media bus
 formats
Message-ID: <aPeQMFCNEniNjC5_@kekkonen.localdomain>
References: <20251020153741.55404-1-hansg@kernel.org>
 <0d13a805-fc50-b8dc-4f5f-b4c9d24ea77a@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d13a805-fc50-b8dc-4f5f-b4c9d24ea77a@linux.intel.com>

Hi Bingbu, Hans,

On Tue, Oct 21, 2025 at 04:10:19PM +0800, Bingbu Cao wrote:
> 
> Hans,
> 
> Thanks for the patch.
> 
> On 10/20/25 11:37 PM, Hans de Goede wrote:
> > Add support for monochrome media bus formats, for use with monochrome/IR
> > camera sensors.
> > 
> > This has been tested on a Dell XPS 13 9320 with OV1A1B IR sensor.
> > 
> > Signed-off-by: Hans de Goede <hansg@kernel.org>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  4 +++
> >  .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 34 ++++++++++++++-----
> >  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 14 ++++++++
> >  3 files changed, 43 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > index d1fece6210ab..daec6b865bda 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > @@ -42,6 +42,10 @@ static const u32 csi2_supported_codes[] = {
> >  	MEDIA_BUS_FMT_SGBRG8_1X8,
> >  	MEDIA_BUS_FMT_SGRBG8_1X8,
> >  	MEDIA_BUS_FMT_SRGGB8_1X8,
> > +	MEDIA_BUS_FMT_Y8_1X8,
> > +	MEDIA_BUS_FMT_Y10_1X10,
> > +	MEDIA_BUS_FMT_Y12_1X12,
> > +	MEDIA_BUS_FMT_Y16_1X16,
> >  	MEDIA_BUS_FMT_META_8,
> >  	MEDIA_BUS_FMT_META_10,
> >  	MEDIA_BUS_FMT_META_12,
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> > index 463a0adf9e13..869e7d4ba572 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> > @@ -25,24 +25,28 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
> >  	case MEDIA_BUS_FMT_RGB565_1X16:
> >  	case MEDIA_BUS_FMT_UYVY8_1X16:
> >  	case MEDIA_BUS_FMT_YUYV8_1X16:
> > +	case MEDIA_BUS_FMT_Y16_1X16:
> >  	case MEDIA_BUS_FMT_META_16:
> >  		return 16;
> >  	case MEDIA_BUS_FMT_SBGGR12_1X12:
> >  	case MEDIA_BUS_FMT_SGBRG12_1X12:
> >  	case MEDIA_BUS_FMT_SGRBG12_1X12:
> >  	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > +	case MEDIA_BUS_FMT_Y12_1X12:
> >  	case MEDIA_BUS_FMT_META_12:
> >  		return 12;
> >  	case MEDIA_BUS_FMT_SBGGR10_1X10:
> >  	case MEDIA_BUS_FMT_SGBRG10_1X10:
> >  	case MEDIA_BUS_FMT_SGRBG10_1X10:
> >  	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +	case MEDIA_BUS_FMT_Y10_1X10:
> >  	case MEDIA_BUS_FMT_META_10:
> >  		return 10;
> >  	case MEDIA_BUS_FMT_SBGGR8_1X8:
> >  	case MEDIA_BUS_FMT_SGBRG8_1X8:
> >  	case MEDIA_BUS_FMT_SGRBG8_1X8:
> >  	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +	case MEDIA_BUS_FMT_Y8_1X8:
> >  	case MEDIA_BUS_FMT_META_8:
> >  		return 8;
> >  	default:
> > @@ -65,21 +69,25 @@ unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
> >  	case MEDIA_BUS_FMT_SGBRG16_1X16:
> >  	case MEDIA_BUS_FMT_SGRBG16_1X16:
> >  	case MEDIA_BUS_FMT_SRGGB16_1X16:
> > +	case MEDIA_BUS_FMT_Y16_1X16:
> >  		return MIPI_CSI2_DT_RAW16;
> >  	case MEDIA_BUS_FMT_SBGGR12_1X12:
> >  	case MEDIA_BUS_FMT_SGBRG12_1X12:
> >  	case MEDIA_BUS_FMT_SGRBG12_1X12:
> >  	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > +	case MEDIA_BUS_FMT_Y12_1X12:
> >  		return MIPI_CSI2_DT_RAW12;
> >  	case MEDIA_BUS_FMT_SBGGR10_1X10:
> >  	case MEDIA_BUS_FMT_SGBRG10_1X10:
> >  	case MEDIA_BUS_FMT_SGRBG10_1X10:
> >  	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +	case MEDIA_BUS_FMT_Y10_1X10:
> >  		return MIPI_CSI2_DT_RAW10;
> >  	case MEDIA_BUS_FMT_SBGGR8_1X8:
> >  	case MEDIA_BUS_FMT_SGBRG8_1X8:
> >  	case MEDIA_BUS_FMT_SGRBG8_1X8:
> >  	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +	case MEDIA_BUS_FMT_Y8_1X8:
> >  		return MIPI_CSI2_DT_RAW8;
> >  	case MEDIA_BUS_FMT_META_8:
> >  	case MEDIA_BUS_FMT_META_10:
> > @@ -96,15 +104,23 @@ unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
> >  
> >  bool ipu6_isys_is_bayer_format(u32 code)
> >  {
> > -	switch (ipu6_isys_mbus_code_to_mipi(code)) {
> > -	case MIPI_CSI2_DT_RAW8:
> > -	case MIPI_CSI2_DT_RAW10:
> > -	case MIPI_CSI2_DT_RAW12:
> > -	case MIPI_CSI2_DT_RAW14:
> > -	case MIPI_CSI2_DT_RAW16:
> > -	case MIPI_CSI2_DT_RAW20:
> > -	case MIPI_CSI2_DT_RAW24:
> > -	case MIPI_CSI2_DT_RAW28:
> > +	switch (code) {
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> > +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> > +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> > +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > +	case MEDIA_BUS_FMT_SRGGB16_1X16:
> > +	case MEDIA_BUS_FMT_SGRBG16_1X16:
> > +	case MEDIA_BUS_FMT_SGBRG16_1X16:
> > +	case MEDIA_BUS_FMT_SBGGR16_1X16:
> >  		return true;
> >  	default:
> >  		return false;
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > index f3f3bc0615e5..dec8f5ffcfa5 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > @@ -77,6 +77,20 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
> >  	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
> >  	{ V4L2_PIX_FMT_SRGGB10P, 10, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
> >  	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
> > +
> > +	{ V4L2_PIX_FMT_GREY, 8, 8, MEDIA_BUS_FMT_Y8_1X8,
> > +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
> > +	{ V4L2_PIX_FMT_Y10, 16, 10, MEDIA_BUS_FMT_Y10_1X10,
> > +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> > +	{ V4L2_PIX_FMT_Y12, 16, 12, MEDIA_BUS_FMT_Y12_1X12,
> > +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> > +	{ V4L2_PIX_FMT_Y16, 16, 16, MEDIA_BUS_FMT_Y16_1X16,
> > +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> > +	{ V4L2_PIX_FMT_Y10P, 10, 10, MEDIA_BUS_FMT_Y10_1X10,
> > +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
> > +	{ V4L2_PIX_FMT_Y12P, 12, 12, MEDIA_BUS_FMT_Y12_1X12,
> > +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
> 
> The code looks fine for me. I am wondering which sensor to test these
> packed format for IPU6.

Such packed formats appear to be defined for Bayer formats, too, so I'd
expect them to work as the Bayer equivalents that are already supported.

> 
> > +
> >  	{ V4L2_PIX_FMT_UYVY, 16, 16, MEDIA_BUS_FMT_UYVY8_1X16,
> >  	  IPU6_FW_ISYS_FRAME_FORMAT_UYVY},
> >  	{ V4L2_PIX_FMT_YUYV, 16, 16, MEDIA_BUS_FMT_YUYV8_1X16,
> > 
> 

-- 
Regards,

Sakari Ailus

