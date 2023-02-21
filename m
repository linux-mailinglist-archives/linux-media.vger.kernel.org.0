Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2697169DBC9
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 09:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbjBUITM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 03:19:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233689AbjBUITE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 03:19:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB88F9740
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 00:18:57 -0800 (PST)
Received: from ideasonboard.com (host-87-16-53-160.retail.telecomitalia.it [87.16.53.160])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF15A2E4;
        Tue, 21 Feb 2023 09:18:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676967536;
        bh=e7MAUvEthZt4RGJHmBhYkjl8mgcq19WIKLPZFdojrNc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QVcgedbAKvVxMSkYw+XvfzZGFmx0qU2KgNRy9yfXbuJH4aPnuJO6zF/CIeDMSD7hy
         0ALZ6OcZ7RECSDTN5I2I1bwL5mwerQ9dC0luw1qttWdwZzQ3NkCckjMRI+mz9j5d5R
         tSlQeK4U/BakO7BsQFitoqlcNY4B4SGMq1JrtnzE=
Date:   Tue, 21 Feb 2023 09:18:51 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov5647: Use bus-locked i2c_transfer()
Message-ID: <20230221081851.63iaqjhmrqxo562h@uno.localdomain>
References: <20230219180334.980950-1-jacopo.mondi@ideasonboard.com>
 <20230220124101.1010317-1-jacopo.mondi@ideasonboard.com>
 <CAPY8ntD2c0X=vyYTYRy6Lkq5xfiJX7Nk+0re5iS87n5jUnN50Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntD2c0X=vyYTYRy6Lkq5xfiJX7Nk+0re5iS87n5jUnN50Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Mon, Feb 20, 2023 at 05:46:02PM +0000, Dave Stevenson wrote:
> Hi Jacopo
>
> On Mon, 20 Feb 2023 at 12:41, Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
> >
> > The ov5647_read() functions calls i2c_master_send() and
> > i2c_master_read() in sequence. However this leaves space for other
> > clients to contend the bus and insert a unrelated transaction in between
> > the two calls.
> >
> > Replace the two calls with a single i2c_transfer() one, that locks the
> > bus in between the transactions.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov5647.c | 24 +++++++++++++++---------
> >  1 file changed, 15 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index 0b88ac6dee41..a423ee8fe20c 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -631,23 +631,29 @@ static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
> >
> >  static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
> >  {
> > -       unsigned char data_w[2] = { reg >> 8, reg & 0xff };
> >         struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +       u8 buf[2] = { reg >> 8, reg & 0xff };
> > +       struct i2c_msg msg[2];
> >         int ret;
> >
> > -       ret = i2c_master_send(client, data_w, 2);
> > +       msg[0].addr = client->addr;
> > +       msg[0].flags = client->flags;
> > +       msg[0].buf = buf;
> > +       msg[0].len = sizeof(buf);
> > +
> > +       msg[1].addr = client->addr;
> > +       msg[1].flags = client->flags | I2C_M_RD;
> > +       msg[1].buf = buf;
> > +       msg[1].len = 1;
> > +
> > +       ret = i2c_transfer(client->adapter, msg, 2);
> >         if (ret < 0) {
>
> i2c_transfer
> * Returns negative errno, else the number of messages executed.
>
> Is there a valid failure case where it returns 1 having done the write
> but failed the read? It's deferred to the individual I2C driver, so
> could quite easily be iffy.
> Personally I'd be tempted to check if (ret != 2), and remap any other
> positive value to -EINVAL.

Seems indeed up to the individual drivers implementation of
master_xfer, whose return value is documented as:

include/linux/i2c.h:     * master_xfer should return the number of messages successfully
include/linux/i2c.h-     * processed, or a negative value on error

I can indeed:

         if (ret != 2) {
                dev_err(.., "i2c write error, reg: %x\n");
                return ret > 0 ? -EINVAL : ret;
         }

         *val = buf[0];

         return 0;

>
> Otherwise:
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks for checking

>
> > -               dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
> > +               dev_err(&client->dev, "%s: i2c read error, reg: %x\n",
> >                         __func__, reg);
> >                 return ret;
> >         }
> >
> > -       ret = i2c_master_recv(client, val, 1);
> > -       if (ret < 0) {
> > -               dev_dbg(&client->dev, "%s: i2c read error, reg: %x\n",
> > -                               __func__, reg);
> > -               return ret;
> > -       }
> > +       *val = buf[0];
> >
> >         return 0;
> >  }
> > --
> > 2.39.0
> >
