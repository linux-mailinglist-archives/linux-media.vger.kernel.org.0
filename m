Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 233757135D1
	for <lists+linux-media@lfdr.de>; Sat, 27 May 2023 18:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjE0Q4B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 May 2023 12:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjE0Q4A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 May 2023 12:56:00 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD911B4
        for <linux-media@vger.kernel.org>; Sat, 27 May 2023 09:55:59 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-3f80cd74c63so16857561cf.3
        for <linux-media@vger.kernel.org>; Sat, 27 May 2023 09:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685206559; x=1687798559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH0bUvk7oNCPhxWVOtStQj8MA++WeEbKtVXwYNQy7Rs=;
        b=aLXhDlfvNxkNa5WThTTi0r/KAqgFZrOPVq780/1xREsIn2l75c1st5w9280J1stx9t
         K/AFisqbcxIHcaTGG79RUNXmLt2iZKKYL3Hcy293nV0yQE5adrBHlVOQ6jD1TkrfkEVM
         CDszVSMAu8/3+pTPWt9g4EE2tPzWoA+upUdtx1vmW4U7LEab6iVdXQFcKG/srykFS2Z2
         prDXk4xd4yG41qVUq/PMUaPpUewd/p7RkP33m22PMNiLqe/mgJvnQ49Wn3+rYPIbi/rv
         k645NisJb4yJCLUA75Yz1p2QfnbtRj85PPfaelItnjUJdFkRTJ0NmspKe5CHe9qzW3MC
         Kikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685206559; x=1687798559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH0bUvk7oNCPhxWVOtStQj8MA++WeEbKtVXwYNQy7Rs=;
        b=Ux33Oc05S2SG4pCSRIUzIyWvCckf8rJHx8lBwZ39JjpgF32JKgAvxx7fz9o2aJXSbV
         zHe8D86Ef14QbleNGcbXBoov/J8JZiJnvpLxyOgJGyiDN82q043uVsP+4STgZsD4vZcx
         f0j3+gHucxQYwUQWhxGH37Y5e8PeNJiTX8q5mqc3qiNxkWcFXRDZkCHtzxiLYnOY+Olb
         PTcwXT12o0njBNMniNFa4VgechMIxngz4uEVrasEiLA9r5BiCq6f+Jh2LA0GlqD8iLMw
         5yQb//WOwsjms0G4mN7FiPRELHF5xHYW5VoJNixtQQ4CmQ4URHbtPMft7dL9TIp41GJ2
         pnzA==
X-Gm-Message-State: AC+VfDwetlL02Gu0wEWE7tLOhebhHnIUnzlSNLXNFuKMk3dQBOXMPdrI
        Pndm6Quy3OXUwTU0ElukDF/StPCkI0qEJjxQ0DA=
X-Google-Smtp-Source: ACHHUZ6l6FvS3s1PCavnbOgAvnFktfcirUFQFse24VKtzOAVMKvayFb5XfzFHS6Lsp8yQjCzHhO38mcrLC1AX3ILZFk=
X-Received: by 2002:a05:6214:1c07:b0:5ef:5049:f49a with SMTP id
 u7-20020a0562141c0700b005ef5049f49amr5552124qvc.32.1685206558825; Sat, 27 May
 2023 09:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230527155136.61957-1-hdegoede@redhat.com>
In-Reply-To: <20230527155136.61957-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 27 May 2023 19:55:22 +0300
Message-ID: <CAHp75Vf7bCQp+vJH02yJjmooxZSgNna5sRQ=UEq=4LmsDZPsFQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: Fix buffer overrun in gmin_get_var_int()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Dan Carpenter <dan.carpenter@linaro.org>
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

On Sat, May 27, 2023 at 6:51=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Not all functions used in gmin_get_var_int() update len to the actual
> length of the returned string. So len may still have its initial value
> of the length of val[] when "val[len] =3D 0;" is run to ensure 0 terminat=
ion.
>
> If this happens we end up writing one beyond the bounds of val[], fix thi=
s.
>
> Note this is a quick fix for this since the entirety of
> atomisp_gmin_platform.c will be removed once all atomisp sensor
> drivers have been moved over to runtime-pm + v4l2-async device
> registration.

...

> Closes: https://lore.kernel.org/linux-media/26f37e19-c240-4d77-831d-ef3f1=
a4dd51d@kili.mountain/

Is this a new official tag? (Just to my surprise)

...

> -       char val[CFG_VAR_NAME_MAX];
> -       size_t len =3D sizeof(val);
> +       char val[CFG_VAR_NAME_MAX + 1];
> +       size_t len =3D CFG_VAR_NAME_MAX;

Why not sizeof() - 1? At least it will be a single point when change
can be made and not breaking again in a similar way the code.

>         long result;
>         int ret;

--=20
With Best Regards,
Andy Shevchenko
