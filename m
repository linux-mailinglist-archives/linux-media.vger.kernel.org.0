Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1D5F42D6DF
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhJNKTT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 14 Oct 2021 06:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhJNKTR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:19:17 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED668C061760
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 03:17:12 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1maxnT-0003Ql-Ay; Thu, 14 Oct 2021 12:17:11 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1maxnS-0000mJ-N0; Thu, 14 Oct 2021 12:17:10 +0200
Message-ID: <639592c9ca18232c3372ae33d6e561969b1f69e4.camel@pengutronix.de>
Subject: Re: [PATCH v5 3/3] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@pengutronix.de
Date:   Thu, 14 Oct 2021 12:17:10 +0200
In-Reply-To: <20211014093409.GC31981@pengutronix.de>
References: <20211012084150.755160-1-m.tretter@pengutronix.de>
         <20211012084150.755160-4-m.tretter@pengutronix.de>
         <f4fca151a04b1c30fca7b2f40dacb2a3b4b4f2c6.camel@pengutronix.de>
         <20211013080530.GB31981@pengutronix.de>
         <20211014093409.GC31981@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-10-14 at 11:34 +0200, Michael Tretter wrote:
> On Wed, 13 Oct 2021 10:05:30 +0200, Michael Tretter wrote:
> > On Tue, 12 Oct 2021 15:27:11 +0200, Philipp Zabel wrote:
[...]
> > > > +static int isl7998x_wait_power_on(struct isl7998x *isl7998x)
> > > > +{
> > > > +	struct device *dev = isl7998x->subdev.dev;
> > > > +	unsigned int retry;
> > > > +	u32 chip_id;
> > > > +	int ret = -ETIMEDOUT;
> > > > +
> > > > +	for (retry = 10; ret && retry > 0; retry--) {
> > > > +		ret = regmap_read(isl7998x->regmap,
> > > > +				  ISL7998x_REG_P0_PRODUCT_ID_CODE, &chip_id);
> > > > +		usleep_range(1000, 2000);
> > > > +	}
> > > 
> > > Consider using regmap_read_poll_timeout() here.
> > 
> > Ack. I forgot about this function.
> 
> regmap_read_poll_timeout() cannot be used here, because it returns if
> regmap_read() returns an error. The driver uses the return value of
> regmap_read() to detect, if the chip is available, and should continue polling
> if regmap_read() failed. I can implement the necessary behavior with
> read_poll_timeout(), but am not sure if it is really worth it.

Oh, right. I still think so, but your call.

regards
Philipp
