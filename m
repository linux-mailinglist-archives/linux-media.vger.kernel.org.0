Return-Path: <linux-media+bounces-11440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434A8C5803
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 16:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EACFA1F22828
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 14:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0470617BB37;
	Tue, 14 May 2024 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nu3q4M+7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECDE144D01;
	Tue, 14 May 2024 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715697218; cv=none; b=jlpZu+EiwdYZyWisAXSC351dkZ4N6013sMWDqIhhmSfHzMXORiU/V6sFtNV5N5uAhc9bRsvxWxyGdy0D4xpiPUHozgXfm2DDVBcufrhXRrgO04p5PCSsHGvd0q8dT7/LbaK3EhYJP6DPFtoZRu2FBPelTQdvwOICtselsDdpUI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715697218; c=relaxed/simple;
	bh=G4GQTtK/kUGLDea0szwRHFugqKscqEYNp4sHqguTr1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJmTUZ0TaelKoGmgtOb0nOY2ecT885+Jk0u+6zlcmzhm0y3R4W4bE1WID81JZWv9h1wwt+i8TqIwWuqFjhKshXR2AhERhRkHXjSmjb9tq+Fd8swG/lFgBguLVdD5EYn8E/7WHWH/GM9agT9OrEKsr7EH/0G7nAY7oKpyZHA8n0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nu3q4M+7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715697217; x=1747233217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G4GQTtK/kUGLDea0szwRHFugqKscqEYNp4sHqguTr1c=;
  b=Nu3q4M+7XPwBd5xfNClBV+r4aCLdSVz8BEjVU5XWagOPjqiDzFGDSYTw
   kKOCH2u9QuCkMlib+qbgxp9v75oSFOPqIFNkO3oXbYkKz4RL3zaM7HBTi
   Sr7gFDU5irnv0Q9PqnPTmPhkkkREsmQL+KwBAkBUC5kKI5iQt6nOPrLfX
   QZ8pfREOurEHKznrmXQzFnvZf2At2cb6SxSI13kjUZIInYgUb+S+46Wx5
   pn7wB3YeRuHD2mWt9uU2lNsvdPrJs0BENDguHixVGt+blCPVNnCK3OQLV
   25yebOpuraZpBZfy7dlOg0j8tI1QPQrqWR/5P/vsjrhA1sYeT6SRAVMtO
   A==;
X-CSE-ConnectionGUID: G+e0SnHAQgqHXxjAlqkcVQ==
X-CSE-MsgGUID: JD/xDz/mTQeXV6ezRsTiOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11515953"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11515953"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 07:33:36 -0700
X-CSE-ConnectionGUID: x2PAaXdbQRaRz856ZA6TaQ==
X-CSE-MsgGUID: nTnKlSLXR3ieGdLNhsNb3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="68163301"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 07:33:34 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 628DD11F9DB;
	Tue, 14 May 2024 17:33:31 +0300 (EEST)
Date: Tue, 14 May 2024 14:33:31 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] media: ipu-bridge: fix error code in ipu_bridge_init()
Message-ID: <ZkN2Ow6hASmKvHlz@kekkonen.localdomain>
References: <f468c4ac-0629-41b5-b5d1-e26f70e44800@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f468c4ac-0629-41b5-b5d1-e26f70e44800@moroto.mountain>

Hi Dan,

On Fri, May 10, 2024 at 06:43:31PM +0300, Dan Carpenter wrote:
> Return -EINVAL if "bridge->n_sensors == 0".  Don't return success.
> 
> Fixes: 881ca25978c6 ("media: ipu3-cio2: rename cio2 bridge to ipu bridge and move out of ipu3")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: style change
> 
>  drivers/media/pci/intel/ipu-bridge.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 61750cc98d70..44a9d9c15b05 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -839,9 +839,14 @@ int ipu_bridge_init(struct device *dev,
>  		bridge->data_lanes[i] = i + 1;
>  
>  	ret = ipu_bridge_connect_sensors(bridge);
> -	if (ret || bridge->n_sensors == 0)
> +	if (ret)
>  		goto err_unregister_ipu;
>  
> +	if (bridge->n_sensors == 0) {
> +		ret = -EINVAL;
> +		goto err_unregister_ipu;
> +	}

This would return an error if there are no sensors.

Neither IPU3-CIO2 or IPU6 ISYS drivers should be of any functional use
without sensors. But the power states of the devices could be affected by
this: the drivers should power off these devices but without drivers they
maybe left powered on. I haven't made any measurements though.

> +
>  	dev_info(dev, "Connected %d cameras\n", bridge->n_sensors);
>  
>  	fwnode = software_node_fwnode(&bridge->ipu_hid_node);

-- 
Kind regards,

Sakari Ailus

