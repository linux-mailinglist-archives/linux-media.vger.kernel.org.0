Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5348C715D37
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 13:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbjE3L3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 07:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjE3L3f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 07:29:35 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC7EEA
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 04:29:34 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-626117a8610so13826256d6.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 04:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685446173; x=1688038173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmPUYnc2FtqL3JwQ/ssh0K8SaGGEZjxLd4q7zPcJvCs=;
        b=rZ7D6eugfTtxFTVcUgTDyC0m1D3tbiGocFZNUYq2MeS70/O9MCYWsLWlr6esVrcQXI
         aL9n9LCV024EgcM2uncy4+NLsf4J5G9wyjiRRS0LKQHI/XbTz2l/EHGSJnCHkZIbG0Vh
         pD/40VW7CBfKyEELT5aq1KEkZmO5MsiKWj7tzb7TNhGqqhJqKdTdNTH6PrHmihw3PQxg
         XPSVs5d5s3e6G9J96CLEdD0VGv8QN6eKGXRHgQZAY9fWy26YHsMJDz61gp5Wo5CP/zkS
         PDeyJVXltsnzxnYhNp3T1WWzDCj1CrFk6f6+fKDoPV0kIkI+MUm+BhOcqUs5c4VZvPHQ
         xfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446173; x=1688038173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmPUYnc2FtqL3JwQ/ssh0K8SaGGEZjxLd4q7zPcJvCs=;
        b=KBzVnvfondPNHpLLplEIBdiamr6kRnZ6nc/q7Y5bNUJL6NTQeb8yBajsk+826jix2z
         /VF5ujrxXXRRCzE2EQ7MeQShEO2tiX79nGImRxj4PRPKiQXY0tlW9fnYZxyJj2p7Flvf
         Vsmy8YhhslMmMCr5jf0BGAWsfg4FciOUkwbiRMaunJWjCcQL5HewUlfHCZ667BMIg4hp
         2ynrZtu/hM2B6WodXToBtTUjnwwLyVZmGg1N6310NKmvc5RhWGbtT9UW7DrQqeHHPKZJ
         brBIvUAo2SudXPLwoeJeLn4n6Kf2nquzvxePtPY6hqRgJMKz5eMK9SHImuEcFS3/J8lr
         lwvw==
X-Gm-Message-State: AC+VfDxPsxnSTrdHUK3b3YAOWcQ9MSW646r8b/jH6ljrxHjLW8SiSzNY
        +k5q/dn32cCd4ewIvndG40qlzxN5v4hy8JTjqGA=
X-Google-Smtp-Source: ACHHUZ7l8I/u99ITUyO9KaG4BGtsk5Ahu9fGzyKzO/GHPdO7/f6V6c1qV6rir/MSNA3JAKz4Q+RQya15XVS1yLirLs4=
X-Received: by 2002:a05:6214:2247:b0:626:2415:843 with SMTP id
 c7-20020a056214224700b0062624150843mr2098221qvc.43.1685446173079; Tue, 30 May
 2023 04:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-7-hdegoede@redhat.com>
 <CAHp75Vd0n8HHv2nguQFHvoRuqjwAAj=YdmgMGckg+1q-NLptFw@mail.gmail.com> <b8059e0a-8a95-ce5e-ccd5-786ac9ee6abc@redhat.com>
In-Reply-To: <b8059e0a-8a95-ce5e-ccd5-786ac9ee6abc@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 May 2023 14:28:57 +0300
Message-ID: <CAHp75VdwCV0PMWqiTunnc3wrvYs7Q=-yGDb++CobhsgwS0EoRw@mail.gmail.com>
Subject: Re: [PATCH 06/21] media: atomisp: ov2680: Implement selection support
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

On Tue, May 30, 2023 at 1:36=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 5/29/23 22:31, Andy Shevchenko wrote:
> > On Mon, May 29, 2023 at 1:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:

...

> >> +       switch (which) {
> >> +       case V4L2_SUBDEV_FORMAT_TRY:
> >> +               return v4l2_subdev_get_try_crop(&sensor->sd, state, pa=
d);
> >> +       case V4L2_SUBDEV_FORMAT_ACTIVE:
> >> +               return &sensor->mode.crop;
> >> +       }
> >> +
> >> +       return NULL;
> >
> > I would move this to default: case.
>
> That may cause the reader of the code to think that there are other cases=
,
> which there are not. All possible values of enum v4l2_subdev_format_whenc=
e
> are already handled, otherwise the compiler would also complain.

Why do we care about that?
What is the common practice in the v4l2 subsystem?

> The "return NULL" is there to shut up other compiler warnings.

Can you elaborate (I mean if the default will be present)?

> I'll add a /* never reached */ to it to make this clear.

--=20
With Best Regards,
Andy Shevchenko
