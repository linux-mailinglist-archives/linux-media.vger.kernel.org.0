Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166582F52DC
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 19:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbhAMS5A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 13:57:00 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:53297 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728694AbhAMS5A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 13:57:00 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4278FFF80E;
        Wed, 13 Jan 2021 18:56:15 +0000 (UTC)
Date:   Wed, 13 Jan 2021 19:56:33 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: i2c: rdacm20: Verify MAX9271 startup
Message-ID: <20210113185633.yrrs5evt5emsddce@uno.localdomain>
References: <20210112114702.26959-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112114702.26959-1-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   please temporary ignore this patch, as I've applied the same on
the twin RDACM21 driver and it doesn't actually help recovering
failures.

Sorry for the noise

On Tue, Jan 12, 2021 at 12:47:02PM +0100, Jacopo Mondi wrote:
> During the RDACM20 probe sequence the connected deserializer chip
> has to uses its I2C auto-acknowledgment feature as the reverse
> channel where I2C messages are transmitted on is not yet available.
>
> This makes it impossible to detect failures when communicating with
> the remote cameras, as all messages are acknowledged automatically.
>
> Reading the serializer chip id and verify it is correct is thus the
> only reliable way to make sure it has correctly started-up.
>
> The current implementation tries to read the chip id once, and bails
> out if it not correct, but does not give the serializer any time to
> exit from low power after the 'ping to wake-up' first transaction.
>
> Make the startup process more robust by:
> 1) Add a 5 milliseconds delay after the wake up message before
>    starting the configuration procedure as suggested by the chip
>    manual
> 2) Read the chip-id to make sure it has properly booted
> 3) Wrap the procedure in a for-loop and attempt configuration up
>    to 10 times
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 53 ++++++++++++++++++++++++-------------
>  1 file changed, 34 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 16bcb764b0e0..de4cb635eabe 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -29,6 +29,8 @@
>
>  #include "max9271.h"
>
> +#define MAX9271_RESET_CYCLES		10
> +
>  #define OV10635_I2C_ADDRESS		0x30
>
>  #define OV10635_SOFTWARE_RESET		0x0103
> @@ -453,35 +455,48 @@ static struct v4l2_subdev_ops rdacm20_subdev_ops = {
>  static int rdacm20_initialize(struct rdacm20_device *dev)
>  {
>  	unsigned int retry = 3;
> +	unsigned int i;
>  	int ret;
>
>  	/* Verify communication with the MAX9271: ping to wakeup. */
>  	dev->serializer->client->addr = MAX9271_DEFAULT_ADDR;
>  	i2c_smbus_read_byte(dev->serializer->client);
>
> -	/* Serial link disabled during config as it needs a valid pixel clock. */
> -	ret = max9271_set_serial_link(dev->serializer, false);
> -	if (ret)
> -		return ret;
> +	/* Configure MAX9271 and make sure we can read its ID. */
> +	for (i = 0; i < MAX9271_RESET_CYCLES; ++i) {
> +		usleep_range(5000, 8000);
>
> -	/*
> -	 *  Ensure that we have a good link configuration before attempting to
> -	 *  identify the device.
> -	 */
> -	max9271_configure_i2c(dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
> -					       MAX9271_I2CSLVTO_1024US |
> -					       MAX9271_I2CMSTBT_105KBPS);
> +		/* Serial link disabled: it needs a valid pixel clock. */
> +		ret = max9271_set_serial_link(dev->serializer, false);
> +		if (ret)
> +			return ret;
>
> -	max9271_configure_gmsl_link(dev->serializer);
> +		/*
> +		 *  Ensure that we have a good link configuration before
> +		 *  attempting to identify the device.
> +		 */
> +		max9271_configure_i2c(dev->serializer,
> +				      MAX9271_I2CSLVSH_469NS_234NS |
> +				      MAX9271_I2CSLVTO_1024US |
> +				      MAX9271_I2CMSTBT_105KBPS);
> +
> +		ret = max9271_configure_gmsl_link(dev->serializer);
> +		if (ret)
> +			return ret;
>
> -	ret = max9271_verify_id(dev->serializer);
> -	if (ret < 0)
> -		return ret;
> +		ret = max9271_set_address(dev->serializer, dev->addrs[0]);
> +		if (ret < 0)
> +			return ret;
> +		dev->serializer->client->addr = dev->addrs[0];
>
> -	ret = max9271_set_address(dev->serializer, dev->addrs[0]);
> -	if (ret < 0)
> -		return ret;
> -	dev->serializer->client->addr = dev->addrs[0];
> +		ret = max9271_verify_id(dev->serializer);
> +		if (ret == 0)
> +			break;
> +	}
> +	if (i == MAX9271_RESET_CYCLES) {
> +		dev_err(dev->dev, "Failed to configure max9271");
> +		return -ENODEV;
> +	}
>
>  	/*
>  	 * Reset the sensor by cycling the OV10635 reset signal connected to the
> --
> 2.29.2
>
