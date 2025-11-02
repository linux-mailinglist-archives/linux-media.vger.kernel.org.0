Return-Path: <linux-media+bounces-46135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 063DDC28D30
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 11:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 609651890428
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 10:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6322124EA81;
	Sun,  2 Nov 2025 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TID74gAb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966131B87C0;
	Sun,  2 Nov 2025 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762078847; cv=none; b=gibGU4UaxaJLgFfYWkFcUMRKGDyjWMM7v7q1Y8zNdinJRosW00/SACcku7nSZ0psULLUpzHEk8ARjb+153xA11Gqzv2wwWg+h3BQrP0eC3rmdWOKfI4lomhI328Q92MECG3cFnGxW+eZACCwZjLo85cJawy8+kQaerVP8zJ6eDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762078847; c=relaxed/simple;
	bh=+7r27NXXnEAHRJP1WOERJ4p0P/EaUvrkwyF+vMVZqh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IL3wITPr7uMSNMM5AlM8iUzrgdCRYkOl7EmWrxpNwmae/hJYL0qJcUE/sw1J4QS3soTxOSiJxFJ1143uoppa/Xg8uUhA0J0DKAfIxU3CZxWI987Jm4cdbdZSbikDqS24VNdR+xbGeEG9pfqsCrC98BBNVVMSjz7Mj9Vxp99UGgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TID74gAb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-232.net.vodafone.it [5.90.50.232])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5671EE1F;
	Sun,  2 Nov 2025 11:18:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762078729;
	bh=+7r27NXXnEAHRJP1WOERJ4p0P/EaUvrkwyF+vMVZqh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TID74gAbyzOmx34aDKDvaVByltxT71s8sp47T5Lsfb01MBLaVBXeBbhR+rfxL/twr
	 bgTTFI/c4cgBJ57XlxIHcLCOdJQk0rsjOwesVfnRWlfQMfPPZDLMAVYgclk89Uz/HC
	 cKPnx2ihUECi0DfojAwYRieQS7fFpC98DtvH9yCo=
Date: Sun, 2 Nov 2025 11:20:38 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: [PATCH 01/13] media: i2c: ov5647: Parse and register properties
Message-ID: <qoxea2nxh24cprpt7mcnuv5ksx6ylxvpno7tlwgsinxkeu35sq@xf3uyciyn3df>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
 <20251028-b4-rpi-ov5647-v1-1-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-b4-rpi-ov5647-v1-1-098413454f5e@ideasonboard.com>

Hi Jai

On Tue, Oct 28, 2025 at 12:57:12PM +0530, Jai Luthra wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Parse device properties and register controls for them using the V4L2
> fwnode properties helpers.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index e193fef4fcedf4661564c032cd7dbd80a9fd30a6..985a8e81529d2f88cb38ccb8c94f8605026a28a9 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1284,10 +1284,11 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
>  	.s_ctrl = ov5647_s_ctrl,
>  };
>
> -static int ov5647_init_controls(struct ov5647 *sensor)
> +static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>  	int hblank, exposure_max, exposure_def;
> +	struct v4l2_fwnode_device_properties props;

Since I have other comments, let me annoying and suggest moving this
up to maintain line length ordering in variables declaration.

>
>  	v4l2_ctrl_handler_init(&sensor->ctrls, 9);

Should we make this 11 ? With this change we can end up registering 2
additional controls.

>
> @@ -1338,6 +1339,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  				     ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
>  				     0, 0, ov5647_test_pattern_menu);
>
> +	v4l2_fwnode_device_parse(dev, &props);
> +
> +	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
> +					&props);
> +
>  	if (sensor->ctrls.error)
>  		goto handler_free;
>
> @@ -1420,7 +1426,7 @@ static int ov5647_probe(struct i2c_client *client)
>
>  	sensor->mode = OV5647_DEFAULT_MODE;
>
> -	ret = ov5647_init_controls(sensor);
> +	ret = ov5647_init_controls(sensor, dev);

You know, I think we have a bug that went unnoticed..

ov5647_init_controls() retrieves the i2c client with

	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);

but v4l2_set_subdevdata() is called by v4l2_i2c_subdev_init() which is
called after  ov5647_init_controls(). We don't hit a segfault because
client so far as only be used in the error path.

If you move init_controls() after v4l2_i2c_subdev_init() you can
access dev from the i2c_client instead of passing it to the function ?

Thanks
  j

>  	if (ret)
>  		goto mutex_destroy;
>
>
> --
> 2.51.0
>

