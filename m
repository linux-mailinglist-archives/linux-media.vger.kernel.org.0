Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF1416D39F2
	for <lists+linux-media@lfdr.de>; Sun,  2 Apr 2023 21:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbjDBTMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 15:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDBTMm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 15:12:42 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF47AF33
        for <linux-media@vger.kernel.org>; Sun,  2 Apr 2023 12:12:41 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id cr18so22603035qtb.0
        for <linux-media@vger.kernel.org>; Sun, 02 Apr 2023 12:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680462761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxpRZdmx0iySPXH8ucSPhY1KYiLxwxgurj2dX3eGGv4=;
        b=C7OkK7/P4pv/w2fIG61hZg9CytOav93at8G2Hj+at8K7GfRhH2jaILnfjpd70lfcDr
         c9IQ2UYm93yaehAyJabuuSsDqn40Oe6kg3elySwigXxHuGeIoa0JUv8Y8QV83kIeBN9k
         NxhC+q/67T7X+7CFTDXmmHtPKo+faIiulnfAD+mLaRK9wfWiBHJlR0AVmyJf0GM7RNjd
         LubgCiZYJ2+xWGaJVufuJ0+8TqLJjiEOuxbTABD3I3rUA/0B89AdgdKPzD7jWz0jkHU0
         se8tvjqmiSJQdaVA6lymmc29rOtOvKnKt9uDvpUJhYglVSjxgve9dq+qq5ws+Qt+hLsb
         BQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680462761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxpRZdmx0iySPXH8ucSPhY1KYiLxwxgurj2dX3eGGv4=;
        b=lc3O0BPnyidjCxU0jNnq1UXgihjFCrSi6hJofw/d0s6kdyEfgzwgomgrznc+8jzX5h
         kFIaoOj6YYuD7nn7cHp1baCR28a7vpIgud4PVeOqulPLVkXXXjMmAg8LNMh41CQTX/JA
         7Ugps65aj/TEhxyUKWeSSv02Rv6WrJY+lrgYei49keEQo/Bh6IJoiKW9S3kEaBb76Wrz
         pufHMuJmy0eiYZJOIXsnUiZTgn7SG1N3ABlmHLDYvohJCR+CU/c6t1BwoF9k8M7w1TVT
         mQFnE4uzGDi5n9/tsqm8KaUmRSAVhOEXQ0ScBbWbgJDyz/L2+NEVXIWShyDM1jplPgQp
         zBIA==
X-Gm-Message-State: AAQBX9e37KhrznxNcUE/baimByEjGAp9uDJ3KnPtV16p8IbmlIg9P02q
        6AsBPiB/KSfBbT8qTGNsoir/Dkzc39LUIapebdk=
X-Google-Smtp-Source: AKy350ZDTtTtC4qNGzVfox3y19DixM0Fw4DyPtzM/yud+g24hZZt5SVakDXeXoqHSkJNUU2uI3kV69Khvamm+GZObWk=
X-Received: by 2002:a05:622a:1a8c:b0:3da:d56c:8f50 with SMTP id
 s12-20020a05622a1a8c00b003dad56c8f50mr12889931qtc.0.1680462760887; Sun, 02
 Apr 2023 12:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-29-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-29-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 2 Apr 2023 21:12:04 +0200
Message-ID: <CAHp75VcOpL=aL9suDvBxiCK3cqm4vqCwVfwUp9SSFc31H+15cQ@mail.gmail.com>
Subject: Re: [PATCH 28/28] media: atomisp: gmin_platform: Add Lenovo Ideapad
 Miix 310 gmin_vars
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
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

On Sat, Apr 1, 2023 at 5:00=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> The _DSM used to get sensor variables like CsiPort returns the wrong
> csi-port for the front OV2680 sensor on the Lenovo Ideapad Miix 310
> add a gmin_vars DMI quirk / override setting the right CsiPort.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/pci/atomisp_gmin_platform.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/=
drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index f83de0ffaf16..efcfc133311f 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -304,7 +304,17 @@ static struct gmin_cfg_var surface3_vars[] =3D {
>         {},
>  };
>
> +static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] =3D {
> +       /* _DSM contains the wrong CsiPort! */
> +       { "OVTI2680:01_CsiPort", "0" },
> +       {}
> +};
> +
>  static const struct dmi_system_id gmin_vars[] =3D {
> +       /*
> +        * These DMI ids where present when the atomisp driver was merged=
 into

IDs
were ?

> +        * drivers/staging and it is unclear if they are really necessary=
.
> +        */

MRD7 and FFD8 are the reference designs. At least MRD7 is what we have
in the lab and we can run some tests there. That's, for example, one
which I used to run atomisp before it got removed from the kernel a
few years ago.

>         {
>                 .ident =3D "BYT-T FFD8",
>                 .matches =3D {
> @@ -341,6 +351,7 @@ static const struct dmi_system_id gmin_vars[] =3D {
>                 },
>                 .driver_data =3D i8880_vars,
>         },
> +       /* Later added DMI ids, these are confirmed to really be necessar=
y! */
>         {
>                 .ident =3D "Surface 3",
>                 .matches =3D {
> @@ -348,6 +359,14 @@ static const struct dmi_system_id gmin_vars[] =3D {
>                 },
>                 .driver_data =3D surface3_vars,
>         },
> +       {
> +               .ident =3D "Lenovo Ideapad Miix 310",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "MIIX 310-10"),
> +               },
> +               .driver_data =3D lenovo_ideapad_miix_310_vars,
> +       },
>         {}
>  };
>
> --
> 2.39.1
>


--=20
With Best Regards,
Andy Shevchenko
