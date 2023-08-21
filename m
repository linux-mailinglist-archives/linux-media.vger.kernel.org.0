Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA60C7835BA
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 00:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbjHUWaI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 18:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbjHUWaH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 18:30:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AAB193
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 15:30:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85E42396B;
        Tue, 22 Aug 2023 00:28:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692656923;
        bh=yGfcpzO8f2zaCf8UMjYouR/klpKxudWbb5FYiyAcJQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lP5r1etjYKGUDA+Bcw2P6VQsFBOY39hT1Wt27oLvKqDZDjinCP7EgaiHBqvuUIejL
         GGMreWsEQKmSrIZ1RWc+sHSHXKfTQQtOxVzWGaXuueAMV5n+083bwCxcTgLJA3vVAh
         IFVOxuUBu8MXDU9AoVghAI7bEnk++vX70zETx7fs=
Date:   Tue, 22 Aug 2023 01:30:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v1 07/12] media: i2c: imx219: Initialize ycbcr_enc
Message-ID: <20230821223007.GA28220@pendragon.ideasonboard.com>
References: <20230815182431.18409-1-laurent.pinchart@ideasonboard.com>
 <20230815182431.18409-8-laurent.pinchart@ideasonboard.com>
 <CAPY8ntBe59BfjcoedoVCC0X8-75wo8+RXnpZZS_Z0-6w70_aBQ@mail.gmail.com>
 <20230817115925.GH21668@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230817115925.GH21668@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Thu, Aug 17, 2023 at 02:59:25PM +0300, Laurent Pinchart wrote:
> Hi Dave,
> 
> (CC'ing Hans Verkuil).
> 
> On Thu, Aug 17, 2023 at 12:00:10PM +0100, Dave Stevenson wrote:
> > On Tue, 15 Aug 2023 at 19:24, Laurent Pinchart wrote:
> > >
> > > While the ycbcr_enc field doesn't apply to raw formats, leaving it
> > > uninitialized makes the driver behave in a less deterministic way. Fix
> > > it by picking the default value for the colorspace.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/imx219.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index 8c61b748d9a5..976014ed7711 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -499,6 +499,7 @@ static void imx219_update_pad_format(struct imx219 *imx219,
> > >         fmt->height = mode->height;
> > >         fmt->field = V4L2_FIELD_NONE;
> > >         fmt->colorspace = V4L2_COLORSPACE_RAW;
> > > +       fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> > >         fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > >         fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> > 
> > In [1] for imx290 you requested that I change from using the
> > V4L2_MAP_xxx_DEFAULT macros to hardcode them, and now you're mixing
> > and matching the two in the same driver.
> > Could we have some consistency please? Personally I don't mind which
> > is used, but mixing and matching within a driver feels wrong.
> > (If there is a genuine desire for V4L2_MAP_xxx_DEFAULT or hardcoding
> > in sensor drivers, it'd be nice if it was documented to avoid
> > additional review cycles).
> 
> Absolutely, sorry about this. I'll fix it in v2 and use
> V4L2_MAP_YCBCR_ENC_601.
> 
> Hans, should we add a V4L2_YCBCR_ENC_NONE for non-YUV formats ?
> 
> > Also just noting that you seem not to be using get_maintainers for
> > your patches as I appear not to have been included.
> 
> I'm not sure how that happened, as I use get_maintainer.pl. I probably
> made a mistake somewhere. Sorry about that. I was actually looking
> forward to your review of the series :-)

Actually, you were on CC, so I'm not sure why you haven't received the
series.

> > [1] https://patchwork.linuxtv.org/project/linux-media/patch/20230131192016.3476937-3-dave.stevenson@raspberrypi.com/#144299
> > 
> > >  }

-- 
Regards,

Laurent Pinchart
