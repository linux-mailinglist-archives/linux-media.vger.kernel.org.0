Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F22970176B
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 15:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237845AbjEMNaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 09:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237196AbjEMNaQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 09:30:16 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D6C55B9
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 06:29:52 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-75131c2997bso3706335385a.1
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683984589; x=1686576589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mmjfa5yVgz89XK2CMXoqtiI9C/6FTHnHaGEc1CV8zIY=;
        b=ePmeH3PY6l9BJtG/C3Rt3ze+8sLB1NnBglebTapvtn1SOIB53m1kQAbu89TeoQSEpk
         we3Ydhhv1eFKJ+4s8YvcQED8Sw6K2hHAdgyoLcvTgSGXTqhGmWVm1cc1qCnEJVutAryK
         02FE0mFPV+WFgRREzTq32g+8ci6Nw5+Q9uoZGSVbFeFGJKtjxkekUL4Tds4aXKq+R291
         zJq4G2PIMY0DomXSInEX2chVCHfnrXK9cr088B0yzIsAc2o7c9DwZeOUN//zNd/aiIPa
         VyYzejP7NGkP6W69e53xwyDoZR2W/c7wM2nWSTaZmIANjABi+C1kFwm5RJew0oK4EeNg
         /nCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683984589; x=1686576589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mmjfa5yVgz89XK2CMXoqtiI9C/6FTHnHaGEc1CV8zIY=;
        b=CR+IecrqeKdZ/C8eh4OHRhH78xDNGfmc4xzpTDy68J6EQoTUQdPUQE7oMNVms7+Ajc
         pIXeROTYZoXfJxKp83HWBb3DtGAqV1Ti18PH47mfWNCvzyRvsukjHfQJbnWIXxOHFFDr
         ndTy2arL+zR92ICMSukPA+RddagFBPnFD7SHTsJCkNWnf+fuuRwVtA+PYFiN0fqWRxpQ
         Pr1xO5cxexIUuNcAtpDQ6KBiZ1EzAzt6HB/cSQ4/cUdgVT8rW304wG0UqSI7F9pxeSju
         8WvwNsNZMmG6d9cGbwZoYL1VjjfuyQMDwwa+dQnW4X236db7FVAo9Q0FKfLZxw5gPpWS
         LL4A==
X-Gm-Message-State: AC+VfDyGjCGm2vynQ319jI73zAMtbC9Mz/RJOdOiK/rDArLXrM84zPnS
        IfwN843O7bK0YogolxkPLVqyPXX9XWb5GaX1kXk/t5j9mqUngg==
X-Google-Smtp-Source: ACHHUZ407gP13ItmzQi75curzOMniseqHxeHblJZE3AW1Ptm2LcY0iYe0blnaUUHM79KO6r5SYWab0yGZ+TWtas4ZwU=
X-Received: by 2002:a05:6214:5297:b0:61b:58ec:24c8 with SMTP id
 kj23-20020a056214529700b0061b58ec24c8mr46320532qvb.10.1683984588864; Sat, 13
 May 2023 06:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230513123159.33234-1-hdegoede@redhat.com> <20230513123159.33234-3-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-3-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 13 May 2023 16:29:12 +0300
Message-ID: <CAHp75VetX5LD-kXC0iVGc6ckguTN_s0k+Sww3MuuvyUEth3wZQ@mail.gmail.com>
Subject: Re: [PATCH 02/30] media: atomisp: Remove Continuous capture and SDV run-modes
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

On Sat, May 13, 2023 at 3:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Since we no longer support Continuous mode, setting the run_mode to
> ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE no longer make sense, so remove
> this.
>
> While at it also remove ATOMISP_RUN_MODE_SDV, which was never exposed

it, also

> to userspace in the first place.

...

>  #define V4L2_CID_RUN_MODE                      (V4L2_CID_CAMERA_LASTP1 +=
 20)
>  #define ATOMISP_RUN_MODE_VIDEO                 1
>  #define ATOMISP_RUN_MODE_STILL_CAPTURE         2
> -#define ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE    3
> -#define ATOMISP_RUN_MODE_PREVIEW               4
> -#define ATOMISP_RUN_MODE_SDV                   5
> +#define ATOMISP_RUN_MODE_PREVIEW               3

Wouldn't it be better to add here a _MODE_MIN and _MODE_MAX and...
(see at the end of this message)

...

> @@ -758,7 +758,6 @@ static const char *const ctrl_run_mode_menu[] =3D {
>         NULL,
>         "Video",
>         "Still capture",
> -       "Continuous capture",
>         "Preview",

Wouldn't be more robust to use indices like

  [_MODE_PREVIEW] =3D "Preview",

?

...

>         .type =3D V4L2_CTRL_TYPE_MENU,
>         .min =3D 1,
>         .def =3D 1,
> -       .max =3D 4,
> +       .max =3D 3,

...use it here? Or did I miss these min and max meanings?

>         .qmenu =3D ctrl_run_mode_menu,

--=20
With Best Regards,
Andy Shevchenko
