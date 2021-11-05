Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCF0446197
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 10:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbhKEJxT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 05:53:19 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:54551 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232829AbhKEJxT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 05:53:19 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id D4F1D200005;
        Fri,  5 Nov 2021 09:50:36 +0000 (UTC)
Date:   Fri, 5 Nov 2021 10:51:28 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        robh+dt@kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH 11/21] media: atmel: atmel-isc-base: implement mbus_code
 support in enumfmt
Message-ID: <20211105095128.7tu4rm6mogwy2dz6@uno.localdomain>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
 <20211022075247.518880-12-eugen.hristev@microchip.com>
 <20211105092559.ce6pdm4hwvxkmutd@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211105092559.ce6pdm4hwvxkmutd@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen

On Fri, Nov 05, 2021 at 10:25:59AM +0100, Jacopo Mondi wrote:
> Hi Eugen,
>
> On Fri, Oct 22, 2021 at 10:52:37AM +0300, Eugen Hristev wrote:
> > If enumfmt is called with an mbus_code, the enumfmt handler should only
> > return the formats that are supported for this mbus_code.
> > To make it more easy to understand the formats, changed the report order
> > to report first the native formats, and after that the formats that the ISC
> > can convert to.
> >
> > Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
>

Too soon! Sorry...

> Thanks
>    j
>
> > ---
> >  drivers/media/platform/atmel/atmel-isc-base.c | 51 ++++++++++++++++---
> >  1 file changed, 43 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> > index 2dd2511c7be1..1f7fbe5e4d79 100644
> > --- a/drivers/media/platform/atmel/atmel-isc-base.c
> > +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> > @@ -499,21 +499,56 @@ static int isc_enum_fmt_vid_cap(struct file *file, void *priv,
> >  	u32 index = f->index;
> >  	u32 i, supported_index;
> >
> > -	if (index < isc->controller_formats_size) {
> > -		f->pixelformat = isc->controller_formats[index].fourcc;
> > -		return 0;
> > +	supported_index = 0;
> > +
> > +	for (i = 0; i < isc->formats_list_size; i++) {
> > +		if (!isc->formats_list[i].sd_support)


> > +			continue;
> > +		/*
> > +		 * If specific mbus_code is requested, provide only
> > +		 * supported formats with this mbus code
> > +		 */
> > +		if (f->mbus_code && f->mbus_code !=
> > +		    isc->formats_list[i].mbus_code)
> > +			continue;
> > +		if (supported_index == index) {
> > +			f->pixelformat = isc->formats_list[i].fourcc;
> > +			return 0;
> > +		}
> > +		supported_index++;
> >  	}
> >
> > -	index -= isc->controller_formats_size;
> > +	/*
> > +	 * If the sensor does not support this mbus_code whatsoever,
> > +	 * there is no reason to advertise any of our output formats
> > +	 */
> > +	if (supported_index == 0)
> > +		return -EINVAL;

Shouldn't you also return -EINVAL if index > supported_index ?

In that case, I'm not gettng what the rest of the function is for ?

> > +
> > +	/*
> > +	 * If the sensor uses a format that is not raw, then we cannot
> > +	 * convert it to any of the formats that we usually can with a
> > +	 * RAW sensor. Thus, do not advertise them.
> > +	 */
> > +	if (!isc->config.sd_format ||
> > +	    !ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
> > +		return -EINVAL;
> >
> > +	/*
> > +	 * Iterate again through the formats that we can convert to.
> > +	 * However, to avoid duplicates, skip the formats that
> > +	 * the sensor already supports directly
> > +	 */
> > +	index -= supported_index;
> >  	supported_index = 0;
> >
> > -	for (i = 0; i < isc->formats_list_size; i++) {
> > -		if (!ISC_IS_FORMAT_RAW(isc->formats_list[i].mbus_code) ||
> > -		    !isc->formats_list[i].sd_support)
> > +	for (i = 0; i < isc->controller_formats_size; i++) {
> > +		/* if this format is already supported by sensor, skip it */
> > +		if (find_format_by_fourcc(isc, isc->controller_formats[i].fourcc))
> >  			continue;
> >  		if (supported_index == index) {
> > -			f->pixelformat = isc->formats_list[i].fourcc;
> > +			f->pixelformat =
> > +				isc->controller_formats[i].fourcc;
> >  			return 0;
> >  		}
> >  		supported_index++;
> > --
> > 2.25.1
> >
