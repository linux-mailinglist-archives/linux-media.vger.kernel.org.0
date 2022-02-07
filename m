Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A74454AC50A
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 17:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243771AbiBGQHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 11:07:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377919AbiBGP5G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 10:57:06 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0C8C0401CC
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 07:57:05 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id B681D4000B;
        Mon,  7 Feb 2022 15:57:00 +0000 (UTC)
Date:   Mon, 7 Feb 2022 16:58:07 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 12/21] media: ov5640: Fix durations to comply with FPS
Message-ID: <20220207155807.pqyfhrpf354ktgar@uno.localdomain>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144444.129036-1-jacopo@jmondi.org>
 <Yfr8RIRGiSs89D4z@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yfr8RIRGiSs89D4z@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Feb 02, 2022 at 11:48:52PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Jan 31, 2022 at 03:44:40PM +0100, Jacopo Mondi wrote:
> > Now that the frame duration can be controlled by tuning the VBLANK
> > duration, fix all modes to comply with the reported FPS.
> >
> > All modes run at 30 FPS except for full-resolution mode 2592x1944
> > which runs at 15FPS.
> >
> > Tested on a 2 data lanes setup in UYVY and RGB565 modes.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ov5640.c | 30 +++++++++++++++---------------
> >  1 file changed, 15 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 6eeb50724195..2176fa0b8eae 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -611,8 +611,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
> >  			.width	= 160,
> >  			.height	= 120,
> >  		},
> > -		.ppl		= 1896,
> > -		.vblank_def	= 864,
> > +		.ppl		= 1600,
> > +		.vblank_def	= 878,
>
> The total number of pixels is changed from 1896 * (120+864) = 1865664 to
> 1600 * (120+878) = 1596800. The latter produces 30.06fps with a 48 Mp/s
> rate, which certainly seems better than the 25.73fps produced by the
> format. I wonder, though, if this has always been wrong, or if the
> incorrect frame rate got introduced earlier in this series.
>

Ideally, the values there come from the existing tables. I could have
introduced mistakes of course, but not changed those numbers
internally. With the current implementation I recall the framerate was
not accurate I can't tell if that's because the PLL is wrongly
programmed or because of wrong timings.

> Also, how did you pick a htot value of 1600 ?
>

mmm, it was a value that allowed me to range in a decent interval of
vblank values. Found by experiments I have to admit, not planned.
It could prbably be better estimated...


> >  		.reg_data	= ov5640_setting_QQVGA_160_120,
> >  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
> >  		.max_fps	= OV5640_30_FPS
> > @@ -633,8 +633,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
> >  			.width	= 176,
> >  			.height	= 144,
> >  		},
> > -		.ppl		= 1896,
> > -		.vblank_def	= 840,
> > +		.ppl		= 1600,
> > +		.vblank_def	= 854,
> >  		.reg_data	= ov5640_setting_QCIF_176_144,
> >  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QCIF_176_144),
> >  		.max_fps	= OV5640_30_FPS
> > @@ -655,8 +655,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
> >  			.width	= 320,
> >  			.height	= 240,
> >  		},
> > -		.ppl		= 1896,
> > -		.vblank_def	= 744,
> > +		.ppl		= 1600,
> > +		.vblank_def	= 760,
> >  		.reg_data	= ov5640_setting_QVGA_320_240,
> >  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QVGA_320_240),
> >  		.max_fps	= OV5640_30_FPS
> > @@ -677,8 +677,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
> >  			.width	= 640,
> >  			.height	= 480,
> >  		},
> > -		.ppl		= 1896,
> > -		.vblank_def	= 600,
> > +		.ppl		= 1600,
> > +		.vblank_def	= 520,
> >  		.reg_data	= ov5640_setting_VGA_640_480,
> >  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_VGA_640_480),
> >  		.max_fps	= OV5640_60_FPS
> > @@ -700,7 +700,7 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
> >  			.height	= 480,
> >  		},
> >  		.ppl		= 1896,
> > -		.vblank_def	= 504,
> > +		.vblank_def	= 1206,
> >  		.reg_data	= ov5640_setting_NTSC_720_480,
> >  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_NTSC_720_480),
> >  		.max_fps	= OV5640_30_FPS
> > @@ -722,7 +722,7 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
> >  			.height	= 576,
> >  		},
> >  		.ppl		= 1896,
> > -		.vblank_def	= 408,
> > +		.vblank_def	= 1110,
> >  		.reg_data	= ov5640_setting_PAL_720_576,
> >  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_PAL_720_576),
> >  		.max_fps	= OV5640_30_FPS
> > @@ -744,7 +744,7 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
> >  			.height	= 768,
> >  		},
> >  		.ppl		= 1896,
> > -		.vblank_def	= 312,
> > +		.vblank_def	= 918,
> >  		.reg_data	= ov5640_setting_XGA_1024_768,
> >  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_XGA_1024_768),
> >  		.max_fps	= OV5640_30_FPS
> > @@ -765,8 +765,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
> >  			.width	= 1280,
> >  			.height	= 720,
> >  		},
> > -		.ppl		= 1896,
> > -		.vblank_def	= 20,
> > +		.ppl		= 1600,
> > +		.vblank_def	= 560,
> >  		.reg_data	= ov5640_setting_720P_1280_720,
> >  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_720P_1280_720),
> >  		.max_fps	= OV5640_30_FPS
> > @@ -787,8 +787,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
> >  			.width	= 1920,
> >  			.height	= 1080,
> >  		},
> > -		.ppl		= 2500,
> > -		.vblank_def	= 40,
> > +		.ppl		= 2234,
> > +		.vblank_def	= 24,
> >  		.reg_data	= ov5640_setting_1080P_1920_1080,
> >  		.reg_data_size	= ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
> >  		.max_fps	= OV5640_30_FPS
>
> --
> Regards,
>
> Laurent Pinchart
