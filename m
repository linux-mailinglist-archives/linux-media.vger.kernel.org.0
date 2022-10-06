Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF8AA5F656E
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 13:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbiJFLyB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 07:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbiJFLx7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 07:53:59 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3589B9DDB8
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 04:53:55 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 5BBF3C0012;
        Thu,  6 Oct 2022 11:53:53 +0000 (UTC)
Date:   Thu, 6 Oct 2022 13:53:51 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 12/16] media: i2c: ov9282: Make V4L2_CID_HBLANK r/w
Message-ID: <20221006115351.2c7o7xqwl252xtp7@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-13-dave.stevenson@raspberrypi.com>
 <20221006094108.x3ey5cae4cc6cac2@uno.localdomain>
 <CAPY8ntCEoEn4J9-gqMwH6L+48DT8fWjnxiBYkjmpzDAn0qcg5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCEoEn4J9-gqMwH6L+48DT8fWjnxiBYkjmpzDAn0qcg5w@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Thu, Oct 06, 2022 at 12:33:01PM +0100, Dave Stevenson wrote:
> Hi Jacopo.
>
> On Thu, 6 Oct 2022 at 10:41, Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Hi Dave
> >
> > On Wed, Oct 05, 2022 at 04:28:05PM +0100, Dave Stevenson wrote:
> > > There's no reason why HBLANK has to be read-only as it
> > > only changes the TIMING_HTS register in the sensor.
> > >
> > > Remove the READ_ONLY flag, and add the relevant handling
> > > for it.
> > >
> > > The minimum value also varies based on whether continuous clock
> > > mode is being used or not, so allow hblank_min to depend on
> > > that.
> >
> > Interesting, do you know why they're different and why the continous
> > version is smaller ?
>
> Dropping from HS to LP-11 and back to HS for non-continuous mode takes
> a minimum amount of time, so the time per line on the MIPI bus is
> increased. Whilst there is a FIFO between the pixel array and MIPI
> block, having to expend that time on the MIPI side means that the FIFO
> can overflow.
>
> I haven't found this behaviour documented, but I was trying to work
> out the difference between this driver and our downstream driver [1]
> in max frame rate. The default value for TIMING_HTS of 0x2d8 (doubled
> to 1456 pixels) didn't work with this mainline driver, and it used
> 0x2fd (1530 pixels). The CSI clock mode turned out to be the
> difference.
> The minimum HTS has therefore been left alone for non-continuous clock
> mode, and the lower setting added for continuous clock.
>

Makes sense! Thanks for the explanation

Please add my tag to v2
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

>   Dave
>
> [1] https://github.com/raspberrypi/linux/blob/rpi-5.15.y/drivers/media/i2c/ov9281.c
> based on https://github.com/rockchip-linux/kernel/blob/develop-4.4/drivers/media/i2c/ov9281.c
>
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/media/i2c/ov9282.c | 34 +++++++++++++++++++++-------------
> > >  1 file changed, 21 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > index 12cbe401fd78..8e86aa7e4b2a 100644
> > > --- a/drivers/media/i2c/ov9282.c
> > > +++ b/drivers/media/i2c/ov9282.c
> > > @@ -22,6 +22,9 @@
> > >  #define OV9282_MODE_STANDBY  0x00
> > >  #define OV9282_MODE_STREAMING        0x01
> > >
> > > +#define OV9282_REG_TIMING_HTS        0x380c
> > > +#define OV9282_TIMING_HTS_MAX        0x7fff
> > > +
> > >  /* Lines per frame */
> > >  #define OV9282_REG_LPFR              0x380e
> > >
> > > @@ -99,7 +102,8 @@ struct ov9282_reg_list {
> > >   * struct ov9282_mode - ov9282 sensor mode structure
> > >   * @width: Frame width
> > >   * @height: Frame height
> > > - * @hblank: Horizontal blanking in lines
> > > + * @hblank_min: Minimum horizontal blanking in lines for non-continuous[0] and
> > > + *           continuous[1] clock modes
> > >   * @vblank: Vertical blanking in lines
> > >   * @vblank_min: Minimum vertical blanking in lines
> > >   * @vblank_max: Maximum vertical blanking in lines
> > > @@ -109,7 +113,7 @@ struct ov9282_reg_list {
> > >  struct ov9282_mode {
> > >       u32 width;
> > >       u32 height;
> > > -     u32 hblank;
> > > +     u32 hblank_min[2];
> > >       u32 vblank;
> > >       u32 vblank_min;
> > >       u32 vblank_max;
> > > @@ -249,8 +253,6 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
> > >       {0x3809, 0x00},
> > >       {0x380a, 0x02},
> > >       {0x380b, 0xd0},
> > > -     {0x380c, 0x02},
> > > -     {0x380d, 0xfd},
> > >       {0x3810, 0x00},
> > >       {0x3811, 0x08},
> > >       {0x3812, 0x00},
> > > @@ -273,7 +275,7 @@ static const struct ov9282_mode supported_modes[] = {
> > >       {
> > >               .width = 1280,
> > >               .height = 720,
> > > -             .hblank = 250,
> > > +             .hblank_min = { 250, 176 },
> > >               .vblank = 1022,
> > >               .vblank_min = 41,
> > >               .vblank_max = 51540,
> > > @@ -399,15 +401,17 @@ static int ov9282_write_regs(struct ov9282 *ov9282,
> > >  static int ov9282_update_controls(struct ov9282 *ov9282,
> > >                                 const struct ov9282_mode *mode)
> > >  {
> > > +     u32 hblank_min;
> > >       int ret;
> > >
> > >       ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode->link_freq_idx);
> > >       if (ret)
> > >               return ret;
> > >
> > > -     ret = __v4l2_ctrl_s_ctrl(ov9282->hblank_ctrl, mode->hblank);
> > > -     if (ret)
> > > -             return ret;
> > > +     hblank_min = mode->hblank_min[ov9282->noncontinuous_clock ? 0 : 1];
> > > +     ret =  __v4l2_ctrl_modify_range(ov9282->hblank_ctrl, hblank_min,
> > > +                                     OV9282_TIMING_HTS_MAX - mode->width, 1,
> > > +                                     hblank_min);
> > >
> > >       return __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
> > >                                       mode->vblank_max, 1, mode->vblank);
> > > @@ -539,6 +543,10 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> > >       case V4L2_CID_VFLIP:
> > >               ret = ov9282_set_ctrl_vflip(ov9282, ctrl->val);
> > >               break;
> > > +     case V4L2_CID_HBLANK:
> > > +             ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
> > > +                                    (ctrl->val + ov9282->cur_mode->width) >> 1);
> > > +             break;
> > >       default:
> > >               dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> > >               ret = -EINVAL;
> > > @@ -1033,6 +1041,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> > >       struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
> > >       const struct ov9282_mode *mode = ov9282->cur_mode;
> > >       struct v4l2_fwnode_device_properties props;
> > > +     u32 hblank_min;
> > >       u32 lpfr;
> > >       int ret;
> > >
> > > @@ -1091,14 +1100,13 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> > >       if (ov9282->link_freq_ctrl)
> > >               ov9282->link_freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > >
> > > +     hblank_min = mode->hblank_min[ov9282->noncontinuous_clock ? 0 : 1];
> > >       ov9282->hblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> > >                                               &ov9282_ctrl_ops,
> > >                                               V4L2_CID_HBLANK,
> > > -                                             OV9282_REG_MIN,
> > > -                                             OV9282_REG_MAX,
> > > -                                             1, mode->hblank);
> > > -     if (ov9282->hblank_ctrl)
> > > -             ov9282->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +                                             hblank_min,
> > > +                                             OV9282_TIMING_HTS_MAX - mode->width,
> > > +                                             1, hblank_min);
> > >
> > >       ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> > >       if (!ret) {
> > > --
> > > 2.34.1
> > >
