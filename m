Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AED3727CB9
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 12:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236082AbjFHKZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 06:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236070AbjFHKZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 06:25:06 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC3E1FFA
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 03:25:03 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-62b69b95a33so3112396d6.0
        for <linux-media@vger.kernel.org>; Thu, 08 Jun 2023 03:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686219902; x=1688811902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEYcdTf+Ljd64x+cXjJFGsQKhoL3JlmGnWriAvabNKI=;
        b=fCrU1zY66VzE8TnQRXQr5KWc2NCv8S5ja2kHdD+DcItOeqvt5yT8zcUYWJNebKqni/
         6x2VGA+etL9midZOzPrCidykQOTPP6YkgWm+4RaHwV1NUrQIrpVtUVCdDTQ2mfKi20Dm
         CAvo1mWWipwTyZFqA2HA1EUpe36uDjOsttBQVrtdc4niyCZk7DhzO2vwIXwuLHJvy4hO
         i65lrkmNGCOw7jyWXrnqjBdWfarMDU4ACvVp8tmF+1JcQ+28ANCkg8kvX+2LU2dcGOtU
         q8hVIWdo8aBWW+qivkRgS4oqbRL9HLI/NwTjm1qqg74sfwwKErIG9YRJhIpCphOyvoWB
         WWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686219902; x=1688811902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEYcdTf+Ljd64x+cXjJFGsQKhoL3JlmGnWriAvabNKI=;
        b=FjXOy1l4oh69WJyyxLw8uaOiOmCLYXJJqipTkQ7QoYZO7JTkscR7HHieFOC/q7dVT/
         8QZRVQomdt0v54GkDxAfxkwBkb3DZU21biPfmBqj9JnFqggOyXFZXAvuH1tpEALxesIS
         fj8idtYHQQHmDpj7Y8mnT43Ig1AdvM6saOWtBVS/f9Zd/yjJUGULdY6JJHCqwE4Yk36v
         OrNdiQ/SAxiCwPY4G9JV0a/y+mb3bZ1N2X6E4/Q+zFWiAKbYhwHN5YvpUR5NfvdbFvyG
         6x7X16BGLkzRP+1FvWLEObyMHr7V81OC7HyOSxg0dD+WUST97MB5SocYbzDbXZBbaB5k
         ATMw==
X-Gm-Message-State: AC+VfDyQexCfYiZFw/HCbx6svBTNmw1OUYDxomtxgmZ5BwYcXhQgdWE+
        FDXVY7FyGAi4WiiKySP22+SoKdc1+akZILVqqAGvnswsmLopug==
X-Google-Smtp-Source: ACHHUZ6BKji0uPujqnrhYx+kPTcb/g3mID/Yeen0LM5w51PZ/AaSb5WnuNzL4OwfWj03mcRmBoKa4qKIAgPMcxYtnFc=
X-Received: by 2002:a05:6214:2582:b0:625:aa48:fb71 with SMTP id
 fq2-20020a056214258200b00625aa48fb71mr1152318qvb.59.1686219902432; Thu, 08
 Jun 2023 03:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230606165808.70751-1-hdegoede@redhat.com> <20230606165808.70751-2-hdegoede@redhat.com>
 <20230607181855.GM5058@pendragon.ideasonboard.com> <b558aac9-0a34-ecca-57b0-d132af8cdefb@redhat.com>
 <ZIDjgFtZ7qp6YYz1@smile.fi.intel.com> <ZIGSbOyLxGBEAWVH@kekkonen.localdomain>
In-Reply-To: <ZIGSbOyLxGBEAWVH@kekkonen.localdomain>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 8 Jun 2023 13:24:26 +0300
Message-ID: <CAHp75Vdm2VjoQ3iUZLMwTmzCoSdV4MZn8rkdHmbysatkLwn5kQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Thu, Jun 8, 2023 at 11:33=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Wed, Jun 07, 2023 at 11:07:28PM +0300, Andy Shevchenko wrote:
> > On Wed, Jun 07, 2023 at 09:01:40PM +0200, Hans de Goede wrote:
> > > On 6/7/23 20:18, Laurent Pinchart wrote:
> > > > On Tue, Jun 06, 2023 at 06:58:06PM +0200, Hans de Goede wrote:

...

> > >             if (regs[i].delay_us)
> > >                     fsleep(regs[i].delay_us);
> > >
> > > is copied from the implementation of regmap_multi_reg_write()
> >
> > Reading this I'm wondering if we can actually implement a regmap-cci in=
side
> > drivers/base/regmap and use it. It might be that this is impossible, bu=
t can
> > save us from repeating existing code I think.
>
> I very much prefer this set over trying to bury equivalent functionality
> in regmap. CCI is quite unlike what regmap is intended for, due to
> its variable width registers and that CCI isn't a bus itself (but on top =
of
> the bus specification itself).

Oh, okay, no objections!

--=20
With Best Regards,
Andy Shevchenko
