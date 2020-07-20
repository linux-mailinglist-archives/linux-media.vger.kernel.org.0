Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C774D225A8D
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 10:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgGTIzs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 04:55:48 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:51003 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727848AbgGTIzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 04:55:47 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xRaJjXNCkNPeYxRaKjmYKy; Mon, 20 Jul 2020 10:55:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595235344; bh=rQXiKG+sAtTXbkJoG88THh5RY+X8dAbEz/VmH6xR+EQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YX2sJASSlpR4Y1kYOkYrNEhVb4n9Q69EyQiFxlp/a8Tf5WUBHYqI+Hwg9aL8r3jSe
         RWou0fTecDr8c8ttNTnU3o+wKR1UkCpXEiTQDVskFDRCtnF67cSL6mVeEh8VexOpWl
         1lokKk+ShHIq40vyVb4Hw2jEIaRZs9LZabL4459lwzj9M8Pj+lvoSwzB1QRyfwDFM6
         DlEARJ1dO553tkxRV44Dy4QEHFpxdWxWHUYZL9zH6RToEDv4gKcFxVZEQSqKSbA5H+
         fDqIALsSVI1rdvTUwEDgQdZ6lcNaS4+qoMki2IMJJgeproQfSqUwrVRLlABQKKOjxQ
         UQV6Dun4eu52A==
Subject: Re: [PATCH v8 04/10] media: pxa_camera: Use the new set_mbus_config
 op
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200717145324.292820-1-jacopo+renesas@jmondi.org>
 <20200717145324.292820-5-jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <aee934c4-c5d4-ba7f-8989-dfb57c8eda2a@xs4all.nl>
Date:   Mon, 20 Jul 2020 10:55:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717145324.292820-5-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGrKNARgacYCNSmnn2s+LoPq9/YLKNKCuZHMAZ/qNDZQSMFW2tkBM1oLd8T6he0FMpGjfR9WO0qPBQzx7zfcJaIkSd/ab0sl76GATJd4BYlkkontEzz2
 hOSeui8TSALmNzSyWoFFgWksCrpt3XwMQxhiW4jntU9kXcR55CAGnjxa/mrUj/EfB1VDMn8EPbLcvJnfFM4RjY/KdYB+s5plUEiwKLsFKksp7l+NIrBwU+el
 3Yw4eBDU0tANi6gxFSoHm3r54yepHcBVNivlmsmO7oz9vhtcAIgf4MZ+0p/ENFtof8kj3mcb3em2MNeDyHGfp/oatMb0zsHHymNcezrRyacP8fBpKF70liqm
 mfAZRas/gKTCCQIoJIGNUdMk0a+n/wFHPfPNouNTHBDZT/s/aatn7OWJ9tWEri40mht3MwOmrGE+Fhwf7uDqnsWJYcbD8zL2FWT90W9acwXMZc5gWJ2LVq2w
 lT3oStj1I7n2hYSAN4IvBvuwy+cIEdy+5SCA9EQ1nDqtpwoGk1fa2K2SbRgokM+dtdI5IKLKK4jUEyV+14gzXdSlKUrNGA8Lr6X8frs8Ry76/tPamKWah8qf
 Lg9VIpql7Ys0kHCPVhrYdXYhcHOSgqUQfaJFTCt0TkyY/25VG5t96kYTGT7FUZ2+1AYa2NQ0zZszi2JrLn09bwsJ1sg/DbMZzIJIua77Ag+xXOiXzfWkAs+B
 0Xbvd74XOxozPnbX+I22DWaFCYPmeUM2
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/07/2020 16:53, Jacopo Mondi wrote:
> Move the PXA camera driver to use the new set_mbus_config pad operation.
> For this platform the change is not only cosmetic, as the pxa driver is
> currently the only driver in mainline to make use of the g_mbus_config
> and s_mbus_config video operations.
> 
> The existing driver semantic is the following:
> - Collect all supported mbus config flags from the remote end
> - Match them with the supported PXA mbus configuration flags
> - If the remote subdevice allows multiple options for for VSYNC, HSYNC
>   and PCLK polarity, use platform data requested settings
> 
> The semantic of the new get_mbus_config and set_mbus_config differs from
> the corresponding video ops, particularly in the fact get_mbus_config
> reports the current mbus configuration and not the set of supported
> configuration options, with set_mbus_config always reporting the actual
> mbus configuration applied to the remote subdevice.
> 
> Adapt the driver to perform the following
> - Set the remote subdevice mbus configuration according to the PXA
>   platform data preferences.
> - If the applied configuration differs from the requested one (i.e. the
>   remote subdevice does not allow changing one setting) make sure that
>   - The remote end does not claim for DATA_ACTIVE_LOW, which seems not
>     supported by the platform
>   - The bus mastering roles match
> 
> While at there remove a few checks performed on the media bus
> configuration at get_format() time as they do not belong there.

General pxa_camera question: set_mbus_config is still called when the
pxa_camera driver is using the device tree data instead of platform data.
Is that necessary? Can't it fully rely on the DT information?

I would like to limit the use of set_mbus_config to signal all these low
level bits to the absolute minimum and today it is only two pxa board files
that use the platform data and thus need set_mbus_config.

As I said elsewhere, the only reason for set_mbus_config is really to set
lanes/channels, anything else should really be fixed since that comes from
the DT.

Note: this is just for discussion, any possible changes can be done later
once the current series is merged.

Regards,

	Hans

> 
> Compile-tested only.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/platform/pxa_camera.c | 189 ++++++++--------------------
>  1 file changed, 51 insertions(+), 138 deletions(-)
> 
> diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
> index 6dce33f35041..0366c4a813ce 100644
> --- a/drivers/media/platform/pxa_camera.c
> +++ b/drivers/media/platform/pxa_camera.c
> @@ -605,42 +605,6 @@ static const struct pxa_mbus_pixelfmt *pxa_mbus_get_fmtdesc(
>  	return pxa_mbus_find_fmtdesc(code, mbus_fmt, ARRAY_SIZE(mbus_fmt));
>  }
>  
> -static unsigned int pxa_mbus_config_compatible(const struct v4l2_mbus_config *cfg,
> -					unsigned int flags)
> -{
> -	unsigned long common_flags;
> -	bool hsync = true, vsync = true, pclk, data, mode;
> -	bool mipi_lanes, mipi_clock;
> -
> -	common_flags = cfg->flags & flags;
> -
> -	switch (cfg->type) {
> -	case V4L2_MBUS_PARALLEL:
> -		hsync = common_flags & (V4L2_MBUS_HSYNC_ACTIVE_HIGH |
> -					V4L2_MBUS_HSYNC_ACTIVE_LOW);
> -		vsync = common_flags & (V4L2_MBUS_VSYNC_ACTIVE_HIGH |
> -					V4L2_MBUS_VSYNC_ACTIVE_LOW);
> -		/* fall through */
> -	case V4L2_MBUS_BT656:
> -		pclk = common_flags & (V4L2_MBUS_PCLK_SAMPLE_RISING |
> -				       V4L2_MBUS_PCLK_SAMPLE_FALLING);
> -		data = common_flags & (V4L2_MBUS_DATA_ACTIVE_HIGH |
> -				       V4L2_MBUS_DATA_ACTIVE_LOW);
> -		mode = common_flags & (V4L2_MBUS_MASTER | V4L2_MBUS_SLAVE);
> -		return (!hsync || !vsync || !pclk || !data || !mode) ?
> -			0 : common_flags;
> -	case V4L2_MBUS_CSI2_DPHY:
> -		mipi_lanes = common_flags & V4L2_MBUS_CSI2_LANES;
> -		mipi_clock = common_flags & (V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK |
> -					     V4L2_MBUS_CSI2_CONTINUOUS_CLOCK);
> -		return (!mipi_lanes || !mipi_clock) ? 0 : common_flags;
> -	default:
> -		WARN_ON(1);
> -		return -EINVAL;
> -	}
> -	return 0;
> -}
> -
>  /**
>   * struct pxa_camera_format_xlate - match between host and sensor formats
>   * @code: code of a sensor provided format
> @@ -1231,31 +1195,6 @@ static irqreturn_t pxa_camera_irq(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static int test_platform_param(struct pxa_camera_dev *pcdev,
> -			       unsigned char buswidth, unsigned long *flags)
> -{
> -	/*
> -	 * Platform specified synchronization and pixel clock polarities are
> -	 * only a recommendation and are only used during probing. The PXA270
> -	 * quick capture interface supports both.
> -	 */
> -	*flags = (pcdev->platform_flags & PXA_CAMERA_MASTER ?
> -		  V4L2_MBUS_MASTER : V4L2_MBUS_SLAVE) |
> -		V4L2_MBUS_HSYNC_ACTIVE_HIGH |
> -		V4L2_MBUS_HSYNC_ACTIVE_LOW |
> -		V4L2_MBUS_VSYNC_ACTIVE_HIGH |
> -		V4L2_MBUS_VSYNC_ACTIVE_LOW |
> -		V4L2_MBUS_DATA_ACTIVE_HIGH |
> -		V4L2_MBUS_PCLK_SAMPLE_RISING |
> -		V4L2_MBUS_PCLK_SAMPLE_FALLING;
> -
> -	/* If requested data width is supported by the platform, use it */
> -	if ((1 << (buswidth - 1)) & pcdev->width_flags)
> -		return 0;
> -
> -	return -EINVAL;
> -}
> -
>  static void pxa_camera_setup_cicr(struct pxa_camera_dev *pcdev,
>  				  unsigned long flags, __u32 pixfmt)
>  {
> @@ -1598,99 +1537,78 @@ static int pxa_camera_init_videobuf2(struct pxa_camera_dev *pcdev)
>   */
>  static int pxa_camera_set_bus_param(struct pxa_camera_dev *pcdev)
>  {
> +	unsigned int bus_width = pcdev->current_fmt->host_fmt->bits_per_sample;
>  	struct v4l2_mbus_config cfg = {.type = V4L2_MBUS_PARALLEL,};
>  	u32 pixfmt = pcdev->current_fmt->host_fmt->fourcc;
> -	unsigned long bus_flags, common_flags;
> +	int mbus_config;
>  	int ret;
>  
> -	ret = test_platform_param(pcdev,
> -				  pcdev->current_fmt->host_fmt->bits_per_sample,
> -				  &bus_flags);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = sensor_call(pcdev, video, g_mbus_config, &cfg);
> -	if (!ret) {
> -		common_flags = pxa_mbus_config_compatible(&cfg,
> -							  bus_flags);
> -		if (!common_flags) {
> -			dev_warn(pcdev_to_dev(pcdev),
> -				 "Flags incompatible: camera 0x%x, host 0x%lx\n",
> -				 cfg.flags, bus_flags);
> -			return -EINVAL;
> -		}
> -	} else if (ret != -ENOIOCTLCMD) {
> -		return ret;
> -	} else {
> -		common_flags = bus_flags;
> +	if (!((1 << (bus_width - 1)) & pcdev->width_flags)) {
> +		dev_err(pcdev_to_dev(pcdev), "Unsupported bus width %u",
> +			bus_width);
> +		return -EINVAL;
>  	}
>  
>  	pcdev->channels = 1;
>  
>  	/* Make choices, based on platform preferences */
> -	if ((common_flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH) &&
> -	    (common_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)) {
> -		if (pcdev->platform_flags & PXA_CAMERA_HSP)
> -			common_flags &= ~V4L2_MBUS_HSYNC_ACTIVE_HIGH;
> -		else
> -			common_flags &= ~V4L2_MBUS_HSYNC_ACTIVE_LOW;
> -	}
> +	mbus_config = 0;
> +	if (pcdev->platform_flags & PXA_CAMERA_MASTER)
> +		mbus_config |= V4L2_MBUS_MASTER;
> +	else
> +		mbus_config |= V4L2_MBUS_SLAVE;
>  
> -	if ((common_flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH) &&
> -	    (common_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)) {
> -		if (pcdev->platform_flags & PXA_CAMERA_VSP)
> -			common_flags &= ~V4L2_MBUS_VSYNC_ACTIVE_HIGH;
> -		else
> -			common_flags &= ~V4L2_MBUS_VSYNC_ACTIVE_LOW;
> -	}
> +	if (pcdev->platform_flags & PXA_CAMERA_HSP)
> +		mbus_config |= V4L2_MBUS_HSYNC_ACTIVE_HIGH;
> +	else
> +		mbus_config |= V4L2_MBUS_HSYNC_ACTIVE_LOW;
>  
> -	if ((common_flags & V4L2_MBUS_PCLK_SAMPLE_RISING) &&
> -	    (common_flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)) {
> -		if (pcdev->platform_flags & PXA_CAMERA_PCP)
> -			common_flags &= ~V4L2_MBUS_PCLK_SAMPLE_RISING;
> -		else
> -			common_flags &= ~V4L2_MBUS_PCLK_SAMPLE_FALLING;
> -	}
> +	if (pcdev->platform_flags & PXA_CAMERA_VSP)
> +		mbus_config |= V4L2_MBUS_VSYNC_ACTIVE_HIGH;
> +	else
> +		mbus_config |= V4L2_MBUS_VSYNC_ACTIVE_LOW;
>  
> -	cfg.flags = common_flags;
> -	ret = sensor_call(pcdev, video, s_mbus_config, &cfg);
> +	if (pcdev->platform_flags & PXA_CAMERA_PCP)
> +		mbus_config |= V4L2_MBUS_PCLK_SAMPLE_RISING;
> +	else
> +		mbus_config |= V4L2_MBUS_PCLK_SAMPLE_FALLING;
> +	mbus_config |= V4L2_MBUS_DATA_ACTIVE_HIGH;
> +
> +	cfg.flags = mbus_config;
> +	ret = sensor_call(pcdev, pad, set_mbus_config, 0, &cfg);
>  	if (ret < 0 && ret != -ENOIOCTLCMD) {
> -		dev_dbg(pcdev_to_dev(pcdev),
> -			"camera s_mbus_config(0x%lx) returned %d\n",
> -			common_flags, ret);
> +		dev_err(pcdev_to_dev(pcdev),
> +			"Failed to call set_mbus_config: %d\n", ret);
>  		return ret;
>  	}
>  
> -	pxa_camera_setup_cicr(pcdev, common_flags, pixfmt);
> -
> -	return 0;
> -}
> -
> -static int pxa_camera_try_bus_param(struct pxa_camera_dev *pcdev,
> -				    unsigned char buswidth)
> -{
> -	struct v4l2_mbus_config cfg = {.type = V4L2_MBUS_PARALLEL,};
> -	unsigned long bus_flags, common_flags;
> -	int ret = test_platform_param(pcdev, buswidth, &bus_flags);
> -
> -	if (ret < 0)
> -		return ret;
> +	/*
> +	 * If the requested media bus configuration has not been fully applied
> +	 * make sure it is supported by the platform.
> +	 *
> +	 * PXA does not support V4L2_MBUS_DATA_ACTIVE_LOW and the bus mastering
> +	 * roles should match.
> +	 */
> +	if (cfg.flags != mbus_config) {
> +		unsigned int pxa_mbus_role = mbus_config & (V4L2_MBUS_MASTER |
> +							    V4L2_MBUS_SLAVE);
> +		if (pxa_mbus_role != (cfg.flags & (V4L2_MBUS_MASTER |
> +						   V4L2_MBUS_SLAVE))) {
> +			dev_err(pcdev_to_dev(pcdev),
> +				"Unsupported mbus configuration: bus mastering\n");
> +			return -EINVAL;
> +		}
>  
> -	ret = sensor_call(pcdev, video, g_mbus_config, &cfg);
> -	if (!ret) {
> -		common_flags = pxa_mbus_config_compatible(&cfg,
> -							  bus_flags);
> -		if (!common_flags) {
> -			dev_warn(pcdev_to_dev(pcdev),
> -				 "Flags incompatible: camera 0x%x, host 0x%lx\n",
> -				 cfg.flags, bus_flags);
> +		if (cfg.flags & V4L2_MBUS_DATA_ACTIVE_LOW) {
> +			dev_err(pcdev_to_dev(pcdev),
> +				"Unsupported mbus configuration: DATA_ACTIVE_LOW\n");
>  			return -EINVAL;
>  		}
> -	} else if (ret == -ENOIOCTLCMD) {
> -		ret = 0;
>  	}
>  
> -	return ret;
> +	pxa_camera_setup_cicr(pcdev, cfg.flags, pixfmt);
> +
> +	return 0;
>  }
>  
>  static const struct pxa_mbus_pixelfmt pxa_camera_formats[] = {
> @@ -1738,11 +1656,6 @@ static int pxa_camera_get_formats(struct v4l2_device *v4l2_dev,
>  		return 0;
>  	}
>  
> -	/* This also checks support for the requested bits-per-sample */
> -	ret = pxa_camera_try_bus_param(pcdev, fmt->bits_per_sample);
> -	if (ret < 0)
> -		return 0;
> -
>  	switch (code.code) {
>  	case MEDIA_BUS_FMT_UYVY8_2X8:
>  		formats++;
> 

