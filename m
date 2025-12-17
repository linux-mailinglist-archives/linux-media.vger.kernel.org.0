Return-Path: <linux-media+bounces-48968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E45E0CC691B
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 09:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A67F53017F14
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 08:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B598433B6F8;
	Wed, 17 Dec 2025 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6+Lj1Qo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1B73358A8;
	Wed, 17 Dec 2025 08:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960096; cv=none; b=pQqRo4oykNHn9Z3jyx6eG/kzKfgqua8Z6WXajTJ+xODHRItN1vZL+b5GfxF/MkfjrH7lFm0AkhjI4ZiPypinoBK1Ze5919Btpjl3fWD+Iujs7ElqfYkxC1wg7rh1DOPFapmP46sN/T1xsmUdEBZqpK382Q3td2m7xA5f7cSVsDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960096; c=relaxed/simple;
	bh=fx9CmOBeFgj+uw0E3wYop3BovBXiLIL9t1t+Sq10SSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfO04LPqrv/SKbhxLeQfYJHyFDBmy/tc5Xdi5FAS+al8PisVsY5uWQFcqOvHBn6NuUGuagp0xJIlKXMbu0befrqf1Zy6d0tiK4KqJ+ZM+cOnef5cDLOVYkIBS8hZnZCmaUkmoW6BxKsI89uISwNo1j5fpGTy4V3tp9jKhfGzenM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6+Lj1Qo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE97C4CEFB;
	Wed, 17 Dec 2025 08:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765960095;
	bh=fx9CmOBeFgj+uw0E3wYop3BovBXiLIL9t1t+Sq10SSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6+Lj1QoFdpewU7zwBuQ9tNtgAfbQ8C6lvJwmer13tvNvjPmoXEWeWI+HsvMBXoes
	 dv1L59cZpaFo3Q+LxwLiUwDLgKSMa29H04+nRwHmkomSVz6fiH5ps4LXyuyWMngIai
	 WJq/gejNjP7noow9xiQxD1R0OTTThXZ0DAWKVlbnuPq7DQUYzl3FWSd/gBV0yYnHTS
	 G2Z96q/ypMO2jJe+Vd3OF2qsratfVGcXkesdnwZzNpsbvdX3qW3wFaI3239P9Kznqv
	 ZNskH1vJoAssqG0syTZ3BnW/l+QfTOpSVOFV0bI3t9xfurNYsUdftaYwQubNzuAoET
	 EBYZ9GgjS0V3Q==
Date: Wed, 17 Dec 2025 09:28:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex Tran <alex.t.tran@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: i2c: et8ek8: et8ek8_driver: add support
 for crc configuration via device tree
Message-ID: <20251217-radiant-opal-spoonbill-1f7378@quoll>
References: <cover.1765782992.git.alex.t.tran@gmail.com>
 <fca7331649892206b92f1c63aedac6050a2d8d4a.1765782992.git.alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fca7331649892206b92f1c63aedac6050a2d8d4a.1765782992.git.alex.t.tran@gmail.com>

On Sun, Dec 14, 2025 at 11:58:32PM -0800, Alex Tran wrote:
> Retrieve the configuration for CRC from the device tree instead
> using the hard coded USE_CRC macro. If there is an issue
> retrieving the endpoint node or the CRC property then the default
> of 1 is used and the driver does not fail to maintain backward
> compatibility.
> 
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> ---
>  drivers/media/i2c/et8ek8/et8ek8_driver.c | 49 +++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
> index 2cb7b7187..4ef92359c 100644
> --- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
> +++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
> @@ -29,6 +29,7 @@
>  #include <media/media-entity.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>  
>  #include "et8ek8_reg.h"
> @@ -45,6 +46,7 @@ struct et8ek8_sensor {
>  	struct regulator *vana;
>  	struct clk *ext_clk;
>  	u32 xclk_freq;
> +	u32 use_crc;
>  
>  	u16 version;
>  
> @@ -130,8 +132,6 @@ static struct et8ek8_gain {
>  
>  #define ET8EK8_I2C_DELAY	3	/* msec delay b/w accesses */
>  
> -#define USE_CRC			1
> -
>  /*
>   * Register access helpers
>   *
> @@ -844,20 +844,16 @@ static int et8ek8_power_on(struct et8ek8_sensor *sensor)
>  	if (rval)
>  		goto out;
>  
> -#ifdef USE_CRC
>  	rval = et8ek8_i2c_read_reg(client, ET8EK8_REG_8BIT, 0x1263, &val);
>  	if (rval)
>  		goto out;
> -#if USE_CRC /* TODO get crc setting from DT */
> -	val |= BIT(4);
> -#else
> -	val &= ~BIT(4);
> -#endif
> +	if (sensor->use_crc)
> +		val |= BIT(4);
> +	else
> +		val &= ~BIT(4);
>  	rval = et8ek8_i2c_write_reg(client, ET8EK8_REG_8BIT, 0x1263, val);
>  	if (rval)
>  		goto out;
> -#endif
> -
>  out:
>  	if (rval)
>  		et8ek8_power_off(sensor);
> @@ -1396,6 +1392,34 @@ static int __maybe_unused et8ek8_resume(struct device *dev)
>  	return __et8ek8_set_power(sensor, true);
>  }
>  
> +static int et8ek8_parse_fwnode(struct device *dev, struct et8ek8_sensor *sensor)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CCP2,
> +	};
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep) {
> +		dev_warn(dev, "could not get endpoint node\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	if (ret) {
> +		dev_warn(dev, "parsing endpoint node failed\n");
> +		goto done;
> +	}
> +
> +	fwnode_property_read_u32(ep, "crc", &sensor->use_crc);

Undocumented ABI. In case you document it in other cases, it is really
unclear, so be sure you read submitting patches in DT.

Best regards,
Krzysztof


