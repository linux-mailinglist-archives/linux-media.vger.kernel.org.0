Return-Path: <linux-media+bounces-17135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAA2964537
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 14:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D76C1C24C5F
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 12:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737AD1B4C4B;
	Thu, 29 Aug 2024 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9IAaZoZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CA51B3F0C;
	Thu, 29 Aug 2024 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724935353; cv=none; b=KYEdQXgiXDkivdFGC12iIhnpm8Xxy2edNt4mC4UyyZ2FwQ8vFgMLvjCjnvl0ZpFWxZhPRb9mJjEKI4Ku6uXO8/IkBuP3zbBvFlLZQXHZczsQqyTS2zTel9kMIiQRP/gdIJYPRCBDg3eOsfqp1yiN5a7Zl0EJxUuh12kU+mO6Wno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724935353; c=relaxed/simple;
	bh=S8HjtZR9IGY8h9Q2Aw0t82mnMV37G1ct121ak2NRpr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIVg796PSd9kdhykmKwpVd4h7O4/zpF1436BENF/0++fDqnFNniwZVO2QE2DW86ILtnm1epdLCRrIiGxS1FhAdoIc/5bH8I17EX2ou437tMZIwu1EKhyaZ9lT53UqKlLwjZD0cSNJr6KWxpU9B9wAsY+mYQ09Wbk0/D2RChA6/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9IAaZoZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724935352; x=1756471352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S8HjtZR9IGY8h9Q2Aw0t82mnMV37G1ct121ak2NRpr8=;
  b=P9IAaZoZW8Y61AImToGYzI9Qg239o0a9wMH7G3llnTrhj6umlSts3jK6
   3Wwt+bpIWGk7iIAnmnfVP2FB+HEujTjzNc5g/cuHBHbky5ctMd6SjB2m/
   Sjj6b1v+BmtG1InhKYVVU/hmpW7U9sEacgvO99rmsSXeDJPLdb626M3AR
   verYWEC8CaN2fRY6Gn1GpWMp23RvA6IlDYAgGGLj+EzxpGL7r+yPyrK3V
   76iwLU8TR0XEMparu3ltxUVuchUwR2RUbpucSBUZJmE8jqBaJWtM0fGRY
   R7/B+ObeJnLY5djGEXdMHse4AvJW9CWx/w0Z1ctiymC6JPIFVX1TFo9m8
   g==;
X-CSE-ConnectionGUID: qS1EgQOpQFOzE6k4AZ0I6w==
X-CSE-MsgGUID: HgkLIJcKTASA0Ky/36uCbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23475813"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="23475813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 05:42:32 -0700
X-CSE-ConnectionGUID: tpVEf2/oSvOu4V2WCBYlow==
X-CSE-MsgGUID: fmqmIbY/TbGtwjn27vf5hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="86791284"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 05:42:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5C55C11F8D1;
	Thu, 29 Aug 2024 15:42:27 +0300 (EEST)
Date: Thu, 29 Aug 2024 12:42:27 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Bara <bbara93@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v2 1/2] media: i2c: imx290: Check for availability in
 probe()
Message-ID: <ZtBss-c1IN7j-Nf5@kekkonen.localdomain>
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
 <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com>

Hi Benjamin,

On Wed, Aug 28, 2024 at 08:13:07PM +0200, Benjamin Bara wrote:
> Currently, the V4L2 subdevice is also created when the device is not
> available/connected. In this case, dmesg shows the following:
> 
> [   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
> [   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
> [   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
> [   10.454018] imx290 7-001a: Error writing reg 0x3020: -6
> 
> which seems to come from imx290_ctrl_update() after the subdev init is
> finished. However, as the errors are ignored, the subdev is initialized
> but simply does not work. From userspace perspective, there is no
> visible difference between a working and not-working subdevice (except
> when trying it out or watching for the error message).
> 
> This commit adds a simple availability check before starting with the
> subdev initialization to error out instead.
> 
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
> Changes since v1:
> - define operating/standby mode and use it
> - read out the standby mode during probe and ensure it is standby
> ---
>  drivers/media/i2c/imx290.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 4150e6e4b9a6..2a869576600c 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -29,6 +29,8 @@
>  #include <media/v4l2-subdev.h>
>  
>  #define IMX290_STANDBY					CCI_REG8(0x3000)
> +#define IMX290_STANDBY_OPERATING			(0 << 0)
> +#define IMX290_STANDBY_STANDBY				(1 << 0)

This should use BIT() instead (or at least unsigned values). I'll fix that
while at it, too...

-- 
Kind regards,

Sakari Ailus

