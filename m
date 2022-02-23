Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5764C127A
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 13:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240378AbiBWMK0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 07:10:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240393AbiBWMJx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 07:09:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1429A984
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 04:08:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 783EA929;
        Wed, 23 Feb 2022 13:08:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645618089;
        bh=lfE7jgXhd2Nc0nqr39HW/rz1Htd09iBsUP/m652ZlaM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YU3Ca60Pyr9ZGijLNU6OQpJ+yAoJ69SSaIpNA94H2vDka5gkGAi6u8BZNjezi+44M
         8m9HGxnRKGCV6Kst3XTEK6z2uWVvyR6+B+TqK7suiLf3ASO2iWnbBCCcF1o5ioWyNT
         IYIrJu3V0y/g/Z4tZ+T22gPqMQHmsNmvY/PPwQaE=
Date:   Wed, 23 Feb 2022 14:07:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 23/27] media: ov5640: Add BGR888 formats
Message-ID: <YhYjn8e38cAr+SnX@pendragon.ideasonboard.com>
References: <20220223104034.91550-1-jacopo@jmondi.org>
 <20220223104034.91550-24-jacopo@jmondi.org>
 <YhYiaOKNJYoS1pl8@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YhYiaOKNJYoS1pl8@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 23, 2022 at 02:02:49PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Wed, Feb 23, 2022 at 11:40:30AM +0100, Jacopo Mondi wrote:
> > Add support for BGR888 image formats.
> > 
> > No existing media bus codes describe exactly the way data is transferred
> > on the CSI-2 bus. This is not a new issue, the CSI-2 YUV422 8-bit format
> > is described by MEDIA_BUS_FMT_UYVY8_1X16 which is an arbitrary
> > convention and not an exact match. Use the MEDIA_BUS_FMT_BGR888_1X24 to
> > follow the same convention, based on the order in which bits are
> > transmitted over the CSI-2 bus when producing images in RGB24 format.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ov5640.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index b9a488f63687..04e8f27df222 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -225,6 +225,10 @@ static const struct ov5640_pixfmt {
> >  		.code = MEDIA_BUS_FMT_RGB565_1X16,
> >  		.colorspace = V4L2_COLORSPACE_SRGB,
> >  		.bpp = 16,
> > +	}, {
> 
> 		/* For CSI-2 only */

Please ignore this, and in the previous patch too, I see this is added
in the CSI-2 list.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +		.code = MEDIA_BUS_FMT_BGR888_1X24,
> > +		.colorspace = V4L2_COLORSPACE_SRGB,
> > +		.bpp = 24,
> >  	}, {
> >  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> >  		.colorspace = V4L2_COLORSPACE_SRGB,
> > @@ -2912,6 +2916,11 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
> >  		fmt = 0x61;
> >  		mux = OV5640_FMT_MUX_RGB;
> >  		break;
> > +	case MEDIA_BUS_FMT_BGR888_1X24:
> > +		/* BGR888: RGB */
> > +		fmt = 0x23;
> > +		mux = OV5640_FMT_MUX_RGB;
> > +		break;
> >  	case MEDIA_BUS_FMT_JPEG_1X8:
> >  		/* YUV422, YUYV */
> >  		fmt = 0x30;

-- 
Regards,

Laurent Pinchart
