Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18AF131313F
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 12:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbhBHLqW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 06:46:22 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:44791 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbhBHLn7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 06:43:59 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5331AC0005;
        Mon,  8 Feb 2021 11:42:38 +0000 (UTC)
Date:   Mon, 8 Feb 2021 12:43:02 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v8 1/5] media: i2c: Add driver for RDACM21 camera module
Message-ID: <20210208114302.yxane4iifalacjnr@uno.localdomain>
References: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
 <20210114170429.139762-2-jacopo+renesas@jmondi.org>
 <c5fc0815-7754-1fac-af0a-ccbca922e479@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c5fc0815-7754-1fac-af0a-ccbca922e479@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Feb 08, 2021 at 12:28:52PM +0100, Hans Verkuil wrote:
> Hi Jacopo,
>
> On 14/01/2021 18:04, Jacopo Mondi wrote:
> > The RDACM21 is a GMSL camera supporting 1280x1080 resolution images
> > developed by IMI based on an Omnivision OV10640 sensor, an Omnivision
> > OV490 ISP and a Maxim MAX9271 GMSL serializer.
> >
> > The driver uses the max9271 library module, to maximize code reuse with
> > other camera module drivers using the same serializer, such as rdacm20.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  MAINTAINERS                 |  12 +
> >  drivers/media/i2c/Kconfig   |  13 +
> >  drivers/media/i2c/Makefile  |   2 +
> >  drivers/media/i2c/rdacm21.c | 623 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 650 insertions(+)
> >  create mode 100644 drivers/media/i2c/rdacm21.c
> >
>
> <snip>
>
> > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > new file mode 100644
> > index 000000000000..dcc21515e5a4
> > --- /dev/null
> > +++ b/drivers/media/i2c/rdacm21.c
>
> <snip>
>
> > +static int ov10640_initialize(struct rdacm21_device *dev)
> > +{
> > +	u8 val;
> > +
> > +	/* Power-up OV10640 by setting RESETB and PWDNB pins high. */
> > +	ov490_write_reg(dev, OV490_GPIO_SEL0, OV490_GPIO0);
> > +	ov490_write_reg(dev, OV490_GPIO_SEL1, OV490_SPWDN0);
> > +	ov490_write_reg(dev, OV490_GPIO_DIRECTION0, OV490_GPIO0);
> > +	ov490_write_reg(dev, OV490_GPIO_DIRECTION1, OV490_SPWDN0);
> > +	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
> > +	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_SPWDN0);
> > +	usleep_range(3000, 5000);
> > +
> > +	/* Read OV10640 ID to test communications. */
> > +	ov490_write_reg(dev, OV490_SCCB_SLAVE0_DIR, OV490_SCCB_SLAVE_READ);
> > +	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_HIGH, OV10640_CHIP_ID >> 8);
> > +	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, (u8)OV10640_CHIP_ID);
>
> This line results in a sparse warning:
>
> drivers/media/i2c/rdacm21.c:348:62: warning: cast truncates bits from constant value (300a becomes a)

Which is intended :)

>
> Just replace with OV10640_CHIP_ID & 0xff.

Will send a patch on top as the series has been collected.

Thanks
  j

>
> Regards,
>
> 	Hans
