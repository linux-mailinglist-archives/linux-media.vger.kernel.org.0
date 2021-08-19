Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3163F210C
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 21:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbhHSTxN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 15:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhHSTxN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 15:53:13 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C42C061575
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 12:52:36 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso12145507pjb.2
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 12:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JLR3/Tzo397T8TPt0QvJ4Ukv/VXdUANi7HJVf1QYHrQ=;
        b=g8z6YrVZArvT/HXJx3/mHjHi6M4D7D/EgtR2obzEHoCprIWkSn6MwqpjSlXWyFkcnK
         Pj/aVsb+DFjpq9wD/m4he9+J3kDkEWeyX3WbMYs43rPpfobFYVp+JBXvfvMNUQgjLOXN
         U7+73p71PTKRdOdnbrJmi7wZuRr+YwcBGghhPO9aFtfTyUOdH6/0x9DwVfArtwgIHqfR
         caL/G6Z/iSfy+l+pVuyqULhrytDDTGJ4QfW+a6IFp/A2K3irj417Z6nSxxKoxx/NQVLJ
         CBdL102e/tfzKQ0JZWMRBnjQsG2VjSr80z9JyMADJ9lGAKdzVjiFFAgYR2cQ4HMJriR1
         e7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JLR3/Tzo397T8TPt0QvJ4Ukv/VXdUANi7HJVf1QYHrQ=;
        b=fLEomFokQjI/7rswf5JZSFXGlizkuYRqIcfMuyrAUP7eXX5ISwig9bsW85f63GV40E
         ROKStRF3pcLkXqMh4+B1Twjtkyvf4MKbGelPCppXsDtuxyie6B9CqlNkNXxTTjgt/KM8
         k4/bUGLLaybgizOAMMYtFaBukcTCGweEToeWjfutWuJJrpvgFLQkhJu3fZvfD3+OT6sU
         Kq52ihK+qdWxg1fmjLnfM293J3a93vm3RbNMDMHf1dNspECfV1KOaUCavSJ3LBGr+F9H
         QGFeUUBCbBvXSPlc0VZBGgZPiyFSLfNaEZKGtqAX/FQxutjKrdgcwAuVlcqDRySCNSmk
         vb0A==
X-Gm-Message-State: AOAM532vkgsG9FvvDAFPU7ydYLFTvp0mV3v8xB7z9GkPg+mivEZs/edi
        hanqcpro6TG2EQx+QE4QjLd9EFZLtlbpldC7EC32VA==
X-Google-Smtp-Source: ABdhPJyduo0jwtpTOSw83fQYjq8FSMRiqMNH+DO2DuoltUq66Dxby1n6lSA4B5xu0EWV1po5BwhpNwVJSqNUSrstaos=
X-Received: by 2002:a17:902:a9c7:b029:12b:349:b318 with SMTP id
 b7-20020a170902a9c7b029012b0349b318mr13281658plr.13.1629402756032; Thu, 19
 Aug 2021 12:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <m3sg01baq9.fsf@t19.piap.pl>
In-Reply-To: <m3sg01baq9.fsf@t19.piap.pl>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 19 Aug 2021 12:52:24 -0700
Message-ID: <CAJ+vNU2UR=aY0gFQgAL4wS_cBf59rKM9ce5W=byOo75TOpBQSw@mail.gmail.com>
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

On Mon, Jul 26, 2021 at 4:01 AM Krzysztof Ha=C5=82asa <khalasa@piap.pl> wro=
te:
>
> The TDA1997x (HDMI receiver) driver currently uses a specific video
> format detection scheme. The frame (or field in interlaced mode), line
> and HSync pulse durations are compared to those of known, standard video
> modes. If a match is found, the mode is assumed to be detected,
> otherwise -ERANGE is returned (then possibly ignored). This means that:
> - another mode with similar timings will be detected incorrectly
>   (e.g. 2x faster clock and lines twice as long)
> - non-standard modes will not work.
>
> I propose to replace this scheme with a direct read of geometry
> registers. This way all modes recognized by the chip will be supported.
>
> In interlaced modes, the code assumes the V sync signal has the same
> duration for both fields. While this may be not necessarily true,
> I can't see any way to get the "other" V sync width. This is most
> probably harmless.
>
> I have checked the register values in interlaced mode, but currently
> can't test such a setup (I only have remote access to a device working
> in interlaced mode). Perhaps this will change in time.
>
> All tests have been performed on Gateworks' Ventana GW54xx board, with
> a TDA19971 chip.
>
> Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>
>
> ---
> This version extracts H and V sync polarities of the incoming signal and
> matches the parameters against the standard video modes.
>
> 1/1000 pixel clock tolerance had to be increased to 1/500 because the
> 1/1.001 (NTSC-like) pixclk and frame rate reduction already caused
> 1/1000 deviation, and there was no room for further difference.
>
> This patch requires just posted "[PATCH] TDA1997x: report -ENOLINK
> after disconnecting HDMI source".
>
> diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
> index 36a7b89afb08..a6afb387785d 100644
> --- a/drivers/media/i2c/tda1997x.c
> +++ b/drivers/media/i2c/tda1997x.c
> @@ -1092,67 +1092,82 @@ tda1997x_detect_std(struct tda1997x_state *state,
>                     struct v4l2_dv_timings *timings)
>  {
>         struct v4l2_subdev *sd =3D &state->sd;
> -       u32 vper;
> -       u16 hper;
> -       u16 hsper;
> -       int i;
>
>         /*
>          * Read the FMT registers
> -        *   REG_V_PER: Period of a frame (or two fields) in MCLK(27MHz) =
cycles
> -        *   REG_H_PER: Period of a line in MCLK(27MHz) cycles
> -        *   REG_HS_WIDTH: Period of horiz sync pulse in MCLK(27MHz) cycl=
es
> +        *   REG_V_PER: Period of a frame (or field) in MCLK (27MHz) cycl=
es
> +        *   REG_H_PER: Period of a line in MCLK (27MHz) cycles
> +        *   REG_HS_WIDTH: Period of horiz sync pulse in MCLK (27MHz) cyc=
les
>          */
> -       vper =3D io_read24(sd, REG_V_PER) & MASK_VPER;
> -       hper =3D io_read16(sd, REG_H_PER) & MASK_HPER;
> -       hsper =3D io_read16(sd, REG_HS_WIDTH) & MASK_HSWIDTH;
> -       v4l2_dbg(1, debug, sd, "Signal Timings: %u/%u/%u\n", vper, hper, =
hsper);
> +       u32 vper, vsync_pos;
> +       u16 hper, hsync_pos, hsper, interlaced;
> +       u16 htot, hact, hfront, hsync, hback;
> +       u16 vtot, vact, vfront1, vfront2, vsync, vback1, vback2;
>
>         if (!state->input_detect[0] && !state->input_detect[1])
>                 return -ENOLINK;
>
> -       for (i =3D 0; v4l2_dv_timings_presets[i].bt.width; i++) {
> -               const struct v4l2_bt_timings *bt;
> -               u32 lines, width, _hper, _hsper;
> -               u32 vmin, vmax, hmin, hmax, hsmin, hsmax;
> -               bool vmatch, hmatch, hsmatch;
> -
> -               bt =3D &v4l2_dv_timings_presets[i].bt;
> -               width =3D V4L2_DV_BT_FRAME_WIDTH(bt);
> -               lines =3D V4L2_DV_BT_FRAME_HEIGHT(bt);
> -               _hper =3D (u32)bt->pixelclock / width;
> -               if (bt->interlaced)
> -                       lines /=3D 2;
> -               /* vper +/- 0.7% */
> -               vmin =3D ((27000000 / 1000) * 993) / _hper * lines;
> -               vmax =3D ((27000000 / 1000) * 1007) / _hper * lines;
> -               /* hper +/- 1.0% */
> -               hmin =3D ((27000000 / 100) * 99) / _hper;
> -               hmax =3D ((27000000 / 100) * 101) / _hper;
> -               /* hsper +/- 2 (take care to avoid 32bit overflow) */
> -               _hsper =3D 27000 * bt->hsync / ((u32)bt->pixelclock/1000)=
;
> -               hsmin =3D _hsper - 2;
> -               hsmax =3D _hsper + 2;
> -
> -               /* vmatch matches the framerate */
> -               vmatch =3D ((vper <=3D vmax) && (vper >=3D vmin)) ? 1 : 0=
;
> -               /* hmatch matches the width */
> -               hmatch =3D ((hper <=3D hmax) && (hper >=3D hmin)) ? 1 : 0=
;
> -               /* hsmatch matches the hswidth */
> -               hsmatch =3D ((hsper <=3D hsmax) && (hsper >=3D hsmin)) ? =
1 : 0;
> -               if (hmatch && vmatch && hsmatch) {
> -                       v4l2_print_dv_timings(sd->name, "Detected format:=
 ",
> -                                             &v4l2_dv_timings_presets[i]=
,
> -                                             false);
> -                       if (timings)
> -                               *timings =3D v4l2_dv_timings_presets[i];
> -                       return 0;
> -               }
> -       }
> +       vper =3D io_read24(sd, REG_V_PER);
> +       hper =3D io_read16(sd, REG_H_PER);
> +       hsper =3D io_read16(sd, REG_HS_WIDTH);
> +       vsync_pos =3D vper & MASK_VPER_SYNC_POS;
> +       hsync_pos =3D hper & MASK_HPER_SYNC_POS;
> +       interlaced =3D hsper & MASK_HSWIDTH_INTERLACED;
> +       vper &=3D MASK_VPER;
> +       hper &=3D MASK_HPER;
> +       hsper &=3D MASK_HSWIDTH;
> +       v4l2_dbg(1, debug, sd, "Signal Timings: %u/%u/%u\n", vper, hper, =
hsper);
>
> -       v4l_err(state->client, "no resolution match for timings: %d/%d/%d=
\n",
> -               vper, hper, hsper);
> -       return -ERANGE;
> +       htot =3D io_read16(sd, REG_FMT_H_TOT);
> +       hact =3D io_read16(sd, REG_FMT_H_ACT);
> +       hfront =3D io_read16(sd, REG_FMT_H_FRONT);
> +       hsync =3D io_read16(sd, REG_FMT_H_SYNC);
> +       hback =3D io_read16(sd, REG_FMT_H_BACK);
> +
> +       vtot =3D io_read16(sd, REG_FMT_V_TOT);
> +       vact =3D io_read16(sd, REG_FMT_V_ACT);
> +       vfront1 =3D io_read(sd, REG_FMT_V_FRONT_F1);
> +       vfront2 =3D io_read(sd, REG_FMT_V_FRONT_F2);
> +       vsync =3D io_read(sd, REG_FMT_V_SYNC);
> +       vback1 =3D io_read(sd, REG_FMT_V_BACK_F1);
> +       vback2 =3D io_read(sd, REG_FMT_V_BACK_F2);
> +
> +       v4l2_dbg(1, debug, sd, "Geometry: H %u %u %u %u %u Sync%c  V %u %=
u %u %u %u %u %u Sync%c\n",
> +                htot, hact, hfront, hsync, hback, hsync_pos ? '+' : '-',
> +                vtot, vact, vfront1, vfront2, vsync, vback1, vback2, vsy=
nc_pos ? '+' : '-');
> +
> +       if (!timings)
> +               return 0;
> +
> +       timings->type =3D V4L2_DV_BT_656_1120;
> +       timings->bt.width =3D hact;
> +       timings->bt.hfrontporch =3D hfront;
> +       timings->bt.hsync =3D hsync;
> +       timings->bt.hbackporch =3D hback;
> +       timings->bt.height =3D vact;
> +       timings->bt.vfrontporch =3D vfront1;
> +       timings->bt.vsync =3D vsync;
> +       timings->bt.vbackporch =3D vback1;
> +       timings->bt.interlaced =3D interlaced ? V4L2_DV_INTERLACED : V4L2=
_DV_PROGRESSIVE;
> +       timings->bt.polarities =3D vsync_pos ? V4L2_DV_VSYNC_POS_POL : 0;
> +       timings->bt.polarities |=3D hsync_pos ? V4L2_DV_HSYNC_POS_POL : 0=
;
> +
> +       timings->bt.pixelclock =3D (u64)htot * vtot * 27000000;
> +       if (interlaced) {
> +               timings->bt.il_vfrontporch =3D vfront2;
> +               timings->bt.il_vsync =3D timings->bt.vsync;
> +               timings->bt.il_vbackporch =3D vback2;
> +               do_div(timings->bt.pixelclock, vper * 2 /* full frame */)=
;
> +       } else {
> +               timings->bt.il_vfrontporch =3D 0;
> +               timings->bt.il_vsync =3D 0;
> +               timings->bt.il_vbackporch =3D 0;
> +               do_div(timings->bt.pixelclock, vper);
> +       }
> +       v4l2_find_dv_timings_cap(timings, &tda1997x_dv_timings_cap,
> +                                (u32)timings->bt.pixelclock / 500, NULL,=
 NULL);
> +       v4l2_print_dv_timings(sd->name, "Detected format: ", timings, fal=
se);
> +       return 0;
>  }
>
>  /* some sort of errata workaround for chip revision 0 (N1) */
> diff --git a/drivers/media/i2c/tda1997x_regs.h b/drivers/media/i2c/tda199=
7x_regs.h
> index d9b3daada07d..115371ba33f0 100644
> --- a/drivers/media/i2c/tda1997x_regs.h
> +++ b/drivers/media/i2c/tda1997x_regs.h
> @@ -117,9 +117,12 @@
>  #define REG_CURPAGE_00H                0xFF
>
>  #define MASK_VPER              0x3fffff
> +#define MASK_VPER_SYNC_POS     0x800000
>  #define MASK_VHREF             0x3fff
>  #define MASK_HPER              0x0fff
> +#define MASK_HPER_SYNC_POS     0x8000
>  #define MASK_HSWIDTH           0x03ff
> +#define MASK_HSWIDTH_INTERLACED        0x8000
>
>  /* HPD Detection */
>  #define DETECT_UTIL            BIT(7)  /* utility of HDMI level */

Krzysztof,

I can't get this to apply (to 5.13, linux/master, or
linux-media/master). What are you based on and do you have a git repo
I can get it from?

Also, for quick testing do you recall how to invoke the 'log_debug'
function from userspace? I think its a v4l2-ctl operation.

Best regards,

Tim
