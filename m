Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACEA935C316
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 12:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239357AbhDLJ5d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:57:33 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:44103 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241999AbhDLJxT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:53:19 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 8414E6000D;
        Mon, 12 Apr 2021 09:52:57 +0000 (UTC)
Date:   Mon, 12 Apr 2021 11:53:36 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/30] media: atmel: atmel-isc: specialize max width
 and max height
Message-ID: <20210412095336.vljygvokqq56kb6n@uno.localdomain>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
 <20210405155105.162529-5-eugen.hristev@microchip.com>
 <20210412094312.tsghnyhglxf3roiy@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412094312.tsghnyhglxf3roiy@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ups,

On Mon, Apr 12, 2021 at 11:43:12AM +0200, Jacopo Mondi wrote:
> Hi Eugene,
>
> On Mon, Apr 05, 2021 at 06:50:39PM +0300, Eugen Hristev wrote:
> > Move the max width and max height constants to the product specific driver
> > and have them in the device struct.
> >
> > Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> > ---
> >  drivers/media/platform/atmel/atmel-isc-base.c | 28 +++++++++----------
> >  drivers/media/platform/atmel/atmel-isc.h      |  9 ++++--
> >  .../media/platform/atmel/atmel-sama5d2-isc.c  |  7 +++--
> >  3 files changed, 25 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> > index 45fc8dbb7943..350076dd029a 100644
> > --- a/drivers/media/platform/atmel/atmel-isc-base.c
> > +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> > @@ -1204,8 +1204,8 @@ static void isc_try_fse(struct isc_device *isc,
> >  	 * just use the maximum ISC can receive.
> >  	 */
> >  	if (ret) {
> > -		pad_cfg->try_crop.width = ISC_MAX_SUPPORT_WIDTH;
> > -		pad_cfg->try_crop.height = ISC_MAX_SUPPORT_HEIGHT;
> > +		pad_cfg->try_crop.width = isc->max_width;
> > +		pad_cfg->try_crop.height = isc->max_height;
> >  	} else {
> >  		pad_cfg->try_crop.width = fse.max_width;
> >  		pad_cfg->try_crop.height = fse.max_height;
> > @@ -1282,10 +1282,10 @@ static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f,
> >  	isc->try_config.sd_format = sd_fmt;
> >
> >  	/* Limit to Atmel ISC hardware capabilities */
> > -	if (pixfmt->width > ISC_MAX_SUPPORT_WIDTH)
> > -		pixfmt->width = ISC_MAX_SUPPORT_WIDTH;
> > -	if (pixfmt->height > ISC_MAX_SUPPORT_HEIGHT)
> > -		pixfmt->height = ISC_MAX_SUPPORT_HEIGHT;
> > +	if (pixfmt->width > isc->max_width)
> > +		pixfmt->width = isc->max_width;
> > +	if (pixfmt->height > isc->max_height)
> > +		pixfmt->height = isc->max_height;
> >
> >  	/*
> >  	 * The mbus format is the one the subdev outputs.
> > @@ -1327,10 +1327,10 @@ static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f,
> >  	v4l2_fill_pix_format(pixfmt, &format.format);
> >
> >  	/* Limit to Atmel ISC hardware capabilities */
> > -	if (pixfmt->width > ISC_MAX_SUPPORT_WIDTH)
> > -		pixfmt->width = ISC_MAX_SUPPORT_WIDTH;
> > -	if (pixfmt->height > ISC_MAX_SUPPORT_HEIGHT)
> > -		pixfmt->height = ISC_MAX_SUPPORT_HEIGHT;
> > +	if (pixfmt->width > isc->max_width)
> > +		pixfmt->width = isc->max_width;
> > +	if (pixfmt->height > isc->max_height)
> > +		pixfmt->height = isc->max_height;
>
> What happens if the sensor sends a frame larger that the ISC max
> supported sizes ?
>

I meant to ask this question on the previous patch :/

> >
> >  	pixfmt->field = V4L2_FIELD_NONE;
> >  	pixfmt->bytesperline = (pixfmt->width * isc->try_config.bpp) >> 3;
> > @@ -1368,10 +1368,10 @@ static int isc_set_fmt(struct isc_device *isc, struct v4l2_format *f)
> >  		return ret;
> >
> >  	/* Limit to Atmel ISC hardware capabilities */
> > -	if (pixfmt->width > ISC_MAX_SUPPORT_WIDTH)
> > -		pixfmt->width = ISC_MAX_SUPPORT_WIDTH;
> > -	if (pixfmt->height > ISC_MAX_SUPPORT_HEIGHT)
> > -		pixfmt->height = ISC_MAX_SUPPORT_HEIGHT;
> > +	if (f->fmt.pix.width > isc->max_width)
> > +		f->fmt.pix.width = isc->max_width;
> > +	if (f->fmt.pix.height > isc->max_height)
> > +		f->fmt.pix.height = isc->max_height;
> >
> >  	isc->fmt = *f;
> >
> > diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
> > index 8d81d9967ad2..6becc6c3aaf0 100644
> > --- a/drivers/media/platform/atmel/atmel-isc.h
> > +++ b/drivers/media/platform/atmel/atmel-isc.h
> > @@ -10,9 +10,6 @@
> >   */
> >  #ifndef _ATMEL_ISC_H_
> >
> > -#define ISC_MAX_SUPPORT_WIDTH   2592
> > -#define ISC_MAX_SUPPORT_HEIGHT  1944
> > -
> >  #define ISC_CLK_MAX_DIV		255
> >
> >  enum isc_clk_id {
> > @@ -191,6 +188,9 @@ struct isc_ctrls {
> >   * @gamma_table:	pointer to the table with gamma values, has
> >   *			gamma_max sets of GAMMA_ENTRIES entries each
> >   * @gamma_max:		maximum number of sets of inside the gamma_table
> > + *
> > + * @max_width:		maximum frame width, dependent on the internal RAM
> > + * @max_height:		maximum frame height, dependent on the internal RAM
> >   */
> >  struct isc_device {
> >  	struct regmap		*regmap;
> > @@ -254,6 +254,9 @@ struct isc_device {
> >  	/* pointer to the defined gamma table */
> >  	const u32	(*gamma_table)[GAMMA_ENTRIES];
> >  	u32		gamma_max;
> > +
> > +	u32		max_width;
> > +	u32		max_height;
> >  };
> >
> >  extern struct isc_format formats_list[];
> > diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
> > index f45d8b96bfb8..f8d1c8ba99b3 100644
> > --- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
> > +++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
> > @@ -49,8 +49,8 @@
> >  #include "atmel-isc-regs.h"
> >  #include "atmel-isc.h"
> >
> > -#define ISC_MAX_SUPPORT_WIDTH   2592
> > -#define ISC_MAX_SUPPORT_HEIGHT  1944
> > +#define ISC_SAMA5D2_MAX_SUPPORT_WIDTH   2592
> > +#define ISC_SAMA5D2_MAX_SUPPORT_HEIGHT  1944
> >
> >  #define ISC_CLK_MAX_DIV		255
> >
> > @@ -195,6 +195,9 @@ static int atmel_isc_probe(struct platform_device *pdev)
> >  	isc->gamma_table = isc_sama5d2_gamma_table;
> >  	isc->gamma_max = 2;
> >
> > +	isc->max_width = ISC_SAMA5D2_MAX_SUPPORT_WIDTH;
> > +	isc->max_height = ISC_SAMA5D2_MAX_SUPPORT_HEIGHT;
> > +
> >  	ret = isc_pipeline_init(isc);
> >  	if (ret)
> >  		return ret;
> > --
> > 2.25.1
> >
