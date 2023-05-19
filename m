Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8BB17094A6
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 12:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbjESKTx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 May 2023 06:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbjESKTr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 May 2023 06:19:47 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC0B10DF
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 03:19:42 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-623852980dfso14167426d6.0
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 03:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684491581; x=1687083581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TOOnGY6/7gbApavboZs3pH4Q/1VjbXN7/OaowXsj4E=;
        b=saKCCx6itui34N6KgF9b+gu5YY8tKBMEVp/tI7MobXPz67zSWkf5ekD7kU0GIAtjfS
         dGI/fGInZgBvhjpDmbesWrok0cjuXCfTppaota/SPoKqeATxwTOaJbwLT+zR6Kb0v+w4
         2XEcSR+ofx3FDAe3gYKZLkOqhxbnqNZ00J+dqF6K7KgNMT24sP1Sad88ctbRpsPUSC08
         LbuByaYoB7PmbAz6VhQXs2OyVhRflAJSa0alMzvff9EsQgjWPPovqpqp7SbPEnZ3H+fM
         L522JGMhpB2uiFxWUvysJ4O9TdyGUzYIv38MglKWO9AWBfSnNKxFwW3EWyPwkea3TzCR
         +TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684491581; x=1687083581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TOOnGY6/7gbApavboZs3pH4Q/1VjbXN7/OaowXsj4E=;
        b=cRVUbZbFtAWofg8NYI6wEmQ6FmZ8aqrSpAT0XtrcqjicDJkXeToATJRb8EKOyG2IKD
         SMCECKQE8OUnJT3AUpf8MXT8WpJm1wE/85NvJTD1KvvUx3TK/dG9FB5TBlJ0mZb9q1dh
         JHg67Ng1quvnvnCwJ2m2YtBaZgAnmbZ0eky0dNMuutMvIcsddvbw++xpTzEfqFpfg1O3
         +P4lcP5xdPd3DvihxTb2vifIctpkKp/k25Cl5TTSTnIQmvoGp0V9mX5cOeXYYUwA1VGH
         GBXqcYvaLPEPh2j625dYEqU5kJKtv+JV9nnha0LWdwMIyLUfpDQowUSmHRHq4JtIT0wx
         S8aQ==
X-Gm-Message-State: AC+VfDxga3OFe4yNINilonwIoRv20uvzCPTid/2qQTdRxeyGJG2UHHpS
        g0A+O1ShREcgvVkstkysjWqwiDU+u2kQt6oyD1c=
X-Google-Smtp-Source: ACHHUZ6FdAfyykBTWjU6riNW5GDcE69Mx2AOv4HrLva5VO13HnaSRr4tZ0rpwldlJSjEBE18cv5+YmvDMVWYtMOiXCk=
X-Received: by 2002:ad4:5b81:0:b0:615:a787:6d2a with SMTP id
 1-20020ad45b81000000b00615a7876d2amr3364150qvp.3.1684491581435; Fri, 19 May
 2023 03:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230518153214.194976-1-hdegoede@redhat.com> <20230518153214.194976-2-hdegoede@redhat.com>
 <CAHp75Vf6t302XpVKKgm1uyHQ5LsuqSEE+B3AGc1-ODoev77ENA@mail.gmail.com> <9375a528-8e39-304e-9b60-99ea43e16ec0@redhat.com>
In-Reply-To: <9375a528-8e39-304e-9b60-99ea43e16ec0@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 May 2023 13:19:05 +0300
Message-ID: <CAHp75VfbmhTkNz6zQNN_+ehwJXFSoy2xV3HH0mHwN00ojOZGwg@mail.gmail.com>
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper function
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

On Thu, May 18, 2023 at 7:57=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 5/18/23 18:36, Andy Shevchenko wrote:
> > On Thu, May 18, 2023 at 6:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:

...

> >> + * Note this code uses the same DSM GUID as the INT3472 discrete.c co=
de
> >> + * and there is some overlap, but there are enough differences that i=
t is
> >> + * difficult to share the code.
> >
> > Can you add the name of the variable in that file, so likely the
> > source code indexing tool might add a link?
>
> You mean change the comment something like this:
>
>  * Note this code uses the same DSM GUID as the int3472_gpio_guid in
>  * the INT3472 discrete.c code and there is some overlap, but there are
>  * enough differences that it is difficult to share the code.
>
> I guess, where int3472_gpio_guid comes from:
>
> drivers/platform/x86/intel/int3472/discrete.c:
>
> static const guid_t int3472_gpio_guid =3D
>         GUID_INIT(0x79234640, 0x9e10, 0x4fea,
>                   0xa5, 0xc1, 0xb5, 0xaa, 0x8b, 0x19, 0x75, 0x6f);
>
>
> ?

Yes!

...

> >> +       devm_acpi_dev_add_driver_gpios(dev, data.map->mapping);
> >
> > Won't we print a warning here as well in case of error?
>
> The only way this can fail is with -ENOMEM (we already know dev
> has an ACPI companion) and generally speaking the rule is to
> not log errors for ENOMEM since when we hit that the kernel
> already complains loudly before returning from the alloc call.

But this is based on the information about internal implementation of
the above mentioned API. Strictly speaking it might return, in the
future, another error code as well.

--=20
With Best Regards,
Andy Shevchenko
