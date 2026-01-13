Return-Path: <linux-media+bounces-50494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AE6D1672B
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 04:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EF0830262BA
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 03:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092B42E0925;
	Tue, 13 Jan 2026 03:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TI9PD5Vx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F4B2E0402
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 03:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768274147; cv=none; b=cMQHZ7P6Ozo4pgj5j4UsmovE4dQlO0wJtIwCCn2t85yw/Yq/12cWebRTqa4SEHyn7oPeKTg2cQ8hxlqCf7pNa2XiHY3coZE6blTS2jpW/1XjhlQm88g76C4PGVB9cPgNi4Qg51hOwKvcFUwoQkxjt3BvQD9uAPVA6eXn93mV1zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768274147; c=relaxed/simple;
	bh=KsYQV41RrKNy3lqoy8SeSL0ENoso3JphHV/7KER8KtM=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=KH14Ndd2aP46MYaTVDZVgANMp6edZRs24ukhPSGA0dVRWWvXBOJqH/VXaYv/n/NR1vMvQHjMylYqnGv6ZB7rQDCxJM8sUwll9E1hx4UdDaVHt4KKgMV+xpfb0rLG1/v7dX698EsHUqoiAs+XPpp4xYJF0muMGZVFFIjSWzePPN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TI9PD5Vx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768274146; x=1799810146;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=KsYQV41RrKNy3lqoy8SeSL0ENoso3JphHV/7KER8KtM=;
  b=TI9PD5VxAuAkM8ElDdJzjXMIO2GxLRbjiU1xfYWknRPs78U0g0yMqX2k
   KPJ5iJYFktL2a1UTM58235AVPvfW5zfuyMwAH4qeO+MTqJkOPM/s7k/GS
   zRRX6PzESEN9QzMexJxPssrU75Bq55cxF+LHCMMWGeLXJUmtnJfI/WJXq
   fsqcvpdq99TKyUk6MbLQbMWqqsiAJayfzHsbTkAFXefLxeL91o+mcDD+g
   kGILJegmwXJ3KIIKgUxEMqStwUmNYyebBDKQUczW0Fjxnxd1KPR8kSmQE
   W9iJ5HnVNU8l5rfXlUUFtV5ED6VQkqUs1vywwt5jSLKpmJGeuR1o8le3R
   g==;
X-CSE-ConnectionGUID: TZPD59FPSTiqrgca5TBVbA==
X-CSE-MsgGUID: p5gAC3jLRbqzKKrfukJ8yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80275145"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80275145"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:15:45 -0800
X-CSE-ConnectionGUID: 4QfHTkqFTSC7hPBb5ylhPA==
X-CSE-MsgGUID: cpTvPcUdS+uSIupp9pvoEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235509053"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:15:44 -0800
Subject: Re: [PATCH v2] media: hi556: correct the test pattern configuration
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, hansg@kernel.org
References: <20250630090420.479790-1-bingbu.cao@intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <8593dee9-8cab-8427-f25f-83086ef9a235@linux.intel.com>
Date: Tue, 13 Jan 2026 11:05:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250630090420.479790-1-bingbu.cao@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

It seems this patch was missing, could you help check?

On 6/30/25 5:04 PM, bingbu.cao@intel.com wrote:
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
> This patch fixes it by 'BIT(pattern - 1)'. If pattern is 0, driver
> will disable the test pattern generation and set the pattern to 0.
> 
> Fixes: e62138403a84 ("media: hi556: Add support for Hi-556 sensor")
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/i2c/hi556.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
> index aed258211b8a..dce78af444db 100644
> --- a/drivers/media/i2c/hi556.c
> +++ b/drivers/media/i2c/hi556.c
> @@ -756,21 +756,23 @@ static int hi556_test_pattern(struct hi556 *hi556, u32 pattern)
>  	int ret;
>  	u32 val;
>  
> -	if (pattern) {
> -		ret = hi556_read_reg(hi556, HI556_REG_ISP,
> -				     HI556_REG_VALUE_08BIT, &val);
> -		if (ret)
> -			return ret;
> +	ret = hi556_read_reg(hi556, HI556_REG_ISP,
> +			     HI556_REG_VALUE_08BIT, &val);
> +	if (ret)
> +		return ret;
>  
> -		ret = hi556_write_reg(hi556, HI556_REG_ISP,
> -				      HI556_REG_VALUE_08BIT,
> -				      val | HI556_REG_ISP_TPG_EN);
> -		if (ret)
> -			return ret;
> -	}
> +	val = pattern ? (val | HI556_REG_ISP_TPG_EN) :
> +		(val & ~HI556_REG_ISP_TPG_EN);
> +
> +	ret = hi556_write_reg(hi556, HI556_REG_ISP,
> +			      HI556_REG_VALUE_08BIT, val);
> +	if (ret)
> +		return ret;
> +
> +	val = pattern ? BIT(pattern - 1) : 0;
>  
>  	return hi556_write_reg(hi556, HI556_REG_TEST_PATTERN,
> -			       HI556_REG_VALUE_08BIT, pattern);
> +			       HI556_REG_VALUE_08BIT, val);
>  }
>  
>  static int hi556_set_ctrl(struct v4l2_ctrl *ctrl)
> 

-- 
Best regards,
Bingbu Cao

