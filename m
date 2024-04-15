Return-Path: <linux-media+bounces-9342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3B88A4DA0
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 13:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B2EB1C2237D
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08B65EE67;
	Mon, 15 Apr 2024 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpzXSdKc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DCA5BAE4
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713180326; cv=none; b=usBYBTimPrjW0gli8T1T9jBhSF9REYBBiQJ628y1zH7kN9LHzhJkBaX07cQ+PpyubfsS1W2jGlsDKY2XWbWlBxOa1msYcF8wqZH9pURW869+fE4wpuAzSwwwpSr7SFnUjGJa+USzaTZt5YZ9zKrO4QGCoLqaWD5MnUrJ/pXJUFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713180326; c=relaxed/simple;
	bh=GINbDFfABbYrcR5SgndS/oPBMnStLDpLpsubnLd85+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOexk6IuxJjWGZRFM5Iqs8zOx1lCKMjNAAPajKCm58G0+kCqhKMrLITWNrsgGK7DJ63bUKuX4H7e40UZCiXDnIqF/FKOHr50aKC/hER06ADP8gWdPCCOp8626DxBNkmt7E7v4/jrHymhNDl/tbSnMf4IY/Ns098PqVrRAA3qna0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpzXSdKc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713180325; x=1744716325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GINbDFfABbYrcR5SgndS/oPBMnStLDpLpsubnLd85+0=;
  b=YpzXSdKcruHfrdF4nbqo0XCP7ZEADvzJoWMvsT2tP9nS3Y6jayayLtNW
   3ILNmDoJE1kJkbPdUv05JEiPCrA5h5fGxF8ZTreJLKfVUfTIJg+3H2C6Q
   Z2k4+VJuePEO2spR8ktbQBGh7kocTM1Tjq/QtA5SIUzFHnipQcPbV5nrT
   mTGhAZUN3/8GHrwNhMBUxjoR5CZJ1K8J64iXLuQQN4jtmqt5D2GKP8B04
   DzGXr/gWUJjX/mYT7v8zhBF4Zkq3xSbPU8d7RblihUUoD2Yiy8Ik6NKdY
   ++K36d9iPc22g+gA7g/Tpem1OaYQt59cWmw63tPfijjWkfNEkQBxmYbr2
   g==;
X-CSE-ConnectionGUID: GXZJBDDoTOuUtbTc5Y8PAw==
X-CSE-MsgGUID: QOFeGk02RH6dsnmw524LKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8687356"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8687356"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 04:25:24 -0700
X-CSE-ConnectionGUID: dPBMgw43QEKSn7EFWirUQg==
X-CSE-MsgGUID: AWKCdU2JRBmzynbQqwuYTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26303384"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 04:25:23 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D5B4911F8AF;
	Mon, 15 Apr 2024 14:25:19 +0300 (EEST)
Date: Mon, 15 Apr 2024 11:25:19 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH resend 1/4] media: hi556: Return -EPROBE_DEFER if no
 endpoint is found
Message-ID: <Zh0Ony3cgMLQ3fCV@kekkonen.localdomain>
References: <20240415094133.210580-1-hdegoede@redhat.com>
 <20240415094133.210580-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415094133.210580-2-hdegoede@redhat.com>

Hi Hans,

On Mon, Apr 15, 2024 at 11:41:30AM +0200, Hans de Goede wrote:
> With ipu bridge, endpoints may only be created when ipu bridge has
> initialised. This may happen after the sensor driver has first probed.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/hi556.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
> index 38c77d515786..96bae9914d52 100644
> --- a/drivers/media/i2c/hi556.c
> +++ b/drivers/media/i2c/hi556.c
> @@ -1206,8 +1206,13 @@ static int hi556_check_hwcfg(struct device *dev)
>  	int ret = 0;
>  	unsigned int i, j;
>  
> -	if (!fwnode)
> -		return -ENXIO;
> +	/*
> +	 * Sometimes the fwnode graph is initialized by the bridge driver,
> +	 * wait for this.
> +	 */
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return -EPROBE_DEFER;
>  
>  	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
>  	if (ret) {

The endpoint needs to be put here. It might be more practical to parse the
endpoint right away so the error handling becomes easier.

> @@ -1220,10 +1225,6 @@ static int hi556_check_hwcfg(struct device *dev)
>  		return -EINVAL;
>  	}
>  
> -	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> -	if (!ep)
> -		return -ENXIO;
> -
>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>  	fwnode_handle_put(ep);
>  	if (ret)

-- 
Kind regards,

Sakari Ailus

