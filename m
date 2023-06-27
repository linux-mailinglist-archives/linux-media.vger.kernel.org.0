Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 921E174065F
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 00:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjF0WJd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 18:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjF0WJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 18:09:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A481A1FE5
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 15:09:30 -0700 (PDT)
Received: from ideasonboard.com (85-160-38-115.reb.o2.cz [85.160.38.115])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E6A8905;
        Wed, 28 Jun 2023 00:08:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687903729;
        bh=r0hGSvLVBb0SZy9FKCTptcSIxWz06pK6pF78KBrdepw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dmh66zf7KSCAqpwuiwdkcpjviigVyH4Zh5BUfO1e+EjY1YuO2A4EDSeyP8WkydXU9
         3pUC/ep02DWA8iyVKDMlWMhTU8y6hKNXs5KXSahKgDu3tWLoFCdyYLsG5Z05PoSzfR
         ssN3zfdhJ6bgqseVSEHkZXVfI/lQNdtQd1+RwroY=
Date:   Wed, 28 Jun 2023 00:09:25 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 24/29] media: ov2680: Fix exposure and gain ctrls
 range and default value
Message-ID: <g5zan7ir22cf7tmkpqqrk53heio7ctvxo53q5a3rcbjx53jry3@a3soqgdmf2wn>
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-25-hdegoede@redhat.com>
 <ufoycurk666obqqn4yljfkumhjsql7syqxcuu2m52k5adty7qd@w5sprhel4noq>
 <b0152c64-6e1a-41ae-c497-7b552f2be6d4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b0152c64-6e1a-41ae-c497-7b552f2be6d4@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Han

On Tue, Jun 27, 2023 at 06:26:08PM +0200, Hans de Goede wrote:
> Hi Jacopo,
>
> On 6/27/23 17:16, Jacopo Mondi wrote:
> > Hi Hans
> >   another drive-by question
> >
> > On Tue, Jun 27, 2023 at 03:18:25PM +0200, Hans de Goede wrote:
> >> The exposure control's max effective value is VTS - 8, set the control
> >> range to match this. Thas means that if/when a future commit makes VTS
> >> configurable as a control itself the exposure range needs to be
> >> updated dynamically to match the VTS value.
> >>
> >> The gain control goes from 0 - 1023, higher values wrap around to
> >> the lowest gain setting.
> >>
> >> Also stop setting 0 as default for both controls this leads to
> >> a totally black picture which is no good. This is esp. important
> >> for tests of the sensor driver without (userspace driven)
> >> auto exposure / gain.
> >
> > I see the driver uses V4L2_CID_GAIN. Is this intentional or should
> > this be V4L2_CID_ANALOGUE_GAIN? As you're plumbing libcamera support
> > in, this is the control libcamera expects to use to control analogue
> > gain.
>
> That is a good question. I've not changed this for worries about
> existing users. Although given the previous state of the existing
> code I wonder if there are any existing users?

That's a fair concern

>
> So what is the policy on this ?
>
> Also I still need to figure out what the actual range
> (as in amplification at lowest + highest setting) of the gain
> control is, because AFAIk libcamera wants to know this.

libcamera has helpers that translate the scalar gain values computed
by the AEGC algorithms (or supplied by the application) to sensor's
device specific gain codes (and the other way around)
https://git.libcamera.org/libcamera/libcamera.git/tree/src/ipa/libipa/camera_sensor_helper.cpp

So it's fine if the driver exposes the device specific gain codes from
a libcamera perspective. True, there are sensors drivers where the
gain codes interval has been linearized and made continuous to make it
easier for userspace to control it. I tried to dig it out an example,
but so far memory is failing me...

Does this answer your question or have I misinterpreted it ?

When it comes to gain vs analogue gain, it should be clarified if
OV2680_REG_GAIN_PK only controls the analogue gain amplification or
also the digital gain part. I don't have a datasheet so I can't help
much there....

Also see afa4805799c1 ("media: ov5640: Fix analogue gain control") as an
example for a driver being ported from GAIN to ANALOGUE_GAIN (so far
nobody complained, so I presume this doesn't count as a regression :)

>
> Any hints on how to do this ? Also are there any docs on
> how a driver should implement V4L2_CID_ANALOGUE_GAIN wrt range?
>
> E.g. is the driver expected do to some conversion of values
> to make the control always set a specific amplification for
> a specific value?
>
> Regards,
>
> Hans
>
>
>
> >
> >>
> >> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/media/i2c/ov2680.c | 9 +++++++--
> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> >> index 6591ce3b9244..e26a6487d421 100644
> >> --- a/drivers/media/i2c/ov2680.c
> >> +++ b/drivers/media/i2c/ov2680.c
> >> @@ -81,6 +81,9 @@
> >>  /* If possible send 16 extra rows / lines to the ISP as padding */
> >>  #define OV2680_END_MARGIN			16
> >>
> >> +/* Max exposure time is VTS - 8 */
> >> +#define OV2680_INTEGRATION_TIME_MARGIN		8
> >> +
> >>  #define OV2680_DEFAULT_WIDTH			800
> >>  #define OV2680_DEFAULT_HEIGHT			600
> >>
> >> @@ -823,6 +826,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
> >>  	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
> >>  	struct ov2680_ctrls *ctrls = &sensor->ctrls;
> >>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> >> +	int exp_max = OV2680_LINES_PER_FRAME - OV2680_INTEGRATION_TIME_MARGIN;
> >>  	int ret = 0;
> >>
> >>  	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
> >> @@ -849,9 +853,10 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
> >>  					0, 0, test_pattern_menu);
> >>
> >>  	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
> >> -					    0, 32767, 1, 0);
> >> +					    0, exp_max, 1, exp_max);
> >>
> >> -	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 2047, 1, 0);
> >> +	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN,
> >> +					0, 1023, 1, 250);
> >>
> >>  	if (hdl->error) {
> >>  		ret = hdl->error;
> >> --
> >> 2.41.0
> >>
> >
>
