Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89DFF715128
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 23:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjE2V7s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 17:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjE2V7o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 17:59:44 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF24CDB
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 14:59:42 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6261616efd2so9326436d6.2
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 14:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685397582; x=1687989582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hsuoe+SQIaTSqFX1NxZhhcfILFgCTHVwV0rqKDeLYhU=;
        b=D92r0pM882g1NfDSgJzRyk0+YeHdwxhFSG1dfPZILx43AatHb8P+RvUo/Nb0Tf8N0B
         psydOlEaXktW8MkkbmjlGa/WXGGITUtn96xvO3AO3FtMpS9uioN/nFZclFHBTwqOdR3I
         P+//OfoCT+g7b4VZEdwZnxdj7BFV//BD/Nv0p4jsYO6RnrDEZhZ67lC5FCjlCJ5oABp5
         iZLjPcZIsReY9zUp2A2SlRuqBQdCyTHfKtCNGdzthHKYXOiOt9dhKBlLyxP/VCgei6GR
         SbmOQPI2mrz+ESs4ncXJw9W4Cz9vuS1VGlLj0BDNKf5S0eTq4zPFKXYGUP+cBCt/0ktY
         BVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685397582; x=1687989582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hsuoe+SQIaTSqFX1NxZhhcfILFgCTHVwV0rqKDeLYhU=;
        b=EFnwrPDB3KvpwfLlEQLm1BOJ9egh1pbX7NVzQKD/8xgH6iIyTDBrtu2YICeuvRWwc2
         eV+ehjX2xn7qnU9syIJB9IzY2NoDDqSw5+ujub8Nqv1v130sdLdAUl8jJINSwfxjFp44
         dGN0DBcotVFpccGJUtV7f+rRkfYyXvyCtabLHkQ15K7/Mf3aXry0Ah1LKOs9Ometgmi/
         xMd53Q3yw0RKzKj+LqZwE3RBzf68y/lSoK6VDWjJHXfaajXcTAQ+fCFHsC7MTXK0QKhd
         ft+qpypBrLive3wEB6MYc7nCNi8+ZhtMj40k9rZy9/VacvmUCQBQLlupdZ/NZkrlydXd
         541g==
X-Gm-Message-State: AC+VfDz+UIsn5/aRqzNHt6VobvsZaIN1qlF6D9fUnM8O7Q70zsT/y1dD
        wWWhzqxB9G0i3GpZDxc71XQbWRo5BratCHRaIsw=
X-Google-Smtp-Source: ACHHUZ7/MU7Y/VrItToYTFpupHk2WsCc4mP2J8dKH0d9v3IY4MnOkVijFOqsOD57tA9QV7SK4hFpuqKx0nCBfiDWjKw=
X-Received: by 2002:ad4:5b8c:0:b0:626:199e:1b96 with SMTP id
 12-20020ad45b8c000000b00626199e1b96mr7529497qvp.64.1685397581895; Mon, 29 May
 2023 14:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 May 2023 00:59:05 +0300
Message-ID: <CAHp75VfDvoq8+WiO6Pwm40roeS7pNJq1ae04b3qp0C5rL6Hrmw@mail.gmail.com>
Subject: Re: [PATCH 00/21] media: atomisp: Use selection API info to determine
 sensor padding
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
> Hi All,
>
> Here is my next round of atomisp work.
>
> The atomisp wants some extra padding for processing in the data it receiv=
es
> from the sensor. E.g. For 1600x1200 it wants to receive 1616x1216 from
> the sensor. Currently the private sensor driver copies it uses give it
> e.g. 1616x1216 and the ISP2 code then substracts 16 before reporting
> the resolution to userspace.
>
> This patch series adds support for the v4l2 selections API and specifical=
ly
> the crop target so that atomisp can request the extra padding from standa=
rd
> v4l2 sensor drivers. This is implemented / tested with the atomisp_ov2680
> driver.
>
> Besides that there is the usual cleanups / prep work.
>
> With the padding solved, the last bit of private atomisp sensor API is
> gone now. So we can start working on getting rid of its private sensor
> driver copies.
>
> As mentioned in the updated TODO file the next step is to port
> various improvements from the atomisp_ov2680 private sensor driver
> to the generic ov2680 sensor driver (such as the selections support)
> and then switch to the generic ov2680 sensor driver.

For non-commented
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

If others will be addressed in the suggested way, feel free to add the
tag as well.

--=20
With Best Regards,
Andy Shevchenko
