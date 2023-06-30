Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68CC743DA1
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 16:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbjF3OhR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 10:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbjF3OhQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 10:37:16 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DCD35A6
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:37:15 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so3334790a12.0
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688135833; x=1690727833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wO3TwhEsbsy6faMxeKen000rLUcOTmafDPe65SXCTjo=;
        b=e0zOv8Y7deNKwgb6dAf87CeyQYmquWQnAFwHQzyH3ZqFQZt/caLUhlZajeloQkBcwb
         BLFH0zk9wFkLHlZTdAmIUu98ip89IYMVV/3zyQ7bVDtDcOnK7okRiD9a7E1FhQGsDDTP
         qHVnvbwgsR/ICU/aT+wbjws44zUbGav0RfwwLR+5lMs5WI2IMtXdwZjuuIOv6bfENVu7
         fpTvohHBTOEgtUTdIMVq+dWCYOBLRky1RKftupWXVXW3krlXmWOOtXQ+LrvnCZLxspx3
         Vkt30rADhEr1oHBgFbsgRz8lPcnKAgTd92z2ZHV8LEZs6HmNjFeF10kP/x2AnIDeb+yy
         O0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688135833; x=1690727833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wO3TwhEsbsy6faMxeKen000rLUcOTmafDPe65SXCTjo=;
        b=CgN3CCannJGe9sCapj2+Rwq1jhcJMAmyXcb07edJcZKOwz7tzZ5LzHvzRgAaw/cg88
         eF68dG/GrlEOFgybWyhRwlUjTxDbwjiXGf5FIb7vxU1B2QxDprmiJcDdAvA87W4GG/km
         0GG1Shz3OYHA/Rx7WEatphD4KzJKhwsgoV+I14vwzJ6rSkS8yVihMA4oE40sVy3qBuCL
         4eMEEkfNwyI2OpgEe8SG0xZfCwjaoO/n6Xo4FHNjDvew/T7DSbLriRmhGhPJ2Rpeq8dC
         BYIKGOiciG2AdTl8N8e5Pi7MGOxxrcEDNsFz46j62I57iDIMQCvD0vFThIq98f7tC7kS
         RV7w==
X-Gm-Message-State: AC+VfDwvSUssEd4msp1jtu0GBLu2u2kiMkEKX0GI6MNZW8RjfJB1GaEB
        ddOFMc4/U0qe2swUXWmcpSQf/j1vxowV/a5w1dM=
X-Google-Smtp-Source: ACHHUZ6V+C/3yEZVpEiyKlX5b5/Od8mQOOOhaCHTwb8MGTCc5lDLhJNZuw2Mu5XK0LOop2Y3PH2EJqFxzmt05JTUkBQ=
X-Received: by 2002:aa7:cfda:0:b0:51a:4039:b9e with SMTP id
 r26-20020aa7cfda000000b0051a40390b9emr7336003edy.9.1688135833487; Fri, 30 Jun
 2023 07:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230630110643.209761-1-hdegoede@redhat.com> <20230630110643.209761-11-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-11-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Jun 2023 17:36:37 +0300
Message-ID: <CAHp75VeEi5vMvEqC+kmAZQg2PeRCFXWrJ9J6jrW6CxRQ9iM3bQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] media: ipu-bridge: Add a parse_sensor_fwnode
 callback to ipu_bridge_init()
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

On Fri, Jun 30, 2023 at 2:21=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Add a parse_sensor_fwnode callback to ipu_bridge_init(), so that

->parse_sensor_fwnode()

> ipu_bridge_init() can be used with other sensor fwnode parse functions
> then just ipu_bridge_parse_ssdb().
>
> This will allow the ipu3-bridge code to also be used by the atomisp
> driver.

...

> +int ipu_bridge_init(struct device *dev,
> +                   int (*parse_sensor_fwnode)(struct acpi_device *adev,
> +                                              struct ipu_sensor *sensor)=
)

Wondering if

  typedef ipu_parse_sensor_fwnode_t ...

will make all the code better looking.

...

> +       int (*parse_sensor_fwnode)(struct acpi_device *adev,
> +                                  struct ipu_sensor *sensor);

Ditto.

...

> +int ipu_bridge_init(struct device *dev,
> +                   int (*parse_sensor_fwnode)(struct acpi_device *adev,
> +                                              struct ipu_sensor *sensor)=
);

Ditto.

...

> +/* Use a define to avoid the parse_sensor_fwnode arg getting evaluated *=
/

@parse_sensor_fwnode
argument

> +#define ipu_bridge_init(dev, parse_sensor_fwnode)      (0)

--=20
With Best Regards,
Andy Shevchenko
