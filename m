Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7C815F7552
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 10:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbiJGIam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 04:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiJGIaj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 04:30:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0091183052
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 01:30:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43D104D3;
        Fri,  7 Oct 2022 10:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665131436;
        bh=Z2fB5RWMq9Nl7N8KVcrWcjT/FOMCBHc1OWaSmmtEZIA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nK4FDfH9fUtk6GWe5srLWECt6aTxcw+qFd4fiQXxqStCac3U2Kk5Cn9AFP9YRo7W8
         3Ntkhmq2rSSInvtDNog2kNLlvF14wKZvfUhM07XjI+RFXNMIK/+stjn3vKfZXOCm8f
         vybsCmq+oFzf63n3WzHfs3nd1xhwSDv+4WzXAmks=
Date:   Fri, 7 Oct 2022 11:30:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <Yz/jqA6ZACHOXxl/@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-3-jacopo@jmondi.org>
 <m31qrk6wgc.fsf@t19.piap.pl>
 <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Oct 07, 2022 at 09:17:25AM +0200, Jacopo Mondi wrote:
> On Fri, Oct 07, 2022 at 07:20:51AM +0200, Krzysztof Hałasa wrote:
> > Jacopo Mondi writes:
> >
> > > +static int ar0521_read_reg(struct ar0521_dev *sensor, u16 reg, u16 *val)
> > > +{
> > > +	struct i2c_client *client = sensor->i2c_client;
> > > +	unsigned char buf[2];
> > > +	struct i2c_msg msg;
> > > +	int ret;
> > > +
> > > +	msg.addr = client->addr;
> > > +	msg.flags = client->flags;
> > > +	msg.len = sizeof(u16);
> > > +	msg.buf = buf;
> > > +	put_unaligned_be16(reg, buf);
> > > +
> > > +	ret = i2c_transfer(client->adapter, &msg, 1);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	msg.len = sizeof(u16);
> > > +	msg.flags = client->flags | I2C_M_RD;
> > > +	msg.buf = buf;
> > > +
> > > +	ret = i2c_transfer(client->adapter, &msg, 1);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	*val = get_unaligned_be16(buf);
> > > +
> > > +	return 0;
> > > +}
> >
> > Why not simply use a shadow register?
> 
> Sorry I didn't get you. Care to expand ?

I think Krzysztof meant caching the value in the ar0521_dev structure,
so it doesn't have to be read back. I2C is slow, let's avoid reads as
much as possible.

This being said, if all gain controls are in the same cluster, you won't
need to read back or cache anything yourself, the control framework will
handle that for you.

> > > +static int ar0521_set_analog_gain(struct ar0521_dev *sensor)
> > > +{
> > > +	u16 global_gain;
> > > +	int ret;
> > > +
> > > +	ret = ar0521_read_reg(sensor, AR0521_REG_GLOBAL_GAIN, &global_gain);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	global_gain &= ~AR0521_REG_GLOBAL_GAIN_ANA_MASK;
> > > +	global_gain |= sensor->ctrls.ana_gain->val & AR0521_REG_GLOBAL_GAIN_ANA_MASK;
> > > +
> > > +	return ar0521_write_reg(sensor, AR0521_REG_GLOBAL_GAIN, global_gain);
> >
> > This one is simple: you can't write to AR0521_REG_GLOBAL_GAIN.
> 
> Uh
> 
> I can guarantee you it works :)
> 
> > You can write to individual color gain registers (any will do for analog
> > gain), but writing to AR0521_REG_GLOBAL_GAIN will reset all the digital
> > gains as well. Reading the register doesn't give you anything
> 
> I think that's ok, isn't it ? If one wants to control the global gain
> it goes through this register, if individual gains need to be
> configured one should not set the global gain ?

The issue is that if the user has set different digital gains for the
different channels, you will overwrite them with the same below for all
channels. That's not good.

What you could experiment with is register 0x0204
(analog_gain_code_global) which seem to provide a global analog gain
without overwriting the digital gains, but it's not entirely clear from
the documentation if it will work. The register name comes from
SMIA++/CCS, but the documentation doesn't match the coarse/fine gain
model, experiments would be needed. Another option is register 0x3028,
which is also named analog_gain_code_global, but is documented
differently.

Could you btw read registers 0x0000 to 0x00ff and provide the data ?

> > interesting, either (the analog gain which you overwrite anyway).
> 
> The high bits are the global digital gain, and I need to read its value in
> order not to overwrite them.
> 
> > BTW ISP can't really do that color balancing for you, since the sensor
> > operates at its native bit resolution and ISP is limited to the output
> > format, which is currently only 8-bit.
> 
> I'm not sure what do you mean here either :)

I'm also not sure to see the problem.

-- 
Regards,

Laurent Pinchart
