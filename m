Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 929897A6C21
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 22:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233116AbjISULD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 16:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbjISULC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 16:11:02 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3760BE
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 13:10:56 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6562330d68dso28281616d6.2
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 13:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695154255; x=1695759055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0e0c3yjhgnm/+xgJqt9weu36pcAvuEfFjypNu7AsYQ4=;
        b=HEzwvKRbomfk0sDCpoNkGhM7E1aSuzX4YBqUIsKrpktAnNrAUII0HQ1ZPI16LCyjO7
         wetkyq1k+DY8Hav9E2N1ufx9bMfsQI0DlUypjMcnMNgToembss4v+V1UJamZENtdwPcx
         UwQy4lsdALRYXqHgAeWJDtyoW02IbrBlFvrQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695154255; x=1695759055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0e0c3yjhgnm/+xgJqt9weu36pcAvuEfFjypNu7AsYQ4=;
        b=lMeVCqrdO5xvXzhDo3P6Oz5t9ETxhA1HibP2KdAJmmyUWt8WQbT/z9gTCG9ix0+pB7
         aaUbfULHFgIW/bH15B+cOarLZI9mtzVBWSUCaC0LWaYEXdosSzpAWqMqZLhPCr6aWmt/
         e89TPwOIGUs4ilne7lPilGugl5mVhMlpw8zAoOaX1QmgY00mJHBV58o6Q4Duy0zr/29B
         NFWLFWgbccsGbABwKdznNA4DuK/ABoblHPmXowjBcLoAPEoxDJOKdXp4xNEnA7gZrN/b
         W6akLjyC0hauu850lcpbokdqHFI/pI+uNWRQORYYAZY3LBKvILQknhSI2UIRlNcENopF
         tu4A==
X-Gm-Message-State: AOJu0YxLBAMiAY4Ng/SSGRL5c9wJ9MoOzwxmMox4rnw3IZGlue788iqe
        TuEiSSSU5Ko9FIRhEBGhnu8J4+Og3x9UXwGeWYY=
X-Google-Smtp-Source: AGHT+IHSGqMYOlOFNEOF8sS4iKvgieNs23MM5FwXo9GIe3aQ7lk7v2KcFiKRjeJppC5XGPLL+ojnvA==
X-Received: by 2002:a05:6214:3f83:b0:64f:9108:e368 with SMTP id ow3-20020a0562143f8300b0064f9108e368mr474711qvb.30.1695154255379;
        Tue, 19 Sep 2023 13:10:55 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id v17-20020a0ca791000000b0064f378f89a7sm4656221qva.73.2023.09.19.13.10.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 13:10:55 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4121b5334f3so39119951cf.0
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 13:10:55 -0700 (PDT)
X-Received: by 2002:a05:6214:330:b0:649:914:6495 with SMTP id
 j16-20020a056214033000b0064909146495mr428906qvu.62.1695154254629; Tue, 19 Sep
 2023 13:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230919140123.6277-1-ricardo@ribalda.com> <ZQn/aXrIx7ItvrXI@valkosipuli.retiisi.eu>
In-Reply-To: <ZQn/aXrIx7ItvrXI@valkosipuli.retiisi.eu>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 19 Sep 2023 22:10:41 +0200
X-Gmail-Original-Message-ID: <CANiDSCvX03=dwmE6jDvfSPzFwrhbKwLmVpwkOY-6k4uGbvZBuw@mail.gmail.com>
Message-ID: <CANiDSCvX03=dwmE6jDvfSPzFwrhbKwLmVpwkOY-6k4uGbvZBuw@mail.gmail.com>
Subject: Re: [PATCH] yavta: Format type errors for non x86 arches
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Ricardo Ribalda <ricardo@ribalda.com>
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

On Tue, 19 Sept 2023 at 22:07, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> Thanks for the patch.
>
> On Tue, Sep 19, 2023 at 04:01:23PM +0200, Ricardo Ribalda wrote:
> > mipsel64el, ppc64el, ia64, ppc64, sparc64 and x32 have different lenght=
s
> > for long long ints, which result in some compilation errors.
> >
> > Lets add some castings to help the compiler deal with this.
> >
> > We cannot use the Format macro constants ffrom inttypes because they
> > seem to not be compatible with kernel (__u64 et al) types.
> >
> > Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> > ---
> >  yavta.c | 35 +++++++++++++++++++++--------------
> >  1 file changed, 21 insertions(+), 14 deletions(-)
> >
> > diff --git a/yavta.c b/yavta.c
> > index d562863..bf54e4f 100644
> > --- a/yavta.c
> > +++ b/yavta.c
> > @@ -1313,7 +1313,8 @@ static void video_query_menu(struct device *dev,
> >                       printf("  %u: %.32s%s\n", menu.index, menu.name,
> >                              menu.index =3D=3D value ? " (*)" : "");
> >               else
> > -                     printf("  %u: %lld%s\n", menu.index, menu.value,
> > +                     printf("  %u: %lld%s\n", menu.index,
>
> Could you instead use PRId64 for this? You can avoid casting to another
> type this way. Same for the other cases.

Already tried this:

@@ -1313,7 +1313,7 @@ static void video_query_menu(struct device *dev,
                        printf("  %u: %.32s%s\n", menu.index, menu.name,
                               menu.index =3D=3D value ? " (*)" : "");
                else
-                       printf("  %u: %lld%s\n", menu.index, menu.value,
+                       printf("  %u: %" PRId64 "%s\n", menu.index, menu.va=
lue,
                               menu.index =3D=3D value ? " (*)" : "");
        };
 }

but gcc was not happy:

yavta.c: In function =E2=80=98video_query_menu=E2=80=99:
yavta.c:1316:11: warning: format =E2=80=98%ld=E2=80=99 expects argument of =
type =E2=80=98long
int=E2=80=99, but argument 3 has type =E2=80=98__s64=E2=80=99 {aka =E2=80=
=98long long int=E2=80=99}
[-Wformat=3D]
 1316 |    printf("  %u: %" PRId64 "%s\n", menu.index, menu.value,
      |           ^~~~~~~~~                            ~~~~~~~~~~
      |                                                    |
      |                                                    __s64 {aka
long long int}
In file included from yavta.c:26:
/usr/include/inttypes.h:57:34: note: format string is defined here
   57 | # define PRId64  __PRI64_PREFIX "d"

So I took the shotgun and fixed it with castings :)


>
> > +                            (long long)menu.value,
> >                              menu.index =3D=3D value ? " (*)" : "");
> >       };
> >  }
>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda
