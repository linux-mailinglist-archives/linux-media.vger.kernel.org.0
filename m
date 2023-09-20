Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABBD87A7EBC
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 14:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235672AbjITMUV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 08:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235655AbjITMUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 08:20:18 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D5292
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 05:20:12 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-76f08e302a1so439378385a.1
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 05:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695212411; x=1695817211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E85Y3wxX4/PuIWHuumYTWFFq1A8urHbmzfEt46MpMUY=;
        b=cuQsmWMo47x7wLzCR1tO71pEoWh+M8N3iX6lC4LhZunRIHAP8afpvvUbXNwpstEPWi
         qBusVLA6IM30ynWl903Loxd10FJ/qQG2e7/BrkYXKC00KPMdsAOIeqUJDh5bQHQW+z5c
         m3ocDnnI0sks5N5eELkdECOzS/Ce8/+sNdm4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695212411; x=1695817211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E85Y3wxX4/PuIWHuumYTWFFq1A8urHbmzfEt46MpMUY=;
        b=LZWAg1sa1mC+q/GIde+/dbQ0jYezEnGAa1NPKZEaCR9PJB74CZkvPNhFYm23qsZZSN
         klsiVVaRVrGhKFQRRzxLzreecwRynRABI0ivBbybGkuxUigARq7JYHytdh+7YfJrB1SX
         Tn8w0xOoA1hTmgManwA2fuw/A9EcM4o1z50eDIowSdogk8AyzQwaZbDnU5gxkXqbSNCN
         T6Lq4U5Z8hm4f+z8g9imA/oNukJRIjvoMazNaoQqCsTYHg89JhXqPtDtFhu+IkBEqN5X
         YH/6H0H3a3MRbxBorEvdhv+PjXBXbbhEP9N/rvLJRrcyEymn1rqJVkaBSxdvuIcfcN9D
         Dq7w==
X-Gm-Message-State: AOJu0YzFyuGQ73WzZxgXP6RrXh0Tb2zxtB+rxpKckJJjCQGj0zqK5AeL
        kIF4ZBnasDLQqEVTvXhqY/VldUO5V+buQsNJoZsBWA==
X-Google-Smtp-Source: AGHT+IGjnd3lOUWel+tDauWwhetuGQWHiDT3xQjZTDp0VtKMqEL+Vceyufv/N3IahCu1vpAYyoJ0Uw==
X-Received: by 2002:a05:620a:22f5:b0:773:f7ad:7e0b with SMTP id p21-20020a05620a22f500b00773f7ad7e0bmr873516qki.58.1695212411119;
        Wed, 20 Sep 2023 05:20:11 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id g12-20020a37e20c000000b0076f12fcb0easm4790558qki.2.2023.09.20.05.20.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 05:20:10 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-656307a52e8so28799616d6.1
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 05:20:09 -0700 (PDT)
X-Received: by 2002:a0c:aac9:0:b0:658:2f85:29c8 with SMTP id
 g9-20020a0caac9000000b006582f8529c8mr1744599qvb.53.1695212409145; Wed, 20 Sep
 2023 05:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230919140123.6277-1-ricardo@ribalda.com> <ZQn/aXrIx7ItvrXI@valkosipuli.retiisi.eu>
 <CANiDSCvX03=dwmE6jDvfSPzFwrhbKwLmVpwkOY-6k4uGbvZBuw@mail.gmail.com>
 <ZQoDIbeg00j3STdW@valkosipuli.retiisi.eu> <20230919210306.GD24325@pendragon.ideasonboard.com>
In-Reply-To: <20230919210306.GD24325@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 20 Sep 2023 14:19:54 +0200
X-Gmail-Original-Message-ID: <CANiDSCu6wsoogSd=8MfmyJNkk+Ocs3wfk-b6Yx+G8L1QEHhArw@mail.gmail.com>
Message-ID: <CANiDSCu6wsoogSd=8MfmyJNkk+Ocs3wfk-b6Yx+G8L1QEHhArw@mail.gmail.com>
Subject: Re: [PATCH] yavta: Format type errors for non x86 arches
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        Ricardo Ribalda <ricardo@ribalda.com>, hverkuil@xs4all.nl
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

Hi Laurent, Hi Sakari



On Tue, 19 Sept 2023 at 23:02, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Sep 19, 2023 at 08:22:57PM +0000, Sakari Ailus wrote:
> > Hi Ricardo,
> >
> > On Tue, Sep 19, 2023 at 10:10:41PM +0200, Ricardo Ribalda wrote:
> > > Hi Sakari
> > >
> > > On Tue, 19 Sept 2023 at 22:07, Sakari Ailus <sakari.ailus@iki.fi> wro=
te:
> > > >
> > > > Hi Ricardo,
> > > >
> > > > Thanks for the patch.
> > > >
> > > > On Tue, Sep 19, 2023 at 04:01:23PM +0200, Ricardo Ribalda wrote:
> > > > > mipsel64el, ppc64el, ia64, ppc64, sparc64 and x32 have different =
lenghts
> > > > > for long long ints, which result in some compilation errors.
> > > > >
> > > > > Lets add some castings to help the compiler deal with this.
> > > > >
> > > > > We cannot use the Format macro constants ffrom inttypes because t=
hey
> > > > > seem to not be compatible with kernel (__u64 et al) types.
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> > > > > ---
> > > > >  yavta.c | 35 +++++++++++++++++++++--------------
> > > > >  1 file changed, 21 insertions(+), 14 deletions(-)
> > > > >
> > > > > diff --git a/yavta.c b/yavta.c
> > > > > index d562863..bf54e4f 100644
> > > > > --- a/yavta.c
> > > > > +++ b/yavta.c
> > > > > @@ -1313,7 +1313,8 @@ static void video_query_menu(struct device =
*dev,
> > > > >                       printf("  %u: %.32s%s\n", menu.index, menu.=
name,
> > > > >                              menu.index =3D=3D value ? " (*)" : "=
");
> > > > >               else
> > > > > -                     printf("  %u: %lld%s\n", menu.index, menu.v=
alue,
> > > > > +                     printf("  %u: %lld%s\n", menu.index,
> > > >
> > > > Could you instead use PRId64 for this? You can avoid casting to ano=
ther
> > > > type this way. Same for the other cases.
> > >
> > > Already tried this:
> > >
> > > @@ -1313,7 +1313,7 @@ static void video_query_menu(struct device *dev=
,
> > >                         printf("  %u: %.32s%s\n", menu.index, menu.na=
me,
> > >                                menu.index =3D=3D value ? " (*)" : "")=
;
> > >                 else
> > > -                       printf("  %u: %lld%s\n", menu.index, menu.val=
ue,
> > > +                       printf("  %u: %" PRId64 "%s\n", menu.index, m=
enu.value,
> > >                                menu.index =3D=3D value ? " (*)" : "")=
;
> > >         };
> > >  }
> > >
> > > but gcc was not happy:
> > >
> > > yavta.c: In function =E2=80=98video_query_menu=E2=80=99:
> > > yavta.c:1316:11: warning: format =E2=80=98%ld=E2=80=99 expects argume=
nt of type =E2=80=98long
> > > int=E2=80=99, but argument 3 has type =E2=80=98__s64=E2=80=99 {aka =
=E2=80=98long long int=E2=80=99}
> > > [-Wformat=3D]
> > >  1316 |    printf("  %u: %" PRId64 "%s\n", menu.index, menu.value,
> > >       |           ^~~~~~~~~                            ~~~~~~~~~~
> > >       |                                                    |
> > >       |                                                    __s64 {aka
> > > long long int}
> > > In file included from yavta.c:26:
> > > /usr/include/inttypes.h:57:34: note: format string is defined here
> > >    57 | # define PRId64  __PRI64_PREFIX "d"
> >
> > I guess I should have expected this...
> >
> > I'm not sure if it'd be prettier but another option is to use the PRI*
> > macros and explicitly cast to a standard type.

I would like to avoid

  printf(" Hello %" PRId64 "\n", (uint64_t) value_s64);

That looks very bad :)

I believe the current casting is the least of the two evils.


> >
> > Using the standard types in the V4L2 header would have avoided this iss=
ue.
> > I wonder if there's anything to be gained by using the kernel types.
>
> The kernel has defined __s64 as signed int int for a long time now, on
> all architectures, at least since
>
> commit 0c79a8e29b5fcbcbfd611daf9d500cfad8370fcf
> Author: Geert Uytterhoeven <geert@linux-m68k.org>
> Date:   Thu Jan 23 15:53:43 2014 -0800
>
>     asm/types.h: Remove include/asm-generic/int-l64.h
>
> which was merged in v3.14.
>
> According to https://buildd.debian.org/status/package.php?p=3Dyavta,
> however, __s64 seems to be defined as long int on some platforms.
>
> /me is puzzled

It does not help that __s64 is long long int and PRId64 is "d". I
guess we can say that inttypes and kernel types do not play along?

I guess we need kerntypes.h with proper KPRId64 but that is probably
out of scope here.



Thanks!
>
> > Cc Hans, too.
> >
> > > So I took the shotgun and fixed it with castings :)
> >
> > :-)
>
> --
> Regards,
>
> Laurent Pinchart



--=20
Ricardo Ribalda
