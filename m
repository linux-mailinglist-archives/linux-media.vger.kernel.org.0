Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83F6F71511A
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 23:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjE2Vst (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 17:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjE2Vss (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 17:48:48 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE43CF
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 14:48:47 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-62614f2eee1so10658316d6.0
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 14:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685396926; x=1687988926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08Mzl3olZrQOHABKKtfgvLwAuZZZ6d+NTExTD0DrCRg=;
        b=CdGg/JWqLN5soex3LMee0rfi1KAvv7fDyjKvUWXLx8/tYWHGOyTBfnjTZjSXM6jPnh
         /UO4wDAisB6fI5zKAXPXHXfU2414bWiao+qyNitZuORF9FbLWdarpn5ypGTyNrYCKKlZ
         p/YJDowiij9EU7V6+m64oim04QUUmoKjWkcpfMQNbNUtZhjXuDG60RAb2fWBm7mFIQUa
         5jT018NwCMJr6+rA1zOnSNXPzOTIxpQHKnKkTvSkTtbsZiJ+aozcxecMf/goKKQSFlT9
         Vx4UnpVpCs8Mj2SNHqEtH2EhyMPcPtnnyyZpMYBiovWfmWqlvKQ64wV49j628N5Ki/KJ
         wfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685396926; x=1687988926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08Mzl3olZrQOHABKKtfgvLwAuZZZ6d+NTExTD0DrCRg=;
        b=JaKM6lO/1jsYkZPzNZzXXTo38Z6VuVJo6wBZXJIJvEIrpnU6lQkGykI0lD/BzmvhMf
         MA86XnQlpIreb28/hi8NeG/zW8MYzCArrv7rYT08kgHWpTaji8FbXtWbCgQ71CGTBUyg
         1A2xa1Jx++JTgG3D4p7dSuHJgWIkiWMNEkyZ5ujGl4UAh+7Wmu5Zf6nMchvdA68fxbUw
         xDIBQtL78h0cZc1iGAXc5Mw3QLdNcNzYqplC9nxLIuxSg1O9qWZTcj0LrxtMWacbXWPt
         Std0r39/ljbu0xfd7Wjs1OGLvp22v5qe0ckt1s+b1J48BJ84Jnx0Qcr3Kk40rfBmsApg
         c4kA==
X-Gm-Message-State: AC+VfDwmf1BEA8ZvK8VxScQXaGaHWE76Kl3Z1FWD4luuYSXfZSKrt8jH
        ZQwffpuOdwT+lHZkvRVagjrcb6E9j+UM0Bc/CgY=
X-Google-Smtp-Source: ACHHUZ4qkjaOHJeDDdowAZRL3hNcl8NFW+2Q4u4LVzHWZtUXnH+lGBz6KRxShWt2eILJ5Nv5hiEu8pC6Bo252MofWpc=
X-Received: by 2002:ad4:5cc1:0:b0:626:1ca6:5efe with SMTP id
 iu1-20020ad45cc1000000b006261ca65efemr132363qvb.9.1685396926541; Mon, 29 May
 2023 14:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-22-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-22-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 May 2023 00:48:10 +0300
Message-ID: <CAHp75Ve6rWtkDowBS7z1f=Ot7h8xmXTws8L+Z3eXEfFum2pBcA@mail.gmail.com>
Subject: Re: [PATCH 21/21] media: atomisp: csi2-bridge: Set PMC clk-rate for
 sensors to 19.2 MHz
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

On Mon, May 29, 2023 at 1:39=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The ACPI code takes care of enabling/disabling the PMC clk(s) for
> the sensors as necessary based on the runtime-pm state of the sensor.
>
> But the GMIN code this replaces also set the clk-rate of the PMC clk
> to 19.2 MHz. At least on BYT devices the PMC clks may come up running
> at 25 MHz instead of the expected 19.2 MHz.
>
> Ensure the sensor clk also runs at the expected 19.2 MHz for sensors
> using v4l2-async probing by explicitly setting it to 19.2 MHz when
> enumerating sensors in atomisp_csi2_bridge.c.

...

> +       ret =3D clk_prepare_enable(clk);
> +       if (!ret)
> +               clk_disable_unprepare(clk);

I'm wondering if _enable / _disable required.

--=20
With Best Regards,
Andy Shevchenko
