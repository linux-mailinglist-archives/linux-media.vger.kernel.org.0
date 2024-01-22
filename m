Return-Path: <linux-media+bounces-3979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1384D8363F6
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 14:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9DC61F2410D
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 13:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D63D3C697;
	Mon, 22 Jan 2024 13:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3K8/0T6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01D93C468
	for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705928787; cv=none; b=qoi6zZxt9j4IiGAK7/E0tDfpsNhwsdiINUKxGDWPcfuBLZrqFcs5RsCXp0NEiAgSinty48Z9GCEvNxM8/EHCXmaml5GMT8oMoScCAjRfukMFFZuPz/iw3lt+HXCeYq3y0+WJ7otyTMFeKeOkNhCLtLDAMXxkw/V22vCasVzG9YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705928787; c=relaxed/simple;
	bh=TND/ez+AUsV/ouzsu59YA6NQUOevN5IjoJjrz7n9Ub0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QROX0mNVtFTzYzkh8lo7Y9uwKmSyyfL56kHnWfD/YnDZGyZuVbAn2v1XpuCpRRq6u4FG9AraVADq5Bqee9aatw0DWSJvX3kH57kyD0ZPguVJI7Zg5Cf2iK7W7gEdsywSSf+R9HCCbT6ZiGep6jKVPRWCiQxx59dF4UlTQi1REGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3K8/0T6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705928786; x=1737464786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TND/ez+AUsV/ouzsu59YA6NQUOevN5IjoJjrz7n9Ub0=;
  b=B3K8/0T6jNs48XBq936ZRaVuUQuKadbJZdxEERS/C3J5z5rSjfLTrlUM
   y1fOYNvooj48CKWZyIxy+YNtJAo4c+oR4gCNs/brboQhDnPlZ/qPpbvTR
   AAk+lzsrzZdBI9mq6qTd/w2t8qhLMgiLoPItQEkTQnpSrxjv/zn05caA+
   iR6Jarcf0TunKc6UFSK4lc1khenUjiawLigUz4A7P7NCSbfTPORiH3pPS
   cHWjKNA3lmbvHnyyc1e413k0QjncW0CNFKS3LprCDmxGtZ6ZPBxBx1fyf
   HaglkeVG8hDLKwZLog+Z4IdoqQdZK/BUt2CPtdSXGiMIALg2Dne0o3vwy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7951501"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7951501"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 05:06:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="928987313"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="928987313"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 05:06:22 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1BD9E11FAD4;
	Mon, 22 Jan 2024 15:06:20 +0200 (EET)
Date: Mon, 22 Jan 2024 13:06:20 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Chen, Jason Z" <jason.z.chen@intel.com>
Cc: linux-media@vger.kernel.org, andy.yeh@intel.com,
	kieran.bingham@ideasonboard.com, qingwu.zhang@intel.com,
	bingbu.cao@linux.intel.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2] media: ov08x40: Add Signal Integration Adjustments
 for specific project
Message-ID: <Za5oTILGp-3sYVdq@kekkonen.localdomain>
References: <20240122030220.3009357-1-jason.z.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122030220.3009357-1-jason.z.chen@intel.com>

Hi Jason,

On Mon, Jan 22, 2024 at 11:02:20AM +0800, Chen, Jason Z wrote:
> From: Jason Chen <jason.z.chen@intel.com>
> 
> Due to certain MIPI hardware designs using overly long cables, there
> is a loss of signal strength, resulting in failed signal integration.
> The patch includes changes to adjust the driving strength in the register
> settings for a specific project.
> 
> Signed-off-by: Jason Chen <jason.z.chen@intel.com>
> ---
>  drivers/media/i2c/ov08x40.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index 520ccd4aecf..ddcb4b6848b 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -160,6 +160,18 @@ static const struct ov08x40_reg mipi_data_rate_800mbps[] = {
>  	{0x6002, 0x2e},
>  };
>  
> +static const struct ov08x40_reg mipi_si_changed_regs[] = {
> +	{0x481b, 0x2c}, /* HS Exit: Data Tx TEOT - reducing 8ns */
> +	{0x4826, 0x42}, /* HS Entry: Data Tx TREOT - raising 8ns */
> +	{0x4829, 0x54}, /* HS Exit: Data Tx TREOT - reducing 8ns */
> +	{0x4885, 0x1f}, /* driving strength change */

We need a better say to control these: if you need to change this to make
it work on one board, another board may well need different settings.

Probably the easiest way would be to figure out canonical, hardware
independent configuration parameters and define them in DT bindings
(Documentation/devicetree/bindings/media/video-interfaces.yaml), and add
support for those in this driver.

DMI as such could be how you figure out which settings you need, but it
should not be the task of a the sensor driver to do that.

Cc Laurent.

> +};
> +
> +struct ov08x40_reg_list si_regs = {
> +	.regs = mipi_si_changed_regs,
> +	.num_of_regs = ARRAY_SIZE(mipi_si_changed_regs),
> +};
> +
>  static const struct ov08x40_reg mode_3856x2416_regs[] = {
>  	{0x5000, 0x5d},
>  	{0x5001, 0x20},
> @@ -2913,6 +2925,9 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
>  		return ret;
>  	}
>  
> +	/* Apply SI change to current project */
> +	ov08x40_write_reg_list(ov08x, &si_regs);
> +
>  	/* Apply default values of current mode */
>  	reg_list = &ov08x->cur_mode->reg_list;
>  	ret = ov08x40_write_reg_list(ov08x, reg_list);

-- 
Regards,

Sakari Ailus

