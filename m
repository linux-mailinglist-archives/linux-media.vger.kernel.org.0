Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB27A77AB18
	for <lists+linux-media@lfdr.de>; Sun, 13 Aug 2023 22:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjHMUNF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Aug 2023 16:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjHMUNE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Aug 2023 16:13:04 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1378BF
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 13:13:06 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-56c74961e0cso2861815eaf.3
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 13:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691957586; x=1692562386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXhA9VRypepdUYlLq8uxDNx03e0EEVDPrRCX89Gek+Q=;
        b=avjWWF+CYtAUxIPOADKviSekp/KNT7LY5C4A145WF5cFRdYA6xlaUHy16HCrvKK8OW
         KQH4V4G2RXbS3+D+JaSBD8s9bhDaD1MSrFaSqcCi948CJiHr81aZI4jLiQicPXMfsZQ4
         bn5aWuUA4PsKPIsgDjOBVsMRqbzYvNnBnGn1F0glYZ0e6mWyB+tfAkZo+PIROcbDm1UU
         A8Zvfy99aKzR+VGJAR9ujIifAJk7IHh0O8lyzIZvddiB8IUqiGRxuPKB6Z8Ru5VmWBgf
         dMTUyajRgWjPF39/HW46B7dc5+pgXiMhe+1I+ie6JWSSMiHHiCj3GF9nKcrBiTsVxX1j
         jA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691957586; x=1692562386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXhA9VRypepdUYlLq8uxDNx03e0EEVDPrRCX89Gek+Q=;
        b=caf0O4rJagdqOO9fUQESvH3Yt6r/2WUh6yPtuV79XBM2e+9u0gkALBcZNt7mnQvgbr
         i6tnGIRlXaH/eY3dqY/89otzzC8pO9DRAhe/Z3bQZgFAYK3IFwHpTRmE0HkciF4wfI1I
         s1+IDJSwQi+5XDpC9/n59qjLuYoCsSezRx/8o4jSkn7MUJCEgZXS8z4oN7lqlT/jNkj0
         9pdpe25oc0Y4JRedlHczreX/dngNRY0LS32jgd/LcH01zn6dqRdTWIXQugBzbwleqKsT
         VTUG3FCzNdLVrI/LglP7bH5xTiehYCbERpetJb+X9k6l/6D78s3FwfQIcZ59uWl7F08q
         QrbQ==
X-Gm-Message-State: AOJu0YyKauLpCq3iJhZkxWHXbvWi2K8jj5VGCaCpyR0fVd9WR1Mm74/7
        2snIrOEORN7xjQJHvHIYoPAWToRDyuh5l/lhmjt8cAH6884=
X-Google-Smtp-Source: AGHT+IGYWJNDAzwfNOhWGVkDMzwo2Wl0/fRXN16lRNd+1y1bkDOswhTde9q5Z9pka+YtmXHDLv1VPUPEIjmf/x93JuA=
X-Received: by 2002:a4a:2a1d:0:b0:55a:f44b:43cd with SMTP id
 k29-20020a4a2a1d000000b0055af44b43cdmr5301262oof.7.1691957586149; Sun, 13 Aug
 2023 13:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230812133628.355812-1-hdegoede@redhat.com>
In-Reply-To: <20230812133628.355812-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 13 Aug 2023 23:12:30 +0300
Message-ID: <CAHp75VcrjE1dBCrJ-=orACQaMNsm5i3qw-6s2Z0YLdKV0_eXvg@mail.gmail.com>
Subject: Re: [PATCH] media: gc0310: Stop setting v4l2_subdev.fwnode to the
 endpoint fwnode
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
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Aug 12, 2023 at 4:36=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Endpoint matching is now handled by the v4l2-core and drivers no longer
> should set v4l2_subdev.fwnode to the endpoint fwnode.

...

>         dev->reset =3D devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HI=
GH);
>         if (IS_ERR(dev->reset)) {
> -               fwnode_handle_put(dev->ep_fwnode);
>                 return dev_err_probe(&client->dev, PTR_ERR(dev->reset),
>                                      "getting reset GPIO\n");
>         }

Now {} can be dropped.

...

>         dev->powerdown =3D devm_gpiod_get(&client->dev, "powerdown", GPIO=
D_OUT_HIGH);
>         if (IS_ERR(dev->powerdown)) {
> -               fwnode_handle_put(dev->ep_fwnode);
>                 return dev_err_probe(&client->dev, PTR_ERR(dev->powerdown=
),
>                                      "getting powerdown GPIO\n");
>         }

Ditto.

However, no strong opinion here as it is more style thingy. FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
