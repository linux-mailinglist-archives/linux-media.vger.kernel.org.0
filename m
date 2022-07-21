Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E0457CA34
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 14:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbiGUME6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 08:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232969AbiGUME5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 08:04:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5360984EF7
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 05:04:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65043496;
        Thu, 21 Jul 2022 14:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658405094;
        bh=so4ILqOoIvWEOFsIDr99Jd/IZ98HrPi/roH3jWc93dI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tXQXqRfWqvYSANbkmFE630p4PaQ8VNhwokPGU/goDgDYUQnBa5l7CW5DHjyOtxnzo
         +Lxe2+O3PsZlQM/nBA6Ur81NMSbkCMKKfJicxdhRGztj/izSAcUZmxfIVmDqouneED
         ZjhW/7yCIO3JaQUoLrkgbTNZ+LW9cvlHGBrMs08k=
Date:   Thu, 21 Jul 2022 15:04:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: Re: [PATCH 03/19] media: i2c: imx290: Specify HMAX values in
 decimal
Message-ID: <YtlA5GkNDzVlWn/6@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <3848757.ElGaqSPkdT@steina-w>
 <Ytk5LAizibrAraFd@pendragon.ideasonboard.com>
 <3293452.QkHrqEjB74@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3293452.QkHrqEjB74@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Thu, Jul 21, 2022 at 01:54:18PM +0200, Alexander Stein wrote:
> Am Donnerstag, 21. Juli 2022, 13:31:56 CEST schrieb Laurent Pinchart:
> > On Thu, Jul 21, 2022 at 11:18:24AM +0200, Alexander Stein wrote:
> > > Hi Laurent,
> > > 
> > > thanks for working on this, I've also some patches on top for imx327
> > > support.
> > 
> > I'm using an IMX327 with this driver without any need for additional
> > patches :-) I'd be happy to test our patches though.
> 
> Same for me, but I feel unpleasent writing to reserved bits ;-)
> 
> > > Am Donnerstag, 21. Juli 2022, 10:35:24 CEST schrieb Laurent Pinchart:
> > > > The HMAX value specifies the total line length in pixels. It's thus more
> > > > readable in decimal than hexadecimal. Fix it.
> > > 
> > > I understand the motivation, pixels are more natural in decimal numbers,
> > > but e.g. what is 4400 pixels on this sensor? It is only mentioned
> > > sparsely and 3300d is not mentioned at all, 0ce4h is instead.
> > 
> > I'm not even sure if HMAX is expressed in pixels or in cycles of some
> > internal clock different than the pixel clocks.
> > 
> > > I also like to have the hexadecimal numbers here as you can find them
> > > directly in the datasheet. To me this seems more sensible for
> > > cross-checking. Just my opinion.
> > 
> > It's a matter of readability of the driver code vs. matching with the
> > datasheet. I have a preference for decimal numbers here, but I don't
> > mind too much. What I would actually like is dropping the hmax value
> > from the imx290_mode structure and computing it dynamically based on a
> > hblank value set by userspace. Do you think you could help me doing so ?
> 
> Well, in my patch stack there is one adding vmax to this struct ;-)
> It works without modification but this is essentially the so called 'long 
> exposure operation'.
> Reducing vmax on 720p increases the FPS, so this is a sensible thing to do. 
> The exposure has to be recalculated from that (dynamic) vmax value.

vmax should be easier as that's expressed in lines, so you can more
easily map it to V4L2_CID_VBLANK.

> But computing those values completely dynamically seems a sensible thing to 
> do. Until it is fully understood I would prefer keeping hexadecimal values.
> I mean do you know why it is 4400 pixels for 1080p and 6600 for 720p on 2 
> lanes?

I think it may not expressed in pixels, but in units of some other
internal clock, whose frequency is different for different numbers of
lanes.

> I know this is part of your [1] branch. So I'll post my patches once this 
> series is settled.
> 
> [1] https://gitlab.com/ideasonboard/nxp/linux/-/commits/pinchartl/v5.19/
> sensors/imx
> 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > 
> > > >  drivers/media/i2c/imx290.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > index 64bd43813dbf..f60a4135dc9c 100644
> > > > --- a/drivers/media/i2c/imx290.c
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -308,7 +308,7 @@ static const struct imx290_mode
> > > > imx290_modes_2lanes[] =
> > > > { {
> > > > 
> > > >  		.width = 1920,
> > > >  		.height = 1080,
> > > > 
> > > > -		.hmax = 0x1130,
> > > > +		.hmax = 4400,
> > > > 
> > > >  		.link_freq_index = FREQ_INDEX_1080P,
> > > >  		.data = imx290_1080p_settings,
> > > >  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> > > > 
> > > > @@ -316,7 +316,7 @@ static const struct imx290_mode
> > > > imx290_modes_2lanes[] =
> > > > { {
> > > > 
> > > >  		.width = 1280,
> > > >  		.height = 720,
> > > > 
> > > > -		.hmax = 0x19c8,
> > > > +		.hmax = 6600,
> > > > 
> > > >  		.link_freq_index = FREQ_INDEX_720P,
> > > >  		.data = imx290_720p_settings,
> > > >  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> > > > 
> > > > @@ -327,7 +327,7 @@ static const struct imx290_mode
> > > > imx290_modes_4lanes[] =
> > > > { {
> > > > 
> > > >  		.width = 1920,
> > > >  		.height = 1080,
> > > > 
> > > > -		.hmax = 0x0898,
> > > > +		.hmax = 2200,
> > > > 
> > > >  		.link_freq_index = FREQ_INDEX_1080P,
> > > >  		.data = imx290_1080p_settings,
> > > >  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> > > > 
> > > > @@ -335,7 +335,7 @@ static const struct imx290_mode
> > > > imx290_modes_4lanes[] =
> > > > { {
> > > > 
> > > >  		.width = 1280,
> > > >  		.height = 720,
> > > > 
> > > > -		.hmax = 0x0ce4,
> > > > +		.hmax = 3300,
> > > > 
> > > >  		.link_freq_index = FREQ_INDEX_720P,
> > > >  		.data = imx290_720p_settings,
> > > >  		.data_size = ARRAY_SIZE(imx290_720p_settings),

-- 
Regards,

Laurent Pinchart
