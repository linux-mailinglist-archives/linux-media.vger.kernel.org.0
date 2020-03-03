Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDF3176FB9
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 08:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbgCCHH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 02:07:26 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38057 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgCCHH0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 02:07:26 -0500
Received: by mail-oi1-f193.google.com with SMTP id 2so1985456oiz.5;
        Mon, 02 Mar 2020 23:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jMyxVAsBPrP03Yzxg7FRoftNOx8eZDYuMUxWpWYm7cY=;
        b=GOsZTKx6gCS8mUWjjWFs591sd0Rq6KCGFub/mSRc50w+FHoAEK7Qrf5C3sTxvx1WlU
         wGw6ruR/6+eEIbRkG0OfZjl0qMwn6pjY9OxSxxk+QIjGGzgBxIlzXOuBixKgniyMomWZ
         y97IfQWjvi8qdkPiNXF0KelcNt5cuLrA9P6iSfH5++JpZ6hBTnqoPQPu4M1uzDrUDJum
         drMRNs7Go4z8FL2X2PPCOkGlOQpJnjLPwZ7VVv8ZHnYhIpACkazr1dX6PO+xU8tGT07J
         VwfpvfKLrMZqfp2C8Z0l2lRyRGyW5zeluzlRi7rJ2fynYkzRV2aCd8PtwYI9BVjK+Id2
         X6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jMyxVAsBPrP03Yzxg7FRoftNOx8eZDYuMUxWpWYm7cY=;
        b=VTTtLRUh8XoncyLp87IeUTx3xXJtcdBsreTFbyViZ5nTzlgwIf7ICPJnp2htOe8i26
         rtQwxAGLYrdmoj2vor9n4pN5hxngUOf+muF3N1T96aw9ycsowEFWyqWgzoHu/y7Th5hU
         F+q8uJ7P6Y9OnVn8k9vbeKqVGOkab7Iy0ElPGkOU4vO6LsXKwctNEnUTMJVxz266FKS0
         IiV7pOPLYEA/FtzOt41mckTcePTUY1zI00jFylXpmYnnD2/WahbeliVHNUGq9gHGIAjT
         9JbjWmXWDa4ppQZjDgdkCsoytlxfFhPoCFxPuct1dZpdoanIXGe1Vf5OoNqTeVIb8xWX
         6zwA==
X-Gm-Message-State: ANhLgQ1bKHuN5RPbOVgrKhCooYeFBQFX4DHLJXkd+x5cab+8dF85oZwW
        X+S2lPFs11a01IxmFlzYgH11+GeVznDJvNp0YnKQd9Q4
X-Google-Smtp-Source: ADFU+vsvJo7g12arNg6d6rMt8oa5euau1J4/ppO1UKbpMIO634Aatq2/xlOMCrg/REeEAi8s8S8EcqT+5IVqF+InfTY=
X-Received: by 2002:a05:6808:a0c:: with SMTP id n12mr147083oij.101.1583219244716;
 Mon, 02 Mar 2020 23:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20200228165503.18054-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200228165503.18054-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAPY8ntBbm2d4b1p__FdyZS52sBV6CtfGKaVrg74Q=3aKeby1nQ@mail.gmail.com>
In-Reply-To: <CAPY8ntBbm2d4b1p__FdyZS52sBV6CtfGKaVrg74Q=3aKeby1nQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 3 Mar 2020 07:06:58 +0000
Message-ID: <CA+V-a8u+nFKjQB7O-wP_ag1UXZUq2TwOkokjMVWv91Uk8kRTOA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: i2c: imx219: Fix power sequence
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thank you for the review.

On Mon, Mar 2, 2020 at 3:24 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Lad.
>
> Thanks again for the patch.
>
> On Fri, 28 Feb 2020 at 16:55, Lad Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >
> > When supporting Rpi Camera v2 Module on the RZ/G2E, found the driver had
> > some issues with rcar mipi-csi driver. The sesnosr never entered into LP-11
>
> s/sesnosr/sensor
>
my bad shall fix that.

> > state.
> >
> > The powerup sequence in the datasheet[1] shows the sensor entering into
> > LP-11 in streaming mode, so to fix this issue transitions are performed
> > from "standby -> streaming -> standby" in the probe().
> >
> > With this commit the sensor is able to enter LP-11 mode during power up,
> > as expected by some CSI-2 controllers.
>
> I guess I'm lucky that the CSI2 receiver I deal with doesn't care on this front.
> The datasheet does seem to imply that the line is left in what appears
> to be LP-00 after power up, but this feels like a huge amount of stuff
> to do.
>
> > [1] https://publiclab.org/system/images/photos/000/023/294/original/
> > RASPBERRY_PI_CAMERA_V2_DATASHEET_IMX219PQH5_7.0.0_Datasheet_XXX.PDF
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/i2c/imx219.c | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index f1effb5a5f66..8b48e148f2d0 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -1171,6 +1171,7 @@ static int imx219_check_hwcfg(struct device *dev)
> >
> >  static int imx219_probe(struct i2c_client *client)
> >  {
> > +       const struct imx219_reg_list *reg_list;
> >         struct device *dev = &client->dev;
> >         struct imx219 *imx219;
> >         int ret;
> > @@ -1224,6 +1225,38 @@ static int imx219_probe(struct i2c_client *client)
> >         /* Set default mode to max resolution */
> >         imx219->mode = &supported_modes[0];
> >
> > +       /* sensor doesn't enter to LP-11 state upon power up until and unless
>
> Remove "to"
>
will do.

> > +        * streaming is started, so upon power up set the default format and
> > +        * switch the modes: standby -> streaming -> standby
> > +        */
> > +       /* getting sensor out of sleep */
> > +       ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
> > +                              IMX219_REG_VALUE_08BIT, IMX219_MODE_STANDBY);
>
> The datasheet says the default for IMX219_REG_MODE_SELECT is already 0
> / STANDY, so this should be unnecessary as we've only just powered up.
>
Agreed.

> > +       if (ret < 0)
> > +               goto error_power_off;
> > +       usleep_range(100, 110);
> > +
> > +       reg_list = &imx219->mode->reg_list;
> > +       ret = imx219_write_regs(imx219, reg_list->regs, reg_list->num_of_regs);
> > +       if (ret) {
> > +               dev_err(&client->dev, "%s failed to default mode\n", __func__);
> > +               goto error_power_off;
> > +       }
>
> Seeing as we don't want the images produced, and we're about to power
> the sensor back down again, do the default register settings do enough
> to allow the shift to LP-11? ie can we drop writing any mode setup
> registers here, and just got to STREAMING and back to STANDBY?
>
Yes shall replace the sequence.

> > +       /* getting sensor out of sleep */
>
> We already did that above. This is standby->streaming.
>
agreed.

> > +       ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
> > +                              IMX219_REG_VALUE_08BIT, IMX219_MODE_STREAMING);
> > +       if (ret < 0)
> > +               goto error_power_off;
> > +       usleep_range(100, 110);
> > +
> > +       /* put sensor back to standby mode */
> > +       ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
> > +                              IMX219_REG_VALUE_08BIT, IMX219_MODE_STANDBY);
> > +       if (ret < 0)
> > +               goto error_power_off;
> > +       usleep_range(100, 110);
> > +
Just the above two write_reg's should do the trick.

Cheers,
--Prabhakar

> >         ret = imx219_init_controls(imx219);
> >         if (ret)
> >                 goto error_power_off;
> > --
> > 2.20.1
>
> Cheers,
>   Dave
