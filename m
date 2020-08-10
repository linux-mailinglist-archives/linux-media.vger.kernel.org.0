Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26098240384
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 10:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgHJIjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 04:39:25 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:36879 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgHJIjZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 04:39:25 -0400
X-Originating-IP: 82.52.18.94
Received: from uno.localdomain (host-82-52-18-94.retail.telecomitalia.it [82.52.18.94])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3B0194000C;
        Mon, 10 Aug 2020 08:39:14 +0000 (UTC)
Date:   Mon, 10 Aug 2020 10:42:57 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     paul.kocialkowski@bootlin.com,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] media: i2c: ov5640: Enable data pins on poweron
 for DVP mode
Message-ID: <20200810084257.6eypb6pumvtoo6pd@uno.localdomain>
References: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596465107-14251-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200806163054.vz7t7jgm4bapzkpq@uno.localdomain>
 <CA+V-a8tmnqRvmW1=55K7Za2DoxBR+4LD4oZMGfX14-WfBocokQ@mail.gmail.com>
 <20200807084606.oqw2vwmitblbmcft@uno.localdomain>
 <CA+V-a8v7fngYswCGnh5D6CONC1R1coHViGwa7wEHrazpGOKZMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8v7fngYswCGnh5D6CONC1R1coHViGwa7wEHrazpGOKZMg@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Mon, Aug 10, 2020 at 08:40:29AM +0100, Lad, Prabhakar wrote:
> Hi Jacopo,
>
> Thank you for the review.
>
> On Fri, Aug 7, 2020 at 9:42 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Hi Prabhakar,
> >    + Paul who is working with this chip on a parallel setup
> >
> > On Thu, Aug 06, 2020 at 05:38:57PM +0100, Lad, Prabhakar wrote:
> > > Hi Jacopo,
> > >
> > > Thank you for the review.
> > >
> > > On Thu, Aug 6, 2020 at 5:27 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> > > >
> > > > Hi Prabhakar,
> > > >
> > > > On Mon, Aug 03, 2020 at 03:31:45PM +0100, Lad Prabhakar wrote:
> > > > > During testing this sensor on iW-RainboW-G21D-Qseven platform in 8-bit DVP
> > > > > mode with rcar-vin bridge noticed the capture worked fine for the first run
> > > > > (with yavta), but for subsequent runs the bridge driver waited for the
> > > > > frame to be captured. Debugging further noticed the data lines were
> > > > > enabled/disabled in stream on/off callback and dumping the register
> > > > > contents 0x3017/0x3018 in ov5640_set_stream_dvp() reported the correct
> > > > > values, but yet frame capturing failed.
> > > >
> > > > That's pretty weird, I wonder if that's not an issue in the bridge, as
> > > > I expect someone tryed to capture more than 1 image in DVP mode with
> > > > this driver already.
> > > >
> > > I did try the bridge driver with an ov7725 sensor and it works fine in
> > > both the modes (DVP and BT656).
> > >
> > > > I didn't get from your commit message if you have been able to
> > > > identify where the issue is. You said register values are correct, but
> > > > did you try to plug a scope and see if data are actually put on the
> > > > bus ? Does this happen with full parallel too or BT.656 only ?
> > > >
> > > unfortunately I didn't scope the pins, but this issue happened in both
> > > the modes. And with this patch it improves handling the sensor in
> > > s_stream call.
> > >
> >
> > For the record, I tested this one with my CSI-2 setup and capture
> > still works as expected.
> >
> Thank you for testing this.
>
> > > Cheers,
> > > Prabhakar
> > >
> > > > >
> > > > > To get around this issue the following actions are performed for
> > > > > parallel mode (DVP):
> > > > > 1: Keeps the sensor in software power down mode and is woken up only in
> > > > >    ov5640_set_stream_dvp() callback.
> > > > > 2: Enables data lines in s_power callback
> > > > > 3: Configures HVP lines in s_power callback instead of configuring
> > > > >    everytime in ov5640_set_stream_dvp().
> > > > > 4: Disables MIPI interface.
> > > > >
> > > > > Fixes: f22996db44e2d ("media: ov5640: add support of DVP parallel interface")
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > >  drivers/media/i2c/ov5640.c | 321 ++++++++++++++++++++-----------------
> > > > >  1 file changed, 172 insertions(+), 149 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > > > index 2fe4a7ac0592..ec444bee2ce9 100644
> > > > > --- a/drivers/media/i2c/ov5640.c
> > > > > +++ b/drivers/media/i2c/ov5640.c
> > > > > @@ -94,6 +94,9 @@
> > > > >  #define OV5640_REG_SDE_CTRL5         0x5585
> > > > >  #define OV5640_REG_AVG_READOUT               0x56a1
> > > > >
> > > > > +#define OV5640_SOFTWARE_PWDN         0x42
> > > > > +#define OV5640_SOFTWARE_WAKEUP               0x02
> >
> > These two are bitmasks to apply to register 0x3008. I would place them
> > below the register definition and name them:
> >
> > #define OV5640_REG_SYS_CTRL0_SW_PWDN         0x42
> > #define OV5640_REG_SYS_CTRL0_SW_PWUP         0x02
> >
> > or even:
> > #define OV5640_REG_SYS_CTRL0_SW_POWER(on)    (0x2 | (on ? 0x40 : 0x00))
> >
> > Up to you, but I would keep them close to the register definition.
> >
> Agreed shall pick up the second option.
>

Thanks

> > > > > +
> > > > >  enum ov5640_mode_id {
> > > > >       OV5640_MODE_QCIF_176_144 = 0,
> > > > >       OV5640_MODE_QVGA_320_240,
> > > > > @@ -274,7 +277,7 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
> > > > >  /* YUV422 UYVY VGA@30fps */
> > > > >  static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
> > > > >       {0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
> > > > > -     {0x3103, 0x03, 0, 0}, {0x3017, 0x00, 0, 0}, {0x3018, 0x00, 0, 0},
> > > > > +     {0x3103, 0x03, 0, 0},
> > > > >       {0x3630, 0x36, 0, 0},
> >
> > Could you reflow this lines to not leave holes ?
> >
> Will do.
>

Thank you

> > > > >       {0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
> > > > >       {0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
> > > > > @@ -1120,6 +1123,11 @@ static int ov5640_load_regs(struct ov5640_dev *sensor,
> > > > >               val = regs->val;
> > > > >               mask = regs->mask;
> > > > >
> > > > > +             /* remain in power down mode for DVP */
> > > > > +             if (regs->reg_addr == OV5640_REG_SYS_CTRL0 && val == OV5640_SOFTWARE_WAKEUP &&
> > > > > +                 sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
> > > > > +                     continue;
> > > > > +
> >
> > I'm not yet convinced this is a good idea. This will cause the
> > ov5640_set_dvp() function to be called while the chip is still in
> > 'software power-down' mode. I tried to do the same for CSI-2 as well
> > and indeed I have LP-11 errors from the CSI-2 receiver, but then
> > capture works fine (puzzling! it might indicate that register values
> > as actually retained between software power up/down)
> >
> > This driver is such a mess I won't mind this 'special' dvp handling,
> > but it really puzzles me.
> >
> > From what I see here the bulk of this patch is about moving the
> > parallel bus configuration from s_stream() to s_power(), is this bit
> > here really required for that to work or is it a leftover ? Have you
> > tested it without the above hunk ?
> >
> Yes I have and it does work. but the idea behind this is to keep the
> sensor in powerdon mode all the time when nor streaming for DVP mode.
>

I see, thanks for testing

> > Paul, would you be able to test this series with your parallel setup
> > as well ?
> >
> > Also, if not strictly necessary, let's try to remain in the 80 cols limit.
> >
> OK.
>
> >
> > > > >               if (mask)
> > > > >                       ret = ov5640_mod_reg(sensor, reg_addr, mask, val);
> > > > >               else
> > > > > @@ -1210,96 +1218,8 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
> > > > >
> > > > >  static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
> > > > >  {
> > > > > -     int ret;
> > > > > -     unsigned int flags = sensor->ep.bus.parallel.flags;
> > > > > -     u8 pclk_pol = 0;
> > > > > -     u8 hsync_pol = 0;
> > > > > -     u8 vsync_pol = 0;
> > > > > -
> > > > > -     /*
> > > > > -      * Note about parallel port configuration.
> > > > > -      *
> > > > > -      * When configured in parallel mode, the OV5640 will
> > > > > -      * output 10 bits data on DVP data lines [9:0].
> > > > > -      * If only 8 bits data are wanted, the 8 bits data lines
> > > > > -      * of the camera interface must be physically connected
> > > > > -      * on the DVP data lines [9:2].
> > > > > -      *
> > > > > -      * Control lines polarity can be configured through
> > > > > -      * devicetree endpoint control lines properties.
> > > > > -      * If no endpoint control lines properties are set,
> > > > > -      * polarity will be as below:
> > > > > -      * - VSYNC:     active high
> > > > > -      * - HREF:      active low
> > > > > -      * - PCLK:      active low
> > > > > -      */
> > > > > -
> > > > > -     if (on) {
> > > > > -             /*
> > > > > -              * configure parallel port control lines polarity
> > > > > -              *
> > > > > -              * POLARITY CTRL0
> > > > > -              * - [5]:       PCLK polarity (0: active low, 1: active high)
> > > > > -              * - [1]:       HREF polarity (0: active low, 1: active high)
> > > > > -              * - [0]:       VSYNC polarity (mismatch here between
> > > > > -              *              datasheet and hardware, 0 is active high
> > > > > -              *              and 1 is active low...)
> > > > > -              */
> > > > > -             if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> > > > > -                     pclk_pol = 1;
> > > > > -             if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> > > > > -                     hsync_pol = 1;
> > > > > -             if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> > > > > -                     vsync_pol = 1;
> > > > > -
> > > > > -             ret = ov5640_write_reg(sensor,
> > > > > -                                    OV5640_REG_POLARITY_CTRL00,
> > > > > -                                    (pclk_pol << 5) |
> > > > > -                                    (hsync_pol << 1) |
> > > > > -                                    vsync_pol);
> > > > > -
> > > > > -             if (ret)
> > > > > -                     return ret;
> > > > > -     }
> > > > > -
> > > > > -     /*
> > > > > -      * powerdown MIPI TX/RX PHY & disable MIPI
> > > > > -      *
> > > > > -      * MIPI CONTROL 00
> > > > > -      * 4:    PWDN PHY TX
> > > > > -      * 3:    PWDN PHY RX
> > > > > -      * 2:    MIPI enable
> > > > > -      */
> > > > > -     ret = ov5640_write_reg(sensor,
> > > > > -                            OV5640_REG_IO_MIPI_CTRL00, on ? 0x18 : 0);
> > > > > -     if (ret)
> > > > > -             return ret;
> > > > > -
> > > > > -     /*
> > > > > -      * enable VSYNC/HREF/PCLK DVP control lines
> > > > > -      * & D[9:6] DVP data lines
> > > > > -      *
> > > > > -      * PAD OUTPUT ENABLE 01
> > > > > -      * - 6:         VSYNC output enable
> > > > > -      * - 5:         HREF output enable
> > > > > -      * - 4:         PCLK output enable
> > > > > -      * - [3:0]:     D[9:6] output enable
> > > > > -      */
> > > > > -     ret = ov5640_write_reg(sensor,
> > > > > -                            OV5640_REG_PAD_OUTPUT_ENABLE01,
> > > > > -                            on ? 0x7f : 0);
> > > > > -     if (ret)
> > > > > -             return ret;
> > > > > -
> > > > > -     /*
> > > > > -      * enable D[5:0] DVP data lines
> > > > > -      *
> > > > > -      * PAD OUTPUT ENABLE 02
> > > > > -      * - [7:2]:     D[5:0] output enable
> > > > > -      */
> > > > > -     return ov5640_write_reg(sensor,
> > > > > -                             OV5640_REG_PAD_OUTPUT_ENABLE02,
> > > > > -                             on ? 0xfc : 0);
> > > > > +     return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> > > > > +                             OV5640_SOFTWARE_WAKEUP : OV5640_SOFTWARE_PWDN);
> >
> > I'm surprised entering/exiting from what is called "Software power
> > down" in the chip manual retains the registers state!
> >
> In fact as part of the initial register sequence the sensor is put
> into power down mode, the required registers are set and then the
> sensor is woken up.
>

That's funny. So the 'software power down' mode retains the internal
volatile memory content I assume. Nice to know and thanks for digging!

> > > > >  }
> > > > >
> > > > >  static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
> > > > > @@ -2001,6 +1921,159 @@ static void ov5640_set_power_off(struct ov5640_dev *sensor)
> > > > >       clk_disable_unprepare(sensor->xclk);
> > > > >  }
> > > > >
> > > > > +static int ov5640_set_mipi(struct ov5640_dev *sensor, bool on)
> >
> > Maybe 'ov5640_set_power_mipi()' ? (same for dvp)
> >
> OK will replace it.
>

Thanks

> > > > > +{
> > > > > +     int ret = 0;
> > > > > +
> > > > > +     if (!on) {
> > > > > +             /* Reset MIPI bus settings to their default values. */
> > > > > +             ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
> > > > > +             ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x04);
> > > > > +             ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x00);
> > > > > +
> > > > > +             return ret;
> > > > > +     }
> >
> > I know this was there already, but I wonder if this is now necessary
> > (same for the DVP counterpart).
> >
> > We call this from the power up/down routine, if we get here with on=1
> > we are exiting from the chip powerdown mode and I expect registers to
> > be restored to their default values.
> >
> No waking up the sensor from power down mode doesnt restore the
> register to default values, infact it will retain the values which are
> already set to. Fyi I picked up the datasheet from [1]
>

Careful here, I now understand 'software power down' might retain the
configuration, but this is called by in the s_power() call chain,
which powers the chip up/down by enabling and disabling clocks and
regulator and resetting the chip (see ov5640_set_power_on() which is called
before this function).

I would really be surprised register values are retained after the
regulators have been shut off :)

> [1] http://e2e.ti.com/cfs-file.ashx/__key/communityserver-discussions-components-files/100/2604.OV7725_5F00_CSP2_5F00_DS-_2800_1_5B00_1_5D00_.31_2900_.pdf

Nice, but that's for ov7725 :)

Thanks
  j

>
> > > > > +
> > > > > +     /*
> > > > > +      * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
> > > > > +      *
> > > > > +      * 0x300e = 0x40
> > > > > +      * [7:5] = 010  : 2 data lanes mode (see FIXME note in
> > > > > +      *                "ov5640_set_stream_mipi()")
> > > > > +      * [4] = 0      : Power up MIPI HS Tx
> > > > > +      * [3] = 0      : Power up MIPI LS Rx
> > > > > +      * [2] = 0      : MIPI interface disabled
> > > > > +      */
> > > > > +     ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     /*
> > > > > +      * Gate clock and set LP11 in 'no packets mode' (idle)
> > > > > +      *
> > > > > +      * 0x4800 = 0x24
> > > > > +      * [5] = 1      : Gate clock when 'no packets'
> > > > > +      * [2] = 1      : MIPI bus in LP11 when 'no packets'
> > > > > +      */
> > > > > +     ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x24);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     /*
> > > > > +      * Set data lanes and clock in LP11 when 'sleeping'
> > > > > +      *
> > > > > +      * 0x3019 = 0x70
> > > > > +      * [6] = 1      : MIPI data lane 2 in LP11 when 'sleeping'
> > > > > +      * [5] = 1      : MIPI data lane 1 in LP11 when 'sleeping'
> > > > > +      * [4] = 1      : MIPI clock lane in LP11 when 'sleeping'
> > > > > +      */
> > > > > +     ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x70);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     /* Give lanes some time to coax into LP11 state. */
> > > > > +     usleep_range(500, 1000);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static int ov5640_set_dvp(struct ov5640_dev *sensor, bool on)
> > > > > +{
> > > > > +     unsigned int flags = sensor->ep.bus.parallel.flags;
> > > > > +     u8 pclk_pol = 0;
> > > > > +     u8 hsync_pol = 0;
> > > > > +     u8 vsync_pol = 0;
> > > > > +     int ret = 0;
> > > > > +
> > > > > +     if (!on) {
> > > > > +             /* Reset settings to their default values. */
> > > > > +             ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
> > > > > +             ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00, 0x20);
> > > > > +             ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x00);
> > > > > +             ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02, 0x00);
> > > > > +
> > > > > +             return ret;
> > > > > +     }
> > > > > +
> > > > > +     /*
> > > > > +      * Note about parallel port configuration.
> > > > > +      *
> > > > > +      * When configured in parallel mode, the OV5640 will
> > > > > +      * output 10 bits data on DVP data lines [9:0].
> > > > > +      * If only 8 bits data are wanted, the 8 bits data lines
> > > > > +      * of the camera interface must be physically connected
> > > > > +      * on the DVP data lines [9:2].
> > > > > +      *
> > > > > +      * Control lines polarity can be configured through
> > > > > +      * devicetree endpoint control lines properties.
> > > > > +      * If no endpoint control lines properties are set,
> > > > > +      * polarity will be as below:
> > > > > +      * - VSYNC:     active high
> > > > > +      * - HREF:      active low
> > > > > +      * - PCLK:      active low
> > > > > +      */
> > > > > +     /*
> > > > > +      * configure parallel port control lines polarity
> > > > > +      *
> > > > > +      * POLARITY CTRL0
> > > > > +      * - [5]:       PCLK polarity (0: active low, 1: active high)
> > > > > +      * - [1]:       HREF polarity (0: active low, 1: active high)
> > > > > +      * - [0]:       VSYNC polarity (mismatch here between
> > > > > +      *              datasheet and hardware, 0 is active high
> > > > > +      *              and 1 is active low...)
> > > > > +      */
> > > > > +     if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> > > > > +             pclk_pol = 1;
> > > > > +     if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> > > > > +             hsync_pol = 1;
> > > > > +     if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> > > > > +             vsync_pol = 1;
> > > > > +
> > > > > +     ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
> > > > > +                            (pclk_pol << 5) | (hsync_pol << 1) | vsync_pol);
> > > > > +
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     /*
> > > > > +      * powerdown MIPI TX/RX PHY & disable MIPI
> > > > > +      *
> > > > > +      * MIPI CONTROL 00
> > > > > +      * 4:    PWDN PHY TX
> > > > > +      * 3:    PWDN PHY RX
> > > > > +      * 2:    MIPI enable
> > > > > +      */
> > > > > +     ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x18);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     /*
> > > > > +      * enable VSYNC/HREF/PCLK DVP control lines
> > > > > +      * & D[9:6] DVP data lines
> > > > > +      *
> > > > > +      * PAD OUTPUT ENABLE 01
> > > > > +      * - 6:         VSYNC output enable
> > > > > +      * - 5:         HREF output enable
> > > > > +      * - 4:         PCLK output enable
> > > > > +      * - [3:0]:     D[9:6] output enable
> > > > > +      */
> > > > > +     ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x7f);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     /*
> > > > > +      * enable D[5:0] DVP data lines
> > > > > +      *
> > > > > +      * PAD OUTPUT ENABLE 02
> > > > > +      * - [7:2]:     D[5:0] output enable
> > > > > +      */
> > > > > +     ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02, 0xfc);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > >  static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
> > > > >  {
> > > > >       int ret = 0;
> > > > > @@ -2013,67 +2086,17 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
> > > > >               ret = ov5640_restore_mode(sensor);
> > > > >               if (ret)
> > > > >                       goto power_off;
> > > > > +     }
> > > > >
> > > > > -             /* We're done here for DVP bus, while CSI-2 needs setup. */
> > > > > -             if (sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
> > > > > -                     return 0;
> > > > > -
> > > > > -             /*
> > > > > -              * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
> > > > > -              *
> > > > > -              * 0x300e = 0x40
> > > > > -              * [7:5] = 010  : 2 data lanes mode (see FIXME note in
> > > > > -              *                "ov5640_set_stream_mipi()")
> > > > > -              * [4] = 0      : Power up MIPI HS Tx
> > > > > -              * [3] = 0      : Power up MIPI LS Rx
> > > > > -              * [2] = 0      : MIPI interface disabled
> > > > > -              */
> > > > > -             ret = ov5640_write_reg(sensor,
> > > > > -                                    OV5640_REG_IO_MIPI_CTRL00, 0x40);
> > > > > -             if (ret)
> > > > > -                     goto power_off;
> > > > > -
> > > > > -             /*
> > > > > -              * Gate clock and set LP11 in 'no packets mode' (idle)
> > > > > -              *
> > > > > -              * 0x4800 = 0x24
> > > > > -              * [5] = 1      : Gate clock when 'no packets'
> > > > > -              * [2] = 1      : MIPI bus in LP11 when 'no packets'
> > > > > -              */
> > > > > -             ret = ov5640_write_reg(sensor,
> > > > > -                                    OV5640_REG_MIPI_CTRL00, 0x24);
> > > > > -             if (ret)
> > > > > -                     goto power_off;
> > > > > -
> > > > > -             /*
> > > > > -              * Set data lanes and clock in LP11 when 'sleeping'
> > > > > -              *
> > > > > -              * 0x3019 = 0x70
> > > > > -              * [6] = 1      : MIPI data lane 2 in LP11 when 'sleeping'
> > > > > -              * [5] = 1      : MIPI data lane 1 in LP11 when 'sleeping'
> > > > > -              * [4] = 1      : MIPI clock lane in LP11 when 'sleeping'
> > > > > -              */
> > > > > -             ret = ov5640_write_reg(sensor,
> > > > > -                                    OV5640_REG_PAD_OUTPUT00, 0x70);
> > > > > -             if (ret)
> > > > > -                     goto power_off;
> > > > > -
> > > > > -             /* Give lanes some time to coax into LP11 state. */
> > > > > -             usleep_range(500, 1000);
> > > > > -
> > > > > -     } else {
> > > > > -             if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
> > > > > -                     /* Reset MIPI bus settings to their default values. */
> > > > > -                     ov5640_write_reg(sensor,
> > > > > -                                      OV5640_REG_IO_MIPI_CTRL00, 0x58);
> > > > > -                     ov5640_write_reg(sensor,
> > > > > -                                      OV5640_REG_MIPI_CTRL00, 0x04);
> > > > > -                     ov5640_write_reg(sensor,
> > > > > -                                      OV5640_REG_PAD_OUTPUT00, 0x00);
> > > > > -             }
> > > > > +     if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
> > > > > +             ret = ov5640_set_mipi(sensor, on);
> > > > > +     else
> > > > > +             ret = ov5640_set_dvp(sensor, on);
> > > > > +     if (ret)
> > > > > +             goto power_off;
> >
> > If you agree the  if (!on) case in the two set_mipi()/set_dvp() functions
> > above can be removed, this function should become
> >
> I would keep it, as mentioned above.
>
> Cheers,
> Prabhakar
