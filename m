Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499461E88ED
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 22:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgE2UcD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 16:32:03 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:39251 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727947AbgE2UcC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 16:32:02 -0400
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MAP77-1jq19e12oF-00BrSB; Fri, 29 May 2020 22:32:01 +0200
Received: by mail-qk1-f171.google.com with SMTP id c14so2461426qka.11;
        Fri, 29 May 2020 13:32:00 -0700 (PDT)
X-Gm-Message-State: AOAM5318lLLsJ1yaC2zkb/R1kJVM6sTJGoff93JZgTJ5ErhtJ1pjFNbw
        NH3m74yXZl45Fnw5PbwkZrmophSjUQYz1LAyKWE=
X-Google-Smtp-Source: ABdhPJy22yz3chCQpFZuSTeS6bry0c1AdpBaXRM1H0/FX/oT/GPx28PEHETRXkrO9QPJfadK30BEV25AFXtnDouepOo=
X-Received: by 2002:a37:554:: with SMTP id 81mr9541210qkf.394.1590784320047;
 Fri, 29 May 2020 13:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200529200031.4117841-1-arnd@arndb.de> <CAKwvOdnND7XFgr7W9PvZAikJB1nKxB4K5N-oP0YrBT74oX_C9g@mail.gmail.com>
 <CAK8P3a2UKC=s7re2P+qfxz8eqeC+yCcPGuYKkgji9N_ugdgWhg@mail.gmail.com>
In-Reply-To: <CAK8P3a2UKC=s7re2P+qfxz8eqeC+yCcPGuYKkgji9N_ugdgWhg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 29 May 2020 22:31:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3u9fs9pSOXSkrmO=xNWUZ5fxZnL_O=f=0BDZ8DkHNYWQ@mail.gmail.com>
Message-ID: <CAK8P3a3u9fs9pSOXSkrmO=xNWUZ5fxZnL_O=f=0BDZ8DkHNYWQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] staging: media: atomisp: fix incorrect NULL pointer check
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:VHREXwc0XWusFwT1ic++5+K5VSWyqLNGGBt7xBzjbXtTV2wXIe8
 ulBcDS2OA46REJItTfkNbVIJeojJfq5wfcLz1dFk0e6y5Qp+Y+WAX+r1MXjBViHnR4Dry15
 sRngMxOPntWQwLdRGRYpk2euT07PWWhrYIb4lrYp9HcuQgDdJV8Kcw8+dLWW5YiOqoXdL40
 x9hvJTc0a3YXjOnHb7lOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2YINzZMFQ9s=:Dk5f0+qbLfL0w7NkeLT96B
 IdKkgFL0FvYj9O8omvbiQnNXP7rQEV9sqsk9VnL5e9dN2oSbTccXzWLnYPSnPGFyq7/vV9czb
 vLVISdmF2ksMO41jNvg/PzXSZh9MNBfkIRrDNcWMsLAN67g5un9220HwKz9rhtduGeVFboBYo
 p6/yHRm2KFXopuFUplkn+EBUxT5DGH5JJEAymVf021VDFgn1RWhUkbqgolfnxVHY0eLUAFkez
 P72sJ3Gb1bxVJbgwR2iXuLr2s3SuaId07x3KgRNQ6B2KUy+DbKxOFcxbLCIrFU7tKNOi1c+K4
 v3pgk3etkJpAdH8CGfvL+XKwN7eLeBmBrlh70n6iF5mDAT5n+f8xT97AEfGYKzq9hjF5YUUFi
 NOjfItTF9kN9Bx7udKWQ7z9jWXzxzNUzZWb9SeVPKJv3jMMcYZKIcM5FCkZLugz+4XJtamn+n
 D25JwTJHHJMUELxbCgAgFMUDURiWMSEcMWMhsuG4AxG6m0Jt0vuTG8dyK93MvsplJ6M7eKJcF
 Oy0z6TMHCBsFmbrxPHZWFLXot8f102LypbTP9cIq/mQ6vYHZSGNrwiKAenCTpqReYBk0MHsnV
 nlQv0jrIkZkzf8RwlbG1oUI6nl+ZWgLpluIrqJRdY06KxBu95mpkBOFveAqTc3OIvBh2vvvTF
 e/VKpB2TlMhMZfmLZ1bwiM7KWguXbSIe9HuY8wKZl0eu2TfyidOG6PQdCFfpOLLuD1usnNzQs
 8unlgm9y7sxujUe3kRfA1l/VtHR/L5BlA9tZIH+oEggfeQoCoYl2EVPtxh6SUwjN6Z6van/T0
 EsRFOpHIUFtDFda2OJGqMOJbG2OcUkmZpbBvYIcVtvBtyEdf3I=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 29, 2020 at 10:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, May 29, 2020 at 10:04 PM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > See also Nathan's 7 patch series.
> > https://lore.kernel.org/lkml/20200527071150.3381228-1-natechancellor@gmail.com/
> >
> > Might be some overlap between series?
> >
>
> Probably. I really should have checked when I saw the number of warnings.
>
> At least this gives Mauro a chance to double-check the changes and see if
> Nathan and I came to different conclusions on any of them.

I checked now and found that the overlap is smaller than I expected.
In each case, Nathans' solution seems more complete than mine,
so this patch ("staging: media: atomisp: fix incorrect NULL pointer check")
and also "staging: media: atomisp: fix a type conversion warning" can be
dropped, but I think the others are still needed.

        Arnd
