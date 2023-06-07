Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C65317264E0
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 17:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240310AbjFGPlk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 11:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234989AbjFGPlj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 11:41:39 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D18383
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 08:41:37 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6260b578097so58117836d6.3
        for <linux-media@vger.kernel.org>; Wed, 07 Jun 2023 08:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686152496; x=1688744496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymf239OnssI6YzWk1B1Iqk+nzu1XyTSV4+/yEBbilJM=;
        b=KNrVjaz3z3FX61kTchCQvH6vJkr2LoF2J/9X+w9H3Dmktluw1uAHNSyjQI3ic6enxG
         fFqcoQ0nv/916rEVPXKXe1EvLKMM+XEQQ1E1tpn2xM7eyXE5HXcb/ecOfQ2KU/qnm0+f
         Gyb3mxV6vCD5iixu8VrzJEqiItOrWY9+ljB4/ScmpahWtw7lnZVgc1ZgzEJa2Qvno35h
         D/vbELBdsSM8JUDFE10+Qy/ArdCXn5pVTRi556CqwaQBZkLx9h6nYZzJBgULgumpcDZR
         Fo0KY32oevceusWi+5bPYld+v2c6583R7t5JClA2kkTLNORcDzheu6DnhN9fGVuAqY0c
         6BhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686152496; x=1688744496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymf239OnssI6YzWk1B1Iqk+nzu1XyTSV4+/yEBbilJM=;
        b=fMZEje+I2wYeHyXSSgCpVooFY6rEOX7t/Ed3pbrmicPqxpu2oCcXL+AT9RmeOtW4L7
         kjlqBnls5aIbazKv8wcqUpkruZB+QVKEfmCVv724K9D+9NMGeH8NAMxWrebddNE8u9gG
         s5ZLSxc3IhpuWihi6FiuJUsM2Z26dBJd+pzos+U3AS/2S65woZbzsQsxV/zQi/s3h7G+
         vRcrUs0vMPfQKENHIfxvbq0pVG7jCdf5yh9u8b+roSOPbiASuHpRxBr01UNZfE6ENxCe
         SGRs1UWkPddYHP3ZvyAroGeEmjGqsM+5OAlaaBHEMsvUzufr3bpyzSsKVMgUViT3rUNX
         NpYw==
X-Gm-Message-State: AC+VfDxW3xy0sDdzOpPwewxJ6joM9X77By71W2K03LKemI0ZARX1GAhx
        xXv+75yRFNjs6CPaG3zJg5rsBNrijrSD4rrEeV0=
X-Google-Smtp-Source: ACHHUZ5jnDxtXxxfLuvAdPsU1dvdr7Qpf3SLv2pwmRJVq1b6H7FOUVNdMMwMcjBZlCvFWN6i4jH5LTJKClkHZ52m3sk=
X-Received: by 2002:a05:6214:f0a:b0:625:a982:857 with SMTP id
 gw10-20020a0562140f0a00b00625a9820857mr3803339qvb.50.1686152495703; Wed, 07
 Jun 2023 08:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230606165808.70751-1-hdegoede@redhat.com> <20230606165808.70751-2-hdegoede@redhat.com>
 <CAHp75Vd6TPfZhPEDUdAj0Y7G8fQDPKQhmcY_tDWmN7VHBpXL0w@mail.gmail.com>
 <0760b8ba-0091-5270-5e46-9787a910bd6f@redhat.com> <ZIBxhg1LVL8+zBCE@kekkonen.localdomain>
In-Reply-To: <ZIBxhg1LVL8+zBCE@kekkonen.localdomain>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 7 Jun 2023 18:40:59 +0300
Message-ID: <CAHp75VeZe-aeusoeYgDh=6kGfxNUDexLvvwMdLTKe-k1_vtAwA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
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

On Wed, Jun 7, 2023 at 3:01=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Wed, Jun 07, 2023 at 10:40:34AM +0200, Hans de Goede wrote:
> > On 6/6/23 22:43, Andy Shevchenko wrote:
> > > On Tue, Jun 6, 2023 at 7:58=E2=80=AFPM Hans de Goede <hdegoede@redhat=
.com> wrote:

...

> > >> +int cci_read(struct regmap *map, u32 reg, u32 *val, int *err)
> > >> +{
> > >> +       int i, len, ret;
> > >> +       u8 buf[4];

> > >> +       *val =3D 0;
> > >> +       for (i =3D 0; i < len; i++) {
> > >> +               *val <<=3D 8;
> > >> +               *val |=3D buf[i];
> > >> +       }
> > >
> > > I really prefer to see put_unaligned() here depending on the length.
> > > Note, that on some CPUs it might be one assembly instruction or even
> > > none, depending on how the result is going to be used.
> >
> > Ok, so you mean changing it to something like this:
> >
> >       switch (len)
> >       case 1:
> >               *val =3D buf[0];
> >               break;
> >       case 2:
> >               *val =3D get_unaligned_be16(buf);
> >               break;
> >       case 3:
> >               *val =3D __get_unaligned_be24(buf);

__without double underscore prefix

> >               break;
> >       case 4:
> >               *val =3D get_unaligned_be32(buf);
> >               break;
> >       }
>
> I think the loop looks nicer but I'm fine with this as well.
>
> > ?

But the loop hides what's going on there. And I believe code
generation would be worse with a loop.
Also note, that in case of switch-case we don't write to the pointed
memory several times, which I think is also the win.

> > >> +       return 0;
> > >> +}

...

> > >> +int cci_write(struct regmap *map, u32 reg, u32 val, int *err)
> > >> +{
> > >> +       int i, len, ret;
> > >> +       u8 buf[4];
> > >> +
> > >> +       if (err && *err)
> > >> +               return *err;
> > >> +
> > >> +       /* Set len to register width in bytes */
> > >> +       len =3D ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) =
+ 1;
> > >> +       reg &=3D CCI_REG_ADDR_MASK;
> > >> +
> > >> +       for (i =3D 0; i < len; i++) {
> > >> +               buf[len - i - 1] =3D val & 0xff;
> > >> +               val >>=3D 8;
> > >> +       }

Similar way here.

> > >> +
> > >> +       ret =3D regmap_bulk_write(map, reg, buf, len);
> > >> +       if (ret) {
> > >> +               dev_err(regmap_get_device(map), "Error writing reg 0=
x%4x: %d\n", reg, ret);
> > >> +               if (err)
> > >> +                       *err =3D ret;
> > >> +       }
> > >> +
> > >> +       return ret;
> > >> +}

--=20
With Best Regards,
Andy Shevchenko
