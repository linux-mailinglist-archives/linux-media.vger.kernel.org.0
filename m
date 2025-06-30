Return-Path: <linux-media+bounces-36244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBD6AED571
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 180C51897D0B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 07:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF4521A437;
	Mon, 30 Jun 2025 07:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gM97l25+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA371FDD
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268184; cv=none; b=jH04kjIlG6qubeiLqF6/YRbNqEmWxlKLFe1tNF4fzAIwFjPYFho4fZVEK/PpgoNrBnnaU+6qn9qwFhPWupZzgaxeqHQdmZlkbQJAE045cOFK948ltIJxS0+Jb9AaDCqOdMRP9sh0X22ih+ljnOIJflo+kBeIpvlHY0NzpgMqaMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268184; c=relaxed/simple;
	bh=iehFW8zAM/mvhivRWNfHlq+dy/cEmujbqojQxo7GT/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7OEFMnmR1qYWQWljIKpSAA+ndyJH4bq7Se6QYZyLutWY4et4gfFsSnwi3TJdNVTNx3N77O9IBS+cCw49BbW2V1Y+gS+zsEo1SpHZmVj5+ZuPTt/3jCcX1t9rRX1t5dPdWCcxyRGgdNzVRQHkdXS7lOk9GIoVivJYBYcv8RCoTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gM97l25+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751268183; x=1782804183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iehFW8zAM/mvhivRWNfHlq+dy/cEmujbqojQxo7GT/U=;
  b=gM97l25+FKt13mi3iqN73U76uAdXdHqO+CcQg62X9KqBlXvw3IceK6Ay
   nG1epZu43bUnXVsBqSkoTpgbLGuKHPcElZLxlmzuNaTLnGYWwz7In9g0I
   8sOgadSQDTgWA4JS9m52CaLkx45yiH2aMNEZKv5VxOpcQ+mL7E6RVy1Wh
   Svq39ls8JUNEIvJSS6Prb7O379QLQPJjoBYHeR2zLWeMIitfQ/3G0O/Zy
   81Sl0t1IkSDSuYHPi3x1ZeVuleJSLhbXLaluHHjmWkO5APFeRYQGqAf0I
   HJ+VjrVfrfAnXgDb1E1JI/GU+sq7InRxgEGQZDnU9VsFw2cUX868QBMVs
   g==;
X-CSE-ConnectionGUID: YvCtwn+PR0GfTL+3pL2DJA==
X-CSE-MsgGUID: OD8ujj6wQ3KTWuei6A5qxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57164102"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="57164102"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:23:02 -0700
X-CSE-ConnectionGUID: 4RzES4TDQE2KkekcOENNEQ==
X-CSE-MsgGUID: KsZTEI1kRHWV1Hrst0Mx8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="159110435"
Received: from agladkov-desk.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.57])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:23:00 -0700
Received: from svinhufvud (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTPS id 1C8CA443F1;
	Mon, 30 Jun 2025 10:22:57 +0300 (EEST)
Date: Mon, 30 Jun 2025 10:22:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, hansg@kernel.org,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: hi556: correct the test pattern configuration
Message-ID: <aGI7RQX5gXRFZx5F@svinhufvud>
References: <20250630054822.859782-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630054822.859782-1-bingbu.cao@intel.com>

Hi Bingbu,

Thanks for the patch.

On Mon, Jun 30, 2025 at 01:48:22PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Hynix hi556 support 8 test pattern modes:
> hi556_test_pattern_menu[] = {
> {
> 	"Disabled",
> 	"Solid Colour",
> 	"100% Colour Bars",
> 	"Fade To Grey Colour Bars",
> 	"PN9",
> 	"Gradient Horizontal",
> 	"Gradient Vertical",
> 	"Check Board",
> 	"Slant Pattern",
> }
> 
> The test pattern is set by a 8-bit register according to the
> specification.
> +--------+-------------------------------+
> | BIT[0] |  Solid color                  |
> +--------+-------------------------------+
> | BIT[1] |  Color bar                    |
> +--------+-------------------------------+
> | BIT[2] |  Fade to grey color bar       |
> +--------+-------------------------------+
> | BIT[3] |  PN9                          |
> +--------+-------------------------------+
> | BIT[4] |  Gradient horizontal          |
> +--------+-------------------------------+
> | BIT[5] |  Gradient vertical            |
> +--------+-------------------------------+
> | BIT[6] |  Check board                  |
> +--------+-------------------------------+
> | BIT[7] |  Slant pattern                |
> +--------+-------------------------------+
> Based on function above, current test pattern programming is wrong.
> This patch fixes it by '1 << (pattern - 1)'.
> 
> Fixes: e62138403a84 ("media: hi556: Add support for Hi-556 sensor")
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/i2c/hi556.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
> index aed258211b8a..fc4d63160a59 100644
> --- a/drivers/media/i2c/hi556.c
> +++ b/drivers/media/i2c/hi556.c
> @@ -756,21 +756,22 @@ static int hi556_test_pattern(struct hi556 *hi556, u32 pattern)
>  	int ret;
>  	u32 val;
>  
> -	if (pattern) {
> -		ret = hi556_read_reg(hi556, HI556_REG_ISP,
> -				     HI556_REG_VALUE_08BIT, &val);
> -		if (ret)
> -			return ret;
> +	if (!pattern)
> +		return 0;
>  
> -		ret = hi556_write_reg(hi556, HI556_REG_ISP,
> -				      HI556_REG_VALUE_08BIT,
> -				      val | HI556_REG_ISP_TPG_EN);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = hi556_read_reg(hi556, HI556_REG_ISP,
> +			     HI556_REG_VALUE_08BIT, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = hi556_write_reg(hi556, HI556_REG_ISP,
> +			      HI556_REG_VALUE_08BIT,
> +			      val | HI556_REG_ISP_TPG_EN);

How do you disable the test pattern once it has been enabled? Do you
always enable the TPG_EN bit, even when not using test patterns?

> +	if (ret)
> +		return ret;
>  
>  	return hi556_write_reg(hi556, HI556_REG_TEST_PATTERN,
> -			       HI556_REG_VALUE_08BIT, pattern);
> +			       HI556_REG_VALUE_08BIT, 1 << (pattern - 1));

Could you use:

	BIT(pattern - 1)

here?

Note that shifting 1 left to the sign bit isn't defined on all
architectures so I would say the pattern of shifting a signed integer left
is simply something you shouldn't use at all.

>  }
>  
>  static int hi556_set_ctrl(struct v4l2_ctrl *ctrl)

-- 
Kind regards,

Sakari Ailus

