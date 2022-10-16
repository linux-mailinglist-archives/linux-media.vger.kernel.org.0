Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBE925FFD4C
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 06:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiJPEvk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 00:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiJPEvj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 00:51:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D8A3EA65
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 21:51:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B078D30A;
        Sun, 16 Oct 2022 06:51:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665895896;
        bh=CKWCXkg2VLZQItnWj0zSDhh8YQ0od4jxFCOzEWJwn8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ClbPwkkWFzWtL+0XITgKy7IeZ9jmZALb01SP+DlLQxAMPBqIvoLEb+2vARtRl7gqL
         g5pk0U743nx0HKGNpz2VHPxCTsO+anx/AhHOUMrm04m9YdUdU3HeiPwOGre9whToKb
         1n8/02J2BciAAzM0n495POlGbd0a+VjrLFzNdovM=
Date:   Sun, 16 Oct 2022 07:51:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 12/19] media: i2c: imx290: Fix max gain value
Message-ID: <Y0uNwQhLXecNNhND@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <20220721083540.1525-13-laurent.pinchart@ideasonboard.com>
 <CAPY8ntAibtuRKnA7+YJKugMNNAz=kiKkFmCN1z9hFitPgsZM=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAibtuRKnA7+YJKugMNNAz=kiKkFmCN1z9hFitPgsZM=g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Thu, Jul 21, 2022 at 05:08:37PM +0100, Dave Stevenson wrote:
> On Thu, 21 Jul 2022 at 09:36, Laurent Pinchart wrote:
> >
> > The gain is expressed in multiple of 0.3dB, as a value between 0.0dB
> > and 72.0dB. The maximum value is thus 240, not 72.
> 
> At this point in the series I'll agree with you as it is for V4L2_CID_GAIN.
> However later in the series you convert to V4L2_CID_ANALOGUE_GAIN, and
> there I disagree.
> 
> The register is for a combined 0-30dB of analogue gain, and 0-42dB of
> digital gain, both in 0.3dB steps.
> V4L2_CID_GAIN can have a range of 0-240.
> V4L2_CID_ANALOGUE_GAIN has a range of 0-100.

Good point, I had missed that. I'll fix it.

> Minor additional point: IMX327 is the previous version of this and
> only goes up to 1080p60 instead of 1080p120 (10bit only). That
> supports 0-29.4dB of analogue gain, and 42dB of digital gain, for a
> max value of 238. If using the definition for analogue gain only, then
> you may end up with 0.6dB of digital gain instead, but it will work.
> IMX462 is the newer version and supports 1080p120 in 10 or 12bit. I
> don't have a full datasheet for it, but the product brief lists
> 0-29.4dB of analogue, and 42dB of digital gain, same as IMX327.
> Seeing as the 120fps modes are not implemented in this driver, it
> currently supports all 3 models.

Why does it have to be so complicated ? :-) I'll see what I can do.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx290.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 3cb024b73ee7..1bd464932432 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -1020,7 +1020,7 @@ static int imx290_probe(struct i2c_client *client)
> >         imx290->ctrls.lock = &imx290->lock;
> >
> >         v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > -                         V4L2_CID_GAIN, 0, 72, 1, 0);
> > +                         V4L2_CID_GAIN, 0, 240, 1, 0);
> >
> >         v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> >                           V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,

-- 
Regards,

Laurent Pinchart
