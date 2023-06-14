Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B105173090B
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 22:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236518AbjFNUQd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 16:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236489AbjFNUQc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 16:16:32 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E58C3
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:16:31 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-62dfc2da0c8so15616936d6.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686773790; x=1689365790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IABEwwL1t7JP3bUF2F46zpkhNzXgU0VzYpQGVp9O1UY=;
        b=PVzqo+cnI6ekjP2PcGeen5Zs45aoYQivtdaVNgHpaTz8dKnw841H5PYaZMrMvJpqXp
         +VTQ3JEWNjxL7lgbTdvAVdCtCLy9xv5P5EeuJtQQCOS7290nZ+GW5M/ehHjQQipvTJcs
         36EJrkk/Xh6GWFF67spjuCjloF/33G5Eu1oQ8oON4sLK52ZGi0HmErL0TqAecbzgzNQV
         j/DTHHZAtoCGZqUPYhvOl6X3dIPkpFYyR+QBtZG5NDr4GEJqQyVl4kUp1QKiApOWp5qA
         OQOZFO7KQyul/rU8ewcGHPS3Sl0RKiz/ujzWgZnUp2Bl71vCeJv9TzKXh/dMkh4xq5jR
         7wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686773790; x=1689365790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IABEwwL1t7JP3bUF2F46zpkhNzXgU0VzYpQGVp9O1UY=;
        b=CUtojINu2xyn7c/5DP/x4Dhyly5c44sSM3PeEHZP9RhtMP/+rtQJb39xl37C3BkAe+
         CiCK1lnGJHaHFI78tezWnE93YCTfX99dbWD2nIubyTrwwJFpDi4S1tWNnD0wI2LYQaZ1
         2xnIlc/JTWxcUYPoMq0E06nEZlYFgpOQyNv3kKSIaRFDVWe/ofzcdAf/vlje0JMx+z2r
         uFrwV4UKagJCS4rkn4p9xGRqOePu1JXstf2tqsBUYfk/vX7IZ91GZYuBghwjP5NulriI
         XtAFI6TIz0hB8eYP2JCJwzLgSlwUVtRSvS81cWgMgwTgXr+Ga6YKP6UDC8oZZwZSBS+W
         TZVw==
X-Gm-Message-State: AC+VfDwxq6AHMVVK9iR+AQquUPlFBhxx1gCubN3JqEylf7IQCHr0LpRY
        /2zpKF2oYtJZ3At9SsCOhNrfvboSkzCTG9N6z7I=
X-Google-Smtp-Source: ACHHUZ5Ida2XERfcO60NHWSPUPLUFd1JgV9MSWwTzFuHs2wP301tYJaE4ML0cBKniBreyy2NryMPG4bSnxA5ToE3dL0=
X-Received: by 2002:a05:6214:21a5:b0:5f7:8b31:4548 with SMTP id
 t5-20020a05621421a500b005f78b314548mr17221465qvc.4.1686773790368; Wed, 14 Jun
 2023 13:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230614192343.57280-1-hdegoede@redhat.com> <20230614192343.57280-5-hdegoede@redhat.com>
In-Reply-To: <20230614192343.57280-5-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 14 Jun 2023 23:15:54 +0300
Message-ID: <CAHp75VdgN4Uc4_LdPO+q1kwV8so4Uey6h8R8fqyf=XEO9Ns8_g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] media: atomisp: ov2680: Convert to new CCI
 register access helpers
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
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

On Wed, Jun 14, 2023 at 10:24=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Use the new comon CCI register access helpers to replace the private
> register access helpers in the ov2680 driver.
>
> While at it also switch to using the same register address defines
> as the standard drivers/media/i2c/ov2680.c driver to make merging
> the 2 drivers simpler.

...

> @@ -121,7 +59,8 @@ struct ov2680_dev {
>         struct media_pad pad;
>         /* Protect against concurrent changes to controls */
>         struct mutex lock;
> -       struct i2c_client *client;
> +       struct device *dev;
> +       struct regmap *regmap;

Similar question as per patch 2. Do we need both of them?

>         struct gpio_desc *powerdown;
>         struct fwnode_handle *ep_fwnode;
>         bool is_streaming;

>         } ctrls;
>  };

--=20
With Best Regards,
Andy Shevchenko
