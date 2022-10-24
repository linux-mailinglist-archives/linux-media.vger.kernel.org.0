Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B60260ADDA
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 16:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiJXOhN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 10:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234553AbiJXOgg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 10:36:36 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008FAE09F8
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 06:12:00 -0700 (PDT)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 76C98CADBF
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 12:32:36 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 088FCE0009;
        Mon, 24 Oct 2022 12:31:06 +0000 (UTC)
Date:   Mon, 24 Oct 2022 14:31:05 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <20221024123105.fgqu4g44luauhza6@uno.localdomain>
References: <20221022092015.208592-1-jacopo@jmondi.org>
 <20221022092015.208592-3-jacopo@jmondi.org>
 <CAPY8ntCxsZwVqNzQpA-TBbdJ6zmd_cZgrcVqm5b31ngF-CiH7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCxsZwVqNzQpA-TBbdJ6zmd_cZgrcVqm5b31ngF-CiH7w@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Mon, Oct 24, 2022 at 01:13:58PM +0100, Dave Stevenson wrote:
> Hi Jacopo
>
> On Sat, 22 Oct 2022 at 11:47, Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Add support for V4L2_CID_ANALOG_GAIN. The control programs the global
> > gain register which applies to all color channels.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ar0521.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > index 0daa61df2603..ba169f0218a9 100644
> > --- a/drivers/media/i2c/ar0521.c
> > +++ b/drivers/media/i2c/ar0521.c
> > @@ -35,6 +35,11 @@
> >  #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
> >  #define AR0521_TOTAL_WIDTH_MIN      2968u
> >
> > +#define AR0521_ANA_GAIN_MIN            0x00
> > +#define AR0521_ANA_GAIN_MAX            0x3f
>
> The register reference I have says it is u3.4 format, which would make
> the max value 0x7f rather than 0x3f.
>
> Functionally it makes no real difference, but a max gain of nearly x7
> 15/16ths  is preferable to nearly x3 15/16ths.
>
> If it is u3.4 I'd have expected the minimum to be 0x10 to avoid a gain
> of less than x1 (does it even work?)
>

The value of the 0x3280 register is written in the 7 low bits of the
0x305e register. Whatever is written to 0x305e is similalrly reflected
in the 0x3280 one. The 0x305e[6:4] bits are the coarse analog gain
value and the lower 4 bits are the fine analog gain value. I wonder if
u3.4 is used there to describe the that, even if u3.4 has a different
meaning

> Looking at the listed m0, c0, m1, c1 values for gain (1, 0, 0, and 4
> respectively), that maps to a formula:
> gain = code / 4
> Min and max codes are 0 and 0x1f, so that implies it will do a gain of
> less than x1, and goes up to x7.75.

The sensor does not use the CCS gain model, but an exponential
piecewise function documented as a table of register values/gains in
the application manual.

The sensor exposes a list of CCS-compatible registers, including
"0x0204 analogue_gain_code_global", from which I presume one should
contorl the gain if the CCS compatible model works. From my tests,
writing to that register is a no-op.

I presume the CCS compatible interface is not plumbed, or maybe it
depdends on the FW version, or else :)

>
> So much contradictory information!!
>

Yes :)

> I'm happy to add a R-B tag for the code side, but the limits seem to
> be a little all over the place. I'd be looking at taking some test
> images with fixed exposure time at each gain code to work out what
> value is actually x1, x2, x4, etc. Doing so does require knowing the
> black level and applying an appropriate correction to the raw values,
> or extrapolating from the results.
>
>   Dave
>
> > +#define AR0521_ANA_GAIN_STEP           0x01
> > +#define AR0521_ANA_GAIN_DEFAULT                0x00
> > +
> >  /* AR0521 registers */
> >  #define AR0521_REG_VT_PIX_CLK_DIV              0x0300
> >  #define AR0521_REG_FRAME_LENGTH_LINES          0x0340
> > @@ -50,6 +55,8 @@
> >  #define   AR0521_REG_RESET_RESTART               BIT(1)
> >  #define   AR0521_REG_RESET_INIT                          BIT(0)
> >
> > +#define AR0521_REG_ANA_GAIN_CODE_GLOBAL                0x3028
> > +
> >  #define AR0521_REG_GREEN1_GAIN                 0x3056
> >  #define AR0521_REG_BLUE_GAIN                   0x3058
> >  #define AR0521_REG_RED_GAIN                    0x305A
> > @@ -456,6 +463,10 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
> >         case V4L2_CID_VBLANK:
> >                 ret = ar0521_set_geometry(sensor);
> >                 break;
> > +       case V4L2_CID_ANALOGUE_GAIN:
> > +               ret = ar0521_write_reg(sensor, AR0521_REG_ANA_GAIN_CODE_GLOBAL,
> > +                                      ctrl->val);
> > +               break;
> >         case V4L2_CID_GAIN:
> >         case V4L2_CID_RED_BALANCE:
> >         case V4L2_CID_BLUE_BALANCE:
> > @@ -499,6 +510,11 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
> >         /* We can use our own mutex for the ctrl lock */
> >         hdl->lock = &sensor->lock;
> >
> > +       /* Analog gain */
> > +       v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
> > +                         AR0521_ANA_GAIN_MIN, AR0521_ANA_GAIN_MAX,
> > +                         AR0521_ANA_GAIN_STEP, AR0521_ANA_GAIN_DEFAULT);
> > +
> >         /* Manual gain */
> >         ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 511, 1, 0);
> >         ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_RED_BALANCE,
> > --
> > 2.37.3
> >
