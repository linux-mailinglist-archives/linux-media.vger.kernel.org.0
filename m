Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96129688996
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 23:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbjBBWOd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 17:14:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjBBWOc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 17:14:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373D113D68
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 14:14:31 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1AB9505;
        Thu,  2 Feb 2023 23:14:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675376069;
        bh=S7x/E9OAi/y1l8gburkKSl8gxHrhxLveTNimrP//0NE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P+WWEtx7zSIZC+W1+Saey6MQSGzBzP+jjfiWRI9EDmpsL+KGGl7fuUOFzBJfsH2tb
         j1Y6GieGv38r2eVmK3uJKzvIV6INJZtxucFhUXDTLdGTaQTAeacV/sqzZrxcyY70o6
         +ZEAN6HEJbjrfIsW41IlAHsiId2Gw9QeBllLQndI=
Date:   Fri, 3 Feb 2023 00:14:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 07/11] media: i2c: imx290: Convert V4L2_CID_HBLANK to
 read/write
Message-ID: <Y9w1wjBA+Vs1wF65@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-8-dave.stevenson@raspberrypi.com>
 <Y9vPo0UHCCx99LpX@pendragon.ideasonboard.com>
 <CAPY8ntDh9PtR1ariYH2ObnHqPjJ8gCqLoxuxCMmNYnvQVrEKZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntDh9PtR1ariYH2ObnHqPjJ8gCqLoxuxCMmNYnvQVrEKZQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Thu, Feb 02, 2023 at 03:48:19PM +0000, Dave Stevenson wrote:
> On Thu, 2 Feb 2023 at 14:58, Laurent Pinchart wrote:
> > On Tue, Jan 31, 2023 at 07:20:12PM +0000, Dave Stevenson wrote:
> > > The driver exposed V4L2_CID_HBLANK as a read only control to allow
> > > for exposure calculations and determination of the frame rate.
> > >
> > > Convert to a read/write control so that the frame rate can be
> > > controlled.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/media/i2c/imx290.c | 33 +++++++++++++++++++--------------
> > >  1 file changed, 19 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 9ddd6382b127..9006be6e5e7c 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -47,6 +47,7 @@
> > >  #define IMX290_GAIN                                  IMX290_REG_8BIT(0x3014)
> > >  #define IMX290_VMAX                                  IMX290_REG_24BIT(0x3018)
> > >  #define IMX290_HMAX                                  IMX290_REG_16BIT(0x301c)
> > > +#define IMX290_HMAX_MAX                                      0xffff
> > >  #define IMX290_SHS1                                  IMX290_REG_24BIT(0x3020)
> > >  #define IMX290_WINWV_OB                                      IMX290_REG_8BIT(0x303a)
> > >  #define IMX290_WINPV                                 IMX290_REG_16BIT(0x303c)
> > > @@ -167,7 +168,7 @@ struct imx290_regval {
> > >  struct imx290_mode {
> > >       u32 width;
> > >       u32 height;
> > > -     u32 hmax;
> > > +     u32 hmax_min;
> > >       u8 link_freq_index;
> > >
> > >       const struct imx290_regval *data;
> > > @@ -410,7 +411,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
> > >       {
> > >               .width = 1920,
> > >               .height = 1080,
> > > -             .hmax = 2200,
> > > +             .hmax_min = 2200,
> >
> > I didn't find in the documentation a mention that these values are the
> > minimum the sensor supports. Did you use them as such based on the fact
> > that anything higher than the nominal hblank value reported by the
> > datasheet is hopefully guaranteed to work, and lower values are
> > uncharted territory, or are these the real minimums ? I'm fine using
> > them as minimum for now even if we could possibly go lower, leaving that
> > for future patches. I would however mention this in a comment or in the
> > commit message.
> 
> The datasheet shows varying HMAX to control frame rate.
> Table "List of Setting Register for CSI-2 serial output" for all-pixel
> mode gives HMAX values of :
> 0x14a0 for 25fps
> 0x1130 for 30fps
> 0x0a50 for 50fps
> 0x0898 for 60 fps
> 0x0528 for 100fps (needs FRSEL = 0 and higher link frequency)
> 0x044c for 120fps (ditto)
> 
> VMAX is fixed at 0x465 (1125 decimal) for all frame rates in all-pixel
> (1080p) mode.
> 
> The 2200 listed here is the 0x898 for 60fps - the nominal max with the
> configured lane / link frequency combinations.
> 
> Doing the maths, 4 lanes at 445.5Mbit/s/lane = 1782Mbit/s.
> 2200 * 1125 * 12bpp * 60fps = 1782Mbit/s. Pixel clock is therefore the
> same as link bandwidth at this point. I have no information about
> blanking and clock lane behaviour for this sensor, but can believe
> that it needs that time for low level CSI2 transitions.
> 
> AIUI you'll only be able to decrease this further if you add support
> for 891Mbit/s/lane (445.5MHz link freq) on 4 lanes, and drop to 10 bit
> readout. Programming HMAX also then becomes more entertaining as it
> appears to be half the expected value (0x44c = 1100 decimal, which is
> smaller than the width), so it'll need a fair amount of messing to get
> all the controls to behave as expected.
> That's all outside the scope of this patch set - 60fps was the only
> frame rate previously supported, and we've expanded on that with
> slower frame rate support.

I'm totally fine with that. Thanks for the explanation.

> FWIW I have checked with Sony over the 120fps modes, and experimented a little.
> Sony will only support 120fps in 10bit. The flyer for IMX462 that
> implies it does 1920x1080@120fps in 12 bit mode is incorrect.
> Experimentation had 720p120 working in 12bit, but trying to work
> through limiting the various bit depth and resolution options is going
> to get really ugly in the driver.

Let's enjoy the beauty of your patch set today and leave the ugliness
for tomorrow :-)

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > >               .link_freq_index = FREQ_INDEX_1080P,
> > >               .data = imx290_1080p_settings,
> > >               .data_size = ARRAY_SIZE(imx290_1080p_settings),
> > > @@ -418,7 +419,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
> > >       {
> > >               .width = 1280,
> > >               .height = 720,
> > > -             .hmax = 3300,
> > > +             .hmax_min = 3300,
> > >               .link_freq_index = FREQ_INDEX_720P,
> > >               .data = imx290_720p_settings,
> > >               .data_size = ARRAY_SIZE(imx290_720p_settings),
> > > @@ -429,7 +430,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
> > >       {
> > >               .width = 1920,
> > >               .height = 1080,
> > > -             .hmax = 2200,
> > > +             .hmax_min = 2200,
> > >               .link_freq_index = FREQ_INDEX_1080P,
> > >               .data = imx290_1080p_settings,
> > >               .data_size = ARRAY_SIZE(imx290_1080p_settings),
> > > @@ -437,7 +438,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
> > >       {
> > >               .width = 1280,
> > >               .height = 720,
> > > -             .hmax = 3300,
> > > +             .hmax_min = 3300,
> > >               .link_freq_index = FREQ_INDEX_720P,
> > >               .data = imx290_720p_settings,
> > >               .data_size = ARRAY_SIZE(imx290_720p_settings),
> > > @@ -686,6 +687,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> > >               }
> > >               break;
> > >
> > > +     case V4L2_CID_HBLANK:
> > > +             ret = imx290_write(imx290, IMX290_HMAX,
> > > +                                ctrl->val + imx290->current_mode->width,
> > > +                                NULL);
> > > +             break;
> > > +
> > >       default:
> > >               ret = -EINVAL;
> > >               break;
> > > @@ -716,12 +723,14 @@ static void imx290_ctrl_update(struct imx290 *imx290,
> > >                              const struct v4l2_mbus_framefmt *format,
> > >                              const struct imx290_mode *mode)
> > >  {
> > > -     unsigned int hblank = mode->hmax - mode->width;
> > > +     unsigned int hblank_min = mode->hmax_min - mode->width;
> > > +     unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
> > >       unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> > >
> > >       __v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
> > >
> > > -     __v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
> > > +     __v4l2_ctrl_modify_range(imx290->hblank, hblank_min, hblank_max, 1,
> > > +                              hblank_min);
> > >       __v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> > >  }
> > >
> > > @@ -778,10 +787,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > >                                    ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> > >                                    0, 0, imx290_test_pattern_menu);
> > >
> > > +     /*
> > > +      * Actual range will be set from imx290_ctrl_update later in the probe.
> > > +      */
> > >       imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > >                                          V4L2_CID_HBLANK, 1, 1, 1, 1);
> > > -     if (imx290->hblank)
> > > -             imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > >
> > >       imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > >                                          V4L2_CID_VBLANK, 1, 1, 1, 1);
> > > @@ -850,11 +860,6 @@ static int imx290_start_streaming(struct imx290 *imx290,
> > >               return ret;
> > >       }
> > >
> > > -     ret = imx290_write(imx290, IMX290_HMAX, imx290->current_mode->hmax,
> > > -                        NULL);
> > > -     if (ret)
> > > -             return ret;
> > > -
> > >       /* Apply customized values from user */
> > >       ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
> > >       if (ret) {

-- 
Regards,

Laurent Pinchart
