Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 885EC78B234
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 15:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjH1Nqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 09:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjH1NqE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 09:46:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B463391
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 06:46:01 -0700 (PDT)
Received: from ideasonboard.com (mob-5-91-19-240.net.vodafone.it [5.91.19.240])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 652DE2D8;
        Mon, 28 Aug 2023 15:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693230279;
        bh=YNUURFd69Setlt5PwYwU5Ioa+nHhQebkbMrEJFpRoqc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=COygRkUixbGHUiBAf5+8D4M5O2Mb/5KeGDFcujMK4YOTmTP0TITPJd3/mw+VFWtO6
         ajjcyLE5yO7Vau/cwc9Y98oTgWqFTAqupE4S8VEx5a/uD0iR2drhuWb6YDQD/jBw5b
         03e6VxfJ2Gti8fReOCz3VqRk0UWLOR4+HUjGxlOE=
Date:   Mon, 28 Aug 2023 15:45:56 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 12/18] media: i2c: imx219: Drop IMX219_VTS_* macros
Message-ID: <ctghcpx7mowjcjogtdhjbmeweuy6exraymb6xyspnk5fvm4nns@cg34y7rriycp>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
 <20230821223001.28480-13-laurent.pinchart@ideasonboard.com>
 <CAPY8ntC1d8U7Obx6643Xm+LyXNVFaQ5xcitNZpd5fnffK7Sgtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntC1d8U7Obx6643Xm+LyXNVFaQ5xcitNZpd5fnffK7Sgtw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Tue, Aug 22, 2023 at 06:27:06PM +0100, Dave Stevenson wrote:
> On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > The IMX219_VTS_* macros define default VTS values for the modes
> > supported by the driver. They are used in a single place, and hinder
> > readability compared to using the value directly as a decimal number.
> > Drop them.
>
> Personally I don't see it as a huge hindrance to readability, but it's
> not that significant either way.
>

Agreed, a matter of tastes mostly

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> > ---
> >  drivers/media/i2c/imx219.c | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 67a30dc39641..165c5e8473f7 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -71,10 +71,6 @@
> >
> >  /* V_TIMING internal */
> >  #define IMX219_REG_VTS                 CCI_REG16(0x0160)
> > -#define IMX219_VTS_15FPS               0x0dc6
> > -#define IMX219_VTS_30FPS_1080P         0x06e3
> > -#define IMX219_VTS_30FPS_BINNED                0x06e3
> > -#define IMX219_VTS_30FPS_640x480       0x06e3
> >  #define IMX219_VTS_MAX                 0xffff
> >
> >  #define IMX219_VBLANK_MIN              4
> > @@ -302,7 +298,7 @@ static const struct imx219_mode supported_modes[] = {
> >                         .width = 3280,
> >                         .height = 2464
> >                 },
> > -               .vts_def = IMX219_VTS_15FPS,
> > +               .vts_def = 3526,
> >         },
> >         {
> >                 /* 1080P 30fps cropped */
> > @@ -314,7 +310,7 @@ static const struct imx219_mode supported_modes[] = {
> >                         .width = 1920,
> >                         .height = 1080
> >                 },
> > -               .vts_def = IMX219_VTS_30FPS_1080P,
> > +               .vts_def = 1763,
> >         },
> >         {
> >                 /* 2x2 binned 30fps mode */
> > @@ -326,7 +322,7 @@ static const struct imx219_mode supported_modes[] = {
> >                         .width = 3280,
> >                         .height = 2464
> >                 },
> > -               .vts_def = IMX219_VTS_30FPS_BINNED,
> > +               .vts_def = 1763,
> >         },
> >         {
> >                 /* 640x480 30fps mode */
> > @@ -338,7 +334,7 @@ static const struct imx219_mode supported_modes[] = {
> >                         .width = 1280,
> >                         .height = 960
> >                 },
> > -               .vts_def = IMX219_VTS_30FPS_640x480,
> > +               .vts_def = 1763,
> >         },
> >  };
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
> >
