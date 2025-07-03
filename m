Return-Path: <linux-media+bounces-36700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B55EDAF7F75
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 19:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C5181BC44C8
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 17:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE912F2351;
	Thu,  3 Jul 2025 17:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BVwchpNE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D529928A3E2;
	Thu,  3 Jul 2025 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751565328; cv=none; b=K1s3GgAfVpk265k3Sv2ZTF/8wLgdvv0eSqH6aEyk8LnGMcNbM4SM4r1Uot2xQlbB7qZUikqKLir1aU3Pk+Db0fawU6jHg6KMPhbjSMCeB005zFUbqQLv9WPpm3BRM4Rsrp0skltKx46KIGS1+WXSHn+PadpUFDaeNmVXM4fRUEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751565328; c=relaxed/simple;
	bh=QiuZJ3I/GtAmaz/FLTvvj7hHo8sxM2iHx2AnCBzZHDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQg+/k1lSrnLXC0aZKGw4UKt8Fd3NWYKVk5Lo86OWLW6a9yYFLAnYOYGwNAQ3z6v5ed7BgZzCVGbbI2fiw/v/j0xNEh+jRm1dNIb8VIeYPcC1Awjm9xSgPxrYEhbUBZWbdKfLUZBXoLRK1xigDvR826ruyIAbNcCJPerkXQCBBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BVwchpNE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E16C96DE;
	Thu,  3 Jul 2025 19:55:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751565301;
	bh=QiuZJ3I/GtAmaz/FLTvvj7hHo8sxM2iHx2AnCBzZHDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVwchpNE5NR+l0GKVCna2ykLCbO2m9uFfkQ41bmc7mya6DXXSfTBU89JT8GKyvOE7
	 CDOz2x6F7qHLxq3XRK2w8XA1RcVW16cPeA433YWFM9WsLfrTviUZnA4JP5gx2BaoiI
	 /jdCau0KL3vldSznp9n8Oj4rrj9MZ+k6nglSAmFU=
Date: Thu, 3 Jul 2025 20:54:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Will Whang <will@willwhang.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:SONY IMX585 SENSOR DRIVER" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 3/4] media: i2c: imx585: Add Sony IMX585 image-sensor
 driver
Message-ID: <20250703175457.GB17709@pendragon.ideasonboard.com>
References: <20250702063836.3984-1-will@willwhang.com>
 <20250702063836.3984-4-will@willwhang.com>
 <20250703175121.GA17709@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703175121.GA17709@pendragon.ideasonboard.com>

A few other comments.

On Thu, Jul 03, 2025 at 08:51:23PM +0300, Laurent Pinchart wrote:
> Hi Will,
> 
> Thank you for the patch.
> 
> Here's a first review, focussing on API usage and coding style.
> 
> On Wed, Jul 02, 2025 at 07:38:35AM +0100, Will Whang wrote:
> > Implements support for:
> >   * 4-lane / 2-lane CSI-2
> >   * 12-bit linear, 12-bit HDR-GC and 16-bit Clear-HDR modes
> >   * Mono variant switch, HCG, custom HDR controls
> >   * Tested on Raspberry Pi 4/5 with 24 MHz XCLK.
> > 
> > Signed-off-by: Will Whang <will@willwhang.com>
> > ---
> >  drivers/media/i2c/Kconfig  |    9 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/imx585.c | 2466 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 2476 insertions(+)
> >  create mode 100644 drivers/media/i2c/imx585.c

[snip]

> > diff --git a/drivers/media/i2c/imx585.c b/drivers/media/i2c/imx585.c
> > new file mode 100644
> > index 000000000..2c4212290
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx585.c
> > @@ -0,0 +1,2466 @@

[snip]

> > +static int imx585_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct device_node  *np;
> > +	struct imx585 *imx585;
> > +	const struct of_device_id *match;
> > +	int ret, i;
> > +	u32 sync_mode;
> > +
> > +	imx585 = devm_kzalloc(&client->dev, sizeof(*imx585), GFP_KERNEL);
> > +	if (!imx585)
> > +		return -ENOMEM;
> > +
> > +	v4l2_i2c_subdev_init(&imx585->sd, client, &imx585_subdev_ops);
> > +
> > +	match = of_match_device(imx585_dt_ids, dev);
> > +	if (!match)
> > +		return -ENODEV;
> 
> This doesn't seem needed.
> 
> > +
> > +	dev_info(dev, "Reading dtoverlay config:\n");
> > +	imx585->mono = of_property_read_bool(dev->of_node, "mono-mode");

This is not defined in the DT bindings.

> Mono sensors should be detected based on the compatible string, not with
> a separate property.
> 
> > +	if (imx585->mono)
> > +		dev_info(dev, "Mono Mode Selected, make sure you have the correct sensor variant\n");
> > +
> > +	imx585->clear_HDR = of_property_read_bool(dev->of_node, "clearHDR-mode");

Neither is this.

> 
> This doesn't seem to belong to DT, as it's a runtime option.
> 
> > +	dev_info(dev, "ClearHDR: %d\n", imx585->clear_HDR);
> > +
> > +	imx585->sync_mode = 0;
> > +	ret = of_property_read_u32(dev->of_node, "sync-mode", &sync_mode);

In the DT binding, the sync-mode is currently specified in the endpoint,
not in the device node. I've recommended in my review of 1/4 to move it
to the device node, so this will become correct.

> > +	if (!ret) {
> > +		if (sync_mode > 2) {
> > +			dev_warn(dev, "sync-mode out of range, using 0\n");
> > +			sync_mode = 0;
> > +		}
> > +		imx585->sync_mode = sync_mode;
> > +	} else if (ret != -EINVAL) {          /* property present but bad */
> > +		dev_err(dev, "sync-mode malformed (%pe)\n", ERR_PTR(ret));
> > +		return ret;
> > +	}
> > +	dev_info(dev, "Sync Mode: %s\n", sync_mode_menu[imx585->sync_mode]);
> > +
> > +	/* Check the hardware configuration in device tree */
> > +	if (imx585_check_hwcfg(dev, imx585))
> > +		return -EINVAL;
> > +
> > +	/* Get system clock (xclk) */
> > +	imx585->xclk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(imx585->xclk)) {
> > +		dev_err(dev, "failed to get xclk\n");
> > +		return PTR_ERR(imx585->xclk);
> > +	}
> > +
> > +	imx585->xclk_freq = clk_get_rate(imx585->xclk);
> > +
> > +	for (i = 0; i < ARRAY_SIZE(imx585_inck_table); ++i) {
> > +		if (imx585_inck_table[i].xclk_hz == imx585->xclk_freq) {
> > +			imx585->inck_sel_val = imx585_inck_table[i].inck_sel;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (i == ARRAY_SIZE(imx585_inck_table)) {
> > +		dev_err(dev, "unsupported XCLK rate %u Hz\n",
> > +			imx585->xclk_freq);
> > +		return -EINVAL;
> > +	}
> > +
> > +	dev_info(dev, "XCLK %u Hz → INCK_SEL 0x%02x\n",
> > +		 imx585->xclk_freq, imx585->inck_sel_val);
> > +
> > +	ret = imx585_get_regulators(imx585);
> > +	if (ret) {
> > +		dev_err(dev, "failed to get regulators\n");
> > +		return ret;
> > +	}
> > +
> > +	/* Request optional enable pin */
> > +	imx585->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > +						     GPIOD_OUT_HIGH);
> > +
> > +	/*
> > +	 * The sensor must be powered for imx585_check_module_exists()
> > +	 * to be able to read register
> > +	 */
> > +	ret = imx585_power_on(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = imx585_check_module_exists(imx585);
> > +	if (ret)
> > +		goto error_power_off;
> > +
> > +	imx585->has_ircut     = false;
> > +	imx585->ircut_client  = NULL;
> > +
> > +	if (of_property_read_bool(dev->of_node, "ircut-mode")) {
> > +		np = of_parse_phandle(dev->of_node, "ircut-controller", 0);

Those properties are not defined in the binding either.

> > +		if (np) {
> > +			imx585->ircut_client = of_find_i2c_device_by_node(np);
> > +			of_node_put(np);
> > +			ret = imx585_ircut_write(imx585, 0x01);
> > +			if (!ret) {
> > +				imx585->has_ircut    = true;
> > +				dev_info(dev, "IR-cut controller present at 0x%02x\n",
> > +					 imx585->ircut_client->addr);
> > +			} else {
> > +				dev_info(dev,
> > +					 "Can't communication with IR-cut control, dropping\n");
> > +			}
> > +		}
> > +	} else {
> > +		dev_info(dev, "No IR-cut controller\n");
> > +	}
> > +
> > +	/* Initialize default format */
> > +	imx585_set_default_format(imx585);
> > +
> > +	/* Enable runtime PM and turn off the device */
> > +	pm_runtime_set_active(dev);
> > +	pm_runtime_enable(dev);
> > +	pm_runtime_idle(dev);
> 
> It would be best to use PM runtime autosuspend. See the imx296 driver
> for an example.
> 
> > +
> > +	/* This needs the pm runtime to be registered. */
> > +	ret = imx585_init_controls(imx585);
> > +	if (ret)
> > +		goto error_pm_runtime;
> > +
> > +	/* Initialize subdev */
> > +	imx585->sd.internal_ops = &imx585_internal_ops;
> > +	imx585->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +				V4L2_SUBDEV_FL_HAS_EVENTS;
> > +	imx585->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +	/* Initialize source pads */
> > +	imx585->pad[IMAGE_PAD].flags = MEDIA_PAD_FL_SOURCE;
> > +	imx585->pad[METADATA_PAD].flags = MEDIA_PAD_FL_SOURCE;
> > +
> > +	ret = media_entity_pads_init(&imx585->sd.entity, NUM_PADS, imx585->pad);
> > +	if (ret) {
> > +		dev_err(dev, "failed to init entity pads: %d\n", ret);
> > +		goto error_handler_free;
> > +	}
> > +
> > +	ret = v4l2_async_register_subdev_sensor(&imx585->sd);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
> > +		goto error_media_entity;
> > +	}
> > +
> > +	return 0;
> > +
> > +error_media_entity:
> > +	media_entity_cleanup(&imx585->sd.entity);
> > +
> > +error_handler_free:
> > +	imx585_free_controls(imx585);
> > +
> > +error_pm_runtime:
> > +	pm_runtime_disable(&client->dev);
> > +	pm_runtime_set_suspended(&client->dev);
> > +
> > +error_power_off:
> > +	imx585_power_off(&client->dev);
> > +
> > +	return ret;
> > +}

[snip]

-- 
Regards,

Laurent Pinchart

