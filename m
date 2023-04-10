Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA7B16DC51F
	for <lists+linux-media@lfdr.de>; Mon, 10 Apr 2023 11:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjDJJf4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Apr 2023 05:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjDJJfy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Apr 2023 05:35:54 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C597D30DC
        for <linux-media@vger.kernel.org>; Mon, 10 Apr 2023 02:35:53 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id g12so3702975qtj.12
        for <linux-media@vger.kernel.org>; Mon, 10 Apr 2023 02:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681119351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pj4u/VM2tLafsVTTHqQ6bFQ/JVOaZ1YbRnbgt9nw2r0=;
        b=Z1ouqlr5JcO/3VI3aYIxywOdWZfpPVHqNs+VEqPdQWkbfvbjLqtBXXluhRNG6tyh+C
         jaL/EkbaeBymLQwFYIEBr6koTTihAP3MpMhyn2s/L0g0o5KiaNmcq6bfIlxEl4m7BOEC
         BClZtR5bE806gNKo7mSYenJih2dn8KctHYBd09faZHbhXsCq54EdTUEardsqjTRgLZ4m
         i36SI1h94cM/cewyLHolhqvJJoKGVnFCbYBZ/33xj4XPYm/poUf5umLojdZdIufb0mnM
         89iDNWlb2PKnDUb8h0wXOCuzqZVHEyFYxV2n2iVS4x8zY4ZVpee9KkRYHIGUnhpZpeWm
         2r5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681119351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pj4u/VM2tLafsVTTHqQ6bFQ/JVOaZ1YbRnbgt9nw2r0=;
        b=an/GI7Hp8iKlzF8oqJB+AP4+vMuYPauJ6yu/dA7miVOmJr5pR2/z6LIM8AH8Oo6H1I
         8UxOMLuYp5688XeK4IhG4n9gpbJTpoJZM3cS49pT98UB1m7zppF87cGq42sdhjAH8OQ3
         /V2hQgJ1c4Nv5vCt3qXN3svY2j0tdVxQg1dYbIgFGqvARmX+72xUXP6NCAVXo+uK2n23
         NS/ECBHqJ075s7JHzE9EsTFEcyMjPEk8NttJmAIjyFyWTOBj2Lh2nc9pxSedY4UqWT74
         DhnHxi+KsZ6RCxnhAdkfIY8wdxAZuyXYfVz/RVs7d6zVfwjF0tqWtxm7bkZNSf0QlhAt
         uEUQ==
X-Gm-Message-State: AAQBX9eiiOZc2ruDl/mktWR6TxQgc5rMZA8yuZ08UhUEa31L5+iCTDFF
        wqAG4kZhsPMu69V+czKPFwmET8DmbisTz85SeLM=
X-Google-Smtp-Source: AKy350aXAPmea4HxO+UOCzhAuoxDYmCSq1YsgvoixMFMX+4pyD4lfB3dLbXlU9mSbJnNXDTfFkh38aaEUXF97eOBukM=
X-Received: by 2002:a05:622a:152:b0:3de:d15a:847f with SMTP id
 v18-20020a05622a015200b003ded15a847fmr3750305qtw.0.1681119351225; Mon, 10 Apr
 2023 02:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-29-hdegoede@redhat.com>
 <CAHp75VcOpL=aL9suDvBxiCK3cqm4vqCwVfwUp9SSFc31H+15cQ@mail.gmail.com> <7a7d442b-938d-4d99-a368-a6ce917d571b@redhat.com>
In-Reply-To: <7a7d442b-938d-4d99-a368-a6ce917d571b@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 10 Apr 2023 12:35:15 +0300
Message-ID: <CAHp75Vdoha0WT0fvt8_+AtCPRvQYQ0ucRjNHu+qgbRC_BTzedw@mail.gmail.com>
Subject: Re: [PATCH 28/28] media: atomisp: gmin_platform: Add Lenovo Ideapad
 Miix 310 gmin_vars
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 9, 2023 at 4:01=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 4/2/23 21:12, Andy Shevchenko wrote:
> > On Sat, Apr 1, 2023 at 5:00=E2=80=AFPM Hans de Goede <hdegoede@redhat.c=
om> wrote:

...

> > MRD7 and FFD8 are the reference designs. At least MRD7 is what we have
> > in the lab and we can run some tests there. That's, for example, one
> > which I used to run atomisp before it got removed from the kernel a
> > few years ago.
>
> Right, but do these need the quirks ? Or is our auto-detection code
> good enough to get the right values ?

I will try to allocate some time to check it against the latest
AtomISP code. Do you have a branch where you have been collecting the
all related patches?

--=20
With Best Regards,
Andy Shevchenko
