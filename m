Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8E368F235
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 16:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbjBHPkD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 10:40:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbjBHPj5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 10:39:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9644B772
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 07:39:51 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98266E79;
        Wed,  8 Feb 2023 16:39:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675870789;
        bh=VkvUeZ2AOI2dDeGwvWBcFO0P+Yx6u2S+8ln8zSKdpyQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GANi+rPakyejK17KP5vWWtOGoJ1avbuxwVTx7wqBvmAbD/J6nPq+5Sv7HcCEFjLC0
         oonT3yoz6yxi/aOI1t9CnosmtYqyXqdgrqhfvsSPK3Ga2+Y/7t2F9XPp2JOYryr1oe
         kd05TI3kLIZNUm0zV9m+ox4IgUO37hDU1+lpkNaI=
Date:   Wed, 8 Feb 2023 17:39:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+PCRIRuOAiV+zC8@pendragon.ideasonboard.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+OIBefssxY3bbmK@kekkonen.localdomain>
 <20230208153329.6dccd807@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230208153329.6dccd807@coco.lan>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 08, 2023 at 03:33:29PM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 8 Feb 2023 13:31:17 +0200
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> 
> > Hi Hans,
> > 
> > On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
> > > The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
> > > ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
> > > ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
> > > 
> > > as well as various "atomisp" sensor drivers in drivers/staging, *all*
> > > use register access helpers with the following function prototypes:
> > > 
> > > int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
> > >                     unsigned int len, u32 *val);
> > > 
> > > int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
> > >                      unsigned int len, u32 val);
> > > 
> > > To read/write registers on Omnivision OVxxxx image sensors wich expect
> > > a 16 bit register address in big-endian format and which have 1-3 byte
> > > wide registers, in big-endian format (for the higher width registers).
> > > 
> > > Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > > versions of these register access helpers, so that this code duplication
> > > can be removed.  
> > 
> > Ideally we'd have helpers for CCI, of which this is a subset. And on top of
> > regmap. I don't object adding these either though.
> 
> Well, ideally, when the atomisp-specific sensor ioctls go away, we can
> merge the atomisp-specific sensor drivers for not-yet-uptreamed sensors
> or modify the existing sensor drivers to accept the atomisp resolutions [1].

Please don't, that's not the right way to handle that. If the ISP needs
extra lines or columns, then the corresponding sensor drivers should be
converted to implement the selection API correctly, instead of adding
"modes".

> So, for now, I wouldn't convert those to use regmap. This can be done
> later with the remaining drivers.
> 
> [1] atomisp usually requires 16 extra lines/columns for it to work, so
> the current sensor drivers there allow setting resolutions like
> 1616x1216 at the sensor, while offering 1600x1200 resolution to
> userspace.

-- 
Regards,

Laurent Pinchart
