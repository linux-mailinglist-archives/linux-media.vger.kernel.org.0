Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482A47A8240
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 14:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236064AbjITM66 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 08:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235869AbjITM6x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:53 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A73AE191
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 05:58:41 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d77ad095f13so6666615276.2
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695214720; x=1695819520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhN52Axjfx0WJN6DRSBtDitooqrwltiCdBCv1t2K6iw=;
        b=JY2/PSYhEtlQxt2+eAz7152Mze5svv8nz3C3yO2YcrQ5VLsuNu7GO1fKra1oMRAWI+
         LEVnINqQRCW8qCbz2AI6xGNiqDOQm7GldkNeEv+mr19x566cQT3r0tMxGN3G0dA2W12c
         68ICWDim+AODWjv/NfKdgK8rD8r0BcABqjt7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695214720; x=1695819520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhN52Axjfx0WJN6DRSBtDitooqrwltiCdBCv1t2K6iw=;
        b=rvD6HPqFknZSYElrtiYFTYzc1vPSJ1pX7X4ZKc5FdaJyH8b74BfNA40Zk+tclPkbsP
         mRVIT+DQsyT0sNJXrlcWlafDxWttvzanN/cJ2DlopsDJk0xd+ePFEhn0W1FwWZzbm7fT
         hhhj2Cg7+B0ZXZOQiTBhihPNdEzTHO/y9GSINj4UHZf2/uZSekT7q27UrU6ZHPJPSYmf
         lJk1LZhgzo+CWuNvBKtSHCuoIv3n8x1imfRNem5gdNlw7NRDG50LWO/amrKAV6SC61Nl
         iKoZIbHpdsanrzG264d0DnNHx3AE/+vx3UTlJUYkARjhpqI4zU1gB00hLtUuUbYjfMt4
         RKOw==
X-Gm-Message-State: AOJu0YxbooExRYGY38EcFizYJQeS7nNe/v2zJay8yxXpSTh89OiaHHRp
        yj8bl6R2O2pwRJ7GirQFST4MODigXIPaXEjzT72C2g==
X-Google-Smtp-Source: AGHT+IH/xQwsTLWDF8itzf0ML22Erm4ErjxDBpQS0h8TulQCPwQguSNfETMSWaXvLIrRUiMsJNVlLw==
X-Received: by 2002:a25:8b0c:0:b0:d62:d6c5:f5ee with SMTP id i12-20020a258b0c000000b00d62d6c5f5eemr2254178ybl.58.1695214720458;
        Wed, 20 Sep 2023 05:58:40 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id s4-20020a259004000000b00d728a2738f1sm3175934ybl.61.2023.09.20.05.58.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 05:58:39 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d857c8a1d50so1585255276.3
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 05:58:39 -0700 (PDT)
X-Received: by 2002:a25:9012:0:b0:d6b:6b53:d1ab with SMTP id
 s18-20020a259012000000b00d6b6b53d1abmr2428189ybl.38.1695214719242; Wed, 20
 Sep 2023 05:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230919140123.6277-1-ricardo@ribalda.com> <ZQn/aXrIx7ItvrXI@valkosipuli.retiisi.eu>
 <CANiDSCvX03=dwmE6jDvfSPzFwrhbKwLmVpwkOY-6k4uGbvZBuw@mail.gmail.com>
 <ZQoDIbeg00j3STdW@valkosipuli.retiisi.eu> <20230919210306.GD24325@pendragon.ideasonboard.com>
 <CANiDSCu6wsoogSd=8MfmyJNkk+Ocs3wfk-b6Yx+G8L1QEHhArw@mail.gmail.com> <ZQroHhGjbOcocsHt@valkosipuli.retiisi.eu>
In-Reply-To: <ZQroHhGjbOcocsHt@valkosipuli.retiisi.eu>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 20 Sep 2023 14:58:24 +0200
X-Gmail-Original-Message-ID: <CANiDSCtgb4Ac1bZK39RBRmov7_5rMWGcdvZJjfX7yWD6m9Treg@mail.gmail.com>
Message-ID: <CANiDSCtgb4Ac1bZK39RBRmov7_5rMWGcdvZJjfX7yWD6m9Treg@mail.gmail.com>
Subject: Re: [PATCH] yavta: Format type errors for non x86 arches
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Ricardo Ribalda <ricardo@ribalda.com>,
        hverkuil@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Wed, 20 Sept 2023 at 14:40, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> On Wed, Sep 20, 2023 at 02:19:54PM +0200, Ricardo Ribalda wrote:
> > Hi Laurent, Hi Sakari
> >
> >
> >
> > On Tue, 19 Sept 2023 at 23:02, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > On Tue, Sep 19, 2023 at 08:22:57PM +0000, Sakari Ailus wrote:
> > > > Hi Ricardo,
> > > >
> > > > On Tue, Sep 19, 2023 at 10:10:41PM +0200, Ricardo Ribalda wrote:
> > > > > Hi Sakari
> > > > >
> > > > > On Tue, 19 Sept 2023 at 22:07, Sakari Ailus <sakari.ailus@iki.fi>=
 wrote:
> > > > > >
> > > > > > Hi Ricardo,
> > > > > >
> > > > > > Thanks for the patch.
> > > > > >
> > > > > > On Tue, Sep 19, 2023 at 04:01:23PM +0200, Ricardo Ribalda wrote=
:
> > > > > > > mipsel64el, ppc64el, ia64, ppc64, sparc64 and x32 have differ=
ent lenghts
> > > > > > > for long long ints, which result in some compilation errors.
> > > > > > >
> > > > > > > Lets add some castings to help the compiler deal with this.
> > > > > > >
> > > > > > > We cannot use the Format macro constants ffrom inttypes becau=
se they
> > > > > > > seem to not be compatible with kernel (__u64 et al) types.
> > > > > > >
> > > > > > > Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> > > > > > > ---
> > > > > > >  yavta.c | 35 +++++++++++++++++++++--------------
> > > > > > >  1 file changed, 21 insertions(+), 14 deletions(-)
> > > > > > >
> > > > > > > diff --git a/yavta.c b/yavta.c
> > > > > > > index d562863..bf54e4f 100644
> > > > > > > --- a/yavta.c
> > > > > > > +++ b/yavta.c
> > > > > > > @@ -1313,7 +1313,8 @@ static void video_query_menu(struct dev=
ice *dev,
> > > > > > >                       printf("  %u: %.32s%s\n", menu.index, m=
enu.name,
> > > > > > >                              menu.index =3D=3D value ? " (*)"=
 : "");
> > > > > > >               else
> > > > > > > -                     printf("  %u: %lld%s\n", menu.index, me=
nu.value,
> > > > > > > +                     printf("  %u: %lld%s\n", menu.index,
> > > > > >
> > > > > > Could you instead use PRId64 for this? You can avoid casting to=
 another
> > > > > > type this way. Same for the other cases.
> > > > >
> > > > > Already tried this:
> > > > >
> > > > > @@ -1313,7 +1313,7 @@ static void video_query_menu(struct device =
*dev,
> > > > >                         printf("  %u: %.32s%s\n", menu.index, men=
u.name,
> > > > >                                menu.index =3D=3D value ? " (*)" :=
 "");
> > > > >                 else
> > > > > -                       printf("  %u: %lld%s\n", menu.index, menu=
.value,
> > > > > +                       printf("  %u: %" PRId64 "%s\n", menu.inde=
x, menu.value,
> > > > >                                menu.index =3D=3D value ? " (*)" :=
 "");
> > > > >         };
> > > > >  }
> > > > >
> > > > > but gcc was not happy:
> > > > >
> > > > > yavta.c: In function =E2=80=98video_query_menu=E2=80=99:
> > > > > yavta.c:1316:11: warning: format =E2=80=98%ld=E2=80=99 expects ar=
gument of type =E2=80=98long
> > > > > int=E2=80=99, but argument 3 has type =E2=80=98__s64=E2=80=99 {ak=
a =E2=80=98long long int=E2=80=99}
> > > > > [-Wformat=3D]
> > > > >  1316 |    printf("  %u: %" PRId64 "%s\n", menu.index, menu.value=
,
> > > > >       |           ^~~~~~~~~                            ~~~~~~~~~~
> > > > >       |                                                    |
> > > > >       |                                                    __s64 =
{aka
> > > > > long long int}
> > > > > In file included from yavta.c:26:
> > > > > /usr/include/inttypes.h:57:34: note: format string is defined her=
e
> > > > >    57 | # define PRId64  __PRI64_PREFIX "d"
> > > >
> > > > I guess I should have expected this...
> > > >
> > > > I'm not sure if it'd be prettier but another option is to use the P=
RI*
> > > > macros and explicitly cast to a standard type.
> >
> > I would like to avoid
> >
> >   printf(" Hello %" PRId64 "\n", (uint64_t) value_s64);
> >
> > That looks very bad :)
>
> I actually prefer this. It doesn't look bad either IMO, apart from the PR=
I*
> macros that are always ugly, but most importantly you're explicitly using
> 64-bit types that work everywhere.

I am sending a v2, but it looks uglier (not that v1 was super beauty)


>
> >
> > I believe the current casting is the least of the two evils.
> >
> >
> > > >
> > > > Using the standard types in the V4L2 header would have avoided this=
 issue.
> > > > I wonder if there's anything to be gained by using the kernel types=
.
> > >
> > > The kernel has defined __s64 as signed int int for a long time now, o=
n
> > > all architectures, at least since
> > >
> > > commit 0c79a8e29b5fcbcbfd611daf9d500cfad8370fcf
> > > Author: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Date:   Thu Jan 23 15:53:43 2014 -0800
> > >
> > >     asm/types.h: Remove include/asm-generic/int-l64.h
> > >
> > > which was merged in v3.14.
> > >
> > > According to https://buildd.debian.org/status/package.php?p=3Dyavta,
> > > however, __s64 seems to be defined as long int on some platforms.
> > >
> > > /me is puzzled
> >
> > It does not help that __s64 is long long int and PRId64 is "d". I
> > guess we can say that inttypes and kernel types do not play along?
>
> I haven't encountered this issue in the past but I also haven't tried
> compiling for odd architectures.

Just to make it explicit

PRId64 =3D=3D ld and _s64 =3D=3D long long int

is a problem also for x86_64

>
> >
> > I guess we need kerntypes.h with proper KPRId64 but that is probably
> > out of scope here.
>
> This could even depend on the compiler.
>
> I wonder why we aren't using
>
>         typedef uint64_t __u64;
>
> in kernel UAPI headers instead. Including inttypes.h should not be an iss=
ue
> in 2023 anymore.
>
> This problem is certainly wider in scope than yavta.
>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda
