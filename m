Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D32E714F2D
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 20:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjE2SO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 14:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjE2SO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 14:14:28 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07CFB0
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 11:14:27 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6261a1a7454so17121766d6.3
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 11:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685384067; x=1687976067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJui6NkBOCC86UFu9kGeCzhYQdMBs+iB8KQkDUL5y78=;
        b=U9NsV7MwF6WP5KJASoqnhIghC5CjFAyX8FZmaUlz+mVkOT/tGTzxjOhU6P6QpFnwcQ
         fVVQhLBJcyv6qz+cMKoxRs4dacIxk3sYnb3Uk8oEa/XHhmqb8xgXI94jnp0aiS3TDEvf
         6UZbac4n0BolABMf0pg+t+ilSIdIu2nuu1J6KDR4Xu1jHaBI6wq1QWkzXVL3KGFxWXRw
         nDpdVfGX5pISQ+uNOmCeccd0oOQ9IPl2y05+JWWRALLHF0W6RFOBtKJA/hhdlw3MfnGu
         QATzNmKIKr5IDMHPhZ//C6PtCGYxxTN443ep6gDjV8SL7J1t+OJ2AAvtbbDbHYeaXyix
         t+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685384067; x=1687976067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJui6NkBOCC86UFu9kGeCzhYQdMBs+iB8KQkDUL5y78=;
        b=cXRxTkjy74Ll+61j9ka3uvtVoo0GSUZ19fllZPQ5G/EIZAOxhr0eo3NcYsLJGTZ6U9
         +6ifhX4ZCvdOputYCIi0fIMtkh5V3BYDWlu2LIksIwvcsSXE7OGT3IpZVe4EU/q+jS6l
         zRH09j2uGwQo0zsta9D3YX8DFlWiA5S5UKmnvjZKJvcLeXSJOsyR6LAq6I6I2dOmZk7v
         EgyAWhptkPzt5mlJvU4nS2vrC0O0Xg2oZVJWqtMCgfioZPGFqIMRQMwMegSVzxyiDiqG
         rJZ5qfujju9sQr67XFvLDQb/+UZIJga6VTNPnfCNjMzr+/khf3D3LVcV1FCHq/XLVlx/
         FpJw==
X-Gm-Message-State: AC+VfDyuPpayqF/vInVesNnfNSQ/v7I7w9fXqt6nOtxp4WV1Upt6SJ1c
        ZiJ1PQgKWlQGCy63buTZi4hwGF8HImWdWaVFcM4=
X-Google-Smtp-Source: ACHHUZ64IaFKvpOsU6Dnb7kaTq0j3WuLOJSCKIZVqEQrtQOf9JTOu7LgUd7MxGhYJYQhCnbO7LGQaWPNNs0RT9hPx0U=
X-Received: by 2002:a05:6214:e4b:b0:621:680d:55bf with SMTP id
 o11-20020a0562140e4b00b00621680d55bfmr11197510qvc.22.1685384067085; Mon, 29
 May 2023 11:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-6-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-6-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 May 2023 21:13:50 +0300
Message-ID: <CAHp75VeTdAd98hAKGMo+Skqh0KnbCd=NXQHiB7L8jCkmue1zpA@mail.gmail.com>
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

On Mon, May 29, 2023 at 1:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Having an init_cfg to initialize the passed in subdev-state is
> important to make which =3D=3D V4L2_SUBDEV_FORMAT_TRY ops work when
> userspace is talking to a /dev/v4l2-subdev# node.
>
> Copy the ov2680_init_cfg() from the standard drivers/media/i2c/ov2680.c
> driver.
>
> This is esp. relevant once support for cropping is added where
> the v4l2_subdev_state.pads[pad].try_crop rectangle needs to be set
> correctly for set_fmt which =3D=3D V4L2_SUBDEV_FORMAT_TRY calls to work.

...

> +static int ov2680_init_cfg(struct v4l2_subdev *sd,
> +                          struct v4l2_subdev_state *sd_state)
> +{
> +       struct v4l2_subdev_format fmt =3D {
> +               .which =3D sd_state ? V4L2_SUBDEV_FORMAT_TRY
> +               : V4L2_SUBDEV_FORMAT_ACTIVE,
> +               .format =3D {
> +                       .width =3D 800,
> +                       .height =3D 600,

> +               }

I would keep a trailing comma here.

> +       };
> +
> +       return ov2680_set_fmt(sd, sd_state, &fmt);
> +}

--=20
With Best Regards,
Andy Shevchenko
