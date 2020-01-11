Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47BA1137B67
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2020 05:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgAKEpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 23:45:38 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60270 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbgAKEpi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 23:45:38 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A5FEA283C55
Message-ID: <b1ce520494275ea2b9bd63af6ef12e9e8ac3c122.camel@collabora.com>
Subject: Re: [PATCH v3 0/2] Add IMX219 CMOS image sensor support
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>, mchehab@kernel.org,
        robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        peter.griffin@linaro.org, dave.stevenson@raspberrypi.com,
        sakari.ailus@linux.intel.com
Date:   Sat, 11 Jan 2020 01:45:27 -0300
In-Reply-To: <20200110200915.22575-1-andrey.konovalov@linaro.org>
References: <20200110200915.22575-1-andrey.konovalov@linaro.org>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Andrey,

Thanks for submitting a new version.

On Fri, 2020-01-10 at 23:09 +0300, Andrey Konovalov wrote:
> This patchset adds support for IMX219 CMOS image sensor from Sony.
> Sony IMX219 is an 8MPix, 1/4.0-inch CMOS active pixel digital image sensor
> with an active array size of 3280H x 2464V. It is programmable through
> I2C interface. Image data are sent through MIPI CSI-2, which can be configured
> as either 2 or 4 data lanes, but this driver currently only supports 2 lanes.
> The currently supported resolutions are 3280x2464 @ 15fps, 1920x1080 @ 30fps
> (cropped FOV), and 1640x1232 (2x2 binned) @ 30fps.
> 
> The driver has been tested with Raspberry Pi Camera Module v2 connected to
> Raspberry Pi Zero W.
> 
> Changes since v2 [1]:
> 
> dt-bindings:
>   - "clock-names" property removed
>   - "xclr-gpios" property renamed to "reset-gpios"
>   - the camera-clk mode moved out of sensor device node
>   - "clock-lanes" property removed (the sensor doesn't support lane reordering)
>   - "clock-noncontinuous" description made more clear (thanks Sakari)
>   - "data-lanes" property reworked: it is now optional, and if it is not
>     present the driver should assume four-lane operation. For two-lane
>     operation (the only mode supported by the current driver) this property
>     must be present and set to <1 2>
> 
> imx219 sensor driver:
>   - "xclr-gpios" property renamed to "reset-gpios", the corresponding
>     struct gpio_desc field in the imx219 structure is renamed to reset_gpio
>   - in the driver probe() a test to check that the number of CSI-2 data lanes
>     is supported by the driver was added
>   - devm_clk_get() is now called with NULL as the 2nd argument, as there is
>     just single clock, and there is no need to use clock ID
>   - error messages are added when the driver fails to get regulators, to init
>     media entity pads, or to register sensor sub-device
> 

It seems you missed Sakari's review comments on v2,
see https://patchwork.linuxtv.org/patch/60925/#114407

Thanks!
Eze



