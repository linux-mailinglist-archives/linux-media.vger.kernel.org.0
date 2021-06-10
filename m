Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E3A3A2E94
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 16:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhFJOv0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 10:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhFJOvZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 10:51:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A08C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 07:49:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F4EC8D4;
        Thu, 10 Jun 2021 16:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623336567;
        bh=61ERdsGeuvqu3dNE8tq3g++gK/YdnyzhSuQ6kfnJ0Dg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AKRJYT7h25x5DdntNJoQnXEjXmNGfuqiNVoxxCBO/H9P3VKxQfA9oSEgyx4DQVnjL
         /fvPzIDJ9EtvLvqebf92q5ByDjgwCKDD5p8UoiVSqVdOpYLiDblId5XVJ/Smkcoz1f
         mcj+C3lf8UYRWc3vD6Fs2DpTPB2OyowlTY8Z1a0M=
Date:   Thu, 10 Jun 2021 17:49:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        linux-imx@nxp.com, Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Subject: Re: [RFC PATCH 2/3] media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR
 for >= 10-bit formats
Message-ID: <YMImZKSVuo80jkZv@pendragon.ideasonboard.com>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
 <20210516024216.4576-3-laurent.pinchart@ideasonboard.com>
 <a0b7ab70-97b2-1511-bdd3-b7c78056042b@kontron.de>
 <YKRY7y4ykERzdRSe@pendragon.ideasonboard.com>
 <c4db10e3-9565-a09a-6590-7711c580f856@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c4db10e3-9565-a09a-6590-7711c580f856@kontron.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frieder,

On Tue, May 25, 2021 at 11:59:40AM +0200, Frieder Schrempf wrote:
> On 19.05.21 02:16, Laurent Pinchart wrote:
> > On Mon, May 17, 2021 at 12:21:17PM +0200, Frieder Schrempf wrote:
> >> On 16.05.21 04:42, Laurent Pinchart wrote:
> >>> Sample code from NXP, as well as experiments on i.MX8MM with RAW10
> >>> capture with an OV5640 sensor connected over CSI-2, showed that the
> >>> TWO_8BIT_SENSOR field of the CSICR3 register needs to be set for formats
> >>> larger than 8 bits. Do so, even if the reference manual doesn't clearly
> >>> describe the effect of the field.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>
> >> For the ADV7280-M I also have the diffs below applied. Do you think
> >> setting BIT_MIPI_DOUBLE_CMPNT is specific to MEDIA_BUS_FMT_UYVY8_2X8?
> > 
> > Do you need MEDIA_BUS_FMT_UYVY8_2X8 ? Neither MEDIA_BUS_FMT_UYVY8_1X16
> > nor MEDIA_BUS_FMT_UYVY8_2X8 match exactly how YUV 4:2:2 data is
> > transmitted over CSI-2. V4L2 uses MEDIA_BUS_FMT_UYVY8_1X16 as a
> > convention.
> 
> I just use MEDIA_BUS_FMT_UYVY8_2X8 as the ADV7280 driver sets it. But
> if the convention is to use MEDIA_BUS_FMT_UYVY8_1X16 for YUV422, then
> maybe the ADV driver needs to be fixed.

That would be the ideal situation. We need to be careful about not
breaking backward compatibility, but apart from that,
MEDIA_BUS_FMT_UYVY8_1X16 is the way to go.

I started writing a documentation patch, and found it it's already
documented :-) Documentation/userspace-api/media/v4l/subdev-formats.rst
states:

    The media bus pixel codes document parallel formats. Should the
    pixel data be transported over a serial bus, the media bus pixel
    code that describes a parallel format that transfers a sample on a
    single clock cycle is used. For instance, both
    MEDIA_BUS_FMT_BGR888_1X24 and MEDIA_BUS_FMT_BGR888_3X8 are used on
    parallel busses for transferring an 8 bits per sample BGR data,
    whereas on serial busses the data in this format is only referred to
    using MEDIA_BUS_FMT_BGR888_1X24. This is because there is
    effectively only a single way to transport that format on the serial
    busses.

> >> In the RM it mentions YUV422 in the description of
> >> BIT_MIPI_DOUBLE_CMPNT and without setting it, the colors are all
> >> wrong.
> > 
> > That's interesting. I've tested YUV 4:2:2 with an OV5640 sensor, and I
> > don't recall having to set the MIPI_DOUBLE_CMPNT field. I'll try to
> > retest.
> > 
> >> I know this is not really related to this patch. I'm just wondering
> >> how to properly support my setup.
> > 
> > It's hard to tell :-( The MIPI_CSI2_ISP_CONFIG PIXEL_MODE and PARALLEL
> > fields are not well documented, and neither is the CSI_CR18
> > MIPI_DOUBLE_CMPNT field. While the CSIS and the CSI bridge are
> > documented, how they're integrated isn't described. So far, I can only
> > guess.
> > 
> >> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> >> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> >> @@ -346,6 +346,11 @@ struct csis_pix_format {
> >>  
> >>  static const struct csis_pix_format mipi_csis_formats[] = {
> >>         /* YUV formats. */
> >> +       {
> >> +               .code = MEDIA_BUS_FMT_UYVY8_2X8,
> >> +               .data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
> >> +               .width = 8,
> >> +       },
> >>         {
> >>                 .code = MEDIA_BUS_FMT_UYVY8_1X16,
> >>                 .data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
> >>
> >> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> >> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> >> @@ -504,7 +504,7 @@ static void __mipi_csis_set_format(struct csi_state *state)
> >>         /* Color format */
> >>         val = mipi_csis_read(state, MIPI_CSIS_ISP_CONFIG_CH(0));
> >>         val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
> >> -       val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type);
> >> +       val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type) | MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
> >>         mipi_csis_write(state, MIPI_CSIS_ISP_CONFIG_CH(0), val);
> >>  
> >>         /* Pixel resolution */
> >>
> >> --- a/drivers/staging/media/imx/imx7-media-csi.c
> >> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> >> @@ -492,7 +492,8 @@ static void imx7_csi_configure(struct imx7_csi *csi)
> >>                 case MEDIA_BUS_FMT_UYVY8_1X16:
> >>                 case MEDIA_BUS_FMT_YUYV8_2X8:
> >>                 case MEDIA_BUS_FMT_YUYV8_1X16:
> >> -                       cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
> >> +                       cr3 |= BIT_TWO_8BIT_SENSOR;
> >> +                       cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B | BIT_MIPI_DOUBLE_CMPNT;
> > 
> > I notice that you set both PIXEL_MODE_DUAL and MIPI_DOUBLE_CMPNT. Have
> > you tried setting neither ?
> 
> Yes, but as soon as I don't set PIXEL_MODE_DUAL, I get overflow errors
> from the MIPI CSI2 controller and it doesn't work at all.

What PIXEL_MODE_DUAL and MIPI_DOUBLE_CMPNT do exactly is not totally
clear, we'll have to iron it out to ensure drivers can pick the right
settings automatically.

> > Have you also tried using MEDIA_BUS_FMT_UYVY8_1X16 ? The difference
> > between MEDIA_BUS_FMT_UYVY8_2X8 and MEDIA_BUS_FMT_UYVY8_1X16 in this
> > driver is the width value passed to v4l2_get_link_freq(). With
> > MEDIA_BUS_FMT_UYVY8_2X8 you'll end up with a computed link frequency
> > equal to half of the actual value, and thus a wrong Ths_settle value. It
> > shuold have no other influence though.
> 
> The link frequency calculation doesn't work for me at the moment, as
> the ADV driver doesn't provide any of the controls V4L2_CID_LINK_FREQ
> or V4L2_CID_PIXEL_RATE. So for now I just hardcoded the Ths_settle
> value.

-- 
Regards,

Laurent Pinchart
