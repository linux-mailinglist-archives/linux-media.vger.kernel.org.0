Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6C0C5F6A38
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 17:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiJFPGB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 11:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbiJFPGA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 11:06:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398E576444
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 08:05:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6803A1C;
        Thu,  6 Oct 2022 17:05:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665068757;
        bh=B8gkRY+ajm/+GRyWIaykomsmI0ebC1Bn1IQKoR6vuB4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IbvQh+SmczTuVIz85Mvz9sgbkLuHzzjJeL+P8cd0xAiIGq/VNnqAGuCynCOgaPx52
         huLW032fHSX5Iyff1PTUjqFzDz0trtH/D0YjjunOv2nmyPVa+2IAIk0+T68blCtBgM
         Pt8RS55djGWvU8AM7DQ4FZKanCq0ShegZ0ZpEc1Y=
Date:   Thu, 6 Oct 2022 18:05:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <Yz7u0LT2kwhyhc8x@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-3-jacopo@jmondi.org>
 <CAPY8ntB48837t+UN_6k5DJ6QBJvgz0Ohc4w4=7044amrdCy1=A@mail.gmail.com>
 <20221006150015.7p7qlab4dbaldnsg@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006150015.7p7qlab4dbaldnsg@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Thu, Oct 06, 2022 at 05:00:15PM +0200, Jacopo Mondi wrote:
> On Thu, Oct 06, 2022 at 03:44:54PM +0100, Dave Stevenson wrote:
> > On Wed, 5 Oct 2022 at 20:07, Jacopo Mondi wrote:
> > >
> > > Add support for V4L2_CID_ANALOG_GAIN. The control programs the global
> > > gain register which applies to all color channels.
> > >
> > > As both the global digital and analog gains are controlled through a
> > > single register, in order not to overwrite the configured digital gain
> > > we need to read the current register value before modifying it.
> > >
> > > Implement a function to read register values and use it before applying
> > > the new analog gain.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/i2c/ar0521.c | 64 ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 64 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > > index 89f3c01f18ce..581f5e42994d 100644
> > > --- a/drivers/media/i2c/ar0521.c
> > > +++ b/drivers/media/i2c/ar0521.c
> > > @@ -5,6 +5,8 @@
> > >   * Written by Krzysztof Hałasa
> > >   */
> > >
> > > +#include <asm/unaligned.h>
> > > +
> > >  #include <linux/clk.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/pm_runtime.h>
> > > @@ -35,6 +37,11 @@
> > >  #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
> > >  #define AR0521_TOTAL_WIDTH_MIN      2968u
> > >
> > > +#define AR0521_ANA_GAIN_MIN            0x00
> > > +#define AR0521_ANA_GAIN_MAX            0x3f
> > > +#define AR0521_ANA_GAIN_STEP           0x01
> > > +#define AR0521_ANA_GAIN_DEFAULT                0x00
> > > +
> > >  /* AR0521 registers */
> > >  #define AR0521_REG_VT_PIX_CLK_DIV              0x0300
> > >  #define AR0521_REG_FRAME_LENGTH_LINES          0x0340
> > > @@ -55,6 +62,7 @@
> > >  #define AR0521_REG_RED_GAIN                    0x305A
> > >  #define AR0521_REG_GREEN2_GAIN                 0x305C
> > >  #define AR0521_REG_GLOBAL_GAIN                 0x305E
> > > +#define AR0521_REG_GLOBAL_GAIN_ANA_MASK                0x3f
> > >
> > >  #define AR0521_REG_HISPI_TEST_MODE             0x3066
> > >  #define AR0521_REG_HISPI_TEST_MODE_LP11                  0x0004
> > > @@ -77,6 +85,7 @@ static const char * const ar0521_supply_names[] = {
> > >
> > >  struct ar0521_ctrls {
> > >         struct v4l2_ctrl_handler handler;
> > > +       struct v4l2_ctrl *ana_gain;
> > >         struct {
> > >                 struct v4l2_ctrl *gain;
> > >                 struct v4l2_ctrl *red_balance;
> > > @@ -167,6 +176,36 @@ static int ar0521_write_reg(struct ar0521_dev *sensor, u16 reg, u16 val)
> > >         return ar0521_write_regs(sensor, buf, 2);
> > >  }
> > >
> > > +static int ar0521_read_reg(struct ar0521_dev *sensor, u16 reg, u16 *val)
> > > +{
> > > +       struct i2c_client *client = sensor->i2c_client;
> > > +       unsigned char buf[2];
> > > +       struct i2c_msg msg;
> > > +       int ret;
> > > +
> > > +       msg.addr = client->addr;
> > > +       msg.flags = client->flags;
> > > +       msg.len = sizeof(u16);
> > > +       msg.buf = buf;
> > > +       put_unaligned_be16(reg, buf);
> > > +
> > > +       ret = i2c_transfer(client->adapter, &msg, 1);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       msg.len = sizeof(u16);
> > > +       msg.flags = client->flags | I2C_M_RD;
> > > +       msg.buf = buf;
> > > +
> > > +       ret = i2c_transfer(client->adapter, &msg, 1);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       *val = get_unaligned_be16(buf);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static int ar0521_set_geometry(struct ar0521_dev *sensor)
> > >  {
> > >         /* All dimensions are unsigned 12-bit integers */
> > > @@ -187,6 +226,21 @@ static int ar0521_set_geometry(struct ar0521_dev *sensor)
> > >         return ar0521_write_regs(sensor, regs, ARRAY_SIZE(regs));
> > >  }
> > >
> > > +static int ar0521_set_analog_gain(struct ar0521_dev *sensor)
> > > +{
> > > +       u16 global_gain;
> > > +       int ret;
> > > +
> > > +       ret = ar0521_read_reg(sensor, AR0521_REG_GLOBAL_GAIN, &global_gain);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       global_gain &= ~AR0521_REG_GLOBAL_GAIN_ANA_MASK;
> > > +       global_gain |= sensor->ctrls.ana_gain->val & AR0521_REG_GLOBAL_GAIN_ANA_MASK;
> > > +
> > > +       return ar0521_write_reg(sensor, AR0521_REG_GLOBAL_GAIN, global_gain);
> >
> > Does this work without nasty interactions?
> 
> It seems so :)
> 
> > The register reference I have says that the bits 6:0 of 0x3056,
> > 0x3058, 0x305a, 0x305c, and 0x305e are all aliased to register 0x3056.
> > That means that the writes from ar0521_set_gains for GAIN,
> > RED_BALANCE, and BLUE_BALANCE will stomp over your ANALOGUE_GAIN.
> 
> but you're right the interactions between the registers are not 100%
> clear to me yet.
> 
> The fact is that libcamera only manipulates ANALOGUE_GAIN while the
> other gains are not changed. I guess if one wants to manipulate the
> single gains individually this is possible, but when setting the
> global gain they will be overwritten ? This seems to be confirmed from
> my experiments where changing the BLUE/RED gains has no visible
> effects on the image as libcamera constantly adjusts the global gain

I'm tempted to drop support for the colour gains really, and turn the
V4L2_CID_GAIN into V4L2_CID_DIGITAL_GAIN. Digital colour gains can still
be useful on platforms that have no ISP, but I think we need an array of
gains in that case, not abusing V4L2_CID_RED_BALANCE and
V4L2_CID_BLUE_BALANCE. Any objection ?

> > I also don't see a call to __v4l2_ctrl_handler_setup from
> > ar0521_set_stream, so whilst there is an explicit call to
> > ar0521_set_gains, ANALOGUE_GAIN won't be set.
>
> See [PATCH 08/10] media: ar0521: Setup controls at s_stream time
> later in the series :)
> 
> > [1] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ar0521.c#L190
> >
> > > +}
> > > +
> > >  static int ar0521_set_gains(struct ar0521_dev *sensor)
> > >  {
> > >         int green = sensor->ctrls.gain->val;
> > > @@ -456,6 +510,9 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
> > >         case V4L2_CID_VBLANK:
> > >                 ret = ar0521_set_geometry(sensor);
> > >                 break;
> > > +       case V4L2_CID_ANALOGUE_GAIN:
> > > +               ret = ar0521_set_analog_gain(sensor);
> > > +               break;
> > >         case V4L2_CID_GAIN:
> > >         case V4L2_CID_RED_BALANCE:
> > >         case V4L2_CID_BLUE_BALANCE:
> > > @@ -499,6 +556,13 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
> > >         /* We can use our own mutex for the ctrl lock */
> > >         hdl->lock = &sensor->lock;
> > >
> > > +       /* Analog gain */
> > > +       ctrls->ana_gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
> > > +                                           AR0521_ANA_GAIN_MIN,
> > > +                                           AR0521_ANA_GAIN_MAX,
> > > +                                           AR0521_ANA_GAIN_STEP,
> > > +                                           AR0521_ANA_GAIN_DEFAULT);
> > > +
> > >         /* Manual gain */
> > >         ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 511, 1, 0);
> > >         ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_RED_BALANCE,

-- 
Regards,

Laurent Pinchart
