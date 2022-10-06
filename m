Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044FB5F653D
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 13:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiJFLdW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 07:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiJFLdW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 07:33:22 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7882980F
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 04:33:19 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id l22so2371791edj.5
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 04:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yGA9OHjceBcJqOYxyJ7ur7ZHF9Qta3hEwVJlmZRytNQ=;
        b=QzLxC03VzMzeJWVxK70LF20hhm06PhDSm/rHL3PiBx8xWoCGIqa1W5j1U6dpkdFHYS
         AgAe4HNNhLrAckHtpNE3Pqv6fiRlIGOiUM8B0T66XQK4X1QQ0aGJ23w4IqTbxT6ZmzcV
         67jnC254fLAycNtqJpDBWDD3ZUDJu5+cfJOH6XMUI0uWEBaOCdueJZ2YN52kM2xzXDsk
         hgvkYoDiH+t9hTzu63wnLVD836CGzdUUg3xazHcNIxatxmcPgAzcEXs2nhDWb7IAmRI7
         1/wvXpnLSyhisp/k8zxkEaymDB1W/1TjARJaiQqbX5FjkmON1imtrxXgWb6oGWMmeTdw
         QcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yGA9OHjceBcJqOYxyJ7ur7ZHF9Qta3hEwVJlmZRytNQ=;
        b=Bad+OeWBIm756vFYUlA33csQ8zDmBpCNVSU8WzsHfQfVc8aHCfVsAfJ1ioPXxhn73e
         MOsLx9MZlZ8Hb8gxBVcDvSNu/bDX59P3UeHMsxHMKGGIGFAvpDY7uxHC0bhXEaEVPVhX
         f6gC8t92BqJjWPK7ZnvWg0fd6ISUEWLx92DsB2y7OfaXKPyMrJTtRRzoMVjke4ZKQVOY
         9IrvbdvcL7zkcHJ1yFaazh+TipJIpDd1fO1MelW453x4btnf3/pVuu0RLDInp1KfCFtA
         SQJtPY3XpTYgLesuBeAHKiB12IqRzdQC02iRGgCoDzONVqJ/MILxsSNQtVeHjgVYCjpt
         z8Pg==
X-Gm-Message-State: ACrzQf3R8swKvxQ82Rw4LTSZRZUFrgx81lFK7CmTZkPK0whcOrifJhi4
        TkbE/vNLo+Cq4jsjTlL5fsBG8AnYoWfCV+B4xyuZmPXLI5Irdw==
X-Google-Smtp-Source: AMsMyM6pOd+RllqzbyhJ0kKMHWPkoVlr5pulzgDpDeRbTCR4YvpMw2tDqpxAYn4LTxkcSkLTQxvJ5uSdPN4P4kgvvxc=
X-Received: by 2002:a05:6402:3552:b0:451:2037:639e with SMTP id
 f18-20020a056402355200b004512037639emr4231175edd.136.1665055998151; Thu, 06
 Oct 2022 04:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-13-dave.stevenson@raspberrypi.com> <20221006094108.x3ey5cae4cc6cac2@uno.localdomain>
In-Reply-To: <20221006094108.x3ey5cae4cc6cac2@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 12:33:01 +0100
Message-ID: <CAPY8ntCEoEn4J9-gqMwH6L+48DT8fWjnxiBYkjmpzDAn0qcg5w@mail.gmail.com>
Subject: Re: [PATCH 12/16] media: i2c: ov9282: Make V4L2_CID_HBLANK r/w
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo.

On Thu, 6 Oct 2022 at 10:41, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Dave
>
> On Wed, Oct 05, 2022 at 04:28:05PM +0100, Dave Stevenson wrote:
> > There's no reason why HBLANK has to be read-only as it
> > only changes the TIMING_HTS register in the sensor.
> >
> > Remove the READ_ONLY flag, and add the relevant handling
> > for it.
> >
> > The minimum value also varies based on whether continuous clock
> > mode is being used or not, so allow hblank_min to depend on
> > that.
>
> Interesting, do you know why they're different and why the continous
> version is smaller ?

Dropping from HS to LP-11 and back to HS for non-continuous mode takes
a minimum amount of time, so the time per line on the MIPI bus is
increased. Whilst there is a FIFO between the pixel array and MIPI
block, having to expend that time on the MIPI side means that the FIFO
can overflow.

I haven't found this behaviour documented, but I was trying to work
out the difference between this driver and our downstream driver [1]
in max frame rate. The default value for TIMING_HTS of 0x2d8 (doubled
to 1456 pixels) didn't work with this mainline driver, and it used
0x2fd (1530 pixels). The CSI clock mode turned out to be the
difference.
The minimum HTS has therefore been left alone for non-continuous clock
mode, and the lower setting added for continuous clock.

  Dave

[1] https://github.com/raspberrypi/linux/blob/rpi-5.15.y/drivers/media/i2c/ov9281.c
based on https://github.com/rockchip-linux/kernel/blob/develop-4.4/drivers/media/i2c/ov9281.c

> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/ov9282.c | 34 +++++++++++++++++++++-------------
> >  1 file changed, 21 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 12cbe401fd78..8e86aa7e4b2a 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -22,6 +22,9 @@
> >  #define OV9282_MODE_STANDBY  0x00
> >  #define OV9282_MODE_STREAMING        0x01
> >
> > +#define OV9282_REG_TIMING_HTS        0x380c
> > +#define OV9282_TIMING_HTS_MAX        0x7fff
> > +
> >  /* Lines per frame */
> >  #define OV9282_REG_LPFR              0x380e
> >
> > @@ -99,7 +102,8 @@ struct ov9282_reg_list {
> >   * struct ov9282_mode - ov9282 sensor mode structure
> >   * @width: Frame width
> >   * @height: Frame height
> > - * @hblank: Horizontal blanking in lines
> > + * @hblank_min: Minimum horizontal blanking in lines for non-continuous[0] and
> > + *           continuous[1] clock modes
> >   * @vblank: Vertical blanking in lines
> >   * @vblank_min: Minimum vertical blanking in lines
> >   * @vblank_max: Maximum vertical blanking in lines
> > @@ -109,7 +113,7 @@ struct ov9282_reg_list {
> >  struct ov9282_mode {
> >       u32 width;
> >       u32 height;
> > -     u32 hblank;
> > +     u32 hblank_min[2];
> >       u32 vblank;
> >       u32 vblank_min;
> >       u32 vblank_max;
> > @@ -249,8 +253,6 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
> >       {0x3809, 0x00},
> >       {0x380a, 0x02},
> >       {0x380b, 0xd0},
> > -     {0x380c, 0x02},
> > -     {0x380d, 0xfd},
> >       {0x3810, 0x00},
> >       {0x3811, 0x08},
> >       {0x3812, 0x00},
> > @@ -273,7 +275,7 @@ static const struct ov9282_mode supported_modes[] = {
> >       {
> >               .width = 1280,
> >               .height = 720,
> > -             .hblank = 250,
> > +             .hblank_min = { 250, 176 },
> >               .vblank = 1022,
> >               .vblank_min = 41,
> >               .vblank_max = 51540,
> > @@ -399,15 +401,17 @@ static int ov9282_write_regs(struct ov9282 *ov9282,
> >  static int ov9282_update_controls(struct ov9282 *ov9282,
> >                                 const struct ov9282_mode *mode)
> >  {
> > +     u32 hblank_min;
> >       int ret;
> >
> >       ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode->link_freq_idx);
> >       if (ret)
> >               return ret;
> >
> > -     ret = __v4l2_ctrl_s_ctrl(ov9282->hblank_ctrl, mode->hblank);
> > -     if (ret)
> > -             return ret;
> > +     hblank_min = mode->hblank_min[ov9282->noncontinuous_clock ? 0 : 1];
> > +     ret =  __v4l2_ctrl_modify_range(ov9282->hblank_ctrl, hblank_min,
> > +                                     OV9282_TIMING_HTS_MAX - mode->width, 1,
> > +                                     hblank_min);
> >
> >       return __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
> >                                       mode->vblank_max, 1, mode->vblank);
> > @@ -539,6 +543,10 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >       case V4L2_CID_VFLIP:
> >               ret = ov9282_set_ctrl_vflip(ov9282, ctrl->val);
> >               break;
> > +     case V4L2_CID_HBLANK:
> > +             ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
> > +                                    (ctrl->val + ov9282->cur_mode->width) >> 1);
> > +             break;
> >       default:
> >               dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> >               ret = -EINVAL;
> > @@ -1033,6 +1041,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >       struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
> >       const struct ov9282_mode *mode = ov9282->cur_mode;
> >       struct v4l2_fwnode_device_properties props;
> > +     u32 hblank_min;
> >       u32 lpfr;
> >       int ret;
> >
> > @@ -1091,14 +1100,13 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >       if (ov9282->link_freq_ctrl)
> >               ov9282->link_freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >
> > +     hblank_min = mode->hblank_min[ov9282->noncontinuous_clock ? 0 : 1];
> >       ov9282->hblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> >                                               &ov9282_ctrl_ops,
> >                                               V4L2_CID_HBLANK,
> > -                                             OV9282_REG_MIN,
> > -                                             OV9282_REG_MAX,
> > -                                             1, mode->hblank);
> > -     if (ov9282->hblank_ctrl)
> > -             ov9282->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +                                             hblank_min,
> > +                                             OV9282_TIMING_HTS_MAX - mode->width,
> > +                                             1, hblank_min);
> >
> >       ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> >       if (!ret) {
> > --
> > 2.34.1
> >
