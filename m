Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47C106D35B7
	for <lists+linux-media@lfdr.de>; Sun,  2 Apr 2023 08:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjDBGH1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 02:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjDBGH0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 02:07:26 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91EBD20C3A
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 23:07:25 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id cr18so21687234qtb.0
        for <linux-media@vger.kernel.org>; Sat, 01 Apr 2023 23:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680415644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KH7t2kaUO8Iy6sUPECDL9yjuPDXuH3Ffmk7Y4RNb/d4=;
        b=W9O0G1uqd6LjQSW4U14s189y+IrL3lI6TdhoLhLelR/HC50PljM/mJQ4lyehH8BFjw
         pLsFmJbm4b0DDwluzb4OTogEIMb+Ox36dovF/DUQoWKZiGlM4Cbico4Wtj+dpoWcLQ0S
         bdwoqwO6uq25DlMTFzbw18MUkV0tqooSaXLSOerglVo2Sfs6Kn7bsUGmzlgIkumlfTe3
         0pB77Sql5HQz8NMg/mFuHNIS1vOAXD/tqclrlFRgfWgFkEHeVcxHKz9qNQZlh2tZGUeT
         2V2RWfs27IWqM2a1fAYoQlWIe+xjJXs5b+xtj9shJjenUbrxswZHuAYa9V7Zt4FGIZ93
         qGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680415644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KH7t2kaUO8Iy6sUPECDL9yjuPDXuH3Ffmk7Y4RNb/d4=;
        b=ricf1w3pehPeNrojnRsjXGrAZl0GAyUmOgULhY4yWTZWCHxwU1rprzyrLg52Jj5hix
         8kulwIGOIiVMfIvfG1PAkJBrv0lXndpNHr8y9UbnZ/8UPAkJnQrL1Kl/Go959xknkQgJ
         KfcCGAyptKA2O1QYeCj8zvHGnFD4BgpdBw64bncUA1KIq5B7WfpfXbCCKQzKG3BQPOIi
         KsAhC96kuyBdRufXurBKVlSt0xLazedQz6C+AhoRv/RlBZK9ELPUMNccp+vDGX2pi6Ld
         RLwxj2J1QwrkxXJkSchVQLN8TIfJc0UK+d1zFYe4E+SDDL5QEEEvQLrpHIO0XxCwD2GB
         zqJA==
X-Gm-Message-State: AAQBX9ddSW/JdPGOz/BOzW0OUlwBc6XGnGy+TbZis4NZnzy+qjgLGUcB
        CCnOTtG1OP/7gUJhEcDwcoWjhQK5g+uEYZqHMwU=
X-Google-Smtp-Source: AK7set9GYX72o9UpjvFY6ErkOLywxp5zAw5Gb/lJrqcu867HE9VPSlV/av8m0jOCPESPEpZunezKkpt12EjXQVA11Yo=
X-Received: by 2002:ac8:5905:0:b0:3de:1720:b54b with SMTP id
 5-20020ac85905000000b003de1720b54bmr11766064qty.0.1680415644696; Sat, 01 Apr
 2023 23:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230221145906.8113-1-hdegoede@redhat.com> <20230221145906.8113-3-hdegoede@redhat.com>
 <Y/TqBBdU7dbYPIsW@smile.fi.intel.com> <109be822-9439-cd5a-c7f7-c63516f92099@redhat.com>
In-Reply-To: <109be822-9439-cd5a-c7f7-c63516f92099@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 2 Apr 2023 08:06:48 +0200
Message-ID: <CAHp75Vd+sgvgQRQhi9FZOL9=ura9g8+xr8ez73XcmRf7Uy11LQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] media: atomisp: Remove continuous mode support
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 1, 2023 at 12:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi Andy,
>
> Thank you for the reviews!
>
> On 2/21/23 16:57, Andy Shevchenko wrote:
> > On Tue, Feb 21, 2023 at 03:58:58PM +0100, Hans de Goede wrote:
> >> Continues mode is a special mode where 2 /dev/video devices can be act=
ive
> >> at the same time. Either the video-preview + video nodes or the
> >> viewfinder (for still capture) + capture nodes.
> >>
> >> For the video-preview + video-recording case modern userspace will
> >> use a single stream multiplexed by pipewire.
> >>
> >> The still-capture case is extra special only starting the preview
> >> stream and then relying on a custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG
> >> ioctl to set things up followed by a second stream on to capture
> >> the amount of configured still pictures. While running the sensor
> >> at full resolution all the time. This case too is better handled
> >> with dma-buf + GPU downscaling for the view-finder rather then all thi=
s
> >> custom special code. Besises this the ioctl expects a bunch of special
> >> non error checked conditions to be met otherwise things will crash/han=
g.
> >>
> >> The continues mode also involves a special cases all over the code
> >> getting in the way of further cleanups and simplifying the code to
> >> using just 1 /dev/video# node. So lets remove it and the
> >> related custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG ioctl.
> >
> > ...
> >
> >> +    ret =3D atomisp_set_fmt_to_snr(vdev, &s_fmt,
> >> +                                 f->fmt.pix.pixelformat, padding_w,
> >
> > At least one parameter can be moved to the previous line.
>
> Ack, fixed in my local tree which I will push to:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=3D=
media-atomisp
>
> When I'm done processing your other review remarks.
>
> >
> >> +                                 padding_h, dvs_env_w, dvs_env_h);
> >> +    if (ret) {
> >> +            dev_warn(isp->dev,
> >> +                     "Set format to sensor failed with %d\n", ret);
> >> +            return -EINVAL;
> >
> > ...
> >
> >>      case ATOMISP_RUN_MODE_PREVIEW:
> >> -            if (!asd->continuous_mode->val) {
> >> -                    if (pipe_id =3D=3D IA_CSS_PIPE_ID_PREVIEW)
> >> -                            return true;
> >> +            if (pipe_id =3D=3D IA_CSS_PIPE_ID_PREVIEW)
> >> +                    return true;
> >>
> >> -                    return false;
> >> -            }
> >> -            fallthrough;
> >> +            return false;
> >
> >               return pipe_id =3D=3D IA_CSS_PIPE_ID_PREVIEW;
>
> I agree that that is cleaner, but there are a bunch of other cases
> in this switch case which are not touched by this patch and
> they all follow the same pattern as which the modified cases
> use after this patch, e.g. :
>
>         case ATOMISP_RUN_MODE_STILL_CAPTURE:
>                 if (pipe_id =3D=3D IA_CSS_PIPE_ID_CAPTURE)
>                         return true;
>
>                 return false;
>
> So this patch basically makes all of them consistent with
> each other. So I'm going to keep this as is.

So, I haven't checked the patch series of 28, but perhaps the above is
a good candidate to have across the entire code, so we reduce the
codebase.
...

> >>      case ATOMISP_RUN_MODE_VIDEO:
> >> -            if (!asd->continuous_mode->val) {
> >> -                    if (pipe_id =3D=3D IA_CSS_PIPE_ID_VIDEO ||
> >> -                        pipe_id =3D=3D IA_CSS_PIPE_ID_YUVPP)
> >> -                            return true;
> >> -                    else
> >> -                            return false;
> >> -            }
> >> -            fallthrough;
> >> +            if (pipe_id =3D=3D IA_CSS_PIPE_ID_VIDEO || pipe_id =3D=3D=
 IA_CSS_PIPE_ID_YUVPP)
> >> +                    return true;
> >> +
> >> +            return false;
> >
> > Similar.

--=20
With Best Regards,
Andy Shevchenko
