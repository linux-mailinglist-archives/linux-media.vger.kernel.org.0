Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB1A2721986
	for <lists+linux-media@lfdr.de>; Sun,  4 Jun 2023 21:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232455AbjFDT3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jun 2023 15:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232454AbjFDT3R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Jun 2023 15:29:17 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38EF6DA
        for <linux-media@vger.kernel.org>; Sun,  4 Jun 2023 12:29:16 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-75b08639930so276532785a.0
        for <linux-media@vger.kernel.org>; Sun, 04 Jun 2023 12:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685906955; x=1688498955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7j2qzxpCyKGF9TJxJhHZwl8QnukfZ4v8XEKD6HallHU=;
        b=iqqRMlVpH+z5ZaziekhEvqOtlG+6nQcS/m4zXM44zL5ur043D5w1F2g3A3LEh03Jef
         CZJQOoB9Zw3Y5RuPCmFJvzzSK5dc/CIPC8xfFsC6JYcz2bOxM2qmXq+BCqeHTrEurePq
         QGPYjFTA2mU8jIkIhGPVWa5URkQ5p7STPAecgqaG7GuYqyKdDOdRCyoqpQIC0aCnzBPs
         Au5kgJ6VpP9FzB3vC4p3Sf5bR7slrhLNyienKiQmWPm3PYVKnv0AUDFtqWIeOc4qny4Q
         8m43C5j59GZI++2eRDXDNRisrFn/2oPonxT3eJX5NnX7kVHNyjg1HwfBJB8509MWUSlZ
         1Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685906955; x=1688498955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7j2qzxpCyKGF9TJxJhHZwl8QnukfZ4v8XEKD6HallHU=;
        b=JeZgh/pHFAdpAm6uF7Rv4SY/XY+ftFQNMzK+xg2HxTUL3Mn+88LRlrjF0Q8/k4gd1t
         AfIBr5Jy8EdZr1siCglPLrVd82xyzZvP8JvmXgcx4ZLNhFRLriG5RCzfyFPROZOdN7nD
         g8N3vY4MTNdF0RXBlVVpz6Kdzorlc5bAeRPQ1EWNJmrERJqw/pObRD6/l/QNJU/CRBTt
         OWZgNr7WbOzC65hMaD8qdGrB8fuhpxbQuRsuZbXVPHcZo424fJ27HjKljWTD0XAVJIHo
         p1ro+2ug8NpzVcZwAHYqr4YJfafrK7NN0+bLXMcVWJgxOfBy+HWcw1drzv7zDBhh7Bx9
         f6Cg==
X-Gm-Message-State: AC+VfDxzSpu0mZg7CEOJ/zQFUhv9DodKWeFGfqjYt/GSDJ7gjHBS/MdJ
        5YeTJ3mKqbJhVdGpfnjA2hPpJfJQvi5ZkNb7QIs=
X-Google-Smtp-Source: ACHHUZ7q8X990ykoARgVeY3wTE9ZgEeoCvT/x5VnXjBSJlt3TnQFQ5brHQI5vByzLZjrkVyIKNC2XLygAK0YbmgTRKs=
X-Received: by 2002:a05:620a:801b:b0:75b:23a1:d853 with SMTP id
 ee27-20020a05620a801b00b0075b23a1d853mr12500478qkb.21.1685906955269; Sun, 04
 Jun 2023 12:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230604161406.69369-1-hdegoede@redhat.com>
In-Reply-To: <20230604161406.69369-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 4 Jun 2023 22:28:39 +0300
Message-ID: <CAHp75Vd7t3Li7d9B2JEXzqsvc0uKvcuro5dV8Tj6x2Wai46LFw@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: atomisp: ov2680 work + add testing instructions
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

On Sun, Jun 4, 2023 at 7:14=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi All,
>
> Here is some more ov2680 sensor driver work. This work is the result
> of trying to get the main drivers/media/i2c/ov2680.c driver in a shape
> where it is good enough to replace the atomisp specific version.
>
> The plan is to port recent improvements to atomisp-ov2680.c over
> to the main driver. While working on this I noticed some issues which
> need fixing before copying them over to the "main" driver.
>
> Besides that this also adds a small patch to make testing with
> gstreamer easier and this adds testing instruction to the TODO file.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
(a nit-pick in one patch commented separately)

Thank you!

> Regards,
>
> Hans
>
>
> Hans de Goede (5):
>   media: atomisp: Stop resetting selected input to 0 between /dev/video#
>     opens
>   media: atomisp: ov2680: Stop using half pixelclock for binned modes
>   media: atomisp: ov2680: Remove unnecessary registers from
>     ov2680_global_setting[]
>   media: atomisp: ov2680: Rename unknown/0x370a to sensor_ctrl_0a
>   media: atomisp: Add testing instructions to TODO file
>
>  drivers/staging/media/atomisp/TODO            |  33 +++++
>  .../media/atomisp/i2c/atomisp-ov2680.c        |  15 +--
>  drivers/staging/media/atomisp/i2c/ov2680.h    | 118 +++++++++---------
>  .../staging/media/atomisp/pci/atomisp_fops.c  |   3 -
>  4 files changed, 95 insertions(+), 74 deletions(-)
>
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
