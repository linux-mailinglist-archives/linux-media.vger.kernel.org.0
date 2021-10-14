Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5AE342D7B6
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 13:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhJNLHH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 07:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhJNLHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 07:07:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A50C06174E
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 04:05:02 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mayXk-0001Ps-8v; Thu, 14 Oct 2021 13:05:00 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mayXj-0003ua-HC; Thu, 14 Oct 2021 13:04:59 +0200
Date:   Thu, 14 Oct 2021 13:04:59 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Ian Arkver <ian.arkver.dev@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH v5 3/3] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Message-ID: <20211014110459.GD31981@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Ian Arkver <ian.arkver.dev@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, kernel@pengutronix.de
References: <20211012084150.755160-1-m.tretter@pengutronix.de>
 <20211012084150.755160-4-m.tretter@pengutronix.de>
 <f4fca151a04b1c30fca7b2f40dacb2a3b4b4f2c6.camel@pengutronix.de>
 <20211013080530.GB31981@pengutronix.de>
 <20211014093409.GC31981@pengutronix.de>
 <639592c9ca18232c3372ae33d6e561969b1f69e4.camel@pengutronix.de>
 <d7e61a3b-f56e-d6b1-cef9-b58aaf694862@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d7e61a3b-f56e-d6b1-cef9-b58aaf694862@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:53:15 up 238 days, 14:17, 146 users,  load average: 0.16, 0.17,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 14 Oct 2021 11:45:25 +0100, Ian Arkver wrote:
> On 14/10/2021 11:17, Philipp Zabel wrote:
> > On Thu, 2021-10-14 at 11:34 +0200, Michael Tretter wrote:
> > > On Wed, 13 Oct 2021 10:05:30 +0200, Michael Tretter wrote:
> > > > On Tue, 12 Oct 2021 15:27:11 +0200, Philipp Zabel wrote:
> > [...]
> > > > > > +static int isl7998x_wait_power_on(struct isl7998x *isl7998x)
> > > > > > +{
> > > > > > +	struct device *dev = isl7998x->subdev.dev;
> > > > > > +	unsigned int retry;
> > > > > > +	u32 chip_id;
> > > > > > +	int ret = -ETIMEDOUT;
> > > > > > +
> > > > > > +	for (retry = 10; ret && retry > 0; retry--) {
> > > > > > +		ret = regmap_read(isl7998x->regmap,
> > > > > > +				  ISL7998x_REG_P0_PRODUCT_ID_CODE, &chip_id);
> > > > > > +		usleep_range(1000, 2000);
> > > > > > +	}
> > > > > 
> > > > > Consider using regmap_read_poll_timeout() here.
> > > > 
> > > > Ack. I forgot about this function.
> > > 
> > > regmap_read_poll_timeout() cannot be used here, because it returns if
> > > regmap_read() returns an error. The driver uses the return value of
> > > regmap_read() to detect, if the chip is available, and should continue polling
> > > if regmap_read() failed. I can implement the necessary behavior with
> > > read_poll_timeout(), but am not sure if it is really worth it.
> > 
> > Oh, right. I still think so, but your call.
> > 
> This wait_power_on function seems odd to me. Wouldn't it be better to just
> wait for the power-on delay specified in the datasheet and then
> unconditionally go into isl7998x_init? If the device has failed to come up,
> that init will fail in its regmap accesses. If you're trying to do the init
> earlier than the datasheet specified time then being able to read the
> product id code doesn't guarantee the rest of the chip is ready. If there's
> no datasheet specification maybe just wait 10ms to 20ms?

The datasheet does not specify the power-on delay. The wait_power_on() enables
the driver to at least tell the user that the chip was not detected and print
the exact chip variant if it was detected. I think this is still better than
waiting some arbitrary time and hoping for the best.

Michael
