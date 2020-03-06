Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D13517C11E
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 16:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgCFPC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 10:02:28 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35450 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgCFPC1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 10:02:27 -0500
Received: by mail-ot1-f65.google.com with SMTP id v10so2706631otp.2;
        Fri, 06 Mar 2020 07:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BD+60dokgEOUG8j2bYzkDk6D/5UHZy/4MYWY7LmG4bw=;
        b=eFSZa7/QV0w8UCbTiQEIr1obPkQBsyaq56GSwV9OB1pN5etNNCyEm4XeRjMI14m6Vx
         4Ehd56Cj0i7QJDDMopnpuOfdr36F+9DZ6ndBx7UViEggRWqrxma0wRjZleGPChExUXfb
         ozrcWG2aSw9KfKY5/86erdy1han4u9Bv/t8LfbQwQpNCOTDNtL7uWff11ShgcM1w+r11
         TQ50pc3ZcMfLh3ctE3/DZ2FKnVVc6yQK0xXq5q2gWOVavblPnosOd5lZOgcplnvWW3O1
         J8GfM3dflqjXu6hv03q4CNWQi6q14K9QSq7PTnrn0ocCg3eUEW981c/df1PqPN8f/wBK
         Z2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BD+60dokgEOUG8j2bYzkDk6D/5UHZy/4MYWY7LmG4bw=;
        b=Knf9yWR2N6Zu2zAwlbYJ8a6WERyaAGPyWI+NIhMC2wcuDvgB15J60PeNOb6LfBC+2m
         0Bb5mdj78Fak5S7nbe0rjk/liCVHGqL09+ES5pHnFWU4oI+2Sy8OiK5gl2a+FK8m2+Bm
         lmVyX5VbGBe3OOzXspz0Z1mMLIQoH+akY2Dr7zPr9TL7fMwDv+NEvD64J4Q6YiVXC3Gt
         +SIssjnIuQ8XoZ6aRbbDQ9WoMQke+jlsg5dBO8WhkiiVrHSoH1pyapR9DW3gi4Q77g+n
         48oIjwKWuK+2h4ScHHjWoMO+DoMF/pT3unOdkhnOjvn3SLK4/Y4PAKaN7/sijv8T3aKP
         nzfg==
X-Gm-Message-State: ANhLgQ1gkzMkqm33B9hB5dQwf+DpejWvtJH/7K74ZsvUuEahCOnFLVOO
        bcoe5RRZD76duOMZl8v5azhfnWLFc2XE2D5NYAg=
X-Google-Smtp-Source: ADFU+vuyheZ5bTYaLVxlIFPIWUI4wuVMkWlhVds1soVsrxGBy2ve8KSs/7dd6xWIpqFYFkBxZ/fFprmkEU2G04xmH78=
X-Received: by 2002:a9d:6d85:: with SMTP id x5mr2946522otp.176.1583506945793;
 Fri, 06 Mar 2020 07:02:25 -0800 (PST)
MIME-Version: 1.0
References: <20200306103246.22213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200306103246.22213-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAPY8ntD38sM0SXvOEyr2gRCM7WeAY4CjAKcrVfd6MCHB+Ejv0A@mail.gmail.com>
In-Reply-To: <CAPY8ntD38sM0SXvOEyr2gRCM7WeAY4CjAKcrVfd6MCHB+Ejv0A@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 6 Mar 2020 15:01:57 +0000
Message-ID: <CA+V-a8s-7FYJdLnG5y4i6SvcpJR16iXd35GfFPgesdkO9Z7Ong@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: i2c: imx219: Fix power sequence
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Fri, Mar 6, 2020 at 1:01 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Prabhakar.
>
> Thanks for the update.
>
> On Fri, 6 Mar 2020 at 10:32, Lad Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >
> > When supporting Rpi Camera v2 Module on the RZ/G2E, found the driver had
> > some issues with rcar mipi-csi driver. The sensor never entered into LP-11
> > state.
> >
> > The powerup sequence in the datasheet[1] shows the sensor entering into
> > LP-11 in streaming mode, so to fix this issue transitions are performed
> > from "streaming -> standby" in the probe() after power up.
> >
> > With this commit the sensor is able to enter LP-11 mode during power up,
> > as expected by some CSI-2 controllers.
> >
> > [1] https://publiclab.org/system/images/photos/000/023/294/original/
> > RASPBERRY_PI_CAMERA_V2_DATASHEET_IMX219PQH5_7.0.0_Datasheet_XXX.PDF
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
Thank you for the Ack.

Cheers,
--Prabhakar

>
> > ---
> >  drivers/media/i2c/imx219.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index f1effb5a5f66..16010ca1781a 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -1224,6 +1224,23 @@ static int imx219_probe(struct i2c_client *client)
> >         /* Set default mode to max resolution */
> >         imx219->mode = &supported_modes[0];
> >
> > +       /* sensor doesn't enter LP-11 state upon power up until and unless
> > +        * streaming is started, so upon power up switch the modes to:
> > +        * streaming -> standby
> > +        */
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
> >         ret = imx219_init_controls(imx219);
> >         if (ret)
> >                 goto error_power_off;
> > --
> > 2.20.1
> >
