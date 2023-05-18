Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA70070858D
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 18:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjERQFo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 12:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjERQFm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 12:05:42 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33FDFE
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:05:41 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-757742c2e5fso200927285a.1
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684425941; x=1687017941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWeiCV7wEfeTGLp/uSM3bWYXAWyw81q0ElJZaLg9nlU=;
        b=TQWwyct4L00bt/1hfj0UF22glz3ampuijxEQVTS0qadAZdfYURMiQmjpxiWLf1BPK+
         wI4UnVtrw1uvizncZQws+HO74nvhPuJJPkEYOjMESfZlFb0SWTjbzgk5R2Ls0iHpJLx7
         XjOgTcFiuRScdCT67U6K++kQphBSs1dA1gt/F640y/yXCEmtqSePyoiD2m+LrHnbc8E7
         VsPAkJjDfcTvl86165w905w3ZQV/+2jtl80LYnh6NEmOKfBgFn3vOj7A2ZDlw4aMkq1q
         XpLXLEOs4Cv5So1eE026y3mP4vqYEnRJwgZ/dFd7BpBUeJhCzgOORxxDtlhOvIsdOwRL
         8/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684425941; x=1687017941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWeiCV7wEfeTGLp/uSM3bWYXAWyw81q0ElJZaLg9nlU=;
        b=LB+y13bVXDIPnCObKzmNarF/gc+m3Vyehc+Q8K23l3xp2fOx2w+Zz1hPVUhzLAlj10
         k9hmnhUMrjGD4jaGX6MEm1AR5w/X6Q4ZTVLD0XhJq/6/CYcIgMewf7utAjQt2AWNWMLv
         Rd0LICg4blkWhBskm2LgL8hiwLAMGeBeDzWjF+LfSS7i8nAIWYtgCZCKNhfJkDLwOa09
         ql9mgr8/dJe5SiH01Gbqs/JmyeKlM/s+GSoTyb+5ixrK/MHd2kpwxa8GNoXLktJL7Q/Z
         /5p57MEs8RXl8K9X1yiKfWY/qP0EkAjOzY+1Qmw3pr82bQHSZFM5bjjABflDF7sLR3J5
         au1g==
X-Gm-Message-State: AC+VfDxckeoEhO0YzyN+e0EwQTQCFwhWPHkgAxsop2+ni5AkhcEmy3o9
        PUPEgfHLZjsJa9zfXD2uwrroODX8McgGjm6AW84=
X-Google-Smtp-Source: ACHHUZ5ioLLCflyMJolHtBFs6X2aRgHcKqvZHALmoKz1hSDGjNnnr71tvJFNfzfCAP7S05091bf6ntHjWUtaqQXglHw=
X-Received: by 2002:ad4:5c6f:0:b0:61b:7e5a:ec00 with SMTP id
 i15-20020ad45c6f000000b0061b7e5aec00mr123705qvh.37.1684425940645; Thu, 18 May
 2023 09:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230518153733.195306-1-hdegoede@redhat.com> <20230518153733.195306-2-hdegoede@redhat.com>
In-Reply-To: <20230518153733.195306-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 May 2023 19:05:04 +0300
Message-ID: <CAHp75VetrLhwSX0=X3shuL8v8B6d2B_N4eOdN26ZRp4e0Mu9-Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] media: atomisp: Drop MRFLD_PORT_NUM define
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

On Thu, May 18, 2023 at 6:37=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The info in the MRFLD_PORT_NUM define is duplicate with
> the ATOMISP_CAMERA_NR_PORTS define. Drop MRFLD_PORT_NUM.

JFYI: Since the long term plan of mine is to eventually do something
useful on Intel MID platforms, I would like to keep the Merrifield
(Tangier) / Moorefield (Annidale) support in this driver. That said,
this patch doesn't do any harm to that, so I'm happy.

...

> -       u8 sensor_lanes[MRFLD_PORT_NUM] =3D { 0 };
> +       u8 sensor_lanes[ATOMISP_CAMERA_NR_PORTS] =3D { 0 };

You may drop 0 as well.

--=20
With Best Regards,
Andy Shevchenko
