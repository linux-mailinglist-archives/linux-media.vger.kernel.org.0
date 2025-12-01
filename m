Return-Path: <linux-media+bounces-47966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD31C97EDD
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 15:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19F003A3888
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 14:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DE331CA50;
	Mon,  1 Dec 2025 14:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S5MmoTGV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9CF2C0291;
	Mon,  1 Dec 2025 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764600931; cv=none; b=GqZ+j/cCd9ucUOQnWx6kPZmnIv5Q+ElbDNosbMy0udRrC0HRyhn4kbzTj5DpwDjNz1x3NZ8Qa7wfKew3I1Qq0DI4UY7fA5oQ2ie8zv2YhgBEMjakyteAimnsvQZR9/HmiHbPbSe7WKE4+0lgl8d/oohvHhGlEw9TAJkEW2pES9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764600931; c=relaxed/simple;
	bh=QqhShJ/JYaK+kOtgtdv0BOswhj0jK7HjNvv2/upeK04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9nPs4/7ay2IOdM89gcJsmDsQdB5DB98xkEIKyolVXzbcf9RwFes7sCj9zwWuJjKsSrGexwqTQ9/8HunEBfRlWwkTxP+JMZnzvEV31HN+GMx/+pOflda8cIkEIY4kMPhLqW8uIq5pvst+QQCP0nxfLSanXFQmCpLGHO6mw5jKJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S5MmoTGV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 135706AC;
	Mon,  1 Dec 2025 15:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764600792;
	bh=QqhShJ/JYaK+kOtgtdv0BOswhj0jK7HjNvv2/upeK04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5MmoTGVQukiQsUXgCyp7hlI+6nHqA9WOPa2sZpTCGddH9Gce3e8X59AQ+PL63HoG
	 bEf7KkuDvLy47MRLUMV7Or0GvtIutvRewDoQ6qwH7M8MuO6v1LwcOIz4jQrcYexIRg
	 K06iqCHUxKUKr65WPS3dDsM9VvlvtrMjQPz1rh5k=
Date: Mon, 1 Dec 2025 15:55:22 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Naushir Patuck <naush@raspberrypi.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Stefan Wahren <wahrenst@gmx.net>, "Ivan T. Ivanov" <iivanov@suse.de>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 08/16] media: i2c: ov5647: Parse and register
 properties
Message-ID: <646ej3sqxs7lhy57rle65bsiv2dycaxbu7rzrjemfn7aty3esf@rgbuo4fy74g4>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
 <20251118-b4-rpi-ov5647-v2-8-5e78e7cb7f9b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118-b4-rpi-ov5647-v2-8-5e78e7cb7f9b@ideasonboard.com>

Hi Jai

On Tue, Nov 18, 2025 at 05:33:01PM +0530, Jai Luthra wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Parse device properties and register controls for them using the V4L2
> fwnode properties helpers.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/i2c/ov5647.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index dbc134af06a26e0e31b12a6360d794afa8bad5dd..5009fd8c05a64d7e06f66f8f75f0a881cd0b95c1 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1320,9 +1320,11 @@ static int ov5647_configure_regulators(struct device *dev,
>  static int ov5647_init_controls(struct ov5647 *sensor)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
> +	struct v4l2_fwnode_device_properties props;
>  	int hblank, exposure_max, exposure_def;
> +	struct device *dev = &client->dev;
>
> -	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
> +	v4l2_ctrl_handler_init(&sensor->ctrls, 11);
>
>  	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>  			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> @@ -1371,6 +1373,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
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
>
> --
> 2.51.1
>

