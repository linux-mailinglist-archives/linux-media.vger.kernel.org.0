Return-Path: <linux-media+bounces-31142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DEBA9E94D
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E571E16BE9E
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 07:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7D61DE2CD;
	Mon, 28 Apr 2025 07:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKNW/iIp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6698BE67;
	Mon, 28 Apr 2025 07:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825343; cv=none; b=h6SSkPzOaLpNm2Xtn9XUkL5IwewP4Bq2/DILypSWwWMdttQxVgsv4iowQApcdq77BU8viRMr+ZnP0Xfl8GnMWijiVu8B5DCzo2zQA3zVlu+lyiKPTxxdBrOAs6XJ20P9+eonJk3HWw/bRnHiZykMdlIVvERZzg7c9G+jDN7WfoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825343; c=relaxed/simple;
	bh=r2T7HJgjZzPjMpTgQmCF5Uk7xH/bH2ww79tG/o31UWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhWBebX0QapkpQT+mTN0cmTgcaYprO+b/Qm+/1ofLt3E8HhSakRlZM703u50XonD2ZXg2KvceUNA3IRrhCQnkEV9Gh9TvZl/67y/9iijtvV6wC2/w2CPSytsi45UpO8ld0OGMY8e23V9rQDo5o4LUVfWaRQqugi7SSF1uqeqID4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKNW/iIp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745825342; x=1777361342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r2T7HJgjZzPjMpTgQmCF5Uk7xH/bH2ww79tG/o31UWA=;
  b=KKNW/iIp4TmrX0LDVK1PmbiFd12orub8AMjlhQUANMbV4q8rOmzr3gRO
   W/Wnp4CUog6EaovjJtfu8wO3GynSY36ZX2a1c3rJecyYT1Uql6LlkvrkK
   b4DEQAHe1J+02sW/IZJCqv0LIVAQpNj9lPy9fgpHLVaMejpE7N3ZoUfST
   k5Tk1JxJIg906kfiUHMivXKwQktr7HckstBC3g+8SvEGNQNnGtOa95u09
   xwgUruY56CgfpYdqlQMfJAsJR3+gnVYa/5KPcWwtSWkSAzKlPA9cYEdmT
   9MFt7+ne47p/JGTI4yxbhvtfqz+TWhXkaY2OwyrQ8Ab/HaCldm7ZrUGd7
   Q==;
X-CSE-ConnectionGUID: ogEqycZIROuF9CfylUQhvA==
X-CSE-MsgGUID: o2rruErIT4yZffGwfzEKNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50057855"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="50057855"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:29:01 -0700
X-CSE-ConnectionGUID: PH+RgssvT7+Jx8RSetxsXA==
X-CSE-MsgGUID: P4w6AvhvRPGyxhOIOUsrDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="133410088"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:28:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 03D0D11FB0B;
	Mon, 28 Apr 2025 10:28:56 +0300 (EEST)
Date: Mon, 28 Apr 2025 07:28:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: Add OminiVision 0V02C10
Message-ID: <aA8uN5Y4MuqR-p7H@kekkonen.localdomain>
References: <20250426-b4-sailusfor-6-16-1-5-signed-ov02c10-yaml-v1-1-9a46124fae7b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426-b4-sailusfor-6-16-1-5-signed-ov02c10-yaml-v1-1-9a46124fae7b@linaro.org>

Hi Bryan,

Thanks for the patch.

On Sat, Apr 26, 2025 at 11:35:21PM +0100, Bryan O'Donoghue wrote:
> Extend the ov02e10 bindings yaml to describe the ov02c10 sensor which has
> the same bindings with a different compat string and different i2c
> address only.
> 
> Other differences in sensor capabilities exist but are not expressed in
> devicetree.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> I previously submitted a standalone ov02c10 yaml file but, it was pointed
> out to me by Krzysztof that the ov02e10 yaml has exactly the same bindings
> and we should therefore extend the ov02e10 yaml.
> 
> Link: https://lore.kernel.org/linux-media/da93bf6c-b4bc-4c4f-9373-583fbd0c031c@kernel.org/
> 
> The accompanying patch:
> 
> - Updates the overall description to differentiate between the two sensors
> - Adds ovti,ov02c10 compat string
> - Adds an example for the ov02c10
> 
> Once merged we can also merge the ov02c10 driver, which contains a compat
> string requiring yaml description as precursor to merge.
> ---
>  .../bindings/media/i2c/ovti,ov02e10.yaml           | 47 ++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
> index 4ac4e11a16c8bb7a53db0c44289b1004dbdc282a..1561a3e96caa8b09a4c105b87536bb0d00b2adf8 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
> @@ -11,12 +11,22 @@ maintainers:
>    - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  
>  description: |
> -  The Omnivision OV02E10 is a 2 megapixel, CMOS image sensor which supports:
> +  The Omnivision OV02E10 and 0V02C10 sensors are 2 megapixel, CMOS image sensors which support:
>    - Automatic black level calibration (ABLC)
>    - Programmable controls for frame rate, mirror and flip, binning, cropping
>      and windowing
> -  - Output formats 10-bit 4C RGB RAW, 10-bit Bayer RAW
> -  - 2-lane MIPI D-PHY TX @ 720 Mbps per lane
> +  - OVO2C10
> +    - 10 bit 1920x1080 60 fps 2-lane @ 800 Mbps/lane
> +    - 10 bit 1920x1080 60 fps 1-lane @ 1500 Mbps/lane
> +    - 10 bit 1280x720 60 fps cropped 1-lane @ 960 Mbps/lane
> +    - 10 bit RGB/BW 640x480 60 fps bin2 or skip2 1-lane @ 800 Mbps/lane
> +    - 10 bit RGB/BW 480x270 60 fps bin4 or skip4 1-lane @ 800 Mbps/lane
> +  - OV02E10
> +    - 10 bit 1920x1088 60 fps 2-lane @ 720 Mbps/lane
> +    - 10 bit 1280x1080 60 fps 2-lane @ 720 Mbps/lane
> +    - 10 bit 960x540 60 fps 2-lane 4c1 360 Mbps/lane
> +    - 8 bit 480x270 1/3/5/10 fps 4c1 sub2 288 Mbps/lane
> +    - 8 bit 232x132 1/3/5/10 fps 4c1 sub4 144 Mbps/lane

These look like driver features rather than hardware properties. What are
the hardware differences of the two sensors that could be listed here?

The earlier description also said this is 4C which I understand is
Omnivision term for quad Bayer pattern. It'd be nice to refer to that, too.
(I'd use quad Bayer instead in fact.)

-- 
Regards,

Sakari Ailus

