Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02584715DE8
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 13:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbjE3Lwd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 07:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbjE3LwW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 07:52:22 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F262D114
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 04:52:08 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-62613b2c8b7so29235426d6.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 04:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685447528; x=1688039528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDQ5OD/DoJde7mR1ZbWpY8CBeCYf0nyLyKUyxLEq9Is=;
        b=g3TX7IR9h+1pIoNmS6wRkSeKGkxfLLpDVN/OKj7wQM1l8W4C/JLWANKamjT92NQKwg
         lFH9fEdJO6DPY4ah5OMwJaTcxu6usdKaJ44U3Z6dIXT8ELT8xIUKDZoCRfizVI/THrl3
         VZj7b5gcNrlS5iyjKKtqBDkF6Ntln+linZswktBGGmIKhr8SQuQM1bMLwViQcnyDX5ch
         r2cODawlw42BMJTa9QtgZ3Uo10ZHwjmru4GpeU9S6C5Aey88+l/+6ySCvNaKFcmTvNxk
         D04D56UXJB1TSae0asWxZvJUCz6fFVJd8cxTzg+i4UEg7ckXjpyt+B8kuUUKAmeQb7k9
         56Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685447528; x=1688039528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDQ5OD/DoJde7mR1ZbWpY8CBeCYf0nyLyKUyxLEq9Is=;
        b=koRChsaPfnVZXFKPsx6jLo28cg5vnt5VtMLuNoR6O6IJC/zkQT4XGezktK2JqmC0BU
         6xBbJ94iOPjU4ctER+rae0HXOpyTbzjJ0ghUSvxxZ44Dq0M/Q5v7XY4CY9NCRdK0Gt/l
         Y3iOuIKe1RAbZzE8lwMvfA5qcZzXFmSYVRHOqiO8pDQivz7aukIEDcnaBRBfsr8oqNWa
         MfNF1gFfkgJQQzZs04LsoY1tB21Qji2WUdBDNoYlDyCYCry2erJLUM+qhPLY/2K0VdTm
         Mshh9Phy2ufjHqoYNS8418Se7m2sklmv+fPBCHDBzcX7BrufdJCvP2nMZBBvmY8gciP1
         0ngg==
X-Gm-Message-State: AC+VfDwyS2bApdy7RhD/lU/ODt2/a2vtWplHPEQ5taTskIQp8mpv2VQd
        6tuSxzKTiYkxkg2Qxpv3w1mw19rKNvjrpT/GiEviezFu2oQ=
X-Google-Smtp-Source: ACHHUZ6oU4fZIf4ubg47vfhzP8spJ6yDVUnxPtBkn9EYJBtIEjOH+EoJvgJ7jRYsAgZnKrpPoJXnspMebJDBadClMYo=
X-Received: by 2002:a05:6214:1c4a:b0:5e0:3825:9ad9 with SMTP id
 if10-20020a0562141c4a00b005e038259ad9mr2078324qvb.2.1685447527721; Tue, 30
 May 2023 04:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-6-hdegoede@redhat.com>
 <CAHp75VeTdAd98hAKGMo+Skqh0KnbCd=NXQHiB7L8jCkmue1zpA@mail.gmail.com>
In-Reply-To: <CAHp75VeTdAd98hAKGMo+Skqh0KnbCd=NXQHiB7L8jCkmue1zpA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 May 2023 14:51:31 +0300
Message-ID: <CAHp75VecdMCp=pqfxFfZ2h81ugGcDjJgQeV8X7fnJ39Bfr2hgg@mail.gmail.com>
Subject: Re: [PATCH 05/21] media: atomisp: ov2680: Add init_cfg pad-op
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 29, 2023 at 9:13=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, May 29, 2023 at 1:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.co=
m> wrote:

...

> > +static int ov2680_init_cfg(struct v4l2_subdev *sd,
> > +                          struct v4l2_subdev_state *sd_state)
> > +{
> > +       struct v4l2_subdev_format fmt =3D {
> > +               .which =3D sd_state ? V4L2_SUBDEV_FORMAT_TRY
> > +               : V4L2_SUBDEV_FORMAT_ACTIVE,
> > +               .format =3D {
> > +                       .width =3D 800,
> > +                       .height =3D 600,
>
> > +               }
>
> I would keep a trailing comma here.
>
> > +       };
> > +
> > +       return ov2680_set_fmt(sd, sd_state, &fmt);
> > +}

This is not addressed in your branch.


--
With Best Regards,
Andy Shevchenko
