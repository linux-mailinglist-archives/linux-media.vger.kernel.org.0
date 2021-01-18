Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1181D2FABB3
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 21:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388979AbhARUjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 15:39:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388255AbhARKfd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 05:35:33 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571D2C0613D3
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 02:34:17 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id a13so7264071qvv.0
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 02:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7wvFzfvZq3gy/QLYapWxVlH+yWiTFpvNNpaLPUEGCQg=;
        b=f1RfBedwvzweG57vnMB4BxRnNDdZIvlF9UywqNZaVb9w26zKkBVneuPPRgARdnf6ZP
         8GvQEtndG8aQhb2zwo+dR8/T8lEV1nMqyy+QYqXCX942Pg3WILt8Q25eAsErsy5vvmmV
         /jmWYeit46oeEasjTm97HK6LmlkhJygUIqLZmTLrK0Oz4rkuEiyWdPdf1b3uYQf/8OcK
         YUkEc2M4z/zON8xxuzcZTr9la0Kctz70xoQVdoZtI5wAfNywcbVMfVTjPtVbzDQ4oeM6
         SDC5kCwBbzrknVzlh07MDNE4vDhCCLt6F6x+kGEufWdzm2axCcg/RNHu3yd6HDM1yHC6
         zquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7wvFzfvZq3gy/QLYapWxVlH+yWiTFpvNNpaLPUEGCQg=;
        b=GYl6+tVu+Ugvruyp1nRjaJa0BzP56f+Zcq1VTLcu9JZjoJXVgGnA/TRg1mcA7T7UOx
         ZnwTuFaSKicag/fga0FpNj3fhkZtQpjMKVwQ/dPFqDYcnkpxLVrDY1fT/UHTbmoDEuRl
         f5ww3/iEdsJjVyVx1kqZeQHSEdRCZttgVRtffOyR8FggjNVpWdTasSoLvZwzq8fxCzlI
         xDKqqDVL/5YajXASEyX/K5Rx02w0yEgo98WCuzY15mvozMNII5/fLDEWbRwiBYcGhPST
         kBwx149o3AqQYMnf+Qk7cRVOErxckT3S3aXJo5cOevYqtuimGn4QXso9OZ6dD3P+cc2a
         F5Nw==
X-Gm-Message-State: AOAM533QrRp9wXydjHw41cxL8fTgAEQTx9hVrX2O6caeolNpYHpe/jkE
        mK7uYaIZfj28mweku/G13XC2jckU54tCiWPkmjila0ij3osPCQ==
X-Google-Smtp-Source: ABdhPJxrdwib1cYm0VEExzMJb/AsVd2MXqJ2vCUKNl5E3jpJ8g15775LII/UpOboZ+I1jCpNLaocZ1zoznSG0Ph6ZoA=
X-Received: by 2002:a0c:a525:: with SMTP id y34mr23187785qvy.37.1610966056570;
 Mon, 18 Jan 2021 02:34:16 -0800 (PST)
MIME-Version: 1.0
References: <CAHoAvW8+1jAirPQPQ-WYYD5fyngckrXA+dLTX+H2ysGzOKUZRg@mail.gmail.com>
 <CAHoAvW_Cju=0svzAExJDuXP9NBnz34Lut8M2+Y9RHUtMXfxJqg@mail.gmail.com>
 <CAHoAvW8k77_ckRdAGGTsu4ALhw4=TUPa27knK3x9zR3bjvjbUw@mail.gmail.com> <CAK8P3a1du9ypzvLk3yoF3FNX8BSvSDSdXwWEMQzuFsVm96w1nw@mail.gmail.com>
In-Reply-To: <CAK8P3a1du9ypzvLk3yoF3FNX8BSvSDSdXwWEMQzuFsVm96w1nw@mail.gmail.com>
From:   root jason <jason.root.w@gmail.com>
Date:   Mon, 18 Jan 2021 18:34:05 +0800
Message-ID: <CAHoAvW8gK3Zm-uJV7uOWGmMQfmR+xP_8+kn6XoBeCv8GiTw7sQ@mail.gmail.com>
Subject: Re: [PATCH]media:dvb: add compat_ioctl def for dmx_dvr
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hans.verkuil@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Arnd Bergmann <arnd@kernel.org> =E4=BA=8E2021=E5=B9=B41=E6=9C=8818=E6=97=A5=
=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=883:38=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jan 18, 2021 at 7:21 AM root jason <jason.root.w@gmail.com> wrote=
:
> > From: jason.wang <jason.root.w@gmail.com>
> >
> > add compat_ioctl define for dmx_dvr to handle ioctl when CONFIG_COMPAT =
is enable.
> >
> > Signed-off-by: .jason.wang <jason.root.w@gmail.com>
> > ---
> >  drivers/media/dvb-core/dmxdev.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/d=
mxdev.c
> > index f14a872d1268..4a9e027de827 100644
> > --- a/drivers/media/dvb-core/dmxdev.c
> > +++ b/drivers/media/dvb-core/dmxdev.c
> > @@ -1393,6 +1393,7 @@ static const struct file_operations dvb_dvr_fops =
=3D {
> >         .read =3D dvb_dvr_read,
> >         .write =3D dvb_dvr_write,
> >         .unlocked_ioctl =3D dvb_dvr_ioctl,
> > +       .compat_ioctl =3D dvb_dvr_ioctl,
> >         .open =3D dvb_dvr_open,
> >         .release =3D dvb_dvr_release,
> >         .poll =3D dvb_dvr_poll,
>
> This is correct for DMX_SET_BUFFER_SIZE, which takes an integer
> argument, but not strictly correct for the other ones that take a pointer
> argument and need a compat_ptr() conversion.
>
> You could do it by either passing both the 'unsigned long arg'
> and the 'void __user *argp' pointer to dvb_usercopy(), with the
> pointer coming from compat_ptr() in case of compat, or you
> add something like
>
>          if (in_compat_syscall())
>                    arg =3D compat_ptr(unsigned long arg);
>
> in the function itself. I checked the DVB ioctls to make sure that
> no other ioctl commands need any special handling, and found
> that DMX_SET_BUFFER_SIZE is the only one.
>
>           Arnd

hi Arnd,
     thank you for your quick comment.

     I upload this change is because if not compt_ioctl dvr_ioctl can
not be invoked
     I checked my local kernel code about compt_ioctl call flow.
     I figure out that my local kernel version is 5.4.70.
     if compat_ioctl is not defined, ioctl cmd need to add into the
array(ioctl_pointer),
     otherwise, unlocked_ioctl will not be called.

     and I check latest kernel version. the logic about this part is
changed.  no need to
     add ioctl cmd into that array.
     for the latest kernel, it should be ok.

    anyway, .thank you for your reply.

jason.wang
