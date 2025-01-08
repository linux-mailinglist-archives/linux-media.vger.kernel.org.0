Return-Path: <linux-media+bounces-24379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 040C6A05502
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 09:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00A3C16577A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 08:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016E31DE3CE;
	Wed,  8 Jan 2025 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkgjmUHY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC961AA781;
	Wed,  8 Jan 2025 08:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736323758; cv=none; b=b1OaFozatnqZIExzb2++i+8KWoMGJFVyHtDT4EmdINdt+gh2vNA0H74rI3PstTD5RpPH7tDh7tE0OVhFVgHurSpxb3bkFl1kksYhJptCTLIwqQS11zKJk8AyykCiv2zfemDgTdHFQV0xL/bNyuj7z94fJcRfT6xzKIi0w5j+apA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736323758; c=relaxed/simple;
	bh=EhrXhmuugAUf9A+DMIseR62Qd2kdQD2Wz+y/yrl7k2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQ1Alhi6Jh+M0Lk7b+fQELSE4va6FwAwXQJY6MosxdePBUEv64c5GeZVnPdqephZ6uPflcQLu8a7AwbkQ7kR3Qu0Zbf/0ffbyBDrUzyQSiwjIcokWqk/SCPEVCcWWNStzays8j4vKLszfWaTebatQ3M8c/6PsXKXjdwS2t/xGHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkgjmUHY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736323757; x=1767859757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EhrXhmuugAUf9A+DMIseR62Qd2kdQD2Wz+y/yrl7k2I=;
  b=gkgjmUHYCZ4NTX2qN5OzFEMFm0A4QPTObL7ERn/M/nlP4+ScHC9+Rx2K
   WEsPs4RW/PKeHfrSnDHBctm1MokLxFpr13mlweT2Yo5AS3ixCiKTbWbGR
   /y0Xh0LU8Xs1HShJDWtRvpS/PzdDVsDtTUC8I2vIyK83eoX+ksll246KB
   nfTK+mMJGB1Sz3gWverMm+4RV5NhecXb84kZZEUwqVIijciFfTD2vb5Ti
   mSJlQDY66cmwVKHGd0H7Rlfq6SCzfHwGthMUswJVI75Go1K0L7KxW1+Mw
   h7OqmQELDLY2Z4pL/H0aA8xlIQaXMiMZjVDgqbHU+GUYDomMizUyFmNCQ
   A==;
X-CSE-ConnectionGUID: hNx4Ct1dTLaKcUEV1qEIBA==
X-CSE-MsgGUID: ZKg5XuoLSkqcCN3LXaqqUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="35829805"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="35829805"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 00:09:16 -0800
X-CSE-ConnectionGUID: Q/6a6sUtS72jFyRGUWyEyA==
X-CSE-MsgGUID: O1DVggeYQWW+EAckMs19MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108075856"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 00:09:12 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1359B11F9C0;
	Wed,  8 Jan 2025 10:09:09 +0200 (EET)
Date: Wed, 8 Jan 2025 08:09:09 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	John Cox <john.cox@raspberrypi.com>,
	Dom Cobley <dom@raspberrypi.com>,
	review list <kernel-list@raspberrypi.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] docs: uapi: media: Document Raspberry Pi NV12 column
 format
Message-ID: <Z34ypbE2mNp1tC5V@kekkonen.localdomain>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
 <20241220-media-rpi-hevc-dec-v1-2-0ebcc04ed42e@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-2-0ebcc04ed42e@raspberrypi.com>

Hi Dave,

Thanks for the set.

On Fri, Dec 20, 2024 at 04:21:13PM +0000, Dave Stevenson wrote:
> The Raspberry Pi HEVC decoder uses a tiled format based on
> columns for 8 and 10 bit YUV images, so document them as
> NV12MT_COL128 and NV12MT_10_COL128.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index b788f6933855..90414491d7b5 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -827,6 +827,48 @@ Data in the 12 high bits, zeros in the 4 low bits, arranged in little endian ord
>        - Cb\ :sub:`11`
>        - Cr\ :sub:`11`
>  
> +NV12MT_COL128 and NV12MT_10_COL128

Please use full macro names of the formats here.

> +----------------------------------
> +
> +``V4L2_PIX_FMT_NV12MT_COL128`` is a tiled version of
> +``V4L2_PIX_FMT_NV12M`` where the two planes are split into 128 byte wide columns
> +of Y or interleaved CbCr.
> +
> +NV12MT_10_COL128 expands that as a 10 bit format where 3 10 bit values are

Ditto.

> +packed into a 32bit word. A 128 byte wide column therefore holds 96 samples
> +(either Y or interleaved CrCb). That effectively makes it 6 values in a 64 bit
> +word for the CbCr plane, as the values always go in pairs.
> +
> +Bit-packed representation.
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 8 8 8 8
> +
> +    * - Y'\ :sub:`00[7:0]`
> +      - Y'\ :sub:`01[5:0] (bits 7--2)` Y'\ :sub:`00[9:8]`\ (bits 1--0)
> +      - Y'\ :sub:`02[3:0] (bits 7--4)` Y'\ :sub:`01[9:6]`\ (bits 3--0)
> +      - unused (bits 7--6)` Y'\ :sub:`02[9:4]`\ (bits 5--0)
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 12 12 12 12 12 12 12
> +
> +    * - Cb\ :sub:`00[7:0]`
> +      - Cr\ :sub:`00[5:0]`\ (bits 7--2) Cb\ :sub:`00[9:8]`\ (bits 1--0)
> +      - Cb\ :sub:`01[3:0]`\ (bits 7--4) Cr\ :sub:`00[9:6]`\ (bits 3--0)
> +      - unused (bits 7--6) Cb\ :sub:`02[9:4]`\ (bits 5--0)
> +      - Cr\ :sub:`01[7:0]`
> +      - Cb\ :sub:`02[5:0]`\ (bits 7--2) Cr\ :sub:`01[9:8]`\ (bits 1--0)
> +      - Cr\ :sub:`02[3:0]`\ (bits 7--4) Cb\ :sub:`02[9:6]`\ (bits 3--0)
> +      - unused (bits 7--6) Cr\ :sub:`02[9:4]`\ (bits 5--0)
> +
>  
>  Fully Planar YUV Formats
>  ========================
> 

-- 
Kind regards,

Sakari Ailus

