Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1056C181609
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 11:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgCKKp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 06:45:58 -0400
Received: from mga06.intel.com ([134.134.136.31]:3022 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbgCKKp6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 06:45:58 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 03:45:56 -0700
X-IronPort-AV: E=Sophos;i="5.70,540,1574150400"; 
   d="scan'208";a="289344053"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 03:45:54 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A1EA82096B; Wed, 11 Mar 2020 12:45:52 +0200 (EET)
Date:   Wed, 11 Mar 2020 12:45:52 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH] media: i2c: ov5695: Fix power on and off sequences
Message-ID: <20200311104552.GK5379@paasikivi.fi.intel.com>
References: <20191220130800.61589-1-tfiga@chromium.org>
 <20191220151939.GA19828@paasikivi.fi.intel.com>
 <CAAFQd5AvAk3D34VsC3kKqHZQY9=wHHttf6_R0orEcfWsiA2PHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5AvAk3D34VsC3kKqHZQY9=wHHttf6_R0orEcfWsiA2PHA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Wed, Mar 11, 2020 at 07:39:15PM +0900, Tomasz Figa wrote:
> Hi Sakari,
> 
> On Sat, Dec 21, 2019 at 12:19 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Tomasz,
> >
> > On Fri, Dec 20, 2019 at 10:08:00PM +0900, Tomasz Figa wrote:
> > > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > >
> > > From the measured hardware signal, OV5695 reset pin goes high for a
> > > short period of time during boot-up. From the sensor specification, the
> > > reset pin is active low and the DT binding defines the pin as active
> > > low, which means that the values set by the driver are inverted and thus
> > > the value requested in probe ends up high.
> > >
> > > Fix it by changing probe to request the reset GPIO initialized to high,
> > > which makes the initial state of the physical signal low.
> > >
> > > In addition, DOVDD rising must occur before DVDD rising from spec., but
> > > regulator_bulk_enable() API enables all the regulators asynchronously.
> > > Use an explicit loops of regulator_enable() instead.
> > >
> > > For power off sequence, it is required that DVDD falls first. Given the
> > > bulk API does not give any guarantee about the order of regulators,
> > > change the driver to use regulator_disable() instead.
> > >
> > > The sensor also requires a delay between reset high and first I2C
> > > transaction, which was assumed to be 8192 XVCLK cycles, but 1ms is
> > > recommended by the vendor. Fix this as well.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > ---
> > >  drivers/media/i2c/ov5695.c | 41 +++++++++++++++++++++-----------------
> > >  1 file changed, 23 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
> > > index d6cd15bb699ac..8d0cc3893fcfc 100644
> > > --- a/drivers/media/i2c/ov5695.c
> > > +++ b/drivers/media/i2c/ov5695.c
> > > @@ -971,16 +971,9 @@ static int ov5695_s_stream(struct v4l2_subdev *sd, int on)
> > >       return ret;
> > >  }
> > >
> > > -/* Calculate the delay in us by clock rate and clock cycles */
> > > -static inline u32 ov5695_cal_delay(u32 cycles)
> > > -{
> > > -     return DIV_ROUND_UP(cycles, OV5695_XVCLK_FREQ / 1000 / 1000);
> > > -}
> > > -
> > >  static int __ov5695_power_on(struct ov5695 *ov5695)
> > >  {
> > > -     int ret;
> > > -     u32 delay_us;
> > > +     int i, ret;
> > >       struct device *dev = &ov5695->client->dev;
> > >
> > >       ret = clk_prepare_enable(ov5695->xvclk);
> > > @@ -991,21 +984,24 @@ static int __ov5695_power_on(struct ov5695 *ov5695)
> > >
> > >       gpiod_set_value_cansleep(ov5695->reset_gpio, 1);
> > >
> > > -     ret = regulator_bulk_enable(OV5695_NUM_SUPPLIES, ov5695->supplies);
> > > -     if (ret < 0) {
> > > -             dev_err(dev, "Failed to enable regulators\n");
> > > -             goto disable_clk;
> > > +     for (i = 0; i < OV5695_NUM_SUPPLIES; i++) {
> > > +             ret = regulator_enable(ov5695->supplies[i].consumer);
> >
> > The regulator voltage takes some time before it settles. If the hardware
> > requires a particular order, then presumably there should be a small delay
> > to ensure that. 1 ms should be plenty.
> 
> The regulator API guarantees that when regulator_enable() returns, the
> voltage is stable. Regulator ramp up delays can be also configured via
> DT to take care for per-platform variability.

Ack. In practice not many drivers do that still. But that should probably
be seen as a driver bug indeed.

-- 
Regards,

Sakari Ailus
