Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046CD3F23DB
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 01:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236811AbhHSXwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 19:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232701AbhHSXwm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 19:52:42 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAFAAC061575
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 16:52:05 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id w13-20020a17090aea0db029017897a5f7bcso5983826pjy.5
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 16:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LF2R1ZqKp0/03yLLhV/VidedMawjVEQ9JC5+SPw2T4A=;
        b=G9DoKVARPZKQpVPQnMPU5djNorYX4KBFpx++MRzOh+Fpr11wyvTA43iwgoLnz7W83+
         H4fwfjUGiK/TvvVXhYK5ZKVzzl8Q0GN7ySwcwPBVvtDtyq+/mFSBwMt+JpncJz4aQAsv
         49q2KkKRX6qp2U6mMkPrTfdSQ36LFd848NyoBlACMNsUTTOWqpbSoFKPmwNco9d7Dyem
         C7GR3WAMspvhyPnEyt6wtXamxa2iRQnS2i6s/+ynXmD1IbM+i499TiSQFRuZDzi2dLX2
         kMxpXvvqxJLJJRxIFemhjLesa5ri6U2TQzSVsq27PxNBNa3+Ig+92SaXWezBUhq/A93G
         n8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LF2R1ZqKp0/03yLLhV/VidedMawjVEQ9JC5+SPw2T4A=;
        b=UMk7K3Yn/Lp0A6M6GcJhN9GxAvcwN13WP/yGQRxdaB/RY9Hv7ORP/hkk2+wlAfSnHx
         WAVY8ACpmqBP0UWBya7I+fs1cNS594sYkWAs6YBWF+0vWyauRCouw3zZeGUJ6EczTBc4
         kLORUk1ygjKKBv7jDJi2wEBRetF0GLs5S2mTZY2c28hYrjetWl/lMSzKwRkUTCSjI5AY
         x+L9Vo8w0V3f1phadqG7IUpiWUsmUWZyrizsZaOPEp4LKyoo1mcenbHevI82AGZrFqLZ
         M0zmEjo7An0hiQk4UIj3wZ5MBLAhnziJJQZYzMloOCHs8biZbUXnW1JDgAzNArkyRMg9
         taUQ==
X-Gm-Message-State: AOAM533Z8GY0cP+kTvKmrTCH96XdMSyGob8wEd8xxq2JhXEINsR9BJgm
        qfwEv0P7ZEmKUHoxZ6wTerjy8YnnKE+DDigx5/jlQQ==
X-Google-Smtp-Source: ABdhPJw8JG9csCDidguJv/hh15/RePAzh03nbV2xexd6WVlOPwXEaRicKp3GsfAB4GW1lM9DxrZ0fdrfq6vEIdVCDS4=
X-Received: by 2002:a17:90a:4409:: with SMTP id s9mr939209pjg.125.1629417125174;
 Thu, 19 Aug 2021 16:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <m3sg01baq9.fsf@t19.piap.pl> <CAJ+vNU2UR=aY0gFQgAL4wS_cBf59rKM9ce5W=byOo75TOpBQSw@mail.gmail.com>
In-Reply-To: <CAJ+vNU2UR=aY0gFQgAL4wS_cBf59rKM9ce5W=byOo75TOpBQSw@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 19 Aug 2021 16:51:53 -0700
Message-ID: <CAJ+vNU2PwYm1Pns9PkG_=vu22wmZEthyukU=_H_fAvJJQ8S8-w@mail.gmail.com>
Subject: Re: [PATCH v2] TDA1997x: replace video detection routine
To:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 19, 2021 at 12:52 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Mon, Jul 26, 2021 at 4:01 AM Krzysztof Ha=C5=82asa <khalasa@piap.pl> w=
rote:
> >
> > The TDA1997x (HDMI receiver) driver currently uses a specific video
> > format detection scheme. The frame (or field in interlaced mode), line
> > and HSync pulse durations are compared to those of known, standard vide=
o
> > modes. If a match is found, the mode is assumed to be detected,
> > otherwise -ERANGE is returned (then possibly ignored). This means that:
> > - another mode with similar timings will be detected incorrectly
> >   (e.g. 2x faster clock and lines twice as long)
> > - non-standard modes will not work.
> >
> > I propose to replace this scheme with a direct read of geometry
> > registers. This way all modes recognized by the chip will be supported.
> >
> > In interlaced modes, the code assumes the V sync signal has the same
> > duration for both fields. While this may be not necessarily true,
> > I can't see any way to get the "other" V sync width. This is most
> > probably harmless.
> >
> > I have checked the register values in interlaced mode, but currently
> > can't test such a setup (I only have remote access to a device working
> > in interlaced mode). Perhaps this will change in time.
> >
> > All tests have been performed on Gateworks' Ventana GW54xx board, with
> > a TDA19971 chip.
> >
> > Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>
> >
> > ---
> > This version extracts H and V sync polarities of the incoming signal an=
d
> > matches the parameters against the standard video modes.
> >
> > 1/1000 pixel clock tolerance had to be increased to 1/500 because the
> > 1/1.001 (NTSC-like) pixclk and frame rate reduction already caused
> > 1/1000 deviation, and there was no room for further difference.
> >
> > This patch requires just posted "[PATCH] TDA1997x: report -ENOLINK
> > after disconnecting HDMI source".
> >
> > diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.=
c
> > index 36a7b89afb08..a6afb387785d 100644
> > --- a/drivers/media/i2c/tda1997x.c
> > +++ b/drivers/media/i2c/tda1997x.c
> > @@ -1092,67 +1092,82 @@ tda1997x_detect_std(struct tda1997x_state *stat=
e,
> >                     struct v4l2_dv_timings *timings)
> >  {
> >         struct v4l2_subdev *sd =3D &state->sd;
> > -       u32 vper;
> > -       u16 hper;
> > -       u16 hsper;
> > -       int i;
> >
> >         /*
> >          * Read the FMT registers
> > -        *   REG_V_PER: Period of a frame (or two fields) in MCLK(27MHz=
) cycles
> > -        *   REG_H_PER: Period of a line in MCLK(27MHz) cycles
> > -        *   REG_HS_WIDTH: Period of horiz sync pulse in MCLK(27MHz) cy=
cles
> > +        *   REG_V_PER: Period of a frame (or field) in MCLK (27MHz) cy=
cles
> > +        *   REG_H_PER: Period of a line in MCLK (27MHz) cycles
> > +        *   REG_HS_WIDTH: Period of horiz sync pulse in MCLK (27MHz) c=
ycles
> >          */
> > -       vper =3D io_read24(sd, REG_V_PER) & MASK_VPER;
> > -       hper =3D io_read16(sd, REG_H_PER) & MASK_HPER;
> > -       hsper =3D io_read16(sd, REG_HS_WIDTH) & MASK_HSWIDTH;
> > -       v4l2_dbg(1, debug, sd, "Signal Timings: %u/%u/%u\n", vper, hper=
, hsper);
> > +       u32 vper, vsync_pos;
> > +       u16 hper, hsync_pos, hsper, interlaced;
> > +       u16 htot, hact, hfront, hsync, hback;
> > +       u16 vtot, vact, vfront1, vfront2, vsync, vback1, vback2;
> >
> >         if (!state->input_detect[0] && !state->input_detect[1])
> >                 return -ENOLINK;
> >
> > -       for (i =3D 0; v4l2_dv_timings_presets[i].bt.width; i++) {
> > -               const struct v4l2_bt_timings *bt;
> > -               u32 lines, width, _hper, _hsper;
> > -               u32 vmin, vmax, hmin, hmax, hsmin, hsmax;
> > -               bool vmatch, hmatch, hsmatch;
> > -
> > -               bt =3D &v4l2_dv_timings_presets[i].bt;
> > -               width =3D V4L2_DV_BT_FRAME_WIDTH(bt);
> > -               lines =3D V4L2_DV_BT_FRAME_HEIGHT(bt);
> > -               _hper =3D (u32)bt->pixelclock / width;
> > -               if (bt->interlaced)
> > -                       lines /=3D 2;
> > -               /* vper +/- 0.7% */
> > -               vmin =3D ((27000000 / 1000) * 993) / _hper * lines;
> > -               vmax =3D ((27000000 / 1000) * 1007) / _hper * lines;
> > -               /* hper +/- 1.0% */
> > -               hmin =3D ((27000000 / 100) * 99) / _hper;
> > -               hmax =3D ((27000000 / 100) * 101) / _hper;
> > -               /* hsper +/- 2 (take care to avoid 32bit overflow) */
> > -               _hsper =3D 27000 * bt->hsync / ((u32)bt->pixelclock/100=
0);
> > -               hsmin =3D _hsper - 2;
> > -               hsmax =3D _hsper + 2;
> > -
> > -               /* vmatch matches the framerate */
> > -               vmatch =3D ((vper <=3D vmax) && (vper >=3D vmin)) ? 1 :=
 0;
> > -               /* hmatch matches the width */
> > -               hmatch =3D ((hper <=3D hmax) && (hper >=3D hmin)) ? 1 :=
 0;
> > -               /* hsmatch matches the hswidth */
> > -               hsmatch =3D ((hsper <=3D hsmax) && (hsper >=3D hsmin)) =
? 1 : 0;
> > -               if (hmatch && vmatch && hsmatch) {
> > -                       v4l2_print_dv_timings(sd->name, "Detected forma=
t: ",
> > -                                             &v4l2_dv_timings_presets[=
i],
> > -                                             false);
> > -                       if (timings)
> > -                               *timings =3D v4l2_dv_timings_presets[i]=
;
> > -                       return 0;
> > -               }
> > -       }
> > +       vper =3D io_read24(sd, REG_V_PER);
> > +       hper =3D io_read16(sd, REG_H_PER);
> > +       hsper =3D io_read16(sd, REG_HS_WIDTH);
> > +       vsync_pos =3D vper & MASK_VPER_SYNC_POS;
> > +       hsync_pos =3D hper & MASK_HPER_SYNC_POS;
> > +       interlaced =3D hsper & MASK_HSWIDTH_INTERLACED;
> > +       vper &=3D MASK_VPER;
> > +       hper &=3D MASK_HPER;
> > +       hsper &=3D MASK_HSWIDTH;
> > +       v4l2_dbg(1, debug, sd, "Signal Timings: %u/%u/%u\n", vper, hper=
, hsper);
> >
> > -       v4l_err(state->client, "no resolution match for timings: %d/%d/=
%d\n",
> > -               vper, hper, hsper);
> > -       return -ERANGE;
> > +       htot =3D io_read16(sd, REG_FMT_H_TOT);
> > +       hact =3D io_read16(sd, REG_FMT_H_ACT);
> > +       hfront =3D io_read16(sd, REG_FMT_H_FRONT);
> > +       hsync =3D io_read16(sd, REG_FMT_H_SYNC);
> > +       hback =3D io_read16(sd, REG_FMT_H_BACK);
> > +
> > +       vtot =3D io_read16(sd, REG_FMT_V_TOT);
> > +       vact =3D io_read16(sd, REG_FMT_V_ACT);
> > +       vfront1 =3D io_read(sd, REG_FMT_V_FRONT_F1);
> > +       vfront2 =3D io_read(sd, REG_FMT_V_FRONT_F2);
> > +       vsync =3D io_read(sd, REG_FMT_V_SYNC);
> > +       vback1 =3D io_read(sd, REG_FMT_V_BACK_F1);
> > +       vback2 =3D io_read(sd, REG_FMT_V_BACK_F2);
> > +
> > +       v4l2_dbg(1, debug, sd, "Geometry: H %u %u %u %u %u Sync%c  V %u=
 %u %u %u %u %u %u Sync%c\n",
> > +                htot, hact, hfront, hsync, hback, hsync_pos ? '+' : '-=
',
> > +                vtot, vact, vfront1, vfront2, vsync, vback1, vback2, v=
sync_pos ? '+' : '-');
> > +
> > +       if (!timings)
> > +               return 0;
> > +
> > +       timings->type =3D V4L2_DV_BT_656_1120;
> > +       timings->bt.width =3D hact;
> > +       timings->bt.hfrontporch =3D hfront;
> > +       timings->bt.hsync =3D hsync;
> > +       timings->bt.hbackporch =3D hback;
> > +       timings->bt.height =3D vact;
> > +       timings->bt.vfrontporch =3D vfront1;
> > +       timings->bt.vsync =3D vsync;
> > +       timings->bt.vbackporch =3D vback1;
> > +       timings->bt.interlaced =3D interlaced ? V4L2_DV_INTERLACED : V4=
L2_DV_PROGRESSIVE;
> > +       timings->bt.polarities =3D vsync_pos ? V4L2_DV_VSYNC_POS_POL : =
0;
> > +       timings->bt.polarities |=3D hsync_pos ? V4L2_DV_HSYNC_POS_POL :=
 0;
> > +
> > +       timings->bt.pixelclock =3D (u64)htot * vtot * 27000000;
> > +       if (interlaced) {
> > +               timings->bt.il_vfrontporch =3D vfront2;
> > +               timings->bt.il_vsync =3D timings->bt.vsync;
> > +               timings->bt.il_vbackporch =3D vback2;
> > +               do_div(timings->bt.pixelclock, vper * 2 /* full frame *=
/);
> > +       } else {
> > +               timings->bt.il_vfrontporch =3D 0;
> > +               timings->bt.il_vsync =3D 0;
> > +               timings->bt.il_vbackporch =3D 0;
> > +               do_div(timings->bt.pixelclock, vper);
> > +       }
> > +       v4l2_find_dv_timings_cap(timings, &tda1997x_dv_timings_cap,
> > +                                (u32)timings->bt.pixelclock / 500, NUL=
L, NULL);
> > +       v4l2_print_dv_timings(sd->name, "Detected format: ", timings, f=
alse);
> > +       return 0;
> >  }
> >
> >  /* some sort of errata workaround for chip revision 0 (N1) */
> > diff --git a/drivers/media/i2c/tda1997x_regs.h b/drivers/media/i2c/tda1=
997x_regs.h
> > index d9b3daada07d..115371ba33f0 100644
> > --- a/drivers/media/i2c/tda1997x_regs.h
> > +++ b/drivers/media/i2c/tda1997x_regs.h
> > @@ -117,9 +117,12 @@
> >  #define REG_CURPAGE_00H                0xFF
> >
> >  #define MASK_VPER              0x3fffff
> > +#define MASK_VPER_SYNC_POS     0x800000
> >  #define MASK_VHREF             0x3fff
> >  #define MASK_HPER              0x0fff
> > +#define MASK_HPER_SYNC_POS     0x8000
> >  #define MASK_HSWIDTH           0x03ff
> > +#define MASK_HSWIDTH_INTERLACED        0x8000
> >
> >  /* HPD Detection */
> >  #define DETECT_UTIL            BIT(7)  /* utility of HDMI level */
>
> Krzysztof,
>
> I can't get this to apply (to 5.13, linux/master, or
> linux-media/master). What are you based on and do you have a git repo
> I can get it from?
>

Krzysztof,

My mistake - I was trying to apply your original patch. I was able to
successfully test this on GW5404-G with several HDMI input formats.

Tested-By: Tim Harvey <tharvey@gateworks.com>

Thanks, this is a great improvement!

Best regards,

Tim
