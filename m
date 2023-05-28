Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB8BD713893
	for <lists+linux-media@lfdr.de>; Sun, 28 May 2023 09:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjE1H4e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 May 2023 03:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjE1H4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 May 2023 03:56:33 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C57D8
        for <linux-media@vger.kernel.org>; Sun, 28 May 2023 00:56:31 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6260f03b76dso7541026d6.1
        for <linux-media@vger.kernel.org>; Sun, 28 May 2023 00:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685260590; x=1687852590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ2+3FwkLROklM7yKtJCdabsCsnlIOkXdpgNdZkU9jI=;
        b=YxeWclwWP1CtMxDqHN4lSJG7Wqd8YdeYkWxNDe/2ccOexhJ+JgHPazwd4KTQcYBeqj
         bw/UKp7/1ZgvYgVlmK/2PzpuAEne2+ylIxFxFTaAQHffKb3jEM1WtWwtEd8i+YiERu+J
         Brb6YbP4tCND0/+YX12nlSj7wQrr0zT+nQyW/Ztpk8TpsUXogbYiIPcGJXf4Osa6dr2q
         BDEHwqSa8s16yVq6V3sMiTgVHAsCt/wiFFd+ERdOvQ1BDO7bMPS3j9LuoAZ9Zs3JholW
         xaKnY/pOHq5iUFAxYhrEDUwlYttIuJWRCLn34Oolfa5jbk5qlDykOWKeom5s3P8XnGB+
         jIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685260590; x=1687852590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ2+3FwkLROklM7yKtJCdabsCsnlIOkXdpgNdZkU9jI=;
        b=WjCrGYXsgC1c6qm1pO4w0EzcCAuSOvSVTKFnemddnDSfl/6k0flWHjqOxvUw8PonaT
         91QMKFetAPMn9Ig2zYSEFyL5MzGQjzP8Gfg653+FjBDI8IFxhQeV7vw+KD/N/Gr8waFq
         UltR1DTz1HR5kpqLQHUde8Cq8ytvfl7Wd2MZn6zSqCpCByLtGHAxQu9V5jRE9Pyf5kha
         6RfqxbXcuP+/hNdv7hhAi4ApPFftYCH0u1NI+E3ZftPQZB+zYrfU3j+C8VxkbRYfAgJ+
         wZ7HcevNp515poQvTVvYokXf7izuFpF8+iSCatDmDUw/ohp0reBk6Itw/961iwEKuSjv
         zmAg==
X-Gm-Message-State: AC+VfDwDgCbzUnJV2pOmuA/9MMHEMzw4BwmhfLrDoOrdf3zOMaNSeTfc
        mF0MdU5CR2G7sszFPHXGu2o4djfhhi8H7A8DtlA=
X-Google-Smtp-Source: ACHHUZ56T5kx7LSZgyn50ZqY6qM/ZDSpSAXcE/APwzyF9hbBz+Uj8SIMmVcc2mXo5D86sfWW0yzK67rjgR9mAHdrYlk=
X-Received: by 2002:a05:6214:1250:b0:5f8:ad2a:fef7 with SMTP id
 r16-20020a056214125000b005f8ad2afef7mr8284371qvv.32.1685260590275; Sun, 28
 May 2023 00:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230527155136.61957-1-hdegoede@redhat.com> <CAHp75Vf7bCQp+vJH02yJjmooxZSgNna5sRQ=UEq=4LmsDZPsFQ@mail.gmail.com>
 <b037dbd7-a95d-00cb-7763-f6e244626b13@redhat.com>
In-Reply-To: <b037dbd7-a95d-00cb-7763-f6e244626b13@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 28 May 2023 10:55:53 +0300
Message-ID: <CAHp75VfN5YtBDv0caubfm=2Y8YpvqAxWeAa7dzJZe79S3teiqA@mail.gmail.com>
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

On Sat, May 27, 2023 at 8:54=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 5/27/23 18:55, Andy Shevchenko wrote:
> > On Sat, May 27, 2023 at 6:51=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:

...

> >> Closes: https://lore.kernel.org/linux-media/26f37e19-c240-4d77-831d-ef=
3f1a4dd51d@kili.mountain/
> >
> > Is this a new official tag? (Just to my surprise)
>
> Yes, I was surprised too, checkpatch.pl now wants a Closes: tag
> after a Reported-by: one, rather then a Link: tag.

Interesting...

...

> >> -       char val[CFG_VAR_NAME_MAX];
> >> -       size_t len =3D sizeof(val);
> >> +       char val[CFG_VAR_NAME_MAX + 1];
> >> +       size_t len =3D CFG_VAR_NAME_MAX;
> >
> > Why not sizeof() - 1? At least it will be a single point when change
> > can be made and not breaking again in a similar way the code.
>
> I wanted to make the buffer one byte bigger to make room for
> the terminating 0, not 1 bute smaller.

I understand, and I'm commenting only on the len assignment. Sorry for
not being clear.

Hence you will have

  buf[SIZE + 1];
  sizeof(buf) - 1;

--=20
With Best Regards,
Andy Shevchenko
