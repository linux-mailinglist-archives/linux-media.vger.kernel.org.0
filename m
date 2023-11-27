Return-Path: <linux-media+bounces-1093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859147F9F1B
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 12:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C3F6B210D7
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 11:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BB31B28D;
	Mon, 27 Nov 2023 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9R6DolR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4FCC1
	for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 03:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701086134; x=1732622134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VjIS94AVCJ8Aob2w7VO3/JDqOM0q/G7cZ+hgZbOoIzw=;
  b=Y9R6DolR1/3xNxgKxNGpLEJoM9+kk5Ciwr8x5Gzy2hN/6Aaydo/oJRt1
   iBvmDvmVkQHHB+OxQKUVcuziTluHBlg6z6kCsd0oyW0ifQ0CDwhOnbPsT
   rzO8ffKURXtZf59mMHPyUYaWnyu7esIl36soxfKIvKFHgp8meEuOPnUa3
   7kyngqLsOfLORly8vzBRlftJ9FcCZzp5PldCRdIV/PGN66mPfHFqPej/v
   3rP+9Sh610JsFoEX8V0bjQz4V2zfXbfb7Wnq+KGMIpga6O+TDIZA/9CEv
   49hxYRCnYOffrY1BBAbpu2rfNKbTrVsoQU6prpkuES3iJfhxHwKrl+O6B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391558189"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="391558189"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 03:55:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="802617699"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="802617699"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 03:55:31 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F34F712061E;
	Mon, 27 Nov 2023 13:55:28 +0200 (EET)
Date: Mon, 27 Nov 2023 11:55:28 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 3/9] media: ov2740: Move
 fwnode_graph_get_next_endpoint() call up
Message-ID: <ZWSDsDw1feUW-7zc@kekkonen.localdomain>
References: <20231126141517.7534-1-hdegoede@redhat.com>
 <20231126141517.7534-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126141517.7534-4-hdegoede@redhat.com>

Hi Hans,

On Sun, Nov 26, 2023 at 03:15:11PM +0100, Hans de Goede wrote:
> If the bridge has not yet setup the fwnode-graph then
> the fwnode_property_read_u32("clock-frequency") call will fail.
> 
> Move the fwnode_graph_get_next_endpoint() call to above reading
> the clock-frequency.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2740.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 0396e40419ca..832f24721dca 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -926,6 +926,14 @@ static int ov2740_check_hwcfg(struct device *dev)
>  	int ret;
>  	unsigned int i, j;
>  
> +	/*
> +	 * Sometimes the fwnode graph is initialized by the bridge driver,
> +	 * wait for this.
> +	 */
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return -EPROBE_DEFER;
> +

You'll need

	fwnode_handle_put(ep);

in error cases below, too.

>  	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
>  	if (ret)
>  		return ret;
> @@ -935,10 +943,6 @@ static int ov2740_check_hwcfg(struct device *dev)
>  				     "external clock %d is not supported\n",
>  				     mclk);
>  
> -	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> -	if (!ep)
> -		return -EPROBE_DEFER;
> -
>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>  	fwnode_handle_put(ep);
>  	if (ret)

-- 
Regards,

Sakari Ailus

