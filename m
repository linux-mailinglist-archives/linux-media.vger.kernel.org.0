Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF6A730A8B
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 00:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236002AbjFNWW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 18:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235966AbjFNWWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 18:22:25 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801462119
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 15:22:24 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-62fe4ddd49bso8869986d6.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 15:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686781343; x=1689373343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mzPII1dMP3WJj07WHNDP3IHHHTyBC8+eRJ1aPJ5pFs=;
        b=KDF0ffxB5cxH3CbdXQ4P5axeEZHpdmuVadJtoa1K3Sv5nuYjFc1DZ7yAWy1WFWDl01
         zPdEpe/ibiIQg6p87fVhKA2qUIeSQdifB4KhOTmNf5kUuGDa1/PZdJ/XG6bll1CEiUgw
         FYYVR1ek4TTpHkZs4Xmjw3g8jEzTHdQeYDeRufPMDfuralkSU0rvYhmWqj/oPVmXFCMk
         7IzyJiRomCdZNhWUiX+bEBdG4C2TZygAydCGJ7jADlyyYZZDQk5BRjAYK8Qq4/bAW4UO
         w39JCTgCdf/K8ERQOE/NnG509s3S93DaI+oKcL87I3XxcBsbl8kz4GF/Q+ggjRnX1T46
         q+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686781343; x=1689373343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mzPII1dMP3WJj07WHNDP3IHHHTyBC8+eRJ1aPJ5pFs=;
        b=WFwp27bHbbzEif5H3lE9AklKGY1PIFTKdyBlxkAwyKqbwoDJJkPhaH2MspKiaq5M5S
         zfb3HL0HyaESBF9kMWdXt76S8ajhmnzGprk3qhRzbQY8eYuwh54pCYMKGYq+CFwi+RNn
         s6zqnwg02GAfJaOvxDP9ooxI/AP7aA3qu6E7a42569e+2jg0zJ+B442xBpDOO/lUEcpL
         QRjXJaH7bOIUlAsnbhL7ZzXl8c5cBCSNUJkYWwECTZf1VWb3O76rw9pDHIugXUZStrO5
         mVU2J2x6LNr1edtrwn6/NLeX/X4M+S7CRnbDNEQMKE7gLc4vavkGCzkFhV8nObmGS/p4
         NJrQ==
X-Gm-Message-State: AC+VfDwXjPgpJLpFV5ntKfCGo2GWnlXwGUPbn2DZmFFdVjIzFx/KGl8o
        doslot3fE6cqBD04RsqI7LS3CU7QpOHBGXA5Zn51xKbeW5f7ZQ==
X-Google-Smtp-Source: ACHHUZ4P+OZlnExfQPmYM+KoY7sEH/HQSpaxr6bRWCbLHegDC8lUYaEahzqXPBSQY+ApfEexjYTlba2P8JdMWzhUfNw=
X-Received: by 2002:a05:6214:4018:b0:629:78ae:80f8 with SMTP id
 kd24-20020a056214401800b0062978ae80f8mr17812820qvb.10.1686781343556; Wed, 14
 Jun 2023 15:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230614192343.57280-1-hdegoede@redhat.com> <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
In-Reply-To: <ZIolnOxs29H8EUmC@kekkonen.localdomain>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 15 Jun 2023 01:21:47 +0300
Message-ID: <CAHp75Vd3OiCm2d2FWX8CFxdA9OVpBfdczDFzuDiJ_mtSH4hU2Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper functions
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
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

On Wed, Jun 14, 2023 at 11:49=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Wed, Jun 14, 2023 at 09:23:39PM +0200, Hans de Goede wrote:

...

> > +config V4L2_CCI
> > +     tristate
> > +     depends on I2C
>
> This won't do anything if the dependent driver will select V4L2_CCI, will
> it?

Actually it will. It may warn the user about missing dependency on the
`make *config` stage.
See, for example, this:
https://lore.kernel.org/lkml/1f6c4559-ee48-ca67-8ff1-f7f9d330bc12@suse.de/.

> I'd let the sensor driver depend on I2C instead. CCI is also supported
> on I3C, for instance.

> > +     select REGMAP_I2C
>
> This is a good question.
>
> How about adding V4L2_CCI_I2C that would select REGMAP_I2C?

--=20
With Best Regards,
Andy Shevchenko
