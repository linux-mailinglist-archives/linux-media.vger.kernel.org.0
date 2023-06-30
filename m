Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D98E2743DD9
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 16:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbjF3OsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 10:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbjF3OsW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 10:48:22 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC9899
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:48:21 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso3153565e87.3
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688136500; x=1690728500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRnM0H8J6blrCccEsxr/QiWt2OaHhHxnSQkWlkCjlNU=;
        b=O0Mxg+C5fsJOgIWTSM+F4B6yO1F8OkiHzSz9nKL2hqzzwyJX78pQVHfcsA0/wIBptt
         3qmlvQU56mYjyXYqrpc17Vy21h8OELn5KbuXtO7WkcP5Ce8pTFbh4Hx7xg08ThqQaOGF
         DwUR1mh+oZx5kv8d2fg9xtPYBqx1Nn3EzSY0tuzH0z3hZGvpqRDUIk7sL7qdQXdT5ZNT
         qyn6dJO30IXI/P0IIZ5TdcN1mb4ssNRNNCoYDfIxH5p6IF+Veo1ifV7sntkxpgsJQTSy
         CDom5AisCMsnzbzFbIszDbXnhVQm6skEji5574vjqmapEBB1E/Jl46kXQuoRSxZLDbNb
         jvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688136500; x=1690728500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRnM0H8J6blrCccEsxr/QiWt2OaHhHxnSQkWlkCjlNU=;
        b=XcYHNAY1PKqu60WRHyh4Zwk6VzkGcqrorC29BOXyQ6onX60jCUGDVjj6aLreM90Bzd
         UMjSqVJZoq14ehWP1WWK61mu4glOG5So/egboGKQhLn7eNyJeyj3s0hotx0t5gz+iX2r
         Oprf2MRnuIO5ERg68LNgK9lgJGLOHe9/Kfu78l6S6H7UidRkBK5O14lavw7gpwS4f4wA
         cePXz+4pbhPsr0x5ll9QErYDTz9TVRKYSaMhfLuIM4dCHVhQzBhR/vbdunl/2BRv88EH
         RPpaWwSOKOtf7ullwtBmblWnsKnc9hC5anfTGwDaavS0unLzNb+w5VopPf0Dpaeal8dL
         Ig3Q==
X-Gm-Message-State: ABy/qLY4KRDRezBWks9/IxIH7kGkTVgj5H/FWLVZmN/xQGjo5z7BNDAc
        6G/TM9Kxf0dRhKh9ZSjnSvgQQX95FjVZZEG5o4hyEFVpHyY=
X-Google-Smtp-Source: APBJJlHsVD4M2wt/qbBntGeB9hJf/w3ork0w+Nr0pjUuJU7kn0XIjw+Jb4QF1UjnW6F1CnGSQBMbNtDx0jISx5xetrM=
X-Received: by 2002:a19:3846:0:b0:4f9:556b:93c4 with SMTP id
 d6-20020a193846000000b004f9556b93c4mr1979857lfj.31.1688136499404; Fri, 30 Jun
 2023 07:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230630110643.209761-1-hdegoede@redhat.com> <20230630110643.209761-15-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-15-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Jun 2023 17:47:43 +0300
Message-ID: <CAHp75VdjysnGwVsYjgHU6NYkXsfjfpKPze0VoD7fJ_8xB-b9KA@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] media: ipu-bridge: Add a runtime-pm device-link
 between VCM and sensor
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
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

On Fri, Jun 30, 2023 at 2:07=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> In most cases when a VCM is used there is a single integrated module
> with the sensor + VCM + lens. This means that the sensor and VCM often
> share regulators and possibly also something like a powerdown pin.
>
> In the ACPI tables this is modelled as a single ACPI device with
> multiple I2cSerialBus resources.
>
> On atomisp devices the regulators and clks are modelled as ACPI
> power-resources, which are controlled by the (ACPI) power state
> of the sensor. So the sensor must be in D0 power state for the VCM
> to work.
>
> To make this work add a device-link with DL_FLAG_PM_RUNTIME flag
> so that the sensor will automatically be runtime-resumed whenever
> the VCM is runtime-resumed.
>
> This requires the probing of the VCM and thus the creation of the VCM
> I2C-client to be delayed till after the sensor driver has bound.
>
> Move the instantiation of the VCM I2C-client to the v4l2_async_notifier
> bound op, so that it is done after the sensor driver has bound; and
> add code to add the device-link.
>
> This fixes the problem with the shared ACPI power-resources on atomisp2
> and this avoids the need for VCM related workarounds on IPU3 / IPU6.
>
> E.g. until now the dw9719 driver needed to get and control a Vsio
> (V sensor IO) regulator since that needs to be enabled to enable I2C
> pass-through on the PMIC on the sensor module. So the driver was
> controlling this regulator even though the actual dw9719 chip has no
> Vsio pin / power-plane.
>
> This also removes the need for ipu_bridge_init() to return
> -EPROBE_DEFER since the VCM is now instantiated later.

...

> +static void ipu_bridge_instantiate_vcm_work(struct work_struct *_work)
> +{
> +       struct ipu_bridge_instantiate_vcm_work_data *work =3D
> +               container_of(_work,
> +                            struct ipu_bridge_instantiate_vcm_work_data,
> +                            work);

Just noticed this plenty of *work.

Perhaps call the parameter work and the stack variable wdata or so?

>  }

--=20
With Best Regards,
Andy Shevchenko
