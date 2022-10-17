Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D769560127F
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 17:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbiJQPKs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 11:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbiJQPKa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 11:10:30 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F646CD2F
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 08:10:08 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 7E07640003;
        Mon, 17 Oct 2022 15:10:05 +0000 (UTC)
Date:   Mon, 17 Oct 2022 17:10:03 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <20221017151003.5vqxgfewyjrmrdei@uno.localdomain>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-3-jacopo@jmondi.org>
 <m31qrk6wgc.fsf@t19.piap.pl>
 <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain>
 <Yz/jqA6ZACHOXxl/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yz/jqA6ZACHOXxl/@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I'm back with a few more data...

On Fri, Oct 07, 2022 at 11:30:32AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Fri, Oct 07, 2022 at 09:17:25AM +0200, Jacopo Mondi wrote:
> > On Fri, Oct 07, 2022 at 07:20:51AM +0200, Krzysztof Hałasa wrote:
> > > Jacopo Mondi writes:
> > >
> > > > +static int ar0521_read_reg(struct ar0521_dev *sensor, u16 reg, u16 *val)
> > > > +{
> > > > +	struct i2c_client *client = sensor->i2c_client;
> > > > +	unsigned char buf[2];
> > > > +	struct i2c_msg msg;
> > > > +	int ret;
> > > > +
> > > > +	msg.addr = client->addr;
> > > > +	msg.flags = client->flags;
> > > > +	msg.len = sizeof(u16);
> > > > +	msg.buf = buf;
> > > > +	put_unaligned_be16(reg, buf);
> > > > +
> > > > +	ret = i2c_transfer(client->adapter, &msg, 1);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	msg.len = sizeof(u16);
> > > > +	msg.flags = client->flags | I2C_M_RD;
> > > > +	msg.buf = buf;
> > > > +
> > > > +	ret = i2c_transfer(client->adapter, &msg, 1);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	*val = get_unaligned_be16(buf);
> > > > +
> > > > +	return 0;
> > > > +}
> > >
> > > Why not simply use a shadow register?
> >
> > Sorry I didn't get you. Care to expand ?
>
> I think Krzysztof meant caching the value in the ar0521_dev structure,
> so it doesn't have to be read back. I2C is slow, let's avoid reads as
> much as possible.
>
> This being said, if all gain controls are in the same cluster, you won't
> need to read back or cache anything yourself, the control framework will
> handle that for you.
>
> > > > +static int ar0521_set_analog_gain(struct ar0521_dev *sensor)
> > > > +{
> > > > +	u16 global_gain;
> > > > +	int ret;
> > > > +
> > > > +	ret = ar0521_read_reg(sensor, AR0521_REG_GLOBAL_GAIN, &global_gain);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	global_gain &= ~AR0521_REG_GLOBAL_GAIN_ANA_MASK;
> > > > +	global_gain |= sensor->ctrls.ana_gain->val & AR0521_REG_GLOBAL_GAIN_ANA_MASK;
> > > > +
> > > > +	return ar0521_write_reg(sensor, AR0521_REG_GLOBAL_GAIN, global_gain);
> > >
> > > This one is simple: you can't write to AR0521_REG_GLOBAL_GAIN.
> >
> > Uh
> >
> > I can guarantee you it works :)
> >
> > > You can write to individual color gain registers (any will do for analog
> > > gain), but writing to AR0521_REG_GLOBAL_GAIN will reset all the digital
> > > gains as well. Reading the register doesn't give you anything
> >
> > I think that's ok, isn't it ? If one wants to control the global gain
> > it goes through this register, if individual gains need to be
> > configured one should not set the global gain ?
>
> The issue is that if the user has set different digital gains for the
> different channels, you will overwrite them with the same below for all
> channels. That's not good.
>

Yes, the global digital gain overwrites the per-channel ones

> What you could experiment with is register 0x0204

Nope, that's a no-op

> (analog_gain_code_global) which seem to provide a global analog gain
> without overwriting the digital gains, but it's not entirely clear from
> the documentation if it will work. The register name comes from
> SMIA++/CCS, but the documentation doesn't match the coarse/fine gain
> model, experiments would be needed. Another option is register 0x3028,

0x3028, albeit documented differently, effectively changes the global
analog gain as the lower 6 bits of 0x305e do.

Values set to 0x3028 are reflected in 0x305e and viceversa, so I think
that V4L2_CID_ANALOG_GAIN can be safely directed to 0x3028 without
the need to read back the current digital gain value before reading the
register.

The per-channel analog gains component will be overwritten
but considering that the existing CID_GAIN, CID_BLUE_BALANCE and
CID_RED_BALANCE cluster computes the green/red/blue analog and digital
gains as follows:

	int green = sensor->ctrls.gain->val;
	int red = max(green + sensor->ctrls.red_balance->val, 0);
	int blue = max(green + sensor->ctrls.blue_balance->val, 0);
	unsigned int gain = min(red, min(green, blue));
	unsigned int analog = min(gain, 64u); /* range is 0 - 127 */

So that CID_GAIN is mapped on the green channel, the only way to make
this less nasty would be to actually define multi-dimensional
DIGITAL and ANALOG gain controls, where the three channels are mapped
to the three dimensions, and use CID_DIGITAL_GAIN and CID_ANALOG_GAIN
as global control gains (with the caveat that the global gains are
meant to override the per channel ones).

Personally I'm fine with a single, non-clusterized CID_ANALOG_GAIN and
leave the existing cluster as it is. The multi-dimensional control
might indeed prove useful albeit it will break existing applications
that rely on the CID_GAIN/RED,BLUE_BALANCE cluster.

> which is also named analog_gain_code_global, but is documented
> differently.
>
> Could you btw read registers 0x0000 to 0x00ff and provide the data ?

There is nothing interesting there if not default values. I was hoping
that analogue_gain_m0 analogue_gain_c0 and analogue_gain_m1
analogue_gain_c1 would provide a way to inject gains using the
standard CCS gain model, but those registers are said to be read-only
and do not change when the global analog gain changes, so I wonder if
the SMIA/CCS interface for this chip is actually enabled (it might
depend on the fw revision ?)

>
> > > interesting, either (the analog gain which you overwrite anyway).
> >
> > The high bits are the global digital gain, and I need to read its value in
> > order not to overwrite them.
> >
> > > BTW ISP can't really do that color balancing for you, since the sensor
> > > operates at its native bit resolution and ISP is limited to the output
> > > format, which is currently only 8-bit.
> >
> > I'm not sure what do you mean here either :)
>
> I'm also not sure to see the problem.
>
> --
> Regards,
>
> Laurent Pinchart
