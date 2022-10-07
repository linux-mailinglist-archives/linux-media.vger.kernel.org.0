Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C897B5F7897
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 15:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiJGNGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 09:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiJGNGv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 09:06:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A12AC90E0
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 06:06:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 494CFBBE;
        Fri,  7 Oct 2022 15:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665148008;
        bh=lSiN/40+e+o6tBNeYKg9OufLr8uphunI4l4WJXm4/SE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uDlJ69Ji9NvS2P0GRat2n8cv0scIBzivbmILyotVDqHuVhb0moXZlZI4iLYuaKRgM
         Dn6mFm5TsubyLL304qxG93XISzlnekj8Njy9xEGKDCpCILvpivDm2+TVIWqswI2po/
         svCz7ipDl/LAPrq+9ScS3VmN5i2yZwnSu6qoxIxQ=
Date:   Fri, 7 Oct 2022 16:06:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 03/10] media: ar0521: Set maximum resolution to 2592x1944
Message-ID: <Y0AkY6o6spakYJD3@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-4-jacopo@jmondi.org>
 <CAPY8ntBgHm6KTpH6GBLiMtdRt1vAE4ne0EMq5N+x0CJJ9yU9+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntBgHm6KTpH6GBLiMtdRt1vAE4ne0EMq5N+x0CJJ9yU9+A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 06, 2022 at 03:57:16PM +0100, Dave Stevenson wrote:
> Hi Jacopo
> 
> On Wed, 5 Oct 2022 at 20:06, Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Change the largest visibile resolution to 2592x1944, which corresponds
> > to the active pixel array area size. Take into account the horizontal
> > and vertical limits when programming the visible sizes to skip
> > dummy/inactive pixels.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ar0521.c | 23 +++++++++++++++++------
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > index 581f5e42994d..2b19ba898ce8 100644
> > --- a/drivers/media/i2c/ar0521.c
> > +++ b/drivers/media/i2c/ar0521.c
> > @@ -28,10 +28,17 @@
> >  #define AR0521_PIXEL_CLOCK_MIN  (168 * 1000 * 1000)
> >  #define AR0521_PIXEL_CLOCK_MAX  (414 * 1000 * 1000)
> >
> > +#define AR0521_NATIVE_WIDTH            2604u
> > +#define AR0521_NATIVE_HEIGHT           1964u
> > +#define AR0521_MIN_X_ADDR_START                4u
> > +#define AR0521_MIN_Y_ADDR_START                4u
> > +#define AR0521_MAX_X_ADDR_END          2603u
> > +#define AR0521_MAX_Y_ADDR_END          1963u
> 
> The register list I have (downloaded from OnSemi today) states that
> y_addr_max is 0x07a3, or 1955, readable from register 0x1186.

And it also states, in the documentation of y_addr_start, that legal
values are [0, 2463]. Who do we trust ? :-) [0, 2463] sounds like a copy
& paste mistake to me. Another data point is from the developer guide,
which states on the first page that the maximum values for x_addr_start
and y_addr_start are 2603 and 1963 respectively. 2603 matches the
documentation of x_addr_max.

It would be useful to dump the limits registers (0x1000 - 0x1300).

> Otherwise this looks reasonable.
> 
> > +
> >  #define AR0521_WIDTH_MIN              8u
> > -#define AR0521_WIDTH_MAX           2608u
> > +#define AR0521_WIDTH_MAX           2592u
> >  #define AR0521_HEIGHT_MIN             8u
> > -#define AR0521_HEIGHT_MAX          1958u
> > +#define AR0521_HEIGHT_MAX          1944u
> >
> >  #define AR0521_WIDTH_BLANKING_MIN     572u
> >  #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
> > @@ -208,13 +215,17 @@ static int ar0521_read_reg(struct ar0521_dev *sensor, u16 reg, u16 *val)
> >
> >  static int ar0521_set_geometry(struct ar0521_dev *sensor)
> >  {
> > +       /* Center the image in the visible ouput window. */
> > +       u16 x = clamp((AR0521_WIDTH_MAX - sensor->fmt.width) / 2,
> > +                      AR0521_MIN_X_ADDR_START, AR0521_MAX_X_ADDR_END);
> > +       u16 y = clamp(((AR0521_HEIGHT_MAX - sensor->fmt.height) / 2) & ~1,
> > +                      AR0521_MIN_Y_ADDR_START, AR0521_MAX_Y_ADDR_END);
> > +
> >         /* All dimensions are unsigned 12-bit integers */
> > -       u16 x = (AR0521_WIDTH_MAX - sensor->fmt.width) / 2;
> > -       u16 y = ((AR0521_HEIGHT_MAX - sensor->fmt.height) / 2) & ~1;
> >         __be16 regs[] = {
> >                 be(AR0521_REG_FRAME_LENGTH_LINES),
> > -               be(sensor->total_height),
> > -               be(sensor->total_width),
> > +               be(sensor->fmt.height + sensor->ctrls.vblank->val),
> > +               be(sensor->fmt.width + sensor->ctrls.hblank->val),
> >                 be(x),
> >                 be(y),
> >                 be(x + sensor->fmt.width - 1),

-- 
Regards,

Laurent Pinchart
