Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C496747FFC
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 10:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbjGEIn4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 04:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbjGEInv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 04:43:51 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65971721
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 01:43:50 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9922d6f003cso784954666b.0
        for <linux-media@vger.kernel.org>; Wed, 05 Jul 2023 01:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688546629; x=1691138629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3DNzHWORK/hpka9u72cYLeovh/HtyI0Uny8cnoXVr4=;
        b=F9gk1nn/HL2ztsxYfz56MR8rYdvGD7RljGa/DcZ/wY9laKoORdp/qiOewqdRX893/z
         8/N+o7aZCo1bVuJ0tMbHDFG8KWZHQz/49+SF84BTFvzNvJSdjb0A80bjRmjwunGPRqNx
         IvWIe34Gtl5lz+hNPUwvNxZGDVFFH1osMCPYg0AGl1Fca6A8tuFQfhzKGnFx9QOZ4P7g
         S2IVcQeFPqojFvoq01gXtExG0YSxJMC3jwdArRDZiF6uqlFPpkZoer1xpS3UILQjv9ic
         sPOV+KA4Og1Y0+633a+C3AqWNA373ORI0ocMIiNgacHvCJB8LPQlqwc/d58ao6eY4Y0f
         XWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688546629; x=1691138629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3DNzHWORK/hpka9u72cYLeovh/HtyI0Uny8cnoXVr4=;
        b=esGaDns5ytcVZw14ZejiQpnc/b0zilM437sUbdUxr2Rr/ZrmY2sm9IVfgsvSNgrr64
         aYwnKMt12aPACBD2zyC7HryEmPcOV9SAbQQfPzO9h4CYIvDwP4KAs/f/BR7/KBeoLCwh
         1Eq5LcOjPChGMjIjUH1fMwWRLVSZAE7sxi7wdeZtOlt6eIZ+BRVrdJqd2UYMmiDEwerS
         eIu3gZj75b/yGMfRwJI+LUpMOpIJCzOwHfsOkW0PMbxnr/MofU7y84Bv4q81MaKAonkL
         WsNQt54Mq/m1OYdJandQKrIcdwOl4JD6i7gzVdLb545EwO1pcy7u3Tt6ijUAwZ+g8FD4
         q68w==
X-Gm-Message-State: ABy/qLa1dWOIQyzF2GYT8OJ+hqP2HnCqYlQXDg162tSH7ShRGMDV9oaW
        e+W7XMvS6sz6E3zTi0wSkQGaM170BaZrYmYKYD5vxwlIo0w=
X-Google-Smtp-Source: APBJJlF4Pxulj9ILNJWtaqJKxTed1myHQQY5asSvaWhT1TAjVw+fBSRfXR4WcSxbCozc2A6rpva4M64ZqVKeZPnq2+0=
X-Received: by 2002:a17:906:eb15:b0:991:e3c4:c135 with SMTP id
 mb21-20020a170906eb1500b00991e3c4c135mr11461030ejb.9.1688546629072; Wed, 05
 Jul 2023 01:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230630110643.209761-1-hdegoede@redhat.com> <20230630110643.209761-15-hdegoede@redhat.com>
 <24dc6ebe-0dd7-4f71-50af-c51ccb3714d5@ideasonboard.com> <ZKQ6aVxZupe61i9T@smile.fi.intel.com>
 <e5cda25d-ca1f-63b2-4c4b-db6cb7ccb8e7@redhat.com>
In-Reply-To: <e5cda25d-ca1f-63b2-4c4b-db6cb7ccb8e7@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 5 Jul 2023 11:43:12 +0300
Message-ID: <CAHp75VeH-J3OnAnPcYHApgun8NNBorY9J9cPZfy24h_ZLfcc5g@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] media: ipu-bridge: Add a runtime-pm device-link
 between VCM and sensor
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Dan Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
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

On Tue, Jul 4, 2023 at 6:52=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 7/4/23 17:27, Andy Shevchenko wrote:
> > On Tue, Jul 04, 2023 at 04:07:43PM +0100, Dan Scally wrote:
> >> On 30/06/2023 13:06, Hans de Goede wrote:

...

> >>> +   strscpy(work->board_info.type, fwnode_get_name(vcm_fwnode),
> >>> +           I2C_NAME_SIZE);
> >>> +   /* Strip "-<link>" postfix */
> >>> +   sep =3D strchrnul(work->board_info.type, '-');
> >>> +   *sep =3D 0;
> >>
> >> I think strreplace(work->board_info.type, '-', '\0') here would be cle=
aner,
> >> and either way probably we need #include <linux/string.h> for the str*=
 funcs
> >> here
> >
> > What we need is something like strcut(str, '<$CHAR>').
> >
> > But related to the above code we can (besides using sizeof() instead
> > of I2C_NAME_SIZE):
> >
> >       snprintf(work->board_info.type, sizeof(work->board_info.type),
> >                "%pfwP", vcm_fwnode);
>
> "%pfwP" ? what on earth does that do ?

Prints fwnode name (as you opencoded with strscpy() + fwnode_get_name() abo=
ve).

--=20
With Best Regards,
Andy Shevchenko
