Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32EF65F74A0
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 09:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiJGHRd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 03:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiJGHRb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 03:17:31 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D43C09B1
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 00:17:29 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 06FD01BF204;
        Fri,  7 Oct 2022 07:17:26 +0000 (UTC)
Date:   Fri, 7 Oct 2022 09:17:25 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-3-jacopo@jmondi.org>
 <m31qrk6wgc.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m31qrk6wgc.fsf@t19.piap.pl>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof

On Fri, Oct 07, 2022 at 07:20:51AM +0200, Krzysztof Hałasa wrote:
> Hi Jacopo and Co,
>
> Jacopo Mondi <jacopo@jmondi.org> writes:
>
> > +static int ar0521_read_reg(struct ar0521_dev *sensor, u16 reg, u16 *val)
> > +{
> > +	struct i2c_client *client = sensor->i2c_client;
> > +	unsigned char buf[2];
> > +	struct i2c_msg msg;
> > +	int ret;
> > +
> > +	msg.addr = client->addr;
> > +	msg.flags = client->flags;
> > +	msg.len = sizeof(u16);
> > +	msg.buf = buf;
> > +	put_unaligned_be16(reg, buf);
> > +
> > +	ret = i2c_transfer(client->adapter, &msg, 1);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	msg.len = sizeof(u16);
> > +	msg.flags = client->flags | I2C_M_RD;
> > +	msg.buf = buf;
> > +
> > +	ret = i2c_transfer(client->adapter, &msg, 1);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	*val = get_unaligned_be16(buf);
> > +
> > +	return 0;
> > +}
>
> Why not simply use a shadow register?
>

Sorry I didn't get you. Care to expand ?

> > +static int ar0521_set_analog_gain(struct ar0521_dev *sensor)
> > +{
> > +	u16 global_gain;
> > +	int ret;
> > +
> > +	ret = ar0521_read_reg(sensor, AR0521_REG_GLOBAL_GAIN, &global_gain);
> > +	if (ret)
> > +		return ret;
> > +
> > +	global_gain &= ~AR0521_REG_GLOBAL_GAIN_ANA_MASK;
> > +	global_gain |= sensor->ctrls.ana_gain->val & AR0521_REG_GLOBAL_GAIN_ANA_MASK;
> > +
> > +	return ar0521_write_reg(sensor, AR0521_REG_GLOBAL_GAIN, global_gain);
>
> This one is simple: you can't write to AR0521_REG_GLOBAL_GAIN.

Uh

I can guarantee you it works :)

> You can write to individual color gain registers (any will do for analog
> gain), but writing to AR0521_REG_GLOBAL_GAIN will reset all the digital
> gains as well. Reading the register doesn't give you anything

I think that's ok, isn't it ? If one wants to control the global gain
it goes through this register, if individual gains need to be
configured one should not set the global gain ?

> interesting, either (the analog gain which you overwrite anyway).

The high bits are the global digital gain, and I need to read its value in
order not to overwrite them.

>
> BTW ISP can't really do that color balancing for you, since the sensor
> operates at its native bit resolution and ISP is limited to the output
> format, which is currently only 8-bit.

I'm not sure what do you mean here either :)

> --
> Krzysztof "Chris" Hałasa
>
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
