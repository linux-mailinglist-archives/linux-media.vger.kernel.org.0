Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1823130EA
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 12:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhBHLbp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 06:31:45 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:56617 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233144AbhBHL34 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 06:29:56 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 94iqljGiiW4yN94itllPI0; Mon, 08 Feb 2021 12:28:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612783736; bh=zd9wYXHEAwVYwA23Mr8FHbynTde1pKgyga30K7eK00c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=m1tqJYOxOv1zwE8X4TmyOMVjMD6aNHe18kXe7J+uLpOly5XaqvlHfKYpGlRFELmDp
         j50ODjKzsLEFB1ABg+Cw5ImLAbu2plLQOpPB77RBgRlqxfH58DQrWDmY3Hov1Z/yWX
         6xWendoAx7tvjc02WbFFfgdu1Ei5ztINU+9gKcoSbavQQqGeVH94ai3mKNcvxr4/dE
         5cydlxI7jrJhvq6fQSqa4arEKIEcZ+46ArSPRbw+3pQHAMQb1wTb6XsHgAwavA8oef
         kHICzI/+3zs/MpP4qHIfLOSxpbJrIJHBOLmWkD6s98LySfILsS1p7ot7aPKZSewOtG
         hgwwzpDHsoWnw==
Subject: Re: [PATCH v8 1/5] media: i2c: Add driver for RDACM21 camera module
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
 <20210114170429.139762-2-jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c5fc0815-7754-1fac-af0a-ccbca922e479@xs4all.nl>
Date:   Mon, 8 Feb 2021 12:28:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114170429.139762-2-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMqcCgCMUCNV6262g2AjbkqI0iQVyITrTLPltVvwExF2be8G6+6JDexWF44k2+lPncUfsjoE1TU+oymrn6RIYwjB5nV7x9b0ieqvfJMRBxDvkeWFyy1E
 F3qEauEAZyIjrqPQKT3CuZEKx45N1f0dP7z2PU7raWjxn+VsPXGkgKniNJud3i3ezgnO57tHasUit1JJWvJRLd3bLydO1gdSJususoFBz1qr3aXXomdXwW7P
 MIk98s1ycDAiz0KdnwO9cHPuOlWWbkWFwdYZcoqEN2o9fmdB9if1Y+T8BkMaFzHRSM5IrvahcbOyoB2DzHnbbFGL6JqCps1o6pypDWoBjnVlwTNzjY4v5/oB
 FqSRdDyABusZghb5zHyPfnUW3ayFFNDNj0coVRYaP4omC9UEIp+8WB7HG6In/Ji2N4d3XmACaNJIa6QO+IILw0m8uUF4DvJTyzSZnPcjB4NZQndf4Q5amfZW
 zOw4Sp/cal0EYzDrZ9hVb2zXVj4IV8nG/a5Im565rr/al48MlVW6aQToLW3A6W/tbxlNP/TkeH/TmeFVwOITyFSr1ip2QTtO3yldP5EfT5f84AuTpnhOJD8C
 kZBer5d0rUhwRr+YYRKxW+fx+D72tgqsv1HCoAL1BFGhPL6xkQrI42c9LThenJzJzFPwTPYRJGGDOENBmRczxfuW4RdbOtOe5oABmsSmZ6EhHA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 14/01/2021 18:04, Jacopo Mondi wrote:
> The RDACM21 is a GMSL camera supporting 1280x1080 resolution images
> developed by IMI based on an Omnivision OV10640 sensor, an Omnivision
> OV490 ISP and a Maxim MAX9271 GMSL serializer.
> 
> The driver uses the max9271 library module, to maximize code reuse with
> other camera module drivers using the same serializer, such as rdacm20.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  MAINTAINERS                 |  12 +
>  drivers/media/i2c/Kconfig   |  13 +
>  drivers/media/i2c/Makefile  |   2 +
>  drivers/media/i2c/rdacm21.c | 623 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 650 insertions(+)
>  create mode 100644 drivers/media/i2c/rdacm21.c
> 

<snip>

> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> new file mode 100644
> index 000000000000..dcc21515e5a4
> --- /dev/null
> +++ b/drivers/media/i2c/rdacm21.c

<snip>

> +static int ov10640_initialize(struct rdacm21_device *dev)
> +{
> +	u8 val;
> +
> +	/* Power-up OV10640 by setting RESETB and PWDNB pins high. */
> +	ov490_write_reg(dev, OV490_GPIO_SEL0, OV490_GPIO0);
> +	ov490_write_reg(dev, OV490_GPIO_SEL1, OV490_SPWDN0);
> +	ov490_write_reg(dev, OV490_GPIO_DIRECTION0, OV490_GPIO0);
> +	ov490_write_reg(dev, OV490_GPIO_DIRECTION1, OV490_SPWDN0);
> +	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
> +	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_SPWDN0);
> +	usleep_range(3000, 5000);
> +
> +	/* Read OV10640 ID to test communications. */
> +	ov490_write_reg(dev, OV490_SCCB_SLAVE0_DIR, OV490_SCCB_SLAVE_READ);
> +	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_HIGH, OV10640_CHIP_ID >> 8);
> +	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, (u8)OV10640_CHIP_ID);

This line results in a sparse warning:

drivers/media/i2c/rdacm21.c:348:62: warning: cast truncates bits from constant value (300a becomes a)

Just replace with OV10640_CHIP_ID & 0xff.

Regards,

	Hans
